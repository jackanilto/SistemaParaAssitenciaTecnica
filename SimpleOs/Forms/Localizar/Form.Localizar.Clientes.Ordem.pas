unit Form.Localizar.Clientes.Ordem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, UDados.Conexao, FireDAC.Comp.Client,
  UClasse.Chamar.Cadastro.Clientes.Ordens;

type
  TformLocalizarClientesOrdem = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    sbCadastrarClientes: TSpeedButton;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sbCadastrarClientesClick(Sender: TObject);
  private
    { Private declarations }
    procedure Localizar;

  var
    FQuery: TFDQuery;
    FCampo: string;
    FValor: string;
  public
    { Public declarations }
  end;

var
  formLocalizarClientesOrdem: TformLocalizarClientesOrdem;
  FClasseChamarCadastroClientes: TclasseCadastroClientesOrdem;

implementation

{$R *.dfm}

uses Form.Ordem.Servico;

procedure TformLocalizarClientesOrdem.DBGrid1CellClick(Column: TColumn);
begin
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    formOrdemDeServico.edtCodigoCliente.Text :=
      inttostr(DataSource1.DataSet.FieldByName('ID').AsInteger);
    formOrdemDeServico.edtCliente.Text := DataSource1.DataSet.FieldByName
      ('NOME').AsString;
    close;
  end;
end;

procedure TformLocalizarClientesOrdem.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if cbPesquisar.Text = 'Código do cliente' then
    FCampo := 'ID'
  else if cbPesquisar.Text = 'Nome' then
    FCampo := 'NOME'
  else if cbPesquisar.Text = 'CPF ou CNPJ' then
    FCampo := 'CPF_CNPJ';

  if edtPesquisar.Text <> EmptyStr then
  begin

    FValor := UpperCase(edtPesquisar.Text);

    Localizar;

    // if DataSource1.DataSet.RecordCount = 0 then
    // begin
    // if application.MessageBox
    // ('Nenhum registro foi encontrado. Deseja cadastrar este cliente?',
    // 'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = mryes then
    // begin
    //
    // end;
    //
    // end;

  end;

end;

procedure TformLocalizarClientesOrdem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FQuery.Free;
  FClasseChamarCadastroClientes.Free;
end;

procedure TformLocalizarClientesOrdem.FormCreate(Sender: TObject);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DataModule1.Conexao;
  FClasseChamarCadastroClientes := TclasseCadastroClientesOrdem.Create;
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformLocalizarClientesOrdem.FormShow(Sender: TObject);
begin
  FCampo := 'ID';
  FValor := '0';
  Localizar;
end;

procedure TformLocalizarClientesOrdem.Localizar;
begin
  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from CLIENTES where ' + FCampo + ' like :m');
  FQuery.ParamByName('m').AsString := FValor + '%';
  FQuery.Active := true;

  FQuery.FieldByName('ID').DisplayLabel := 'Código';
  FQuery.FieldByName('NOME').DisplayLabel := 'Nome';
  FQuery.FieldByName('TIPO_CADASTRO').DisplayLabel := 'Tipo de cadastro';
  FQuery.FieldByName('DATA_NASCIMENTO').Visible := false;
  FQuery.FieldByName('DATA_CADASTRO').Visible := false;
  FQuery.FieldByName('CPF_CNPJ').DisplayLabel := 'CPF ou CNPJ';
  FQuery.FieldByName('DOCUMENTO').Visible := false;
  FQuery.FieldByName('ENDERECO').Visible := false;
  FQuery.FieldByName('BAIRRO').Visible := false;
  FQuery.FieldByName('NUMERO').Visible := false;
  FQuery.FieldByName('COMPLEMENTO').Visible := false;
  FQuery.FieldByName('CEP').Visible := false;
  FQuery.FieldByName('CIDADE').Visible := false;
  FQuery.FieldByName('ESTADO').Visible := false;
  FQuery.FieldByName('TELEFONE').Visible := false;
  FQuery.FieldByName('CELULAR').Visible := false;
  FQuery.FieldByName('EMAIL').Visible := false;
  FQuery.FieldByName('FUNCIONARIO_CADASTRO').Visible := false;
  FQuery.FieldByName('SITUACAO_CLIENTE').Visible := false;
  FQuery.FieldByName('FOTO').Visible := false;
  FQuery.FieldByName('OBSERVACAO').Visible := false;

  FQuery.FieldByName('NOME').DisplayWidth := 60;

  DataSource1.DataSet := FQuery;
end;

procedure TformLocalizarClientesOrdem.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TformLocalizarClientesOrdem.sbCadastrarClientesClick(Sender: TObject);
begin

  if cbPesquisar.Text = 'Nome' then
    FClasseChamarCadastroClientes.nome := edtPesquisar.Text;

  FClasseChamarCadastroClientes.chamarCadastroClientes;

end;

procedure TformLocalizarClientesOrdem.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
