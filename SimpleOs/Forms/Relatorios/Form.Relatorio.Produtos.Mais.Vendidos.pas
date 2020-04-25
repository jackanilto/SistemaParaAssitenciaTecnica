unit Form.Relatorio.Produtos.Mais.Vendidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Produtos.Mais.Vendidos;

type
  TformRelatorioProdutosMaisVendidos = class(TformModeloRelatorio)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    var
      FRelatorioProdutos:iRealatorioProdutosMaisVendidos;
  public
    { Public declarations }
  end;

var
  formRelatorioProdutosMaisVendidos: TformRelatorioProdutosMaisVendidos;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioProdutosMaisVendidos.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioProdutos := TRelatorioProdutosMaisVendidos.new;
  dllSoftMeter.sendEvent('relatorio produtos mais vendidos', 'rel prod mais vendidos', 0);
end;

procedure TformRelatorioProdutosMaisVendidos.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioProdutos
                    .abrir
                    .produtosMaisVendidos
                    .listarGrid(DataSource1);
end;

procedure TformRelatorioProdutosMaisVendidos.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioProdutos.exportar;
end;

procedure TformRelatorioProdutosMaisVendidos.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_produtos_mais_vendidos.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioProdutosMaisVendidos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  FRelatorioProdutos.produtosMaisVendidos.listarGrid(DataSource1);
end;

procedure TformRelatorioProdutosMaisVendidos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  FRelatorioProdutos.produtosMenosVendidos.listarGrid(DataSource1);
end;

end.
