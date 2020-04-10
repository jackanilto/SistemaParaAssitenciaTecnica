unit UCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, UFactory;

type
  TfrmCalculadoraMargemLucro = class(TForm)
    edtValorRS: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtValorPorcento: TEdit;
    sbAplicarAlteracoes: TSpeedButton;
    Label3: TLabel;
    edtPrecoVenda: TEdit;
    edtPrecoCusto: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbAplicarAlteracoesClick(Sender: TObject);
  private
    { Private declarations }
    FPrecoCusto: Currency;
    FValorProcento: Real;
    FValorDeVenda: Real;
  public
    { Public declarations }
  end;

var
  frmCalculadoraMargemLucro: TfrmCalculadoraMargemLucro;

implementation

{$R *.dfm}

uses Form.Cadastro.Produtos;

procedure TfrmCalculadoraMargemLucro.FormShow(Sender: TObject);
begin

  FPrecoCusto := StrToCurr(formCadastroProdutos.edtValorDeCusto.Text);
  edtPrecoCusto.Text := formatFloat('R$ ###,##0.00', FPrecoCusto);

end;

procedure TfrmCalculadoraMargemLucro.sbAplicarAlteracoesClick(Sender: TObject);
begin

  formCadastroProdutos.edtMargemDeLucro.Text := FloatToStr(FValorProcento);
  formCadastroProdutos.edtValorDeVenda.Text := CurrToStr(FValorDeVenda);
  formCadastroProdutos.edtQuantidadeMinima.Text;
  close;

end;

procedure TfrmCalculadoraMargemLucro.SpeedButton1Click(Sender: TObject);
begin

  FValorProcento := TFactory.new.calcularJuros.percentualDeDesconto(FPrecoCusto,
    StrToFloat(edtValorRS.Text));

  edtValorPorcento.Text := formatFloat('0.00', FValorProcento);

  FValorDeVenda := StrToFloat(edtValorRS.Text) + FPrecoCusto;

  edtPrecoVenda.Text := formatFloat('R$ ###,##0.00', FValorDeVenda);

end;

end.
