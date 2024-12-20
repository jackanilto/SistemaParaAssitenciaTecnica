unit Form.Relatorio.Parcelas.Pagas.Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Parcelas.Pagas.Vendas, Vcl.Mask;

type
  TEnumPesquisar = (parcela, venda, cod_cliente, cliente);

type
  TEnumPesquisarData = (vencimento, pagamento);

type
  TformRelatorioParcelasPagasVendas = class(TformModeloRelatorio)
    Label1: TLabel;
    sbPesquisarDatas: TSpeedButton;
    Label2: TLabel;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    cbPesquisarData: TComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure cbPesquisarDataChange(Sender: TObject);
  private
    { Private declarations }
    var
      FParcelasPagasVendas:iRelatorioParcelasPagasVendas;
  public
    { Public declarations }
  end;

var
  formRelatorioParcelasPagasVendas: TformRelatorioParcelasPagasVendas;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioParcelasPagasVendas.cbPesquisarDataChange(
  Sender: TObject);
begin
  inherited;

  if cbPesquisarData.Text <> EmptyStr then
    edtData1.SetFocus;

end;

procedure TformRelatorioParcelasPagasVendas.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FParcelasPagasVendas.ordenarGrid(Column);
end;

procedure TformRelatorioParcelasPagasVendas.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  parcela:
  begin
    FCampo := 'ID_PARCELA';
  end;
  venda:
  begin
    FCampo := 'ID_VENDA';
  end;
  cod_cliente:
  begin
    FCampo := 'ID_CLIENTE';
  end;
  cliente:
  begin
    FCampo := 'CLIENTE';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FParcelasPagasVendas
                        .getCampo(FCampo)
                        .getValor(edtPesquisar.Text)
                        .sqlPesquisa
                        .listarGrid(DataSource1);

end;

procedure TformRelatorioParcelasPagasVendas.FormCreate(Sender: TObject);
begin
  inherited;
  FParcelasPagasVendas := TRelatorioParcelasPagasVendas.new;
  dllSoftMeter.sendEvent('relatorio parcelas pagas vendas', 'rel parcelas pagas vendas', 0);
end;

procedure TformRelatorioParcelasPagasVendas.FormShow(Sender: TObject);
begin
  inherited;
  FParcelasPagasVendas
            .abrir
            .getCampo('ID_PARCELA')
            .getValor('0')
            .sqlPesquisa
            .listarGrid(DataSource1)
end;

procedure TformRelatorioParcelasPagasVendas.sbExportarClick(Sender: TObject);
begin
  inherited;
  FParcelasPagasVendas.exportar;
end;

procedure TformRelatorioParcelasPagasVendas.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_parcelas_pagas_vendas.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioParcelasPagasVendas.sbPesquisarDatasClick(
  Sender: TObject);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisarData(cbPesquisarData.ItemIndex) of
  vencimento:
  begin
    FCampo := 'DATA_VENCIMENTO';
  end;
  pagamento:
  begin
    FCampo := 'DATA_PAGAMENTO';
  end;
  end;

  FParcelasPagasVendas
                .validarData(edtData1)
                .validarData(edtData2);

  FParcelasPagasVendas
                .getCampo(FCampo)
                .getDataInicial(StrToDate(edtData1.Text))
                .getDataFinal(StrToDate(edtData2.Text))
                .sqlPesquisaData
                .listarGrid(DataSource1);
end;

end.
