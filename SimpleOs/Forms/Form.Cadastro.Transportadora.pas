unit Form.Cadastro.Transportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Transportadora;

type
  TformCadastroTransportadora = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit18: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Edit19: TEdit;
    Label21: TLabel;
    sbPesquisarCep: TSpeedButton;
    Edit20: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FEntityTranspostadora: iCadastroTransportadora;
  public
    { Public declarations }
  end;

var
  formCadastroTransportadora: TformCadastroTransportadora;

implementation

{$R *.dfm}

procedure TformCadastroTransportadora.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityTranspostadora := TEntityCadastroTransportadora.new;
end;

procedure TformCadastroTransportadora.FormShow(Sender: TObject);
begin
  inherited;
  FEntityTranspostadora.abrir.listarGrid(DataSource1);
end;

end.
