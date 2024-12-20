unit Form.Relatorio.Problemas.Frequentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Problemas.Frequentes;

type
  TEnumPesquisar = (codgio, nome_peca, numero_serie, marca, defeito);

type
  TformRelatorioProblemasFrequentes = class(TformModeloRelatorio)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbExportarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    var
      FRelatorio:iRelatorioProblemasFrequentes;
  public
    { Public declarations }
  end;

var
  formRelatorioProblemasFrequentes: TformRelatorioProblemasFrequentes;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioProblemasFrequentes.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorio.ordenarGrid(Column);
end;

procedure TformRelatorioProblemasFrequentes.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:String;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  codgio:
  begin
    FCampo := 'ID';
  end;
  nome_peca:
  begin
    FCampo := 'NOME_PECA';
  end;
  numero_serie:
  begin
    FCampo := 'NUMERO_SERIE';
  end;
  marca:
  begin
    FCampo := 'MARCA';
  end;
  defeito:
  begin
    FCampo := 'DEFEITO';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorio
              .getCampo(FCampo)
              .getValor(edtPesquisar.Text)
              .sqlPesquisa
              .listarGrid(DataSource1);


end;

procedure TformRelatorioProblemasFrequentes.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorio := TRelatorioProblemasFrequentes.new;
  dllSoftMeter.sendEvent('relatorio de problemas frequentes', 'rel prob frequentes', 0);
end;

procedure TformRelatorioProblemasFrequentes.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorio
            .abrir
            .getCampo('ID')
            .getValor('0')
            .sqlPesquisa
            .listarGrid(DataSource1);
end;

procedure TformRelatorioProblemasFrequentes.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorio.exportar;
end;

end.
