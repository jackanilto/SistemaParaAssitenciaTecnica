unit Form.Relatorio.Reparos.Periodos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Reparos.Por.Periodo, Vcl.Mask;

type
  TEnumPesquisar = (entrada, saida);

type
  TformRelatorioReparosPorPeriodo = class(TformModeloRelatorio)
    Label1: TLabel;
    sbPesquisarDatas: TSpeedButton;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    cbPesquisarDatas: TComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);  private
    { Private declarations }
    var
      FRelatorioReparos:iRelatorioReparosPorPeriodo;
  public
    { Public declarations }
  end;

var
  formRelatorioReparosPorPeriodo: TformRelatorioReparosPorPeriodo;

implementation

{$R *.dfm}

procedure TformRelatorioReparosPorPeriodo.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioReparos.ordenarGrid(Column);
end;

procedure TformRelatorioReparosPorPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioReparos := TRelatorioReparosPeriodo.new;
end;

procedure TformRelatorioReparosPorPeriodo.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioReparos
                  .abrir
                  .getCampo('ID_ORDEM')
                  .getValor('0')
                  .sqlPesquisa
                  .listarGrid(DataSource1);
end;

procedure TformRelatorioReparosPorPeriodo.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioReparos.exportar;
end;

procedure TformRelatorioReparosPorPeriodo.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_reparos_por_periodo.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioReparosPorPeriodo.sbPesquisarDatasClick(
  Sender: TObject);
  var
     FCampo:String;
begin
  inherited;

  case TEnumPesquisar(cbPesquisarDatas.ItemIndex) of
  entrada:
  begin
    FCampo := 'DATA_DE_ENTRADA';
  end;
  saida:
  begin
    FCampo := 'DATA_SAIDA';
  end;

  end;

  FRelatorioReparos
                  .validarData(edtData1)
                  .validarData(edtData2);

  FRelatorioReparos
                  .getCampo(FCampo)
                  .getDataInicial(StrToDate(edtData1.Text))
                  .getDataFinal(StrToDate(edtData2.Text))
                  .sqlPesquisaData
                  .listarGrid(DataSource1);

end;

end.
