unit Form.Relatorio.Retirada.Valores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Retirada.Valores, Vcl.Mask;

type
  TEnumPesquisar = (codigo, cod_motivo, motivo, cod_funcionario);

type
  TformRelatorioRetiradaDeValores = class(TformModeloRelatorio)
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    var
      FRelatorio:iRelatorioRetiradaDeValores;
  public
    { Public declarations }
  end;

var
  formRelatorioRetiradaDeValores: TformRelatorioRetiradaDeValores;

implementation

{$R *.dfm}

procedure TformRelatorioRetiradaDeValores.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:String;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  codigo:
  begin
    FCampo := 'ID';
  end;
  cod_motivo:
  begin
    FCampo := 'ID_MOTIVO';
  end;
  motivo:
  begin
    FCampo := 'MOTIVO';
  end;
  cod_funcionario:
  begin
    FCampo := 'FUNCIONARIO';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorio
              .getCampo(FCampo)
              .getValor(edtPesquisar.Text)
              .sqlPesquisa
              .listarGrid(DataSource1);

end;

procedure TformRelatorioRetiradaDeValores.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorio := TRelatorioRetiradaValores.new;
end;

procedure TformRelatorioRetiradaDeValores.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorio
            .abrir
            .getCampo('ID')
            .getValor('0')
            .sqlPesquisa
            .listarGrid(DataSource1);
end;

procedure TformRelatorioRetiradaDeValores.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorio.exportar;
end;

procedure TformRelatorioRetiradaDeValores.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_retirada_valores_lista.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioRetiradaDeValores.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  FRelatorio
            .validarData(edtData1)
            .validarData(edtData2);


  FRelatorio
            .getCampo('DATA')
            .getDataInicial(StrToDate(edtData1.Text))
            .getDataFinal(StrToDate(edtData2.Text))
            .sqlPesquisaData
            .listarGrid(DataSource1);

end;

end.
