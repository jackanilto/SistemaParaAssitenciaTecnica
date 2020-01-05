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
    edtConfirmarFormaPagamento: TComboBox;
    Label6: TLabel;
    edtConfirmarValorRecebido: TEdit;
    Label7: TLabel;
    edtConfirmarTroco: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    lblValorParcelado: TLabel;
    edtParcelado: TComboBox;
    Label4: TLabel;
    edtDataVencimento: TDateTimePicker;
    Label5: TLabel;
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
    procedure edtParceladoChange(Sender: TObject);
  private
    procedure calcularDesconto;
    procedure validarParcelas;
    procedure calcularTroco;
    procedure parcelamentoAVista(desconto_atual: string; parcelas: Integer);
    procedure parcelamentoNaoAvista(parcelas: Integer);

  var
    totalDaVendaCalulado: CurrencY;
    totalParcelado: CurrencY;
    numeroDeParcelas: Integer;

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

procedure TFormVendaConfirmarPagamento.edtParceladoChange(Sender: TObject);
begin

  if edtParcelado.Text = EmptyStr then
    raise Exception.Create('Informe um valor para o parcelamento da venda');

  if edtParcelado.Text = '� vista' then
  begin
    lblValorParcelado.Caption := 'Valor � vista de ' +
      FormatFloat('R$ ###,##0.00', totalDaVendaCalulado);
    edtConfirmarFormaPagamento.Enabled := true;
    edtConfirmarValorRecebido.Enabled := true;
    edtConfirmarTroco.Enabled := true;
  end
  else
  begin

    if CodigoCliente <> 0 then
    begin

      lblValorParcelado.Caption := edtParcelado.Text + ' de ' +
        FormatFloat('R$ ###,##0.00', TFactory.new.calcularParcela.getvalor
        (totalDaVendaCalulado).getNumeroParcelas(StrToInt(edtParcelado.Text))
        .valorDeCadaParcela);

      edtConfirmarFormaPagamento.Enabled := false;
      edtConfirmarValorRecebido.Enabled := false;
      edtConfirmarTroco.Enabled := false;
    end
    else
    begin
      raise Exception.Create
        ('N�o � poss�vel parcelas um venda sem um cliente definido.');
    end;

  end;
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

  lblValorParcelado.Caption := 'Valor � vista de ' +
    FormatFloat('R$ ###,##0.00', totalDaVendaCalulado);

end;

procedure TFormVendaConfirmarPagamento.validarParcelas;
var
  parcela: Integer;
begin
  try
    parcela := StrToInt(edtParcelado.Text);
  except
    raise Exception.Create
      ('Informe um valor v�lido para o n�mero de parcelas.');
  end;
  if edtParcelado.Text = '0' then
    edtParcelado.Text := '1';
  if edtConfirmarTotalDaVenda.Text = EmptyStr then
    edtParcelado.Text := '1';
  if edtParcelado.Text = '1' then
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

procedure TFormVendaConfirmarPagamento.parcelamentoAVista(desconto_atual
  : string; parcelas: Integer);
begin
  FentityParcelas.getID_CLIENTE(CodigoCliente)
    .getID_VENDA(FEntityVenda.setCodigoVenda)
    .getVALOR_VENDA(CurrToStr(TotalDaVenda)).getQUANTIDADE_PARCELAS(parcelas)
    .getVALOR_DA_PARCELA(CurrToStr(totalDaVendaCalulado))
    .getDATA_VENCIMENTO(DateToStr(edtDataVencimento.Date))
    .getDesconto(desconto_atual).getTOTAL(CurrToStr(totalDaVendaCalulado))
    .gerarParcelaAvista;
end;

procedure TFormVendaConfirmarPagamento.parcelamentoNaoAvista(parcelas: Integer);
begin
  FentityParcelas.getID_CLIENTE(CodigoCliente)
    .getID_VENDA(FEntityVenda.setCodigoVenda)
    .getVALOR_VENDA(CurrToStr(totalDaVendaCalulado)).getQUANTIDADE_PARCELAS
    (parcelas).getVALOR_DA_PARCELA
    (CurrToStr(TFactory.new.calcularParcela.getvalor(totalDaVendaCalulado)
    .getNumeroParcelas(parcelas).valorDeCadaParcela))
    .getDATA_VENCIMENTO(DateToStr(edtDataVencimento.Date)).gerarParcelas;
end;

procedure TFormVendaConfirmarPagamento.FormCreate(Sender: TObject);
begin
  TFactory.new.ftTable.FD_Table('FORMAS_PAGAMENTO')
    .getCampoTabela('FORMA_PAGAMENTO').popularComponenteComboBox
    (edtConfirmarFormaPagamento);

  TFactory.new.ftTable.FD_Table('NUMERO_PARCELAS')
    .getCampoTabela('NUM_PARCELAS').popularComponenteComboBox(edtParcelado);

end;

procedure TFormVendaConfirmarPagamento.FormShow(Sender: TObject);
begin

  edtConfirmarTotalDaVenda.Text := FormatFloat('R$ ###,##0.00', TotalDaVenda);
  edtConfirmarDesconto.Text := FormatFloat('R$ ###,##0.00', 0);
  lblTotalAPagar.Caption := FormatFloat('R$ ###,##0.00', TotalDaVenda);
  edtConfirmarValorRecebido.Text := FormatFloat('R$ ###,##0.00', 0);
  edtConfirmarTroco.Text := FormatFloat('R$ ###,##0.00', 0);
  totalDaVendaCalulado := TotalDaVenda;

  edtDataVencimento.Date := Date;

  lblValorParcelado.Caption := 'Valor � vista de ' +
    FormatFloat('R$ ###,##0.00', totalDaVendaCalulado);

  FEntityVenda.inserir;

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
var
  desconto_atual: string;
  parcelas: Integer;
begin

  desconto_atual := TFactory.new.validarDocumento.limparValorRS
    (edtConfirmarDesconto.Text);

  try
    if edtParcelado.Text = '� vista' then
    begin
      parcelas := 1;
      FEntityVenda.tipoDeVenda('� vista');
    end
    else
    begin
      parcelas := StrToInt(edtParcelado.Text);
      FEntityVenda.tipoDeVenda('Parcelado');
    end;
  except
    on e: Exception do
    begin
      raise Exception.Create
        ('Informe um valor v�lido para o campo Parcelamento.');
    end;

  end;

  FEntityVenda.getID_CLIENTE(CodigoCliente).getNOME_CLIENTE(NomeCliente)
    .getDATA_VENDA(DateToStr(Date)).getHORA_VENDA(TimeToStr(time))
    .getSUBTOTAL(CurrToStr(TotalDaVenda)).getDesconto(desconto_atual)
    .getTOTAL(CurrToStr(totalDaVendaCalulado)).getQUANTIDADE_PARCELAS(parcelas)
    .getFORMA_PAGAMENTO(edtConfirmarFormaPagamento.Text).gravar;

  if edtParcelado.Text = '� vista' then
  begin
    parcelamentoAVista(desconto_atual, parcelas);
  end
  else
  begin
    parcelamentoNaoAvista(parcelas);
  end;

  FEntityItensVenda.getID_VENDA(FEntityVenda.setCodigoVenda)
    .getID_CLIENTE(CodigoCliente).gravarItensDaVenda
    (formVendas.cds_tem_produtos);

  ShowMessage('Venda efetuada com sucesso!!!');
  formVendas.lblVenda.Caption := 'Venda Finalizada - C�digo da venda: ' +
    IntToStr(FEntityVenda.setCodigoVenda);
  close;

end;

procedure TFormVendaConfirmarPagamento.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
