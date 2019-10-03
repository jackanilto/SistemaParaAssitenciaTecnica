unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.CategoryButtons, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList;

type
  TformPrincipal = class(TForm)
    Panel1: TPanel;
    SplitView1: TSplitView;
    sbMenu: TSpeedButton;
    CategoryButtons1: TCategoryButtons;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    CategoryButtons2: TCategoryButtons;
    actionPrincipal: TActionList;
    acSair: TAction;
    acConfiguracoes: TAction;
    acSobre: TAction;
    acExtras: TAction;
    acRelatorios: TAction;
    acMovimentacao: TAction;
    acCadastros: TAction;
    Panel2: TPanel;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image3: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    imgLogo: TImage;
    Panel3: TPanel;
    Button1: TButton;
    procedure acSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

procedure TformPrincipal.acSairExecute(Sender: TObject);
begin
  close;
end;

procedure TformPrincipal.Button1Click(Sender: TObject);
begin
  Panel3.BringToFront;
  imgLogo.Visible := false;
end;

procedure TformPrincipal.FormCreate(Sender: TObject);
begin
  { Centraliza a imagem da LOGO }
  imgLogo.Left := (formPrincipal.Width - Image2.Width) div 2;
  imgLogo.Top := (formPrincipal.Height - Image2.Height) div 2;
end;

end.
