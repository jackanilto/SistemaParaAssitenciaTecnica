unit Form.Relatorio.Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Vendas, Vcl.Mask, Vcl.Menus;

type
  TEnumPesquisar = (venda, cod_cliente, nome_cliente);

type
  TformRelatorioVendas = class(TformModeloRelatorio)
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    sbPesquisarData: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Exportar1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Imprimir2: TMenuItem;
    Exportar2: TMenuItem;
    frxDB_ItensVenda: TfrxDBDataset;
    frx_ItensVenda: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDataClick(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure Exportar2Click(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Imprimir2Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);  private
    { Private declarations }
    var
      FRelatorioVenda:iRelatorioVendas;
  public
    { Public declarations }
  end;

var
  formRelatorioVendas: TformRelatorioVendas;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioVendas.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    FRelatorioVenda
                  .selecionarItensVenda(DataSource1.DataSet.FieldByName('ID').AsInteger)
                  .listarItens(DataSource2);
  end;
end;

procedure TformRelatorioVendas.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioVenda.ordenarGrid(Column);
end;

procedure TformRelatorioVendas.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    FCampo : string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  venda:
  begin
    FCampo := 'ID';
  end;
  cod_cliente:
  begin
    FCampo := 'ID_CLIENTE';
  end;
  nome_cliente:
  begin
    FCampo := 'NOME_CLIENTE';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioVenda
                  .getCampo(FCampo)
                  .getValor(edtPesquisar.Text)
                  .sqlPesquisa
                  .listarGrid(DataSource1)
                  .selecionarItensVenda(DataSource1.DataSet.FieldByName('ID').AsInteger)
                  .listarItens(DataSource2);



end;

procedure TformRelatorioVendas.Exportar1Click(Sender: TObject);
begin
  inherited;
  FRelatorioVenda.exportar;
end;

procedure TformRelatorioVendas.Exportar2Click(Sender: TObject);
begin
  inherited;
    FRelatorioVenda.exportarItens;
end;

procedure TformRelatorioVendas.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioVenda := TRelatorioVendas.new;
  dllSoftMeter.sendEvent('relatorio vendas', 'rel vendas', 0);
end;

procedure TformRelatorioVendas.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioVenda
                .abrir
                .getCampo('ID')
                .getValor('-1')
                .sqlPesquisa
                .listarGrid(DataSource1)
                .selecionarItensVenda(0)
                .listarItens(DataSource2);
end;

procedure TformRelatorioVendas.Imprimir1Click(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_vendas.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioVendas.Imprimir2Click(Sender: TObject);
begin
  inherited;
  frx_ItensVenda.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_vendas_itens.fr3');
  frx_ItensVenda.ShowReport();
end;

procedure TformRelatorioVendas.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioVenda.exportar;
end;

procedure TformRelatorioVendas.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_vendas.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioVendas.sbPesquisarDataClick(Sender: TObject);
begin
  inherited;
  FRelatorioVenda
                .validarData(edtData1)
                .validarData(edtData2);

  FRelatorioVenda
                .getCampo('DATA_VENDA')
                .getDataInicial(StrToDate(edtData1.Text))
                .getDataFinal(StrToDate(edtData2.Text))
                .sqlPesquisaData
                .listarGrid(DataSource1)
                .selecionarItensVenda(DataSource1.DataSet.FieldByName('ID').AsInteger)
                .listarItens(DataSource2);

end;

end.
