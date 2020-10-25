unit Form.Quitar.Parcela.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, UInterfaces,
  UClasse.Entity.Quitar.Parcelas.Vendas, Vcl.DBCtrls, Vcl.Mask, UFactory,
  frxClass, frxDBSet, UClasse.Imprimir.Parcelas, Vcl.ComCtrls,
  UClasse.Imprimir.Recibo, UClasse.Ativar.Desativar.Botoes.Quitar.Parcelas,
  RxToolEdit, RxCurrEdit, Vcl.Menus;

type
  TEnumPesquisar = (Parcela, Venda, codigo_cliente);

type
  TformQuitarParcelasVendas = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    sbQuitarParela: TSpeedButton;
    sbEstornar: TSpeedButton;
    sbAdicionarParcela: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbExcluir: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    sbCancelar: TSpeedButton;
    sbImprimirParcelas: TSpeedButton;
    sbExportar: TSpeedButton;
    sbImprimir: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    edtTotalDeParcelas: TEdit;
    Label1: TLabel;
    edtParcelaSelecionada: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtPago: TEdit;
    Label13: TLabel;
    DBNavigator1: TDBNavigator;
    edtDataDeVencimento: TMaskEdit;
    edtFormaDePagamento: TComboBox;
    s_DadosEmpresa: TDataSource;
    frxDB_Empresa: TfrxDBDataset;
    s_ImprimirRecibo: TDataSource;
    s_ImprimirParcelas: TDataSource;
    frx_ImprimirParcelas: TfrxReport;
    frx_ImprimirRecibo: TfrxReport;
    s_ImprimirReciboItens: TDataSource;
    s_jurosMulta: TDataSource;
    frxDB_JurosMulta: TfrxDBDataset;
    frxDB_ImprimirReciboItens: TfrxDBDataset;
    frxDB_ImprimirRecibo: TfrxDBDataset;
    frxDB_ImprimirParcelas: TfrxDBDataset;
    edtDataDePagamento: TDateTimePicker;
    frxDB_RecidoParcela: TfrxDBDataset;
    frx_ReciboParcela: TfrxReport;
    edtValorDaParcela: TCurrencyEdit;
    edtJuros: TCurrencyEdit;
    edtMulta: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    edtTotalAPagar: TCurrencyEdit;
    PopupMenu1: TPopupMenu;
    Editarparcelaselecionada1: TMenuItem;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sbQuitarParelaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbEstornarClick(Sender: TObject);
    procedure sbAdicionarParcelaClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbImprimirParcelasClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtDescontoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbPesquisarChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Editarparcelaselecionada1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ativarBotoes;
    procedure desativarBotoes;
    procedure calcularDesconto;
    procedure imprimirReciboPagamento;

  var
    FentityVisulizarParcelasVenda: iQuitarParcelasVenda;
    FVisualizarDadosEmpresa: iDadosEmpresa;
    FImprimirParcelas: iImprimirParcelasVendas;
    FImprimirRecibo: iImprimirRecibo;
    FAtivarDesativarBotoes: TClasseBotoesQuitarParcelas;
    FCodigoVenda: Integer;
    FCodigoCliente: Integer;
    FQuantidadeParcelas: Integer;
    FParcela: Integer;
    FvalorVenda: Currency;
    FValorDaParcela: Currency;
    FDataVencimento: TDate;

  public
    { Public declarations }
  end;

var
  formQuitarParcelasVendas: TformQuitarParcelasVendas;

implementation

uses
  UClasse.Entity.Dados.Empresa, softMeter_globalVar;

{$R *.dfm}

