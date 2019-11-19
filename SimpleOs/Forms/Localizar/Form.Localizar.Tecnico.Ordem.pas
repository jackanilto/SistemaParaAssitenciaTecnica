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
  private
    { Private declarations }

    procedure localizr;

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

uses Form.Ordem.Servico;

procedure TformLocalizarTecnico.FormCreate(Sender: TObject);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DataModule1.Conexao;
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
