unit Form.Relatorio.Servico.Mais.Realizados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Servicos.Mais.Realizados;

type
  TformRelatorioServicosMaisRealizados = class(TformModeloRelatorio)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    var
      FRelatorioServicos:iRelatorioServicosMaisRealizados;
  public
    { Public declarations }
  end;

var
  formRelatorioServicosMaisRealizados: TformRelatorioServicosMaisRealizados;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioServicosMaisRealizados.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioServicos := TRelatorioServicosMaisRealizados.new;
  dllSoftMeter.sendEvent('relatorio de servicos mais realizados', 'rel serv mais real', 0);
end;

procedure TformRelatorioServicosMaisRealizados.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioServicos
                    .abrir
                    .servicosMaisRealizados
                    .listarGrid(DataSource1);
end;

procedure TformRelatorioServicosMaisRealizados.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioServicos.exportar;
end;

procedure TformRelatorioServicosMaisRealizados.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_servicos_mais_realizados.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioServicosMaisRealizados.SpeedButton1Click(
  Sender: TObject);
begin
  inherited;
  FRelatorioServicos.servicosMaisRealizados.listarGrid(DataSource1);
end;

procedure TformRelatorioServicosMaisRealizados.SpeedButton2Click(
  Sender: TObject);
begin
  inherited;
  FRelatorioServicos.servicosMenosRealizados.listarGrid(DataSource1);
end;

end.
