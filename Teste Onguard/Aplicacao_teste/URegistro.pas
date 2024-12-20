unit URegistro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UInterface.RegEdit;

type
  TfrmRegistro = class(TForm)
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtCodLiberacao: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    var
      crypt:iReg;
  public
    { Public declarations }
  end;

var
  frmRegistro: TfrmRegistro;

implementation

{$R *.dfm}

uses UDados, Vcl.onguard, Vcl.OgUtil;

const
  EncryptionKey: TKey = ($E5, $8F, $84, $D6, $92, $C9, $A4, $D8, $1A, $FA, $6F,
    $8D, $AB, $FC, $DF, $B4);

procedure TfrmRegistro.Button1Click(Sender: TObject);
var
  Key: TKey;
  Code: TCode;
  Modifier: Longint;
  d, DataVencimento: TDateTime;
  cStatus: string;
begin

//  edtCodigo.Text := crypt.Crypt('D', tabela.FDQuery1.FieldByName('cc4').AsString);

  Key := EncryptionKey;
  Modifier := StringHashELF(edtCodigo.Text);
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  HexToBuffer(edtCodLiberacao.Text, Code, SizeOf(Code));
  DataVencimento := GetExpirationDate(Key, Code);
  if IsRegCodeValid(Key, Code) then
  begin
    if IsRegCodeExpired(Key, Code) then
      cStatus := 'Registro Expirado'
    else
      cStatus := 'Registro Valido';
  end
  else
    cStatus := 'Registro Invalido';

  if cStatus <> 'Registro Valido' then
  begin
    ShowMessage('Por favor entrar em contato com o suporte');
    application.Terminate;
  end
  else
  begin

    tabela.FDQuery1.First;
    if tabela.FDQuery1.RecordCount > 0 then
    begin
      tabela.FDQuery1.edit;
    end
    else

    tabela.FDQuery1.Insert;

    tabela.FDQuery1.FieldByName('cc4').AsString := crypt.Crypt('C', edtCodigo.Text);
    tabela.FDQuery1.FieldByName('cc1').AsString := crypt.Crypt('C', edtCodLiberacao.Text);
    tabela.FDQuery1.FieldByName('cc2').AsString := crypt.Crypt('C',DateToStr(DataVencimento));
    tabela.FDQuery1.FieldByName('cc3').AsString := crypt.Crypt('C', DateToStr(date));

    tabela.FDQuery1.Post;

    ShowMessage('O sistema ser� encerrando para v�lidar a chave.');

    application.Terminate;

  end;

end;

procedure TfrmRegistro.FormCreate(Sender: TObject);
begin
  crypt := TReg.new;
end;

procedure TfrmRegistro.FormShow(Sender: TObject);
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
  edtCodigo.Text := inttohex(a, 8) +
  // inttohex(b, 8) + '-' +
    inttohex(c, 8) + inttohex(D, 8);
end;


end.
