unit UClasse.Preparar.Imprimir.Recibo;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityPrepararRecibo = class(TInterfacedObject, iPrepararRecibo)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

  public

    function nomeTabela(value: string): iPrepararRecibo;
    function getCampo(value: string): iPrepararRecibo;
    function getValor(value: string): iPrepararRecibo;
    function getDataInicial(value: TDate): iPrepararRecibo;
    function getDataFinal(value: TDate): iPrepararRecibo;
    function open(value: string): iPrepararRecibo;
    function pesquisar: iPrepararRecibo;
    function ExecSql: iPrepararRecibo;
    function sqlPesquisa: iPrepararRecibo;
    function sqlPesquisaData: iPrepararRecibo;
    function sqlPesquisaEstatica: iPrepararRecibo;

    function abrir: iPrepararRecibo;
    function listarGrid(value: TDataSource): iPrepararRecibo;
    function ordenarGrid(column: TColumn): iPrepararRecibo;
    function atualizar: iPrepararRecibo;
    function exportar: iPrepararRecibo;
    function imprimirComprovante: iPrepararRecibo;

    constructor create;
    destructor destroy; override;
    class function new: iPrepararRecibo;
  end;

implementation

{ TEntityPrepararRecibo }

function TEntityPrepararRecibo.abrir: iPrepararRecibo;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityPrepararRecibo.atualizar: iPrepararRecibo;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

constructor TEntityPrepararRecibo.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_OS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Preparar recibo').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityPrepararRecibo.destroy;
begin

  inherited;
end;

function TEntityPrepararRecibo.ExecSql: iPrepararRecibo;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityPrepararRecibo.exportar: iPrepararRecibo;
begin
  result := self;
end;

function TEntityPrepararRecibo.getCampo(value: string): iPrepararRecibo;
begin
  result := self;
  FCampo := value;
end;

function TEntityPrepararRecibo.getDataFinal(value: TDate): iPrepararRecibo;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityPrepararRecibo.getDataInicial(value: TDate): iPrepararRecibo;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityPrepararRecibo.getValor(value: string): iPrepararRecibo;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityPrepararRecibo.imprimirComprovante: iPrepararRecibo;
begin
  result := self;

  if FQuery.TQuery.FieldByName('PGTO').AsString <> 'Sim' then
    raise Exception.create('Esta parela n�o esta quitada.');

end;

function TEntityPrepararRecibo.listarGrid(value: TDataSource): iPrepararRecibo;
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

class function TEntityPrepararRecibo.new: iPrepararRecibo;
begin
  result := self.create;
end;

function TEntityPrepararRecibo.nomeTabela(value: string): iPrepararRecibo;
begin
  result := self;
  FTabela := value;
end;

function TEntityPrepararRecibo.open(value: string): iPrepararRecibo;
begin
  FQuery.Query(FTabela);
end;

function TEntityPrepararRecibo.ordenarGrid(column: TColumn): iPrepararRecibo;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityPrepararRecibo.pesquisar: iPrepararRecibo;
begin
  result := self;
end;

function TEntityPrepararRecibo.sqlPesquisa: iPrepararRecibo;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityPrepararRecibo.sqlPesquisaData: iPrepararRecibo;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityPrepararRecibo.sqlPesquisaEstatica: iPrepararRecibo;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
