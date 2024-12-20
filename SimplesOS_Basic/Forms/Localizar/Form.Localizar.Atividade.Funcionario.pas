unit Form.Localizar.Atividade.Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, UDados.Conexao;

type
  TformLocalizarAtividadeFuncionario = class(TForm)
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
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FQuery: TFDQuery;
    campo: string;
    valor: string;
    procedure Localizar;
  public
    { Public declarations }
  end;

var
  formLocalizarAtividadeFuncionario: TformLocalizarAtividadeFuncionario;

implementation

{$R *.dfm}

uses Form.Cadastro.Funcionarios;

procedure TformLocalizarAtividadeFuncionario.DBGrid1DblClick(Sender: TObject);
begin
  codigoAtividade := FQuery.FieldByName('ID').AsInteger;
  atividadeFuncionario := FQuery.FieldByName('ATIVIDADE').AsString;
  close;
end;

procedure TformLocalizarAtividadeFuncionario.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if cbPesquisar.Text = 'C�digo' then
    campo := 'ID'
  else if cbPesquisar.Text = 'Atividade' then
    campo := 'ATIVIDADE';

  valor := UpperCase(edtPesquisar.Text);

  Localizar;
end;

procedure TformLocalizarAtividadeFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FQuery.Free;
end;

procedure TformLocalizarAtividadeFuncionario.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DataModule1.Conexao;
end;

procedure TformLocalizarAtividadeFuncionario.FormShow(Sender: TObject);
begin
  campo := 'ID';
  valor := '%';
  Localizar;
end;

procedure TformLocalizarAtividadeFuncionario.Localizar;
begin

  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from ATIVIDADE_FUNCIONARIO where ' + campo +
    ' like :m');
  FQuery.ParamByName('m').AsString := valor + '%';
  FQuery.Active := true;

  FQuery.FieldByName('ID').DisplayLabel := 'C�digo';
  FQuery.FieldByName('ATIVIDADE').DisplayLabel := 'Atividade';

  DataSource1.DataSet := FQuery;

end;

procedure TformLocalizarAtividadeFuncionario.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
