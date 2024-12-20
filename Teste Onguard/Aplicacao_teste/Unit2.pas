unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UInterface.RegEdit;

type
  TForm2 = class(TForm)
    lblRegistro: TLabel;
    lblStatus: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  var
    Crypt: iReg;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses UDados, Vcl.onguard, Vcl.OgUtil, URegistro;

const
  EncryptionKey: TKey = ($E5, $8F, $84, $D6, $92, $C9, $A4, $D8, $1A, $FA, $6F,
    $8D, $AB, $FC, $DF, $B4);

procedure TForm2.FormCreate(Sender: TObject);
begin
  Crypt := TReg.new;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  Key: TKey;
  Code: TCode;
  Modifier: Longint;
  d: TDateTime;
  codigo, liberacao: string;
begin

  tabela.FDQuery1.Open;

  liberacao := Crypt.Crypt('D', tabela.FDQuery1.FieldByName('cc1').AsString);
  codigo := Crypt.Crypt('D', tabela.FDQuery1.FieldByName('cc4').AsString);

  if tabela.FDQuery1.RecordCount > 0 then
  begin

    Key := EncryptionKey;
    Modifier := StringHashELF(codigo);
    ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
    HexToBuffer(liberacao, Code, SizeOf(Code));
    lblStatus.Caption := 'v�lido at�: ' +
      datetostr(GetExpirationDate(Key, Code));
    if IsRegCodeValid(Key, Code) then
    begin
      if IsRegCodeExpired(Key, Code) then
        lblRegistro.Caption := 'Registro Expirado'
      else
        lblRegistro.Caption := 'Registro Valido';
    end
    else
      lblRegistro.Caption := 'Registro Invalido';

  end
  else
  begin
    lblRegistro.Caption := 'Registro Invalido';
  end;

  if lblRegistro.Caption <> 'Registro Valido' then
  begin
    if application.MessageBox('Erro na v�lidade do registro ' + #13 +
      'Deseja realizar o registro do seu software agora?',
      'Registro do Software', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin
      frmRegistro := TfrmRegistro.Create(application);
      try
        frmRegistro.ShowModal;
      finally
        frmRegistro.Free;
      end;
    end
    else
      application.Terminate;
  end;

end;

end.
