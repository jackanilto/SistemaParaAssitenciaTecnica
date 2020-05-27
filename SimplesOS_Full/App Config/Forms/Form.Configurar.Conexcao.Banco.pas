unit Form.Configurar.Conexcao.Banco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UClasse.Config.Acesso.Banco, Data.DB;

type
  TformConfigurarConexaoBanco = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    edtHost: TEdit;
    edtLocalDoBanco: TEdit;
    Label2: TLabel;
    Button1: TButton;
    sbConfirmar: TSpeedButton;
    sbRestaurar: TSpeedButton;
    sbCancelar: TSpeedButton;
    DataSource1: TDataSource;
    OpenDialog1: TOpenDialog;
    edtUserName: TEdit;
    edtPassword: TEdit;
    edtPort: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbConfirmarClick(Sender: TObject);
    procedure sbRestaurarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    var
      FConfConexao:TConfigConexaoBanco;
  public
    { Public declarations }
  end;

var
  formConfigurarConexaoBanco: TformConfigurarConexaoBanco;

implementation

{$R *.dfm}

procedure TformConfigurarConexaoBanco.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtLocalDoBanco.Text := OpenDialog1.FileName;
end;

procedure TformConfigurarConexaoBanco.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin

 edtHost.Text := DataSource1.DataSet.FieldByName('host').AsString;
 edtLocalDoBanco.Text := DataSource1.DataSet.FieldByName('local_bd').AsString;
 edtUserName.Text := DataSource1.DataSet.FieldByName('user').AsString;
 edtPassword.Text := DataSource1.DataSet.FieldByName('password').AsString;
 edtPort.Text := DataSource1.DataSet.FieldByName('port').AsString;


end;

procedure TformConfigurarConexaoBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FConfConexao);
end;

procedure TformConfigurarConexaoBanco.FormCreate(Sender: TObject);
begin
  FConfConexao := TConfigConexaoBanco.create;
end;

procedure TformConfigurarConexaoBanco.FormShow(Sender: TObject);
begin
  FConfConexao.retornarDados(DataSource1);
  lblCaption.Caption := formConfigurarConexaoBanco.Caption;
end;

procedure TformConfigurarConexaoBanco.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TformConfigurarConexaoBanco.sbCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TformConfigurarConexaoBanco.sbConfirmarClick(Sender: TObject);
begin

  if edtHost.Text = EmptyStr then
    raise Exception.Create('ERRO. Informe um endere�o de ip v�lido');

  if edtLocalDoBanco.Text = EmptyStr then
     raise Exception.Create('ERRO. Informe a localiza��o do banco de dados que ir� utilizar');

  if edtUserName.Text = EmptyStr then
     raise Exception.Create('ERRO. Informe o usu�rio padr�o do sistema');

  if edtPassword.Text = EmptyStr then
     raise Exception.Create('ERRO. Informe a senha de conex�o com o banco de dados');

  if edtPort.Text = EmptyStr then
    raise Exception.Create('ERRO. Informe a  porta de conex�o com o banco de dados');


     FConfConexao.inserirDados(edtHost.Text, edtLocalDoBanco.Text, edtUserName.Text, edtPassword.Text, edtPort.Text);

end;

procedure TformConfigurarConexaoBanco.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformConfigurarConexaoBanco.sbRestaurarClick(Sender: TObject);
begin
  FConfConexao.restaurarConexao;
  close;
end;

end.
