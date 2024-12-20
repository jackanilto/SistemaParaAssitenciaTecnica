//Recibo dos pagamentos das parcelas da OS
unit UClasse.Imprimir.Recibo.OS;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityImprimirReciboPgtoOS = class(TInterfacedObject, iImprimirReciboPgtoParcelas)
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

    function nomeTabela(value: string): iImprimirReciboPgtoParcelas;
    function getCampo(value: string): iImprimirReciboPgtoParcelas;
    function getValor(value: string): iImprimirReciboPgtoParcelas;
    function getDataInicial(value: TDate): iImprimirReciboPgtoParcelas;
    function getDataFinal(value: TDate): iImprimirReciboPgtoParcelas;
    function open(value: string): iImprimirReciboPgtoParcelas;
    function pesquisar: iImprimirReciboPgtoParcelas;
    function ExecSql: iImprimirReciboPgtoParcelas;
    function sqlPesquisa: iImprimirReciboPgtoParcelas;
    function sqlPesquisaData: iImprimirReciboPgtoParcelas;
    function sqlPesquisaEstatica: iImprimirReciboPgtoParcelas;
    function SelectSql(value: string): iImprimirReciboPgtoParcelas;

    function abrir: iImprimirReciboPgtoParcelas;
    function atualizar: iImprimirReciboPgtoParcelas;
    function cancelar: iImprimirReciboPgtoParcelas;
    function fecharQuery: iImprimirReciboPgtoParcelas;
    function listarGrid(value: TDataSource): iImprimirReciboPgtoParcelas;
    function ordenarGrid(column: TColumn): iImprimirReciboPgtoParcelas;

    function selecionarParcela(value:integer):iImprimirReciboPgtoParcelas;
    function selecionarEmpresa(value:TDataSource):iImprimirReciboPgtoParcelas;

    function exportar: iImprimirReciboPgtoParcelas;
    procedure validarData(componet: tmaskEdit);

    constructor create;
    destructor destroy; override;
    class function new: iImprimirReciboPgtoParcelas;
  end;

implementation

{ TEntityImprimirReciboPgtoOS }

function TEntityImprimirReciboPgtoOS.abrir: iImprimirReciboPgtoParcelas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityImprimirReciboPgtoOS.atualizar: iImprimirReciboPgtoParcelas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityImprimirReciboPgtoOS.cancelar: iImprimirReciboPgtoParcelas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TEntityImprimirReciboPgtoOS.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_OS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryEmpresa := TConexaoQuery.new.Query('EMPRESA');

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Impress�o do recibo de pagamento das parcelas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityImprimirReciboPgtoOS.destroy;
begin

  inherited;
end;

function TEntityImprimirReciboPgtoOS.ExecSql: iImprimirReciboPgtoParcelas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityImprimirReciboPgtoOS.exportar: iImprimirReciboPgtoParcelas;
begin
  result := self;
end;

function TEntityImprimirReciboPgtoOS.fecharQuery: iImprimirReciboPgtoParcelas;
begin
  FQuery.TQuery.close;
end;

function TEntityImprimirReciboPgtoOS.getCampo(value: string): iImprimirReciboPgtoParcelas;
begin
  result := self;
  FCampo := value;
end;

function TEntityImprimirReciboPgtoOS.getDataFinal(value: TDate): iImprimirReciboPgtoParcelas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityImprimirReciboPgtoOS.getDataInicial(value: TDate): iImprimirReciboPgtoParcelas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityImprimirReciboPgtoOS.getValor(value: string): iImprimirReciboPgtoParcelas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityImprimirReciboPgtoOS.listarGrid(value: TDataSource): iImprimirReciboPgtoParcelas;
begin

  result := self;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityImprimirReciboPgtoOS.new: iImprimirReciboPgtoParcelas;
begin
  result := self.create;
end;

function TEntityImprimirReciboPgtoOS.nomeTabela(value: string): iImprimirReciboPgtoParcelas;
begin
  result := self;
  FTabela := value;
end;

function TEntityImprimirReciboPgtoOS.open(value: string): iImprimirReciboPgtoParcelas;
begin
  FQuery.Query(FTabela);
end;

function TEntityImprimirReciboPgtoOS.ordenarGrid(column: TColumn): iImprimirReciboPgtoParcelas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityImprimirReciboPgtoOS.pesquisar: iImprimirReciboPgtoParcelas;
begin
  result := self;
end;

function TEntityImprimirReciboPgtoOS.selecionarEmpresa(
  value: TDataSource): iImprimirReciboPgtoParcelas;
begin

  result := self;

  FQueryEmpresa.Query('EMPRESA');

  value.DataSet := FQueryEmpresa.TQuery;

end;

function TEntityImprimirReciboPgtoOS.selecionarParcela(
  value: integer): iImprimirReciboPgtoParcelas;
begin
  result := self;

  with FQuery do
  begin
    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from VISUALIZAR_PARCELAS_OS where ID_PARCELA =:i');
    TQuery.ParamByName('i').AsInteger := value;
    TQuery.Active := true;
  end;

end;

function TEntityImprimirReciboPgtoOS.SelectSql(
  value: string): iImprimirReciboPgtoParcelas;
begin

end;

function TEntityImprimirReciboPgtoOS.sqlPesquisa: iImprimirReciboPgtoParcelas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityImprimirReciboPgtoOS.sqlPesquisaData: iImprimirReciboPgtoParcelas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityImprimirReciboPgtoOS.sqlPesquisaEstatica: iImprimirReciboPgtoParcelas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityImprimirReciboPgtoOS.validarData(componet: tmaskEdit);
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
