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
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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

procedure TformLocalizarAtividadeFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FQuery.Free;
end;

procedure TformLocalizarAtividadeFuncionario.FormCreate(Sender: TObject);
begin
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
  FQuery.FieldByName('MARCA').DisplayLabel := 'Marca';

  DataSource1.DataSet := FQuery;

end;

procedure TformLocalizarAtividadeFuncionario.sbFecharClick(Sender: TObject);
begin
  Close;
end;

end.
