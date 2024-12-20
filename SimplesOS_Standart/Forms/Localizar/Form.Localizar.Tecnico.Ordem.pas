unit Form.Localizar.Tecnico.Ordem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, UDados.Conexao, FireDAC.Comp.Client;

type
  TformLocalizarTecnico = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    DataSource1: TDataSource;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cbPesquisarChange(Sender: TObject);
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
  formLocalizarTecnico: TformLocalizarTecnico;

implementation

{$R *.dfm}

uses Form.Ordem.Servico, Form.Criar.Ordem.Servico;

procedure TformLocalizarTecnico.cbPesquisarChange(Sender: TObject);
begin
  edtPesquisar.SetFocus;
end;

procedure TformLocalizarTecnico.DBGrid1DblClick(Sender: TObject);
begin
  FIdTecnico := DataSource1.DataSet.FieldByName('ID').AsInteger;
  formCriarConsultarOrdemServico.edtTecnicoResponsavel.Text :=
    DataSource1.DataSet.FieldByName('NOME').AsString;
  close;
end;

procedure TformLocalizarTecnico.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if cbPesquisar.Text = 'C�digo do funcion�rio' then
    FCampo := 'ID'
  else if cbPesquisar.Text = 'Nome' then
    FCampo := 'NOME'
  else if cbPesquisar.Text = 'Atividade' then
    FCampo := 'ATIVIDADE_NOME';

  if edtPesquisar.Text <> EmptyStr then
  begin
    FValor := UpperCase(edtPesquisar.Text);
    Localizar;
  end;
end;

procedure TformLocalizarTecnico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FQuery.Free;
end;

procedure TformLocalizarTecnico.FormCreate(Sender: TObject);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DataModule1.Conexao;
end;

procedure TformLocalizarTecnico.FormShow(Sender: TObject);
begin
  FCampo := 'ID';
  FValor := '%';
  Localizar;

  edtPesquisar.SetFocus;

end;

procedure TformLocalizarTecnico.Localizar;
begin

  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from FUNCIONARIOS where ' + FCampo +
    ' like :m order by id');
  FQuery.ParamByName('m').AsString := FValor + '%';
  FQuery.Active := true;

  FQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.FieldByName('NOME').DisplayLabel := 'Funcion�rio';
  FQuery.FieldByName('DATA_NASCIMENTO').Visible := false;
  FQuery.FieldByName('DOCUMENTO').Visible := false;
  FQuery.FieldByName('CPF').Visible := false;
  FQuery.FieldByName('ENDERECO').Visible := false;
  FQuery.FieldByName('BAIRRO').Visible := false;
  FQuery.FieldByName('NUMERO').Visible := false;
  FQuery.FieldByName('COMPLEMENTO').Visible := false;
  FQuery.FieldByName('CEP').Visible := false;
  FQuery.FieldByName('CIDADE').Visible := false;
  FQuery.FieldByName('UF').Visible := false;
  FQuery.FieldByName('DATA_CADASTRO').Visible := false;
  FQuery.FieldByName('DATA_DEMISSAO').Visible := false;
  FQuery.FieldByName('ATIVIDADE').Visible := false;
  FQuery.FieldByName('ATIVIDADE_NOME').DisplayLabel := 'Atividade';
  FQuery.FieldByName('TELEFONE').Visible := false;
  FQuery.FieldByName('CELULAR').Visible := false;
  FQuery.FieldByName('EMAIL').Visible := false;
  FQuery.FieldByName('USUARIO').Visible := false;
  FQuery.FieldByName('SENHA').Visible := false;
  FQuery.FieldByName('STATUS').Visible := false;
  FQuery.FieldByName('EXCLUIDO').Visible := false;
  FQuery.FieldByName('FOTO').Visible := false;
  FQuery.FieldByName('FUNCIONARIO_CADASTRO').Visible := false;
  FQuery.FieldByName('OBSERVACAO').Visible := false;

  FQuery.FieldByName('NOME').DisplayWidth := 50;
  FQuery.FieldByName('ATIVIDADE_NOME').DisplayWidth := 30;

  DataSource1.DataSet := FQuery;

end;

procedure TformLocalizarTecnico.Panel1MouseDown(Sender: TObject;
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

procedure TformLocalizarTecnico.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
