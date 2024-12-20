unit Form.Encerramento.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UClasse.Entity.Caixa;

type
  TformEncerramentoCaixa = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    sbIniciarCaixa: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edtParcelasRecebidasOS: TEdit;
    Label1: TLabel;
    edtParcelasRecebidasVendas: TEdit;
    Label2: TLabel;
    edtValorDeAbertura: TEdit;
    Label3: TLabel;
    edtParcelasEstornadasOS: TEdit;
    Label4: TLabel;
    edtParcelasEstornadasVendas: TEdit;
    Label5: TLabel;
    edtRetiradas: TEdit;
    Label6: TLabel;
    edtTotalDoCaixa: TEdit;
    Label7: TLabel;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbIniciarCaixaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    var
      FParcelasOS:Currency;
      FParcelasVendas:Currency;
      FEstornosOS:Currency;
      FEstornosVendas:Currency;
      FRetiradas:Currency;
      FTotalDeAbertura:Currency;
      FTotalCaixa:Currency;
    var
      FCaixa:TEntityCaixa;
    procedure calcularValorCaixaEncerramento;
  public
    { Public declarations }
  end;

var
  formEncerramentoCaixa: TformEncerramentoCaixa;

implementation

{$R *.dfm}

uses Form.Principal, softMeter_globalVar;

procedure TformEncerramentoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
end;

procedure TformEncerramentoCaixa.FormCreate(Sender: TObject);
begin
  FCaixa := TEntityCaixa.create;
  dllSoftMeter.sendEvent('encerramento do caixa', 'encerramento caixa', 0);
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformEncerramentoCaixa.FormShow(Sender: TObject);
begin

  FCaixa.infomarUltimaData(date);

  calcularValorCaixaEncerramento;

end;

procedure TformEncerramentoCaixa.calcularValorCaixaEncerramento;
var
  FTotal: Currency;
begin

  FParcelasOS := FCaixa.calcularParcelasOS;
  FParcelasVendas := FCaixa.calcularParcelasVendas;
  FEstornosOS := FCaixa.calcularEstornosOS;
  FEstornosVendas := FCaixa.calcularEstornoVendas;
  FRetiradas := FCaixa.calcularRetiradas;
  FTotalDeAbertura := FCaixa.valorCaixaEmAberto;

  edtParcelasRecebidasOS.Text := FormatFloat('R$ #,##0.00', FParcelasOS);
  edtParcelasRecebidasVendas.Text := FormatFloat('R$ #,##0.00', FParcelasVendas);
  edtParcelasEstornadasOS.Text := FormatFloat('R$ #,##0.00', FEstornosOS);
  edtParcelasEstornadasVendas.Text := FormatFloat('R$ #,##0.00', FEstornosVendas);
  edtRetiradas.Text := FormatFloat('R$ #,##0.00', FRetiradas);
  edtValorDeAbertura.Text := FormatFloat('R$ #,##0.00', FTotalDeAbertura);
  FTotal := (FParcelasOS + FParcelasVendas);// - (FEstornosOS + FEstornosVendas);
  FTotal := (FTotal + FTotalDeAbertura) - FRetiradas;
  edtTotalDoCaixa.Text := FormatFloat('R$ #,##0.00', FTotal);

  FTotalCaixa := FTotal;

end;

procedure TformEncerramentoCaixa.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TformEncerramentoCaixa.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformEncerramentoCaixa.sbIniciarCaixaClick(Sender: TObject);
begin
  FCaixa.encerrarCaixaManualmente(FTotalCaixa);
  FSituacaoDoCaixa := 'fechado';
  formPrincipal.Label7.Caption := FSituacaoDoCaixa;
  close;
end;

procedure TformEncerramentoCaixa.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
