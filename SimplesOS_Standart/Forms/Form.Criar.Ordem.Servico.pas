unit Form.Criar.Ordem.Servico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, UInterfaces, UClasse.Entity.Criar.Ordem.Servico, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids, UFactory, Form.Localizar.Clientes.Ordem,
  Datasnap.DBClient, UClasse.Entity.Ordem.Adicionar.Servico, Form.Ordem.Servico,
  Form.Principal, UClasse.Entity.Criar.Ordem.Parcelas, Vcl.DBCtrls,
  UClasse.Visualizar.Ordens.Servico.Parcelas, UClasse.Visualizar.Ordens.Servico,
  UClasse.Visualizar.Ordens.Servicos.Incluidos, frxClass, frxDBSet,
  UClasse.Entity.Dados.Empresa, frxBarcode, UClasse.Calcular.Juros,
  UClasse.Entity.Configurar.Parcelas, UClasse.Preparar.Imprimir.Recibo,
  UClasse.Ativar.Desativar.Botoes.Ordem.Servico, Vcl.Menus, UFactory.Entity,
  MidasLib, RxToolEdit, RxCurrEdit;

type
  TformCriarConsultarOrdemServico = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    PageControl1: TPageControl;
    tbOrdemServi�o: TTabSheet;
    tbServicosEFaturamento: TTabSheet;
    tbParcelas: TTabSheet;
    Panel3: TPanel;
    sbNovo: TSpeedButton;
    sbEditar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    sbEstornarOS: TSpeedButton;
    sbImprimirOS: TSpeedButton;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DataSource1: TDataSource;
    edtCodigoOS: TEdit;
    Label1: TLabel;
    edtCodigoCliente: TEdit;
    Label2: TLabel;
    edtNomeCliente: TEdit;
    Label3: TLabel;
    sbPesquisarCep: TSpeedButton;
    edtMarca: TEdit;
    edtModelo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtNumeroDeSerie: TEdit;
    Label6: TLabel;
    edtDataFabricacao: TMaskEdit;
    Label7: TLabel;
    edtEquipamento: TEdit;
    Label8: TLabel;
    edtDefeitoRelatado: TMemo;
    Label9: TLabel;
    edtLaudoTecnico: TMemo;
    Label10: TLabel;
    edtSolucaoDoProblema: TMemo;
    Label11: TLabel;
    edtSituacaoOrdem: TComboBox;
    Label12: TLabel;
    edtPrioridade: TComboBox;
    Label13: TLabel;
    edtDataEntrada: TMaskEdit;
    Label14: TLabel;
    edtDataDeSaida: TMaskEdit;
    Label15: TLabel;
    edtHoraSaida: TMaskEdit;
    Label16: TLabel;
    edtTecnicoResponsavel: TEdit;
    Label17: TLabel;
    edtRetorno: TEdit;
    Label18: TLabel;
    edtDataRetorno: TMaskEdit;
    Label19: TLabel;
    Label20: TLabel;
    edtObservacao: TEdit;
    SpeedButton3: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    edtDataBaseVencimento: TMaskEdit;
    Label28: TLabel;
    DBGrid1: TDBGrid;
    Label29: TLabel;
    s_Servicos: TDataSource;
    cds_tem_servicos_adicionados: TClientDataSet;
    cds_tem_servicos_adicionadosid: TIntegerField;
    cds_tem_servicos_adicionadosservico: TStringField;
    cds_tem_servicos_adicionadosvalor: TCurrencyField;
    s_tem_servicos_adicionados: TDataSource;
    cds_tem_servicos_adicionados_edit: TClientDataSet;
    cds_tem_servicos_adicionados_editid: TIntegerField;
    cds_tem_servicos_adicionados_editservico: TStringField;
    cds_tem_servicos_adicionados_editValor: TCurrencyField;
    s_tem_servicos_adicionados_edit: TDataSource;
    sbQuitarParcela: TSpeedButton;
    sbEstornarParcela: TSpeedButton;
    sbAdicionarParcela: TSpeedButton;
    sbSalvarParcela: TSpeedButton;
    sbExcluirParcela: TSpeedButton;
    sbImprimirParcelas: TSpeedButton;
    DBGrid3: TDBGrid;
    s_ParcelasOS: TDataSource;
    edtNumeroParcela: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    edtVencimentoParcela: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    edtDataPagamentoParcela: TDateTimePicker;
    Label37: TLabel;
    edtHoraPagamento: TMaskEdit;
    Label38: TLabel;
    edtFormaPagamentoParcela: TComboBox;
    Label39: TLabel;
    edtPgtoParcela: TComboBox;
    Label40: TLabel;
    edtObservacoesParcela: TEdit;
    Label41: TLabel;
    Label24: TLabel;
    cds_AdicionarParcela: TClientDataSet;
    cds_AdicionarParcelaid_ordem: TIntegerField;
    cds_AdicionarParcelaid_cliente: TIntegerField;
    cds_AdicionarParcelaTotal_de_parcelas: TIntegerField;
    cds_AdicionarParcelaNumero_da_parcela: TIntegerField;
    cds_AdicionarParcelaValor_da_parcela: TCurrencyField;
    cds_AdicionarParcelavencimento: TDateTimeField;
    cds_AdicionarParcelapgto: TStringField;
    sbCancelarOperacaoParcela: TSpeedButton;
    SpeedButton13: TSpeedButton;
    s_imprimirOS: TDataSource;
    s_imprimirServicosOS: TDataSource;
    s_imprimirparcelasOS: TDataSource;
    frxDB_ImprimirOS: TfrxDBDataset;
    frxDB_ImprimirServicosOS: TfrxDBDataset;
    frxDB_ImprimirParcelasOS: TfrxDBDataset;
    frx_ImprimirOS: TfrxReport;
    frxDB_ImprimirDadosEmpresa: TfrxDBDataset;
    s_ImprimirEmpresa: TDataSource;
    frx_ImprimirParcelas: TfrxReport;
    frxBarCodeObject1: TfrxBarCodeObject;
    s_ImprimirInfoJuros: TDataSource;
    frxDB_ImprimirInfoJuros: TfrxDBDataset;
    s_ImprirmirRecibo: TDataSource;
    frxDB_Imprimirrecibo: TfrxDBDataset;
    frx_ImprimirRecibo: TfrxReport;
    PopupMenu1: TPopupMenu;
    Editarparcela1: TMenuItem;
    sbGerarParcelas: TSpeedButton;
    edtTotalDeParcelas: TComboBox;
    edtValorOrdem: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    edtAcrescimo: TCurrencyEdit;
    edtTotalDaOS: TCurrencyEdit;
    edtValorOrdemParcelado: TCurrencyEdit;
    sbSalvar: TSpeedButton;
    edtValorParcela: TCurrencyEdit;
    edtDescontoParcela: TCurrencyEdit;
    edtJurosParcelas: TCurrencyEdit;
    edtMultaParcela: TCurrencyEdit;
    edtTotalParcela: TCurrencyEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbNovoClick(Sender: TObject);
    procedure sbPesquisarCepClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure s_ServicosDataChange(Sender: TObject; Field: TField);
    procedure edtAcrescimoExit(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbEstornarOSClick(Sender: TObject);
    procedure s_ParcelasOSDataChange(Sender: TObject; Field: TField);
    procedure edtTotalDeParcelasExit(Sender: TObject);
    procedure edtTotalDaOSExit(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure sbQuitarParcelaClick(Sender: TObject);
    procedure sbEstornarParcelaClick(Sender: TObject);
    procedure sbAdicionarParcelaClick(Sender: TObject);
    procedure sbSalvarParcelaClick(Sender: TObject);
    procedure sbExcluirParcelaClick(Sender: TObject);
    procedure sbCancelarOperacaoParcelaClick(Sender: TObject);
    procedure sbImprimirOSClick(Sender: TObject);
    procedure sbImprimirParcelasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Editarparcela1Click(Sender: TObject);
    procedure sbGerarParcelasClick(Sender: TObject);
    procedure edtValorOrdemExit(Sender: TObject);
  private
    { Private declarations }
  var
    FEntityCriarOrdem: iCriarOrdemServico;
    FEntityServicosOrdem: iAdicionarServicosOrdem;
    FEntityParcelasOrdem: iParcelaOrdem;
    FEntityTableServicos: iFDTable;

    FEntityVisualizarOS: iVisualizarOrdens;
    FEntityVisualizasOSServicos: iVisualizarServicosOrdem;
    FEntityVisualizarOSParcelas: iVisualizarParcelasOrdem;
    FEntityVisualizarEmpresa: iDadosEmpresa;
    FEntityVisualizarJuros: iConfigurarParcelas;
    FEntityImprimirRecibo: iPrepararRecibo;
    FAtivarBotoes: TAtivarDesativarBotoesOrdemServico;

    FValorTotalOrdemServico: Currency;
    FValorServicosIncluidos: Currency;

    procedure limparDatas;
    procedure adicionarServico(codigo:integer; servico:string; valor:Currency);
    procedure subtrairValoresServicosIncluidos;
    procedure selecionarOrdem;
    procedure popularComboBox;
    procedure abreATabelaDeParcelas;
    procedure prepararParaImprimir(value: Integer);
    procedure imprimirRecibo;
    procedure desabilitarBotoesParcelasEstornar;
    procedure habilitarBotoesQuitarParcela;
    procedure atualizarValores;
    procedure caluclarValorDoParcelamento;
    procedure habilitarDesabilitarEdits(value:string);
    procedure gravarInformacoesOS;
    procedure gerarInformacoesPagamentoOS;
  public
    { Public declarations }
  end;

var
  formCriarConsultarOrdemServico: TformCriarConsultarOrdemServico;
  FIdTecnico: Integer;

implementation

{$R *.dfm}

uses Form.Localizar.Tecnico.Ordem, UClasse.Entity.Table, softMeter_globalVar,
  Form.Localizar.Servicos;

procedure TformCriarConsultarOrdemServico.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  with DataSource1.DataSet do
  begin

    edtCodigoOS.Text := IntToStr(FieldByName('ID').AsInteger);
    edtCodigoCliente.Text := IntToStr(FieldByName('ID_CLIENTE').AsInteger);
    edtEquipamento.Text := FieldByName('EQUIPAMENTO').AsString;
    edtDefeitoRelatado.Text := FieldByName('DEFEITO_RELATADO').AsString;
    edtMarca.Text := FieldByName('MARCA').AsString;
    edtModelo.Text := FieldByName('MODELO').AsString;
    edtNumeroDeSerie.Text := FieldByName('NUMERO_SERIE').AsString;
    edtLaudoTecnico.Text := FieldByName('LAUDO_DO_TECNICO').AsString;
    edtSolucaoDoProblema.Text := FieldByName('SOLUCAO_DO_PROBLEMA').AsString;
    edtValorOrdem.Text := CurrToStr(FieldByName('VALOR_DA_ORDEM').AsCurrency);
    edtDesconto.Text := CurrToStr(FieldByName('DESCONTO').AsCurrency);
    edtAcrescimo.Text := CurrToStr(FieldByName('ACRESCIMO').AsCurrency);
    edtTotalDaOS.Text := CurrToStr(FieldByName('TOTAL_ORCAMENTO').AsCurrency);
    edtRetorno.Text := FieldByName('RETORNO').AsString;
    edtSituacaoOrdem.Text := FieldByName('SITUACAO_DA_ORDEM').AsString;
    edtTotalDeParcelas.Text := IntToStr(FieldByName('TOTAL_PARCELAS')
      .AsInteger);
    edtPrioridade.Text := FieldByName('PRIORIDADE').AsString;
    edtTecnicoResponsavel.Text := FieldByName('TECNICO_RESPONSAVEL').AsString;
    edtObservacao.Text := FieldByName('OBSERVACAO').AsString;
    edtValorOrdemParcelado.Text :=
      CurrToStr(FieldByName('VALOR_DA_PARCELA').AsCurrency);
    edtHoraSaida.Text := TimeToStr(FieldByName('HORA_SAIDA').AsDateTime);

    // Tudo referente a datas
    if DataSource1.DataSet.FieldByName('DATA_FABRICACAO').AsDateTime <>
      StrToDate('30/12/1899') then
      edtDataFabricacao.Text := DateToStr(FieldByName('DATA_FABRICACAO')
        .AsDateTime);

    if DataSource1.DataSet.FieldByName('DATA_RETORNO').AsDateTime <>
      StrToDate('30/12/1899') then
      edtDataRetorno.Text := DateToStr(FieldByName('DATA_RETORNO').AsDateTime);

    if DataSource1.DataSet.FieldByName('DATA_ENTRADA').AsDateTime <>
      StrToDate('30/12/1899') then
      edtDataEntrada.Text := DateToStr(FieldByName('DATA_ENTRADA').AsDateTime);

    if DataSource1.DataSet.FieldByName('DATA_FINALIZACAO').AsDateTime <>
      StrToDate('30/12/1899') then
      edtDataDeSaida.Text := DateToStr(FieldByName('DATA_FINALIZACAO')
        .AsDateTime);

    if DataSource1.DataSet.FieldByName('DATA_BASE_VENCIMENTO').AsDateTime <>
      StrToDate('30/12/1899') then
      edtDataBaseVencimento.Text :=
        DateToStr(FieldByName('DATA_BASE_VENCIMENTO').AsDateTime);

  end;
end;

procedure TformCriarConsultarOrdemServico.DBGrid2DblClick(Sender: TObject);
begin

//  adicionarServico;
//  atualizarValores;

end;

procedure TformCriarConsultarOrdemServico.DBGrid3CellClick(Column: TColumn);
begin
  if s_ParcelasOS.DataSet.RecordCount >= 1 then
  begin

    if s_ParcelasOS.DataSet.FieldByName('PGTO').AsString = 'Sim' then
    begin

      sbQuitarParcela.Enabled := false;
      sbSalvarParcela.Enabled := false;
      sbExcluirParcela.Enabled := false;
      sbCancelar.Enabled := false;

      sbEstornarParcela.Enabled := true;
      sbImprimirParcelas.Enabled := true;
      sbAdicionarParcela.Enabled := true;

    end
    else if s_ParcelasOS.DataSet.FieldByName('PGTO').AsString = 'Nao' then
    begin

      FEntityParcelasOrdem.editar;

      edtTotalParcela.Text := FEntityParcelasOrdem.calularJuros;

      FEntityParcelasOrdem
                          .setJuros(edtJurosParcelas)
                          .setMulta(edtMultaParcela)
                          .setDatapagamento(edtDataPagamentoParcela)
                          .setHoraPagamento(edtHoraPagamento);

      sbQuitarParcela.Enabled := true;
      sbSalvarParcela.Enabled := false;
      sbExcluirParcela.Enabled := true;
      sbCancelar.Enabled := true;

      sbEstornarParcela.Enabled := false;
      sbImprimirParcelas.Enabled := true;
      sbAdicionarParcela.Enabled := true;

    end
    else if s_ParcelasOS.DataSet.FieldByName('PGTO').AsString = 'Estornada' then
    begin

      sbQuitarParcela.Enabled := false;
      sbSalvarParcela.Enabled := false;
      sbExcluirParcela.Enabled := false;
      sbCancelar.Enabled := false;

      sbEstornarParcela.Enabled := false;
      sbImprimirParcelas.Enabled := true;
      sbAdicionarParcela.Enabled := false;

    end;


  end;

end;

procedure TformCriarConsultarOrdemServico.edtAcrescimoExit(Sender: TObject);
begin

  atualizarValores;

end;

procedure TformCriarConsultarOrdemServico.edtDescontoExit(Sender: TObject);
begin

  atualizarValores;

end;

procedure TformCriarConsultarOrdemServico.edtTotalDaOSExit(Sender: TObject);
begin

    edtValorOrdemParcelado.SetFocus;

    caluclarValorDoParcelamento;

end;

procedure TformCriarConsultarOrdemServico.edtTotalDeParcelasExit
  (Sender: TObject);
begin

  if FEntityCriarOrdem.estadoDaTabela = 'insert' then
  begin

    edtValorOrdemParcelado.SetFocus;

    caluclarValorDoParcelamento;

  end;

end;

procedure TformCriarConsultarOrdemServico.edtValorOrdemExit(Sender: TObject);
begin
  edtDesconto.SetFocus;
end;

procedure TformCriarConsultarOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FAtivarBotoes);
  codigoDaOS := 0;
end;

procedure TformCriarConsultarOrdemServico.FormCreate(Sender: TObject);
begin


  FEntityCriarOrdem := TEntityCriarOrdemServico.new;
  FEntityServicosOrdem := TEntityAdicionarItemsOrdem.new;
  FEntityParcelasOrdem := TEntityGerarParcelas.new;
  FEntityTableServicos := TEntityTable.new;

  FEntityVisualizarOS := TEntityVisualizarOrdem.new;
  FEntityVisualizasOSServicos := TEntityVisualizarOrdemServicosIncluidos.new;
  FEntityVisualizarOSParcelas := TEntityVisualizarOrdemServicoParcelas.new;
  FEntityVisualizarEmpresa := TEntityCadastroDadosEmpresa.new;
  FEntityVisualizarJuros := TEntityConfigurarParcelas.new;
  FEntityImprimirRecibo := TEntityPrepararRecibo.new;
  FAtivarBotoes := TAtivarDesativarBotoesOrdemServico.Create;

  with FAtivarBotoes do
  begin
    botaoNovo(sbNovo);
    botaoSalvar(sbSalvar);
    botaoEditar(sbEditar);
    botaoExcluir(sbExcluir);
    botaoCancelar(sbCancelar);
    botaoImprimir(sbImprimirOS);
    botaoEstornar(sbEstornarOS);

    botaoQuitarParcela(sbQuitarParcela);
    botaoAdicionarParcela(sbAdicionarParcela);
    botaoEstornarParcela(sbEstornarParcela);
    botaoSalvarParcela(sbSalvarParcela);
    botaoExcluirParcela(sbExcluirParcela);
    botaoCancelarParcela(sbCancelarOperacaoParcela);
    botaoImprimirParcelas(sbImprimirParcelas);

  end;

  dllSoftMeter.sendEvent('processo para criacao de uma OS', 'criar os', 0);

  ReportMemoryLeaksOnShutdown := true;

end;

procedure TformCriarConsultarOrdemServico.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if Key = 113 then
  begin
    if sbNovo.Enabled = true then
      sbNovo.Click;
  end;

  if Key = 114 then
  begin
    if sbSalvar.Enabled = true then
      sbSalvar.Click;
  end;

  if Key = 115 then
  begin
    if sbEditar.Enabled = true then
      sbEditar.Click;
  end;

  if Key = 116 then
  begin
    if sbExcluir.Enabled = true then
      sbExcluir.Click;
  end;

  if Key = 117 then
  begin
    if sbCancelar.Enabled = true then
      sbCancelar.Click;
  end;

end;

procedure TformCriarConsultarOrdemServico.FormShow(Sender: TObject);
begin

  abreATabelaDeParcelas;
  selecionarOrdem;
  popularComboBox;
  edtDataPagamentoParcela.DateTime := date;
  edtDataBaseVencimento.Text := DateToStr(date);
  PageControl1.ActivePageIndex := 0;

  habilitarDesabilitarEdits('desativar');

end;

procedure TformCriarConsultarOrdemServico.Panel1MouseDown(Sender: TObject;
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

procedure TformCriarConsultarOrdemServico.sbCancelarClick(Sender: TObject);
begin

  FEntityCriarOrdem.cancelar;
  FAtivarBotoes.ativarBotaoCancelar;
  lblCaption.Caption := 'Ordem de servi�os';

  habilitarDesabilitarEdits('desativar');

end;

procedure TformCriarConsultarOrdemServico.sbEditarClick(Sender: TObject);
begin
  FEntityCriarOrdem.editar;
  FAtivarBotoes.ativarBotaoEditar;
  lblCaption.Caption := 'Ordem de servi�os - Editando OS';

  habilitarDesabilitarEdits('ativar');

end;

procedure TformCriarConsultarOrdemServico.sbExcluirClick(Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('EXCLUIRPARCELA');

  FEntityCriarOrdem.deletar;
  FAtivarBotoes.ativarBotaoExcluir;
  lblCaption.Caption := 'Ordem de servi�os - OS excluida';

  FEntityCriarOrdem.getCampo('ID').getValor('0').sqlPesquisa.listarGrid
    (DataSource1);

  FEntityServicosOrdem.abrir.getCampo('ID_ORDEM').getValor('0')
    .sqlPesquisaEstatica.listarItensDaOS(cds_tem_servicos_adicionados);

  FEntityParcelasOrdem.abrir.getCampo('ID_ORDEM').getValor('0')
    .sqlPesquisa.listarGrid(s_ParcelasOS);

  edtNomeCliente.Clear;
  edtDataFabricacao.Clear;

  habilitarDesabilitarEdits('desativar');

end;

procedure TformCriarConsultarOrdemServico.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformCriarConsultarOrdemServico.sbNovoClick(Sender: TObject);
begin

  FEntityCriarOrdem.inserir;
  PageControl1.ActivePageIndex := 0;
  edtNomeCliente.Clear;
  edtNomeCliente.SetFocus;
  edtValorOrdem.Text := '0';
  edtDesconto.Text := '0';
  edtAcrescimo.Text := '0';
  edtTotalDaOS.Text := '0';
  edtTotalDeParcelas.Text := '1';

  edtDataEntrada.Text := DateToStr(date);
  edtDataBaseVencimento.Text := DateToStr(date);

  limparDatas;

  cds_tem_servicos_adicionados.EmptyDataSet;
  cds_tem_servicos_adicionados_edit.EmptyDataSet;
  abreATabelaDeParcelas;

  FAtivarBotoes.ativarBotaoNovo;

  lblCaption.Caption := 'Ordem de servi�os - Nova OS';

  habilitarDesabilitarEdits('ativar');

end;

procedure TformCriarConsultarOrdemServico.sbPesquisarCepClick(Sender: TObject);
begin

  if DataSource1.DataSet.State in [dsInsert] then
    begin
      formLocalizarClientesOrdem := TformLocalizarClientesOrdem.Create(self);
      try
        formLocalizarClientesOrdem.ShowModal;
      finally
        formLocalizarClientesOrdem.Free;
      end;
    end;

end;

procedure TformCriarConsultarOrdemServico.sbSalvarClick(Sender: TObject);
var
  estado: string;
begin

  PageControl1.ActivePageIndex := 1;

  if DataSource1.DataSet.State in [dsInsert] then
  begin
    edtValorOrdemParcelado.SetFocus;
    caluclarValorDoParcelamento;
  end;

  if edtValorOrdem.Text = EmptyStr then
    raise Exception.Create('ERRO! Infome o valor da m�o de obra da OS');


   if edtTotalDaOS.Text = EmptyStr then
    raise Exception.Create('ERRO! Informe o valor total da OS');

  if edtValorOrdemParcelado.Text = EmptyStr then
    raise Exception.Create('ERRO! Infome o valor da(s) parcela(s)');

  estado := FEntityCriarOrdem.estadoDaTabela;

  gravarInformacoesOS;

  if estado = 'insert' then
    FEntityServicosOrdem
                      .gravarServicosAdicionadosInsert(cds_tem_servicos_adicionados, FEntityCriarOrdem.setId)

  else if estado = 'edit' then
    FEntityServicosOrdem
                      .gravarServicosAdicionadosEdit(cds_tem_servicos_adicionados_edit, FEntityCriarOrdem.setId);

  FAtivarBotoes.ativarBotaoSalvar;

  lblCaption.Caption := 'Ordem de servi�os';

  if estado = 'insert' then
    gerarInformacoesPagamentoOS;

  habilitarDesabilitarEdits('desativar');

end;

procedure TformCriarConsultarOrdemServico.sbExcluirParcelaClick
  (Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('EXCLUIRPARCELA');

  if s_ParcelasOS.DataSet.RecordCount >= 1 then
  begin
    FEntityParcelasOrdem.deletar;
    FAtivarBotoes.ativarbotaoExcluirParcela;
  end;
end;

procedure TformCriarConsultarOrdemServico.sbImprimirParcelasClick
  (Sender: TObject);
begin

  prepararParaImprimir(DataSource1.DataSet.FieldByName('ID').AsInteger);

  frx_ImprimirParcelas.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/parcelas_os.fr3');
  frx_ImprimirParcelas.ShowReport();

  FAtivarBotoes.ativarbotaoImprimirParcelas;

end;

procedure TformCriarConsultarOrdemServico.sbCancelarOperacaoParcelaClick
  (Sender: TObject);
begin
  FEntityParcelasOrdem.cancelar;
  FAtivarBotoes.ativarBotaoCancelar;

  sbQuitarParcela.Enabled := false;
  sbSalvarParcela.Enabled := false;
  sbExcluirParcela.Enabled := false;
  sbCancelar.Enabled := true;

  sbEstornarParcela.Enabled := false;
  sbImprimirParcelas.Enabled := false;
  sbAdicionarParcela.Enabled := false;

end;

procedure TformCriarConsultarOrdemServico.SpeedButton13Click(Sender: TObject);
begin

  edtValorOrdemParcelado.SetFocus;

  caluclarValorDoParcelamento;

end;

procedure TformCriarConsultarOrdemServico.sbGerarParcelasClick(Sender: TObject);
begin

  if DataSource1.DataSet.RecordCount >= 1 then
  begin

    if s_ParcelasOS.DataSet.RecordCount = 0 then
    begin

      try

        FEntityParcelasOrdem.getID_ORDEM(StrToInt(edtCodigoOS.Text))
          .getID_CLIENTE(StrToInt(edtCodigoCliente.Text))
          .getTOTAL_PARCELAS(StrToInt(edtTotalDeParcelas.Text))
          .getVALOR_PARCELA(StrToCurr(edtValorOrdemParcelado.Text))
          .getDATA_VENCIMENTO(edtDataBaseVencimento.Text).gerarParcelas;

        showmessage
          ('Parcelas / Informa��es para pagamento foram geradas com sucesso!');

      except
        on e: Exception do
        begin
          raise Exception.Create
            ('ERRO! N�o foi poss�vel gerar as informa��es para pagamento. ' +
            e.Message);
        end;

      end;
    end;

  end;

end;

procedure TformCriarConsultarOrdemServico.sbEstornarOSClick(Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('ESTORNAR');

  if DataSource1.DataSet.RecordCount >= 1 then
  begin

    FEntityCriarOrdem.estornarOrdem(DataSource1.DataSet.FieldByName('ID')
      .AsInteger);

    FEntityParcelasOrdem.atualizar;

    FAtivarBotoes.ativarbotaoEstornar;

    lblCaption.Caption := 'Ordem de servi�os - OS Estornada';

  end;

end;

procedure TformCriarConsultarOrdemServico.sbImprimirOSClick(Sender: TObject);
begin

  prepararParaImprimir(DataSource1.DataSet.FieldByName('ID').AsInteger);

  frx_ImprimirOS.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/ordem_servico.fr3');
  frx_ImprimirOS.ShowReport();

  FAtivarBotoes.ativarBotaoImpimir;

  lblCaption.Caption := 'Ordem de servi�os';

end;

procedure TformCriarConsultarOrdemServico.SpeedButton3Click(Sender: TObject);
begin

  if DataSource1.DataSet.State in [dsInsert, dsEdit] then
    begin
      formLocalizarTecnico := TformLocalizarTecnico.Create(self);
      try
        formLocalizarTecnico.ShowModal;
      finally
        formLocalizarTecnico.Free;
      end;
    end;

end;

procedure TformCriarConsultarOrdemServico.SpeedButton4Click(Sender: TObject);
begin

  FormLocalizarServicos := TFormLocalizarServicos.Create(Self);
  try
    FormLocalizarServicos.ShowModal;
  finally

      adicionarServico(
                        FormLocalizarServicos.retornarCodigo,
                        FormLocalizarServicos.retornarServico,
                        FormLocalizarServicos.retornarValor
      );

      atualizarValores;

    FormLocalizarServicos.Free;
  end;


//  atualizarValores;

end;

procedure TformCriarConsultarOrdemServico.SpeedButton5Click(Sender: TObject);
begin

  if FEntityCriarOrdem.estadoDaTabela = 'insert' then
  begin

    cds_tem_servicos_adicionados.Delete;
    atualizarValores;

  end
  else if FEntityCriarOrdem.estadoDaTabela = 'edit' then
  begin

    FEntityServicosOrdem.getID_ORDEM(DataSource1.DataSet.FieldByName('ID')
      .AsInteger).excluiServicoDaOS(cds_tem_servicos_adicionadosid.AsInteger);

    cds_tem_servicos_adicionados.Delete;
    atualizarValores;

  end;

end;

procedure TformCriarConsultarOrdemServico.sbQuitarParcelaClick(Sender: TObject);
begin
  if s_ParcelasOS.DataSet.FieldByName('PGTO').AsString <> 'Sim' then
  begin
    if s_ParcelasOS.DataSet.FieldByName('PGTO').AsString <> 'Estornada' then
    begin
      FEntityParcelasOrdem
                          .getID(s_ParcelasOS.DataSet.FieldByName('ID').AsInteger)
                          .getID_ORDEM(s_ParcelasOS.DataSet.FieldByName('ID_ORDEM').AsInteger)
                          .getID_CLIENTE(s_ParcelasOS.DataSet.FieldByName('ID_CLIENTE').AsInteger)
                          .getTOTAL_PARCELAS(s_ParcelasOS.DataSet.FieldByName('TOTAL_PARCELAS').AsInteger)
                          .getPARCELA(StrToInt(edtNumeroParcela.Text))
                          .getVALOR_PARCELA(s_ParcelasOS.DataSet.FieldByName('VALOR_PARCELA').AsCurrency)
                          .getDATA_VENCIMENTO(edtVencimentoParcela.Text)
                          .getDesconto(edtDescontoParcela.Text)
                          .getJuros(edtJurosParcelas.Text)
                          .getMulta(edtMultaParcela.Text)
                          .getVALOR_TOTAL(edtTotalParcela.Text)
                          .getDATA_PAGAMENTO(DateToStr(edtDataPagamentoParcela.date))
                          .getHORA_PAGAMENTO(edtHoraPagamento.Text)
                          .getObservacao(edtObservacoesParcela.Text)
                          .getFORMA_PAGAMENTO(edtFormaPagamentoParcela.Text)
                          .getVALOR_TOTAL(edtTotalParcela.Text)
                          .getPGTO('Sim')
                          .gravar;

      FAtivarBotoes.ativarbotaoQuitarParcela;

      if application.MessageBox
        ('Deseja imprimir o comprovante de pagamento desta OS?',
        'Pergunta do sistema', MB_YESNO + MB_ICONWARNING) = mryes then
      begin
        imprimirRecibo;
      end;
    end
    else
    begin
      desabilitarBotoesParcelasEstornar;
      raise Exception.Create
        ('Esta parcela foi estornada e n�o poder� ser quitada.');
    end;

  end
  else
  begin
    desabilitarBotoesParcelasEstornar;
    raise Exception.Create('Esta parcela j� esta quitada.');
  end;

end;

procedure TformCriarConsultarOrdemServico.sbEstornarParcelaClick
  (Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('ESTORNAR');

  FEntityParcelasOrdem.extornarParcelaSelecionada(0);
  FAtivarBotoes.ativarbotaoEstornarParcela;

end;

procedure TformCriarConsultarOrdemServico.sbAdicionarParcelaClick
  (Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('ADICIONARPARCELA');

  if s_ParcelasOS.DataSet.RecordCount >= 1 then
  begin

    s_ParcelasOS.DataSet.Last;

    cds_AdicionarParcela.Open;
    cds_AdicionarParcela.Append;

    cds_AdicionarParcelaid_ordem.AsInteger := s_ParcelasOS.DataSet.FieldByName
      ('ID_ORDEM').AsInteger;

    cds_AdicionarParcelaid_cliente.AsInteger := s_ParcelasOS.DataSet.FieldByName
      ('ID_CLIENTE').AsInteger;

    cds_AdicionarParcelaTotal_de_parcelas.AsInteger :=
      s_ParcelasOS.DataSet.FieldByName('TOTAL_PARCELAS').AsInteger + 1;

    cds_AdicionarParcelaNumero_da_parcela.AsInteger :=
      s_ParcelasOS.DataSet.FieldByName('PARCELA').AsInteger + 1;

    cds_AdicionarParcelaValor_da_parcela.AsCurrency :=
      s_ParcelasOS.DataSet.FieldByName('VALOR_PARCELA').AsCurrency;

    cds_AdicionarParcelavencimento.AsDateTime :=
      s_ParcelasOS.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime;

    cds_AdicionarParcelapgto.AsString := s_ParcelasOS.DataSet.FieldByName
      ('PGTO').AsString;

    cds_AdicionarParcela.Post;

    edtNumeroParcela.Text :=
      IntToStr(cds_AdicionarParcelaTotal_de_parcelas.AsInteger + 1);

    edtValorParcela.Text :=
      CurrToStr(cds_AdicionarParcelaValor_da_parcela.AsCurrency);

    edtVencimentoParcela.Text :=
      DateToStr(cds_AdicionarParcelavencimento.AsDateTime);

    edtPgtoParcela.Text := 'N�o';

    FAtivarBotoes.ativarbotaoAdicionarParcela;

    FEntityParcelasOrdem.estadoDaTabela('insert');

  end;
end;

procedure TformCriarConsultarOrdemServico.sbSalvarParcelaClick(Sender: TObject);
begin

  if cds_AdicionarParcela.RecordCount >= 1 then
  begin
    FEntityParcelasOrdem.getID_ORDEM(cds_AdicionarParcelaid_ordem.AsInteger)
      .getID_CLIENTE(cds_AdicionarParcelaid_cliente.AsInteger)
      .getDATA_VENCIMENTO(edtVencimentoParcela.Text)
      .getVALOR_PARCELA(StrToCurr(edtValorParcela.Text))
      .getTOTAL_PARCELAS(cds_AdicionarParcelaTotal_de_parcelas.AsInteger)
      .getPARCELA
      (StrToInt(IntToStr(cds_AdicionarParcelaTotal_de_parcelas.AsInteger)))
      .getPGTO(edtPgtoParcela.Text).getObservacao(edtObservacoesParcela.Text)
      .adicionarParcela;

    FAtivarBotoes.ativarbotaoSalvarParcela;

    FEntityParcelasOrdem.getCampo('ID_ORDEM')
      .getValor(IntToStr(cds_AdicionarParcelaid_ordem.AsInteger))
      .sqlPesquisaEstatica.listarGrid(s_ParcelasOS);

    cds_AdicionarParcela.EmptyDataSet;

  end;

  if s_ParcelasOS.DataSet.State in [dsEdit] then
  begin
    FEntityParcelasOrdem.getVALOR_PARCELA(StrToCurr(edtValorParcela.Text))
      .getDATA_VENCIMENTO(edtVencimentoParcela.Text).gravarEdicaoParcelas;

    FAtivarBotoes.ativarbotaoSalvarParcela;

  end;

end;

procedure TformCriarConsultarOrdemServico.s_ParcelasOSDataChange
  (Sender: TObject; Field: TField);
begin
  with s_ParcelasOS.DataSet do
  begin


    edtNumeroParcela.Text := IntToStr(FieldByName('PARCELA').AsInteger);
    edtValorParcela.Text := CurrToStr(FieldByName('VALOR_PARCELA').AsCurrency);
    edtDescontoParcela.Text := CurrToStr(FieldByName('DESCONTO').AsCurrency);
    edtJurosParcelas.Text := CurrToStr(FieldByName('JUROS').AsFloat);
    edtMultaParcela.Text := CurrToStr(FieldByName('MULTA').AsCurrency);
    edtTotalParcela.Text := CurrToStr(FieldByName('VALOR_TOTAL').AsCurrency);
    edtHoraPagamento.Text := TimeToStr(FieldByName('HORA_PAGAMENTO')
      .AsDateTime);
    edtFormaPagamentoParcela.Text := FieldByName('FORMA_PAGAMENTO').AsString;
    edtPgtoParcela.Text := FieldByName('PGTO').AsString;
    edtObservacoesParcela.Text := FieldByName('OBSERVACAO').AsString;

    if FieldByName('DATA_VENCIMENTO').AsDateTime <> StrToDate('30/12/1899') then
      edtVencimentoParcela.Text :=
        DateToStr(FieldByName('DATA_VENCIMENTO').AsDateTime);

    if FieldByName('DATA_PAGAMENTO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataPagamentoParcela.DateTime := FieldByName('DATA_PAGAMENTO')
        .AsDateTime;

  end;
end;

procedure TformCriarConsultarOrdemServico.s_ServicosDataChange(Sender: TObject;
  Field: TField);
begin
  s_Servicos.DataSet.FieldByName('ID').Visible := false;
  s_Servicos.DataSet.FieldByName('SERVICO').DisplayLabel := 'Servi�os';
  s_Servicos.DataSet.FieldByName('SERVICO').DisplayWidth := 30;
  s_Servicos.DataSet.FieldByName('VALOR').DisplayLabel := 'valor';
  s_Servicos.DataSet.FieldByName('DESCRICAO').DisplayLabel := 'Descri��o';
end;

procedure TformCriarConsultarOrdemServico.limparDatas;
begin
  edtDataFabricacao.Clear;
  edtDataEntrada.Text := DateToStr(date);
  edtDataDeSaida.Clear;
  edtDataRetorno.Clear;
  // edtDataBaseVencimento.Clear;
  edtHoraSaida.Text := '00:00:00';
end;

procedure TformCriarConsultarOrdemServico.adicionarServico(codigo:integer; servico:string; valor:Currency);
begin

  if FEntityCriarOrdem.estadoDaTabela = 'insert' then
  begin
    if s_Servicos.DataSet.RecordCount >= 1 then
    begin
      FEntityServicosOrdem
                    .adicionarItemsTemporiamenteID(codigo)
                    .adicionarItemsTemporariamenteServico(servico)
                    .adicionarItemTemporariamenteValor(valor)
                    .adicionarItemsTemporariamente(s_tem_servicos_adicionados);
    end;
  end
  else if FEntityCriarOrdem.estadoDaTabela = 'edit' then
  begin

    FEntityServicosOrdem
                        .adicionarItemsTemporiamenteID(s_Servicos.DataSet.FieldByName('ID').AsInteger)
                        .adicionarItemsTemporariamenteServico(s_Servicos.DataSet.FieldByName('SERVICO').AsString)
                        .adicionarItemTemporariamenteValor(s_Servicos.DataSet.FieldByName('VALOR').AsCurrency)
                        .adicionarItemsTemporariamente(s_tem_servicos_adicionados);

    FEntityServicosOrdem
                        .adicionarItemsTemporiamenteID(s_Servicos.DataSet.FieldByName('ID').AsInteger)
                        .adicionarItemsTemporariamenteServico(s_Servicos.DataSet.FieldByName('SERVICO').AsString)
                        .adicionarItemTemporariamenteValor(s_Servicos.DataSet.FieldByName('VALOR').AsCurrency)
                        .adicionarItemsTemporariamente(s_tem_servicos_adicionados_edit);
  end;
end;

procedure TformCriarConsultarOrdemServico.Button1Click(Sender: TObject);
begin
  imprimirRecibo;
end;

procedure TformCriarConsultarOrdemServico.subtrairValoresServicosIncluidos;
var
  valorDaOS: Currency;
  subTotalDaOS: Currency;
begin

  valorDaOS := StrToCurr(edtTotalDaOS.Text);
  subTotalDaOS := StrToCurr(edtValorOrdem.Text);

  edtTotalDaOS.Text :=
    CurrToStr(valorDaOS - cds_tem_servicos_adicionadosvalor.AsCurrency);

  edtValorOrdem.Text :=
    CurrToStr(subTotalDaOS - cds_tem_servicos_adicionadosvalor.AsCurrency);

  cds_tem_servicos_adicionados.Delete;

end;

procedure TformCriarConsultarOrdemServico.selecionarOrdem;
begin // selecionar a OS ao chamar atrav�s do form  Ordem de Servico
  if codigoDaOS <> 0 then
  begin

    FEntityCriarOrdem.abrir.getCampo('ID').getValor(codigoDaOS.ToString)
      .sqlPesquisa.listarGrid(DataSource1);

    FEntityServicosOrdem.abrir.getCampo('ID_ORDEM')
      .getValor(DataSource1.DataSet.FieldByName('ID').AsInteger.ToString)
      .sqlPesquisaEstatica.listarItensDaOS(cds_tem_servicos_adicionados);

    FEntityParcelasOrdem.abrir.getCampo('ID_ORDEM')
      .getValor(DataSource1.DataSet.FieldByName('ID').AsInteger.ToString)
      .sqlPesquisa.listarGrid(s_ParcelasOS);

    edtNomeCliente.Text := TFactory.new.localizarRegistroEspecifico.getTabela
      ('CLIENTES').getCampoRetorno('nome').localizarRegistro('ID',
      DataSource1.DataSet.FieldByName('ID_CLIENTE').AsInteger);

    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;
    sbImprimirOS.Enabled := true;
    sbEstornarOS.Enabled := true;

    sbNovo.Enabled := false;
    sbSalvar.Enabled := false;

    if DataSource1.DataSet.FieldByName('PGTO').AsString = 'Estornada' then
    begin
      sbEstornarOS.Enabled := false;
      sbEditar.Enabled := false;
      sbGerarParcelas.Enabled := false;
    end;


    // habilitarBotoesQuitarParcela

  end
  else
  begin

    FEntityCriarOrdem.abrir.getCampo('ID').getValor('0').sqlPesquisa.listarGrid
      (DataSource1);

    FEntityServicosOrdem.abrir.getCampo('ID_ORDEM').getValor('0')
      .sqlPesquisaEstatica.listarItensDaOS(cds_tem_servicos_adicionados);

    FEntityParcelasOrdem.abrir.getCampo('ID_ORDEM').getValor('0')
      .sqlPesquisa.listarGrid(s_ParcelasOS);

    FAtivarBotoes.ativarBotoesIniciarForm;
  end;
end;

procedure TformCriarConsultarOrdemServico.popularComboBox;
begin

  FEntityTableServicos.FD_Table('SERVICOS').retornaTable(s_Servicos);

  TFactory.new.ftTable.FD_Table('SITUACAO_ORDEM')
    .getCampoTabela('SITUACAO_ORDEM').popularComponenteComboBox
    (edtSituacaoOrdem);

  TFactory.new.ftTable.FD_Table('FORMAS_PAGAMENTO')
    .getCampoTabela('FORMA_PAGAMENTO').popularComponenteComboBox
    (edtFormaPagamentoParcela);

  TFactory.new.ftTable.FD_Table('NUMERO_PARCELAS')
    .getCampoTabela('NUM_PARCELAS').popularComponenteComboBox
    (edtTotalDeParcelas);
 edtTotalDeParcelas.ItemIndex := 0;

end;

procedure TformCriarConsultarOrdemServico.prepararParaImprimir(value: Integer);
begin

  FEntityVisualizarOS.getCampo('ID_ORDEM').getValor(value.ToString)
    .sqlPesquisaEstatica.listarGrid(s_imprimirOS);

  FEntityVisualizasOSServicos.getCampo('ID_ORDEM').getValor(value.ToString)
    .sqlPesquisaEstatica.listarGrid(s_imprimirServicosOS);

  FEntityVisualizarOSParcelas.getCampo('ID_ORDEM').getValor(value.ToString)
    .sqlPesquisaEstatica.listarGrid(s_imprimirparcelasOS);

  FEntityVisualizarEmpresa.abrir.listarGrid(s_ImprimirEmpresa);

  FEntityVisualizarJuros.abrir.listarGrid(s_ImprimirInfoJuros);

end;

procedure TformCriarConsultarOrdemServico.imprimirRecibo;
begin

  FEntityImprimirRecibo.getCampo('ID_PARCELA')
    .getValor(IntToStr(s_ParcelasOS.DataSet.FieldByName('ID').AsInteger))
    .sqlPesquisaEstatica.listarGrid(s_ImprirmirRecibo).imprimirComprovante;

  prepararParaImprimir(DataSource1.DataSet.FieldByName('ID').AsInteger);

  frx_ImprimirRecibo.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/comprovante_pagamento.fr3');
  frx_ImprimirRecibo.ShowReport;

end;

procedure TformCriarConsultarOrdemServico.desabilitarBotoesParcelasEstornar;
begin
  sbAdicionarParcela.Enabled := true;
  sbQuitarParcela.Enabled := false;
  sbEstornarParcela.Enabled := false;
  sbExcluirParcela.Enabled := true;
  sbImprimirParcelas.Enabled := true;
  sbCancelar.Enabled := false;
end;

procedure TformCriarConsultarOrdemServico.Editarparcela1Click(Sender: TObject);
begin
  if s_ParcelasOS.DataSet.RecordCount >= 1 then
  begin

    if s_ParcelasOS.DataSet.FieldByName('PGTO').AsString = 'Nao' then
    begin
      FEntityParcelasOrdem.editar;
      sbSalvarParcela.Enabled := true;
      sbCancelarOperacaoParcela.Enabled := true;
    end;

  end;

end;

procedure TformCriarConsultarOrdemServico.habilitarBotoesQuitarParcela;
begin
  sbAdicionarParcela.Enabled := true;
  sbQuitarParcela.Enabled := true;
  sbEstornarParcela.Enabled := true;
  sbExcluirParcela.Enabled := true;
  sbImprimirParcelas.Enabled := true;
  sbCancelar.Enabled := false;
end;

procedure TformCriarConsultarOrdemServico.habilitarDesabilitarEdits(
  value: string);
begin

   if value = 'ativar' then
   begin

     edtCodigoOS.ReadOnly := true;
     edtCodigoCliente.ReadOnly := true;
     edtNomeCliente.ReadOnly := true;
     edtEquipamento.ReadOnly := false;
     edtMarca.ReadOnly := false;
     edtModelo.ReadOnly := false;
     edtNumeroDeSerie.ReadOnly := false;
     edtDefeitoRelatado.ReadOnly := false;
     edtLaudoTecnico.ReadOnly := false;
     edtSolucaoDoProblema.ReadOnly := false;
     edtSituacaoOrdem.Enabled := true;
     edtPrioridade.Enabled := true;
     edtDataEntrada.ReadOnly := false;
     edtDataDeSaida.ReadOnly := false;
     edtHoraSaida.ReadOnly := false;
     edtTecnicoResponsavel.ReadOnly := false;
     edtRetorno.ReadOnly := false;
     edtDataRetorno.ReadOnly := false;
     edtObservacao.ReadOnly := false;
     edtValorOrdem.ReadOnly := false;
     edtDesconto.ReadOnly := false;
     edtAcrescimo.ReadOnly := false;
     edtTotalDaOS.ReadOnly := false;
     edtTotalDeParcelas.Enabled := true;
     edtValorOrdemParcelado.ReadOnly := false;
     edtDataBaseVencimento.Enabled := true;

   end
   else if value = 'desativar' then
   begin

     edtCodigoOS.ReadOnly := true;
     edtCodigoCliente.ReadOnly := true;
     edtNomeCliente.ReadOnly := true;
     edtEquipamento.ReadOnly := true;
     edtMarca.ReadOnly := true;
     edtModelo.ReadOnly := true;
     edtNumeroDeSerie.ReadOnly := true;
     edtDefeitoRelatado.ReadOnly := true;
     edtLaudoTecnico.ReadOnly := true;
     edtSolucaoDoProblema.ReadOnly := true;
     edtSituacaoOrdem.Enabled := false;
     edtPrioridade.Enabled := false;
     edtDataEntrada.ReadOnly := true;
     edtDataDeSaida.ReadOnly := true;
     edtHoraSaida.ReadOnly := true;
     edtTecnicoResponsavel.ReadOnly := true;
     edtRetorno.ReadOnly := true;
     edtDataRetorno.ReadOnly := true;
     edtObservacao.ReadOnly := true;
     edtValorOrdem.ReadOnly := true;
     edtDesconto.ReadOnly := true;
     edtAcrescimo.ReadOnly := true;
     edtTotalDaOS.ReadOnly := true;
     edtTotalDeParcelas.Enabled := false;
     edtValorOrdemParcelado.ReadOnly := true;
     edtDataBaseVencimento.Enabled := true;

   end;

end;



procedure TformCriarConsultarOrdemServico.gravarInformacoesOS;
begin
  FEntityCriarOrdem
                  .getID_CLIENTE(edtCodigoCliente.Text)
                  .getEQUIPAMENTO(edtEquipamento.Text)
                  .getMarca(edtMarca.Text)
                  .getModelo(edtModelo.Text)
                  .getNUMERO_SERIE(edtNumeroDeSerie.Text)
                  .getDATA_FABRICACAO(edtDataFabricacao.Text)
                  .getDEFEITO_RELATADO(edtDefeitoRelatado.Text)
                  .getLAUDO_DO_TECNICO(edtLaudoTecnico.Text)
                  .getSOLUCAO_DO_PROBLEMA(edtSolucaoDoProblema.Text)
                  .getSITUACAO_DA_ORDEM(edtSituacaoOrdem.Text)
                  .getPRIORIDADE(edtPrioridade.Text)
                  .getDataCadastro(edtDataEntrada.Text)
                  .getDataFinalizacao(edtDataDeSaida.Text)
                  .getHoraFinalizacao(edtHoraSaida.Text)
                  .getIdTecnico(FIdTecnico.ToString)
                  .getTecnico(edtTecnicoResponsavel.Text)
                  .getRETORNO(edtRetorno.Text)
                  .getDATA_RETORNO(edtDataRetorno.Text)
                  .getObservacao(edtObservacao.Text)
                  .getVALOR_DA_ORDEM(edtValorOrdem.Text)
                  .getDesconto(edtDesconto.Text)
                  .getACRESCIMO(edtAcrescimo.Text)
                  .getTotalDoOrcamento(edtTotalDaOS.Text)
                  .getTOTAL_PARCELAS(edtTotalDeParcelas.Text)
                  .getDataBaseVencimento(edtDataBaseVencimento.Text)
                  .getVALOR_DA_PARCELA(edtValorOrdemParcelado.Text)
                  .gravar;

    showmessage('Ordem de Servi�o inserida com sucesso');

end;

procedure TformCriarConsultarOrdemServico.gerarInformacoesPagamentoOS;
begin

  if application.MessageBox('Deseja gerar as informa��es para pagamento ou parcelamento agora?',
       'Pergutna do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
  begin
    FEntityParcelasOrdem
                      .getID_ORDEM(FEntityCriarOrdem.setId)
                      .getID_CLIENTE(FEntityCriarOrdem.setId_Cliente)
                      .getTOTAL_PARCELAS(FEntityCriarOrdem.setTotalDeParcelas)
                      .getVALOR_PARCELA(FEntityCriarOrdem.setValorDaParcelas)
                      .getDATA_VENCIMENTO(DateToStr(FEntityCriarOrdem.setDataBaseVencimento))
                      .gerarParcelas;

    showmessage('Parcelas / Informa��es para pagamento foram geradas com sucesso!');

  end;
end;

procedure TformCriarConsultarOrdemServico.atualizarValores;
var
  valorOS: Currency;
  valorDesconto: Currency;
  valorAcrescimo: Currency;
  totalOS:Currency;
  servicosIncluidos: currency;
begin

  if edtValorOrdem.Text <> EmptyStr then
  begin
    valorOS := StrToCurr(edtValorOrdem.Text);
  end
  else
  begin
    valorOS := 0;
  end;

  if edtDesconto.Text <> EmptyStr then
  begin
    valorDesconto := StrToCurr(edtDesconto.Text);
  end
  else
  begin
    valorDesconto := 0;
  end;

  if edtAcrescimo.Text <> EmptyStr then
  begin
    valorAcrescimo := StrToCurr(edtAcrescimo.Text);
  end
  else
  begin
    valorAcrescimo := 0;
  end;

  servicosIncluidos := 0;

  if s_tem_servicos_adicionados.DataSet.RecordCount >= 1 then
  begin

     s_tem_servicos_adicionados.DataSet.First;

  while not s_tem_servicos_adicionados.DataSet.eof do
  begin

    servicosIncluidos := servicosIncluidos + s_tem_servicos_adicionados.DataSet.FieldByName
    ('valor').AsCurrency;

    s_tem_servicos_adicionados.DataSet.Next;

  end;
  end;

  edtTotalDaOS.Text := CurrToStr((valorOS - valorDesconto) + (valorAcrescimo + servicosIncluidos));

end;

procedure TformCriarConsultarOrdemServico.caluclarValorDoParcelamento;
var
  valorMaoDeObra: Currency;
  valorDoDesconto: Currency;
  valorDoAcrescimo: Currency;
  qtdeParcelas: Integer;
  totalDaOS: Currency;
begin
  if edtValorOrdem.Text <> EmptyStr then
    valorMaoDeObra := StrToCurr(edtValorOrdem.Text)
  else
    valorMaoDeObra := 0;
  if edtDesconto.Text <> EmptyStr then
    valorDoDesconto := StrToCurr(edtDesconto.Text)
  else
    valorDoDesconto := 0;
  if edtAcrescimo.Text <> EmptyStr then
    valorDoAcrescimo := StrToCurr(edtAcrescimo.Text)
  else
    valorDoAcrescimo := 0;

  atualizarValores;
  totalDaOS := StrToCurr(edtTotalDaOS.Text);

  qtdeParcelas := StrToInt(edtTotalDeParcelas.Text);
  edtTotalDaOS.Text := CurrToStr(totalDaOS);

  edtValorOrdemParcelado.Text := CurrToStr(TFactory.new.calcularParcela.getValor(totalDaOS)
                                .getNumeroParcelas(qtdeParcelas).valorDeCadaParcela);

end;

procedure TformCriarConsultarOrdemServico.abreATabelaDeParcelas;
begin
  FEntityParcelasOrdem.abrir.getCampo('ID_ORDEM').getValor('0')
    .sqlPesquisa.listarGrid(s_ParcelasOS);
end;

end.
