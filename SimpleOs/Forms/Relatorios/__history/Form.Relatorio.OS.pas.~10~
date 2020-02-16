unit Form.Relatorio.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.OS, Vcl.Menus;

type
  TformRelatorioOrdemDeServico = class(TformModeloRelatorio)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    popM_ServicosRealiados: TPopupMenu;
    popM_Ocorrencias: TPopupMenu;
    Exportar1: TMenuItem;
    Imprimir1: TMenuItem;
    I1: TMenuItem;
    Imprimir2: TMenuItem;
    s_ServicosRealizados: TDataSource;
    s_Ocorrencias: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    var
      FRelatorioOS:iRelatorioOS;
  public
    { Public declarations }
  end;

var
  formRelatorioOrdemDeServico: TformRelatorioOrdemDeServico;

implementation

{$R *.dfm}

procedure TformRelatorioOrdemDeServico.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    FRelatorioOS.listarGridServicos(s_ServicosRealizados);
  end;
end;

procedure TformRelatorioOrdemDeServico.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioOS := TRelatorioOS.new;
end;

procedure TformRelatorioOrdemDeServico.FormShow(Sender: TObject);
begin
  inherited;
   FRelatorioOS
              .abrir
              .listarGrid(DataSource1);
end;

end.
