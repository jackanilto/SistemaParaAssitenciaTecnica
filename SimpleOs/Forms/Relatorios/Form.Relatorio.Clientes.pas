unit Form.Relatorio.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UClasse.Relatorio.Clientes, UInterfaces, Vcl.Mask;

Type
  TEnumPesquisar = (codigo, nome, cpf_cnpj, tipo_cadatro);

type
  TformRelatorioClientes = class(TformModeloRelatorio)
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Label1: TLabel;
    sbPesquisar: TSpeedButton;
    frxDB_RelatorioClientes: TfrxDBDataset;
    frx_RelatorioClientes: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbPesquisarChange(Sender: TObject);
    procedure sbPesquisarClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  var
    FEntityRelatorioClientes: iRelatorioClientes;
  public
    { Public declarations }
  end;

var
  formRelatorioClientes: TformRelatorioClientes;

implementation

{$R *.dfm}

procedure TformRelatorioClientes.cbPesquisarChange(Sender: TObject);
begin
  inherited;
  edtPesquisar.SetFocus;
end;

procedure TformRelatorioClientes.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityRelatorioClientes.ordenarGrid(Column);
end;

procedure TformRelatorioClientes.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FCampo: String;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    codigo:
      begin
        FCampo := 'ID';
      end;
    nome:
      begin
        FCampo := 'NOME';
      end;
    cpf_cnpj:
      begin
        FCampo := 'CPF_CNPJ';
      end;
    tipo_cadatro:
      begin
        FCampo := 'TIPO_CADASTRO';
      end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FEntityRelatorioClientes.getCampo(FCampo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1);

end;

procedure TformRelatorioClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityRelatorioClientes := TEntityModeloRelatorio.new;
end;

procedure TformRelatorioClientes.FormShow(Sender: TObject);
begin
  inherited;
  FEntityRelatorioClientes.abrir.getCampo('ID').getValor('0')
    .sqlPesquisa.listarGrid(DataSource1);
end;

procedure TformRelatorioClientes.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntityRelatorioClientes.exportar;
end;

procedure TformRelatorioClientes.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frx_RelatorioClientes.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_clientes_lista.fr3');
  frx_RelatorioClientes.ShowReport();
end;

procedure TformRelatorioClientes.sbPesquisarClick(Sender: TObject);
begin
  inherited;

  FEntityRelatorioClientes.validarData(edtData1);
  FEntityRelatorioClientes.validarData(edtData2);

  FEntityRelatorioClientes.getCampo('DATA_CADASTRO')
    .getDataInicial(StrToDate(edtData1.Text))
    .getDataFinal(StrToDate(edtData2.Text)).sqlPesquisaData.listarGrid
    (DataSource1);

end;

end.
