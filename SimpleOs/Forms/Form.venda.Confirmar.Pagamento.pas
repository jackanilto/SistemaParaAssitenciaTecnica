unit Form.venda.Confirmar.Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UFactory;

type
  TFormVendaConfirmarPagamento = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    sbNovo: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbEditar: TSpeedButton;
    sbExcluir: TSpeedButton;
    edtConfirmarTotalDaVenda: TEdit;
    Label1: TLabel;
    edtConfirmarDesconto: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblTotalAPagar: TLabel;
    Label5: TLabel;
    edtConfirmarFormaPagamento: TComboBox;
    Label6: TLabel;
    edtConfirmarValorRecebido: TEdit;
    Label7: TLabel;
    edtConfirmarTroco: TEdit;
    Label8: TLabel;
    edtConfirmarParcela: TEdit;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendaConfirmarPagamento: TFormVendaConfirmarPagamento;

implementation

uses Form.venda;

{$R *.dfm}

procedure TFormVendaConfirmarPagamento.FormCreate(Sender: TObject);
begin
  TFactory.new.ftTable.FD_Table('FORMAS_PAGAMENTO')
    .getCampoTabela('FORMA_PAGAMENTO').popularComponenteComboBox
    (edtConfirmarFormaPagamento);
end;

procedure TFormVendaConfirmarPagamento.FormShow(Sender: TObject);
begin
  edtConfirmarTotalDaVenda.Text := FormatFloat('R$ ###,##0.00', TotalDaVenda);
  edtConfirmarDesconto.Text := FormatFloat('R$ ###,##0.00', 0);
  lblTotalAPagar.Caption := FormatFloat('R$ ###,##0.00', TotalDaVenda);
  edtConfirmarValorRecebido.Text := FormatFloat('R$ ###,##0.00', 0);
  edtConfirmarTroco.Text := FormatFloat('R$ ###,##0.00', 0);
  edtConfirmarParcela.Text := '1';
end;

procedure TFormVendaConfirmarPagamento.Panel1MouseDown(Sender: TObject;
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

procedure TFormVendaConfirmarPagamento.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
