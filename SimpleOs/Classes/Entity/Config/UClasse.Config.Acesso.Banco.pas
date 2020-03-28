unit UClasse.Config.Acesso.Banco;

interface

uses
  UClasse.Config.Conexao, Data.DB, Vcl.Dialogs, System.SysUtils, Vcl.Forms;

Type
  TConfigConexaoBanco = class(TClasseConexaoConfig)
  private

    FQueryConf: TClasseConexaoConfig;
    Fipmachine: string;
    Fhostname: string;
    FlocalBD: string;
    Fpassword: string;
    Fuser: string;
    procedure Sethostname(const Value: string);
    procedure SetlocalBD(const Value: string);
    procedure Setpassword(const Value: string);
    procedure Setuser(const Value: string);

  public

    procedure retornarDados(Value: TDataSource);
    procedure inserirDados(host, local: string);
    procedure restaurarConexao;

    property hostname: string read Fhostname write Sethostname;
    property localBD: string read FlocalBD write SetlocalBD;
    property user:string read Fuser write Setuser;
    property password:string read Fpassword write Setpassword;

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TConfigConexaoBanco }

constructor TConfigConexaoBanco.create;
begin

  FQueryConf := TClasseConexaoConfig.create;
  FQueryConf.Query('config_conexao');

  hostname := FQueryConf.retornarQuery.FieldByName('host').AsString;
  localBD := FQueryConf.retornarQuery.FieldByName('local_bd').AsString;
  user :=    FQueryConf.retornarQuery.FieldByName('user').AsString;
  password := FQueryConf.retornarQuery.FieldByName('password').AsString;

end;

destructor TConfigConexaoBanco.destroy;
begin
  FQueryConf.Free;
  inherited;
end;

procedure TConfigConexaoBanco.inserirDados(host, local: string);
begin

  try

    FQueryConf.retornarQuery.Edit;

    FQueryConf.retornarQuery.FieldByName('id').AsInteger := 1;
    FQueryConf.retornarQuery.FieldByName('host').AsString := host;
    FQueryConf.retornarQuery.FieldByName('local_bd').AsString := local;

    FQueryConf.retornarQuery.Post;
    ShowMessage('Configurações alteradas com sucesso!!!');

  except
    on e: exception do
    begin

      MessageDlg('ERRO. Não foi possível realizar as alterações. ' + e.Message,
        mtError, [mbOk], 0, mbOk);

    end;

  end;

end;

procedure TConfigConexaoBanco.restaurarConexao;
var
  local:string;
begin

  local:= ExtractFilePath(Application.ExeName);

  try

    FQueryConf.retornarQuery.Edit;

    FQueryConf.retornarQuery.FieldByName('id').AsInteger := 1;
    FQueryConf.retornarQuery.FieldByName('host').AsString := 'localhost';
    FQueryConf.retornarQuery.FieldByName('local_bd').AsString := local+'\Banco\BD_SIMPLE_OS.FDB';

    FQueryConf.retornarQuery.Post;
    ShowMessage('Configurações restauradas com sucesso!!!');

  except
    on e: exception do
    begin

      MessageDlg('ERRO. Não foi possível realizar as alterações. ' + e.Message,
        mtError, [mbOk], 0, mbOk);

    end;

  end;
end;

procedure TConfigConexaoBanco.retornarDados(Value: TDataSource);
begin
  Value.DataSet := FQueryConf.retornarQuery;
end;

procedure TConfigConexaoBanco.Sethostname(const Value: string);
begin
  Fhostname := Value;
end;

procedure TConfigConexaoBanco.SetlocalBD(const Value: string);
begin
  FlocalBD := Value;
end;

procedure TConfigConexaoBanco.Setpassword(const Value: string);
begin
  Fpassword := Value;
end;

procedure TConfigConexaoBanco.Setuser(const Value: string);
begin
  Fuser := Value;
end;

end.
