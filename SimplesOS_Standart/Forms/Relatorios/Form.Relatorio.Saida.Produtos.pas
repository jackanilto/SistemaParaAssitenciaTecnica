unit Form.Relatorio.Saida.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Saida.Produtos, Vcl.Mask;

type
  TEnumPesqusiar = (Cod_saida, cod_produto, produto);

type
  TformRelatorioSaidaDeProdutos = class(TformModeloRelatorio)
    Label1: TLabel;
    sbPesquisarData: TSpeedButton;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sbPesquisarDataClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    var
      FRelatorioSaida:iRelatorioSaidaDeProdutos;
  public
    { Public declarations }
  end;

var
  formRelatorioSaidaDeProdutos: TformRelatorioSaidaDeProdutos;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioSaidaDeProdutos.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioSaida.ordenarGrid(Column);
end;

procedure TformRelatorioSaidaDeProdutos.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesqusiar(cbPesquisar.ItemIndex) of
  Cod_saida:
  begin
    FCampo := 'ID';
  end;
  cod_produto:
  begin
    FCampo := 'ID_PRODUTO';
  end;
  produto:
  begin
    FCampo := 'PRODUTOS';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioSaida
                  .getCampo(FCampo)
                  .getValor(edtPesquisar.Text)
                  .sqlPesquisa
                  .listarGrid(DataSource1);

end;

procedure TformRelatorioSaidaDeProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioSaida := TRelatorioSaidaProdutos.new;
  dllSoftMeter.sendEvent('relatorio saida de produtos', 'rel saida produtos', 0);
end;

procedure TformRelatorioSaidaDeProdutos.FormShow(Sender: TObject);
begin
  inherited;

  FRelatorioSaida
                .abrir
                .getCampo('ID')
                .getValor('0')
                .sqlPesquisa
                .listarGrid(DataSource1);

end;

procedure TformRelatorioSaidaDeProdutos.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioSaida.exportar;
end;

procedure TformRelatorioSaidaDeProdutos.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_saida_produtos_lista.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioSaidaDeProdutos.sbPesquisarDataClick(Sender: TObject);
begin
  inherited;

  FRelatorioSaida
                .validarData(edtData1)
                .validarData(edtData2);

  FRelatorioSaida
                .getCampo('DATA')
                .getDataInicial(StrToDate(edtData1.Text))
                .getDataFinal(StrToDate(edtData2.Text))
                .sqlPesquisaData
                .listarGrid(DataSource1);

end;

end.
