unit Form.Acesso.Recursos.Fucnionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Configurar.Acesso.Funcionario,
  Vcl.ComCtrls;

type
  TformConfigurarAcessoFuncionario = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    tsCadastros: TTabSheet;
    tsMovimentacao: TTabSheet;
    tsRelatorios: TTabSheet;
    tsCaixa: TTabSheet;
    tsExtras: TTabSheet;
    edtCad_Produto: TComboBox;
    Label1: TLabel;
    edtCad_Cliente: TComboBox;
    Label2: TLabel;
    edtCad_Funcionario: TComboBox;
    Label3: TLabel;
    edtCad_Transportadora: TComboBox;
    Label6: TLabel;
    edtCad_Fornecedores: TComboBox;
    Label7: TLabel;
    edtCad_Marcas: TComboBox;
    Label8: TLabel;
    edtCad_Grupos: TComboBox;
    Label9: TLabel;
    edtCad_MeiosPagamento: TComboBox;
    Label10: TLabel;
    edtCad_TipoRetirada: TComboBox;
    Label11: TLabel;
    edtCad_ConfigParcelas: TComboBox;
    Label12: TLabel;
    edtCad_AtividadeFuncionario: TComboBox;
    Label13: TLabel;
    edtCad_ContasAPagar: TComboBox;
    Label14: TLabel;
    edtCad_ProblemasFrequentes: TComboBox;
    Label15: TLabel;
    edtCad_SituacaoOrdem: TComboBox;
    lblSituacaoOrdem: TLabel;
    edtCad_Servicos: TComboBox;
    lblServicos: TLabel;
    edtCad_DadosEmpresa: TComboBox;
    lblEmpresa: TLabel;
    edtCad_NumeroParcelas: TComboBox;
    lblNumParcelas: TLabel;
    edtMov_Entradas: TComboBox;
    Label20: TLabel;
    edtMov_SaidaProdutos: TComboBox;
    Label21: TLabel;
    edtMov_OrdemServico: TComboBox;
    Label22: TLabel;
    edtMov_CriarOS: TComboBox;
    Label23: TLabel;
    edtMov_VendaDeProdutos: TComboBox;
    Label24: TLabel;
    edtMov_VisualizarParcela: TComboBox;
    Label25: TLabel;
    edtMov_VisualizarVendas: TComboBox;
    Label26: TLabel;
    edtMov_VisualizarParcelaOS: TComboBox;
    Label27: TLabel;
    edtRel_Clientes: TComboBox;
    Label28: TLabel;
    edtRel_HistoricoOS: TComboBox;
    Label29: TLabel;
    edtRel_ParcelaAReceberOS: TComboBox;
    Label30: TLabel;
    edtRel_ParcelaAReceberVenda: TComboBox;
    Label31: TLabel;
    edtRel_ParcelaPagasOS: TComboBox;
    Label32: TLabel;
    edtRel_ParcelasPagasVendas: TComboBox;
    Label33: TLabel;
    edtRel_OsEstornadas: TComboBox;
    Label34: TLabel;
    edtRel_VendasEstornadas: TComboBox;
    Label35: TLabel;
    edtRel_ContasAPagar: TComboBox;
    Label36: TLabel;
    edtRel_ReparosPorPeriodo: TComboBox;
    Label37: TLabel;
    edtRel_ReparosPorTecnico: TComboBox;
    Label38: TLabel;
    edtRel_OsPorSituacao: TComboBox;
    Label39: TLabel;
    edtRel_RelatorioOS: TComboBox;
    Label40: TLabel;
    edtRel_Fornecedores: TComboBox;
    Label41: TLabel;
    edtRel_OSInadimplentes: TComboBox;
    Label42: TLabel;
    edtRel_Produtos: TComboBox;
    Label43: TLabel;
    edtRel_SituacaoEstoque: TComboBox;
    Label44: TLabel;
    edtRel_ProdutosMaisVendidos: TComboBox;
    Label45: TLabel;
    edtRel_Vendas: TComboBox;
    Label46: TLabel;
    edtRel_VendasInadimplentes: TComboBox;
    Label47: TLabel;
    edtRel_ServicosMaisRealzados: TComboBox;
    Label48: TLabel;
    edtRel_SaidaDeProdutos: TComboBox;
    Label49: TLabel;
    edtRel_EntradasDeProdutos: TComboBox;
    Label50: TLabel;
    edtRel_VendaPorFuncionarios: TComboBox;
    Label51: TLabel;
    edtRel_Trasportadora: TComboBox;
    Label52: TLabel;
    edtRel_RetiradaDeValores: TComboBox;
    Label53: TLabel;
    edtRel_ProblemasFrequentes: TComboBox;
    Label54: TLabel;
    edtCaixa_EncerramentoCaixa: TComboBox;
    Label55: TLabel;
    edtCaixa_ReaberturaCaixa: TComboBox;
    Label56: TLabel;
    edtCaixa_RetiradaDeValores: TComboBox;
    Label57: TLabel;
    edtCaixa_ComissoesTecnicos: TComboBox;
    Label58: TLabel;
    edtCaixa_HistoricoCaixa: TComboBox;
    Label59: TLabel;
    edtCaixa_MovimentacaoCaixa: TComboBox;
    Label60: TLabel;
    edtExtras_ConfigurarBackup: TComboBox;
    Label61: TLabel;
    edtExtras_BackupManual: TComboBox;
    Label62: TLabel;
    Label16: TLabel;
    edtCaixa_IniciarCaixa: TComboBox;
    Label17: TLabel;
    edtExtra_ConfigBD: TComboBox;
    Label18: TLabel;
    Label19: TLabel;
    edtMov_AdicionarParcela: TComboBox;
    edtMov_ExcluirParcela: TComboBox;
    Label63: TLabel;
    edtMov_EstornarParcela: TComboBox;
    ComboBox1: TComboBox;
    Label64: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ComboBox1Change(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    procedure atribuirValores(value:string);
    var
      FEntityAcesso:iNivelAcessoFuncionario;
  public
    { Public declarations }
  end;

var
  formConfigurarAcessoFuncionario: TformConfigurarAcessoFuncionario;

implementation

{$R *.dfm}

uses Form.Cadastro.Funcionarios, softMeter_globalVar;

procedure TformConfigurarAcessoFuncionario.atribuirValores(value: string);
var
  i: Integer;
begin

    for i := 0 to ComponentCount -1 do
     if Components[i] is TComboBox then
        TComboBox(Components[i]).Text := value;

    end;

procedure TformConfigurarAcessoFuncionario.ComboBox1Change(Sender: TObject);
begin
  inherited;

  if DataSource1.DataSet.State in [dsInsert, dsEdit] then
  begin
    if ComboBox1.Text = 'Permitir acesso a todos os recursos do sistema' then
      atribuirValores('Sim')
    else
      atribuirValores('Nao');
  end;

end;

procedure TformConfigurarAcessoFuncionario.DataSource1DataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin

    edtCad_Produto.Text := FieldByName('formCadProdutos').AsString;
    edtCad_Cliente.Text := FieldByName('formCadDeClientes').AsString;
    edtCad_Funcionario.Text := FieldByName('formCadDeFuncionarios').AsString;
    edtCad_Transportadora.Text := FieldByName('formCadTransportadora').AsString;
    edtCad_Fornecedores.Text := FieldByName('formCadFornecedores').AsString;
    edtCad_Marcas.Text := FieldByName('formCadastroMarcas').AsString;
    edtCad_Grupos.Text := FieldByName('formCadastroGrupos').AsString;
    edtCad_MeiosPagamento.Text := FieldByName('formFormaPagamento').AsString;
    edtCad_TipoRetirada.Text := FieldByName('formTipoRetiradas').AsString;
    edtCad_ConfigParcelas.Text := FieldByName('formConfigParcelas').AsString;
    edtCad_AtividadeFuncionario.Text := FieldByName('formAtFuncionario').AsString;
    edtCad_ContasAPagar.Text := FieldByName('formCadContasAPagar').AsString;
    edtCad_ProblemasFrequentes.Text := FieldByName('formCadProblemasFrequentes').AsString;
    edtCad_SituacaoOrdem.Text := FieldByName('formCadSituacoesOrdem').AsString;
    edtCad_Servicos.Text := FieldByName('formCadDeServicos').AsString;
    edtCad_DadosEmpresa.Text := FieldByName('formCadEmpresa').AsString;
    edtCad_NumeroParcelas.Text := FieldByName('formNumParcelas').AsString;

    edtMov_Entradas.Text := FieldByName('formEntDeProdutos').AsString;
    edtMov_SaidaProdutos.Text := FieldByName('formSaidaDeProdutos').AsString;
    edtMov_OrdemServico.Text := FieldByName('formOrdemServico').AsString;
    edtMov_CriarOS.Text := FieldByName('formCConsOrdemServico').AsString;
    edtMov_VendaDeProdutos.Text := FieldByName('formVendas').AsString;
    edtMov_VisualizarParcela.Text := FieldByName('formQuitarParcVendas').AsString;
    edtMov_VisualizarVendas.Text := FieldByName('formVisualizarVendas').AsString;
    edtMov_VisualizarParcelaOS.Text := FieldByName('formQuitarParcelaOS').AsString;
    edtMov_AdicionarParcela.Text := FieldByName('adicionarParcela').AsString;
    edtMov_ExcluirParcela.Text := FieldByName('excluirParcela').AsString;
    edtMov_EstornarParcela.Text := FieldByName('estornar').AsString;

    edtRel_Clientes.Text := FieldByName('formRelClientes').AsString;
    edtRel_HistoricoOS.Text := FieldByName('formRelHistoricoOS').AsString;
    edtRel_ParcelaAReceberOS.Text := FieldByName('formRelContasAReceberOS').AsString;
    edtRel_ParcelaAReceberVenda.Text := FieldByName('formRelContasAReceberVenda').AsString;
    edtRel_ParcelaPagasOS.Text := FieldByName('formRelParcelasPagasOS').AsString;
    edtRel_ParcelasPagasVendas.Text := FieldByName('FORMRELATORIOPARCELASPAGASVENDA').AsString;
    edtRel_OsEstornadas.Text := FieldByName('formOSEstornadas').AsString;
    edtRel_VendasEstornadas.Text := FieldByName('formRelVendasEstornadas').AsString;
    edtRel_ContasAPagar.Text := FieldByName('formRelContasAPagar').AsString;
    edtRel_ReparosPorPeriodo.Text := FieldByName('formRelReparosPorPeriodo').AsString;
    edtRel_ReparosPorTecnico.Text := FieldByName('formRelatOSPorTecnico').AsString;
    edtRel_OsPorSituacao.Text := FieldByName('formRelatOSPorStatus').AsString;
    edtRel_RelatorioOS.Text := FieldByName('formRelatOrdemDeServico').AsString;
    edtRel_Fornecedores.Text := FieldByName('formRelatFornecedores').AsString;
    edtRel_OSInadimplentes.Text := FieldByName('formRelatOSInadimplentes').AsString;
    edtRel_Produtos.Text := FieldByName('formRelatDeProdutos').AsString;
    edtRel_SituacaoEstoque.Text := FieldByName('formRelatSituacaoDoEstoque').AsString;
    edtRel_ProdutosMaisVendidos.Text := FieldByName('formRelatProdVendidos').AsString;
    edtRel_Vendas.Text := FieldByName('formRelatVendas').AsString;
    edtRel_VendasInadimplentes.Text := FieldByName('formRelatVendasInadimp').AsString;
    edtRel_ServicosMaisRealzados.Text := FieldByName('formRelatServicosMaisRealiz').AsString;
    edtRel_SaidaDeProdutos.Text := FieldByName('formRelatSaidaDeProdutos').AsString;
    edtRel_EntradasDeProdutos.Text := FieldByName('formRelatEntrDeProdutos').AsString;
    edtRel_VendaPorFuncionarios.Text := FieldByName('formRelatVendasFuncionario').AsString;
    edtRel_Trasportadora.Text := FieldByName('formRelatTransportadora').AsString;
    edtRel_RetiradaDeValores.Text := FieldByName('formRelatHistoricoCaixa').AsString;
    edtRel_ProblemasFrequentes.Text := FieldByName('formRelatProblFrequentes').AsString;

    edtCaixa_EncerramentoCaixa.Text := FieldByName('formEncerramentoCaixa').AsString;
    edtCaixa_ReaberturaCaixa.Text := FieldByName('formReaberturaDeCaixa').AsString;
    edtCaixa_RetiradaDeValores.Text := FieldByName('formRetiradaDeValores').AsString;
    edtCaixa_ComissoesTecnicos.Text := FieldByName('FORMCOMISSOESTECNICOS').AsString;
    edtCaixa_HistoricoCaixa.Text := FieldByName('formComissoesTecnicos').AsString;
    edtCaixa_MovimentacaoCaixa.Text := FieldByName('formMovimentacaoCaixa').AsString;
    edtCaixa_IniciarCaixa.Text := FieldByName('formIniciarCaixa').AsString;

    edtExtras_ConfigurarBackup.Text := FieldByName('formConfigBackUp').AsString;
    edtExtras_BackupManual.Text := FieldByName('formBackUpManual').AsString;
    edtExtra_ConfigBD.Text := FieldByName('formConfigConexaoBanco').AsString;




  end;
end;

procedure TformConfigurarAcessoFuncionario.DBGrid1CellClick(Column: TColumn);
begin
  inherited;

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;
  end
  else
  begin
    sbEditar.Enabled := false;
    sbExcluir.Enabled := false;
  end;

end;

procedure TformConfigurarAcessoFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityAcesso := TEntityConfigAcessoFuncionario.new;
  dllSoftMeter.sendEvent('Config acesso recursos funcionarios', 'config acesso recursos funcionarios', 0);
end;

procedure TformConfigurarAcessoFuncionario.FormShow(Sender: TObject);
begin
  inherited;

  lblCaption.Caption := self.Caption;
  FEntityAcesso
              .abrir
              .getCampo('id_funcionario')
              .getValor(formCadastroDeFuncionarios.DataSource1.DataSet.FieldByName('id').AsInteger.ToString)
              .sqlPesquisa
              .listarGrid(DataSource1);

  if DataSource1.DataSet.RecordCount = 0 then
  begin
    sbNovo.Click;
    DataSource1.DataSet.FieldByName('ID_FUNCIONARIO').AsInteger := formCadastroDeFuncionarios.DataSource1.DataSet.FieldByName('ID').AsInteger;
    DataSource1.DataSet.FieldByName('FUNCIONARIO').AsString := formCadastroDeFuncionarios.DataSource1.DataSet.FieldByName('NOME').AsString;
  end
  else
  begin
    sbEditar.Click;
  end;

end;

procedure TformConfigurarAcessoFuncionario.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityAcesso.cancelar;
end;

procedure TformConfigurarAcessoFuncionario.sbEditarClick(Sender: TObject);
begin

  FEntityAcesso.editar;
  inherited;
    PageControl1.TabIndex := 0;
    edtCad_Produto.SetFocus;
end;

procedure TformConfigurarAcessoFuncionario.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityAcesso.deletar;
end;

procedure TformConfigurarAcessoFuncionario.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityAcesso.inserir;
  PageControl1.TabIndex := 0;
  edtCad_Produto.SetFocus;
end;

procedure TformConfigurarAcessoFuncionario.sbSalvarClick(Sender: TObject);
begin

    FEntityAcesso
                .getID_FUNCIONARIO(formCadastroDeFuncionarios.DataSource1.DataSet.FieldByName('ID').AsInteger)
                .getFUNCIONARIO(formCadastroDeFuncionarios.DataSource1.DataSet.FieldByName('NOME').AsString)
                .getFORMCADASTROMARCAS(edtCad_Marcas.Text)
                .getFORMCADASTROGRUPOS(edtCad_Grupos.Text)
                .getFORMFORMAPAGAMENTO(edtCad_MeiosPagamento.Text)
                .getFORMTIPORETIRADAS(edtCad_TipoRetirada.Text)
                .getFORMCONFIGPARCELAS(edtCad_ConfigParcelas.Text)
                .getFORMATFUNCIONARIO(edtCad_AtividadeFuncionario.Text)
                .getFORMCADCONTASAPAGAR(edtCad_ContasAPagar.Text)
                .getFORMCADPROBLEMASFREQUENTES(edtCad_ProblemasFrequentes.Text)
                .getFORMCADFORNECEDORES(edtCad_Fornecedores.Text)
                .getFORMCADTRANSPORTADORA(edtCad_Transportadora.Text)
                .getFORMCADPRODUTOS(edtCad_Produto.Text)
                .getFORMCADDEFUNCIONARIO(edtCad_Funcionario.Text)
                .getFORMCADSITUACOESORDEM(edtCad_SituacaoOrdem.Text)
                .getFORMCADDECLIENTES(edtCad_Cliente.Text)
                .getFORMENTDEPRODUTOS(edtMov_Entradas.Text)
                .getFORMSAIDADEPRODUTOS(edtMov_SaidaProdutos.Text)
                .getFORMORDEMSERVICO(edtMov_OrdemServico.Text)
                .getFORMCCONSORDEMSERVICO(edtMov_CriarOS.Text)
                .getFORMCADDESERVICOS(edtCad_Servicos.Text)
                .getFORMCADEMPRESA(edtCad_DadosEmpresa.Text)
                .getFORMVENDAS(edtMov_VendaDeProdutos.Text)
                .getFORMNUMPARCELAS(edtCad_NumeroParcelas.Text)
                .getFORMQUITARPARCVENDAS(edtMov_VisualizarParcela.Text)
                .getFORMVISUALIZARVENDAS(edtMov_VisualizarVendas.Text)
                .getFORMRELCLIENTES(edtRel_Clientes.Text)
                .getFORMRELHISTORICOOS(edtRel_HistoricoOS.Text)
                .getFORMRELCONTASARECEBEROS(edtRel_ParcelaAReceberOS.Text)
                .getFORMRELCONTASARECEBERVENDA(edtRel_ParcelaAReceberVenda.Text)
                .getFORMRELPARCELASPAGASOS(edtRel_ParcelaPagasOS.Text)
                .getFORMOSESTORNADAS(edtRel_OsEstornadas.Text)
                .getFORMRELVENDASESTORNADAS(edtRel_VendasEstornadas.Text)
                .getFORMRELCONTASAPAGAR(edtRel_ContasAPagar.Text)
                .getFORMRELREPAROSPORPERIODO(edtRel_ReparosPorPeriodo.Text)
                .getFORMRELATOSPORTECNICO(edtRel_ReparosPorTecnico.Text)
                .getFORMRELATOSPORSTATUS(edtRel_OsPorSituacao.Text)
                .getFORMRELATORDEMDESERVICO(edtRel_RelatorioOS.Text)
                .getFORMRELATFORNECEDORES(edtRel_Fornecedores.Text)
                .getFORMRELATOSINADIMPLENTES(edtRel_OSInadimplentes.Text)
                .getFORMRELATDEPRODUTOS(edtRel_Produtos.Text)
                .getFORMRELATSITUACAODOESTOQUE(edtRel_SituacaoEstoque.Text)
                .getFORMRELATPRODVENDIDOS(edtRel_ProdutosMaisVendidos.Text)
                .getFORMRELATVENDAS(edtRel_Vendas.Text)
                .getFORMRELATVENDASINADIMP(edtRel_VendasInadimplentes.Text)
                .getFORMRELATSERVICOSMAISREALIZ(edtRel_ServicosMaisRealzados.Text)
                .getFORMRELATSAIDADEPRODUTOS(edtRel_SaidaDeProdutos.Text)
                .getFORMRELATENTRDEPRODUTOS(edtRel_EntradasDeProdutos.Text)
                .getFORMRELATVENDASFUNCIONARIO(edtRel_VendaPorFuncionarios.Text)
                .getFORMRELATTRANSPORTADORA(edtRel_Trasportadora.Text)
                .getFORMINICIARCAIXA(edtCaixa_IniciarCaixa.Text)
                .getFORMENCERRAMENTOCAIXA(edtCaixa_EncerramentoCaixa.Text)
                .getFORMREABERTURADECAIXA(edtCaixa_ReaberturaCaixa.Text)
                .getFORMRETIRADADEVALORES(edtCaixa_RetiradaDeValores.Text)
                .getFORMRELATRETIRDEVALORES(edtRel_RetiradaDeValores.Text)
                .getFORMCOMISSOESTECNICOS(edtCaixa_ComissoesTecnicos.Text)
                .getFORMCONFIGCONEXAOBANCO(edtExtra_ConfigBD.Text)
                .getFORMCONFIGBACKUP(edtExtras_ConfigurarBackup.Text)
                .getFORMBACKUPMANUAL(edtExtras_BackupManual.Text)
                .getFORMRELATPROBLFREQUENTES(edtRel_ProblemasFrequentes.Text)
                .getFORMRELATHISTORICOCAIXA(edtCaixa_HistoricoCaixa.Text)
                .getFORMQUITARPARCELAOS(edtMov_VisualizarParcelaOS.Text)
                .getFORMMOVIMENTACAOCAIXA(edtCaixa_MovimentacaoCaixa.Text)
                .getESTORNAR(edtMov_EstornarParcela.Text)
                .getADICIONARPARCELA(edtMov_AdicionarParcela.Text)
                .getEXCLUIRPARCELA(edtMov_ExcluirParcela.Text)
                .getFORMRELATORIOPARCELASPAGASVENDA(edtRel_ParcelasPagasVendas.Text)
                .gravar;

  inherited;


end;

end.
