unit Form.Relatorio.Historico.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Relatorio.Clientes, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TformRelatorioHistoricoOS = class(TformRelatorioClientes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelatorioHistoricoOS: TformRelatorioHistoricoOS;

implementation

{$R *.dfm}

end.
