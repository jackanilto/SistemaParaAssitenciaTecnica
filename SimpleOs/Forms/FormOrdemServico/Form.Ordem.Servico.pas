unit Form.Ordem.Servico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UInterfaces,
  UClasse.Entity.Ordem.Servico, UClasse.Entity.Cadastro.Clientes, Vcl.Mask,
  UClasse.Entity.LIstar.Ordens.Clientes;

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
    ds_OrdensDoClientes: TDataSource;
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
    Label19: TLabel;
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
    edtSulucaoDoProblema: TMemo;
    edtFuncionario: TEdit;
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
    GroupBox1: TGroupBox;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
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
  private
    { Private declarations }
    FEntityOrdem: iOrdemServico;
    FEntityListaOrdens: iListaClientesOrdemServico;
    FCodigoClienteSelecionado: Integer;
    FNomeClienteSelecionado: string;
  public
    { Public declarations }
  end;

var
  formOrdemDeServico: TformOrdemDeServico;

implementation

{$R *.dfm}

uses Form.Localizar.Clientes.Ordem, UFactory, Form.Localizar.Tecnico.Ordem;

procedure TformOrdemDeServico.DBGrid1CellClick(Column: TColumn);
begin
  if ds_DadosClientes.DataSet.RecordCount >= 1 then
  begin

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
    FNomeClienteSelecionado := ds_DadosClientes.DataSet.FieldByName
      ('NOME').AsString;
    FEntityOrdem.getCampo('ID_CLIENTE')
      .getValor(FCodigoClienteSelecionado.ToString).sqlPesquisa.listarGrid
      (ds_OrdensDoClientes);
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

procedure TformOrdemDeServico.FormCreate(Sender: TObject);
begin
  FEntityOrdem := TEntityOrdemServico.new;
  FEntityListaOrdens := TEntityListarOrdensClientes.new;
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformOrdemDeServico.FormShow(Sender: TObject);
begin
  FEntityListaOrdens.abrir.listarGrid(ds_DadosClientes);
  FEntityOrdem.abrir.listarGrid(ds_OrdensDoClientes);
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

procedure TformOrdemDeServico.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformOrdemDeServico.sbNovoClick(Sender: TObject);
begin
  lblCaption.Caption := self.Caption +
    ' > Inserindo uma nova ordem de serviço.';
  FEntityOrdem.inserir;
  PageControl1.ActivePage := tbCadastroOrdens;
end;

procedure TformOrdemDeServico.sbPequisarTecnicoClick(Sender: TObject);
begin
  formLocalizarTecnico := TformLocalizarTecnico.Create(application);
  TFactory.new.criarJanela.FormShow(formLocalizarTecnico, '');
end;

procedure TformOrdemDeServico.sbPesquisarClienteClick(Sender: TObject);
begin
  if sbNovo.Enabled = true then
  begin
    formLocalizarClientesOrdem := TformLocalizarClientesOrdem.Create(self);
    TFactory.new.criarJanela.FormShow(formLocalizarClientesOrdem, '');
  end;
end;

end.
