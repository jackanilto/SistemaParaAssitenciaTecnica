unit Form.venda.Confirmar.Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UFactory, Vcl.Mask, Vcl.ComCtrls, frxClass, frxDBSet, Data.DB, UInterfaces,
  UClasse.Imprimir.Recibo, UClasse.Entity.Dados.Empresa,
  UClasse.Imprimir.Parcelas;

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
    frxDB_ImprimirRecibo: TfrxDBDataset;
    frx_ImprimirRecibo: TfrxReport;
    frx_ImprimirParcelas: TfrxReport;
    frxDB_ImprimirParcelas: TfrxDBDataset;
    s_ImprimirRecibo: TDataSource;
    s_ImprimirParcelas: TDataSource;
    s_DadosEmpresa: TDataSource;
    frxDB_Empresa: TfrxDBDataset;
    frxDB_ImprimirReciboItens: TfrxDBDataset;
    s_ImprimirReciboItens: TDataSource;
    s_jurosMulta: TDataSource;
    frxDB_JurosMulta: TfrxDBDataset;
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
    procedure sbCancelarVendaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbImprimirReciboClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure calcularDesconto;
    procedure validarParcelas;
    procedure calcularTroco;
    procedure parcelamentoAVista(desconto_atual: string; Parcelas: Integer);
    procedure parcelamentoNaoAvista(Parcelas: Integer);

  var
    FImprimirRecibo: iImprimirRecibo;
    FVisualizarDadosEmpresa: iDadosEmpresa;
    FImprimirParcelas: iImprimirParcelasVendas;

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

  if edtParcelado.Text = 'À vista' then
  begin
    lblValorParcelado.Caption := 'Valor à vista de ' +
      FormatFloat('R$ ###,##0.00', totalDaVendaCalulado);
    edtConfirmarFormaPagamento.Enabled := true;
    edtConfirmarValorRecebido.Enabled := true;
    edtConfirmarTroco.Enabled := true;
    sbConfirmarVenda.Enabled := true;
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
      sbConfirmarVenda.Enabled := true;
    end
    else
    begin
      sbConfirmarVenda.Enabled := false;
      raise Exception.Create
        ('Não é possível parcelas um venda sem um cliente definido.');
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
    raise Exception.Create('Informe um valor válido para o desconto');
  end;
  lblTotalAPagar.Caption := FormatFloat('R$ ###,##0.00',
    TotalDaVenda - desconto);

  totalDaVendaCalulado := TotalDaVenda - desconto;

  lblValorParcelado.Caption := 'Valor à vista de ' +
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
      ('Informe um valor válido para o número de parcelas.');
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
      ('Informe um valor válido para o campo Valor recebido');
  end;
  edtConfirmarTroco.Text := FormatFloat('R$ ###,##0.00',
    valor_recebido - totalDaVendaCalulado);
end;

procedure TFormVendaConfirmarPagamento.parcelamentoAVista(desconto_atual
  : string; Parcelas: Integer);
begin
  FentityParcelas.getID_CLIENTE(CodigoCliente)
    .getID_VENDA(FEntityVenda.setCodigoVenda)
    .getVALOR_VENDA(CurrToStr(TotalDaVenda)).getQUANTIDADE_PARCELAS(Parcelas)
    .getVALOR_DA_PARCELA(CurrToStr(totalDaVendaCalulado))
    .getDATA_VENCIMENTO(DateToStr(edtDataVencimento.Date))
    .getDesconto(desconto_atual).getTOTAL(CurrToStr(totalDaVendaCalulado))
    .getFormaPagamento(edtConfirmarFormaPagamento.Text)
    .gerarParcelaAvista;
end;

procedure TFormVendaConfirmarPagamento.parcelamentoNaoAvista(Parcelas: Integer);
begin
  FentityParcelas.getID_CLIENTE(CodigoCliente)
    .getID_VENDA(FEntityVenda.setCodigoVenda)
    .getVALOR_VENDA(CurrToStr(totalDaVendaCalulado)).getQUANTIDADE_PARCELAS
    (Parcelas).getVALOR_DA_PARCELA
    (CurrToStr(TFactory.new.calcularParcela.getvalor(totalDaVendaCalulado)
    .getNumeroParcelas(Parcelas).valorDeCadaParcela))
    .getDATA_VENCIMENTO(DateToStr(edtDataVencimento.Date)).gerarParcelas;
end;

procedure TFormVendaConfirmarPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  formVendas.limparDados;
end;

