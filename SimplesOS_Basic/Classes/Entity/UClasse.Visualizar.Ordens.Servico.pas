unit UClasse.Visualizar.Ordens.Servico;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityVisualizarOrdem = class(TInterfacedObject, iVisualizarOrdens)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

  public

    function nomeTabela(value: string): iVisualizarOrdens;
    function getCampo(value: string): iVisualizarOrdens;
    function getValor(value: string): iVisualizarOrdens;
    function getDataInicial(value: TDate): iVisualizarOrdens;
    function getDataFinal(value: TDate): iVisualizarOrdens;
    function open(value: string): iVisualizarOrdens;
    function pesquisar: iVisualizarOrdens;
    function ExecSql: iVisualizarOrdens;
    function sqlPesquisa: iVisualizarOrdens;
    function sqlPesquisaData: iVisualizarOrdens;
    function sqlPesquisaEstatica: iVisualizarOrdens;

    function abrir: iVisualizarOrdens;
    function listarGrid(value: TDataSource): iVisualizarOrdens;
    function ordenarGrid(column: TColumn): iVisualizarOrdens;
    function atualizar: iVisualizarOrdens;
    function exportar: iVisualizarOrdens;

    constructor create;
    destructor destroy; override;
    class function new: iVisualizarOrdens;
  end;

implementation

{ TEntityVisualizarOrdem }

function TEntityVisualizarOrdem.abrir: iVisualizarOrdens;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityVisualizarOrdem.atualizar: iVisualizarOrdens;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

constructor TEntityVisualizarOrdem.create;
begin
  FTabela := 'VISUALIZAR_ORDENS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Visulizar ordens').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityVisualizarOrdem.destroy;
begin

  inherited;
end;

function TEntityVisualizarOrdem.ExecSql: iVisualizarOrdens;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityVisualizarOrdem.exportar: iVisualizarOrdens;
begin
  result := self;
end;

function TEntityVisualizarOrdem.getCampo(value: string): iVisualizarOrdens;
begin
  result := self;
  FCampo := value;
end;

function TEntityVisualizarOrdem.getDataFinal(value: TDate): iVisualizarOrdens;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityVisualizarOrdem.getDataInicial(value: TDate): iVisualizarOrdens;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityVisualizarOrdem.getValor(value: string): iVisualizarOrdens;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityVisualizarOrdem.listarGrid(value: TDataSource): iVisualizarOrdens;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID_ORDEM').DisplayLabel := 'C�digo';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('EQUIPAMENTO').DisplayLabel := 'Equipamento';
    FieldByName('DEFEITO_RELATADO').DisplayLabel := 'Defeito relatado';
    FieldByName('MARCAS').DisplayLabel := 'Marca';
    FieldByName('MODELO').DisplayLabel := 'Modelo';
    FieldByName('NUMERO_SERIE').DisplayLabel := 'N�mero de serie';
    FieldByName('DATA_FABRICACAO').DisplayLabel := 'Data de fabrica��o';
    FieldByName('LAUDO_DO_TECNICO').DisplayLabel := 'Laudo t�cnico';
    FieldByName('SOLUCAO_DO_PROBLEMA').DisplayLabel := 'Solu��o do problema';
    FieldByName('VALOR_DA_ORDEM').DisplayLabel := 'Valor da ordem';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('ACRESCIMO').DisplayLabel := 'Acr�scimo';
    FieldByName('TOTAL_ORCAMENTO').DisplayLabel := 'Total da OS';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Funcion�rio';
    FieldByName('RETORNO').DisplayLabel := 'Retorno';
    FieldByName('DATA_RETORNO').DisplayLabel := 'Data de retorno';
    FieldByName('SITUACAO_DA_ORDEM').DisplayLabel := 'Situa��o da ordem';
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcelas';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor do parcela';
    FieldByName('PGTO').DisplayLabel := 'Pgto';
    FieldByName('PRIORIDADE').DisplayLabel := 'Prioridade';
    FieldByName('DATA_ENTRADA').DisplayLabel := 'Data de entrada';
    FieldByName('DATA_FINALIZACAO').DisplayLabel := 'Data de sa�da';
    FieldByName('HORA_SAIDA').DisplayLabel := 'Hor�rio de sa�da';
    FieldByName('DATA_BASE_VENCIMENTO').DisplayLabel := 'Data base de vencimento';
    FieldByName('ID_TECNICO_RESPONSAVEL').DisplayLabel := 'C�d. T�cnico respons�vel';
    FieldByName('TECNICO_RESPONSAVEL').DisplayLabel := 'T�cnico';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';
    FieldByName('STATUS').DisplayLabel := 'Status';
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityVisualizarOrdem.new: iVisualizarOrdens;
begin
  result := self.create;
end;

function TEntityVisualizarOrdem.nomeTabela(value: string): iVisualizarOrdens;
begin
  result := self;
  FTabela := value;
end;

function TEntityVisualizarOrdem.open(value: string): iVisualizarOrdens;
begin
  FQuery.Query(FTabela);
end;

function TEntityVisualizarOrdem.ordenarGrid(column: TColumn): iVisualizarOrdens;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityVisualizarOrdem.pesquisar: iVisualizarOrdens;
begin
  result := self;
end;

function TEntityVisualizarOrdem.sqlPesquisa: iVisualizarOrdens;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityVisualizarOrdem.sqlPesquisaData: iVisualizarOrdens;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityVisualizarOrdem.sqlPesquisaEstatica: iVisualizarOrdens;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
