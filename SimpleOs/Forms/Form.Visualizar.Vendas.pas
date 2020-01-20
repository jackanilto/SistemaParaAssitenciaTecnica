unit Form.Visualizar.Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.Menus, UInterfaces,
  UClasse.Visualizar.Vendas;

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
    Estornarestavenda1: TMenuItem;
    Imprimirparcelasdestavenda1: TMenuItem;
    Imprimircomprovantedavenda1: TMenuItem;
    Estornar1: TMenuItem;
    Exportalistadasvendas1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Exportaritens1: TMenuItem;
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
  private
    { Private declarations }
    FEntityVisualizaVenda: iVisualizarVenda;
  public
    { Public declarations }
  end;

var
  formVisualizarVendas: TformVisualizarVendas;

implementation

{$R *.dfm}

procedure TformVisualizarVendas.DBGrid1CellClick(Column: TColumn);
begin
  if DataSource_Vendas.DataSet.RecordCount >= 1 then
  begin
    FEntityVisualizaVenda.selecionarItens
      (DataSource_Vendas.DataSet.FieldByName('ID').AsInteger)
      .listarGridItens(DataSource_Itens);

  end;
end;

procedure TformVisualizarVendas.Estornar1Click(Sender: TObject);
begin
  sbEstornarVenda.Click;
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
end;

procedure TformVisualizarVendas.FormShow(Sender: TObject);
begin
  FEntityVisualizaVenda.abrir.listarGrid(DataSource_Vendas);
  FEntityVisualizaVenda.selecionarItens(0).listarGridItens(DataSource_Itens);
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
  if DataSource_Vendas.DataSet.RecordCount >= 1 then
  begin
    FEntityVisualizaVenda.EstornarVenda
      (DataSource_Vendas.DataSet.FieldByName('ID').AsInteger);
  end;
end;

procedure TformVisualizarVendas.sbExportarListaClick(Sender: TObject);
begin
  FEntityVisualizaVenda.exportar;
end;

procedure TformVisualizarVendas.sbFecharClick(Sender: TObject);
begin
  Close;
end;

end.
