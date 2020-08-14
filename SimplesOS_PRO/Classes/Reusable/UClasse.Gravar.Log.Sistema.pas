unit UClasse.Gravar.Log.Sistema;

interface

uses
  UInterfaces, UDados.Conexao, System.SysUtils,
  UClasse.Query, FireDAC.Comp.Client;

type

  TGravarLogSistema = class(TInterfacedObject, iGravarLogOperacoes)
  private
    FJanela: string;
    FOperacoes: string;
    FNomeRegistro: string;
    FCodigoRegistro: string;
    FCodigoFuncionario: string;
    FQuery: TFDQuery;
    spCodigoCadastro: TFDStoredProc;
  public
    function getJanela(value: string): iGravarLogOperacoes;
    function getOperacao(value: string): iGravarLogOperacoes;
    function getNomeRegistro(value: string): iGravarLogOperacoes;
    function getCodigoRegistro(value: integer): iGravarLogOperacoes;
    function getCodigoFuncionario(value: integer): iGravarLogOperacoes;
    function gravarLog: iGravarLogOperacoes;
    function gerarCodigoCadastro: integer;
    constructor create;
    destructor destroy; override;
    class function new: iGravarLogOperacoes;
  end;

implementation

{ TGravarLogSistema }

constructor TGravarLogSistema.create;
begin

  FQuery := TFDQuery.create(nil);
  FQuery.Connection := DataModule1.Conexao;

  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from LOG_EVENTOS');
  FQuery.Active := true;

end;

destructor TGravarLogSistema.destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TGravarLogSistema.gerarCodigoCadastro: integer;
begin
  spCodigoCadastro := TFDStoredProc.create(nil);
  spCodigoCadastro.Connection := DataModule1.Conexao;
  spCodigoCadastro.StoredProcName := 'SP_GEN_LOG_EVENTOS_ID';
  spCodigoCadastro.Connection.Connected := true;
  spCodigoCadastro.Connection.DriverName := 'FB';

  spCodigoCadastro.StoredProcName := 'SP_GEN_LOG_EVENTOS_ID';
  spCodigoCadastro.Prepare;

  if spCodigoCadastro.Prepared then
  begin
    spCodigoCadastro.Prepare;
    spCodigoCadastro.ExecProc;
    result := spCodigoCadastro.ParamByName('id').AsInteger;
  end;

  spCodigoCadastro.Free;
end;

function TGravarLogSistema.getCodigoFuncionario(value: integer)
  : iGravarLogOperacoes;
begin

  result := self;
  if value = 0 then
    raise Exception.create('É necessário o código do usuário.');

  FCodigoFuncionario := value.ToString;

end;

function TGravarLogSistema.getCodigoRegistro(value: integer)
  : iGravarLogOperacoes;
begin

  result := self;

  FCodigoRegistro := value.ToString;

end;

function TGravarLogSistema.getJanela(value: string): iGravarLogOperacoes;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create
      ('Informe a janela em que esta ocorrendo a operação.');

  FJanela := value;

end;

function TGravarLogSistema.getNomeRegistro(value: string): iGravarLogOperacoes;
begin

  result := self;
  FNomeRegistro := value;

end;

function TGravarLogSistema.getOperacao(value: string): iGravarLogOperacoes;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create('Informe qual operação em andamento.');

  FOperacoes := value;

end;

function TGravarLogSistema.gravarLog: iGravarLogOperacoes;
begin

  result := self;

  FQuery.Append;

  try

    FQuery.FieldByName('ID').AsInteger := gerarCodigoCadastro;
    FQuery.FieldByName('DATA').AsDateTime := Date;
    FQuery.FieldByName('HORA').AsDateTime := Time;
    FQuery.FieldByName('ID_FUNCIONARIO').AsInteger := funcionarioLogado;
    FQuery.FieldByName('NOME_FUNCIONARIO').AsString := NomeFuncionarioLogado;
    FQuery.FieldByName('REGISTRO').AsString := FCodigoRegistro + ' -  ' +FNomeRegistro;
    FQuery.FieldByName('OPERACAO').AsString := FJanela + ' - ' + FOperacoes;

    FQuery.Post;

  except
    on e: Exception do
    begin
      raise Exception.create('Event Log. ' + e.Message);
    end;

  end;

end;

class function TGravarLogSistema.new: iGravarLogOperacoes;
begin
  result := self.create;
end;

end.
