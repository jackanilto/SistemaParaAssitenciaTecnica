{ Criar c�difica��o para as partes
  -calcular o total da ordem com desconto --FEITO
  -calcular o total da ordem com acrescimo --FEITO
  -chamar o cadastro de clientes ao pesquisar um cliente e este n�o existir --FEITO
  -inserir a c�difica��o do bot�o editar --FEITO
  -inserir a c�difica��o do bot�o deletar --FEITO
  -inserir o codifica��o do bot�o cancelar --FEITO
  -criar a rotina para estornar a ordem --FEITO

  --criar os processo para a inser��o dos itens do or�amento e calcular
  automaticamento o valor total da ordem
  --criar a rotina para inser��o dos pedidos de compra

  --criar as rotinas para a gera��o de parcelas:
  gerar parcelas
  rotina para quitar parcelas
  rotina para incluir parcelas
  rotina para deletar parcelas
  rotina para cancelar
  rotina para estornar }

unit Form.Ordem.Servico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UInterfaces,
  UClasse.Entity.Ordem.Servico, UClasse.Entity.Cadastro.Clientes, Vcl.Mask,
  UClasse.Entity.LIstar.Ordens.Clientes, UClasse.Entity.Ordem.Itens;

type
  TformOrdemDeServico = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    sbNovo: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbEditar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    ds_DadosClientes: TDataSource;
    ds_Ordens: TDataSource;
    PageControl1: TPageControl;
    tbListaDeOrdens: TTabSheet;
    Panel4: TPanel;
    tbCadastroOrdens: TTabSheet;
    tbItensOrdem: TTabSheet;
    tbPedidoDeCompra: TTabSheet;
    tbParcelas: TTabSheet;
    Panel7: TPanel;
    Panel6: TPanel;
    Panel2: TPanel;
    edtValorDaOrdem: TEdit;
    edtDesconto: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtAcresimo: TEdit;
    Label18: TLabel;
    edtTotalDaOrdem: TEdit;
    edtPgto: TComboBox;
    Label24: TLabel;
    edtTotalDeParcelas: TEdit;
    Label23: TLabel;
    edtParcelado: TComboBox;
    Label22: TLabel;
    edtFormaDePagamento: TComboBox;
    Label21: TLabel;
    edtDataPagamento: TMaskEdit;
    Label26: TLabel;
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtCodigo: TEdit;
    edtCodigoCliente: TEdit;
    edtCliente: TEdit;
    edtMarca: TEdit;
    edtEquipamento: TEdit;
    edtModelo: TEdit;
    edtNumeroSerie: TEdit;
    edtDefeitoRelatado: TMemo;
    edtLaudoTecnico: TMemo;
    edtSolucaoDoProblema: TMemo;
    edtMotivoDoRetorno: TEdit;
    edtObservacaoes: TEdit;
    edtCodigoTecnico: TEdit;
    edtDataFabricacao: TMaskEdit;
    edtDataDeEntrada: TMaskEdit;
    edtDataFinalzacao: TMaskEdit;
    edtDataRetorno: TMaskEdit;
    edtPrioridade: TComboBox;
    edtSituacaoDaOrdem: TComboBox;
    edtTecnicoResponsave: TEdit;
    sbPesquisarCliente: TSpeedButton;
    sbPequisarTecnico: TSpeedButton;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    sbEstornarOrdem: TSpeedButton;
    ds_itensOrdem: TDataSource;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ds_DadosClientesDataChange(Sender: TObject; Field: TField);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure sbNovoClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sbPesquisarClienteClick(Sender: TObject);
    procedure sbPequisarTecnicoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure ds_OrdensDataChange(Sender: TObject; Field: TField);
    procedure edtValorDaOrdemExit(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtAcresimoExit(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbEstornarOrdemClick(Sender: TObject);
    procedure sbAdicionarItemClick(Sender: TObject);
  private
    { Private declarations }
    FEntityOrdem: iOrdemServico;
    FEntityListaOrdens: iListaClientesOrdemServico;
    FEntityItensOrdem: iItensOrdem;
    FCodigoClienteSelecionado: Integer;
    FNomeClienteSelecionado: string;
  public
    { Public declarations }
  end;

var
  formOrdemDeServico: TformOrdemDeServico;

implementation

{$R *.dfm}

uses Form.Localizar.Clientes.Ordem, UFactory, Form.Localizar.Tecnico.Ordem,
  Form.Adicionar.Itens.Ordem;

procedure TformOrdemDeServico.DBGrid1CellClick(Column: TColumn);
begin
  if ds_DadosClientes.DataSet.RecordCount >= 1 then
  begin
    FEntityOrdem.getCampo('ID')
      .getValor(IntTostr(ds_DadosClientes.DataSet.FieldByName('ID_ORDEM')
      .AsInteger)).sqlPesquisa.listarGrid(ds_Ordens);
  end
  else
  begin

  end;

end;

procedure TformOrdemDeServico.DBGrid2CellClick(Column: TColumn);
begin
  if ds_DadosClientes.DataSet.RecordCount >= 1 then
  begin
    FCodigoClienteSelecionado := ds_DadosClientes.DataSet.FieldByName('ID')
      .AsInteger;
    // FNomeClienteSelecionado := ds_DadosClientes.DataSet.FieldByName
    // ('NOME').AsString;
    // FEntityOrdem.getCampo('ID_CLIENTE')
    // .getValor(FCodigoClienteSelecionado.ToString).sqlPesquisa.listarGrid
    // (ds_OrdensDoClientes);
  end
  else
  begin
    FCodigoClienteSelecionado := null;
    FNomeClienteSelecionado := '';
  end;
end;

procedure TformOrdemDeServico.ds_DadosClientesDataChange(Sender: TObject;
  Field: TField);
begin

  // Image1.Picture.Assign(ds_DadosClientes.DataSet.FieldByName('foto'));
  //
  // if Image1.Picture.Graphic.Empty then
  // Image1.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +
  // '/No_User.png');

end;

procedure TformOrdemDeServico.ds_OrdensDataChange(Sender: TObject;
  Field: TField);
begin
  with ds_Ordens.DataSet do
  begin

    edtCodigo.Text := IntTostr(FieldByName('id').AsInteger);
    edtCodigoCliente.Text := IntTostr(FieldByName('ID_CLIENTE').AsInteger);
    edtEquipamento.Text := FieldByName('EQUIPAMENTO').AsString;
    edtDefeitoRelatado.Text := FieldByName('DEFEITO_RELATADO').AsString;
    edtMarca.Text := FieldByName('MARCA').AsString;
    edtModelo.Text := FieldByName('MODELO').AsString;
    edtNumeroSerie.Text := FieldByName('NUMERO_SERIE').AsString;
    edtLaudoTecnico.Text := FieldByName('LAUDO_DO_TECNICO').AsString;
    edtSolucaoDoProblema.Text := FieldByName('SOLUCAO_DO_PROBLEMA').AsString;
    edtPrioridade.Text := FieldByName('PRIORIDADE').AsString;
    edtSituacaoDaOrdem.Text := FieldByName('SITUACAO_DA_ORDEM').AsString;
    // edtFuncionario.Text := IntTostr(FieldByName('ID_FUNCIONARIO').AsInteger);
    edtCodigoTecnico.Text := IntTostr(FieldByName('ID_TECNICO_RESPONSAVEL')
      .AsInteger);
    edtTecnicoResponsave.Text := FieldByName('TECNICO_RESPONSAVEL').AsString;
    edtMotivoDoRetorno.Text := FieldByName('RETORNO').AsString;
    edtObservacaoes.Text := FieldByName('OBSERVACAO').AsString;

    edtValorDaOrdem.Text := CurrToStr(FieldByName('VALOR_DA_ORDEM').AsCurrency);
    edtDesconto.Text := CurrToStr(FieldByName('DESCONTO').AsCurrency);
    edtAcresimo.Text := CurrToStr(FieldByName('ACRESCIMO').AsCurrency);
    edtTotalDaOrdem.Text := CurrToStr(FieldByName('TOTAL_ORCAMENTO')
      .AsCurrency);
    edtFormaDePagamento.Text := FieldByName('FORMA_PAGAMENTO').AsString;
    edtParcelado.Text := FieldByName('PARCELADO').AsString;
    edtTotalDeParcelas.Text := IntTostr(FieldByName('TOTAL_PARCELAS')
      .AsInteger);
    edtPgto.Text := FieldByName('PGTO').AsString;

    // Tudo referentes as datas
    if FieldByName('DATA_FABRICACAO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataFabricacao.Text := datetostr(FieldByName('DATA_FABRICACAO')
        .AsDateTime);

    if FieldByName('DATA_RETORNO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataRetorno.Text := datetostr(FieldByName('DATA_RETORNO').AsDateTime);

    if FieldByName('DATA_ENTRADA').AsDateTime <> StrToDate('30/12/1899') then
      edtDataDeEntrada.Text :=
        datetostr(FieldByName('DATA_ENTRADA').AsDateTime);

    if FieldByName('DATA_FINALIZACAO').AsDateTime <> StrToDate('30/12/1899')
    then
      edtDataFinalzacao.Text := datetostr(FieldByName('DATA_FINALIZACAO')
        .AsDateTime);

    if FieldByName('DATA_PAGAMENTO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataPagamento.Text := datetostr(FieldByName('DATA_PAGAMENTO')
        .AsDateTime);

  end;

  edtCliente.Text := ds_DadosClientes.DataSet.FieldByName
    ('NOME_CLIENTE').AsString;
end;

procedure TformOrdemDeServico.edtAcresimoExit(Sender: TObject);
begin
  edtTotalDaOrdem.Text := FEntityOrdem.calcularAcrescimo(edtValorDaOrdem,
    edtDesconto, edtAcresimo);
end;

procedure TformOrdemDeServico.edtDescontoExit(Sender: TObject);
begin

  edtTotalDaOrdem.Text := FEntityOrdem.calcularDesconto(edtValorDaOrdem,
    edtDesconto);

end;

procedure TformOrdemDeServico.edtValorDaOrdemExit(Sender: TObject);
begin

  if ((edtValorDaOrdem.Text <> EmptyStr) and (sbNovo.Enabled = false)) then
  begin

    try
      StrToCurr(edtValorDaOrdem.Text);
    except
      on e: exception do
      begin
        edtValorDaOrdem.SetFocus;
        raise exception.Create
          ('Informe um valor v�lido para o campo Valor da Ordem.');
      end;

    end;

    edtTotalDaOrdem.Text := edtValorDaOrdem.Text;

  end;

end;

procedure TformOrdemDeServico.FormCreate(Sender: TObject);
begin
  FEntityOrdem := TEntityOrdemServico.new;
  FEntityListaOrdens := TEntityListarOrdensClientes.new;
  FEntityItensOrdem := TEntityOrdemItens.new;

  TFactory.new.ftTable.FD_Table('SITUACAO_ORDEM')
    .getCampoTabela('SITUACAO_ORDEM').popularComponenteComboBox
    (edtSituacaoDaOrdem);

  TFactory.new.ftTable.FD_Table('FORMAS_PAGAMENTO')
    .getCampoTabela('FORMA_PAGAMENTO').popularComponenteComboBox
    (edtFormaDePagamento);

  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformOrdemDeServico.FormShow(Sender: TObject);
begin
  FEntityListaOrdens.abrir.listarGrid(ds_DadosClientes);
  FEntityOrdem.abrir.getCampo('ID').getValor('0').listarGrid(ds_Ordens);
  FEntityItensOrdem.abrir.listarGrid(ds_itensOrdem);
end;

procedure TformOrdemDeServico.Panel1MouseDown(Sender: TObject;
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

procedure TformOrdemDeServico.sbAdicionarItemClick(Sender: TObject);
begin
  formAdicionarItensOrdem := TformAdicionarItensOrdem.Create(self);
  TFactory.new.criarJanela.FormShow(formAdicionarItensOrdem, '');
end;

procedure TformOrdemDeServico.sbCancelarClick(Sender: TObject);
begin
  FEntityOrdem.cancelar;
end;

procedure TformOrdemDeServico.sbEditarClick(Sender: TObject);
begin
  if ds_Ordens.DataSet.RecordCount >= 1 then
  begin
    FEntityOrdem.editar;
  end;
end;

procedure TformOrdemDeServico.sbEstornarOrdemClick(Sender: TObject);
begin
  if ds_Ordens.DataSet.RecordCount >= 1 then
    FEntityOrdem.estornarOrdem(ds_Ordens.DataSet.FieldByName('ID').AsInteger);
end;

procedure TformOrdemDeServico.sbExcluirClick(Sender: TObject);
begin
  if ds_Ordens.DataSet.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema', MB_YESNO + MB_ICONWARNING) = mryes then
    begin
      FEntityOrdem.deletar;
    end;

  end;

end;

procedure TformOrdemDeServico.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformOrdemDeServico.sbNovoClick(Sender: TObject);
begin
  lblCaption.Caption := self.Caption +
    ' > Inserindo uma nova ordem de servi�o.';
  FEntityOrdem.inserir;
  PageControl1.ActivePage := tbCadastroOrdens;
  edtValorDaOrdem.Text := '0';
  edtDesconto.Text := '0';
  edtAcresimo.Text := '0';
  edtTotalDaOrdem.Text := '0';
  sbNovo.Enabled := false;
end;

procedure TformOrdemDeServico.sbPequisarTecnicoClick(Sender: TObject);
begin
  if sbNovo.Enabled = false then
  begin
    formLocalizarTecnico := TformLocalizarTecnico.Create(application);
    TFactory.new.criarJanela.FormShow(formLocalizarTecnico, '');
  end;
end;

procedure TformOrdemDeServico.sbPesquisarClienteClick(Sender: TObject);
begin
  if sbNovo.Enabled = false then
  begin
    formLocalizarClientesOrdem := TformLocalizarClientesOrdem.Create(self);
    TFactory.new.criarJanela.FormShow(formLocalizarClientesOrdem, '');
  end;
end;

procedure TformOrdemDeServico.sbSalvarClick(Sender: TObject);
begin
  FEntityOrdem.getID_CLIENTE(edtCodigoCliente.Text)
    .getEQUIPAMENTO(edtEquipamento.Text).getMarca(edtMarca.Text)
    .getModelo(edtModelo.Text).getNUMERO_SERIE(edtNumeroSerie.Text)
    .getDATA_FABRICACAO(edtDataFabricacao.Text)
    .getDataCadastro(edtDataDeEntrada.Text).getDEFEITO_RELATADO
    (edtDefeitoRelatado.Lines.Text).getLAUDO_DO_TECNICO(edtLaudoTecnico.Text)
    .getSOLUCAO_DO_PROBLEMA(edtSolucaoDoProblema.Text)
    .getPRIORIDADE(edtPrioridade.Text).getSITUACAO_DA_ORDEM
    (edtSituacaoDaOrdem.Text).getDataFinalizacao(edtDataFinalzacao.Text)
    .getIdTecnico(edtCodigoTecnico.Text).getTecnico(edtTecnicoResponsave.Text)
    .getDATA_RETORNO(edtDataRetorno.Text).getRETORNO(edtMotivoDoRetorno.Text)
    .getObservacao(edtObservacaoes.Text).getVALOR_DA_ORDEM(edtValorDaOrdem.Text)
    .getDesconto(edtDesconto.Text).getACRESCIMO(edtAcresimo.Text)
    .getTotalDoOrcamento(edtTotalDaOrdem.Text).getFORMA_PAGAMENTO
    (edtFormaDePagamento.Text).getPARCELADO(edtParcelado.Text)
    .getTOTAL_PARCELAS(edtTotalDeParcelas.Text).getPGTO(edtPgto.Text)
    .getDataPagamento(edtDataPagamento.Text).gravar;

  showmessage('Opera��o realizada com sucesso!');

  FEntityListaOrdens.abrir.getCampo('ID_ORDEM').getValor(edtCodigo.Text)
    .sqlPesquisa.listarGrid(ds_DadosClientes);

end;

end.
