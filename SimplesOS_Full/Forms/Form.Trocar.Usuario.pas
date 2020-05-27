unit Form.Trocar.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, UInterfaces,
  UClasse.Login;

type
  TformTrocarDeUsuario = class(TForm)
    lblCaption: TLabel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    sbEntrar: TSpeedButton;
    sbSair: TSpeedButton;
    procedure sbSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbEntrarClick(Sender: TObject);
    procedure edtUsuarioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    var
      FLogin:iLogin;
  public
    { Public declarations }
  end;

var
  formTrocarDeUsuario: TformTrocarDeUsuario;

implementation

{$R *.dfm}

uses Form.Principal, UDados.Conexao, softMeter_globalVar;

procedure TformTrocarDeUsuario.edtSenhaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    sbEntrar.Click;
end;

procedure TformTrocarDeUsuario.edtUsuarioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = 13) and (edtUsuario.Text <> EmptyStr)) then
    edtSenha.SetFocus;
end;

procedure TformTrocarDeUsuario.FormCreate(Sender: TObject);
begin
  FLogin := TRealizarLogin.new;
  dllSoftMeter.sendEvent('form trocar de usuario', 'trocar usuario', 0);
end;

procedure TformTrocarDeUsuario.sbEntrarClick(Sender: TObject);
begin

  FLogin.verificarUsuario(edtUsuario).verificarSenha(edtSenha);

  if FLogin.realizarLogin = true then
  begin

    formPrincipal.lblFuncionario.Caption := NomeFuncionarioLogado;

    if imagemFuncionario.Picture.Graphic.Empty  then
    begin
      formPrincipal.Image1.Picture := nil;
    end
    else
    begin
     formPrincipal.Image1.Picture := imagemFuncionario.Picture;
    end;

    formTrocarDeUsuario.Close;

  end
  else
  begin
    MessageDlg('Usuário ou Senha inválidos, tente novamente', mtError,
      [mbOk], 0, mbOk);
      edtUsuario.SetFocus;
  end;
end;

procedure TformTrocarDeUsuario.sbSairClick(Sender: TObject);
begin
  close;
end;

end.
