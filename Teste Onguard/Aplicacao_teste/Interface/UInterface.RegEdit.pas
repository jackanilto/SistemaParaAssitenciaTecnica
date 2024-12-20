unit UInterface.RegEdit;

interface

uses
  System.SysUtils, Vcl.Dialogs, Vcl.Forms;

type
  iReg = interface
    ['{DFA862EE-DAD3-4961-A50B-4E06F65A000F}']
    function getCodigo(value: string): iReg;
    function getLiberacao(value: string): iReg;
    function setDataVencimento: string;
    procedure registrar;
    function liberar: string;
    function Crypt(Action, Src: String): String;
    function criptografiaNoPass(value: string): string;
  end;

type
  TReg = class(TInterfacedObject, iReg)
  private
    FCodigo: string;
    FLiberar: string;
    FDataVencimento: string;
  public
    constructor create;
    destructor destroy; override;
    class function new: iReg;
    function getCodigo(value: string): iReg;
    function getLiberacao(value: string): iReg;
    function setDataVencimento: string;
    procedure registrar;
    function liberar: string;
    function Crypt(Action, Src: String): String;
    function criptografiaNoPass(value: string): string;

  end;

implementation

{ TReg }

uses Vcl.onguard, Vcl.OgUtil;

const
  EncryptionKey: TKey = ($E5, $8F, $84, $D6, $92, $C9, $A4, $D8, $1A, $FA, $6F,
    $8D, $AB, $FC, $DF, $B4);

constructor TReg.create;
begin

end;

function TReg.criptografiaNoPass(value: string): string;
var
  Simbolos: array [0 .. 4] of string;
  x: Integer;
begin
  Simbolos[1] := 'ABCDEFGHIJLMNOPQRSTUVXZYWK ~!@#$%^&*()';
  Simbolos[2] := '�����׃����5�����Ѫ�������������������';
  Simbolos[3] := 'abcdefghijlmnopqrstuvxzywk1234567890';
  Simbolos[4] := '���������龶����-+��߸������յ��졫�';

  for x := 1 to Length(Trim(value)) do
  begin
    if pos(copy(value, x, 1), Simbolos[1]) > 0 then
      Result := Result + copy(Simbolos[2], pos(copy(value, x, 1),
        Simbolos[1]), 1)

    else if pos(copy(value, x, 1), Simbolos[2]) > 0 then
      Result := Result + copy(Simbolos[1], pos(copy(value, x, 1),
        Simbolos[2]), 1)

    else if pos(copy(value, x, 1), Simbolos[3]) > 0 then
      Result := Result + copy(Simbolos[4], pos(copy(value, x, 1),
        Simbolos[3]), 1)

    else if pos(copy(value, x, 1), Simbolos[4]) > 0 then
      Result := Result + copy(Simbolos[3], pos(copy(value, x, 1),
        Simbolos[4]), 1);
  end;
end;

function TReg.Crypt(Action, Src: String): String;
Label Fim;
var
  KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key: String;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
  if (Src = '') Then
  begin
    Result := '';
    Goto Fim;
  end;
  Key := 'ASDFGQWERHJKLRTYUIOPZXMNCBVAASDSSPPOLK';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;

      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + copy(Src, 1, 2));
    // <--------------- adiciona o $ entra as aspas simples
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
      // <--------------- adiciona o $ entra as aspas simples
      if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result := Dest;
Fim:
end;

destructor TReg.destroy;
begin

  inherited;
end;

function TReg.getCodigo(value: string): iReg;
begin
  Result := self;
  if value = emptystr then
    raise Exception.create('Informe o c�digo de instala��o do sistema.');

  FCodigo := value;

end;

function TReg.getLiberacao(value: string): iReg;
begin
  Result := self;
  if value = emptystr then
    raise Exception.create('Informe a chave de libera��o do sistema!');

  FLiberar := value;

end;

function TReg.liberar: string;
var
  Key: TKey;
  Code: TCode;
  Modifier: Longint;
  d: TDateTime;
begin
  Key := EncryptionKey;
  Modifier := StringHashELF(FCodigo);
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  HexToBuffer(FLiberar, Code, SizeOf(Code));
  FDataVencimento := 'v�lido at�: ' + datetostr(GetExpirationDate(Key, Code));
  setDataVencimento;
  if IsRegCodeValid(Key, Code) then
  begin
    if IsRegCodeExpired(Key, Code) then
      Result := 'Registro Expirado'
    else
      Result := 'Registro Valido';
  end
  else
    Result := 'Registro Invalido';
end;

class function TReg.new: iReg;
begin
  Result := self.create;
end;

procedure TReg.registrar;
var
  Key: TKey;
  Code: TCode;
  Modifier: Longint;
  d, DataVencimento: TDateTime;
  cStatus: string;
begin

  Key := EncryptionKey;
  Modifier := StringHashELF(FCodigo);
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  HexToBuffer(FLiberar, Code, SizeOf(Code));
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
    Application.Terminate;
  end
  else
  begin
    { Inserir o c�digo para gravar as informa��es de registro do sistema }
  end;

end;

function TReg.setDataVencimento: string;
begin
  Result := FDataVencimento;
end;

end.

{ }
