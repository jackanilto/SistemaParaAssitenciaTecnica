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
