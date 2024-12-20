unit UClasse.Visualizar.Ordens.Servico.Parcelas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityVisualizarOrdemServicoParcelas = class(TInterfacedObject,
    iVisualizarParcelasOrdem)
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

    function nomeTabela(value: string): iVisualizarParcelasOrdem;
    function getCampo(value: string): iVisualizarParcelasOrdem;
    function getValor(value: string): iVisualizarParcelasOrdem;
    function getDataInicial(value: TDate): iVisualizarParcelasOrdem;
    function getDataFinal(value: TDate): iVisualizarParcelasOrdem;
    function open(value: string): iVisualizarParcelasOrdem;
    function pesquisar: iVisualizarParcelasOrdem;
    function ExecSql: iVisualizarParcelasOrdem;
    function sqlPesquisa: iVisualizarParcelasOrdem;
    function sqlPesquisaData: iVisualizarParcelasOrdem;
    function sqlPesquisaEstatica: iVisualizarParcelasOrdem;

    function abrir: iVisualizarParcelasOrdem;
    function atualizar: iVisualizarParcelasOrdem;
    function listarGrid(value: TDataSource): iVisualizarParcelasOrdem;
    function ordenarGrid(column: TColumn): iVisualizarParcelasOrdem;

    function exportar: iVisualizarParcelasOrdem;

    constructor create;
    destructor destroy; override;
    class function new: iVisualizarParcelasOrdem;
  end;

implementation

{ TEntityVisualizarOrdemServicoParcelas }

function TEntityVisualizarOrdemServicoParcelas.abrir: iVisualizarParcelasOrdem;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityVisualizarOrdemServicoParcelas.atualizar
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

constructor TEntityVisualizarOrdemServicoParcelas.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_OS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Visualizar parcelas da OS').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityVisualizarOrdemServicoParcelas.destroy;
begin

  inherited;
end;

function TEntityVisualizarOrdemServicoParcelas.ExecSql
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityVisualizarOrdemServicoParcelas.exportar
  : iVisualizarParcelasOrdem;
begin
  result := self;
end;

function TEntityVisualizarOrdemServicoParcelas.getCampo(value: string)
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FCampo := value;
end;

function TEntityVisualizarOrdemServicoParcelas.getDataFinal(value: TDate)
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityVisualizarOrdemServicoParcelas.getDataInicial(value: TDate)
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityVisualizarOrdemServicoParcelas.getValor(value: string)
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityVisualizarOrdemServicoParcelas.listarGrid(value: TDataSource)
  : iVisualizarParcelasOrdem;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_PARCELA').DisplayLabel := 'C�d. Parcela';
    FieldByName('ID_ORDEM').DisplayLabel := 'C�d. Ordem';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d.Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcelas';
    FieldByName('PARCELA').DisplayLabel := 'N�mero da parcela';
    FieldByName('VALOR_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('VALOR_TOTAL').DisplayLabel := 'Valor total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Pagamento';
    FieldByName('HORA_PAGAMENTO').DisplayLabel := 'Hora do pagamento';
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Funcion�rio';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityVisualizarOrdemServicoParcelas.new
  : iVisualizarParcelasOrdem;
begin
  result := self.create;
end;

function TEntityVisualizarOrdemServicoParcelas.nomeTabela(value: string)
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FTabela := value;
end;

function TEntityVisualizarOrdemServicoParcelas.open(value: string)
  : iVisualizarParcelasOrdem;
begin
  FQuery.Query(FTabela);
end;

function TEntityVisualizarOrdemServicoParcelas.ordenarGrid(column: TColumn)
  : iVisualizarParcelasOrdem;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityVisualizarOrdemServicoParcelas.pesquisar
  : iVisualizarParcelasOrdem;
begin
  result := self;
end;

function TEntityVisualizarOrdemServicoParcelas.sqlPesquisa
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityVisualizarOrdemServicoParcelas.sqlPesquisaData
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityVisualizarOrdemServicoParcelas.sqlPesquisaEstatica
  : iVisualizarParcelasOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