procedure TformQuitarParcelasVendas.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  with DataSource1.DataSet do
  begin
    edtTotalDeParcelas.Text := IntToStr(FieldByName('QUANTIDADE_PARCELAS').AsInteger);
    edtParcelaSelecionada.Text := IntToStr(FieldByName('PARCELA').AsInteger);
    edtValorDaParcela.Text := CurrToStr(FieldByName('VALOR_DA_PARCELA').AsCurrency);
    edtJuros.Text := FloatToStr(FieldByName('JUROS').AsFloat);
    edtMulta.Text := CurrToStr(FieldByName('MULTA').AsCurrency);
    edtDesconto.Text := CurrToStr(FieldByName('DESCONTO').AsCurrency);
    edtTotalAPagar.Text := CurrToStr(FieldByName('TOTAL').AsCurrency);
    edtFormaDePagamento.Text := FieldByName('forma_pagamento').AsString;
    edtPago.Text := FieldByName('PAGO').AsString;


    if FieldByName('DATA_VENCIMENTO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataDeVencimento.Text := DateToStr(FieldByName('VALOR_DA_PARCELA').AsCurrency);


    if DataSource1.DataSet.FieldByName('DATA_PAGAMENTO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataDePagamento.date := FieldByName('DATA_PAGAMENTO').AsDateTime;

  end;
end;

procedure TformQuitarParcelasVendas.DBGrid1CellClick(Column: TColumn);
begin
  if DataSource1.DataSet.RecordCount >= 1 then
  begin

    ativarBotoes;

    if DataSource1.DataSet.FieldByName('PAGO').AsString = 'Nao' then
    begin

      sbQuitarParela.Enabled := true;

      edtTotalAPagar.Text := FentityVisulizarParcelasVenda.CalcularJuros;
      FentityVisulizarParcelasVenda.setJuros(edtJuros).setMulta(edtMulta);

      edtDataDePagamento.DateTime := Date;

    end
    else
    begin
      desativarBotoes;

      if DataSource1.DataSet.FieldByName('PAGO').AsString = 'Sim' then
      begin
        sbEstornar.Enabled := true;
        sbAdicionarParcela.Enabled := true;
        sbExcluir.Enabled := true;
        sbCancelar.Enabled := true;
      end;


    end;
  end
  else
  begin
    desativarBotoes;
  end;
end;

procedure TformQuitarParcelasVendas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if FentityVisulizarParcelasVenda.tableQuery.FieldByName('PAGO').AsString = 'Sim'
  then
  begin
    DBGrid1.Canvas.Brush.Color := $00BD9111;
    DBGrid1.Canvas.Font.Color := clwhite;
  end

  else if ((FentityVisulizarParcelasVenda.tableQuery.FieldByName('PAGO')
    .AsString = 'Nao') and (FentityVisulizarParcelasVenda.tableQuery.FieldByName
    ('DATA_VENCIMENTO').AsDateTime >= date)) then
  begin
    DBGrid1.Canvas.Brush.Color := $0068BD05;
    DBGrid1.Canvas.Font.Color := clwhite;
  end

  else if FentityVisulizarParcelasVenda.tableQuery.FieldByName('PAGO')
    .AsString = 'Estornada' then
  begin
    DBGrid1.Canvas.Brush.Color := $00C4C4C4;
    DBGrid1.Canvas.Font.Color := clwhite
  end

  else if ((FentityVisulizarParcelasVenda.tableQuery.FieldByName('PAGO')
    .AsString = 'Nao') and (FentityVisulizarParcelasVenda.tableQuery.FieldByName
    ('DATA_VENCIMENTO').AsDateTime < date)) then
  begin
    DBGrid1.Canvas.Brush.Color := $003444D1;
    DBGrid1.Canvas.Font.Color := clwhite
  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TformQuitarParcelasVendas.edtDescontoExit(Sender: TObject);
begin
  calcularDesconto;
end;

procedure TformQuitarParcelasVendas.edtDescontoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    calcularDesconto;
end;

procedure TformQuitarParcelasVendas.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FCampo: string;
begin

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    Parcela:
      begin
        FCampo := 'ID_PARCELA';
      end;
    Venda:
      begin
        FCampo := 'ID_VENDA';
      end;
    codigo_cliente:
      begin
        FCampo := 'ID_CLIENTE';
      end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FentityVisulizarParcelasVenda.getCampo(FCampo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1);

end;

procedure TformQuitarParcelasVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FreeAndNil(FAtivarDesativarBotoes);
end;

procedure TformQuitarParcelasVendas.FormCreate(Sender: TObject);
begin
  FentityVisulizarParcelasVenda := TEntityQuitarParcelaVenda.new;

  FImprimirRecibo := TImprimirRecibo.new;
  FVisualizarDadosEmpresa := TEntityCadastroDadosEmpresa.new;
  FImprimirParcelas := TImprimirParcelasVenda.new;
  FVisualizarDadosEmpresa.abrir.listarGrid(s_DadosEmpresa);

  FAtivarDesativarBotoes := TClasseBotoesQuitarParcelas.create;

  dllSoftMeter.sendEvent('quitar parcelas das vendas', 'parcela venda', 0);

  ReportMemoryLeaksOnShutdown := true;

end;

procedure TformQuitarParcelasVendas.FormShow(Sender: TObject);
begin

  FentityVisulizarParcelasVenda.abrir.getCampo('ID_PARCELA').getValor('0').sqlPesquisa.listarGrid(DataSource1);

  TFactory.new.ftTable.FD_Table('FORMAS_PAGAMENTO')
    .getCampoTabela('FORMA_PAGAMENTO').popularComponenteComboBox
    (edtFormaDePagamento);

  cbPesquisar.ItemIndex := 0;

  edtDataDePagamento.date := date;

  with FAtivarDesativarBotoes do
  begin
    BotaoQuitar(sbQuitarParela);
    BotaoEstornar(sbEstornar);
    BotaoAdicionarParcela(sbAdicionarParcela);
    BotaoSalvarPacela(sbSalvar);
    BotaoExcluirParcela(sbExcluir);
    BotalCancelar(sbCancelar);
    BotaoImpimirParcela(sbImprimirParcelas);
    BotaoExportar(sbExportar);

    botoesAbrirForm;

  end;

  edtPesquisar.SetFocus;

end;

procedure TformQuitarParcelasVendas.Panel1MouseDown(Sender: TObject;
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

procedure TformQuitarParcelasVendas.sbAdicionarParcelaClick(Sender: TObject);
var
  totalDeParcelas: Integer;
begin

  if DataSource1.DataSet.FieldByName('ID_CLIENTE').AsInteger <> 0 then
  begin

      TFactory.new.criarJanela.verificarPermisao('ADICIONARPARCELA');

      totalDeParcelas := FentityVisulizarParcelasVenda.retornarTotalDeParcelas
        (DataSource1.DataSet.FieldByName('ID_VENDA').AsInteger) + 1;

      FCodigoVenda := DataSource1.DataSet.FieldByName('ID_VENDA').AsInteger;
      FCodigoCliente := DataSource1.DataSet.FieldByName('ID_CLIENTE').AsInteger;
      FQuantidadeParcelas := totalDeParcelas;
      FParcela := totalDeParcelas;
      FvalorVenda := DataSource1.DataSet.FieldByName('VALOR_VENDA').AsCurrency;

      lblCaption.Caption := lblCaption.Caption + ' - Inserindo parcela';

      FAtivarDesativarBotoes.btAdicionarParcela;
  end
  else
  begin
     raise Exception.Create('ERRO! Não é possível adicionar parcela neste tipo de venda');
  end;

end;

procedure TformQuitarParcelasVendas.sbCancelarClick(Sender: TObject);
begin

  FCodigoVenda := 0;
  FCodigoCliente := 0;
  FQuantidadeParcelas := 0;
  FParcela := 0;
  FvalorVenda := 0;
  FValorDaParcela := 0;
  // FDataVencimento: TDate;

  desativarBotoes;
  sbSalvar.Enabled := false;
  sbEstornar.Enabled := false;

  lblCaption.Caption := 'Ver parcelas das vendas realizadas';

  edtPesquisar.SetFocus;

  FAtivarDesativarBotoes.btCancelarParcela;

end;

procedure TformQuitarParcelasVendas.sbEstornarClick(Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('ESTORNAR');

  if DataSource1.DataSet.FieldByName('PAGO').AsString = 'Sim' then
  begin

    if DataSource1.DataSet.FieldByName('ID_CLIENTE').AsInteger <> 0 then
      begin
        FentityVisulizarParcelasVenda.estornarParcela
          (DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger).atualizar;

        FAtivarDesativarBotoes.btEstornarParcela;

      end
      else
      begin
        raise Exception.Create('ERRO! Você não pode cancelar o pagamento deste tipo de parcela');
      end;

  end;
end;

procedure TformQuitarParcelasVendas.sbExcluirClick(Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('EXCLUIRPARCELA');

  FentityVisulizarParcelasVenda.excluirParcela
    (DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger).atualizar;

    FAtivarDesativarBotoes.btExcluirParcela;

end;

procedure TformQuitarParcelasVendas.sbExportarClick(Sender: TObject);
begin
  FentityVisulizarParcelasVenda.exportar;
end;

procedure TformQuitarParcelasVendas.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformQuitarParcelasVendas.sbImprimirParcelasClick(Sender: TObject);
begin

  FImprimirParcelas.selecionarParcelas
    (DataSource1.DataSet.FieldByName('ID_VENDA').AsInteger)
    .retornarDataSet(s_ImprimirParcelas).retonarJurosMultaAtraso(s_jurosMulta);

  frx_ImprimirParcelas.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/carne_pagamento.fr3');
  frx_ImprimirParcelas.ShowReport();

end;

procedure TformQuitarParcelasVendas.sbQuitarParelaClick(Sender: TObject);
begin
  if DataSource1.DataSet.FieldByName('ID_VENDA').AsInteger <> 0 then
  begin
    FentityVisulizarParcelasVenda
                    .getCodigoParcela(DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger)
                    .getDesconto(edtDesconto.Text).getJuros(edtJuros.Text)
                     .getDataPagamento(DateToStr(edtDataDePagamento.date))
                     .getTOTAL(edtTotalAPagar.Text)
                     .getFormaPagamento(edtFormaDePagamento.Text)
                     .selecionarParcelaQuitar(DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger)
                     .quitarParcela
                     .atualizar;

    showmessage('Parcela quitada com sucesso');

    FAtivarDesativarBotoes.btQuitarParcela;

    if application.MessageBox('Deseja imprimir o comprovante de pagamento?',
      'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      imprimirReciboPagamento;

    end;

  end;
end;

procedure TformQuitarParcelasVendas.sbSalvarClick(Sender: TObject);
begin

  FDataVencimento := StrToDate(edtDataDeVencimento.Text);
  FValorDaParcela := StrToCurr(edtValorDaParcela.Text);

  if DataSource1.DataSet.State in [dsInsert] then
  begin

  FentityVisulizarParcelasVenda
                              .getID_VENDA(FCodigoVenda)
                              .getID_CLIENTE(FCodigoCliente)
                              .getQUANTIDADE_PARCELAS(FQuantidadeParcelas)
                              .getPARCELA(FParcela)
                              .getVALOR_VENDA(CurrToStr(FvalorVenda))
                              .getVALOR_DA_PARCELA(edtValorDaParcela.Text)
                              .getDATA_VENCIMENTO(edtDataDeVencimento.Text)
                              .prepararAdicionarParcela
                              .atualizar;
  end
  else
  begin
    FentityVisulizarParcelasVenda.salvarParcelasEditadas(FValorDaParcela, FDataVencimento);
  end;

  lblCaption.Caption := 'Ver parcelas das vendas realizadas';

  FAtivarDesativarBotoes.btSalvarParcela;

end;

procedure TformQuitarParcelasVendas.ativarBotoes;
begin
  sbAdicionarParcela.Enabled := true;
  sbCancelar.Enabled := true;
  sbExcluir.Enabled := true;
  sbImprimirParcelas.Enabled := true;
  sbExportar.Enabled := true;
  sbImprimir.Enabled := true;
end;

procedure TformQuitarParcelasVendas.desativarBotoes;
begin
  sbQuitarParela.Enabled := false;
  sbAdicionarParcela.Enabled := false;
  sbCancelar.Enabled := false;
  sbExcluir.Enabled := false;
  sbImprimirParcelas.Enabled := true;
  sbExportar.Enabled := true;
  sbImprimir.Enabled := true;
end;

procedure TformQuitarParcelasVendas.Editarparcelaselecionada1Click(
  Sender: TObject);
var
  totalDeParcelas: Integer;
begin

  lblCaption.Caption := 'Ver parcelas das vendas realizadas';

  if DataSource1.DataSet.RecordCount >= 1 then
  begin

    if DataSource1.DataSet.FieldByName('PAGO').AsString <> 'Sim' then
    begin

      TFactory.new.criarJanela.verificarPermisao('ADICIONARPARCELA');

      lblCaption.Caption := lblCaption.Caption + ' - Editando a parcela';

      FAtivarDesativarBotoes.btAdicionarParcela;

    end
    else
    begin
      MessageDlg('AVISO! Não é possível editar esta parcela', mtWarning, [mbOK], 0, mbOK);
      Abort;
    end;

  end;


end;

procedure TformQuitarParcelasVendas.calcularDesconto;
begin
  edtTotalAPagar.Text :=
    CurrToStr((StrToCurr(edtValorDaParcela.Text) + StrToCurr(edtMulta.Text) +
    StrToCurr(edtJuros.Text)) - StrToCurr(edtDesconto.Text));
end;

procedure TformQuitarParcelasVendas.cbPesquisarChange(Sender: TObject);
begin
  edtPesquisar.SetFocus;
end;

procedure TformQuitarParcelasVendas.imprimirReciboPagamento;
var
  F_EntityImprimirRecibo: iQuitarParcelasVenda;
begin

  F_EntityImprimirRecibo := TEntityQuitarParcelaVenda.new;

  F_EntityImprimirRecibo.getCampo('ID_PARCELA')
    .getValor(IntToStr(DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger))
    .sqlPesquisaEstatica.listarGrid(s_ImprimirRecibo);

  frx_ImprimirRecibo.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/recibo_parcelas.fr3');
  frx_ImprimirRecibo.ShowReport;
end;

end.
