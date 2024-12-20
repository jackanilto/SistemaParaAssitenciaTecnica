unit UClasse.Relatorio.Vendas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioVendas = class(TInterfacedObject, iRelatorioVendas)
  private

    FQuery: iConexaoQuery;
    FQueryItens:iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iRelatorioVendas;
    function getCampo(value: string): iRelatorioVendas;
    function getValor(value: string): iRelatorioVendas;
    function getDataInicial(value: TDate): iRelatorioVendas;
    function getDataFinal(value: TDate): iRelatorioVendas;
    function open(value: string): iRelatorioVendas;
    function pesquisar: iRelatorioVendas;
    function ExecSql: iRelatorioVendas;
    function sqlPesquisa: iRelatorioVendas;
    function sqlPesquisaData: iRelatorioVendas;
    function sqlPesquisaEstatica: iRelatorioVendas;

    function abrir: iRelatorioVendas;
    function atualizar: iRelatorioVendas;
    function cancelar: iRelatorioVendas;
    function fecharQuery: iRelatorioVendas;
    function listarGrid(value: TDataSource): iRelatorioVendas;
    function ordenarGrid(column: TColumn): iRelatorioVendas;

    function selecionarItensVenda(value:integer):iRelatorioVendas;
    function listarItens(value:TDataSource):iRelatorioVendas;
    function exportarItens:iRelatorioVendas;

    function exportar: iRelatorioVendas;
    function validarData(componet: tmaskEdit): iRelatorioVendas;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioVendas;
  end;

implementation

{ TRelatorioVendas }

function TRelatorioVendas.abrir: iRelatorioVendas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioVendas.atualizar: iRelatorioVendas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioVendas.cancelar: iRelatorioVendas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioVendas.create;
begin
  FTabela := 'VENDA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryItens := TConexaoQuery.new.Query('ITENS_VENDA');

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio de vendas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioVendas.destroy;
begin

  inherited;
end;

function TRelatorioVendas.ExecSql: iRelatorioVendas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioVendas.exportar: iRelatorioVendas;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio das Vendas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Venda';
  pasta.cells[1, 2] := 'C�d. Cliente';
  pasta.cells[1, 3] := 'Nome do cliente';
  pasta.cells[1, 4] := 'Funcion�rio';
  pasta.cells[1, 5] := 'Nome do funcion�rio';
  pasta.cells[1, 6] := 'Data de venda';
  pasta.cells[1, 7] := 'Hor�rio da venda';
  pasta.cells[1, 8] := 'Subtotal';
  pasta.cells[1, 9] := 'Desconto';
  pasta.cells[1, 10] := 'Acr�scimo';
  pasta.cells[1, 11] := 'Total';
  pasta.cells[1, 12] := 'QTDE. Parcelas';
  pasta.cells[1, 13] := 'Status';
  pasta.cells[1, 14] := 'Observa��o';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('NOME_CLIENTE').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('DATA_VENDA').AsDateTime;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('HORA_VENDA').AsDateTime;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('SUBTOTAL').AsCurrency;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('ACRESCIMO').AsCurrency;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('TOTAL').AsCurrency;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('QUANTIDADE_PARCELAS').AsInteger;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('STATUS').AsString;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('OBSERACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioVendas.exportarItens: iRelatorioVendas;
var
  pasta: variant;
  linha: integer;
begin
  FQueryItens.TQuery.Filtered := false;
  FQueryItens.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Itens da venda';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Venda';
  pasta.cells[1, 2] := 'C�d. Cliente';
  pasta.cells[1, 3] := 'C�d. Produto';
  pasta.cells[1, 4] := 'Produto';
  pasta.cells[1, 5] := 'Valor unit�rio';
  pasta.cells[1, 6] := 'Quantidade';
  pasta.cells[1, 7] := 'Total';



  try
    while not FQueryItens.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQueryItens.TQuery.FieldByName('ID_VENDA').AsInteger;
      pasta.cells[linha, 2] := FQueryItens.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 3] := FQueryItens.TQuery.FieldByName('ID_PRODUTO').AsInteger;
      pasta.cells[linha, 4] := FQueryItens.TQuery.FieldByName('PRODUTO').AsString;
      pasta.cells[linha, 5] := FQueryItens.TQuery.FieldByName('VALOR_UNITARIO').AsCurrency;
      pasta.cells[linha, 6] := FQueryItens.TQuery.FieldByName('QUANTIDADE').AsInteger;
      pasta.cells[linha, 7] := FQueryItens.TQuery.FieldByName('TOTAL').AsCurrency;

      linha := linha + 1;

      FQueryItens.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioVendas.fecharQuery: iRelatorioVendas;
