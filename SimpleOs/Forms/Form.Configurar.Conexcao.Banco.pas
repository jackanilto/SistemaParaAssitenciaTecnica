unit Form.Configurar.Conexcao.Banco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TformConfigurarConexaoBanco = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    edtHost: TEdit;
    CheckBox1: TCheckBox;
    edtLocalDoBanco: TEdit;
    Label2: TLabel;
    Button1: TButton;
    sbConfirmar: TSpeedButton;
    sbRestaurar: TSpeedButton;
    sbCancelar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConfigurarConexaoBanco: TformConfigurarConexaoBanco;

implementation

{$R *.dfm}

procedure TformConfigurarConexaoBanco.CheckBox1Click(Sender: TObject);
begin
    if CheckBox1.Checked = true then
      begin
        edtHost.Text := 'localhost';
        edtHost.Enabled := false;
      end
      else
      begin
        edtHost.Text := '';
        edtHost.Enabled := true;
      end;

end;

procedure TformConfigurarConexaoBanco.FormShow(Sender: TObject);
begin
  lblCaption.Caption := formConfigurarConexaoBanco.Caption;
end;

procedure TformConfigurarConexaoBanco.sbCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TformConfigurarConexaoBanco.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
