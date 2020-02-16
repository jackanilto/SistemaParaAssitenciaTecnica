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
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);  private
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
              .listarGrid(DataSource1);
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

end;

end.