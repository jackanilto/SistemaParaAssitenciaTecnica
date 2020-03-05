unit Form.Relatorio.Vendas.Por.Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Vendas.Por.Funcionarios;

type
  TEnumPesquisar = (codigo, nome);

type
  TformRelatorioVendasPorFuncionario = class(TformModeloRelatorio)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    var
      FRelatorioVendas:iRelatorioVendasPorFucnionario;
  public
    { Public declarations }
  end;

var
  formRelatorioVendasPorFuncionario: TformRelatorioVendasPorFuncionario;

implementation

{$R *.dfm}

procedure TformRelatorioVendasPorFuncionario.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  codigo:
  begin
   FCampo := 'ID_FUNCIONARIO';
  end;
  nome:
  begin
   FCampo := 'NOME_FUNCIONARIO';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioVendas
                    .getCampo(FCampo)
                    .getValor(edtPesquisar.Text)
                    .sqlPesquisa
                    .listarGrid(DataSource1);

end;

procedure TformRelatorioVendasPorFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioVendas := TRelatorioVendasPorFuncionarios.new;
end;

procedure TformRelatorioVendasPorFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioVendas
                  .abrir
                  .listarGrid(DataSource1);
end;

procedure TformRelatorioVendasPorFuncionario.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioVendas.exportar;
end;

procedure TformRelatorioVendasPorFuncionario.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_vendas_por_funcionario.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioVendasPorFuncionario.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  FRelatorioVendas.maiorNumeroDeVendas.listarGrid(DataSource1);
end;

procedure TformRelatorioVendasPorFuncionario.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  FRelatorioVendas.menorNumeroDeVendas.listarGrid(DataSource1);
end;

end.
