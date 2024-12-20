unit Form.Cadastro.Transportadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Transportadora,
  UClasse.Entity.Table,
  ACBrBase, ACBrSocket, ACBrCEP, Vcl.Mask, UFactory, frxClass, frxDBSet;

type
  TformCadastroTransportadora = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtNomeFantasia: TEdit;
    edtRazaoSocial: TEdit;
    edtCPFCNPJ: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtCep: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtCidade: TEdit;
    edtEmail: TEdit;
    edtFuncionario: TEdit;
    edtObservacao: TEdit;
    edtResponsavel: TEdit;
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
    edtInscricaoEstadual: TEdit;
    Label21: TLabel;
    sbPesquisarCep: TSpeedButton;
    edtEstado: TComboBox;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    ACBrCEP1: TACBrCEP;
    frxDB_Transportadora: TfrxDBDataset;
    frx_Transportadora: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure sbPesquisarCepClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbSalvarClick(Sender: TObject);
    procedure edtCPFCNPJExit(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FEntityTranspostadora: iCadastroTransportadora;
    FEntityTableUF: iFDTable;
  public
    { Public declarations }
  end;

var
  formCadastroTransportadora: TformCadastroTransportadora;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformCadastroTransportadora.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
  i: integer;
begin
  inherited;

  for i := 0 to ACBrCEP1.Enderecos.Count - 1 do
  begiN
    edtCep.Text := ACBrCEP1.Enderecos[i].CEP;
    edtEndereco.Text := 'Rua ' + ACBrCEP1.Enderecos[i].Logradouro;
    edtComplemento.Text := ACBrCEP1.Enderecos[i].Complemento;
    edtCidade.Text := ACBrCEP1.Enderecos[i].Municipio;
    edtEstado.Text := ACBrCEP1.Enderecos[i].UF;
    edtBairro.Text := ACBrCEP1.Enderecos[i].Bairro;
  end;

end;

procedure TformCadastroTransportadora.DataSource1DataChange(Sender: TObject;
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
    edtCep.Text := FieldByName('CEP').AsString;
    edtEndereco.Text := FieldByName('ENDERECO').AsString;
    edtBairro.Text := FieldByName('BAIRRO').AsString;
    edtNumero.Text := IntToStr(FieldByName('NUMERO').AsInteger);
    edtComplemento.Text := FieldByName('COMPLEMENTO').AsString;
    edtCidade.Text := FieldByName('CIDADE').AsString;
    edtEstado.Text := FieldByName('ESTADO').AsString;
    edtTelefone.Text := FieldByName('TELEFONE').AsString;
    edtCelular.Text := FieldByName('CELULAR').AsString;
    edtEmail.Text := FieldByName('EMAIL').AsString;
    edtFuncionario.Text := IntToStr(FieldByName('FUNCIONARIO_CADASTRO')
      .AsInteger);
    edtResponsavel.Text := FieldByName('RESPONSAVEL').AsString;
    edtObservacao.Text := FieldByName('OBSERVACAO').AsString;
  end;
end;

procedure TformCadastroTransportadora.DBGrid1CellClick(Column: TColumn);
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

procedure TformCadastroTransportadora.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityTranspostadora.ordenarGrid(Column);
end;

procedure TformCadastroTransportadora.edtCPFCNPJExit(Sender: TObject);
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

procedure TformCadastroTransportadora.edtPesquisarKeyUp(Sender: TObject;
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
    FEntityTranspostadora.getCampo(campo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1);

  { C�digo
    Nome fantasia
    Raz�o social
    CPF ou CNPJ }
end;

procedure TformCadastroTransportadora.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityTranspostadora := TEntityCadastroTransportadora.new;
  FEntityTableUF := TEntityTable.new;
  dllSoftMeter.sendEvent('cadastros de transportadores', 'transportadora', 0);
end;

procedure TformCadastroTransportadora.FormShow(Sender: TObject);
begin
  inherited;

  FEntityTranspostadora.abrir.getCampo('ID').getValor('0')
    .sqlPesquisa.listarGrid(DataSource1);

  FEntityTableUF.FD_Table('UF').getCampoTabela('UF').popularComponenteComboBox
    (edtEstado);

end;

procedure TformCadastroTransportadora.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityTranspostadora.cancelar;
end;

procedure TformCadastroTransportadora.sbEditarClick(Sender: TObject);
begin

  FEntityTranspostadora.editar;
  inherited;
  edtNomeFantasia.SetFocus;

end;

procedure TformCadastroTransportadora.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityTranspostadora.deletar;
end;

procedure TformCadastroTransportadora.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntityTranspostadora.exportar;
end;

procedure TformCadastroTransportadora.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frx_Transportadora.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/relatorio_transportadora.fr3');
  frx_Transportadora.ShowReport();
end;

procedure TformCadastroTransportadora.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityTranspostadora.inserir;
  edtNomeFantasia.SetFocus;
end;

procedure TformCadastroTransportadora.sbPesquisarCepClick(Sender: TObject);
begin
  inherited;
  ACBrCEP1.BuscarPorCEP(edtCep.Text);
end;

procedure TformCadastroTransportadora.sbSalvarClick(Sender: TObject);
begin

  FEntityTranspostadora.getNomeFantasia(edtNomeFantasia.Text)
    .getRazaoSocial(edtRazaoSocial.Text).getCPFCNPJ(edtCPFCNPJ.Text)
    .getInscricaoEstadual(edtInscricaoEstadual.Text).getCep(edtCep.Text)
    .getEndereco(edtEndereco.Text).getBairro(edtBairro.Text)
    .getComplemento(edtComplemento.Text).getNumero(StrToInt(edtNumero.Text))
    .getCidade(edtCidade.Text).getEstado(edtEstado.Text)
    .getTelefone(edtTelefone.Text).getCelular(edtCelular.Text)
    .getEmail(edtEmail.Text).getFuncionario(StrToInt(edtFuncionario.Text))
    .getResponsavel(edtResponsavel.Text)
    .getObservacao(edtObservacao.Text).gravar;

  inherited;

end;

end.
