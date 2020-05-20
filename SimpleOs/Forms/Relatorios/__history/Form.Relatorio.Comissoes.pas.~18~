unit Form.Relatorio.Comissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, UInterfaces, UClasse.Relatorio.Comissoes.Tecnico,
  Datasnap.DBClient;

type
  TEnumPesquisarData = (entrada, saida);

type
  TformComissoesTecnicos = class(TformModeloRelatorio)
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Label1: TLabel;
    cbPesquisarData: TComboBox;
    Label2: TLabel;
    sbPesquisarData: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbPesquisarDataClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    var
      FRelatorio:iRelatorioComissoesTecnico;
  public
    { Public declarations }
  end;

var
  formComissoesTecnicos: TformComissoesTecnicos;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformComissoesTecnicos.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorio := TRelatorioComissoes.new;
  dllSoftMeter.sendEvent('relatorio das comissoes', 'comissoes', 0);
end;

procedure TformComissoesTecnicos.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorio
            .abrir
            .getCampo('ID_FUNCIONARIO')
            .getValor('0')
            .sqlPesquisa
            .listarGrid(DataSource1);
end;

procedure TformComissoesTecnicos.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorio.exportar;
end;

procedure TformComissoesTecnicos.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_comissoes.fr3');
  frxReport1.ShowReport();
end;

procedure TformComissoesTecnicos.sbPesquisarDataClick(Sender: TObject);
var
  FCampo:String;
begin
  inherited;

  FRelatorio
            .validarData(edtData1)
            .validarData(edtData2);

  case TEnumPesquisarData(cbPesquisarData.ItemIndex) of
  entrada:
  begin
    FCampo := 'ENTRADA';
  end;
  saida:
  begin
    FCampo := 'SAIDA';
  end;
  end;

  FRelatorio
            .getCampo(FCampo)
            .getDataInicial(StrToDate(edtData1.Text))
            .getDataFinal(StrToDate(edtData2.Text))
            .sqlPesquisaData
            .listarGrid(DataSource1);


end;

end.
