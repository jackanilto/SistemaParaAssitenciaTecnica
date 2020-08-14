unit Form.Relatorio.Situacao.Estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Situacao.Estoque;

type
  TEnumPesquisar = (atencao, baixo, normal, todos);

type
  TformRelatorioSituacaoDoEstoque = class(TformModeloRelatorio)
    cbPesquisarSituacao: TComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbPesquisarSituacaoChange(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    var
      FRelatorioSituacaoEstoque:iRelatorioSituacaoEstoque;

  public
    { Public declarations }
  end;

var
  formRelatorioSituacaoDoEstoque: TformRelatorioSituacaoDoEstoque;

implementation

{$R *.dfm}

procedure TformRelatorioSituacaoDoEstoque.cbPesquisarSituacaoChange(
  Sender: TObject);
begin
  inherited;

  case TEnumPesquisar(cbPesquisarSituacao.ItemIndex) of
  atencao:
  begin
    FRelatorioSituacaoEstoque.selecionarEStoqueAtencao.listarGrid(DataSource1);
  end;
  baixo:
  begin
    FRelatorioSituacaoEstoque.selecionarEStoqueBaixo.listarGrid(DataSource1);
  end;
  normal:
  begin
    FRelatorioSituacaoEstoque.selecionarEStoqueNorma.listarGrid(DataSource1);
  end;
  todos:
  begin
    FRelatorioSituacaoEstoque.selecionarEStoqueTodos.listarGrid(DataSource1);
  end;
  end;

end;

procedure TformRelatorioSituacaoDoEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioSituacaoEstoque := TRelatorioSituacaoEstoque.new;
end;

procedure TformRelatorioSituacaoDoEstoque.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioSituacaoEstoque
                          .abrir
                          .getCampo('ID')
                          .getValor('0')
                          .sqlPesquisa
                          .listarGrid(DataSource1);
end;

procedure TformRelatorioSituacaoDoEstoque.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioSituacaoEstoque.exportar;
end;

procedure TformRelatorioSituacaoDoEstoque.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_situacao_estoque.fr3');
  frxReport1.ShowReport();
end;

end.
