unit Form.Relatorio.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.OS, Vcl.Menus, Vcl.Mask;

type
  TEnumPesquisar = (os, cod_cliente, nome_cliente);

type
  TEnumPesquisarData = (entrada, saida);

type
  TformRelatorioOrdemDeServico = class(TformModeloRelatorio)
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    popM_ServicosRealiados: TPopupMenu;
    popM_Ocorrencias: TPopupMenu;
    Exportar1: TMenuItem;
    Imprimir1: TMenuItem;
    I1: TMenuItem;
    Imprimir2: TMenuItem;
    s_ServicosRealizados: TDataSource;
    s_Ocorrencias: TDataSource;
    Bevel1: TBevel;
    Label1: TLabel;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    sbPesquisarDatas: TSpeedButton;
    Bevel2: TBevel;
    cbPesquisarData: TComboBox;
    Label2: TLabel;
    popM_RelatorioOS: TPopupMenu;
    Exportar2: TMenuItem;
    Imprimir3: TMenuItem;
    frxDBD_ServicosRealizados: TfrxDBDataset;
    frx_ServicosRealizados: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure Exportar2Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure Imprimir3Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);  private
    { Private declarations }
    var
      FRelatorioOS:iRelatorioOS;
  public
    { Public declarations }
  end;

var
  formRelatorioOrdemDeServico: TformRelatorioOrdemDeServico;

implementation

{$R *.dfm}

procedure TformRelatorioOrdemDeServico.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    FRelatorioOS.listarGridServicos(s_ServicosRealizados);
  end;
end;

procedure TformRelatorioOrdemDeServico.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioOS.ordenarGrid(Column);
end;

procedure TformRelatorioOrdemDeServico.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    Fcampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  os:
  begin
    Fcampo := 'ID_ORDEM';
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
    FRelatorioOS
                .getCampo(Fcampo)
                .getValor(edtPesquisar.Text)
                .sqlPesquisa
                .listarGrid(DataSource1);

  FRelatorioOS.limparGridServicos(s_ServicosRealizados);

end;

procedure TformRelatorioOrdemDeServico.Exportar1Click(Sender: TObject);
begin
  inherited;
  FRelatorioOS.exportarServicos;
end;

procedure TformRelatorioOrdemDeServico.Exportar2Click(Sender: TObject);
begin
  inherited;
  FRelatorioOS.exportar;
end;

procedure TformRelatorioOrdemDeServico.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioOS := TRelatorioOS.new;
end;

procedure TformRelatorioOrdemDeServico.FormShow(Sender: TObject);
begin
  inherited;
   FRelatorioOS
              .abrir
              .getCampo('ID_ORDEM')
              .getValor('0')
              .sqlPesquisa
              .listarGrid(DataSource1);
end;

procedure TformRelatorioOrdemDeServico.Imprimir1Click(Sender: TObject);
begin
  inherited;
  frx_ServicosRealizados.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_os_servicos.fr3');
  frx_ServicosRealizados.ShowReport();
end;

procedure TformRelatorioOrdemDeServico.Imprimir3Click(Sender: TObject);
begin
  inherited;
   frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_os.fr3');
   frxReport1.ShowReport()
end;

procedure TformRelatorioOrdemDeServico.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioOS.exportar;
end;

procedure TformRelatorioOrdemDeServico.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_os.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioOrdemDeServico.sbPesquisarDatasClick(Sender: TObject);
var
  FCampo:string;
begin
  inherited;

  case TEnumPesquisarData(cbPesquisarData.ItemIndex) of
  entrada:
  begin
    FCampo := 'DATA_ENTRADA';
  end;
  saida:
  begin
    FCampo := 'DATA_FINALIZACAO';
  end;
  end;

  FRelatorioOS
              .validarData(edtData1)
              .validarData(edtData2);

  FRelatorioOS
              .getCampo(FCampo)
              .getDataInicial(StrToDate(edtData1.Text))
              .getDataFinal(StrToDate(edtData2.Text))
              .sqlPesquisaData
              .listarGrid(DataSource1);

  FRelatorioOS.limparGridServicos(s_ServicosRealizados);

end;

end.
