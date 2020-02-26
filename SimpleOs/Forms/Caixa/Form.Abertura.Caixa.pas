unit Form.Abertura.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TformIniciarCaixa = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formIniciarCaixa: TformIniciarCaixa;

implementation

uses Form.Principal;

{$R *.dfm}

procedure TformIniciarCaixa.FormShow(Sender: TObject);
begin
  FProcessoCaixa.calcularEstornosOS(Edit1);
  FProcessoCaixa.calcularParcelasOS(Edit2);
  FProcessoCaixa.calcularEstornoVendas(Edit3);
  FProcessoCaixa.calcularParcelasVendas(Edit4);
end;

procedure TformIniciarCaixa.Panel1MouseDown(Sender: TObject;
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
procedure TformIniciarCaixa.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
