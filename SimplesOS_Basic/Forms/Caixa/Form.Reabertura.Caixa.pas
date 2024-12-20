unit Form.Reabertura.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UClasse.Entity.Caixa;

type
  TformReaberturaDeCaixa = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    sbIniciarCaixa: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edtTotalEmCaixa: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbFecharClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbIniciarCaixaClick(Sender: TObject);
  private
    { Private declarations }
    procedure calcularValorReabertura;

  var
    FCaixa: TEntityCaixa;
    FParcelasOS: Currency;
    FParcelasVendas: Currency;
    FEstornosOS: Currency;
    FEstornosVendas: Currency;
    FRetiradas: Currency;
    FTotalDeAbertura: Currency;
    FTotalCaixa: Currency;
  public
    { Public declarations }
  end;

var
  formReaberturaDeCaixa: TformReaberturaDeCaixa;

implementation

{$R *.dfm}

uses Form.Principal, softMeter_globalVar;

procedure TformReaberturaDeCaixa.calcularValorReabertura;
var
  FTotal: Currency;
begin

  FParcelasOS := FCaixa.calcularParcelasOS;
  FParcelasVendas := FCaixa.calcularParcelasVendas;
  FEstornosOS := FCaixa.calcularEstornosOS;
  FEstornosVendas := FCaixa.calcularEstornoVendas;
  FRetiradas := FCaixa.calcularRetiradas;
  FTotalDeAbertura := FCaixa.valorCaixaEmAberto;
  FTotal := (FParcelasOS + FParcelasVendas);// - (FEstornosOS + FEstornosVendas);
  FTotal := (FTotal + FTotalDeAbertura) - FRetiradas;

  FTotalCaixa := FTotal;

  edtTotalEmCaixa.Text := FormatFloat('R$ #,##0.00', FTotalCaixa);

end;

procedure TformReaberturaDeCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
end;

procedure TformReaberturaDeCaixa.FormCreate(Sender: TObject);
begin
  FCaixa := TEntityCaixa.create;
  dllSoftMeter.sendEvent('reabertura do caixa', 'reabertura caixa', 0);
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformReaberturaDeCaixa.FormShow(Sender: TObject);
begin
  FCaixa.infomarUltimaData(date);
  calcularValorReabertura;
end;

procedure TformReaberturaDeCaixa.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformReaberturaDeCaixa.sbIniciarCaixaClick(Sender: TObject);
begin
  FCaixa.reabrirCaixa(FTotalCaixa);
  FSituacaoDoCaixa := 'aberto';
  formPrincipal.Label7.Caption := FSituacaoDoCaixa;
  close;
end;

procedure TformReaberturaDeCaixa.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
