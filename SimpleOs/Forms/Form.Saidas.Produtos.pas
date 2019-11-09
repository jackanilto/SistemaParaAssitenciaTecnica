unit Form.Saidas.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TformSaidaDeProdutos = class(TformExemploEmbeded)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSaidaDeProdutos: TformSaidaDeProdutos;

implementation

{$R *.dfm}

end.
