unit UDados.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Data.DB, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, Vcl.Forms, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  UClasse.Config.Acesso.Banco, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Dialogs,
  EAppProt, ECripto, UClasse.Demo;

type
  TDataModule1 = class(TDataModule)
    Conexao: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDQuery1: TFDQuery;
    FDQuery1ID: TIntegerField;
    FDQuery1JUROS: TBCDField;
    FDQuery1MULTA: TCurrencyField;
    EvAppProtect1: TEvAppProtect;
    EvCriptografa1: TEvCriptografa;
    procedure conexaoBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  var
    FConfigConexao: TConfigConexaoBanco;
    FDemo: TClasseDemo;

  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;
  funcionarioLogado: integer;
  NomeFuncionarioLogado: string;
  imagemFuncionario: Timage;

implementation

uses
  Form.Configurar.Conexcao.Banco;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataModule1.conexaoBeforeConnect(Sender: TObject);
begin
  FDPhysFBDriverLink1.VendorLib := ExtractFilePath(application.exename) +
    'fbclient.dll';
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  localizacaoBD:string;
begin

//  EvAppProtect1.Active := False;
//  EvAppProtect1.IdApplication := 75983;
//  EvAppProtect1.EvalDays := 0;
//  EvAppProtect1.EvalLoads := 0;
//  EvAppProtect1.RegKey := '\SOFTWARE\NomeDaEmpresa\SimplesOSStandart\';
//  EvAppProtect1.Active := True;

  FConfigConexao := TConfigConexaoBanco.create;

  try
    with Conexao do
    begin

      Connected := false;
      DriverName := 'FB';
      Params.Add('Server=' + FConfigConexao.hostname);
      Params.Add('Port=' + FConfigConexao.port);
      Params.Add('Database=' + FConfigConexao.localBD);
      Params.Add('User_Name=' + FConfigConexao.user);
      Params.Add('Password=' + FConfigConexao.password);
      Connected := true;

    end;

  except
    on e: EFDDBEngineException do
    begin

      Conexao.Connected := false;

      MessageDlg('Erro com a conex�o do banco de dados. ERRO: '+e.Message, mtError,
        [mbOk], 0, mbOk);

      formConfigurarConexaoBanco := TformConfigurarConexaoBanco.create(self);
      try
        formConfigurarConexaoBanco.ShowModal;
      finally
        formConfigurarConexaoBanco.Free;

        showmessage('A aplica��o ser� fechada para efetuar as configura��o.'+
        ' Por gentiliza, assim que for fechada abra novamente.'+
        ' Se o erro continuar entre em contato com o suporte.');

        halt;
      end;

    end;

  end;

  imagemFuncionario := Timage.create(nil);

end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  FConfigConexao.Free;
  FreeAndNil(imagemFuncionario);
end;

end.
