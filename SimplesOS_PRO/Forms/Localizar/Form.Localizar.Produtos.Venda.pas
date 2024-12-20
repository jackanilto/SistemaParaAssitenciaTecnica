unit Form.Localizar.Produtos.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, UInterfaces,
  UClasse.Entity.Localizar.Produto.Venda;

type
  TEnumPesquisar = (codigo, Produto, codigo_barras);

type
  TformLocalizarProdutoVenda = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cbPesquisarChange(Sender: TObject);
  private
    { Private declarations }
    FEntityLocalizarProdutoVenda: iLocalizarProdutosVenda;
    FCampo: string;
  public
    { Public declarations }
  end;

var
  formLocalizarProdutoVenda: TformLocalizarProdutoVenda;

implementation

uses Form.Venda;

{$R *.dfm}

procedure TformLocalizarProdutoVenda.cbPesquisarChange(Sender: TObject);
begin
  edtPesquisar.SetFocus;
end;

procedure TformLocalizarProdutoVenda.DBGrid1DblClick(Sender: TObject);
begin

  if DataSource1.DataSet.RecordCount >= 1 then
  begin

    SituacaoDoEstoque := FEntityLocalizarProdutoVenda.setSituacaoDoEstoque;
    CodigoDoProduto := FEntityLocalizarProdutoVenda.setCodigoDoProduto;
    NomeDoProduto := FEntityLocalizarProdutoVenda.setNomeDoProduto;
    CodigoDeBarras := FEntityLocalizarProdutoVenda.setCodigoDeBarras;
    QuantidadeDeProdutos := FEntityLocalizarProdutoVenda.setQuantidade;
    QuantidadeEmEstoque := FEntityLocalizarProdutoVenda.setQuantidadeEmEstoque;
    FEntityLocalizarProdutoVenda.setFotoProduto(formVendas.Image1);
    valorUnitario := FEntityLocalizarProdutoVenda.setValorUnitarioProduto;
    valorTotalDoProduto := FEntityLocalizarProdutoVenda.setValorUnitarioProduto;

    close;

  end;
end;

procedure TformLocalizarProdutoVenda.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if cbPesquisar.Text = EmptyStr then
    raise Exception.Create('Informe por qual campo deseja pesquisar');

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    codigo:
      begin
        FCampo := 'ID';
      end;
    Produto:
      begin
        FCampo := 'PRODUTO';
      end;
    codigo_barras:
      begin
        FCampo := 'CODIGO_BARRAS';
      end;
  end;

  if edtPesquisar.Text <> EmptyStr then
  begin
    FEntityLocalizarProdutoVenda.getCampo(FCampo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1);
  end;

end;

procedure TformLocalizarProdutoVenda.FormCreate(Sender: TObject);
begin
  FEntityLocalizarProdutoVenda := TEntityLocalizarProdutoVenda.new;
end;

procedure TformLocalizarProdutoVenda.FormShow(Sender: TObject);
begin
  FEntityLocalizarProdutoVenda
                          .abrir.getCampo('ID')
                          .getValor('%')
                          .sqlPesquisa
                          .listarGrid(DataSource1);

  edtPesquisar.SetFocus;

end;

procedure TformLocalizarProdutoVenda.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
