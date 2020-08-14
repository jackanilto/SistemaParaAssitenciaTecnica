unit Form.Relatorio.Parcelas.Pagas.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Parcelas.Pagas.OS, Vcl.Mask;

type
  TEnumPesquisar = (parcela, os, cod_cliente, cliente);

type
  TEnumPesquisarData = (vencimento, pagamento);

type
  TformRelatorioParcelasPagasOS = class(TformModeloRelatorio)
    Label1: TLabel;
    sbPesquisarDatas: TSpeedButton;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cbPesquisarData: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);  private
    { Private declarations }
    var
      FParcelasPagas:iRelatorioParcelasPagasOS;

  public
    { Public declarations }
  end;

var
  formRelatorioParcelasPagasOS: TformRelatorioParcelasPagasOS;

implementation

{$R *.dfm}

procedure TformRelatorioParcelasPagasOS.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  parcela:
  begin
    FCampo := 'ID_PARCELA';
  end;
  os:
  begin
    FCampo := 'ID_ORDEM';
  end;
  cod_cliente:
  begin
    FCampo := 'ID_CLIENTE';
  end;
  cliente:
  begin
    FCampo := 'CLIENTE';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FParcelasPagas
      .getCampo(FCampo)
      .getValor(edtPesquisar.Text)
      .sqlPesquisa
      .listarGrid(DataSource1);


end;

procedure TformRelatorioParcelasPagasOS.FormCreate(Sender: TObject);
begin
  inherited;
  FParcelasPagas := TEntityRelatorioParcelasPagasOS.new;
end;

procedure TformRelatorioParcelasPagasOS.FormShow(Sender: TObject);
begin
  inherited;
    FParcelasPagas.abrir.listarGrid(DataSource1);
end;

procedure TformRelatorioParcelasPagasOS.sbExportarClick(Sender: TObject);
begin
  inherited;
  FParcelasPagas.exportar;
end;

procedure TformRelatorioParcelasPagasOS.sbPesquisarDatasClick(Sender: TObject);
var
  FCampo:string;
begin
  inherited;

  FParcelasPagas.validarData(edtData1).validarData(edtData2);

  case TEnumPesquisarData(cbPesquisarData.ItemIndex) of
    vencimento:
    begin
      FCampo := 'DATA_VENCIMENTO';
    end;
    pagamento:
    begin
      FCampo := 'DATA_PAGAMENTO';
    end;
  end;

  FParcelasPagas
                .getCampo(FCampo)
                .getDataInicial(StrToDate(edtData1.Text))
                .getDataFinal(StrToDate(edtData2.Text))
                .sqlPesquisaData
                .listarGrid(DataSource1);

end;

end.
