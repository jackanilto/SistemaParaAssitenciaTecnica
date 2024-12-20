unit Form.Relatorio.Log.Eventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Logs.Eventos, Vcl.Mask;

type
  TEnumPesquisar = (codgio, nome);

type
  TformRelatorioLogEventos = class(TformModeloRelatorio)
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Label1: TLabel;
    sbPesquisarData: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDataClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sbExportarClick(Sender: TObject);  private
    { Private declarations }
    var
      FRelatorioLog: iRelatorioLogEventos;
  public
    { Public declarations }
  end;

var
  formRelatorioLogEventos: TformRelatorioLogEventos;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioLogEventos.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioLog.ordenarGrid(Column);
  DataSource1.DataSet.First;
end;

procedure TformRelatorioLogEventos.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:String;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    codgio:
    begin
      FCampo := 'ID_FUNCIONARIO';
    end;
    nome:
    begin
      FCampo := 'NOME_FUNCIONARIO';
    end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioLog
                .getCampo(FCampo)
                .getValor(edtPesquisar.Text)
                .sqlPesquisa
                .listarGrid(DataSource1);

end;

procedure TformRelatorioLogEventos.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioLog := TRelatorioLogEventos.new;
  dllSoftMeter.sendEvent('relatorio log dos eventos', 'rel log eventos', 0);
end;

procedure TformRelatorioLogEventos.FormShow(Sender: TObject);
begin
  inherited;

  FRelatorioLog
              .abrir
              .getCampo('ID')
              .getValor('0')
              .sqlPesquisa
              .listarGrid(DataSource1);

end;

procedure TformRelatorioLogEventos.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioLog.exportar;
end;

procedure TformRelatorioLogEventos.sbPesquisarDataClick(Sender: TObject);
begin
  inherited;

  FRelatorioLog
               .validarData(edtData1)
               .validarData(edtData2);

  FRelatorioLog
              .getCampo('DATA')
              .getDataInicial(StrToDate(edtData1.Text))
              .getDataFinal(StrToDate(edtData2.Text))
              .sqlPesquisaData
              .listarGrid(DataSource1);

end;

end.
