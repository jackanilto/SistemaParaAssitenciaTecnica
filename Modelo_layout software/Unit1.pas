unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Menus, Vcl.CategoryButtons, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SplitView1: TSplitView;
    Image1: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    CategoryButtons1: TCategoryButtons;
    ImageList1: TImageList;
    SplitView2: TSplitView;
    ActionList1: TActionList;
    acCadastros: TAction;
    acOrdens: TAction;
    SplitView3: TSplitView;
    procedure acCadastrosExecute(Sender: TObject);
    procedure acOrdensExecute(Sender: TObject);
  private
    { Private declarations }
    FSplit: TSplitView;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.acCadastrosExecute(Sender: TObject);
begin
  // FSplit.Opened := false;
  FSplit := SplitView2;
  if SplitView2.Opened = true then
    SplitView2.Opened := false
  else
    SplitView2.Opened := true;
end;

procedure TForm1.acOrdensExecute(Sender: TObject);
begin
  FSplit.Opened := false;
  FSplit := SplitView3;
  if SplitView3.Opened = true then
    SplitView3.Opened := false
  else
    SplitView3.Opened := true;
end;

end.
