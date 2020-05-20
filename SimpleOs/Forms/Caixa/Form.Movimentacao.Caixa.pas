unit Form.Movimentacao.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids{, UFactory.Movimentacao}, Vcl.Mask,
  UInterfaces, UClasse.Relatorio.Movimentacao.OS,
  UClasse.Relatorio.Movimentacao.Venda, UClasse.Relatorio.Movimentacao.Retiradas,
  UClasse.Relatorio.Movimentacao.Contas, UClasse.Relatorio.Movimentacao.Caixa;

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
    Label1: TLabel;
    lblRecebidosOS: TLabel;
    DBGrid2: TDBGrid;
    s_Venda: TDataSource;
    Label2: TLabel;
    lblRecebidosVendas: TLabel;
    s_Retiradas: TDataSource;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    s_Contas: TDataSource;
    lblRetiradas: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    lblConta: TLabel;
    s_Caixa: TDataSource;
    DBGrid5: TDBGrid;
    Label5: TLabel;
    lblCaixa: TLabel;
    Label6: TLabel;
    lblTotalCaixa: TLabel;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbPesquisarDataClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }

    procedure selecionarRegistros;
    procedure calcularValores;

    var
      FMovimentacaoOS:iRelatorioMovimentacaoOS;
      FMovimentacaoVenda:iRelatorioMovimentacaoVenda;
      FMovimentacaoRetiradas:iRelatorioMovimentacaoRetiradas;
      FMovimentacaoContas:iRelatorioMovimentacaoContas;
      FMovimentacaoCaixa:iRelatorioMovimentacaoCaixa;
  public
    { Public declarations }
  end;

var
  formMovimentacaoCaixa: TformMovimentacaoCaixa;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformMovimentacaoCaixa.calcularValores;
var
  os:Currency;
  venda:Currency;
  retiradas:Currency;
  contas:Currency;
  caixa:currency;
  totalCalculado:Currency;
begin

  lblRecebidosOS.Caption := FormatFloat('R$ #,##0.00', FMovimentacaoOS.retornarTotal);
  lblRecebidosVendas.Caption := FormatFloat('R$ #,##0.00', FMovimentacaoVenda.retornarTotal);
  lblRetiradas.Caption := FormatFloat('-R$ #,##0.00', FMovimentacaoRetiradas.retornarTotal);
  lblConta.Caption := FormatFloat('-R$ #,##0.00', FMovimentacaoContas.retornarTotal);
  lblCaixa.Caption := FormatFloat('R$ #,##0.00', FMovimentacaoCaixa.retornarTotal);

  os:= FMovimentacaoOS.retornarTotal;
  venda:= FMovimentacaoVenda.retornarTotal;
  retiradas:= FMovimentacaoRetiradas.retornarTotal;
  contas:= FMovimentacaoContas.retornarTotal;
  caixa:= FMovimentacaoCaixa.retornarTotal;

  totalCalculado := (os+venda+caixa) - (retiradas+contas);

  lblTotalCaixa.Caption := FormatFloat('R$ #,##0.00', totalCalculado);

end;

procedure TformMovimentacaoCaixa.DBGrid1TitleClick(Column: TColumn);
begin
  FMovimentacaoOS.ordenarGrid(Column);
end;

procedure TformMovimentacaoCaixa.DBGrid2TitleClick(Column: TColumn);
begin
  FMovimentacaoVenda.ordenarGrid(Column);
end;

procedure TformMovimentacaoCaixa.DBGrid3TitleClick(Column: TColumn);
begin
  FMovimentacaoRetiradas.ordenarGrid(Column);
end;

procedure TformMovimentacaoCaixa.DBGrid4TitleClick(Column: TColumn);
begin
  FMovimentacaoContas.ordenarGrid(Column);
end;

procedure TformMovimentacaoCaixa.DBGrid5TitleClick(Column: TColumn);
begin
 FMovimentacaoCaixa.ordenarGrid(Column);
end;

procedure TformMovimentacaoCaixa.FormCreate(Sender: TObject);
begin
  FMovimentacaoOS := TRelatorioMovimentacaoOS.new;
  FMovimentacaoVenda := TRelatorioMovimentacaoVenda.new;
  FMovimentacaoRetiradas := TRelatorioMovimentacaoRetiradas.new;
  FMovimentacaoContas := TRelatorioMovimentacaoContas.new;
  FMovimentacaoCaixa := TRelatorioMovimentacaoCaixa.new;
  dllSoftMeter.sendEvent('movimentacao do caixa', 'movimentacao caixa', 0);
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformMovimentacaoCaixa.FormShow(Sender: TObject);
begin

  lblCaption.Caption := Self.Caption;

  FMovimentacaoOS.selecionarParcelasOrdemData(Date, Date).listarGrid(s_OS);
  FMovimentacaoVenda.selecionarParcelasOrdemData(Date, Date).listarGrid(s_Venda);
  FMovimentacaoRetiradas.selecionarParcelasOrdemData(Date, Date).listarGrid(s_Retiradas);
  FMovimentacaoContas.selecionarParcelasOrdemData(Date, Date).listarGrid(s_Contas);
  FMovimentacaoCaixa.selecionarParcelasOrdemData(Date, Date).listarGrid(s_Caixa);

  calcularValores;

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

procedure TformMovimentacaoCaixa.sbPesquisarDataClick(Sender: TObject);
begin
  selecionarRegistros;
end;

procedure TformMovimentacaoCaixa.selecionarRegistros;
var
  data1, data2:TDate;
begin

  FMovimentacaoOS.validarData(edtData1).validarData(edtData2);

  data1 := StrToDate(edtData1.Text);
  data2 := StrToDate(edtData2.Text);

  FMovimentacaoOS.selecionarParcelasOrdemData(data1, data2).listarGrid(s_OS);
  FMovimentacaoVenda.selecionarParcelasOrdemData(data1, data2).listarGrid(s_Venda);
  FMovimentacaoRetiradas.selecionarParcelasOrdemData(data1, data2).listarGrid(s_Retiradas);
  FMovimentacaoContas.selecionarParcelasOrdemData(data1, data2).listarGrid(s_Contas);
  FMovimentacaoCaixa.selecionarParcelasOrdemData(data1, data2).listarGrid(s_Caixa);


  lblRecebidosOS.Caption := FormatFloat('R$ #,##0.00', FMovimentacaoOS.retornarTotal);
  lblRecebidosVendas.Caption := FormatFloat('R$ #,##0.00', FMovimentacaoVenda.retornarTotal);
  lblRetiradas.Caption := FormatFloat('-R$ #,##0.00', FMovimentacaoRetiradas.retornarTotal);
  lblConta.Caption := FormatFloat('-R$ #,##0.00', FMovimentacaoContas.retornarTotal);

end;

end.
