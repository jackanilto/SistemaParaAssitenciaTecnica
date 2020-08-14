unit UClasse.Visualizar.Ordens.Servicos.Incluidos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityVisualizarOrdemServicosIncluidos = class(TInterfacedObject,
    iVisualizarServicosOrdem)
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

    function nomeTabela(value: string): iVisualizarServicosOrdem;
    function getCampo(value: string): iVisualizarServicosOrdem;
    function getValor(value: string): iVisualizarServicosOrdem;
    function getDataInicial(value: TDate): iVisualizarServicosOrdem;
    function getDataFinal(value: TDate): iVisualizarServicosOrdem;
    function open(value: string): iVisualizarServicosOrdem;
    function pesquisar: iVisualizarServicosOrdem;
    function ExecSql: iVisualizarServicosOrdem;
    function sqlPesquisa: iVisualizarServicosOrdem;
    function sqlPesquisaData: iVisualizarServicosOrdem;
    function sqlPesquisaEstatica: iVisualizarServicosOrdem;

    function abrir: iVisualizarServicosOrdem;
    function atualizar: iVisualizarServicosOrdem;
    function listarGrid(value: TDataSource): iVisualizarServicosOrdem;
    function ordenarGrid(column: TColumn): iVisualizarServicosOrdem;

    function exportar: iVisualizarServicosOrdem;

    constructor create;
    destructor destroy; override;
    class function new: iVisualizarServicosOrdem;
  end;

implementation

{ TEntityVisualizarOrdemServicosIncluidos }

function TEntityVisualizarOrdemServicosIncluidos.abrir: iVisualizarServicosOrdem;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityVisualizarOrdemServicosIncluidos.atualizar: iVisualizarServicosOrdem;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

constructor TEntityVisualizarOrdemServicosIncluidos.create;
begin
  FTabela := 'SERVICOS_ORDEM';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Visualizar serviços da OS').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TEntityVisualizarOrdemServicosIncluidos.destroy;
begin

  inherited;
end;

function TEntityVisualizarOrdemServicosIncluidos.ExecSql: iVisualizarServicosOrdem;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityVisualizarOrdemServicosIncluidos.exportar: iVisualizarServicosOrdem;
begin
  result := self;
end;

function TEntityVisualizarOrdemServicosIncluidos.getCampo(value: string)
  : iVisualizarServicosOrdem;
begin
  result := self;
  FCampo := value;
end;

function TEntityVisualizarOrdemServicosIncluidos.getDataFinal(value: TDate)
  : iVisualizarServicosOrdem;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityVisualizarOrdemServicosIncluidos.getDataInicial(value: TDate)
  : iVisualizarServicosOrdem;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityVisualizarOrdemServicosIncluidos.getValor(value: string)
  : iVisualizarServicosOrdem;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityVisualizarOrdemServicosIncluidos.listarGrid(value: TDataSource)
  : iVisualizarServicosOrdem;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'Código';
    FieldByName('ID_ORDEM').DisplayLabel := 'Cód. Ordem';
    FieldByName('ID_SERVICO').DisplayLabel := 'Cód. Serviço';
    FieldByName('SERVICO').DisplayLabel := 'Serviços';
    FieldByName('VALOR').DisplayLabel := 'Valor';
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityVisualizarOrdemServicosIncluidos.new: iVisualizarServicosOrdem;
begin
  result := self.create;
end;

function TEntityVisualizarOrdemServicosIncluidos.nomeTabela(value: string)
  : iVisualizarServicosOrdem;
begin
  result := self;
  FTabela := value;
end;

function TEntityVisualizarOrdemServicosIncluidos.open(value: string)
  : iVisualizarServicosOrdem;
begin
  FQuery.Query(FTabela);
end;

function TEntityVisualizarOrdemServicosIncluidos.ordenarGrid(column: TColumn)
  : iVisualizarServicosOrdem;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityVisualizarOrdemServicosIncluidos.pesquisar: iVisualizarServicosOrdem;
begin
  result := self;
end;

function TEntityVisualizarOrdemServicosIncluidos.sqlPesquisa: iVisualizarServicosOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityVisualizarOrdemServicosIncluidos.sqlPesquisaData
  : iVisualizarServicosOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityVisualizarOrdemServicosIncluidos.sqlPesquisaEstatica
  : iVisualizarServicosOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
