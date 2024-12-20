unit Form.Relatorio.OS.Inadimplentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.OS.Inadimplentes, Vcl.Mask;

type
  TEnumPesquisar = (parcela, os, cod_cliente, nome_cliente);

type
  TformRelatorioOSInadimplentes = class(TformModeloRelatorio)
    Label1: TLabel;
    sbPesquisarDatas: TSpeedButton;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sbImprimirClick(Sender: TObject);  private
    { Private declarations }
    var
      FRelatorioInadimplentes:iRelatorioOSInadimpelentes;
  public
    { Public declarations }
  end;

var
  formRelatorioOSInadimplentes: TformRelatorioOSInadimplentes;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioOSInadimplentes.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioInadimplentes.ordenarGrid(Column);
end;

procedure TformRelatorioOSInadimplentes.edtPesquisarKeyUp(Sender: TObject;
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
  nome_cliente:
  begin
    FCampo := 'CLIENTE';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioInadimplentes
                          .getCampo(FCampo)
                          .retornarPesquisaInadimplentes(edtPesquisar.Text)
                          .listarGrid(DataSource1);

end;

procedure TformRelatorioOSInadimplentes.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioInadimplentes := TRelatorioOSInadimplentes.new;
  dllSoftMeter.sendEvent('relatorio OS inadimplentes', 'rel os inadimplentes', 0);
end;

procedure TformRelatorioOSInadimplentes.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioInadimplentes
                    .abrir
                    .getCampo('ID_PARCELA')
                    .retornarPesquisaInadimplentes('0')
                    .listarGrid(DataSource1);
end;

procedure TformRelatorioOSInadimplentes.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioInadimplentes.exportar;
end;

procedure TformRelatorioOSInadimplentes.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_clientes_inadimplentes_os.fr3');
  frxReport1.ShowReport();
end;

procedure TformRelatorioOSInadimplentes.sbPesquisarDatasClick(Sender: TObject);
begin
  inherited;

  FRelatorioInadimplentes
                        .validarData(edtData1)
                        .validarData(edtData2);

  FRelatorioInadimplentes
                        .retornarPesquisaInadimplentes(edtData1.Text, edtData2.Text)
                        .listarGrid(DataSource1);

end;

end.
