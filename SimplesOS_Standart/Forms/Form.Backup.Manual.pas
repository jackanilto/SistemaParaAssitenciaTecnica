unit Form.Backup.Manual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UClasse.Config.Backup;

type
  TformBackUpManual = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    edtLocalBaseDeDados: TEdit;
    edtLocalSalvarArquivo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    sbIniciarBackup: TSpeedButton;
    sbCancelar: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure sbIniciarBackupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
  private
    { Private declarations }
  var
    FBackup: TClasseConfigBackUp;
  public
    { Public declarations }
  end;

var
  formBackUpManual: TformBackUpManual;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformBackUpManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FBackup);
end;

procedure TformBackUpManual.FormCreate(Sender: TObject);
begin
  FBackup := TClasseConfigBackUp.create;
  dllSoftMeter.sendEvent('backup manual do sistema', 'backup manual', 0);
end;

procedure TformBackUpManual.FormShow(Sender: TObject);
begin
  lblCaption.Caption := formBackUpManual.Caption;
  edtLocalSalvarArquivo.Text := ExtractFilePath(application.exename);
end;

procedure TformBackUpManual.Panel1MouseDown(Sender: TObject;
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

procedure TformBackUpManual.sbCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TformBackUpManual.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformBackUpManual.sbIniciarBackupClick(Sender: TObject);
begin

  FBackup.localBD := edtLocalBaseDeDados.Text;
  FBackup.localSalvarArquivo := edtLocalSalvarArquivo.Text;

  try

    self.Cursor := crHourGlass;

    FBackup.iniciarBackUpManual;

    self.Cursor := crDefault;
  except
    on e: exception do
    begin
      self.Cursor := crDefault;
      raise exception.create
        ('Ocorreu um erro ao tentar efetuar o backup do banco de dados. ' +
        e.Message);
    end;
  end;

end;

procedure TformBackUpManual.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtLocalBaseDeDados.Text := OpenDialog1.FileName;
end;

end.
