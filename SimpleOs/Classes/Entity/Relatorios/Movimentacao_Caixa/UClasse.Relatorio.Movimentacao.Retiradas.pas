unit UClasse.Relatorio.Movimentacao.Retiradas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TRelatorioMovimentacaoRetiradas = class(TInterfacedObject, iRelatorioMovimentacaoRetiradas)
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

    function nomeTabela(value: string): iRelatorioMovimentacaoRetiradas;
    function getCampo(value: string): iRelatorioMovimentacaoRetiradas;
    function getValor(value: string): iRelatorioMovimentacaoRetiradas;
    function getDataInicial(value: TDate): iRelatorioMovimentacaoRetiradas;
    function getDataFinal(value: TDate): iRelatorioMovimentacaoRetiradas;
    function open(value: string): iRelatorioMovimentacaoRetiradas;
    function pesquisar: iRelatorioMovimentacaoRetiradas;
    function ExecSql: iRelatorioMovimentacaoRetiradas;
    function sqlPesquisa: iRelatorioMovimentacaoRetiradas;
    function sqlPesquisaData: iRelatorioMovimentacaoRetiradas;
    function sqlPesquisaEstatica: iRelatorioMovimentacaoRetiradas;
    function SelectSql(value: string): iRelatorioMovimentacaoRetiradas;

    function abrir: iRelatorioMovimentacaoRetiradas;
    function atualizar: iRelatorioMovimentacaoRetiradas;
    function cancelar: iRelatorioMovimentacaoRetiradas;
    function fecharQuery: iRelatorioMovimentacaoRetiradas;
    function listarGrid(value: TDataSource): iRelatorioMovimentacaoRetiradas;
    function ordenarGrid(column: TColumn): iRelatorioMovimentacaoRetiradas;

    function exportar: iRelatorioMovimentacaoRetiradas;
    function validarData(componet: tmaskEdit):iRelatorioMovimentacaoRetiradas;

    function selecionarParcelasOrdemData(data1, data2:TDate):iRelatorioMovimentacaoRetiradas;
    function retornarTotal:Currency;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioMovimentacaoRetiradas;
  end;

implementation

{ TRelatorioMovimentacaoRetiradas }

function TRelatorioMovimentacaoRetiradas.abrir: iRelatorioMovimentacaoRetiradas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioMovimentacaoRetiradas.atualizar: iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioMovimentacaoRetiradas.cancelar: iRelatorioMovimentacaoRetiradas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioMovimentacaoRetiradas.create;
begin
  FTabela := 'RETIRADAS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Movimenta��o de caixa - Retiradas').getCodigoFuncionario
    (funcionarioLogado);

end;

destructor TRelatorioMovimentacaoRetiradas.destroy;
begin

  inherited;
end;

function TRelatorioMovimentacaoRetiradas.ExecSql: iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioMovimentacaoRetiradas.exportar: iRelatorioMovimentacaoRetiradas;
begin
  result := self;
end;

function TRelatorioMovimentacaoRetiradas.fecharQuery: iRelatorioMovimentacaoRetiradas;
begin
  FQuery.TQuery.close;
end;

function TRelatorioMovimentacaoRetiradas.getCampo(value: string): iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioMovimentacaoRetiradas.getDataFinal(value: TDate): iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FDataFinal := value;
end;

function TRelatorioMovimentacaoRetiradas.getDataInicial(value: TDate): iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FDataInicial := value;
end;

function TRelatorioMovimentacaoRetiradas.getValor(value: string): iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioMovimentacaoRetiradas.listarGrid(value: TDataSource): iRelatorioMovimentacaoRetiradas;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'C�d. Retirada';
    FieldByName('ID_MOTIVO').DisplayLabel := 'c�d.Motivo';
    FieldByName('MOTIVO').DisplayLabel := 'Motivo';
    FieldByName('VALOR').DisplayLabel := 'Valor';
    FieldByName('DATA').DisplayLabel := 'Data';
    FieldByName('HORA').Visible := false;
    FieldByName('FUNCIONARIO').Visible := false;
    FieldByName('OBSERVACAO').Visible := false;

    FieldByName('MOTIVO').DisplayWidth := 80;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioMovimentacaoRetiradas.new: iRelatorioMovimentacaoRetiradas;
begin
  result := self.create;
end;

function TRelatorioMovimentacaoRetiradas.nomeTabela(value: string): iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioMovimentacaoRetiradas.open(value: string): iRelatorioMovimentacaoRetiradas;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioMovimentacaoRetiradas.ordenarGrid(column: TColumn): iRelatorioMovimentacaoRetiradas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioMovimentacaoRetiradas.pesquisar: iRelatorioMovimentacaoRetiradas;
begin
  result := self;
end;

function TRelatorioMovimentacaoRetiradas.retornarTotal: Currency;
var
  total:currency;
begin

  result := 0;

  total := 0;

  FQuery.TQuery.First;

  while not FQuery.TQuery.Eof do
  begin

    total := total + FQuery.TQuery.FieldByName('VALOR').AsCurrency;

    FQuery.TQuery.Next;

  end;

  result := total;
end;

function TRelatorioMovimentacaoRetiradas.selecionarParcelasOrdemData(data1,
  data2: TDate): iRelatorioMovimentacaoRetiradas;
begin
  result := self;

  with FQuery do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add
        ('select * from RETIRADAS where DATA between :d1 and :d2');
    TQuery.ParamByName('d1').AsDate := data1;
    TQuery.ParamByName('d2').AsDate := data2;
    TQuery.Active := true;

  end;


end;

function TRelatorioMovimentacaoRetiradas.SelectSql(
  value: string): iRelatorioMovimentacaoRetiradas;
begin

end;

function TRelatorioMovimentacaoRetiradas.sqlPesquisa: iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioMovimentacaoRetiradas.sqlPesquisaData: iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioMovimentacaoRetiradas.sqlPesquisaEstatica: iRelatorioMovimentacaoRetiradas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioMovimentacaoRetiradas.validarData(componet: tmaskEdit):iRelatorioMovimentacaoRetiradas;
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
