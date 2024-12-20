unit Form.Cadastro.Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Dados.Empresa, Vcl.Mask, ACBrBase,
  ACBrSocket, ACBrCEP, UFactory, frxClass, frxDBSet;

type
  TformCadastroEmpresa = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtNomeFantasia: TEdit;
    edtRazaoSocial: TEdit;
    edtCNPJ: TEdit;
    edtInscricaoEstadual: TEdit;
    edtCEP: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtCidade: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblCNPJ: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    sbPesquisarCep: TSpeedButton;
    ACBrCEP1: TACBrCEP;
    edtEstado: TComboBox;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    Label16: TLabel;
    edtEMail: TEdit;
    edtResponsavel: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    frxDB_DadosEmpresa: TfrxDBDataset;
    frx_DadosEmpresa: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure sbPesquisarCepClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbNovoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
  private
    { Private declarations }
    FEntityEmpresa: iDadosEmpresa;
  public
    { Public declarations }
  end;

var
  formCadastroEmpresa: TformCadastroEmpresa;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformCadastroEmpresa.ACBrCEP1BuscaEfetuada(Sender: TObject);
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

procedure TformCadastroEmpresa.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin

    edtCodigo.Text := IntToStr(FieldByName('ID').AsInteger);
    edtNomeFantasia.Text := FieldByName('NOME_FANTASIA').AsString;
    edtRazaoSocial.Text := FieldByName('RAZAO_SOCIAL').AsString;
    edtCNPJ.Text := FieldByName('CNPJ').AsString;
    edtInscricaoEstadual.Text := FieldByName('INSCRICAO_ESTADUAL').AsString;
    edtEndereco.Text := FieldByName('ENDERECO').AsString;
    edtBairro.Text := FieldByName('BAIRRO').AsString;
    edtNumero.Text := IntToStr(FieldByName('NUMERO').AsInteger);
    edtComplemento.Text := FieldByName('COMPLEMENTO').AsString;
    edtCEP.Text := FieldByName('CEP').AsString;
    edtCidade.Text := FieldByName('CIDADE').AsString;
    edtEstado.Text := FieldByName('ESTADO').AsString;
    edtTelefone.Text := FieldByName('TELEFONE').AsString;
    edtCelular.Text := FieldByName('CELULAR').AsString;
    edtEMail.Text := FieldByName('EMAIL').AsString;
    edtResponsavel.Text := FieldByName('RESPONSAVEL').AsString;

  end;
end;

procedure TformCadastroEmpresa.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    sbEditar.Enabled := True;
    sbExcluir.Enabled := True;
  end
  else
  begin
    sbEditar.Enabled := False;
    sbExcluir.Enabled := False;
  end;
end;

procedure TformCadastroEmpresa.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityEmpresa.ordenarGrid(Column);
end;

procedure TformCadastroEmpresa.edtCNPJExit(Sender: TObject);
begin
  inherited;
  if tfactory.new.validarDocumento.getDocumento(edtCNPJ.Text) = false then
  begin
    lblCNPJ.Caption := 'CNPJ inválido';
    lblCNPJ.Font.Color := clred;
  end
  else
  begin
    lblCNPJ.Caption := 'CNPJ';
    lblCNPJ.Font.Color := clWindowText;
  end;
end;

procedure TformCadastroEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityEmpresa := TEntityCadastroDadosEmpresa.new;
  dllSoftMeter.sendEvent('Dados da empresa', 'empresa', 0);
end;

procedure TformCadastroEmpresa.FormShow(Sender: TObject);
begin
  inherited;
  FEntityEmpresa.abrir.listarGrid(DataSource1);
  TFactory.new.ftTable.FD_Table('UF').getCampoTabela('UF')
    .popularComponenteComboBox(edtEstado);
end;

procedure TformCadastroEmpresa.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityEmpresa
//              .cancelar
              .abrir
              .listarGrid(DataSource1);
end;

procedure TformCadastroEmpresa.sbEditarClick(Sender: TObject);
begin
  FEntityEmpresa.editar;
  inherited;
  edtNomeFantasia.SetFocus;
end;

procedure TformCadastroEmpresa.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityEmpresa.deletar;
end;

procedure TformCadastroEmpresa.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntityEmpresa.exportar;
end;

procedure TformCadastroEmpresa.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frx_DadosEmpresa.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_dados_empresa.fr3');
  frx_DadosEmpresa.ShowReport();
end;

procedure TformCadastroEmpresa.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityEmpresa.inserir;
  edtNomeFantasia.SetFocus;
end;

procedure TformCadastroEmpresa.sbPesquisarCepClick(Sender: TObject);
begin
  inherited;
  if sbNovo.Enabled = False then
    ACBrCEP1.BuscarPorCEP(edtCEP.Text);
end;

procedure TformCadastroEmpresa.sbSalvarClick(Sender: TObject);
begin

  FEntityEmpresa
                .getNOME_FANTASIA(edtNomeFantasia.Text)
                .getRAZAO_SOCIAL(edtRazaoSocial.Text)
                .getCNPJ(edtCNPJ.Text)
                .getINSCRICAO_ESTADUAL(edtInscricaoEstadual.Text)
                .getEndereco(edtEndereco.Text)
                .getBairro(edtBairro.Text)
                .getNumero(StrToInt(edtNumero.Text))
                .getComplemento(edtComplemento.Text)
                .getCep(edtCEP.Text)
                .getCidade(edtCidade.Text)
                .getEstado(edtEstado.Text)
                .getTelefone(edtTelefone.Text)
                .getCelular(edtCelular.Text)
                .getEmail(edtEMail.Text)
                .getResponsavel(edtResponsavel.Text)
                .gravar
                .abrir
                .listarGrid(DataSource1);

  inherited;

end;

end.
