unit Form.Relatorio.OS.Estornadas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.OS.Estornadas, Vcl.Mask;

type
  TEnumPesquisar = (os, cod_cliente, cliente);

type
  TformOSEstornadas = class(TformModeloRelatorio)
    Label1: TLabel;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    sbPesquisarDatas: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);  private
    { Private declarations }
    var
      FRelatorioEstornos:iRelatorioOSEstornadas;
  public
    { Public declarations }
  end;

var
  formOSEstornadas: TformOSEstornadas;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformOSEstornadas.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioEstornos.ordenarGrid(Column);
end;

procedure TformOSEstornadas.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
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
    FCampo := 'NOME_CLIENTE';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioEstornos
                      .getCampo(FCampo)
                      .getValor(edtPesquisar.Text)
                      .sqlPesquisa
                      .listarGrid(DataSource1);

end;

procedure TformOSEstornadas.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioEstornos := TRelatorioOSEstornadas.new;
  dllSoftMeter.sendEvent('relatorio OS estornadas', 'rel os estornadas', 0);
end;

procedure TformOSEstornadas.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioEstornos
                .abrir
                .getCampo('ID_ESTORNO')
                .getValor('0')
                .sqlPesquisa
                .listarGrid(DataSource1);
end;

procedure TformOSEstornadas.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioEstornos.exportar;
end;

procedure TformOSEstornadas.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_os_estornadas.fr3');
  frxReport1.ShowReport();
end;

procedure TformOSEstornadas.sbPesquisarDatasClick(Sender: TObject);
begin
  inherited;

  FRelatorioEstornos
                    .validarData(edtData1)
                    .validarData(edtData2);


  FRelatorioEstornos
                    .getCampo('DATA')
                    .getDataInicial(StrToDate(edtData1.Text))
                    .getDataFinal(StrToDate(edtData2.Text))
                    .sqlPesquisaData
                    .listarGrid(DataSource1);

end;

end.
