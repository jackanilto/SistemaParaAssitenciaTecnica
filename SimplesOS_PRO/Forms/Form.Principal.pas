unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.CategoryButtons, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Menus, UFactory,
  Form.Cadastro.Forma.Pagamento, Form.Cadastro.Clientes, Form.Entradas.Produtos,
  UClasse.Entity.Criar.Ordem.Servico, Form.Visualizar.Vendas,
  Form.Modelo.Relatorio, Form.Relatorio.OS.Estornadas,
  Form.Relatorio.Vendas.Estornadas, Form.Relatorio.OS.Por.Tecnico,
  Form.Relatorio.OS.Por.Status, Form.Relatorio.OS, Form.Relatorio.Produtos,
  Form.Relatorio.Situacao.Estoque, Form.Relatorio.Transportadoras,
  Form.Abertura.Caixa, UClasse.Entity.Caixa, Form.Login, UDados.Conexao,
  Form.Comissoes.Funcionario, Form.Relatorio.Comissoes, UClasse.Config.BackUp,
  UClasse.Config.Acesso.Banco, Form.Relatorio.Problemas.Frequentes,
  Form.Relatorio.Historico.Caixa, Form.Trocar.Usuario,
  UClasse.Config.Imagem.Logo,
  Vcl.ExtDlgs, Vcl.Imaging.jpeg, softMeter_globalVar, MidasLib, Winapi.ShellAPI,
  UClasse.Demo;

