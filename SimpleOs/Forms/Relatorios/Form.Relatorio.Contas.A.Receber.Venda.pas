unit Form.Relatorio.Contas.A.Receber.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Contas.Receber.Venda, Vcl.Mask;

type
  TEnumPesquisar = (Parcela, venda, Cod_Cliente, Cliente);

type
  TformRelatorioContasAReceberVenda = class(TformModeloRelatorio)
    Label1: TLabel;
    sbPesquisarDatas: TSpeedButton;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    var
       FContasAReceberVenda:iRelatorioContasAReceberVendas;
  public
    { Public declarations }
  end;

var
  formRelatorioContasAReceberVenda: TformRelatorioContasAReceberVenda;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioContasAReceberVenda.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ((DataSource1.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime < date)
      and (DataSource1.DataSet.FieldByName('PAGO').AsString = 'Nao')) then
  begin
    DBGrid1.Canvas.Brush.Color := $003C60DD;
    DBGrid1.Canvas.Font.Color := clwhite
  end
  else
  begin
    DBGrid1.Canvas.Brush.Color := $0053C124;
    DBGrid1.Canvas.Font.Color := clwhite
  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TformRelatorioContasAReceberVenda.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
   FContasAReceberVenda.ordenarGrid(Column);
end;

procedure TformRelatorioContasAReceberVenda.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  Parcela:
  begin
    FCampo := 'ID_PARCELA';
  end;
  venda:
  begin
    FCampo := 'ID_VENDA';
  end;
  Cod_Cliente:
  begin
    FCampo := 'ID_CLIENTE';
  end;
  Cliente:
  begin
    FCampo := 'CLIENTE';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FContasAReceberVenda
        .getCampo(FCampo)
        .getValor(edtPesquisar.Text)
        .sqlPesquisa
        .listarGrid(DataSource1);

end;

procedure TformRelatorioContasAReceberVenda.FormCreate(Sender: TObject);
begin
  inherited;
  FContasAReceberVenda := TEntityRelatorioContasAReceberVenda.new;
  dllSoftMeter.sendEvent('relatorio de contas a receber venda', 'relatorio contas a receber venda', 0);
end;

procedure TformRelatorioContasAReceberVenda.FormShow(Sender: TObject);
begin
  inherited;
  FContasAReceberVenda
                    .abrir
                    .getCampo('ID_PARCELA')
                    .getValor('0')
                    .sqlPesquisa
                    .listarGrid(DataSource1);
end;

procedure TformRelatorioContasAReceberVenda.sbExportarClick(Sender: TObject);
begin
  inherited;
  FContasAReceberVenda.exportar;
end;

procedure TformRelatorioContasAReceberVenda.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/contas_receber_venda.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioContasAReceberVenda.sbPesquisarDatasClick(
  Sender: TObject);
begin
  inherited;

  FContasAReceberVenda.validarData(edtData1).validarData(edtData2);

  FContasAReceberVenda
      .getCampo('DATA_VENCIMENTO')
      .getDataInicial(StrToDate(edtData1.Text))
      .getDataFinal(StrToDate(edtData2.Text))
      .sqlPesquisaData
      .listarGrid(DataSource1);

end;

end.
