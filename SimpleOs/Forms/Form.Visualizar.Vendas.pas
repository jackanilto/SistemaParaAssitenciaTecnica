unit Form.Visualizar.Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.Menus, UInterfaces,
  UClasse.Visualizar.Vendas, frxClass, frxDBSet, UClasse.Entity.Dados.Empresa,
  UClasse.Imprimir.Recibo, UFactory;

type
  TEnumPesquisar = (venda, codigo_cliente, nome_cliente);

type
  TformVisualizarVendas = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    sbImprimirLista: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    sbExportarLista: TSpeedButton;
    sbEstornarVenda: TSpeedButton;
    Label1: TLabel;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    SpeedButton3: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource_Vendas: TDataSource;
    DataSource_Itens: TDataSource;
    PopupMenu1: TPopupMenu;
    Excluirestavenda1: TMenuItem;
    Imprimirparcelasdestavenda1: TMenuItem;
    Imprimircomprovantedavenda1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Exportaritens1: TMenuItem;
    s_DadosEmpresa: TDataSource;
    frxDB_Empresa: TfrxDBDataset;
    frx_ImprimirParcelas: TfrxReport;
    frxDB_ImprimirParcelas: TfrxDBDataset;
    frxDB_ImprimirReciboItens: TfrxDBDataset;
    s_jurosMulta: TDataSource;
    frxDB_JurosMulta: TfrxDBDataset;
    s_ImprimirReciboItens: TDataSource;
    s_ImprimirParcelas: TDataSource;
    DataSource1: TDataSource;
    s_ImprimirRecibo: TDataSource;
    frxReport1: TfrxReport;
    frx_ImprimirRecibo: TfrxReport;
    DataSource2: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    frxDB_ImprimirRecibo: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDB_ListaVendas: TfrxDBDataset;
    frx_ListaVendas: TfrxReport;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Excluirestavenda1Click(Sender: TObject);
    procedure sbEstornarVendaClick(Sender: TObject);
    procedure Estornar1Click(Sender: TObject);
    procedure sbExportarListaClick(Sender: TObject);
    procedure Exportaritens1Click(Sender: TObject);
    procedure Imprimirparcelasdestavenda1Click(Sender: TObject);
    procedure Imprimircomprovantedavenda1Click(Sender: TObject);
    procedure sbImprimirListaClick(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cbPesquisarChange(Sender: TObject);
  private
    { Private declarations }
    FEntityVisualizaVenda: iVisualizarVenda;
    FVisualizarDadosEmpresa: iDadosEmpresa;
    FImprimirParcelas: iImprimirParcelasVendas;
    FImprimirRecibo: iImprimirRecibo;
    procedure EstornarVenda;
  public
    { Public declarations }
  end;

var
  formVisualizarVendas: TformVisualizarVendas;

implementation

uses
  UClasse.Imprimir.Parcelas, softMeter_globalVar;

{$R *.dfm}

procedure TformVisualizarVendas.cbPesquisarChange(Sender: TObject);
begin
  if cbPesquisar.Text <> EmptyStr then
    edtPesquisar.SetFocus;
end;

procedure TformVisualizarVendas.DBGrid1CellClick(Column: TColumn);
begin
  if DataSource_Vendas.DataSet.RecordCount >= 1 then
  begin
    FEntityVisualizaVenda.selecionarItens
      (DataSource_Vendas.DataSet.FieldByName('ID').AsInteger)
      .listarGridItens(DataSource_Itens);

  end;
end;

procedure TformVisualizarVendas.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FCampo: string;
begin

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    venda:
      begin
        FCampo := 'ID';
      end;
    codigo_cliente:
      begin
        FCampo := 'ID_CLIENTE';
      end;
    nome_cliente:
      begin
        FCampo := 'NOME_CLIENTE';
      end;

  end;

  if edtPesquisar.Text <> EmptyStr then
    FEntityVisualizaVenda
                         .getCampo(FCampo)
                         .getValor(edtPesquisar.Text)
                         .sqlPesquisa.listarGrid(DataSource_Itens)
                         .selecionarItens(DataSource_Vendas.DataSet.FieldByName('ID').AsInteger)
                         .listarGridItens(DataSource_Itens);

end;

procedure TformVisualizarVendas.Estornar1Click(Sender: TObject);
begin
  EstornarVenda;
end;

procedure TformVisualizarVendas.Excluirestavenda1Click(Sender: TObject);
begin
  if DataSource_Vendas.DataSet.RecordCount >= 1 then
  begin
    FEntityVisualizaVenda.deletarVenda.atualizarItens;
  end;
end;

procedure TformVisualizarVendas.Exportaritens1Click(Sender: TObject);
begin
  if DataSource_Itens.DataSet.RecordCount >= 1 then
  begin
    FEntityVisualizaVenda.exportarItens
  end;
end;

procedure TformVisualizarVendas.FormCreate(Sender: TObject);
begin
  FEntityVisualizaVenda := TEntityVisuzaliarVendas.new;
  FImprimirRecibo := TImprimirRecibo.new;
  dllSoftMeter.sendEvent('visualizar vendas', 'visualizar vendas', 0);
end;

procedure TformVisualizarVendas.FormShow(Sender: TObject);
begin

  FEntityVisualizaVenda.abrir.getCampo('ID').getValor('0').sqlPesquisa.listarGrid(DataSource_Vendas);
  FEntityVisualizaVenda.selecionarItens(0).listarGridItens(DataSource_Itens);

  FVisualizarDadosEmpresa := TEntityCadastroDadosEmpresa.new;
  FImprimirParcelas := TImprimirParcelasVenda.new;
  FVisualizarDadosEmpresa.abrir.listarGrid(s_DadosEmpresa);

  ReportMemoryLeaksOnShutdown := true;

end;

procedure TformVisualizarVendas.Imprimircomprovantedavenda1Click
  (Sender: TObject);
begin
  FImprimirRecibo
                .selecionarVenda(DataSource_Vendas.DataSet.FieldByName('ID').AsInteger)
                .retornarDataSet(s_ImprimirRecibo)
                .selecionarItens(DataSource_Vendas.DataSet.FieldByName('ID').AsInteger)
                .retornarDataSetItens(s_ImprimirReciboItens);

  frx_ImprimirRecibo.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/comprovante_pagamento_venda.fr3');
  frx_ImprimirRecibo.ShowReport();

end;

procedure TformVisualizarVendas.Imprimirparcelasdestavenda1Click
  (Sender: TObject);
begin
  if DataSource_Vendas.DataSet.RecordCount >= 1 then
  begin

    FImprimirParcelas.selecionarParcelas
      (DataSource_Vendas.DataSet.FieldByName('ID').AsInteger)
      .retornarDataSet(s_ImprimirParcelas).retonarJurosMultaAtraso
      (s_jurosMulta);

    frx_ImprimirParcelas.LoadFromFile(ExtractFilePath(application.ExeName) +
      'relat�rios/carne_pagamento.fr3');
    frx_ImprimirParcelas.ShowReport();

  end;
end;

procedure TformVisualizarVendas.Panel1MouseDown(Sender: TObject;
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

procedure TformVisualizarVendas.sbEstornarVendaClick(Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('ESTORNAR');

  EstornarVenda;

end;

procedure TformVisualizarVendas.sbExportarListaClick(Sender: TObject);
begin
if DataSource_Vendas.DataSet.RecordCount >= 1 then
begin
  DataSource_Vendas.DataSet.First;
  FEntityVisualizaVenda.exportar;
end;
end;

procedure TformVisualizarVendas.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformVisualizarVendas.sbImprimirListaClick(Sender: TObject);
begin
if DataSource_Vendas.DataSet.RecordCount >= 1 then
begin
  frx_ListaVendas.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/lista_de_vendas.fr3');
  frx_ListaVendas.ShowReport();
end;

end;

procedure TformVisualizarVendas.SpeedButton3Click(Sender: TObject);
begin

  FEntityVisualizaVenda
                     .getCampo('DATA_VENDA')
                     .getDataInicial(StrToDate(edtData1.Text))
                     .getDataFinal(StrToDate(edtData2.Text))
                     .sqlPesquisaData
                     .listarGrid(DataSource_Vendas)
                     .selecionarItens(DataSource_Vendas.DataSet.FieldByName('ID').AsInteger)
                     .listarGridItens(DataSource_Itens);

end;

procedure TformVisualizarVendas.EstornarVenda;
begin
  if DataSource_Vendas.DataSet.RecordCount >= 1 then
  begin
    if DataSource_Vendas.DataSet.FieldByName('STATUS').AsString <> 'Estornada' then
    begin
      FEntityVisualizaVenda.EstornarVenda(DataSource_Vendas.DataSet.FieldByName('ID').AsInteger);
    end
    else
      raise Exception.Create('ERRO! Esta venda j� foi estornada');
  end;
end;

end.