type
  TformPrincipal = class(TForm)
    Panel1: TPanel;
    SplitView1: TSplitView;
    sbMenu: TSpeedButton;
    CategoryButtons1: TCategoryButtons;
    Label1: TLabel;
    lblFuncionario: TLabel;
    CategoryButtons2: TCategoryButtons;
    actionPrincipal: TActionList;
    acSair: TAction;
    acConfiguracoes: TAction;
    acSobre: TAction;
    acExtras: TAction;
    acRelatorios: TAction;
    acMovimentacao: TAction;
    acCadastros: TAction;
    Panel2: TPanel;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image3: TImage;
    spvCadastros: TSplitView;
    spvMovimentacao: TSplitView;
    spvRelatorio: TSplitView;
    spvExtras: TSplitView;
    spvSobre: TSplitView;
    imgLogo: TImage;
    CategoryButtons3: TCategoryButtons;
    PopupMenuFuncionario: TPopupMenu;
    Sair1: TMenuItem;
    acCadastroMarcas: TAction;
    acCadastroGrupos: TAction;
    acFormaPagamento: TAction;
    acTipoRetiradas: TAction;
    acConfigurarParcela: TAction;
    acAtividadeFuncionarios: TAction;
    acContasAPagar: TAction;
    acProblemasFrequentes: TAction;
    acCadastroFornecedores: TAction;
    acCadastroTransportadora: TAction;
    acCadastroProdutos: TAction;
    acCadastroFuncionarios: TAction;
    acCadastroSituacaoOrdem: TAction;
    acClientes: TAction;
    CategoryButtons4: TCategoryButtons;
    acEntradasProdutos: TAction;
    acSaidaProdutos: TAction;
    acOrdemServico: TAction;
    acCriarOrdenServico: TAction;
    acCadastrarServicos: TAction;
    acDadosEmpresa: TAction;
    acVenda: TAction;
    acNumeroDeParcelas: TAction;
    acQuitarParcelas: TAction;
    acVisualizarVendas: TAction;
    CategoryButtons5: TCategoryButtons;
    acRelatorioClientes: TAction;
    acHistoricoOSCliente: TAction;
    acRelatorioContasAReceber: TAction;
    acRelatorioContasAReceberVendas: TAction;
    acRelatorioParcelasPagasOS: TAction;
    acRelatorioParcelasPagasVendas: TAction;
    acRelatorioOSEstornadas: TAction;
    acRelaorioVendasEstornadas: TAction;
    acRelatorioContasAPagar: TAction;
    acRelatorioReparosPorPeriodo: TAction;
    acRelatorioReparoPorTecnico: TAction;
    acRelatorioOSPorStatus: TAction;
    acRelatorioOS: TAction;
    acRelatorioFornecedores: TAction;
    acRelatorioClientesOSInadimplentes: TAction;
    acRelatorioDeProdutos: TAction;
    acRelatorioSituacaoEstoque: TAction;
    acRelatorioProdutosMaisVendidos: TAction;
    acRelatorioVendas: TAction;
    acRelatorioVendaInadimplentes: TAction;
    acRelatorioServicosMaisRealizados: TAction;
    acRelatorioSaidaDeProdutos: TAction;
    acRelatorioEntradasDeProdutos: TAction;
    acRelatorioVendasPorFuncionarios: TAction;
    acRelatorioTransportadoras: TAction;
    acCaixa: TAction;
    spCaixa: TSplitView;
    acEncerramentoDoCaixa: TAction;
    CategoryButtons6: TCategoryButtons;
    acReaberturaDoCaixa: TAction;
    Label7: TLabel;
    acRetiradaDeValores: TAction;
    acRelatorioRetiradaDeValores: TAction;
    acRelatorioComissoesTecnicos: TAction;
    CategoryButtons7: TCategoryButtons;
    acConfigurarBackUp: TAction;
    acBackupManual: TAction;
    Timer1: TTimer;
    acRelatorioProblemasFrequentes: TAction;
    acRelatorioHistoricoCaixa: TAction;
    acQuitarParcelasOS: TAction;
    acCaixaMovimentacao: TAction;
    acConfigurarAcessoFuncionario: TAction;
    pnlFoto: TPanel;
    Image1: TImage;
    Sair2: TMenuItem;
    PopupMenuLogo: TPopupMenu;
    Definirlogomarca1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    acRelatorioLogEventos: TAction;
    acAberturaCaixa: TAction;
    acRelatorioAniversariantes: TAction;
    acREstaurarBancoDeDados: TAction;
    ImageList1: TImageList;
    procedure acSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbMenuClick(Sender: TObject);
    procedure acCadastrosExecute(Sender: TObject);
    procedure acMovimentacaoExecute(Sender: TObject);
    procedure acRelatoriosExecute(Sender: TObject);
    procedure acExtrasExecute(Sender: TObject);
    procedure acSobreExecute(Sender: TObject);
    procedure acConfiguracoesExecute(Sender: TObject);
    procedure acCadastroMarcasExecute(Sender: TObject);
    procedure acCadastroGruposExecute(Sender: TObject);
    procedure acFormaPagamentoExecute(Sender: TObject);
    procedure acTipoRetiradasExecute(Sender: TObject);
    procedure acConfigurarParcelaExecute(Sender: TObject);
    procedure acAtividadeFuncionariosExecute(Sender: TObject);
    procedure acContasAPagarExecute(Sender: TObject);
    procedure acProblemasFrequentesExecute(Sender: TObject);
    procedure acCadastroFornecedoresExecute(Sender: TObject);
    procedure acCadastroTransportadoraExecute(Sender: TObject);
    procedure acCadastroProdutosExecute(Sender: TObject);
    procedure acCadastroFuncionariosExecute(Sender: TObject);
    procedure acCadastroSituacaoOrdemExecute(Sender: TObject);
    procedure acClientesExecute(Sender: TObject);
    procedure acEntradasProdutosExecute(Sender: TObject);
    procedure acSaidaProdutosExecute(Sender: TObject);
    procedure acOrdemServicoExecute(Sender: TObject);
    procedure acCriarOrdenServicoExecute(Sender: TObject);
    procedure acCadastrarServicosExecute(Sender: TObject);
    procedure acDadosEmpresaExecute(Sender: TObject);
    procedure acVendaExecute(Sender: TObject);
    procedure acNumeroDeParcelasExecute(Sender: TObject);
    procedure acQuitarParcelasExecute(Sender: TObject);
    procedure acVisualizarVendasExecute(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure acRelatorioClientesExecute(Sender: TObject);
    procedure acHistoricoOSClienteExecute(Sender: TObject);
    procedure acRelatorioContasAReceberExecute(Sender: TObject);
    procedure acRelatorioContasAReceberVendasExecute(Sender: TObject);
    procedure acRelatorioParcelasPagasOSExecute(Sender: TObject);
    procedure acRelatorioParcelasPagasVendasExecute(Sender: TObject);
    procedure acRelatorioOSEstornadasExecute(Sender: TObject);
    procedure acRelaorioVendasEstornadasExecute(Sender: TObject);
    procedure acRelatorioContasAPagarExecute(Sender: TObject);
    procedure acRelatorioReparosPorPeriodoExecute(Sender: TObject);
    procedure acRelatorioReparoPorTecnicoExecute(Sender: TObject);
    procedure acRelatorioOSPorStatusExecute(Sender: TObject);
    procedure acRelatorioOSExecute(Sender: TObject);
    procedure acRelatorioFornecedoresExecute(Sender: TObject);
    procedure acRelatorioClientesOSInadimplentesExecute(Sender: TObject);
    procedure acRelatorioDeProdutosExecute(Sender: TObject);
    procedure acRelatorioSituacaoEstoqueExecute(Sender: TObject);
    procedure acRelatorioProdutosMaisVendidosExecute(Sender: TObject);
    procedure acRelatorioVendasExecute(Sender: TObject);
    procedure acRelatorioVendaInadimplentesExecute(Sender: TObject);
    procedure acRelatorioServicosMaisRealizadosExecute(Sender: TObject);
    procedure acRelatorioSaidaDeProdutosExecute(Sender: TObject);
    procedure acRelatorioEntradasDeProdutosExecute(Sender: TObject);
    procedure acRelatorioVendasPorFuncionariosExecute(Sender: TObject);
    procedure acRelatorioTransportadorasExecute(Sender: TObject);
    procedure acCaixaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure acEncerramentoDoCaixaExecute(Sender: TObject);
    procedure acReaberturaDoCaixaExecute(Sender: TObject);
    procedure acRetiradaDeValoresExecute(Sender: TObject);
    procedure acRelatorioRetiradaDeValoresExecute(Sender: TObject);
    procedure acRelatorioComissoesTecnicosExecute(Sender: TObject);
    procedure acConfigurarBackUpExecute(Sender: TObject);
    procedure acBackupManualExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure acRelatorioProblemasFrequentesExecute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure acRelatorioHistoricoCaixaExecute(Sender: TObject);
    procedure acQuitarParcelasOSExecute(Sender: TObject);
    procedure acCaixaMovimentacaoExecute(Sender: TObject);
    procedure acConfigurarAcessoFuncionarioExecute(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Definirlogomarca1Click(Sender: TObject);
    procedure acRelatorioLogEventosExecute(Sender: TObject);
    procedure acAberturaCaixaExecute(Sender: TObject);
    procedure acRelatorioAniversariantesExecute(Sender: TObject);
    procedure acREstaurarBancoDeDadosExecute(Sender: TObject);
  private
    { Private declarations }
  var
    F_SplitView: TSplitView;
    FHorarios: array [0 .. 100] of string;
    FBackUp: TClasseConfigBackUp;
    FConfigConexao: TConfigConexaoBanco;
    FConfImagemLogo: TConfigImagemLogo;
    FDemo:TClasseDemo;
    procedure closeSplit;
    procedure arrendondarImagem(value: TPanel);

  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;
  codigoDaOS: integer;
  codigoDocliente: integer;
  FProcessoCaixa: TEntityCaixa;
  FSituacaoDoCaixa: String;
  started: string;

implementation

{$R *.dfm}

uses UForm.Exemplo.Embeded, Form.Cadastro.Marcas, Form.Cadastro.Grupos,
  Form.Cadastro.Tipo.Retiradas, Form.Cadastro.Configurar.Parcelas,
  Form.Cadastro.Atividade.Funcionario, Form.Cadastro.Contas.APagar,
  Form.Cadastro.Problemas.Frequentes, Form.Cadastro.Forncedores,
  Form.Cadastro.Transportadora, Form.Cadastro.Produtos,
  Form.Cadastro.Funcionarios, Form.Cadastro.Situacao.Ordem,
  Form.Saidas.Produtos, Form.Ordem.Servico, Form.Criar.Ordem.Servico,
  Form.Cadastro.Servicos, Form.Cadastro.Empresa, Form.Venda,
  Form.Numero.Parcelas, Form.Quitar.Parcela.Venda, Form.Relatorio.Clientes,
  Form.Relatorio.Historico.OS, Form.Relatorio.Contas.A.Receber.OS,
  Form.Relatorio.Contas.A.Receber.Venda, Form.Relatorio.Parcelas.Pagas.OS,
  Form.Relatorio.Parcelas.Pagas.Vendas, Form.Relatorio.Contas.A.Pagar,
  Form.Relatorio.Reparos.Periodos, Form.Relatorio.Fornecedores,
  Form.Relatorio.OS.Inadimplentes, Form.Relatorio.Produtos.Mais.Vendidos,
  Form.Relatorio.Vendas, Form.Relatorio.Parcelas.Venda.Inadimplentes,
  Form.Relatorio.Servico.Mais.Realizados, Form.Relatorio.Saida.Produtos,
  Form.Relatorio.Entrada.Produtos, Form.Relatorio.Vendas.Por.Funcionario,
  Form.Encerramento.Caixa, Form.Reabertura.Caixa, Form.Retirada.De.Valores,
  Form.Relatorio.Retirada.Valores, Form.Configuracoes.BackUp,
  Form.BackUp.Manual, Form.Quitar.Parcela.OS, Form.Movimentacao.Caixa,
  Form.Acesso.Recursos.Fucnionarios, Form.Sobre, Form.Relatorio.Log.Eventos,
  Form.Abertura.Caixa.Manual, Form.Relatorio.Aniversariantes;

procedure TformPrincipal.acAberturaCaixaExecute(Sender: TObject);
var
  FCaixa: TEntityCaixa;
begin

  FCaixa := TEntityCaixa.create;

  try
    if FCaixa.verificarSituacaoCaixa = 'fechado' then
    begin
      formAberturaDeCaixaManual := TformAberturaDeCaixaManual.create(self);
      TFactory.new.criarJanela.FormShow(formAberturaDeCaixaManual, 'FORMINICIARCAIXA')
    end;
  finally
    FSituacaoDoCaixa := FCaixa.retornarEstadoCaixa;
    FreeAndNil(FCaixa);
  end;
end;

procedure TformPrincipal.acAtividadeFuncionariosExecute(Sender: TObject);
begin
  formAtividadeFuncionario := TformAtividadeFuncionario.create(self);
  TFactory.new.criarJanela.FormShow(formAtividadeFuncionario,
    'FORMATFUNCIONARIO');
end;

procedure TformPrincipal.acBackupManualExecute(Sender: TObject);
begin
  formBackUpManual := TformBackUpManual.create(self);
  TFactory.new.criarJanela.FormShow(formBackUpManual, 'FORMBACKUPMANUAL');
end;

procedure TformPrincipal.acCadastrarServicosExecute(Sender: TObject);
begin
  formCadastroDeServicos := TformCadastroDeServicos.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroDeServicos,
    'FORMCADDESERVICOS');
end;

procedure TformPrincipal.acCadastroFornecedoresExecute(Sender: TObject);
begin
  formCadastroFornecedores := TformCadastroFornecedores.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroFornecedores,
    'FORMCADFORNECEDORES');
