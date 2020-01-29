unit Form.Relatorio.Contas.A.Receber.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UClasse.Relatorio.Contas.A.Receber, UInterfaces;

type
  TformRelatorioContasAReceberOS = class(TformModeloRelatorio)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    var
      FContasAReceberOS:iRelatorioContasAReceber;
  public
    { Public declarations }
  end;

var
  formRelatorioContasAReceberOS: TformRelatorioContasAReceberOS;

implementation

{$R *.dfm}

procedure TformRelatorioContasAReceberOS.FormCreate(Sender: TObject);
begin
  inherited;
    FContasAReceberOS := TEntityRelatorioContasAReceber.new;
end;

procedure TformRelatorioContasAReceberOS.FormShow(Sender: TObject);
begin
  inherited;
    FContasAReceberOS
      .abrir
      .listarGrid(DataSource1);
end;

end.
