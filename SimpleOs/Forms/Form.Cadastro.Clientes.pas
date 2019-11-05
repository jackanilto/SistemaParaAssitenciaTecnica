unit Form.Cadastro.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Cadastro.Clientes, Vcl.Mask,
  ACBrBase, ACBrSocket, ACBrCEP, UFactory, UClasse.Entity.Table,
  Vcl.Imaging.jpeg, Vcl.ExtDlgs;

type
  TformCadastroDeClientes = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtCPFCNPJ: TEdit;
    edtDocumento: TEdit;
    edtBairro: TEdit;
    edtComplemento: TEdit;
    edtNumero: TEdit;
    edtCidade: TEdit;
    edtEmail: TEdit;
    edtFuncionario: TEdit;
    edtObservacao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblCPF: TLabel;
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
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    sbPesquisarCep: TSpeedButton;
    Image1: TImage;
    Label23: TLabel;
    SpeedButton1: TSpeedButton;
    edtTipoCadastro: TComboBox;
    edtEstado: TComboBox;
    edtDataNascimento: TMaskEdit;
    edtDataCadastro: TMaskEdit;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    edtEndereco: TEdit;
    edtCEP: TEdit;
    Label24: TLabel;
    ACBrCEP1: TACBrCEP;
    edtSituacaoCliente: TComboBox;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbNovoClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure sbPesquisarCepClick(Sender: TObject);
    procedure edtCPFCNPJExit(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FEntityClientes: iCadastroClientes;
    FEntityTableUF: iFDTable;
    imagem: TJPEGImage;
  public
    { Public declarations }
  end;

var
  formCadastroDeClientes: TformCadastroDeClientes;

implementation

{$R *.dfm}

procedure TformCadastroDeClientes.ACBrCEP1BuscaEfetuada(Sender: TObject);
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

procedure TformCadastroDeClientes.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin

    edtCodigo.Text := inttostr(FieldByName('ID').AsInteger);
    edtTipoCadastro.Text := FieldByName('TIPO_CADASTRO').AsString;
    edtNome.Text := FieldByName('NOME').AsString;
    edtCPFCNPJ.Text := FieldByName('CPF_CNPJ').AsString;
    edtDocumento.Text := FieldByName('DOCUMENTO').AsString;
    edtEndereco.Text := FieldByName('ENDERECO').AsString;
    edtBairro.Text := FieldByName('BAIRRO').AsString;
    edtComplemento.Text := FieldByName('COMPLEMENTO').AsString;
    edtNumero.Text := inttostr(FieldByName('NUMERO').AsInteger);
    edtCidade.Text := FieldByName('CIDADE').AsString;
    edtEstado.Text := FieldByName('ESTADO').AsString;
    edtCEP.Text := FieldByName('CEP').AsString;
    edtTelefone.Text := FieldByName('TELEFONE').AsString;
    edtCelular.Text := FieldByName('CELULAR').AsString;
    edtEmail.Text := FieldByName('EMAIL').AsString;
    edtFuncionario.Text := inttostr(FieldByName('FUNCIONARIO_CADASTRO')
      .AsInteger);
    edtSituacaoCliente.Text := FieldByName('SITUACAO_CLIENTE').AsString;
    edtObservacao.Text := FieldByName('OBSERVACAO').AsString;

    if FieldByName('DATA_NASCIMENTO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataNascimento.Text := DateToStr(FieldByName('DATA_NASCIMENTO')
        .AsDateTime)
    else
      edtDataNascimento.Clear;

    if FieldByName('DATA_CADASTRO').AsDateTime <> StrToDate('30/12/1899') then
      edtDataCadastro.Text := DateToStr(FieldByName('DATA_CADASTRO').AsDateTime)
    else
      edtDataCadastro.Clear;

    Image1.Picture.Assign(FieldByName('foto'));

  end;
end;

procedure TformCadastroDeClientes.edtCPFCNPJExit(Sender: TObject);
begin
  inherited;
  if tfactory.new.validarDocumento.getDocumento(edtCPFCNPJ.Text) = false then
  begin
    lblCPF.Caption := 'CPF ou CNPJ inv�lido';
    lblCPF.Font.Color := clred;
  end
  else
  begin
    lblCPF.Caption := 'CPF ou CNPJ';
    lblCPF.Font.Color := clWindowText;
  end;
end;

procedure TformCadastroDeClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  imagem.Free;
end;

procedure TformCadastroDeClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityClientes := TEntityCadastroClientes.new;
  FEntityTableUF := TEntityTable.new;
end;

procedure TformCadastroDeClientes.FormShow(Sender: TObject);
begin
  inherited;
  FEntityClientes.abrir.listarGrid(DataSource1);
  FEntityTableUF.FD_Table('UF').getCampoTabela('UF').popularComponenteComboBox
    (edtEstado);
end;

procedure TformCadastroDeClientes.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityClientes.inserir;
  edtNome.SetFocus;
end;

procedure TformCadastroDeClientes.sbPesquisarCepClick(Sender: TObject);
begin
  inherited;
  if sbNovo.Enabled = false then
    ACBrCEP1.BuscarPorCEP(edtCEP.Text);
end;

procedure TformCadastroDeClientes.sbSalvarClick(Sender: TObject);
begin

  FEntityClientes.getTIPO_CADASTRO(edtTipoCadastro.Text).getNOME(edtNome.Text)
    .getDATA_NASCIMENTO(edtDataNascimento.Text)
    .getDATA_CADASTRO(edtDataCadastro.Text).getCPF_CNPJ(edtCPFCNPJ.Text)
    .getDocumento(edtDocumento.Text).getCEP(edtCEP.Text)
    .getENDERECO(edtEndereco.Text).getBAIRRO(edtBairro.Text)
    .getCOMPLEMENTO(edtComplemento.Text).getNUMERO(StrToInt(edtNumero.Text))
    .getCIDADE(edtCidade.Text).getESTADO(edtEstado.Text)
    .getTELEFONE(edtTelefone.Text).getCELULAR(edtCelular.Text)
    .getEmail(edtEmail.Text).getSITUACAO_CLIENTE(edtSituacaoCliente.Text)
    .getObservacao(edtObservacao.Text).getFoto(imagem).gravar;

  inherited;

end;

procedure TformCadastroDeClientes.SpeedButton1Click(Sender: TObject);
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

end.
