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
    ComboBox14: TComboBox;
    edtCad_SituacaoOrdem: TLabel;
    ComboBox15: TComboBox;
    edtCad_Servicos: TLabel;
    ComboBox16: TComboBox;
    edtCad_DadosEmpresa: TLabel;
    ComboBox17: TComboBox;
    edtCad_NumeroParcelas: TLabel;
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
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
  private
    { Private declarations }
    var
      FEntityAcesso:iNivelAcessoFuncionario;
  public
    { Public declarations }
  end;

var
  formConfigurarAcessoFuncionario: TformConfigurarAcessoFuncionario;

implementation

{$R *.dfm}

uses Form.Cadastro.Funcionarios;

procedure TformConfigurarAcessoFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityAcesso := TEntityConfigAcessoFuncionario.new;
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
  end;

end;

procedure TformConfigurarAcessoFuncionario.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityAcesso.inserir;
end;

end.
