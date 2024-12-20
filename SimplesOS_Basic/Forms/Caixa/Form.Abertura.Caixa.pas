unit Form.Abertura.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Data.DB, RxToolEdit, RxCurrEdit;

type
  TformIniciarCaixa = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    sbIniciarCaixa: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edtValorDeEncerramento: TEdit;
    edtdataEncerramento: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtHorarioEncerramento: TMaskEdit;
    Label3: TLabel;
    edtFuncionarioEncerramento: TEdit;
    Label4: TLabel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    edtDataAbertura: TMaskEdit;
    edtHorarioAbertura: TMaskEdit;
    edtValorAnterior: TEdit;
    edtFuncionario: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtValorInformado: TCurrencyEdit;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbIniciarCaixaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    procedure CalcularValoresDosCaixas;
    procedure caixaNaoIniciado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formIniciarCaixa: TformIniciarCaixa;

implementation

uses Form.Principal, softMeter_globalVar;

{$R *.dfm}

procedure TformIniciarCaixa.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin

  with DataSource1.DataSet do
  begin

   edtValorDeEncerramento.Text := FormatFloat( 'R$ #,##0.00' ,FieldByName('VALOR_ENCERRAMENTO').AsCurrency);

    if FieldByName('DATA_ENCERRAMENTO').AsDateTime <> StrToDate('30/12/1899') then
      edtdataEncerramento.Text := DateToStr(FieldByName('DATA_ENCERRAMENTO').AsDateTime);

    if FieldByName('HORA_ENCERRAMENTO').AsDateTime <> StrToTime('00:00:00') then
      edtHorarioEncerramento.Text := TimeToStr(FieldByName('HORA_ENCERRAMENTO').AsDateTime);

   edtFuncionarioEncerramento.Text := FieldByName('NOME_FUNCIONARIO_ENCERRAMENTO').AsString;


  end;

end;

procedure TformIniciarCaixa.FormCreate(Sender: TObject);
begin
  dllSoftMeter.sendEvent('abertura do caixa inicial', 'abertura caixa', 0);
end;

procedure TformIniciarCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    if sbIniciarCaixa.Enabled = true then
      sbIniciarCaixa.Click;
end;

procedure TformIniciarCaixa.FormShow(Sender: TObject);
begin

  CalcularValoresDosCaixas;

  if FProcessoCaixa.verificarSituacaoCaixa = 'nao foi iniciado' then
  begin

    caixaNaoIniciado;

  end
  else if FProcessoCaixa.verificarSituacaoCaixa = 'encerrar caixa anterior' then
  begin

    FProcessoCaixa.fecharCaixa(DataSource1);
    FProcessoCaixa.inicarCaixa(DataSource2);

    edtDataAbertura.Text := DateToStr(Date);
    edtHorarioAbertura.Text := TimeToStr(Time);
    edtValorAnterior.Text := FormatFloat('R$ #,##0.00', DataSource1.DataSet.FieldByName('VALOR_ENCERRAMENTO').AsCurrency);
    edtValorInformado.Text := CurrToStr(DataSource1.DataSet.FieldByName('VALOR_ENCERRAMENTO').AsCurrency);
    edtFuncionario.Text := FProcessoCaixa.retornarNomeFuncionario;
  end
  else if FProcessoCaixa.verificarSituacaoCaixa = 'iniciar novo caixa' then
  begin
  //    FProcessoCaixa.fecharCaixa(DataSource1);

    FProcessoCaixa.obertUltimoValorDoCaixaFechado(DataSource1);
    FProcessoCaixa.inicarCaixa(DataSource2);

    edtDataAbertura.Text := DateToStr(Date);
    edtHorarioAbertura.Text := TimeToStr(Time);
    edtValorAnterior.Text := FormatFloat('R$ #,##0.00', DataSource1.DataSet.FieldByName('VALOR_ENCERRAMENTO').AsCurrency);
    edtValorInformado.Text := CurrToStr(DataSource1.DataSet.FieldByName('VALOR_ENCERRAMENTO').AsCurrency);
    edtFuncionario.Text := FProcessoCaixa.retornarNomeFuncionario;



  end
  else if FProcessoCaixa.verificarSituacaoCaixa = 'fechado' then
  begin

    caixaNaoIniciado;

    FProcessoCaixa.obertUltimoValorDoCaixaFechado(DataSource1);
    edtDataAbertura.Text := DateToStr(Date);
    edtHorarioAbertura.Text := TimeToStr(Time);
    edtValorAnterior.Text := FormatFloat('R$ #,##0.00', DataSource1.DataSet.FieldByName('VALOR_ENCERRAMENTO').AsCurrency);
    edtValorInformado.Text := CurrToStr(DataSource1.DataSet.FieldByName('VALOR_ENCERRAMENTO').AsCurrency);
    edtFuncionario.Text := FProcessoCaixa.retornarNomeFuncionario;

  end;


end;

procedure TformIniciarCaixa.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;
procedure TformIniciarCaixa.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformIniciarCaixa.sbIniciarCaixaClick(Sender: TObject);
begin
  FProcessoCaixa.gravarInicioDoCaixa(StrToCurr(edtValorInformado.Text));
  FSituacaoDoCaixa := 'aberto';
  formIniciarCaixa.Close;
end;

procedure TformIniciarCaixa.SpeedButton1Click(Sender: TObject);
begin
  formIniciarCaixa.Close;
end;

procedure TformIniciarCaixa.CalcularValoresDosCaixas;
begin
  FProcessoCaixa.calcularEstornosOS;
  FProcessoCaixa.calcularParcelasOS;
  FProcessoCaixa.calcularEstornoVendas;
  FProcessoCaixa.calcularParcelasVendas;
  FProcessoCaixa.calcularRetiradas;
  FProcessoCaixa.ultimoValorDoCaixa;
  FProcessoCaixa.valorCaixaFechado;
  FProcessoCaixa.valorCaixaEmAberto;
  FProcessoCaixa.calcularValorCaixa;
end;

procedure TformIniciarCaixa.caixaNaoIniciado;
begin
  //    FProcessoCaixa.fecharCaixa(DataSource1);
  FProcessoCaixa.inicarCaixa(DataSource2);
  edtValorDeEncerramento.Text := 'R$ 0,00';
  edtFuncionarioEncerramento.Text := '0';
  edtDataAbertura.Text := DateToStr(Date);
  edtHorarioAbertura.Text := TimeToStr(Time);
  edtValorAnterior.Text := FormatFloat('R$ #,##0.00', FProcessoCaixa.calcularValorCaixa);
  edtValorInformado.Text := CurrToStr(FProcessoCaixa.calcularValorCaixa);
  edtFuncionario.Text := FProcessoCaixa.retornarNomeFuncionario;
end;

end.
