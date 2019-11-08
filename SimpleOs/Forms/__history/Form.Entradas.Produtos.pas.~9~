unit Form.Entradas.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Entradas.Produtos, Vcl.Mask;

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

procedure TformEntradaDeProdutos.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin
    edtCodigo.Text := inttostr(FieldByName('ID').AsInteger);
    edtCodigoDoProduto.Text := inttostr(FieldByName('').AsInteger);
    edtProduto.Text := FieldByName('').AsString;
    edtValorPorItens.Text := CurrToStr(FieldByName().AsCurrency);
    edtQuantidade.Text := inttostr(FieldByName('').AsInteger);
    edtTotalDaEntrada.Text := CurrToStr(FieldByName('').AsCurrency);
    edtNumeroNota.Text := FieldByName('').AsString;
    edtFuncionario.Text := inttostr(FieldByName('').AsInteger);

    edtObsrvacao.Text := FieldByName('').AsString;

    edtData.Text := DateToStr(FieldByName('').AsDateTime);
    edtHora.Text := TimeToStr(FieldByName('').AsDateTime);

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

end.
