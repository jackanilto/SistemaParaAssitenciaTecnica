unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Button2: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    Edit4: TEdit;
    Button4: TButton;
    Edit5: TEdit;
    Edit6: TEdit;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    codigo, liberacao: string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Vcl.onguard, Vcl.ogUtil;

const
  EncryptionKey: TKey = ($E5, $8F, $84, $D6, $92, $C9, $A4, $D8, $1A, $FA, $6F,
    $8D, $AB, $FC, $DF, $B4);
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Key: TKey;
  Code: TCode;
  Modifier: Longint;
  D: TDateTime;
begin
  D := DateTimePicker1.Date;
  Key := EncryptionKey;
  Modifier := StringHashELF(Edit1.Text);
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  InitRegCode(Key, '', D, Code);
  Edit2.Text := BufferToHex(Code, SizeOf(Code));

  codigo := Edit1.Text;
  liberacao := Edit2.Text;

end;

procedure TForm2.Button2Click(Sender: TObject);
var
  Key: TKey;
  Code: TCode;
  Modifier: Longint;
  D: TDateTime;
begin

  Key := EncryptionKey;
  Modifier := StringHashELF(codigo);
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  HexToBuffer(liberacao, Code, SizeOf(Code));
  Edit3.Text := datetostr(GetExpirationDate(Key, Code));

  if IsRegCodeValid(Key, Code) then
  begin
    if IsRegCodeExpired(Key, Code) then
      showmessage('Registro Expirado')
    else
      showmessage('Registro Valido');
  end
  else
    showmessage('Registro Invalido');

end;

procedure TForm2.Button3Click(Sender: TObject);
var
  a, b, c, D: LongWord;
begin
  asm
    push EAX
    push EBX
    push ECX
    push EDX

    mov eax, 1
    db $0F, $A2
    mov a, EAX
    mov b, EBX
    mov c, ECX
    mov d, EDX

    pop EDX
    pop ECX
    pop EBX
    pop EAX

  end;
  Edit4.Text := inttohex(a, 8) + '-' + inttohex(b, 8) + '-' + inttohex(c, 8) +
    '-' + inttohex(D, 8);
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  a, b, c, D: LongWord;
begin
  asm
    push EAX
    push EBX
    push ECX
    push EDX

    mov eax, 1
    db $0F, $A2
    mov a, EAX
    mov b, EBX
    mov c, ECX
    mov d, EDX

    pop EDX
    pop ECX
    pop EBX
    pop EAX

  end;
  Edit5.Text := inttohex(a, 8) +
  // inttohex(b, 8) + '-' +
    inttohex(c, 8) + inttohex(D, 8);
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  if Edit5.Text = Edit6.Text then
    showmessage('Serial v�lido')
  else
    showmessage('Serial invalido');
end;

end.