end;

procedure TformPrincipal.acCadastroFuncionariosExecute(Sender: TObject);
begin
  formCadastroDeFuncionarios := TformCadastroDeFuncionarios.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroDeFuncionarios,
    'FORMCADDEFUNCIONARIOS');
end;

procedure TformPrincipal.acCadastroGruposExecute(Sender: TObject);
begin
  formCadastroGrupos := TformCadastroGrupos.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroGrupos, 'FORMCADASTROGRUPOS')
end;

procedure TformPrincipal.acCadastroMarcasExecute(Sender: TObject);
begin
  formCadastroMarcas := TformCadastroMarcas.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroMarcas, 'FORMCADASTROMARCAS')
end;

procedure TformPrincipal.acCadastroProdutosExecute(Sender: TObject);
begin
  FormCadastroProdutos := TFormCadastroProdutos.create(self);
  TFactory.new.criarJanela.FormShow(FormCadastroProdutos, 'FORMCADPRODUTOS');
end;

procedure TformPrincipal.acCadastrosExecute(Sender: TObject);
begin
  if spvCadastros.Opened = true then
  begin
    spvCadastros.Opened := false;
    // CategoryButtons1.SelectedButtonColor := $00804E3B;
  end
  else
  begin
    closeSplit;
    spvCadastros.Opened := true;
    F_SplitView := spvCadastros;
  end;

