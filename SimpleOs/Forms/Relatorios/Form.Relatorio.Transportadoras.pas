unit Form.Relatorio.Transportadoras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Transportadoras;

type
  TEnumPesquisar = (codigo, nome, razao_social, cpf_cnpj, inscricao_estadual);

type
  TformRelatorioTransportadora = class(TformModeloRelatorio)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    var
      FRelatorioTransportadora : iRelatorioTransportadores;
  public
    { Public declarations }
  end;

var
  formRelatorioTransportadora: TformRelatorioTransportadora;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRelatorioTransportadora.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioTransportadora.ordenarGrid(Column);
end;

procedure TformRelatorioTransportadora.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  codigo:
  begin
    FCampo := 'ID';
  end;
  nome:
  begin
    FCampo := 'NOME_FANTASIA';
  end;
  razao_social:
  begin
    FCampo := 'RAZAO_SOCIAL';
  end;
  cpf_cnpj:
  begin
    FCampo := 'CPF_CNPJ';
  end;
  inscricao_estadual:
  begin
    FCampo := 'INSCRICAO_ESTADUAL';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioTransportadora
                            .getCampo(FCampo)
                            .getValor(edtPesquisar.Text)
                            .sqlPesquisa
                            .listarGrid(DataSource1);

end;

procedure TformRelatorioTransportadora.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioTransportadora := TRelatorioTransportadoras.new;
  dllSoftMeter.sendEvent('relatorio transportadora', 'rel transp', 0);
end;

procedure TformRelatorioTransportadora.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioTransportadora
                          .abrir
                          .getCampo('ID')
                          .getValor('0')
                          .sqlPesquisa
                          .listarGrid(DataSource1);
end;

procedure TformRelatorioTransportadora.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioTransportadora.exportar;
end;

procedure TformRelatorioTransportadora.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_transportadora_lista.fr3');
  frxReport1.ShowReport();
end;

end.
