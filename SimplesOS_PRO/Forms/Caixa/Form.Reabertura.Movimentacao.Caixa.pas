unit Form.Reabertura.Movimentacao.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UFactory.Movimentacao, Vcl.Mask;

type
  TformMovimentacaoCaixa = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    PageControl1: TPageControl;
    tsParcelasOS: TTabSheet;
    tsVenda: TTabSheet;
    tsRetiradas: TTabSheet;
    tsContas: TTabSheet;
    tsCaixa: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    sbPesquisarData: TSpeedButton;
    s_OS: TDataSource;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMovimentacaoCaixa: TformMovimentacaoCaixa;

implementation

{$R *.dfm}

procedure TformMovimentacaoCaixa.FormShow(Sender: TObject);
begin
  lblCaption.Caption := Self.Caption;
  TFactoryMovimentacao.new.movimentacaoOS.abrir.listarGrid(s_OS);

end;

procedure TformMovimentacaoCaixa.Panel1MouseDown(Sender: TObject;
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


procedure TformMovimentacaoCaixa.sbFecharClick(Sender: TObject);
begin
  Close;
end;

end.
