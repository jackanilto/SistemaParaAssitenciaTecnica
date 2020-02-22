unit Form.Relatorio.Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TformRelatorioVendas = class(TformModeloRelatorio)
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioVendas: TformRelatorioVendas;

implementation

{$R *.dfm}

end.
