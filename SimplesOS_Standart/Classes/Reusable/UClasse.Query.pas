unit UClasse.Query;

interface

uses
  UInterfaces, UDados.Conexao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls;

type

  TConexaoQuery = class(TInterfacedObject, iConexaoQuery)
  private
    F_Query: TFDQuery;
    FCampo: string;
    FValor: string;
    FData_Inicial: TDate;
    FData_Final: TDate;
    spCodigoCadastro: TFDStoredProc;
  public
    function Query(value: string): iConexaoQuery;
    function QueryDataSet: TFDQuery;
    function DataSet(value: TDataSource): iConexaoQuery;
    function ExecSql(value: string): iConexaoQuery;
    function RefreshSql: iConexaoQuery;
    function sqlPesquisa(value: string): iConexaoQuery; overload;
    function sqlPesquisaData(value: string): iConexaoQuery; overload;
    function sqlPesquisaEstatica(value: string): iConexaoQuery;
    function getCampo(value: string): iConexaoQuery;
    function getValor(value: string): iConexaoQuery;
    function getDataInicial(value: TDate): iConexaoQuery;
    function getDataFinal(value: TDate): iConexaoQuery;
    function codigoCadastro(sp: string): integer;
    function TQuery: TFDQuery;
    constructor create;
    destructor destroy; override;
    class function new: iConexaoQuery;

  end;

implementation

{ TConexaoQuery }

function TConexaoQuery.codigoCadastro(sp: string): integer;
begin

  spCodigoCadastro := TFDStoredProc.create(nil);
  spCodigoCadastro.Connection := DataModule1.Conexao;
  spCodigoCadastro.StoredProcName := sp;
  spCodigoCadastro.Connection.Connected := true;
  spCodigoCadastro.Connection.DriverName := 'FB';

  spCodigoCadastro.StoredProcName := sp;
  spCodigoCadastro.Prepare;

  if spCodigoCadastro.Prepared then
  begin
    spCodigoCadastro.Prepare;
    spCodigoCadastro.ExecProc;
    result := spCodigoCadastro.ParamByName('id').AsInteger;
  end;

  spCodigoCadastro.Free;
end;

constructor TConexaoQuery.create;
begin

  F_Query := TFDQuery.create(nil);
  F_Query.Connection := DataModule1.Conexao;

end;

function TConexaoQuery.DataSet(value: TDataSource): iConexaoQuery;
begin
  result := self;
  F_Query.FieldByName('id').DisplayLabel := 'C�digo';
  F_Query.FieldByName('grupo').DisplayLabel := 'Grupos';
  F_Query.FieldByName('grupo').DisplayWidth := 20;
  value.DataSet := F_Query;
end;

destructor TConexaoQuery.destroy;
begin
  FreeAndNil(F_Query);
  inherited;
end;

function TConexaoQuery.ExecSql(value: string): iConexaoQuery;
begin
  result := self;
  F_Query.Open(value);
end;

function TConexaoQuery.getCampo(value: string): iConexaoQuery;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe por qual campo deseja pequisar.');
  FCampo := value;
end;

function TConexaoQuery.getDataFinal(value: TDate): iConexaoQuery;
begin
  result := self;
  FData_Final := value;
end;

function TConexaoQuery.getDataInicial(value: TDate): iConexaoQuery;
begin
  result := self;
  FData_Inicial := value;
end;

function TConexaoQuery.getValor(value: string): iConexaoQuery;
begin
  result := self;
  FValor := value;
end;

class function TConexaoQuery.new: iConexaoQuery;
begin
  result := self.create;
end;

function TConexaoQuery.Query(value: string): iConexaoQuery;
begin
  result := self;
  F_Query.Active := false;
  F_Query.SQL.Clear;
  F_Query.Open('select * from ' + value);
  F_Query.Active := true;
end;

function TConexaoQuery.TQuery: TFDQuery;
begin
  result := F_Query;
end;

function TConexaoQuery.QueryDataSet: TFDQuery;
begin
  result := F_Query;
end;

function TConexaoQuery.RefreshSql: iConexaoQuery;
begin
  result := self;
end;

function TConexaoQuery.sqlPesquisa(value: string): iConexaoQuery;
begin

  result := self;

  F_Query.Active := false;
  F_Query.SQL.Clear;
  F_Query.SQL.Add('select * from ' + value + ' where ' + FCampo +
    ' LIKE :valor');
  F_Query.ParamByName('valor').AsString := FValor + '%';
  F_Query.Active := true;

end;

function TConexaoQuery.sqlPesquisaData(value: string): iConexaoQuery;
begin

  result := self;

  F_Query.Active := false;
  F_Query.SQL.Clear;
  F_Query.SQL.Add('select * from ' + value + ' where ' + FCampo +
    ' betweeen :d1 and :d2');
  F_Query.ParamByName('d1').AsDate := FData_Inicial;
  F_Query.ParamByName('d2').AsDate := FData_Final;
  F_Query.Active := true;

end;

function TConexaoQuery.sqlPesquisaEstatica(value: string): iConexaoQuery;
begin
  result := self;

  F_Query.Active := false;
  F_Query.SQL.Clear;
  F_Query.SQL.Add('select * from ' + value + ' where ' + FCampo + ' =:valor');
  F_Query.ParamByName('valor').AsString := FValor;
  F_Query.Active := true;
end;

end.
