unit Form.Cadastro.Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Cadastro.Funcionario, Vcl.Mask,
  UClasse.Entity.Table, ACBrBase, ACBrSocket, ACBrCEP, Vcl.Imaging.jpeg,
  Vcl.ExtDlgs, UFactory, UFactory.Entity, frxClass, frxDBSet;

type
  TformCadastroDeFuncionarios = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtDocumento: TEdit;
    edtCPF: TEdit;
    edtCEP: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtCidade: TEdit;
    edtEMail: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    edtConfirmaSenha: TEdit;
    edtFuncionario: TEdit;
    edtObservacao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    lblCPF: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    sbPesquisarCep: TSpeedButton;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    edtDataNascimento: TMaskEdit;
    edtDataCadastro: TMaskEdit;
    edtDataDemissao: TMaskEdit;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    edtEstado: TComboBox;
    edtStatus: TComboBox;
    ACBrCEP1: TACBrCEP;
    OpenPictureDialog1: TOpenPictureDialog;
    edtCodigoAtividade: TEdit;
    Label17: TLabel;
    edtAtividade: TEdit;
    Label28: TLabel;
    SpeedButton2: TSpeedButton;
    frxDB_Funcionarios: TfrxDBDataset;
    frx_Funcionarios: TfrxReport;
    GroupBox1: TGroupBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure sbPesquisarCepClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sbExportarClick(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbImprimirClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    FEntityFuncionario: iCadastroFuncionario;
    FEntityTableUF: iFDTable;
    imagem: TJPEGImage;
    FTipoOperacaoForm: string;
    procedure validacaoCamposUsuarioSenha;
    procedure localizarAtividade;
  public
    { Public declarations }
  end;

var
  formCadastroDeFuncionarios: TformCadastroDeFuncionarios;

  codigoAtividade: integer;
  atividadeFuncionario: String;

implementation

{$R *.dfm}

uses Form.Cadastro.Atividade.Funcionario, Form.Localizar.Atividade.Funcionario,
  Form.Comissoes.Funcionario;

procedure TformCadastroDeFuncionarios.ACBrCEP1BuscaEfetuada(Sender: TObject);
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
    edtEstado.Text := ACBrCEP1.Enderecos[i].UF;
    edtBairro.Text := ACBrCEP1.Enderecos[i].Bairro;
  end;

end;

procedure TformCadastroDeFuncionarios.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin

    edtCodigo.Text := intTostr(FieldByName('ID').AsInteger);
    edtNome.Text := FieldByName('NOME').AsString;
    edtDocumento.Text := FieldByName('DOCUMENTO').AsString;
    edtCPF.Text := FieldByName('CPF').AsString;
    edtCEP.Text := FieldByName('CEP').AsString;
    edtEndereco.Text := FieldByName('ENDERECO').AsString;
    edtBairro.Text := FieldByName('BAIRRO').AsString;
    edtNumero.Text := intTostr(FieldByName('NUMERO').AsInteger);
    edtComplemento.Text := FieldByName('COMPLEMENTO').AsString;
    edtCidade.Text := FieldByName('CIDADE').AsString;
    edtEstado.Text := FieldByName('UF').AsString;
    edtTelefone.Text := FieldByName('TELEFONE').AsString;
    edtCelular.Text := FieldByName('CELULAR').AsString;
    edtCodigoAtividade.Text := intTostr(FieldByName('ATIVIDADE').AsInteger);
    edtAtividade.Text := FieldByName('ATIVIDADE_NOME').AsString;
    edtEMail.Text := FieldByName('EMAIL').AsString;
    edtUsuario.Text := FieldByName('USUARIO').AsString;
    edtStatus.Text := FieldByName('STATUS').AsString;
    edtObservacao.Text := FieldByName('OBSERVACAO').AsString;

    if FieldByName('DATA_NASCIMENTO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataNascimento.Text := DateToStr(FieldByName('DATA_NASCIMENTO')
        .AsDateTime);

    if FieldByName('DATA_CADASTRO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataCadastro.Text := DateToStr(FieldByName('DATA_CADASTRO')
        .AsDateTime);

    if FieldByName('DATA_DEMISSAO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataDemissao.Text := DateToStr(FieldByName('DATA_DEMISSAO')
        .AsDateTime);

    Image1.Picture.Assign(FieldByName('FOTO'));

    // if FieldByName('ATIVIDADE').AsInteger <> null then
    // localizarAtividade;

  end;
end;

procedure TformCadastroDeFuncionarios.DBGrid1CellClick(Column: TColumn);
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

procedure TformCadastroDeFuncionarios.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityFuncionario.ordenarGrid(Column);
end;

procedure TformCadastroDeFuncionarios.edtCPFExit(Sender: TObject);
begin
  inherited;
  if tfactory.new.validarDocumento.getDocumento(edtCPF.Text) = false then
  begin
    lblCPF.Caption := 'CPF';
    lblCPF.Font.Color := clred;
  end
  else
  begin
    lblCPF.Caption := 'CPF';
    lblCPF.Font.Color := clWindowText;
  end;
end;

procedure TformCadastroDeFuncionarios.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  campo: string;
begin
  inherited;

  if cbPesquisar.Text = 'Código' then
    campo := 'ID'
  else if cbPesquisar.Text = 'Nome' then
    campo := 'NOME'
  else if cbPesquisar.Text = 'Usuário' then
    campo := 'USUARIO';

  if edtPesquisar.Text <> EmptyStr then
    FEntityFuncionario.getCampo(campo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1)

end;

procedure TformCadastroDeFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  imagem.Free;
end;

procedure TformCadastroDeFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityFuncionario := TEntityCadastroFuncionario.new;
  FEntityTableUF := TEntityTable.new;
end;

procedure TformCadastroDeFuncionarios.FormShow(Sender: TObject);
begin
  inherited;

  FEntityFuncionario.abrir.getCampo('ID').getValor('0').sqlPesquisa.listarGrid
    (DataSource1);

  FEntityTableUF.FD_Table('UF').getCampoTabela('UF').popularComponenteComboBox
    (edtEstado);

  FTipoOperacaoForm := '';
end;

procedure TformCadastroDeFuncionarios.localizarAtividade;
begin
  edtAtividade.Text := TFactoryEntity.new.entityTable.FD_Table
    ('ATIVIDADE_FUNCIONARIO').getCampoTabela('ATIVIDADE')
    .localizarRegistro(intTostr(DataSource1.DataSet.FieldByName('ATIVIDADE')
    .AsInteger), 'ID');

end;

procedure TformCadastroDeFuncionarios.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FTipoOperacaoForm := '';
end;

procedure TformCadastroDeFuncionarios.validacaoCamposUsuarioSenha;
begin
  if FTipoOperacaoForm = 'novo' then
    FEntityFuncionario.validarUsuario(edtUsuario.Text)
      .validarSenha(edtSenha.Text, edtConfirmaSenha.Text);
  if FTipoOperacaoForm = 'editar' then
    if edtSenha.Text <> EmptyStr then
      FEntityFuncionario.validarUsuario(edtUsuario.Text)
        .validarSenha(edtSenha.Text, edtConfirmaSenha.Text);
end;

procedure TformCadastroDeFuncionarios.sbEditarClick(Sender: TObject);
begin

  FEntityFuncionario.editar;
  inherited;
  edtNome.SetFocus;

  FTipoOperacaoForm := 'editar';

end;

procedure TformCadastroDeFuncionarios.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityFuncionario.deletar;
  FTipoOperacaoForm := '';
end;

procedure TformCadastroDeFuncionarios.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntityFuncionario.exportar;
end;

procedure TformCadastroDeFuncionarios.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frx_Funcionarios.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_funcionarios.fr3');
  frx_Funcionarios.ShowReport();
end;

procedure TformCadastroDeFuncionarios.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityFuncionario.inserir;
  edtNome.SetFocus;

  FTipoOperacaoForm := 'novo';

end;

procedure TformCadastroDeFuncionarios.sbPesquisarCepClick(Sender: TObject);
begin
  inherited;
  if sbNovo.Enabled = false then
    ACBrCEP1.BuscarPorCEP(edtCEP.Text);
end;

procedure TformCadastroDeFuncionarios.sbSalvarClick(Sender: TObject);
begin

  validacaoCamposUsuarioSenha;

  FEntityFuncionario.getNome(edtNome.Text).getDATA_NASCIMENTO
    (edtDataNascimento.Text).getDocumento(edtDocumento.Text).getCPF(edtCPF.Text)
    .getCep(edtCEP.Text).getEndereco(edtEndereco.Text).getBairro(edtBairro.Text)
    .getNumero(StrToInt(edtNumero.Text)).getComplemento(edtComplemento.Text)
    .getCidade(edtCidade.Text).getUF(edtEstado.Text)
    .getDATA_CADASTRO(edtDataCadastro.Text)
    .getDATA_DEMISSAO(edtDataDemissao.Text).getTelefone(edtTelefone.Text)
    .getCelular(edtCelular.Text).getEmail(edtEMail.Text)
    .getUSUARIO(edtUsuario.Text)
    .getSENHA(tfactory.new.criptPass.md5(edtSenha.Text))
    .getSTATUS(edtStatus.Text).getObservacao(edtObservacao.Text)
    .getATIVIDADE(StrToInt(edtCodigoAtividade.Text))
    .getNomeAtividade(edtAtividade.Text).getFoto(imagem).gravar;

  FTipoOperacaoForm := '';

  inherited;
end;

procedure TformCadastroDeFuncionarios.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if sbNovo.Enabled = false then
  begin
    imagem := TJPEGImage.Create;

    if OpenPictureDialog1.Execute then
    begin
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      imagem.LoadFromFile(OpenPictureDialog1.FileName);
    end;
  end;
end;

procedure TformCadastroDeFuncionarios.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  formLocalizarAtividadeFuncionario :=
    TformLocalizarAtividadeFuncionario.Create(self);
  tfactory.new.criarJanela.FormShow(formLocalizarAtividadeFuncionario, '');

  edtCodigoAtividade.Text := codigoAtividade.ToString;
  edtAtividade.Text := atividadeFuncionario;

end;

procedure TformCadastroDeFuncionarios.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  formComissoesFuncionarios := TformComissoesFuncionarios.Create(self);
  tfactory.new.criarJanela.FormShow(formComissoesFuncionarios, '');
end;

end.
