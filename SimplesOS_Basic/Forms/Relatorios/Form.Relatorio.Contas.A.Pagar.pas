unit Form.Relatorio.Contas.A.Pagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,UInterfaces, UClasse.Relatorio.Contas.A.Pagar, Vcl.Mask;

type
  TEnumPesquisar = (codigo, conta);

type
  TEnumPesquisarStatus = (pagas, avencer, atrasadas);

type
  TEnumPesqusiarData = (vencimento, pagamento);

type
  TformRelatorioContasAPagar = class(TformModeloRelatorio)
    Label1: TLabel;
    sbPesquisarDatas: TSpeedButton;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    cbPesquisarDatas: TComboBox;
    cbPesquisarStatus: TComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure cbPesquisarStatusChange(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure cbPesquisarDatasChange(Sender: TObject);

    private
    { Private declarations }
    var
      FRelatorioContasAPagar:iRelatorioContasAPagar;
  public
    { Public declarations }
  end;

var
  formRelatorioContasAPagar: TformRelatorioContasAPagar;

implementation

{$R *.dfm}

uses softMeter_globalVar;


procedure TformRelatorioContasAPagar.cbPesquisarDatasChange(Sender: TObject);
begin
  inherited;

  if cbPesquisarDatas.Text <> EmptyStr then
    edtData1.SetFocus;

end;

procedure TformRelatorioContasAPagar.cbPesquisarStatusChange(Sender: TObject);
var
  FCampo:String;
begin
  inherited;

  case TEnumPesquisarStatus(cbPesquisarStatus.ItemIndex) of
  pagas:
  begin
    FRelatorioContasAPagar.selecionarContasPagas.listarGrid(DataSource1);
  end;
  avencer:
  begin
    FRelatorioContasAPagar.selecionarContasAVencer.listarGrid(DataSource1);
  end;
  atrasadas:
  begin
    FRelatorioContasAPagar.selecionarContasAtrasadas.listarGrid(DataSource1);
  end;
  end;

end;

procedure TformRelatorioContasAPagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with DataSource1.DataSet do
  begin

    if FieldByName('PAGO').AsString = 'Sim' then
    begin
      DBGrid1.Canvas.Brush.Color := $00FF8A4F;
      DBGrid1.Canvas.Font.Color := clwhite
    end
    else if ((FieldByName('PAGO').AsString = 'Nao') and (FieldByName('DATA_VENCIMENTO').AsDateTime < date)) then
    begin
      DBGrid1.Canvas.Brush.Color := $003C60DD;
      DBGrid1.Canvas.Font.Color := clwhite
    end
    else if FieldByName('PAGO').AsString = 'Nao'  then
    begin
      DBGrid1.Canvas.Brush.Color := $0053C124;
      DBGrid1.Canvas.Font.Color := clwhite
    end;


  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TformRelatorioContasAPagar.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioContasAPagar.ordenarGrid(Column);
end;

procedure TformRelatorioContasAPagar.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:String;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  codigo:
  begin
    FCampo := 'ID';
  end;
  conta:
  begin
    FCampo := 'CONTA';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioContasAPagar
                          .getCampo(FCampo)
                          .getValor(edtPesquisar.Text)
                          .sqlPesquisa
                          .listarGrid(DataSource1);

end;

procedure TformRelatorioContasAPagar.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioContasAPagar := TRelatorioContasAPagar.new;
  dllSoftMeter.sendEvent('relatroio de contas a pagar', 'relatorio contas a pagar', 0);
end;

procedure TformRelatorioContasAPagar.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioContasAPagar
                        .abrir
                        .getCampo('ID')
                        .getValor('0')
                        .sqlPesquisa
                        .listarGrid(DataSource1);
end;

procedure TformRelatorioContasAPagar.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioContasAPagar.exportar;
end;

procedure TformRelatorioContasAPagar.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_contas_a_pagar.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioContasAPagar.sbPesquisarDatasClick(Sender: TObject);
  var
    FCampo:String;
begin
  inherited;

  case TEnumPesqusiarData(cbPesquisarDatas.ItemIndex) of
  vencimento:
  begin
    FCampo := 'DATA_VENCIMENTO';
  end;
  pagamento:
  begin
    FCampo := 'DATA_PAGAMENTO';
  end;
  end;

  FRelatorioContasAPagar
                        .validarData(edtData1)
                        .validarData(edtData2);

  FRelatorioContasAPagar
                        .getCampo(FCampo)
                        .getDataInicial(StrToDate(edtData1.Text))
                        .getDataFinal(StrToDate(edtData2.Text))
                        .sqlPesquisaData
                        .listarGrid(DataSource1);

end;

end.
