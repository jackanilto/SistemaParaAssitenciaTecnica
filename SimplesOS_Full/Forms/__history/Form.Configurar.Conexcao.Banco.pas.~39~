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
    procedure FormShow(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbConfirmarClick(Sender: TObject);
    procedure sbRestaurarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses Form.Principal;

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

procedure TformConfigurarConexaoBanco.sbCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TformConfigurarConexaoBanco.sbConfirmarClick(Sender: TObject);
begin

  if edtHost.Text = EmptyStr then
    MessageDlg('ERRO. Informe um endereço de ip válido', mtError, [mbOk], 0, mbOk);

  if edtLocalDoBanco.Text = EmptyStr then
     MessageDlg('ERRO. Informe a localização do banco de dados que irá utilizar', mtError, [mbOk], 0, mbOk);

     FConfConexao.inserirDados(edtHost.Text, edtLocalDoBanco.Text);

     showmessage('O sistema será fechado para validar as configurações.' +
     'Assim que encerrar por favor abra novamente o sistema para prosseguir com o trabalho.');
     started := 'no';
     application.Terminate;

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