end;

procedure TformPrincipal.acCadastroSituacaoOrdemExecute(Sender: TObject);
begin
  formCadastroSituacoesOrdem := TformCadastroSituacoesOrdem.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroSituacoesOrdem,
    'FORMCADSITUACOESORDEM');
end;

procedure TformPrincipal.acCadastroTransportadoraExecute(Sender: TObject);
begin
  formCadastroTransportadora := TformCadastroTransportadora.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroTransportadora,
    'FORMCADTRANSPORTADORA');
end;

procedure TformPrincipal.acCaixaExecute(Sender: TObject);
begin
  if spCaixa.Opened = true then
    spCaixa.Opened := false
  else
  begin
    closeSplit;
    spCaixa.Opened := true;
    F_SplitView := spCaixa;
  end;
end;

procedure TformPrincipal.acCaixaMovimentacaoExecute(Sender: TObject);
begin

  formMovimentacaoCaixa := TformMovimentacaoCaixa.create(self);
  TFactory.new.criarJanela.FormShow(formMovimentacaoCaixa,
    'FORMMOVIMENTACAOCAIXA');

end;

procedure TformPrincipal.acClientesExecute(Sender: TObject);
begin
  formCadastroDeClientes := TformCadastroDeClientes.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroDeClientes,
    'FORMCADDECLIENTES');
end;

procedure TformPrincipal.acRelatorioComissoesTecnicosExecute(Sender: TObject);
begin
  formComissoesTecnicos := TformComissoesTecnicos.create(self);
  TFactory.new.criarJanela.FormShow(formComissoesTecnicos,
    'FORMCOMISSOESTECNICOS');
end;

procedure TformPrincipal.acConfiguracoesExecute(Sender: TObject);
begin
  // if spvConfiguracoes.Opened = true then
  // spvConfiguracoes.Opened := false
  // else
  // begin
  // closeSplit;
  // spvConfiguracoes.Opened := true;
  // F_SplitView := spvConfiguracoes;
  // end;
end;

procedure TformPrincipal.acConfigurarAcessoFuncionarioExecute(Sender: TObject);
begin
  // *************************************
  // VER ESTE PONTO
  formConfigurarAcessoFuncionario :=
    TformConfigurarAcessoFuncionario.create(self);
  TFactory.new.criarJanela.FormShow(formConfigurarAcessoFuncionario, '');
end;

procedure TformPrincipal.acConfigurarBackUpExecute(Sender: TObject);
begin
  formConfiguracoesBackUp := TformConfiguracoesBackUp.create(self);
  TFactory.new.criarJanela.FormShow(formConfiguracoesBackUp,
    'FORMCONFIGBACKUP');
end;

procedure TformPrincipal.acConfigurarParcelaExecute(Sender: TObject);
begin
  formConfigurarParcelas := TformConfigurarParcelas.create(self);
  TFactory.new.criarJanela.FormShow(formConfigurarParcelas,
    'FORMCONFIGPARCELAS');
end;

procedure TformPrincipal.acContasAPagarExecute(Sender: TObject);
begin
  formCadastroContasAPagar := TformCadastroContasAPagar.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroContasAPagar,
    'FORMCADCONTASAPAGAR');
end;

procedure TformPrincipal.acCriarOrdenServicoExecute(Sender: TObject);
begin

  if FSituacaoDoCaixa = 'aberto' then
  begin

    formCriarConsultarOrdemServico :=
      TformCriarConsultarOrdemServico.create(self);
    TFactory.new.criarJanela.FormShow(formCriarConsultarOrdemServico,
      'FORMCCONSORDEMSERVICO');

  end
  else
  begin
    MessageDlg('ERRO! Voc� precisa iniciar o caixa antes de prosseguir.',
      mtError, [mbOk], 0, mbOk);
  end;
end;

procedure TformPrincipal.acDadosEmpresaExecute(Sender: TObject);
begin
  formCadastroEmpresa := TformCadastroEmpresa.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroEmpresa, 'FORMCADEMPRESA');
end;

procedure TformPrincipal.acEncerramentoDoCaixaExecute(Sender: TObject);
var
  FCaixaTemporario: TEntityCaixa;
begin

  FCaixaTemporario := TEntityCaixa.create;

  try
    if FCaixaTemporario.verificarSituacaoCaixa = 'aberto' then
    begin
      formEncerramentoCaixa := TformEncerramentoCaixa.create(self);
      TFactory.new.criarJanela.FormShow(formEncerramentoCaixa,
        'FORMENCERRAMENTOCAIXA');
    end;
  finally
    FCaixaTemporario.Free;
  end;
end;

procedure TformPrincipal.acEntradasProdutosExecute(Sender: TObject);
begin
  formEntradaDeProdutos := TformEntradaDeProdutos.create(self);
  TFactory.new.criarJanela.FormShow(formEntradaDeProdutos, 'FORMENTDEPRODUTOS');
end;

procedure TformPrincipal.acExtrasExecute(Sender: TObject);
begin
  if spvExtras.Opened = true then
    spvExtras.Opened := false
  else
  begin
    closeSplit;
    spvExtras.Opened := true;
    F_SplitView := spvExtras;
  end;
end;

