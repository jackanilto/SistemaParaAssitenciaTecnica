unit UClasse.Relatorio.OS.Estornadas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TRelatorioOSEstornadas = class(TInterfacedObject, iRelatorioOSEstornadas)
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

    function nomeTabela(value: string): iRelatorioOSEstornadas;
    function getCampo(value: string): iRelatorioOSEstornadas;
    function getValor(value: string): iRelatorioOSEstornadas;
    function getDataInicial(value: TDate): iRelatorioOSEstornadas;
    function getDataFinal(value: TDate): iRelatorioOSEstornadas;
    function open(value: string): iRelatorioOSEstornadas;
    function pesquisar: iRelatorioOSEstornadas;
    function ExecSql: iRelatorioOSEstornadas;
    function sqlPesquisa: iRelatorioOSEstornadas;
    function sqlPesquisaData: iRelatorioOSEstornadas;
    function sqlPesquisaEstatica: iRelatorioOSEstornadas;

    function abrir: iRelatorioOSEstornadas;
    function atualizar: iRelatorioOSEstornadas;
    function cancelar: iRelatorioOSEstornadas;
    function fecharQuery: iRelatorioOSEstornadas;
    function listarGrid(value: TDataSource): iRelatorioOSEstornadas;
    function ordenarGrid(column: TColumn): iRelatorioOSEstornadas;

    function exportar: iRelatorioOSEstornadas;
    function validarData(componet: tmaskEdit):iRelatorioOSEstornadas;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioOSEstornadas;
  end;

implementation

{ TRelatorioOSEstornadas }

function TRelatorioOSEstornadas.abrir: iRelatorioOSEstornadas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioOSEstornadas.atualizar: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioOSEstornadas.cancelar: iRelatorioOSEstornadas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioOSEstornadas.create;
begin
  FTabela := 'ORDEM_SERVICO';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório os estornadas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioOSEstornadas.destroy;
begin

  inherited;
end;

function TRelatorioOSEstornadas.ExecSql: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioOSEstornadas.exportar: iRelatorioOSEstornadas;
begin
  result := self;
end;

function TRelatorioOSEstornadas.fecharQuery: iRelatorioOSEstornadas;
begin
  FQuery.TQuery.close;
end;

function TRelatorioOSEstornadas.getCampo(value: string): iRelatorioOSEstornadas;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioOSEstornadas.getDataFinal(value: TDate): iRelatorioOSEstornadas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioOSEstornadas.getDataInicial(value: TDate): iRelatorioOSEstornadas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioOSEstornadas.getValor(value: string): iRelatorioOSEstornadas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioOSEstornadas.listarGrid(value: TDataSource): iRelatorioOSEstornadas;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'Cód. Cliente';
    FieldByName('EQUIPAMENTO').DisplayLabel := 'Equipamento';
    FieldByName('DEFEITO_RELATADO').Visible := false;
    FieldByName('MARCA').Visible := false;
    FieldByName('MODELO').visible := false;
    FieldByName('NUMERO_SERIE').Visible := false;
    FieldByName('DATA_FABRICACAO').Visible := false;
    FieldByName('LAUDO_DO_TECNICO').Visible := false;
    FieldByName('SOLUCAO_DO_PROBLEMA').Visible := false;
    FieldByName('VALOR_DA_ORDEM').DisplayLabel := 'Valor da ordem';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('ACRESCIMO').DisplayLabel  := 'Acréscimo';
    FieldByName('TOTAL_ORCAMENTO').DisplayLabel := 'Total do orçamento';
    FieldByName('ID_FUNCIONARIO').Visible := false;
    FieldByName('NOME_FUNCIONARIO').Visible := false;
    FieldByName('RETORNO').DisplayLabel := 'Retorno';
    FieldByName('DATA_RETORNO').DisplayLabel := 'Data de retorno';
    FieldByName('SITUACAO_DA_ORDEM').DisplayLabel := 'Situação da ordem';
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcelas';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('PRIORIDADE').DisplayLabel := 'Prioridade';
    FieldByName('DATA_ENTRADA').DisplayLabel := 'Data de entrada';
    FieldByName('DATA_FINALIZACAO').DisplayLabel := 'Data de saída';
    FieldByName('HORA_SAIDA').Visible := false;
    FieldByName('DATA_BASE_VENCIMENTO').Visible := false;
    FieldByName('ID_TECNICO_RESPONSAVEL').DisplayLabel := 'Cód. Técnico';
    FieldByName('TECNICO_RESPONSAVEL').DisplayLabel := 'Técnico responsável';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';
    FieldByName('STATUS').Visible := false;
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioOSEstornadas.new: iRelatorioOSEstornadas;
begin
  result := self.create;
end;

function TRelatorioOSEstornadas.nomeTabela(value: string): iRelatorioOSEstornadas;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioOSEstornadas.open(value: string): iRelatorioOSEstornadas;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioOSEstornadas.ordenarGrid(column: TColumn): iRelatorioOSEstornadas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioOSEstornadas.pesquisar: iRelatorioOSEstornadas;
begin
  result := self;
end;

function TRelatorioOSEstornadas.sqlPesquisa: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioOSEstornadas.sqlPesquisaData: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioOSEstornadas.sqlPesquisaEstatica: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioOSEstornadas.validarData(componet: tmaskEdit):iRelatorioOSEstornadas;
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
