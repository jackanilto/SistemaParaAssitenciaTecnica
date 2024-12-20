unit Form.Localizar.Marca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, UDados.Conexao, Form.Principal,
  FireDAC.Comp.Client;

type
  TformLocalizarMarca = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Localizar;

  var
    FQuery: TFDQuery;
    campo: string;
    valor: string;
  public
    { Public declarations }
  end;

var
  formLocalizarMarca: TformLocalizarMarca;

implementation

{$R *.dfm}

uses Form.Cadastro.Produtos;

procedure TformLocalizarMarca.DBGrid1DblClick(Sender: TObject);
begin
  codigoMarca := FQuery.FieldByName('ID').AsInteger;
  Marca := FQuery.FieldByName('MARCA').AsString;
  close;
end;

procedure TformLocalizarMarca.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if cbPesquisar.Text = 'C�digo' then
    campo := 'ID'
  else if cbPesquisar.Text = 'Marca' then
    campo := 'MARCA';

  valor := UpperCase(edtPesquisar.Text);

  Localizar;

end;

procedure TformLocalizarMarca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FQuery);
end;

procedure TformLocalizarMarca.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DataModule1.Conexao;
end;

procedure TformLocalizarMarca.FormShow(Sender: TObject);
begin
  campo := 'ID';
  valor := '%';
  Localizar;
end;

procedure TformLocalizarMarca.Localizar;
begin

  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from marca where ' + campo + ' like :m');
  FQuery.ParamByName('m').AsString := valor + '%';
  FQuery.Active := true;

  FQuery.FieldByName('ID').DisplayLabel := 'C�digo';
  FQuery.FieldByName('MARCA').DisplayLabel := 'Marca';

  DataSource1.DataSet := FQuery;

end;

procedure TformLocalizarMarca.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
