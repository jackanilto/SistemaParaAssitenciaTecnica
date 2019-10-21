unit Form.Cadastro.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Produtos, Vcl.Mask, UFactory,
  Vcl.ExtDlgs, Vcl.Imaging.jpeg;

type
  TformCadastroProdutos = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtProduto: TEdit;
    edtCodigoDeBarras: TEdit;
    edtDescricao: TEdit;
    edtValorDeCusto: TEdit;
    edtMargemDeLucro: TEdit;
    edtValorDeVenda: TEdit;
    edtQuantidadeMinima: TEdit;
    edtQuantidadeAtual: TEdit;
    edtCodigoGrupo: TEdit;
    edtModelo: TEdit;
    edtNumeroDeSerie: TEdit;
    edtFuncionario: TEdit;
    edtCodigoDaMarca: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edtObservacao: TEdit;
    Label23: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    edtDataDeValidade: TMaskEdit;
    edtDataDeAlteracao: TMaskEdit;
    edtDataDeFabricacao: TMaskEdit;
    edtGrupo: TEdit;
    sbPesquisarGrupo: TSpeedButton;
    edtMarca: TEdit;
    sbPesquisarMarca: TSpeedButton;
    edtTipoProduto: TComboBox;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure sbPesquisarGrupoClick(Sender: TObject);
    procedure sbPesquisarMarcaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FEntityProdutos: iCadastroProdutos;
    imagem: TJPEGImage;
  public
    { Public declarations }
  end;

var
  formCadastroProdutos: TformCadastroProdutos;

var
  codigoGrupo: integer;
  codigoMarca: integer;
  grupo: string;
  marca: string;

implementation

{$R *.dfm}

uses Form.Localizar.grupo, Form.Localizar.marca;

procedure TformCadastroProdutos.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  with DataSource1.DataSet do
  begin
    edtCodigo.Text := IntToStr(FieldByName('ID').AsInteger);
    edtTipoProduto.Text := FieldByName('TIPO_CADASTROS').AsString;
    edtProduto.Text := FieldByName('SERVICO_PRODUTO');
    edtCodigoDeBarras.Text := FieldByName('CODIGO_BARRAS').AsString;
    edtDescricao.Text := FieldByName('DESCRICAO').AsString;
    edtValorDeCusto.Text := CurrToStr(FieldByName('VALOR_CUSTO').AsCurrency);
    edtMargemDeLucro.Text := FloatToStr(FieldByName('MARGEM_LUCRO').AsCurrency);
    edtValorDeVenda.Text := CurrToStr(FieldByName('VALOR_VENDA').AsCurrency);
    edtQuantidadeMinima.Text := FieldByName('QUANTIDADE_MINIMA').AsInteger.ToString;
    edtQuantidadeAtual.Text := FieldByName('QUANTIDADE_ATUAL').AsInteger.ToString;
    edtGrupo.Text := FieldByName('GRUPO').AsString;



//  tudo referente as datas e c�digo das tabelas auxiliares

  end;

end;

procedure TformCadastroProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(imagem);
end;

procedure TformCadastroProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityProdutos := TEntityProdutos.new;
end;

procedure TformCadastroProdutos.FormShow(Sender: TObject);
begin
  inherited;
  FEntityProdutos.abrir.listarGrid(DataSource1);
end;

procedure TformCadastroProdutos.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityProdutos.inserir;
  edtTipoProduto.SetFocus;
end;

procedure TformCadastroProdutos.sbPesquisarGrupoClick(Sender: TObject);
begin
  inherited;

  formLocalizarGrupo := TFormLocalizarGrupo.Create(self);
  TFactory.new.criarJanela.FormShow(formLocalizarGrupo, '');

  edtCodigoGrupo.Text := codigoGrupo.ToString;
  edtGrupo.Text := grupo;

end;

procedure TformCadastroProdutos.sbPesquisarMarcaClick(Sender: TObject);
begin
  inherited;

  formLocalizarMarca := TformLocalizarMarca.Create(self);
  TFactory.new.criarJanela.FormShow(formLocalizarMarca, '');

  edtCodigoDaMarca.Text := codigoMarca.ToString;
  edtMarca.Text := marca;

end;

procedure TformCadastroProdutos.sbSalvarClick(Sender: TObject);
begin
  // FEntityProdutos.getFoto(imagem)

  FEntityProdutos.getTipoCadastro(edtTipoProduto.Text)
    .getServicoProdutos(edtProduto.Text).getCodigoBarras(edtCodigoDeBarras.Text)
    .getDescricao(edtDescricao.Text).getValorDeCusto(edtValorDeCusto.Text)
    .getMargemDeLUcro(edtMargemDeLucro.Text)
    .getValorDeVenda(edtValorDeVenda.Text).getQuantidadeMinima
    (edtQuantidadeMinima.Text).getQuantidadeAtual(edtQuantidadeAtual.Text)
    .getDataDeValidade(edtDataDeValidade.Text)
    .getDataAlteracao(edtDataDeAlteracao.Text).getGrupo(edtGrupo.Text)
    .getCodigoGrupo(edtCodigoGrupo.Text).getCodigoMarca(edtCodigoDaMarca.Text)
    .getMarca(edtMarca.Text).getModelo(edtModelo.Text)
    .getNumeroDeSerie(edtNumeroDeSerie.Text).getDataFabricacao
    (edtDataDeFabricacao.Text).getObservacao(edtObservacao.Text)
    .getFoto(imagem).gravar;

  inherited;

end;

procedure TformCadastroProdutos.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  imagem := TJPEGImage.Create;

  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    imagem.LoadFromFile(OpenPictureDialog1.FileName);
  end;

end;

end.