unit Form.Relatorio.Parcelas.Venda.Inadimplentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Vendas.Inadimplentes, Vcl.Mask;

type
  TEnumpesquisar = (parcela, venda, cod_cliente, cliente);

type
  TformRelatorioVendasInadimplentes = class(TformModeloRelatorio)
    Label1: TLabel;
    sbPesquisarData: TSpeedButton;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDataClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);  private
    { Private declarations }
    var
      FRelatorioInadimplentes:iRelatorioVendaInadimplentes;
  public
    { Public declarations }
  end;

var
  formRelatorioVendasInadimplentes: TformRelatorioVendasInadimplentes;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioVendasInadimplentes.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioInadimplentes.ordenarGrid(Column);
end;

procedure TformRelatorioVendasInadimplentes.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumpesquisar(cbPesquisar.ItemIndex) of
  parcela:
  begin
    Fcampo := 'ID_PARCELA';
  end;
  venda:
  begin
    Fcampo := 'ID_VENDA';
  end;
  cod_cliente:
  begin
    Fcampo := 'ID_CLIENTE';
  end;
  cliente:
  begin
    Fcampo := 'CLIENTE';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioInadimplentes
                          .getCampo(FCampo)
                          .getValor(edtPesquisar.Text)
                          .selecionarVendas
                          .listarGrid(DataSource1);

end;

procedure TformRelatorioVendasInadimplentes.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioInadimplentes := TRelatorioVendasInadimplentes.new;
  dllSoftMeter.sendEvent('relatorio parcelas vendas inadim', 'rel parc venda inad', 0);
end;

procedure TformRelatorioVendasInadimplentes.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioInadimplentes
                        .abrir
                        .getCampo('ID_VENDA')
                        .getValor('0')
                        .selecionarVendas
                        .listarGrid(DataSource1);
end;

procedure TformRelatorioVendasInadimplentes.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioInadimplentes.exportar;
end;

procedure TformRelatorioVendasInadimplentes.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_venda_inadimplentes.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioVendasInadimplentes.sbPesquisarDataClick(
  Sender: TObject);
begin
  inherited;

  FRelatorioInadimplentes
                        .validarData(edtData1)
                        .validarData(edtData2);


  FRelatorioInadimplentes
                        .getCampo('DATA_VENCIMENTO')
                        .getDataInicial(StrToDate(edtData1.Text))
                        .getDataFinal(StrToDate(edtData2.Text))
                        .selecionarVendaData
                        .listarGrid(DataSource1);

end;

end.
