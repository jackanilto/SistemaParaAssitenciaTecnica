unit Form.Relatorio.Entrada.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Entrada.Produtos, Vcl.Mask;

type
  TEnumPesquisar = (cod_entrada, cod_produto, produto, numero_nota);

type
  TformRelatorioEntradasDeProdutos = class(TformModeloRelatorio)
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
    procedure sbPesquisarDataClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);  private
    { Private declarations }
    var
      FRelatorioEntradaProdutos : iRelatorioEntradaDeProdutos;
  public
    { Public declarations }
  end;

var
  formRelatorioEntradasDeProdutos: TformRelatorioEntradasDeProdutos;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioEntradasDeProdutos.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioEntradaProdutos.ordenarGrid(Column);
end;

procedure TformRelatorioEntradasDeProdutos.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  cod_entrada:
  begin
    FCampo := 'ID';
  end;
  cod_produto:
  begin
    FCampo := 'ID_PRODUTO';
  end;
  produto:
  begin
    FCampo := 'PRODUTO';
  end;
  numero_nota:
  begin
    FCampo := 'NUMERO_NOTA';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioEntradaProdutos
                            .getCampo(FCampo)
                            .getValor(edtPesquisar.Text)
                            .sqlPesquisa
                            .listarGrid(DataSource1);

end;

procedure TformRelatorioEntradasDeProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioEntradaProdutos := TRelatorioEntradaprodutos.new;
  dllSoftMeter.sendEvent('relatorio de entradas de produtos', 'rel entrada produtos', 0);
end;

procedure TformRelatorioEntradasDeProdutos.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioEntradaProdutos
                          .abrir
                          .getCampo('ID')
                          .getValor('0')
                          .sqlPesquisa
                          .listarGrid(DataSource1);
end;

procedure TformRelatorioEntradasDeProdutos.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioEntradaProdutos.exportar;
end;

procedure TformRelatorioEntradasDeProdutos.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_entradas_produtos_lista.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioEntradasDeProdutos.sbPesquisarDataClick(
  Sender: TObject);
begin
  inherited;

  FRelatorioEntradaProdutos
                          .validarData(edtData1)
                          .validarData(edtData2);

  FRelatorioEntradaProdutos
                          .getCampo('DATA')
                          .getDataInicial(StrToDate(edtData1.Text))
                          .getDataFinal(StrToDate(edtData2.Text))
                          .sqlPesquisaData
                          .listarGrid(DataSource1);

end;

end.