begin
  FQuery.TQuery.close;
end;

function TRelatorioVendas.getCampo(value: string): iRelatorioVendas;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioVendas.getDataFinal(value: TDate): iRelatorioVendas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioVendas.getDataInicial(value: TDate): iRelatorioVendas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioVendas.getValor(value: string): iRelatorioVendas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioVendas.listarGrid(value: TDataSource): iRelatorioVendas;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Nome do cliente';
    FieldByName('FUNCIONARIO').Visible := false;
    FieldByName('NOME_FUNCIONARIO').Visible := false;
    FieldByName('DATA_VENDA').DisplayLabel := 'Data da venda';
    FieldByName('HORA_VENDA').DisplayLabel := 'Hora da venda';
    FieldByName('SUBTOTAL').DisplayLabel := 'Subtotal';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('ACRESCIMO').DisplayLabel := 'Acr�scimo';
    FieldByName('TOTAL').DisplayLabel := 'Total';
    FieldByName('QUANTIDADE_PARCELAS').DisplayLabel := 'QTDE. Parcelas';
    FieldByName('VENCIMENTO').Visible := false;
    FieldByName('FORMA_PAGAMENTO').Visible := false;
    FieldByName('STATUS').DisplayLabel := 'Status';
    FieldByName('OBSERACAO').DisplayLabel := 'Observa��o';

    FieldByName('NOME_CLIENTE').DisplayWidth := 40;
    FieldByName('OBSERACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

function TRelatorioVendas.listarItens(value: TDataSource): iRelatorioVendas;
begin
  result := self;

  with FQueryItens.TQuery do
  begin

    FieldByName('ID').Visible := false;
    FieldByName('ID_VENDA').Visible := false;
    FieldByName('ID_CLIENTE').Visible := false;
    FieldByName('ID_PRODUTO').DisplayLabel := 'C�d. Produto';
    FieldByName('PRODUTO').DisplayLabel := 'Produto';
    FieldByName('VALOR_UNITARIO').DisplayLabel := 'Valor unit�rio';
    FieldByName('QUANTIDADE').DisplayLabel := 'QTDE';
    FieldByName('TOTAL').DisplayLabel := 'Total';

    FieldByName('PRODUTO').DisplayWidth := 40;

  end;

  value.DataSet := FQueryItens.TQuery;

end;

class function TRelatorioVendas.new: iRelatorioVendas;
begin
  result := self.create;
end;

function TRelatorioVendas.selecionarItensVenda(value:integer): iRelatorioVendas;
begin

  result := self;

  FQueryItens.TQuery.Active := false;
  FQueryItens.TQuery.SQL.Clear;
  FQueryItens.TQuery.SQL.Add('select * from itens_venda where ID_VENDA =:v');
  FQueryItens.TQuery.ParamByName('v').AsInteger := value;
  FQueryItens.TQuery.Active := true;

end;

function TRelatorioVendas.nomeTabela(value: string): iRelatorioVendas;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioVendas.open(value: string): iRelatorioVendas;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioVendas.ordenarGrid(column: TColumn): iRelatorioVendas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioVendas.pesquisar: iRelatorioVendas;
begin
  result := self;
end;

function TRelatorioVendas.sqlPesquisa: iRelatorioVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioVendas.sqlPesquisaData: iRelatorioVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioVendas.sqlPesquisaEstatica: iRelatorioVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioVendas.validarData(componet: tmaskEdit):iRelatorioVendas;
var
  d: TDate;
begin

  Result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
