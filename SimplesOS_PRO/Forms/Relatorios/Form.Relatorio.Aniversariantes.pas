unit Form.Relatorio.Aniversariantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UClasse.Relatorio.Aniversariantes, UInterfaces, Vcl.ComCtrls,
  Vcl.WinXPickers;

type
  TformRelatorioClientesAniversariantes = class(TformModeloRelatorio)
    DatePicker1: TDatePicker;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DatePicker1Change(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
  var
    FAniversariante: iRelatorioAniversariantes;

  public
    { Public declarations }
  end;

var
  formRelatorioClientesAniversariantes: TformRelatorioClientesAniversariantes;

implementation

{$R *.dfm}

procedure TformRelatorioClientesAniversariantes.DatePicker1Change(
  Sender: TObject);
begin
  inherited;
  FAniversariante
                .retornarAniversariantes(DatePicker1.Date)
                .listarGrid(DataSource1);
end;

procedure TformRelatorioClientesAniversariantes.FormCreate(Sender: TObject);
begin
  inherited;
  FAniversariante := TRelatorioAniversariantes.new;
end;

procedure TformRelatorioClientesAniversariantes.FormShow(Sender: TObject);
begin
  inherited;
  FAniversariante
                .abrir
                .retornarAniversariantes(date)
                .listarGrid(DataSource1);

  DatePicker1.Date := date;

end;

procedure TformRelatorioClientesAniversariantes.sbExportarClick(
  Sender: TObject);
begin
  inherited;
  FAniversariante.exportar;
end;

procedure TformRelatorioClientesAniversariantes.sbImprimirClick(
  Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_aniversariantes.fr3');
  frxReport1.ShowReport();
end;

end.