procedure TformPrincipal.acFormaPagamentoExecute(Sender: TObject);
begin
  formFormaPagamento := TformFormaPagamento.create(self);
  TFactory.new.criarJanela.FormShow(formFormaPagamento, 'FORMFORMAPAGAMENTO');
end;

procedure TformPrincipal.acHistoricoOSClienteExecute(Sender: TObject);
begin
  formRelatorioHistoricoOS := TformRelatorioHistoricoOS.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioHistoricoOS,
    'FORMRELHISTORICOOS');
end;

procedure TformPrincipal.acMovimentacaoExecute(Sender: TObject);
begin
  if spvMovimentacao.Opened = true then
    spvMovimentacao.Opened := false
  else
  begin
    closeSplit;
    spvMovimentacao.Opened := true;
    F_SplitView := spvMovimentacao;
  end;
end;

procedure TformPrincipal.acNumeroDeParcelasExecute(Sender: TObject);
begin
  formNumeroParcelas := TformNumeroParcelas.create(self);
  TFactory.new.criarJanela.FormShow(formNumeroParcelas, 'FORMNUMPARCELAS');
end;

procedure TformPrincipal.acOrdemServicoExecute(Sender: TObject);
begin
  // if FSituacaoDoCaixa = 'aberto' then
  // begin
  formOrdemServico := TformOrdemServico.create(self);
  TFactory.new.criarJanela.FormShow(formOrdemServico, 'FORMORDEMSERVICO');
end;
// else
// begin
// MessageDlg('ERRO. O caixa se encontra fechado. Abra o caixa ou Reabra para continuar. ',
// mtError, [mbOk], 0, mbOk);
// end;
// end;

procedure TformPrincipal.acRelatorioOSEstornadasExecute(Sender: TObject);
begin
  formOSEstornadas := TformOSEstornadas.create(self);
  TFactory.new.criarJanela.FormShow(formOSEstornadas, 'FORMOSESTORNADAS');
end;

procedure TformPrincipal.acRelatorioOSExecute(Sender: TObject);
begin
  formRelatorioOrdemDeServico := TformRelatorioOrdemDeServico.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioOrdemDeServico,
    'FORMRELATORDEMDESERVICO');
end;

procedure TformPrincipal.acRelatorioOSPorStatusExecute(Sender: TObject);
begin
  formRelatorioOSPorStatus := TformRelatorioOSPorStatus.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioOSPorStatus,
    'FORMRELATOSPORSTATUS');
end;

procedure TformPrincipal.acRelatorioParcelasPagasOSExecute(Sender: TObject);
begin
  formRelatorioParcelasPagasOS := TformRelatorioParcelasPagasOS.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioParcelasPagasOS,
    'FORMRELPARCELASPAGASOS');
end;

procedure TformPrincipal.acRelatorioParcelasPagasVendasExecute(Sender: TObject);
begin
  formRelatorioParcelasPagasVendas :=
    TformRelatorioParcelasPagasVendas.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioParcelasPagasVendas,
    'FORMRELATORIOPARCELASPAGASVENDA');
end;

procedure TformPrincipal.acRelatorioProblemasFrequentesExecute(Sender: TObject);
begin
  formRelatorioProblemasFrequentes :=
    TformRelatorioProblemasFrequentes.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioProblemasFrequentes,
    'FORMRELATPROBLFREQUENTES');
end;

procedure TformPrincipal.acRelatorioProdutosMaisVendidosExecute
  (Sender: TObject);
begin
  formRelatorioProdutosMaisVendidos :=
    TformRelatorioProdutosMaisVendidos.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioProdutosMaisVendidos,
    'FORMRELATPRODVENDIDOS');
end;

procedure TformPrincipal.acRelatorioReparoPorTecnicoExecute(Sender: TObject);
begin
  formRelatorioOSPorTecnico := TformRelatorioOSPorTecnico.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioOSPorTecnico,
    'FORMRELATOSPORTECNICO');
end;

procedure TformPrincipal.acRelatorioReparosPorPeriodoExecute(Sender: TObject);
begin
  formRelatorioReparosPorPeriodo :=
    TformRelatorioReparosPorPeriodo.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioReparosPorPeriodo,
    'FORMRELREPAROSPORPERIODO');
end;

procedure TformPrincipal.acRelatorioRetiradaDeValoresExecute(Sender: TObject);
begin
  formRelatorioRetiradaDeValores :=
    TformRelatorioRetiradaDeValores.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioRetiradaDeValores,
    'FORMRELATRETIRDEVALORES');
end;

procedure TformPrincipal.acRelatorioSaidaDeProdutosExecute(Sender: TObject);
begin
  formRelatorioSaidaDeProdutos := TformRelatorioSaidaDeProdutos.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioSaidaDeProdutos,
    'FORMRELATSAIDADEPRODUTOS');
end;

procedure TformPrincipal.acRelatorioServicosMaisRealizadosExecute
  (Sender: TObject);
begin
  formRelatorioServicosMaisRealizados :=
    TformRelatorioServicosMaisRealizados.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioServicosMaisRealizados,
    'FORMRELATSERVICOSMAISREALIZ');
end;

procedure TformPrincipal.acProblemasFrequentesExecute(Sender: TObject);
begin
  formCadastroProblemasFrequentes :=
    TformCadastroProblemasFrequentes.create(self);
  TFactory.new.criarJanela.FormShow(formCadastroProblemasFrequentes,
    'FORMCADPROBLEMASFREQUENTES');
end;

