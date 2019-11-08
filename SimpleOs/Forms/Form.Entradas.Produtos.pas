unit Form.Entradas.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Entradas.Produtos, Vcl.Mask,
  UFactory;

type
  TformEntradaDeProdutos = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtCodigoDoProduto: TEdit;
    edtProduto: TEdit;
    edtValorPorItens: TEdit;
    edtQuantidade: TEdit;
    edtTotalDaEntrada: TEdit;
    edtNumeroNota: TEdit;
    edtFuncionario: TEdit;
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
    edtObsrvacao: TEdit;
    Label13: TLabel;
    sbPesquisarProduto: TSpeedButton;
    edtData: TMaskEdit;
    edtHora: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbNovoClick(Sender: TObject);
    procedure sbPesquisarProdutoClick(Sender: TObject);
  private
    { Private declarations }
    FEntityEntradas: iEntradaProdutos;
  public
    { Public declarations }
  end;

var
  formEntradaDeProdutos: TformEntradaDeProdutos;

implementation

{$R *.dfm}

uses Form.Localizar.Produtos.Entrada;

procedure TformEntradaDeProdutos.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin
    edtCodigo.Text := inttostr(FieldByName('ID').AsInteger);
    edtCodigoDoProduto.Text := inttostr(FieldByName('ID_PRODUTO').AsInteger);
    edtProduto.Text := FieldByName('PRODUTO').AsString;
    edtValorPorItens.Text := CurrToStr(FieldByName('VALOR_POR_ITENS')
      .AsCurrency);
    edtQuantidade.Text := inttostr(FieldByName('QUANTIDADE').AsInteger);
    edtTotalDaEntrada.Text := CurrToStr(FieldByName('TOTAL_DA_ENTRADA')
      .AsCurrency);
    edtNumeroNota.Text := FieldByName('NUMERO_NOTA').AsString;
    edtFuncionario.Text := inttostr(FieldByName('FUNCIONARIO').AsInteger);

    edtObsrvacao.Text := FieldByName('OBSERVACAO').AsString;

    if FieldByName('DATA').AsDateTime <> StrToDate('30/12/1899') then
    begin
      edtData.Text := DateToStr(FieldByName('DATA').AsDateTime);
      edtHora.Text := TimeToStr(FieldByName('HORA').AsDateTime);
    end
    else
    begin
      edtData.Clear;
      edtHora.Clear;
    end;

  end;
end;

procedure TformEntradaDeProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityEntradas := TEntityEntradasProdutos.new;
end;

procedure TformEntradaDeProdutos.FormShow(Sender: TObject);
begin
  inherited;
  FEntityEntradas.abrir.listarGrid(DataSource1);
end;

procedure TformEntradaDeProdutos.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityEntradas.inserir;
  edtData.Text := DateToStr(date);
  edtHora.Text := TimeToStr(time);
end;

procedure TformEntradaDeProdutos.sbPesquisarProdutoClick(Sender: TObject);
begin
  inherited;
  formLocalizarProdutosEntradas := TformLocalizarProdutosEntradas.Create(self);
  TFactory.new.criarJanela.formShow(formLocalizarProdutosEntradas, '');
end;

end.
