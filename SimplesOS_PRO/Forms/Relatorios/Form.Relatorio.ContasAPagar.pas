unit Form.Relatorio.ContasAPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TformRelatorioContasAReceber = class(TformModeloRelatorio)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioContasAReceber: TformRelatorioContasAReceber;

implementation

{$R *.dfm}

end.
