unit Form.Entradas.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Entradas.Produtos;

type
  TformEntradaDeProdutos = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FEntityEntradas: iEntradaProdutos;
  public
    { Public declarations }
  end;

var
  formEntradaDeProdutos: TformEntradaDeProdutos;

implementation

{$R *.dfm}

procedure TformEntradaDeProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityEntradas := TEntityEntradasProdutos.new;
end;

procedure TformEntradaDeProdutos.FormShow(Sender: TObject);
begin
  inherited;
  FEntityEntradas.abrir.listarGrid(DataSource1);
end;

end.
