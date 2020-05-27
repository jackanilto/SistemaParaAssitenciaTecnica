
unit UClasse.Relatorio.Movimentacao.Contas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TRelatorioMovimentacaoContas = class(TInterfacedObject, iRelatorioMovimentacaoContas)
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

    function nomeTabela(value: string): iRelatorioMovimentacaoContas;
    function getCampo(value: string): iRelatorioMovimentacaoContas;
    function getValor(value: string): iRelatorioMovimentacaoContas;
    function getDataInicial(value: TDate): iRelatorioMovimentacaoContas;
    function getDataFinal(value: TDate): iRelatorioMovimentacaoContas;
    function open(value: string): iRelatorioMovimentacaoContas;
    function pesquisar: iRelatorioMovimentacaoContas;
    function ExecSql: iRelatorioMovimentacaoContas;
    function sqlPesquisa: iRelatorioMovimentacaoContas;
    function sqlPesquisaData: iRelatorioMovimentacaoContas;
    function sqlPesquisaEstatica: iRelatorioMovimentacaoContas;
    function SelectSql(value: string): iRelatorioMovimentacaoContas;

    function abrir: iRelatorioMovimentacaoContas;
    function atualizar: iRelatorioMovimentacaoContas;
    function cancelar: iRelatorioMovimentacaoContas;
    function fecharQuery: iRelatorioMovimentacaoContas;
    function listarGrid(value: TDataSource): iRelatorioMovimentacaoContas;
    function ordenarGrid(column: TColumn): iRelatorioMovimentacaoContas;

    function exportar: iRelatorioMovimentacaoContas;
    function validarData(componet: tmaskEdit):iRelatorioMovimentacaoContas;

    function selecionarParcelasOrdemData(data1, data2:TDate):iRelatorioMovimentacaoContas;
    function retornarTotal:Currency;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioMovimentacaoContas;
  end;

implementation

{ TRelatorioMovimentacaoContas }

function TRelatorioMovimentacaoContas.abrir: iRelatorioMovimentacaoContas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioMovimentacaoContas.atualizar: iRelatorioMovimentacaoContas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioMovimentacaoContas.cancelar: iRelatorioMovimentacaoContas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioMovimentacaoContas.create;
begin
  FTabela := 'CONTAS_A_PAGAR';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Movimentação caixa - Contas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioMovimentacaoContas.destroy;
begin

  inherited;
end;

function TRelatorioMovimentacaoContas.ExecSql: iRelatorioMovimentacaoContas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioMovimentacaoContas.exportar: iRelatorioMovimentacaoContas;
begin
  result := self;
end;

function TRelatorioMovimentacaoContas.fecharQuery: iRelatorioMovimentacaoContas;
begin
  FQuery.TQuery.close;
end;

function TRelatorioMovimentacaoContas.getCampo(value: string): iRelatorioMovimentacaoContas;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioMovimentacaoContas.getDataFinal(value: TDate): iRelatorioMovimentacaoContas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioMovimentacaoContas.getDataInicial(value: TDate): iRelatorioMovimentacaoContas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioMovimentacaoContas.getValor(value: string): iRelatorioMovimentacaoContas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioMovimentacaoContas.listarGrid(value: TDataSource): iRelatorioMovimentacaoContas;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'Código';
    FieldByName('CONTA').DisplayLabel := 'Conta';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('VALOR').DisplayLabel := 'Valor';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('VALOR_TOTAL').DisplayLabel := 'Valor total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Pagamento';
    FieldByName('PAGO').DisplayLabel := 'Pago';
    FieldByName('FUNCIONARIO_CADASTRO').Visible := false;
    FieldByName('OBSERVACAO').Visible := false;

    FieldByName('CONTA').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioMovimentacaoContas.new: iRelatorioMovimentacaoContas;
begin
  result := self.create;
end;

function TRelatorioMovimentacaoContas.nomeTabela(value: string): iRelatorioMovimentacaoContas;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioMovimentacaoContas.open(value: string): iRelatorioMovimentacaoContas;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioMovimentacaoContas.ordenarGrid(column: TColumn): iRelatorioMovimentacaoContas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioMovimentacaoContas.pesquisar: iRelatorioMovimentacaoContas;
begin
  result := self;
end;

function TRelatorioMovimentacaoContas.retornarTotal: Currency;
var
  total:currency;
begin

  result := 0;

  total := 0;

  FQuery.TQuery.First;

  while not FQuery.TQuery.Eof do
  begin
    total := total + FQuery.TQuery.FieldByName('VALOR_TOTAL').AsCurrency;
    FQuery.TQuery.Next;
  end;

  result := total;

end;

function TRelatorioMovimentacaoContas.selecionarParcelasOrdemData(data1,
  data2: TDate): iRelatorioMovimentacaoContas;
begin

  result := self;

  with FQuery do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('SELECT * FROM CONTAS_A_PAGAR WHERE DATA_PAGAMENTO BETWEEN :D1 AND :D2');
    TQuery.ParamByName('D1').AsDate := data1;
    TQuery.ParamByName('D2').AsDate := data2;
    TQuery.Active := true;

  end;

end;

function TRelatorioMovimentacaoContas.SelectSql(value: string): iRelatorioMovimentacaoContas;
begin

end;

function TRelatorioMovimentacaoContas.sqlPesquisa: iRelatorioMovimentacaoContas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioMovimentacaoContas.sqlPesquisaData: iRelatorioMovimentacaoContas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioMovimentacaoContas.sqlPesquisaEstatica: iRelatorioMovimentacaoContas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioMovimentacaoContas.validarData(componet: tmaskEdit):iRelatorioMovimentacaoContas;
var
  d: TDate;
begin

  result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data válida.');
  end;
end;

end.
