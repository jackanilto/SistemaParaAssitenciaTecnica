unit Form.Localizar.Produtos.Saidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, UDados.Conexao, FireDAC.Comp.Client;

type
  TEnumPesquisar = (codigo, cod_barras, produto);

type
  TFormLocalizarProdutosSaida = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbFecharClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cbPesquisarChange(Sender: TObject);
  private
    { Private declarations }
    procedure selecionarRegistros;

  var
    FQuery: TFDQuery;
    FCampo: string;
    FValor: string;
  public
    { Public declarations }
  end;

var
  FormLocalizarProdutosSaida: TFormLocalizarProdutosSaida;

implementation

{$R *.dfm}

uses Form.Saidas.Produtos;

procedure TFormLocalizarProdutosSaida.cbPesquisarChange(Sender: TObject);
begin
  edtPesquisar.SetFocus;
end;

procedure TFormLocalizarProdutosSaida.DBGrid1DblClick(Sender: TObject);
begin
  formSaidaDeProdutos.edtCodigoProduto.Text :=
    inttostr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  formSaidaDeProdutos.edtProduto.Text := DataSource1.DataSet.FieldByName
    ('PRODUTO').AsString;
  formSaidaDeProdutos.edtValorProduto.Text :=
    CurrToStr(DataSource1.DataSet.FieldByName('VALOR_VENDA').AsCurrency);
  formSaidaDeProdutos.edtQuantidade.Text := '1';
  formSaidaDeProdutos.edtTotal.Text :=
    CurrToStr(DataSource1.DataSet.FieldByName('VALOR_VENDA').AsCurrency);

  close;
end;

procedure TFormLocalizarProdutosSaida.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  codigo:
  begin
    FCampo := 'ID'
  end;
  cod_barras:
  begin
    FCampo := 'CODIGO_BARRAS';
  end;
  produto:
  begin
    FCampo := 'PRODUTO'
  end;
  end;

//  if cbPesquisar.Text = 'C�digo' then
//    FCampo := 'ID'
//  else if cbPesquisar.Text = 'PRODUTO' then
//    FCampo := 'PRODUTO'
//  else if cbPesquisar.Text = 'C�digo de barras' then
//    FCampo := 'CODIGO_BARRAS';

  FValor := UpperCase(edtPesquisar.Text);

  selecionarRegistros;

end;

procedure TFormLocalizarProdutosSaida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FQuery.Free;
end;

procedure TFormLocalizarProdutosSaida.FormCreate(Sender: TObject);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DataModule1.Conexao;
end;

procedure TFormLocalizarProdutosSaida.FormShow(Sender: TObject);
begin
  FCampo := 'ID';
  FValor := '0';
  selecionarRegistros;
end;

procedure TFormLocalizarProdutosSaida.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TFormLocalizarProdutosSaida.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFormLocalizarProdutosSaida.selecionarRegistros;
begin

  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from PRODUTOS where ' + FCampo + ' like :v');
  FQuery.ParamByName('v').AsString := FValor + '%';
  FQuery.Active := true;

  FQuery.FieldByName('ID').DisplayLabel := 'C�digo';
  FQuery.FieldByName('PRODUTO').DisplayLabel := 'Produto';
  FQuery.FieldByName('CODIGO_BARRAS').DisplayLabel := 'C�d. de barras';
  FQuery.FieldByName('DESCRICAO').DisplayLabel := 'Descri��o';
  FQuery.FieldByName('VALOR_CUSTO').DisplayLabel := 'Valor de custo';
  FQuery.FieldByName('MARGEM_LUCRO').DisplayLabel := 'Margem de lucro';
  FQuery.FieldByName('VALOR_VENDA').DisplayLabel := 'Valor de venda';
  FQuery.FieldByName('QUANTIDADE_MINIMA').DisplayLabel := 'QTDE m�nima';
  FQuery.FieldByName('QUANTIDADE_ATUAL').DisplayLabel := 'QTDE atual';
  FQuery.FieldByName('DATA_VALIDADE').DisplayLabel := 'Validade';
  FQuery.FieldByName('DATA_ALTERACAO').DisplayLabel := 'Altera��o';
  FQuery.FieldByName('ID_GRUPO').DisplayLabel := 'C�digo do grupo';
  FQuery.FieldByName('GRUPO').DisplayLabel := 'Grupo';
  FQuery.FieldByName('ID_MARCA').DisplayLabel := 'C�digo da marca';
  FQuery.FieldByName('MARCA').DisplayLabel := 'Marca';
  FQuery.FieldByName('MODELO').DisplayLabel := 'Modelo';
  FQuery.FieldByName('NUMERO_SERIE').DisplayLabel := 'N�mero de serie';
  FQuery.FieldByName('DATA_FABRICACAO').DisplayLabel := 'Fabrica��o';
  FQuery.FieldByName('FUNCIONARIO').Visible := false;
  FQuery.FieldByName('FOTO').Visible := false;
  FQuery.FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

  FQuery.FieldByName('PRODUTO').DisplayWidth := 30;
  FQuery.FieldByName('CODIGO_BARRAS').DisplayWidth := 25;
  FQuery.FieldByName('DESCRICAO').DisplayWidth := 20;
  FQuery.FieldByName('GRUPO').DisplayWidth := 30;
  FQuery.FieldByName('MARCA').DisplayWidth := 30;
  FQuery.FieldByName('MODELO').DisplayWidth := 30;
  FQuery.FieldByName('NUMERO_SERIE').DisplayWidth := 30;
  FQuery.FieldByName('OBSERVACAO').DisplayWidth := 30;

  DataSource1.DataSet := FQuery;
end;

end.
