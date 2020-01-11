unit Form.Quitar.Parcela.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, UInterfaces,
  UClasse.Entity.Quitar.Parcelas.Vendas, Vcl.DBCtrls, Vcl.Mask, UFactory;

type
  TEnumPesquisar = (Parcela, Venda, codigo_cliente);

type
  TformQuitarParcelasVendas = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    sbNovo: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbEditar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    edtTotalDeParcelas: TEdit;
    Label1: TLabel;
    edtParcelaSelecionada: TEdit;
    Label2: TLabel;
    edtValorDaParcela: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    edtJuros: TEdit;
    Label7: TLabel;
    edtMulta: TEdit;
    Label8: TLabel;
    edtDesconto: TEdit;
    Label9: TLabel;
    edtTotalAPagar: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtPago: TEdit;
    Label13: TLabel;
    DBNavigator1: TDBNavigator;
    edtDataDeVencimento: TMaskEdit;
    edtFormaDePagamento: TComboBox;
    edtDataDePagamento: TMaskEdit;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  var
    FentityVisulizarParcelasVenda: iQuitarParcelasVenda;
  public
    { Public declarations }
  end;

var
  formQuitarParcelasVendas: TformQuitarParcelasVendas;

implementation

{$R *.dfm}

procedure TformQuitarParcelasVendas.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  with DataSource1.DataSet do
  begin
    edtTotalDeParcelas.Text := IntToStr(FieldByName('QUANTIDADE_PARCELAS')
      .AsInteger);
    edtParcelaSelecionada.Text := IntToStr(FieldByName('PARCELA').AsInteger);
    edtValorDaParcela.Text := CurrToStr(FieldByName('VALOR_DA_PARCELA')
      .AsCurrency);
    edtDataDeVencimento.Text := DateToStr(FieldByName('DATA_VENCIMENTO')
      .AsDateTime);
    edtJuros.Text := FloatToStr(FieldByName('JUROS').AsFloat);
    edtMulta.Text := CurrToStr(FieldByName('MULTA').AsCurrency);
    edtDesconto.Text := CurrToStr(FieldByName('DESCONTO').AsCurrency);
    edtTotalAPagar.Text := CurrToStr(FieldByName('TOTAL').AsCurrency);
    edtFormaDePagamento.Text := FieldByName('forma_pagamento').AsString;
    edtPago.Text := FieldByName('PAGO').AsString;

    if DataSource1.DataSet.FieldByName('DATA_PAGAMENTO').AsDateTime <>
      StrToDate('30/12/1899') then
      edtDataDePagamento.Text :=
        DateToStr(FieldByName('DATA_PAGAMENTO').AsDateTime);

  end;
end;

procedure TformQuitarParcelasVendas.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FCampo: string;
begin

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    Parcela:
      begin
        FCampo := 'ID_PARCELA';
      end;
    Venda:
      begin
        FCampo := 'ID_VENDA';
      end;
    codigo_cliente:
      begin
        FCampo := 'ID_CLIENTE';
      end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FentityVisulizarParcelasVenda.getCampo(FCampo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1);

end;

procedure TformQuitarParcelasVendas.FormCreate(Sender: TObject);
begin
  FentityVisulizarParcelasVenda := TEntityQuitarParcelaVenda.new;
end;

procedure TformQuitarParcelasVendas.FormShow(Sender: TObject);
begin

  FentityVisulizarParcelasVenda.abrir.listarGrid(DataSource1);
  TFactory.new.ftTable.FD_Table('FORMAS_PAGAMENTO')
    .getCampoTabela('FORMA_PAGAMENTO').popularComponenteComboBox
    (edtFormaDePagamento);

  cbPesquisar.ItemIndex := 0;

end;

procedure TformQuitarParcelasVendas.Panel1MouseDown(Sender: TObject;
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

procedure TformQuitarParcelasVendas.sbFecharClick(Sender: TObject);
begin
  Close;
end;

end.