procedure TformPrincipal.acQuitarParcelasExecute(Sender: TObject);
begin

  if FSituacaoDoCaixa = 'aberto' then
  begin

    formQuitarParcelasVendas := TformQuitarParcelasVendas.create(self);
    TFactory.new.criarJanela.FormShow(formQuitarParcelasVendas,
      'FORMQUITARPARCVENDAS');

  end
  else
  begin
    MessageDlg('ERRO! Voc� precisa iniciar o caixa antes de prosseguir.',
      mtError, [mbOk], 0, mbOk);
  end;
end;

procedure TformPrincipal.acQuitarParcelasOSExecute(Sender: TObject);
begin

  if FSituacaoDoCaixa = 'aberto' then
  begin

    formQuitarParcelaOS := TformQuitarParcelaOS.create(self);
    TFactory.new.criarJanela.FormShow(formQuitarParcelaOS,
      'FORMQUITARPARCELAOS');

  end
  else
  begin
    MessageDlg('ERRO! Voc� precisa iniciar o caixa antes de prosseguir.',
      mtError, [mbOk], 0, mbOk);
  end;
end;

procedure TformPrincipal.acReaberturaDoCaixaExecute(Sender: TObject);
var
  FCaixaTemporario: TEntityCaixa;
begin

  FCaixaTemporario := TEntityCaixa.create;

  try
    if FCaixaTemporario.verificarSituacaoCaixa = 'fechado' then
    begin
      formReaberturaDeCaixa := TformReaberturaDeCaixa.create(self);
      TFactory.new.criarJanela.FormShow(formReaberturaDeCaixa,
        'FORMREABERTURADECAIXA');
    end;
  finally
    FCaixaTemporario.Free;
  end;
end;

procedure TformPrincipal.acRelaorioVendasEstornadasExecute(Sender: TObject);
begin
  formRelatorioVendasEstornadas := tformRelatorioVendasEstornadas.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioVendasEstornadas,
    'FORMRELVENDASESTORNADAS');
end;

procedure TformPrincipal.acRelatorioAniversariantesExecute(Sender: TObject);
begin
  formRelatorioClientesAniversariantes := TformRelatorioClientesAniversariantes.Create(self);
  try
    formRelatorioClientesAniversariantes.ShowModal;
  finally
    formRelatorioClientesAniversariantes.Free;
  end;
end;

procedure TformPrincipal.acRelatorioClientesExecute(Sender: TObject);
begin
  formRelatorioClientes := TformRelatorioClientes.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioClientes, 'FORMRELCLIENTES');
end;

procedure TformPrincipal.acRelatorioClientesOSInadimplentesExecute
  (Sender: TObject);
begin
  formRelatorioOSInadimplentes := TformRelatorioOSInadimplentes.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioOSInadimplentes,
    'FORMRELATOSINADIMPLENTES');
end;

procedure TformPrincipal.acRelatorioContasAPagarExecute(Sender: TObject);
begin
  formRelatorioContasAPagar := TformRelatorioContasAPagar.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioContasAPagar,
    'FORMRELCONTASAPAGAR');
end;

procedure TformPrincipal.acRelatorioContasAReceberExecute(Sender: TObject);
begin
  formRelatorioContasAReceberOS := TformRelatorioContasAReceberOS.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioContasAReceberOS,
    'FORMRELCONTASARECEBEROS');
end;

procedure TformPrincipal.acRelatorioContasAReceberVendasExecute
  (Sender: TObject);
begin
  formRelatorioContasAReceberVenda :=
    TformRelatorioContasAReceberVenda.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioContasAReceberVenda,
    'FORMRELCONTASARECEBERVENDA');
end;

procedure TformPrincipal.acRelatorioDeProdutosExecute(Sender: TObject);
begin
  formRelatorioDeProdutos := TformRelatorioDeProdutos.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioDeProdutos,
    'FORMRELATDEPRODUTOS');
end;

procedure TformPrincipal.acRelatorioEntradasDeProdutosExecute(Sender: TObject);
begin
  formRelatorioEntradasDeProdutos :=
    TformRelatorioEntradasDeProdutos.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioEntradasDeProdutos,
    'FORMRELATENTRDEPRODUTOS');
end;

procedure TformPrincipal.acRelatorioFornecedoresExecute(Sender: TObject);
begin
  formRelatorioFornecedores := TformRelatorioFornecedores.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioFornecedores,
    'FORMRELATFORNECEDORES');
end;

procedure TformPrincipal.acRelatorioHistoricoCaixaExecute(Sender: TObject);
begin
  formRelatorioHistoricoDoCaixa := TformRelatorioHistoricoDoCaixa.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioHistoricoDoCaixa,
    'FORMRELATHISTORICOCAIXA');
end;

procedure TformPrincipal.acRelatorioLogEventosExecute(Sender: TObject);
begin

  formRelatorioLogEventos := TformRelatorioLogEventos.create(self);
  try
    formRelatorioLogEventos.ShowModal;
  finally
    formRelatorioLogEventos.Free;
  end;

end;

procedure TformPrincipal.acRelatoriosExecute(Sender: TObject);
begin
  if spvRelatorio.Opened = true then
    spvRelatorio.Opened := false
  else
  begin
    closeSplit;
    spvRelatorio.Opened := true;
    F_SplitView := spvRelatorio;
  end;
end;

procedure TformPrincipal.acRelatorioSituacaoEstoqueExecute(Sender: TObject);
begin
  formRelatorioSituacaoDoEstoque :=
    TformRelatorioSituacaoDoEstoque.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioSituacaoDoEstoque,
    'FORMRELATSITUACAODOESTOQUE');
