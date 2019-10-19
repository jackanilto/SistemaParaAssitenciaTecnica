unit Form.Cadastro.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Produtos;

type
  TformCadastroProdutos = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FEntityProdutos: iCadastroProdutos;
  public
    { Public declarations }
  end;

var
  formCadastroProdutos: TformCadastroProdutos;

implementation

{$R *.dfm}

procedure TformCadastroProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityProdutos := TEntityProdutos.new;
end;

procedure TformCadastroProdutos.FormShow(Sender: TObject);
begin
  inherited;
  FEntityProdutos.abrir.listarGrid(DataSource1);
end;

end.
