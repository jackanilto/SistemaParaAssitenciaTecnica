unit Form.Relatorio.Historico.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Historico.Caixa, Vcl.Mask;

type
  TEnumPesquisar = (abertura, fechamento);

type
  TEnumpesquisarData = (data_abertura, data_encerramento);

type
  TformRelatorioHistoricoDoCaixa = class(TformModeloRelatorio)
    cbPesquisarData: TComboBox;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    sbPesquisarData: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbExportarClick(Sender: TObject);
    procedure sbPesquisarDataClick(Sender: TObject);
  private
    { Private declarations }
    var
      FRelatorio:iRelatorioHistoricoCaixa;
  public
    { Public declarations }
  end;

var
  formRelatorioHistoricoDoCaixa: TformRelatorioHistoricoDoCaixa;

implementation

{$R *.dfm}

procedure TformRelatorioHistoricoDoCaixa.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:String;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  abertura:
  begin
    FCampo := 'NOME_FUNCIONARIO_ABERTURA';
  end;
  fechamento:
  begin
    FCampo := 'NOME_FUNCIONARIO_ENCERRAMENTO';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorio
              .getCampo(FCampo)
              .getValor(edtPesquisar.Text)
              .sqlPesquisa
              .listarGrid(DataSource1);

end;

procedure TformRelatorioHistoricoDoCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorio := TRelatrioHistoricoCaixa.new;
end;

procedure TformRelatorioHistoricoDoCaixa.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorio
            .abrir
            .getCampo('ID')
            .getValor('0')
            .sqlPesquisa
            .listarGrid(DataSource1);
end;

procedure TformRelatorioHistoricoDoCaixa.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorio.exportar;
end;

procedure TformRelatorioHistoricoDoCaixa.sbPesquisarDataClick(Sender: TObject);
var
  FCampo:string;
begin
  inherited;


  case TEnumpesquisarData(cbPesquisarData.ItemIndex) of
  data_abertura:
  begin
    FCampo := 'DATA_ABERTURA';
  end;
  data_encerramento:
  begin
    FCampo := 'DATA_ENCERRAMENTO';
  end;

  end;

  FRelatorio
            .validarData(edtData1)
            .validarData(edtData2);

  FRelatorio
            .getCampo(FCampo)
            .getDataInicial(StrToDate(edtData1.Text))
            .getDataFinal(StrToDate(edtData2.Text))
            .sqlPesquisaData
            .listarGrid(DataSource1);

end;

end.
