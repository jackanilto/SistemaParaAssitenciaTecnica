unit Form.Relatorio.Historico.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UClasse.Historico.OS.Clientes, UInterfaces, Vcl.Mask, UFactory,
  Vcl.Menus;

type
  TEnumPesquisar = (codigo_cliente, codigo_os, nome_cliente);

 type
    TEnumPesquisarDatas = (cadatro, saida);

type
  TformRelatorioHistoricoOS = class(TformModeloRelatorio)
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    cbPesquisarSituacao: TComboBox;
    Label1: TLabel;
    Bevel1: TBevel;
    cbPesquisarData: TComboBox;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    sbPesquisarData: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    PopupMenu1: TPopupMenu;
    Exportar1: TMenuItem;
    Imprimir1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Exportar2: TMenuItem;
    Imprimir2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbPesquisarSituacaoChange(Sender: TObject);
    procedure sbPesquisarDataClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure Exportar2Click(Sender: TObject);
  private
    { Private declarations }
  var
    FEntityHistorico: iHistoricoOSClientes;
  public
    { Public declarations }
  end;

var
  formRelatorioHistoricoOS: TformRelatorioHistoricoOS;

implementation

{$R *.dfm}

procedure TformRelatorioHistoricoOS.cbPesquisarSituacaoChange(Sender: TObject);
begin
  inherited;
 if cbPesquisarSituacao.Text <> EmptyStr then
 begin
   FEntityHistorico
          .getCampo('SITUACAO_DA_ORDEM')
          .getValor(cbPesquisarSituacao.Text)
          .sqlPesquisa.listarGrid(DataSource1)
          .selecionarServicosOS(DataSource1.DataSet.FieldByName('ID_ORDEM').AsInteger)
          .listarGridServicos(DataSource2);
 end;
end;

procedure TformRelatorioHistoricoOS.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    FEntityHistorico.selecionarServicosOS
      (DataSource1.DataSet.FieldByName('ID_ORDEM').AsInteger)
      .listarGridServicos(DataSource2);
  end;
end;

procedure TformRelatorioHistoricoOS.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FCampo: string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    codigo_cliente:
      begin
        FCampo := 'ID_CLIENTE';
      end;
    codigo_os:
      begin
        FCampo := 'ID_ORDEM';
      end;
    nome_cliente:
      begin
        FCampo := 'NOME_CLIENTE';
      end;

  end;

  if edtPesquisar.Text <> EmptyStr then
    FEntityHistorico.getCampo(FCampo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1).selecionarServicosOS
      (DataSource1.DataSet.FieldByName('ID_ORDEM').AsInteger)
      .listarGridServicos(DataSource2);

end;

procedure TformRelatorioHistoricoOS.Exportar1Click(Sender: TObject);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
begin
  FEntityHistorico.exportar;
end;
end;

procedure TformRelatorioHistoricoOS.Exportar2Click(Sender: TObject);
begin
  inherited;
  if DataSource2.DataSet.RecordCount >= 1 then
  begin
    FEntityHistorico.exportarListaServicos;
  end;
end;

procedure TformRelatorioHistoricoOS.FormCreate(Sender: TObject);
begin
  inherited;

  FEntityHistorico := TEntityHistoricoOSClientes.new;

  TFactory.new.ftTable.FD_Table('SITUACAO_ORDEM')
    .getCampoTabela('SITUACAO_ORDEM').popularComponenteComboBox
    (cbPesquisarSituacao);

end;

procedure TformRelatorioHistoricoOS.FormShow(Sender: TObject);
begin
  inherited;
  FEntityHistorico.abrir.listarGrid(DataSource1);
  FEntityHistorico.selecionarServicosOS(0).listarGridServicos(DataSource2);
end;

procedure TformRelatorioHistoricoOS.sbExportarClick(Sender: TObject);
begin
  inherited;
 FEntityHistorico.exportar;
end;

procedure TformRelatorioHistoricoOS.sbPesquisarDataClick(Sender: TObject);
var
  FCampo:string;
begin
  inherited;

  case TEnumPesquisarDatas(cbPesquisarData.ItemIndex) of
  cadatro:
  begin
    FCampo:= 'DATA_ENTRADA';
  end;
  saida:
  begin
   FCampo := 'DATA_FINALIZACAO';
  end;

  end;

  if ((edtData1.Text <> EmptyStr) and (edtData2.Text <> EmptyStr)) then
  begin

    FEntityHistorico.validarData(edtData1);
    FEntityHistorico.validarData(edtData2);

    FEntityHistorico
           .getCampo(FCampo)
           .getDataInicial(StrToDate(edtData1.Text))
           .getDataFinal(StrToDate(edtData2.Text))
           .sqlPesquisaData
           .listarGrid(DataSource1)
           .selecionarServicosOS(DataSource1.DataSet.FieldByName('ID_ORDEM').AsInteger)
           .listarGridServicos(DataSource2);
  end
  else
  begin
    raise Exception.Create('Informe as datas para pesquisar corretamente');
  end;


end;

end.
