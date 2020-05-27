unit UClasse.Relatorio.Movimentacao.OS;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TRelatorioMovimentacaoOS = class(TInterfacedObject, iRelatorioMovimentacaoOS)
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

    function nomeTabela(value: string): iRelatorioMovimentacaoOS;
    function getCampo(value: string): iRelatorioMovimentacaoOS;
    function getValor(value: string): iRelatorioMovimentacaoOS;
    function getDataInicial(value: TDate): iRelatorioMovimentacaoOS;
    function getDataFinal(value: TDate): iRelatorioMovimentacaoOS;
    function open(value: string): iRelatorioMovimentacaoOS;
    function pesquisar: iRelatorioMovimentacaoOS;
    function ExecSql: iRelatorioMovimentacaoOS;
    function sqlPesquisa: iRelatorioMovimentacaoOS;
    function sqlPesquisaData: iRelatorioMovimentacaoOS;
    function sqlPesquisaEstatica: iRelatorioMovimentacaoOS;
    function SelectSql(value: string): iRelatorioMovimentacaoOS;

    function abrir: iRelatorioMovimentacaoOS;
    function atualizar: iRelatorioMovimentacaoOS;
    function cancelar: iRelatorioMovimentacaoOS;
    function fecharQuery: iRelatorioMovimentacaoOS;
    function listarGrid(value: TDataSource): iRelatorioMovimentacaoOS;
    function ordenarGrid(column: TColumn): iRelatorioMovimentacaoOS;

    function exportar: iRelatorioMovimentacaoOS;
    function validarData(componet: tmaskEdit):iRelatorioMovimentacaoOS;

    function selecionarParcelasOrdemData(data1, data2:TDate):iRelatorioMovimentacaoOS;
    function retornarTotal:Currency;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioMovimentacaoOS;
  end;

implementation

{ TRelatorioMovimentacaoOS }

function TRelatorioMovimentacaoOS.abrir: iRelatorioMovimentacaoOS;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioMovimentacaoOS.atualizar: iRelatorioMovimentacaoOS;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioMovimentacaoOS.cancelar: iRelatorioMovimentacaoOS;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioMovimentacaoOS.create;
begin

  FTabela := 'PARCELAS_ORDEM';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Movimentaçaõ caixa - Parcelas OS').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioMovimentacaoOS.destroy;
begin

  inherited;
end;

function TRelatorioMovimentacaoOS.ExecSql: iRelatorioMovimentacaoOS;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioMovimentacaoOS.exportar: iRelatorioMovimentacaoOS;
begin
  result := self;
end;

function TRelatorioMovimentacaoOS.fecharQuery: iRelatorioMovimentacaoOS;
begin
  FQuery.TQuery.close;
end;

function TRelatorioMovimentacaoOS.getCampo(value: string): iRelatorioMovimentacaoOS;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioMovimentacaoOS.getDataFinal(value: TDate): iRelatorioMovimentacaoOS;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioMovimentacaoOS.getDataInicial(value: TDate): iRelatorioMovimentacaoOS;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioMovimentacaoOS.getValor(value: string): iRelatorioMovimentacaoOS;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioMovimentacaoOS.listarGrid(value: TDataSource): iRelatorioMovimentacaoOS;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'Parcela';
    FieldByName('ID_ORDEM').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').Visible := false;
    FieldByName('TOTAL_PARCELAS').Visible := false;
    FieldByName('PARCELA').DisplayLabel := 'Parcela';
    FieldByName('VALOR_PARCELA').Visible := false;
    FieldByName('DATA_VENCIMENTO').Visible := false;
    FieldByName('DESCONTO').Visible := false;
    FieldByName('JUROS').Visible := false;
    FieldByName('MULTA').Visible := false;
    FieldByName('VALOR_TOTAL').DisplayLabel := 'Valor';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Pagamento';
    FieldByName('HORA_PAGAMENTO').Visible := false;
    FieldByName('FORMA_PAGAMENTO').Visible := false;
    FieldByName('PGTO').Visible := false;
    FieldByName('DATA_ESTORNO').Visible := false;
    FieldByName('ID_FUNCIONARIO').Visible := false;
    FieldByName('NOME_FUNCIONARIO').Visible := false;
    FieldByName('OBSERVACAO').Visible := false;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioMovimentacaoOS.new: iRelatorioMovimentacaoOS;
begin
  result := self.create;
end;

function TRelatorioMovimentacaoOS.nomeTabela(value: string): iRelatorioMovimentacaoOS;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioMovimentacaoOS.open(value: string): iRelatorioMovimentacaoOS;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioMovimentacaoOS.ordenarGrid(column: TColumn): iRelatorioMovimentacaoOS;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioMovimentacaoOS.pesquisar: iRelatorioMovimentacaoOS;
begin
  result := self;
end;

function TRelatorioMovimentacaoOS.retornarTotal: Currency;
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

function TRelatorioMovimentacaoOS.selecionarParcelasOrdemData(data1,
  data2: TDate): iRelatorioMovimentacaoOS;
begin

  result := self;

  with FQuery do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add
        ('select * from PARCELAS_ORDEM where DATA_PAGAMENTO between :d1 and :d2 and PGTO =:p');
    TQuery.ParamByName('d1').AsDate := data1;
    TQuery.ParamByName('d2').AsDate := data2;
    TQuery.ParamByName('p').AsString := 'Sim';
    TQuery.Active := true;

  end;

end;

function TRelatorioMovimentacaoOS.SelectSql(
  value: string): iRelatorioMovimentacaoOS;
begin

end;

function TRelatorioMovimentacaoOS.sqlPesquisa: iRelatorioMovimentacaoOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioMovimentacaoOS.sqlPesquisaData: iRelatorioMovimentacaoOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioMovimentacaoOS.sqlPesquisaEstatica: iRelatorioMovimentacaoOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioMovimentacaoOS.validarData(componet: tmaskEdit):iRelatorioMovimentacaoOS;
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
