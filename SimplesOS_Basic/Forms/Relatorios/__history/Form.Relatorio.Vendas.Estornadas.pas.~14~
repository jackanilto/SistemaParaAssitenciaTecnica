unit Form.Relatorio.Vendas.Estornadas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Vendas.Estornadas, Vcl.Mask;

type
  TEnumPesquisar = (venda, cod_cliente, cliente);

type
  TformRelatorioVendasEstornadas = class(TformModeloRelatorio)
    Label1: TLabel;
    sbPesquisarDatas: TSpeedButton;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);private
    { Private declarations }
  var
    FRelatorioVendasEstornadas: iRelatorioVendasEstornadas;
  public
    { Public declarations }
  end;

var
  formRelatorioVendasEstornadas: TformRelatorioVendasEstornadas;

implementation

{$R *.dfm}

procedure TformRelatorioVendasEstornadas.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:String;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  venda:
  begin
    FCampo:='ID_VENDA';
  end;
  cod_cliente:
  begin
    FCampo := 'ID_CLIENTE';
  end;
  cliente:
  begin
    FCampo := 'NOME_CLIENTE';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioVendasEstornadas
                              .getCampo(FCampo)
                              .getValor(edtPesquisar.Text)
                              .sqlPesquisa
                              .listarGrid(DataSource1);

end;

procedure TformRelatorioVendasEstornadas.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioVendasEstornadas := TRelatorioVendasEstornadas.new;
end;

procedure TformRelatorioVendasEstornadas.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioVendasEstornadas
                            .abrir
                            .getCampo('ID_ESTORNO')
                            .getValor('0')
                            .sqlPesquisa
                            .listarGrid(DataSource1);
end;

procedure TformRelatorioVendasEstornadas.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioVendasEstornadas.exportar;
end;

procedure TformRelatorioVendasEstornadas.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_vendas_estornadas.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioVendasEstornadas.sbPesquisarDatasClick(Sender: TObject);
begin
  inherited;

  FRelatorioVendasEstornadas.validarData(edtData1).validarData(edtData2);

  FRelatorioVendasEstornadas
                            .getCampo('DATA')
                            .getDataInicial(StrToDate(edtData1.Text))
                            .getDataFinal(StrToDate((edtData2.Text)))
                            .sqlPesquisaData
                            .listarGrid(DataSource1);

end;

end.
