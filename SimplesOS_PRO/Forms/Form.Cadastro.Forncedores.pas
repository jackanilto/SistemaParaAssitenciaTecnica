unit Form.Cadastro.Forncedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Forncedores, Vcl.Mask,
  UClasse.Entity.Table, ACBrBase, ACBrSocket, ACBrCEP, UFactory, frxClass,
  frxDBSet;

type
  TformCadastroFornecedores = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtNomeFantasia: TEdit;
    edtRazaoSocial: TEdit;
    edtCPFCNPJ: TEdit;
    edtInscricaoEstadual: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtComplemento: TEdit;
    edtNumero: TEdit;
    edtCEP: TEdit;
    edtCidade: TEdit;
    edtEmail: TEdit;
    edtResponsavel: TEdit;
    edtFuncionario: TEdit;
    edtObservacao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblCPFCNPJ: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    edtUF: TComboBox;
    sbPesquisarCep: TSpeedButton;
    ACBrCEP1: TACBrCEP;
    frxDB_Fornecedores: TfrxDBDataset;
    frx_Fornecedores: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbSalvarClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure sbPesquisarCepClick(Sender: TObject);
    procedure edtCPFCNPJExit(Sender: TObject);
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
    FEntityForncedores: iCadastroFornecedores;
    FEntityTableUF: iFDTable;
  public
    { Public declarations }
  end;

var
  formCadastroFornecedores: TformCadastroFornecedores;

implementation

uses
  FireDAC.Comp.Client, softMeter_globalVar;

{$R *.dfm}

procedure TformCadastroFornecedores.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
  i: integer;
begin
  inherited;

  for i := 0 to ACBrCEP1.Enderecos.Count - 1 do
  begiN
    edtCEP.Text := ACBrCEP1.Enderecos[i].CEP;
    edtEndereco.Text := 'Rua ' + ACBrCEP1.Enderecos[i].Logradouro;
    edtComplemento.Text := ACBrCEP1.Enderecos[i].Complemento;
    edtCidade.Text := ACBrCEP1.Enderecos[i].Municipio;
    edtUF.Text := ACBrCEP1.Enderecos[i].UF;
    edtBairro.Text := ACBrCEP1.Enderecos[i].Bairro;
  end;

end;

procedure TformCadastroFornecedores.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin

    edtCodigo.Text := IntToStr(FieldByName('ID').AsInteger);
    edtNomeFantasia.Text := FieldByName('NOME_FANTASIA').AsString;
    edtRazaoSocial.Text := FieldByName('RAZAO_SOCIAL').AsString;
    edtCPFCNPJ.Text := FieldByName('CPF_CNPJ').AsString;
    edtInscricaoEstadual.Text := FieldByName('INSCRICAO_ESTADUAL').AsString;
    edtEndereco.Text := FieldByName('ENDERECO').AsString;
    edtBairro.Text := FieldByName('BAIRRO').AsString;
    edtNumero.Text := IntToStr(FieldByName('NUMERO').AsInteger);
    edtComplemento.Text := FieldByName('COMPLEMENTO').AsString;
    edtCEP.Text := FieldByName('CEP').AsString;
    edtCidade.Text := FieldByName('CIDADE').AsString;
    edtUF.Text := FieldByName('UF').AsString;
    edtTelefone.Text := FieldByName('TELEFONE').AsString;
    edtCelular.Text := FieldByName('CELULAR').AsString;
    edtEmail.Text := FieldByName('EMAIL').AsString;
    edtResponsavel.Text := FieldByName('RESPONSAVEL').AsString;
    edtFuncionario.Text := IntToStr(FieldByName('FUINCIONARIO_CADASTRO')
      .AsInteger);
    edtObservacao.Text := FieldByName('OBSERVACAO').AsString;

  end;
end;

procedure TformCadastroFornecedores.DBGrid1CellClick(Column: TColumn);
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

procedure TformCadastroFornecedores.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityForncedores.ordenarGrid(Column);
end;

procedure TformCadastroFornecedores.edtCPFCNPJExit(Sender: TObject);
begin
  inherited;
  if tfactory.new.validarDocumento.getDocumento(edtCPFCNPJ.Text) = false then
  begin
    lblCPFCNPJ.Caption := 'CPF ou CNPJ inv�lido';
    lblCPFCNPJ.Font.Color := clred;
  end
  else
  begin
    lblCPFCNPJ.Caption := 'CPF ou CNPJ';
    lblCPFCNPJ.Font.Color := clWindowText;
  end;

end;

procedure TformCadastroFornecedores.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  campo: string;
begin
  inherited;

  if cbPesquisar.Text = 'C�digo' then
    campo := 'ID'
  else if cbPesquisar.Text = 'Nome fantasia' then
    campo := 'NOME_FANTASIA'
  else if cbPesquisar.Text = 'Raz�o social' then
    campo := 'RAZAO_SOCIAL'
  else if cbPesquisar.Text = 'CPF ou CNPJ' then
    campo := 'CPF_CNPJ';

  if edtPesquisar.Text <> EmptyStr then
    FEntityForncedores.getCampo(campo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1)
      
end;

procedure TformCadastroFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityForncedores := TEntityCadastroFornecedores.new;
  FEntityTableUF := TEntityTable.new;
  dllSoftMeter.sendEvent('cadastros de fornecedores', 'fornecedores', 0);
end;

procedure TformCadastroFornecedores.FormShow(Sender: TObject);
begin
  inherited;

  FEntityForncedores.abrir.getCampo('ID').getValor('0').sqlPesquisa.listarGrid
    (DataSource1);

  FEntityTableUF.FD_Table('UF').getCampoTabela('UF')
    .popularComponenteComboBox(edtUF);

end;

procedure TformCadastroFornecedores.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityForncedores.cancelar;
end;

procedure TformCadastroFornecedores.sbEditarClick(Sender: TObject);
begin
  FEntityForncedores.editar;
  inherited;
  edtNomeFantasia.SetFocus;
end;

procedure TformCadastroFornecedores.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityForncedores.deletar;
end;

procedure TformCadastroFornecedores.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntityForncedores.exportar;
end;

procedure TformCadastroFornecedores.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frx_Fornecedores.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/relatorio_detalhado_fornecedores.fr3');
  frx_Fornecedores.ShowReport();
end;

procedure TformCadastroFornecedores.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityForncedores.inserir;
  edtNomeFantasia.SetFocus;
end;

procedure TformCadastroFornecedores.sbPesquisarCepClick(Sender: TObject);
begin
  inherited;
  ACBrCEP1.BuscarPorCEP(edtCEP.Text);
end;

procedure TformCadastroFornecedores.sbSalvarClick(Sender: TObject);
begin
  FEntityForncedores.getNomeFantasia(edtNomeFantasia.Text)
    .getRazaoSocial(edtRazaoSocial.Text).getCPFCNPJ(edtCPFCNPJ.Text)
    .getInscricaoEstadual(edtInscricaoEstadual.Text)
    .getEndereco(edtEndereco.Text).getBairro(edtBairro.Text)
    .getComplemento(edtComplemento.Text).getNumero(StrToInt(edtNumero.Text))
    .getCep(edtCEP.Text).getCidade(edtCidade.Text).getEstado(edtUF.Text)
    .getTelefone(edtTelefone.Text).getCelular(edtCelular.Text)
    .getEmail(edtEmail.Text).getResponsavel(edtResponsavel.Text)
    .getObservacao(edtObservacao.Text).gravar;
  inherited;
end;

end.
