unit Form.Relatorio.Contas.A.Receber.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UClasse.Relatorio.Contas.A.Receber, UInterfaces, Vcl.Mask;

type
  TEnumPesquisar = (parcela, OS, cod_cliente, nome_cliente);

type
  TformRelatorioContasAReceberOS = class(TformModeloRelatorio)
    Bevel1: TBevel;
    Bevel2: TBevel;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Label1: TLabel;
    sbPesquisarDatas: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbPesquisarChange(Sender: TObject);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  var
    FContasAReceberOS: iRelatorioContasAReceber;
  public
    { Public declarations }
  end;

var
  formRelatorioContasAReceberOS: TformRelatorioContasAReceberOS;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioContasAReceberOS.cbPesquisarChange(Sender: TObject);
begin
  inherited;
  edtPesquisar.SetFocus;
end;

procedure TformRelatorioContasAReceberOS.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((DataSource1.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime < date)
      and (DataSource1.DataSet.FieldByName('PGTO').AsString = 'Nao')) then
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

procedure TformRelatorioContasAReceberOS.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FContasAReceberOS.ordenarGrid(Column);
end;

procedure TformRelatorioContasAReceberOS.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
  FCampo:String;
begin
  inherited;
  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    parcela:
      begin
        FCampo:='ID_PARCELA';
      end;
    OS:
      begin
        FCampo:='ID_ORDEM';
      end;
    cod_cliente:
      begin
        FCampo:='ID_CLIENTE';
      end;
    nome_cliente:
      begin
       FCampo:='CLIENTE';
      end;

  end;

  if edtPesquisar.Text <> EmptyStr then
    FContasAReceberOS
      .getCampo(FCampo)
      .getValor(edtPesquisar.Text)
      .sqlPesquisa
      .listarGrid(DataSource1);

end;

procedure TformRelatorioContasAReceberOS.FormCreate(Sender: TObject);
begin
  inherited;
  FContasAReceberOS := TEntityRelatorioContasAReceber.new;
  dllSoftMeter.sendEvent('relatorio de contas a receber OS', 'relatorio contas a receber os', 0);
end;

procedure TformRelatorioContasAReceberOS.FormShow(Sender: TObject);
begin
  inherited;
  FContasAReceberOS
      .abrir.getCampo('ID_PARCELA')
      .getValor('0')
      .sqlPesquisa
      .listarGrid(DataSource1);
end;

procedure TformRelatorioContasAReceberOS.sbExportarClick(Sender: TObject);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
     FContasAReceberOS.exportar;
end;

procedure TformRelatorioContasAReceberOS.sbImprimirClick(Sender: TObject);
begin
  inherited;
    frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
      'relatórios/contas_receber_os.fr3');
    frxReport1.ShowReport();
end;

procedure TformRelatorioContasAReceberOS.sbPesquisarDatasClick(Sender: TObject);
begin
  inherited;

  FContasAReceberOS.validarData(edtData1);
  FContasAReceberOS.validarData(edtData2);

  FContasAReceberOS
    .getCampo('DATA_VENCIMENTO')
    .getDataInicial(StrToDate(edtData1.Text))
    .getDataFinal(StrToDate(edtData2.Text))
    .sqlPesquisaData
    .listarGrid(DataSource1);


end;

end.
