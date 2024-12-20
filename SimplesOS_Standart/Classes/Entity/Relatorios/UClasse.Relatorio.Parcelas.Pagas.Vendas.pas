unit UClasse.Relatorio.Parcelas.Pagas.Vendas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioParcelasPagasVendas = class(TInterfacedObject, iRelatorioParcelasPagasVendas)
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

    function nomeTabela(value: string): iRelatorioParcelasPagasVendas;
    function getCampo(value: string): iRelatorioParcelasPagasVendas;
    function getValor(value: string): iRelatorioParcelasPagasVendas;
    function getDataInicial(value: TDate): iRelatorioParcelasPagasVendas;
    function getDataFinal(value: TDate): iRelatorioParcelasPagasVendas;
    function open(value: string): iRelatorioParcelasPagasVendas;
    function pesquisar: iRelatorioParcelasPagasVendas;
    function ExecSql: iRelatorioParcelasPagasVendas;
    function sqlPesquisa: iRelatorioParcelasPagasVendas;
    function sqlPesquisaData: iRelatorioParcelasPagasVendas;
    function sqlPesquisaEstatica: iRelatorioParcelasPagasVendas;

    function abrir: iRelatorioParcelasPagasVendas;
    function atualizar: iRelatorioParcelasPagasVendas;
    function cancelar: iRelatorioParcelasPagasVendas;
    function fecharQuery: iRelatorioParcelasPagasVendas;
    function listarGrid(value: TDataSource): iRelatorioParcelasPagasVendas;
    function ordenarGrid(column: TColumn): iRelatorioParcelasPagasVendas;

    function exportar: iRelatorioParcelasPagasVendas;
    function validarData(componet: tmaskEdit):iRelatorioParcelasPagasVendas;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioParcelasPagasVendas;
  end;

implementation

{ TRelatorioParcelasPagasVendas }

function TRelatorioParcelasPagasVendas.abrir: iRelatorioParcelasPagasVendas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioParcelasPagasVendas.atualizar: iRelatorioParcelasPagasVendas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioParcelasPagasVendas.cancelar: iRelatorioParcelasPagasVendas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioParcelasPagasVendas.create;
begin
  FTabela := 'VISUALIZAR_P_VENDA_PAGAS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio Parcelas Pagas Vendas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioParcelasPagasVendas.destroy;
begin

  inherited;
end;

function TRelatorioParcelasPagasVendas.ExecSql: iRelatorioParcelasPagasVendas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioParcelasPagasVendas.exportar: iRelatorioParcelasPagasVendas;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio de Contas a Receber Vendas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Parcela';
  pasta.cells[1, 2] := 'Venda';
  pasta.cells[1, 3] := 'C�d. Cliente';
  pasta.cells[1, 4] := 'Cliente';
  pasta.cells[1, 5] := 'Valor da venda';
  pasta.cells[1, 6] := 'QTDE. Parcelas';
  pasta.cells[1, 7] := 'N�. Parcela';
  pasta.cells[1, 8] := 'Valor da parcela';
  pasta.cells[1, 9] := 'Vencimento';
  pasta.cells[1, 10] := 'Juros';
  pasta.cells[1, 11] := 'Multa';
  pasta.cells[1, 12] := 'Desconto';
  pasta.cells[1, 13] := 'Total';
  pasta.cells[1, 14] := 'Data de pagamento';
  pasta.cells[1, 15] := 'Hora de pagamento';
  pasta.cells[1, 16] := 'Funcion�rio';
  pasta.cells[1, 17] := 'Forma de pagamento';
  pasta.cells[1, 18] := 'Pago';
  pasta.cells[1, 19] := 'Observa��o';


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
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('JUROS').AsCurrency;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('MULTA').AsCurrency;
      pasta.cells[linha, 12]:= FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('TOTAL').AsCurrency;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('HORA_PAGAMENTO').AsDateTime;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('FUNCIONARIO_PGTO').AsInteger;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('FORMA_PAGAMENTO').AsString;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('PAGO').AsString;
      pasta.cells[linha, 19] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;


      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioParcelasPagasVendas.fecharQuery: iRelatorioParcelasPagasVendas;
begin
  FQuery.TQuery.close;
end;

function TRelatorioParcelasPagasVendas.getCampo(value: string): iRelatorioParcelasPagasVendas;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioParcelasPagasVendas.getDataFinal(value: TDate): iRelatorioParcelasPagasVendas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioParcelasPagasVendas.getDataInicial(value: TDate): iRelatorioParcelasPagasVendas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioParcelasPagasVendas.getValor(value: string): iRelatorioParcelasPagasVendas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioParcelasPagasVendas.listarGrid(value: TDataSource): iRelatorioParcelasPagasVendas;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_PARCELA').DisplayLabel := 'Parcela';
    FieldByName('ID_VENDA').DisplayLabel := 'Venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('VALOR_VENDA').DisplayLabel := 'Valor da venda';
    FieldByName('QUANTIDADE_PARCELAS').DisplayLabel := 'QTDE. Parcelas';
    FieldByName('PARCELA').DisplayLabel := 'Parcela';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('TOTAL').DisplayLabel := 'Total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Data de pagamento';
    FieldByName('HORA_PAGAMENTO').DisplayLabel := 'Hor�rio de pagamento';
    FieldByName('FUNCIONARIO_PGTO').DisplayLabel := 'Funcion�rio';
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('PAGO').DisplayLabel := 'Pago';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('CLIENTE').DisplayWidth := 40;
    FieldByName('FUNCIONARIO_PGTO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioParcelasPagasVendas.new: iRelatorioParcelasPagasVendas;
begin
  result := self.create;
end;

function TRelatorioParcelasPagasVendas.nomeTabela(value: string): iRelatorioParcelasPagasVendas;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioParcelasPagasVendas.open(value: string): iRelatorioParcelasPagasVendas;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioParcelasPagasVendas.ordenarGrid(column: TColumn): iRelatorioParcelasPagasVendas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioParcelasPagasVendas.pesquisar: iRelatorioParcelasPagasVendas;
begin
  result := self;
end;

function TRelatorioParcelasPagasVendas.sqlPesquisa: iRelatorioParcelasPagasVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioParcelasPagasVendas.sqlPesquisaData: iRelatorioParcelasPagasVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioParcelasPagasVendas.sqlPesquisaEstatica: iRelatorioParcelasPagasVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioParcelasPagasVendas.validarData(componet: tmaskEdit):iRelatorioParcelasPagasVendas;
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
