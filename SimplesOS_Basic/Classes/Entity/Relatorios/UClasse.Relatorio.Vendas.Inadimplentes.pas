unit UClasse.Relatorio.Vendas.Inadimplentes;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioVendasInadimplentes = class(TInterfacedObject, iRelatorioVendaInadimplentes)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iRelatorioVendaInadimplentes;
    function getCampo(value: string): iRelatorioVendaInadimplentes;
    function getValor(value: string): iRelatorioVendaInadimplentes;
    function getDataInicial(value: TDate): iRelatorioVendaInadimplentes;
    function getDataFinal(value: TDate): iRelatorioVendaInadimplentes;
    function open(value: string): iRelatorioVendaInadimplentes;
    function pesquisar: iRelatorioVendaInadimplentes;
    function ExecSql: iRelatorioVendaInadimplentes;
    function sqlPesquisa: iRelatorioVendaInadimplentes;
    function sqlPesquisaData: iRelatorioVendaInadimplentes;
    function sqlPesquisaEstatica: iRelatorioVendaInadimplentes;

    function abrir: iRelatorioVendaInadimplentes;
    function atualizar: iRelatorioVendaInadimplentes;
    function cancelar: iRelatorioVendaInadimplentes;
    function fecharQuery: iRelatorioVendaInadimplentes;
    function listarGrid(value: TDataSource): iRelatorioVendaInadimplentes;
    function ordenarGrid(column: TColumn): iRelatorioVendaInadimplentes;

    function selecionarVendas:iRelatorioVendaInadimplentes;
    function selecionarVendaData:iRelatorioVendaInadimplentes;

    function exportar: iRelatorioVendaInadimplentes;
    function validarData(componet: tmaskEdit): iRelatorioVendaInadimplentes;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioVendaInadimplentes;
  end;

implementation

{ TRelatorioVendasInadimplentes }

function TRelatorioVendasInadimplentes.abrir: iRelatorioVendaInadimplentes;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioVendasInadimplentes.atualizar: iRelatorioVendaInadimplentes;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioVendasInadimplentes.cancelar: iRelatorioVendaInadimplentes;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioVendasInadimplentes.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_VENDA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio vendas inadimplentes').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioVendasInadimplentes.destroy;
begin

  inherited;
end;

function TRelatorioVendasInadimplentes.ExecSql: iRelatorioVendaInadimplentes;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioVendasInadimplentes.exportar: iRelatorioVendaInadimplentes;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Vendas - Clientes com parcelas inadimplentes';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Parcela';
  pasta.cells[1, 2] := 'Venda';
  pasta.cells[1, 3] := 'C�d. Cliente';
  pasta.cells[1, 4] := 'Nome do cliente';
  pasta.cells[1, 5] := 'Valor da venda';
  pasta.cells[1, 6] := 'Quantidade de parcelas';
  pasta.cells[1, 7] := 'Parcela';
  pasta.cells[1, 8] := 'Valor da parcela';
  pasta.cells[1, 9] := 'Vencimento';
  pasta.cells[1, 10] := 'Pago';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_VENDA').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('CLIENTE').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('VALOR_VENDA').AsCurrency;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('QUANTIDADE_PARCELAS').AsInteger;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('PARCELA').AsInteger;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('VALOR_DA_PARCELA').AsCurrency;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('PAGO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioVendasInadimplentes.fecharQuery: iRelatorioVendaInadimplentes;
begin
  FQuery.TQuery.close;
end;

function TRelatorioVendasInadimplentes.getCampo(value: string): iRelatorioVendaInadimplentes;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioVendasInadimplentes.getDataFinal(value: TDate): iRelatorioVendaInadimplentes;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioVendasInadimplentes.getDataInicial(value: TDate): iRelatorioVendaInadimplentes;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioVendasInadimplentes.getValor(value: string): iRelatorioVendaInadimplentes;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioVendasInadimplentes.listarGrid(value: TDataSource): iRelatorioVendaInadimplentes;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_PARCELA').DisplayLabel := 'Parcela';
    FieldByName('ID_VENDA').DisplayLabel := 'Venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('VALOR_VENDA').DisplayLabel := 'valor da venda';
    FieldByName('QUANTIDADE_PARCELAS').DisplayLabel := 'QTDE. Parcelas';
    FieldByName('PARCELA').DisplayLabel := 'Parcela';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Data de vencimento';
    FieldByName('JUROS').Visible := false;
    FieldByName('MULTA').Visible := false;
    FieldByName('DESCONTO').Visible := false;
    FieldByName('TOTAL').Visible := false;
    FieldByName('DATA_PAGAMENTO').Visible := false;
    FieldByName('HORA_PAGAMENTO').Visible := false;
    FieldByName('FUNCIONARIO_PGTO').Visible := false;
    FieldByName('FORMA_PAGAMENTO').Visible := false;
    FieldByName('PAGO').DisplayLabel := 'Pago';
    FieldByName('OBSERVACAO').Visible := false;

    FieldByName('CLIENTE').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioVendasInadimplentes.new: iRelatorioVendaInadimplentes;
begin
  result := self.create;
end;

function TRelatorioVendasInadimplentes.nomeTabela(value: string): iRelatorioVendaInadimplentes;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioVendasInadimplentes.open(value: string): iRelatorioVendaInadimplentes;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioVendasInadimplentes.ordenarGrid(column: TColumn): iRelatorioVendaInadimplentes;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioVendasInadimplentes.pesquisar: iRelatorioVendaInadimplentes;
begin
  result := self;
end;

function TRelatorioVendasInadimplentes.selecionarVendaData: iRelatorioVendaInadimplentes;
begin

  result := self;

  with FQuery do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from VISUALIZAR_PARCELAS_VENDA where DATA_VENCIMENTO <:d '+
                  'and pago =:p and DATA_VENCIMENTO between :d1 and :d2');
    TQuery.ParamByName('d').AsDate := date;
    TQuery.ParamByName('p').AsString := 'Nao';
    TQuery.ParamByName('d1').AsDate := FDataInicial;
    TQuery.ParamByName('d2').AsDate := FDataFinal;
    TQuery.Active := true;

  end;

end;

function TRelatorioVendasInadimplentes.selecionarVendas: iRelatorioVendaInadimplentes;
begin

  result := self;

  with FQuery do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add
      ('select * from VISUALIZAR_PARCELAS_VENDA where DATA_VENCIMENTO <:d and pago =:p and '
      +FCampo+' like :valor');
    TQuery.ParamByName('d').AsDateTime := date;
    TQuery.ParamByName('p').AsString := 'Nao';
    TQuery.ParamByName('valor').AsString := UpperCase(FValor+'%');
    TQuery.Active := true;

  end;


end;

function TRelatorioVendasInadimplentes.sqlPesquisa: iRelatorioVendaInadimplentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioVendasInadimplentes.sqlPesquisaData: iRelatorioVendaInadimplentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioVendasInadimplentes.sqlPesquisaEstatica: iRelatorioVendaInadimplentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioVendasInadimplentes.validarData(componet: tmaskEdit):iRelatorioVendaInadimplentes;
var
  d: TDate;
begin

  result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