end;

procedure TformPrincipal.acRelatorioTransportadorasExecute(Sender: TObject);
begin
  formRelatorioTransportadora := tformRelatorioTransportadora.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioTransportadora,
    'FORMRELATTRANSPORTADORA');
end;

procedure TformPrincipal.acRelatorioVendaInadimplentesExecute(Sender: TObject);
begin
  formRelatorioVendasInadimplentes :=
    TformRelatorioVendasInadimplentes.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioVendasInadimplentes,
    'FORMRELATVENDASINADIMP');
end;

procedure TformPrincipal.acRelatorioVendasExecute(Sender: TObject);
begin
  formRelatorioVendas := TformRelatorioVendas.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioVendas, 'FORMRELATVENDAS');
end;

procedure TformPrincipal.acRelatorioVendasPorFuncionariosExecute
  (Sender: TObject);
begin
  formRelatorioVendasPorFuncionario :=
    TformRelatorioVendasPorFuncionario.create(self);
  TFactory.new.criarJanela.FormShow(formRelatorioVendasPorFuncionario,
    'FORMRELATVENDASFUNCIONARIO');
end;

procedure TformPrincipal.acREstaurarBancoDeDadosExecute(Sender: TObject);
begin

  if application.MessageBox('Para restaurar o banco de dados a aplica��o'+
  ' precisar ser encerrada. Deseja encerrar a aplica��o e iniciar o processo de restaura��o?',
   'Restaura��o do banco de dados', MB_YESNO+MB_ICONQUESTION)=mryes then
   begin
    ShellExecute(Handle, 'open', pchar(ExtractFilePath(Application.ExeName) +
      'Restore - 32 Bits.exe'), nil, nil, sw_show);
      close;
   end;


end;

procedure TformPrincipal.acRetiradaDeValoresExecute(Sender: TObject);
begin

  if FSituacaoDoCaixa = 'aberto' then
  begin

    formRetiradaDeValores := TformRetiradaDeValores.create(self);
    TFactory.new.criarJanela.FormShow(formRetiradaDeValores,
      'FORMRETIRADADEVALORES');

  end
  else
  begin
    MessageDlg('ERRO! Voc� precisa iniciar o caixa antes de prosseguir.',
      mtError, [mbOk], 0, mbOk);
  end;
end;

procedure TformPrincipal.acSaidaProdutosExecute(Sender: TObject);
begin
  formSaidaDeProdutos := TformSaidaDeProdutos.create(self);
  TFactory.new.criarJanela.FormShow(formSaidaDeProdutos, 'FORMSAIDADEPRODUTOS');
end;

procedure TformPrincipal.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TformPrincipal.acSobreExecute(Sender: TObject);
begin
  formSobre := TformSobre.create(self);
  try
    formSobre.ShowModal;
  finally
    formSobre.Free;
  end;
end;

procedure TformPrincipal.acTipoRetiradasExecute(Sender: TObject);
begin
  formTipoRetiradas := TformTipoRetiradas.create(self);
  TFactory.new.criarJanela.FormShow(formTipoRetiradas, 'FORMTIPORETIRADAS');
end;

procedure TformPrincipal.acVendaExecute(Sender: TObject);
begin

  if FSituacaoDoCaixa = 'aberto' then
  begin

    formVendas := TformVendas.create(self);
    TFactory.new.criarJanela.FormShow(formVendas, 'FORMVENDAS');

  end
  else
  begin
    MessageDlg('ERRO! Voc� precisa iniciar o caixa antes de prosseguir.',
      mtError, [mbOk], 0, mbOk);
  end;
end;

procedure TformPrincipal.acVisualizarVendasExecute(Sender: TObject);
begin

  if FSituacaoDoCaixa = 'aberto' then
  begin

    formVisualizarVendas := TformVisualizarVendas.create(self);
    TFactory.new.criarJanela.FormShow(formVisualizarVendas,
      'FORMVISUALIZARVENDAS');

  end
  else
  begin
    MessageDlg('ERRO! Voc� precisa iniciar o caixa antes de prosseguir.',
      mtError, [mbOk], 0, mbOk);
  end;
end;

procedure TformPrincipal.arrendondarImagem(value: TPanel);
var
  rgn: HRGN;
  dc: HDC;
begin
  rgn := CreateRoundRectRgn(0, 0, value.Width, value.Height, 350, 350);
  dc := GetDC(value.Handle);
  SetWindowRgn(value.Handle, rgn, true);
  ReleaseDC(value.Handle, dc);
  DeleteObject(rgn);
end;

procedure TformPrincipal.Button1Click(Sender: TObject);
begin

  formExemploEmbeded := TformExemploEmbeded.create(self);
  // formExemploEmbeded.Parent := pnlform;
  // formExemploEmbeded.Show;

  try
    formExemploEmbeded.ShowModal;
  finally
    formExemploEmbeded.Free;
  end;

end;

procedure TformPrincipal.Button2Click(Sender: TObject);
begin
  formModeloRelatorio := TformModeloRelatorio.create(self);
  TFactory.new.criarJanela.FormShow(formModeloRelatorio, '');
end;

procedure TformPrincipal.Button3Click(Sender: TObject);
begin
  formVisualizarVendas := TformVisualizarVendas.create(self);
  try
    ShowMessage(formVisualizarVendas.Name);
  finally
    formVisualizarVendas.Free;
  end;
end;

procedure TformPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FProcessoCaixa);
  FreeAndNil(FBackUp);
  FreeAndNil(FConfigConexao);
  FreeAndNil(FConfImagemLogo);
  FreeAndNil(FDemo);
