unit Form.Relatorio.OS.Por.Status;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.OS.Situacao, Vcl.Mask, UFactory;

type
  TEnumPesquisar = (entrada, saida);

type
  TformRelatorioOSPorStatus = class(TformModeloRelatorio)
    Bevel2: TBevel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    cbPesquisarSituacaoPersonalizado: TComboBox;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    sbPesquisarDatas: TSpeedButton;
    Label2: TLabel;
    cbCampo: TComboBox;
    Label3: TLabel;
    Label6: TLabel;
    cbPesquisarSituacao: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbPesquisarSituacaoChange(Sender: TObject);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    FRelatorioSituacao:iRelatorioOSPorSituacao;
  public
    { Public declarations }
  end;

var
  formRelatorioOSPorStatus: TformRelatorioOSPorStatus;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioOSPorStatus.cbPesquisarSituacaoChange(Sender: TObject);
begin
  inherited;
  FRelatorioSituacao
                  .getCampo('SITUACAO_DA_ORDEM')
                  .getValor(cbPesquisarSituacao.Text)
                  .sqlPesquisa
                  .listarGrid(DataSource1);
end;

procedure TformRelatorioOSPorStatus.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioSituacao.ordenarGrid(Column);
end;

procedure TformRelatorioOSPorStatus.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioSituacao := TRelatorioOSSituacao.new;
  TFactory
        .new
        .ftTable.FD_Table('SITUACAO_ORDEM')
        .getCampoTabela('SITUACAO_ORDEM')
        .popularComponenteComboBox(cbPesquisarSituacao);

  TFactory
        .new
        .ftTable.FD_Table('SITUACAO_ORDEM')
        .getCampoTabela('SITUACAO_ORDEM')
        .popularComponenteComboBox(cbPesquisarSituacaoPersonalizado);

  dllSoftMeter.sendEvent('relatorio OS por status', 'rel os status', 0);

end;

procedure TformRelatorioOSPorStatus.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioSituacao
                  .abrir
                  .getCampo('ID_ORDEM')
                  .getValor('0')
                  .sqlPesquisa
                  .listarGrid(DataSource1);
end;

procedure TformRelatorioOSPorStatus.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioSituacao.exportar;
end;

procedure TformRelatorioOSPorStatus.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_situacao_os.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioOSPorStatus.sbPesquisarDatasClick(Sender: TObject);
var
  FCampo : String;
begin
  inherited;



  case TEnumPesquisar(cbCampo.ItemIndex) of
  entrada:
  begin
    FCampo:='DATA_DE_ENTRADA';
  end;
  saida:
  begin
    FCampo:='DATA_SAIDA';
  end;
  end;

  FRelatorioSituacao
                  .validarData(edtData1)
                  .validarData(edtData2);

  if cbCampo.Text <> EmptyStr then
   begin
     FRelatorioSituacao
                      .getCampo(FCampo)
                      .getSituacao(cbPesquisarSituacaoPersonalizado.Text)
                      .getDataInicial(StrToDate(edtData1.Text))
                      .getDataFinal(StrToDate(edtData2.Text))
                      .selecionarOSPorSituacaoECampo
                      .listarGrid(DataSource1);
   end
   else
   ShowMessage('Error!');


end;

end.
