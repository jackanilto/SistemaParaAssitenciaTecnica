unit UClasse.Relatorio.Problemas.Frequentes;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TRelatorioProblemasFrequentes = class(TInterfacedObject, iRelatorioProblemasFrequentes)
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

    function nomeTabela(value: string): iRelatorioProblemasFrequentes;
    function getCampo(value: string): iRelatorioProblemasFrequentes;
    function getValor(value: string): iRelatorioProblemasFrequentes;
    function getDataInicial(value: TDate): iRelatorioProblemasFrequentes;
    function getDataFinal(value: TDate): iRelatorioProblemasFrequentes;
    function open(value: string): iRelatorioProblemasFrequentes;
    function pesquisar: iRelatorioProblemasFrequentes;
    function ExecSql: iRelatorioProblemasFrequentes;
    function sqlPesquisa: iRelatorioProblemasFrequentes;
    function sqlPesquisaData: iRelatorioProblemasFrequentes;
    function sqlPesquisaEstatica: iRelatorioProblemasFrequentes;

    function abrir: iRelatorioProblemasFrequentes;
    function atualizar: iRelatorioProblemasFrequentes;
    function cancelar: iRelatorioProblemasFrequentes;
    function fecharQuery: iRelatorioProblemasFrequentes;
    function listarGrid(value: TDataSource): iRelatorioProblemasFrequentes;
    function ordenarGrid(column: TColumn): iRelatorioProblemasFrequentes;

    function exportar: iRelatorioProblemasFrequentes;
    function validarData(componet: tmaskEdit):iRelatorioProblemasFrequentes;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioProblemasFrequentes;
  end;

implementation

{ TRelatorioProblemasFrequentes }

function TRelatorioProblemasFrequentes.abrir: iRelatorioProblemasFrequentes;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioProblemasFrequentes.atualizar: iRelatorioProblemasFrequentes;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioProblemasFrequentes.cancelar: iRelatorioProblemasFrequentes;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioProblemasFrequentes.create;
begin
  FTabela := 'iRelatorioComissoesTecnico';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório Problemas Frequentes').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioProblemasFrequentes.destroy;
begin

  inherited;
end;

function TRelatorioProblemasFrequentes.ExecSql: iRelatorioProblemasFrequentes;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioProblemasFrequentes.exportar: iRelatorioProblemasFrequentes;
begin
  result := self;
end;

function TRelatorioProblemasFrequentes.fecharQuery: iRelatorioProblemasFrequentes;
begin
  FQuery.TQuery.close;
end;

function TRelatorioProblemasFrequentes.getCampo(value: string): iRelatorioProblemasFrequentes;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioProblemasFrequentes.getDataFinal(value: TDate): iRelatorioProblemasFrequentes;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioProblemasFrequentes.getDataInicial(value: TDate): iRelatorioProblemasFrequentes;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioProblemasFrequentes.getValor(value: string): iRelatorioProblemasFrequentes;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioProblemasFrequentes.listarGrid(value: TDataSource): iRelatorioProblemasFrequentes;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'Código';
    FieldByName('NOME_PECA').DisplayLabel := 'Equipamento/Paça';
    FieldByName('NUMERO_SERIE').DisplayLabel := 'Número de serie';
    FieldByName('MARCA').DisplayLabel := 'Marca';
    FieldByName('DATA_FABRICACAO').DisplayLabel := 'Data de fabricação';
    FieldByName('DATA_CADASTRO').DisplayLabel := 'Data de cadastro';
    FieldByName('DEFEITO').DisplayLabel := 'Defeito';
    FieldByName('SOLUCAO_DEFEITO').DisplayLabel := 'Solução do defeito';
    FieldByName('FUNCIONARIO').Visible := false;
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('NOME_PECA').DisplayWidth := 40;
    FieldByName('DEFEITO').DisplayWidth := 40;
    FieldByName('SOLUCAO_DEFEITO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioProblemasFrequentes.new: iRelatorioProblemasFrequentes;
begin
  result := self.create;
end;

function TRelatorioProblemasFrequentes.nomeTabela(value: string): iRelatorioProblemasFrequentes;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioProblemasFrequentes.open(value: string): iRelatorioProblemasFrequentes;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioProblemasFrequentes.ordenarGrid(column: TColumn): iRelatorioProblemasFrequentes;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioProblemasFrequentes.pesquisar: iRelatorioProblemasFrequentes;
begin
  result := self;
end;

function TRelatorioProblemasFrequentes.sqlPesquisa: iRelatorioProblemasFrequentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioProblemasFrequentes.sqlPesquisaData: iRelatorioProblemasFrequentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioProblemasFrequentes.sqlPesquisaEstatica: iRelatorioProblemasFrequentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioProblemasFrequentes.validarData(componet: tmaskEdit):iRelatorioProblemasFrequentes;
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