end;

procedure TformPrincipal.FormCreate(Sender: TObject);
begin

  dllSoftMeter.sendScreenView('SimplesOS PRO 1.2 PRO');
  dllSoftMeter.sendEvent('Iniciou a aplica��o', 'SimpleOS', 0);

  codigoDaOS := 0;
  codigoDocliente := 0;

  { Centraliza a imagem da LOGO }
  imgLogo.Left := (formPrincipal.Width - Image2.Width) div 2;
  imgLogo.Top := (formPrincipal.Height - Image2.Height) div 2;

  FProcessoCaixa := TEntityCaixa.create;

  FBackUp := TClasseConfigBackUp.create;

  FConfigConexao := TConfigConexaoBanco.create;

  FConfImagemLogo := TConfigImagemLogo.create;


 //Ativa a vers�o de demonstra��o
  FDemo := TClasseDemo.create;
  FDemo.demoActive(false);
  //////////////////////

//  ReportMemoryLeaksOnShutdown := true;

end;

procedure TformPrincipal.FormShow(Sender: TObject);
var
  I: integer;
  FCaixa: TEntityCaixa;
begin

  FConfImagemLogo.getImagemBD(imgLogo);

  formLogin := TformLogin.create(self);
  try
    formLogin.ShowModal;
  finally
    formLogin.Free;

    if started = 'no' then
    begin

      FreeAndNil(FProcessoCaixa);
      FreeAndNil(FBackUp);
      FreeAndNil(FConfigConexao);
      FreeAndNil(FConfImagemLogo);
      application.Terminate;

    end;

    lblFuncionario.Caption := NomeFuncionarioLogado;

    Image1.Picture := imagemFuncionario.Picture;

    arrendondarImagem(pnlFoto);

  end;

  if FProcessoCaixa.verificarSituacaoCaixa = 'nao foi iniciado' then
  begin
    formIniciarCaixa := TformIniciarCaixa.create(self);
    TFactory.new.criarJanela.FormShow(formIniciarCaixa, 'FORMINICIARCAIXA');
    FSituacaoDoCaixa := 'fechado';
  end
  else if FProcessoCaixa.verificarSituacaoCaixa = 'encerrar caixa anterior' then
  begin
    formIniciarCaixa := TformIniciarCaixa.create(self);
    TFactory.new.criarJanela.FormShow(formIniciarCaixa, 'FORMINICIARCAIXA');
    FSituacaoDoCaixa := 'aberto';
  end
  else if FProcessoCaixa.verificarSituacaoCaixa = 'iniciar novo caixa' then
  begin
    formIniciarCaixa := TformIniciarCaixa.create(self);
    TFactory.new.criarJanela.FormShow(formIniciarCaixa, 'FORMINICIARCAIXA');
    FSituacaoDoCaixa := 'fechado';
  end
  else if FProcessoCaixa.verificarSituacaoCaixa = 'fechado' then
  begin
    FSituacaoDoCaixa := 'fechado';
  end
  else if FProcessoCaixa.verificarSituacaoCaixa = 'aberto' then
  begin
    FSituacaoDoCaixa := 'aberto';
  end;

  Label7.Caption := FSituacaoDoCaixa;

  FCaixa := TEntityCaixa.create;
  try
    FSituacaoDoCaixa := FCaixa.verificarSituacaoCaixa;
  finally
    FreeAndNil(FCaixa);
  end;

end;

procedure TformPrincipal.Image2Click(Sender: TObject);
begin
  acClientes.Execute;
end;

procedure TformPrincipal.Image3Click(Sender: TObject);
begin
  acCadastroProdutos.Execute;
end;

procedure TformPrincipal.Image4Click(Sender: TObject);
begin
  acOrdemServico.Execute;
end;

procedure TformPrincipal.Image5Click(Sender: TObject);
begin
  acVenda.Execute;
end;

procedure TformPrincipal.Sair1Click(Sender: TObject);
begin

  formTrocarDeUsuario := tformTrocarDeUsuario.create(self);
  try
    formTrocarDeUsuario.ShowModal;
  finally
    formTrocarDeUsuario.Free;
  end;

end;

procedure TformPrincipal.Sair2Click(Sender: TObject);
begin
  Close;
end;

procedure TformPrincipal.closeSplit;
begin
  if Assigned(F_SplitView) then
    F_SplitView.Opened := false;
end;

procedure TformPrincipal.Definirlogomarca1Click(Sender: TObject);
var
  img: TJpegImage;
begin

  img := TJpegImage.create;

  if OpenPictureDialog1.Execute then
  begin
    imgLogo.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    img.LoadFromFile(OpenPictureDialog1.FileName);
    FConfImagemLogo.salvarImagemBd(img);
  end;

  img.Free;

end;

procedure TformPrincipal.sbMenuClick(Sender: TObject);
begin
  if SplitView1.Opened = true then
    SplitView1.Close
  else
    SplitView1.Open;
end;

procedure TformPrincipal.Timer1Timer(Sender: TObject);
var
  I: integer;
begin

  for I := 0 to pred(FBackUp.listarHorariosBackupAutomatico.Count) do
  begin
    if FBackUp.listarHorariosBackupAutomatico[I] = TimeToStr(time) then
    begin
      FBackUp.localBD := FConfigConexao.localBD;
      FBackUp.localSalvarArquivo := ExtractFilePath(application.ExeName);
      FBackUp.iniciarBackUpAutomaticamente;
    end;
  end;

end;

end.
