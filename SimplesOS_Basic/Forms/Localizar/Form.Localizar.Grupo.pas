unit Form.Localizar.Grupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, UDados.Conexao;

type
  TformLocalizarGrupo = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
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
  formLocalizarGrupo: TformLocalizarGrupo;

implementation

{$R *.dfm}

uses Form.Cadastro.Produtos;

procedure TformLocalizarGrupo.DBGrid1DblClick(Sender: TObject);
begin
  codigoGrupo := FQuery.FieldByName('ID').AsInteger;
  Grupo := FQuery.FieldByName('GRUPO').AsString;
  close;
end;

procedure TformLocalizarGrupo.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if cbPesquisar.Text = 'Código' then
    campo := 'ID'
  else if cbPesquisar.Text = 'Grupo' then
    campo := 'GRUPO';

  valor := UpperCase(edtPesquisar.Text);

  Localizar;

end;

procedure TformLocalizarGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FQuery.Free;
end;

procedure TformLocalizarGrupo.FormCreate(Sender: TObject);
begin

  ReportMemoryLeaksOnShutdown := true;

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DataModule1.Conexao;

end;

procedure TformLocalizarGrupo.FormShow(Sender: TObject);
begin
  campo := 'ID';
  valor := '%';
  Localizar;
end;

procedure TformLocalizarGrupo.Localizar;
begin

  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from grupos where ' + campo + ' like :g');
  FQuery.ParamByName('g').AsString := valor + '%';
  FQuery.Active := true;

  FQuery.FieldByName('ID').DisplayLabel := 'Código';
  FQuery.FieldByName('GRUPO').DisplayLabel := 'Grupo';

  DataSource1.DataSet := FQuery;

end;

procedure TformLocalizarGrupo.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
