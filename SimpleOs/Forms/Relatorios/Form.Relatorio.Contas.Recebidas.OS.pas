unit Form.Relatorio.Contas.Recebidas.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TformRelatorioContasRecebidasOS = class(TformModeloRelatorio)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioContasRecebidasOS: TformRelatorioContasRecebidasOS;

implementation

{$R *.dfm}

end.