procedure TFormVendaConfirmarPagamento.FormCreate(Sender: TObject);
begin
  TFactory.new.ftTable.FD_Table('FORMAS_PAGAMENTO')
    .getCampoTabela('FORMA_PAGAMENTO').popularComponenteComboBox
    (edtConfirmarFormaPagamento);

  TFactory.new.ftTable.FD_Table('NUMERO_PARCELAS')
    .getCampoTabela('NUM_PARCELAS').popularComponenteComboBox(edtParcelado);

  FImprimirRecibo := TImprimirRecibo.new;
  FVisualizarDadosEmpresa := TEntityCadastroDadosEmpresa.new;
  FImprimirParcelas := TImprimirParcelasVenda.new;

end;

procedure TFormVendaConfirmarPagamento.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 113 then
    if sbConfirmarVenda.Enabled = true then
      sbConfirmarVenda.Click;

  if Key = 27 then
    if sbCancelarVenda.Enabled = true then
      sbCancelarVenda.Click;

end;

procedure TFormVendaConfirmarPagamento.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
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

  lblValorParcelado.Caption := 'Valor à vista de ' +
    FormatFloat('R$ ###,##0.00', totalDaVendaCalulado);

  FEntityVenda.inserir;

  FVisualizarDadosEmpresa.abrir.listarGrid(s_DadosEmpresa);

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

procedure TFormVendaConfirmarPagamento.sbCancelarVendaClick(Sender: TObject);
begin
  if application.MessageBox('Deseja realemente cancelar esta Venda?',
    'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = mryes then
  begin
    formVendas.limparDados;
    close;
  end;
end;

procedure TFormVendaConfirmarPagamento.sbConfirmarVendaClick(Sender: TObject);
var
  desconto_atual: string;
  Parcelas: Integer;
begin

  desconto_atual := TFactory.new.validarDocumento.limparValorRS
    (edtConfirmarDesconto.Text);

  try
    if edtParcelado.Text = 'À vista' then
    begin
      Parcelas := 1;
      FEntityVenda.tipoDeVenda('à vista');
    end
    else
    begin
      Parcelas := StrToInt(edtParcelado.Text);
      FEntityVenda.tipoDeVenda('Parcelado');
    end;
  except
    on e: Exception do
    begin
      raise Exception.Create
        ('Informe um valor válido para o campo Parcelamento.');
    end;

  end;

  FEntityVenda.getID_CLIENTE(CodigoCliente).getNOME_CLIENTE(NomeCliente)
    .getDATA_VENDA(DateToStr(Date)).getHORA_VENDA(TimeToStr(time))
    .getSUBTOTAL(CurrToStr(TotalDaVenda)).getDesconto(desconto_atual)
    .getTOTAL(CurrToStr(totalDaVendaCalulado)).getQUANTIDADE_PARCELAS(Parcelas)
    .getFORMA_PAGAMENTO(edtConfirmarFormaPagamento.Text)
    .getVENCIMENTO(DateToStr(edtDataVencimento.Date)).gravar;

  if edtParcelado.Text = 'À vista' then
  begin
    parcelamentoAVista(desconto_atual, Parcelas);
  end
  else
  begin
    parcelamentoNaoAvista(Parcelas);
  end;

  FEntityItensVenda.getID_VENDA(FEntityVenda.setCodigoVenda)
    .getID_CLIENTE(CodigoCliente).gravarItensDaVenda
    (formVendas.cds_tem_produtos).decrementarEstoque
    (formVendas.cds_tem_produtos);

  sbImprimir.Enabled := true;
  sbImprimirRecibo.Enabled := true;
  sbConfirmarVenda.Enabled := false;
  sbCancelarVenda.Enabled := false;

  ShowMessage('Venda efetuada com sucesso!!!');
  formVendas.lblVenda.Caption := 'Venda Finalizada - Código da venda: ' +
    IntToStr(FEntityVenda.setCodigoVenda);

  FImprimirRecibo.selecionarVenda(FEntityVenda.setCodigoVenda)
    .retornarDataSet(s_ImprimirRecibo).selecionarItens
    (FEntityVenda.setCodigoVenda).retornarDataSetItens(s_ImprimirReciboItens);

  FImprimirParcelas.selecionarParcelas(FEntityVenda.setCodigoVenda)
    .retornarDataSet(s_ImprimirParcelas).retonarJurosMultaAtraso(s_jurosMulta);

  // close;

end;

procedure TFormVendaConfirmarPagamento.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFormVendaConfirmarPagamento.sbImprimirClick(Sender: TObject);
begin
  frx_ImprimirParcelas.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/carne_pagamento.fr3');
  frx_ImprimirParcelas.ShowReport();
end;

procedure TFormVendaConfirmarPagamento.sbImprimirReciboClick(Sender: TObject);
begin
  frx_ImprimirRecibo.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/comprovante_pagamento_venda.fr3');
  frx_ImprimirRecibo.ShowReport();
end;

end.
