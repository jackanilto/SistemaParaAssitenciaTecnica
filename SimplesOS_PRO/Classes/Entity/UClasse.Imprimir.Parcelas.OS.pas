unit UClasse.Imprimir.Parcelas.OS;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityImprimirParcelas = class(TInterfacedObject, iImprimirParcelasOS)
  private

    FQuery: iConexaoQuery;
    FQueryEmpresa: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iImprimirParcelasOS;
    function getCampo(value: string): iImprimirParcelasOS;
    function getValor(value: string): iImprimirParcelasOS;
    function getDataInicial(value: TDate): iImprimirParcelasOS;
    function getDataFinal(value: TDate): iImprimirParcelasOS;
    function open(value: string): iImprimirParcelasOS;
    function pesquisar: iImprimirParcelasOS;
    function ExecSql: iImprimirParcelasOS;
    function sqlPesquisa: iImprimirParcelasOS;
    function sqlPesquisaData: iImprimirParcelasOS;
    function sqlPesquisaEstatica: iImprimirParcelasOS;
    function SelectSql(value: string): iImprimirParcelasOS;

    function abrir: iImprimirParcelasOS;
    function atualizar: iImprimirParcelasOS;
    function cancelar: iImprimirParcelasOS;
    function fecharQuery: iImprimirParcelasOS;
    function listarGrid(value: TDataSource): iImprimirParcelasOS;
    function ordenarGrid(column: TColumn): iImprimirParcelasOS;

    function selecionarParcela(value:integer):iImprimirParcelasOS;
    function selecionarEmpresa(value:TDataSource):iImprimirParcelasOS;

    function exportar: iImprimirParcelasOS;
    procedure validarData(componet: tmaskEdit);

    constructor create;
    destructor destroy; override;
    class function new: iImprimirParcelasOS;
  end;

implementation

{ TEntityImprimirParcelas }

function TEntityImprimirParcelas.abrir: iImprimirParcelasOS;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityImprimirParcelas.atualizar: iImprimirParcelasOS;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityImprimirParcelas.cancelar: iImprimirParcelasOS;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TEntityImprimirParcelas.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_OS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryEmpresa := TConexaoQuery.new.Query('EMPRESA');

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Imprimir parcelas').getCodigoFuncionario
    (funcionarioLogado);

end;

destructor TEntityImprimirParcelas.destroy;
begin

  inherited;
end;

function TEntityImprimirParcelas.ExecSql: iImprimirParcelasOS;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityImprimirParcelas.exportar: iImprimirParcelasOS;
begin
  result := self;
end;

function TEntityImprimirParcelas.fecharQuery: iImprimirParcelasOS;
begin
  FQuery.TQuery.close;
end;

function TEntityImprimirParcelas.getCampo(value: string): iImprimirParcelasOS;
begin
  result := self;
  FCampo := value;
end;

function TEntityImprimirParcelas.getDataFinal(value: TDate): iImprimirParcelasOS;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityImprimirParcelas.getDataInicial(value: TDate): iImprimirParcelasOS;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityImprimirParcelas.getValor(value: string): iImprimirParcelasOS;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityImprimirParcelas.listarGrid(value: TDataSource): iImprimirParcelasOS;
begin

  result := self;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityImprimirParcelas.new: iImprimirParcelasOS;
begin
  result := self.create;
end;

function TEntityImprimirParcelas.nomeTabela(value: string): iImprimirParcelasOS;
begin
  result := self;
  FTabela := value;
end;

function TEntityImprimirParcelas.open(value: string): iImprimirParcelasOS;
begin
  FQuery.Query(FTabela);
end;

function TEntityImprimirParcelas.ordenarGrid(column: TColumn): iImprimirParcelasOS;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityImprimirParcelas.pesquisar: iImprimirParcelasOS;
begin
  result := self;
end;

function TEntityImprimirParcelas.selecionarEmpresa(
  value: TDataSource): iImprimirParcelasOS;
begin
  result := self;
  value.DataSet := FQueryEmpresa.TQuery;
end;

function TEntityImprimirParcelas.selecionarParcela(
  value: integer): iImprimirParcelasOS;
begin

  result := self;

  with FQuery do
  begin

    FQuery.TQuery.Active := false;
    FQuery.TQuery.SQL.Clear;
    FQuery.TQuery.SQL.Add('SELECT * FROM VISUALIZAR_PARCELAS_OS WHERE ID_ORDEM =:i');
    FQuery.TQuery.ParamByName('i').AsInteger := value;
    FQuery.TQuery.Active := true;

  end;

end;

function TEntityImprimirParcelas.SelectSql(value: string): iImprimirParcelasOS;
begin

end;

function TEntityImprimirParcelas.sqlPesquisa: iImprimirParcelasOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityImprimirParcelas.sqlPesquisaData: iImprimirParcelasOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityImprimirParcelas.sqlPesquisaEstatica: iImprimirParcelasOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityImprimirParcelas.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
