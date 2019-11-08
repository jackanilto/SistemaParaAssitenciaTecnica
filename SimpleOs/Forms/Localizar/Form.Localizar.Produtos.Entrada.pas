unit Form.Localizar.Produtos.Entrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, UDados.Conexao;

type
  TformLocalizarProdutosEntradas = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label4: TLabel;
    cbPesquisar: TComboBox;
    Label5: TLabel;
    edtPesquisar: TEdit;
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
  formLocalizarProdutosEntradas: TformLocalizarProdutosEntradas;

implementation

{$R *.dfm}

procedure TformLocalizarProdutosEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FQuery.Free;
end;

procedure TformLocalizarProdutosEntradas.FormCreate(Sender: TObject);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DataModule1.Conexao;
end;

procedure TformLocalizarProdutosEntradas.FormShow(Sender: TObject);
begin
  FCampo := 'ID';
  FValor := '0';
  selecionarRegistros;
end;

procedure TformLocalizarProdutosEntradas.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformLocalizarProdutosEntradas.selecionarRegistros;
begin
  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from PRODUTOS where ' + FCampo + ' like :v');
  FQuery.ParamByName('v').AsString := FValor + '%';
  FQuery.Active := true;

  FQuery.FieldByName('ID').DisplayLabel := 'C�digo';
  FQuery.FieldByName('TIPO_CADASTROS').DisplayLabel := 'Tipo de cadastro';
  FQuery.FieldByName('SERVICO_PRODUTO').DisplayLabel := 'Produto/Servi�o';
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

  FQuery.FieldByName('SERVICO_PRODUTO').DisplayWidth := 30;
  FQuery.FieldByName('TIPO_CADASTROS').DisplayWidth := 18;
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
