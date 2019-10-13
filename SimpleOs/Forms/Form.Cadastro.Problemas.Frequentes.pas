unit Form.Cadastro.Problemas.Frequentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Problemas.Frequentes, Vcl.Mask;

type
  TformCadastroProblemasFrequentes = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FEntityProblemasFrequentes: iCadastroProblemasFrequentes;
  public
    { Public declarations }
  end;

var
  formCadastroProblemasFrequentes: TformCadastroProblemasFrequentes;

implementation

{$R *.dfm}

procedure TformCadastroProblemasFrequentes.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityProblemasFrequentes := TEntityProblemasFrequentes.new;
end;

procedure TformCadastroProblemasFrequentes.FormShow(Sender: TObject);
begin
  inherited;
  FEntityProblemasFrequentes.abrir.listarGrid(DataSource1)
end;

end.
