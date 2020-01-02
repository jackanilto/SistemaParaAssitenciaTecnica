unit Form.venda.Confirmar.Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UFactory, Vcl.Mask, Vcl.ComCtrls;

type
  TFormVendaConfirmarPagamento = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    sbConfirmarVenda: TSpeedButton;
    sbCancelarVenda: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbImprimirRecibo: TSpeedButton;
    edtConfirmarTotalDaVenda: TEdit;
    Label1: TLabel;
    edtConfirmarDesconto: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblTotalAPagar: TLabel;
    Label5: TLabel;
    edtConfirmarFormaPagamento: TComboBox;
    Label6: TLabel;
    edtConfirmarValorRecebido: TEdit;
    Label7: TLabel;
    edtConfirmarTroco: TEdit;
    Label8: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtConfirmarParcela: TEdit;
    edtConfirmarVencimento: TMaskEdit;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtConfirmarDescontoExit(Sender: TObject);
    procedure edtConfirmarDescontoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConfirmarParcelaExit(Sender: TObject);
    procedure edtConfirmarParcelaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConfirmarValorRecebidoExit(Sender: TObject);
    procedure edtConfirmarValorRecebidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbConfirmarVendaClick(Sender: TObject);
  private
    procedure calcularDesconto;
    procedure validarParcelas;
    procedure calcularTroco;

  var
    totalDaVendaCalulado: CurrencY;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendaConfirmarPagamento: TFormVendaConfirmarPagamento;

implementation

uses Form.venda;

{$R *.dfm}

procedure TFormVendaConfirmarPagamento.edtConfirmarDescontoExit
  (Sender: TObject);
begin
  calcularDesconto;
end;

procedure TFormVendaConfirmarPagamento.edtConfirmarDescontoKeyUp
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    calcularDesconto;
end;

procedure TFormVendaConfirmarPagamento.edtConfirmarParcelaExit(Sender: TObject);
begin
  validarParcelas;
end;

procedure TFormVendaConfirmarPagamento.edtConfirmarParcelaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    validarParcelas
end;

procedure TFormVendaConfirmarPagamento.edtConfirmarValorRecebidoExit
  (Sender: TObject);
begin
  calcularTroco;
end;

procedure TFormVendaConfirmarPagamento.edtConfirmarValorRecebidoKeyUp
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    calcularTroco;
end;

procedure TFormVendaConfirmarPagamento.calcularDesconto;
var
  desconto: CurrencY;
begin
  try
    desconto := StrToCurr(TFactory.new.validarDocumento.limparValorRS
      (edtConfirmarDesconto.Text));
  except
    raise Exception.Create('Informe um valor v�lido para o desconto');
  end;
  lblTotalAPagar.Caption := FormatFloat('R$ ###,##0.00',
    TotalDaVenda - desconto);

  totalDaVendaCalulado := TotalDaVenda - desconto;

end;

procedure TFormVendaConfirmarPagamento.validarParcelas;
var
  parcela: Integer;
begin
  try
    parcela := StrToInt(edtConfirmarParcela.Text);
  except
    raise Exception.Create
      ('Informe um valor v�lido para o n�mero de parcelas.');
  end;
  if edtConfirmarParcela.Text = '0' then
    edtConfirmarParcela.Text := '1';
  if edtConfirmarTotalDaVenda.Text = EmptyStr then
    edtConfirmarParcela.Text := '1';
  if edtConfirmarParcela.Text = '1' then
  begin
    edtConfirmarFormaPagamento.Enabled := true;
    edtConfirmarValorRecebido.Enabled := true;
    edtConfirmarTroco.Enabled := true;
  end
  else
  begin
    edtConfirmarFormaPagamento.Enabled := false;
    edtConfirmarValorRecebido.Enabled := false;
    edtConfirmarTroco.Enabled := false;
  end;
end;

procedure TFormVendaConfirmarPagamento.calcularTroco;
var
  valor_recebido: CurrencY;
begin
  try
    valor_recebido := StrToCurr(TFactory.new.validarDocumento.limparValorRS
      (edtConfirmarValorRecebido.Text));
  except
    raise Exception.Create
      ('Informe um valor v�lido para o campo Valor recebido');
  end;
  edtConfirmarTroco.Text := FormatFloat('R$ ###,##0.00',
    valor_recebido - totalDaVendaCalulado);
end;

procedure TFormVendaConfirmarPagamento.FormCreate(Sender: TObject);
begin
  TFactory.new.ftTable.FD_Table('FORMAS_PAGAMENTO')
    .getCampoTabela('FORMA_PAGAMENTO').popularComponenteComboBox
    (edtConfirmarFormaPagamento);
end;

procedure TFormVendaConfirmarPagamento.FormShow(Sender: TObject);
begin
  edtConfirmarTotalDaVenda.Text := FormatFloat('R$ ###,##0.00', TotalDaVenda);
  edtConfirmarDesconto.Text := FormatFloat('R$ ###,##0.00', 0);
  lblTotalAPagar.Caption := FormatFloat('R$ ###,##0.00', TotalDaVenda);
  edtConfirmarValorRecebido.Text := FormatFloat('R$ ###,##0.00', 0);
  edtConfirmarTroco.Text := FormatFloat('R$ ###,##0.00', 0);
  edtConfirmarParcela.Text := '1';
  edtConfirmarVencimento.Text := DateToStr(date);
  totalDaVendaCalulado := TotalDaVenda;
end;

procedure TFormVendaConfirmarPagamento.Panel1MouseDown(Sender: TObject;
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

procedure TFormVendaConfirmarPagamento.sbConfirmarVendaClick(Sender: TObject);
begin
  FEntityVenda.getID_CLIENTE(CodigoCliente).getNOME_CLIENTE(NomeCliente)
    .getDATA_VENDA(DateToStr(date)).getHORA_VENDA(TimeToStr(time))
    .getSUBTOTAL(CurrToStr(TotalDaVenda)).getDesconto(edtConfirmarDesconto.Text)
    .getTOTAL(CurrToStr(totalDaVendaCalulado)).getQUANTIDADE_PARCELAS
    (StrToInt(edtConfirmarParcela.Text)).getFORMA_PAGAMENTO
    (edtConfirmarFormaPagamento.Text);

end;

procedure TFormVendaConfirmarPagamento.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.