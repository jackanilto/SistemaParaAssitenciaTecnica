unit Form.Cadastro.Servicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UClasse.Entity.Cadastro.Servicos, UInterfaces, frxClass,
  frxDBSet, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TEnumPesquisar = (codigo, servico);

type
  TformCadastroDeServicos = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtServico: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    frxDB_CadastroServicos: TfrxDBDataset;
    frx_Servicos: TfrxReport;
    edtValor: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FEntityCadastroServico: iCadastroServico;
  public
    { Public declarations }
  end;

var
  formCadastroDeServicos: TformCadastroDeServicos;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformCadastroDeServicos.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin
    edtCodigo.Text := inttostr(FieldByName('ID').AsInteger);
    edtServico.Text := FieldByName('SERVICO').AsString;
    edtValor.Text := CurrToStr(FieldByName('VALOR').AsCurrency);
    edtDescricao.Text := FieldByName('DESCRICAO').AsString;
  end;
end;

procedure TformCadastroDeServicos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;
  end
  else
  begin
    sbEditar.Enabled := false;
    sbExcluir.Enabled := false;
  end;

end;

procedure TformCadastroDeServicos.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityCadastroServico.ordenarGrid(Column);
end;

procedure TformCadastroDeServicos.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Campo: string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    codigo:
      begin
        Campo := 'ID';
      end;
    servico:
      begin
        Campo := 'SERVICO';
      end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FEntityCadastroServico.getCampo(Campo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1);

  { C�digo
    Servi�o }
end;

procedure TformCadastroDeServicos.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityCadastroServico := TEntityCadastroServicos.new;
  dllSoftMeter.sendEvent('cadastros de servicos', 'cadastro servicos', 0);
end;

procedure TformCadastroDeServicos.FormShow(Sender: TObject);
begin
  inherited;
  FEntityCadastroServico.abrir.listarGrid(DataSource1);
end;

procedure TformCadastroDeServicos.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityCadastroServico.cancelar;
end;

procedure TformCadastroDeServicos.sbEditarClick(Sender: TObject);
begin
  FEntityCadastroServico.editar;
  inherited;
  edtServico.SetFocus;
end;

procedure TformCadastroDeServicos.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityCadastroServico.deletar;
end;

procedure TformCadastroDeServicos.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntityCadastroServico.exportar;
end;

procedure TformCadastroDeServicos.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frx_Servicos.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/relatorio_servicos_cadastrados.fr3');
  frx_Servicos.ShowReport();
end;

procedure TformCadastroDeServicos.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityCadastroServico.inserir;
  edtServico.SetFocus;
end;

procedure TformCadastroDeServicos.sbSalvarClick(Sender: TObject);
begin

  FEntityCadastroServico.getSERVICO(edtServico.Text)
    .getVALORSERVICO(edtValor.Text).getDescricao(edtDescricao.Text).gravar;

  inherited;

end;

end.
