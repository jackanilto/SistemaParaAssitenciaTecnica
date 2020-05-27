unit Form.Abertura.Caixa.Manual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RxToolEdit, RxCurrEdit, Vcl.Mask,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, UClasse.Entity.Caixa;

type
  TformAberturaDeCaixaManual = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtdataEncerramento: TMaskEdit;
    edtHorarioEncerramento: TMaskEdit;
    edtFuncionarioEncerramento: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtDataAbertura: TMaskEdit;
    edtHorarioAbertura: TMaskEdit;
    edtFuncionario: TEdit;
    edtValorInformado: TCurrencyEdit;
    Panel2: TPanel;
    sbIniciarCaixa: TSpeedButton;
    SpeedButton1: TSpeedButton;
    s_Fechamento: TDataSource;
    s_Abertura: TDataSource;
    edtValorAnterior: TCurrencyEdit;
    edtValorDeEncerramento: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure s_FechamentoDataChange(Sender: TObject; Field: TField);
    procedure s_AberturaDataChange(Sender: TObject; Field: TField);
    procedure sbIniciarCaixaClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    var
      FCaixa:TEntityCaixa;
  public
    { Public declarations }
  end;

var
  formAberturaDeCaixaManual: TformAberturaDeCaixaManual;

implementation

{$R *.dfm}

procedure TformAberturaDeCaixaManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FCaixa);
end;

procedure TformAberturaDeCaixaManual.FormCreate(Sender: TObject);
begin
  FCaixa := TEntityCaixa.create;
end;

procedure TformAberturaDeCaixaManual.FormShow(Sender: TObject);
begin
  lblCaption.Caption := self.Caption;
  FCaixa.aberturaCaixaManualSelecao(s_Fechamento, s_Abertura);
end;

procedure TformAberturaDeCaixaManual.Panel1MouseDown(Sender: TObject;
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

procedure TformAberturaDeCaixaManual.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformAberturaDeCaixaManual.sbIniciarCaixaClick(Sender: TObject);
begin
  FCaixa.iniciarCaixaManulamente(edtValorAnterior.Text, edtValorInformado.Text);
  close;
end;

procedure TformAberturaDeCaixaManual.s_AberturaDataChange(Sender: TObject;
  Field: TField);
begin

  edtDataAbertura.Text := DateToStr(Date);
  edtHorarioAbertura.Text := TimeToStr(Time);
  edtValorAnterior.Text := CurrToStr(s_Abertura.DataSet.FieldByName('VALOR_ANTERIRO').AsCurrency);
  edtValorInformado.Text := CurrToStr(s_Abertura.DataSet.FieldByName('VALOR_ANTERIRO').AsCurrency);
  edtFuncionario.Text := FCaixa.retornarNomeFuncionarioLogado;

end;

procedure TformAberturaDeCaixaManual.s_FechamentoDataChange(Sender: TObject;
  Field: TField);
begin
  edtdataEncerramento.Text := DateToStr(s_Fechamento.DataSet.FieldByName('DATA_ENCERRAMENTO').AsDateTime);
  edtHorarioEncerramento.Text := TimeToStr(s_Fechamento.DataSet.FieldByName('HORA_ENCERRAMENTO').AsDateTime);
  edtValorDeEncerramento.Text := CurrToStr(s_Fechamento.DataSet.FieldByName('VALOR_ENCERRAMENTO').AsCurrency);
  edtFuncionarioEncerramento.Text := s_Fechamento.DataSet.FieldByName('NOME_FUNCIONARIO_ENCERRAMENTO').AsString;
end;

end.
