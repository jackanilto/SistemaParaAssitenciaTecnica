unit UForm.Exemplo.Embeded;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.WinXPanels, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TformExemploEmbeded = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    pnlFocoCadastro: TPanel;
    pnlFocoConsulta: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Panel3: TPanel;
    sbNovo: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbEditar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    CardPanel1: TCardPanel;
    cardPanelCadatro: TCard;
    cardPanelConsulta: TCard;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formExemploEmbeded: TformExemploEmbeded;

implementation

{$R *.dfm}

procedure TformExemploEmbeded.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformExemploEmbeded.FormShow(Sender: TObject);
begin
  Image2.Enabled := false;
end;

procedure TformExemploEmbeded.Panel1MouseDown(Sender: TObject;
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

procedure TformExemploEmbeded.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
