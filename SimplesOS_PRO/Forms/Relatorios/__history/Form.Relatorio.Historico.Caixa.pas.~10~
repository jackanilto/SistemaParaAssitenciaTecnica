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
  TformRelatorioHistoricoDoCaixa = class(TformModeloRelatorio)
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbExportarClick(Sender: TObject);
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
            .listarGrid(DataSource1);
end;

procedure TformRelatorioHistoricoDoCaixa.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorio.exportar;
end;

end.
