unit Form.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  UFactory, UInterfaces, UClasse.Login, Form.Configurar.Conexcao.Banco;

type
  TformLogin = class(TForm)
    lblCaption: TLabel;
    SpeedButton1: TSpeedButton;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    sbEntrar: TSpeedButton;
    sbConfiguracoes: TSpeedButton;
    sbSair: TSpeedButton;
    procedure sbSairClick(Sender: TObject);
    procedure sbEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtUsuarioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AppMessage(var Msg: TMSG; var HAndled: Boolean);
    procedure sbConfiguracoesClick(Sender: TObject);
  private
    { Private declarations }
  var
    FLogin: iLogin;
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

uses
  Form.Principal;

{$R *.dfm}

procedure TformLogin.AppMessage(var Msg: TMSG; var HAndled: Boolean);
begin
  HAndled := False;
  case Msg.Message of
    WM_SYSKEYDOWN:
      if Msg.wParam = VK_F4 then
        HAndled := True; // Bloqueia o ALT+F4
  end;
end;

procedure TformLogin.edtSenhaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    sbEntrar.Click;
end;

procedure TformLogin.edtUsuarioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = 13) and (edtUsuario.Text <> EmptyStr)) then
    edtSenha.SetFocus;
end;

procedure TformLogin.FormCreate(Sender: TObject);
begin
  FLogin := TRealizarLogin.new;
  Application.OnMessage := AppMessage;
end;

procedure TformLogin.sbConfiguracoesClick(Sender: TObject);
begin

  formConfigurarConexaoBanco := TformConfigurarConexaoBanco.Create(self);
  try
    formConfigurarConexaoBanco.ShowModal;
  finally
    formConfigurarConexaoBanco.Free;
  end;

  end;

procedure TformLogin.sbEntrarClick(Sender: TObject);
begin

  FLogin.verificarUsuario(edtUsuario).verificarSenha(edtSenha);

  if FLogin.realizarLogin = true then
  begin
    started := 'yes';
    formLogin.Close;
  end
  else
  begin
    MessageDlg('Usuário ou Senha inválidos, tente novamente', mtError,
      [mbOk], 0, mbOk);
  end;

end;

procedure TformLogin.sbSairClick(Sender: TObject);
begin
   started := 'no';
   close;
end;

end.
