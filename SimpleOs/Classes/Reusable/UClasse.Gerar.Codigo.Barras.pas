unit UClasse.Gerar.Codigo.Barras;

interface

uses
  UInterfaces, Vcl.Graphics, System.Types, System.SysUtils;

type

  TClasseGerarCodigoBarras = class(TInterfacedObject, iGerarCodigoBarras)
  private
  var
    FNumero: string;
  public
    function GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas)
      : iGerarCodigoBarras;
    function DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas)
      : iGerarCodigoBarras;
    Function EAN13(CodigoDeBarras: String): string;
    function exibirCodigo: string;
    constructor create;
    destructor destroy; override;
    class function new: iGerarCodigoBarras;
  end;

implementation

{ TClasseGerarCodigoBarras }

constructor TClasseGerarCodigoBarras.create;
begin

end;

function TClasseGerarCodigoBarras.DesenhaBarras(SequenciaHexa: string;
  Imagem: TCanvas): iGerarCodigoBarras;
var
  X, Y, H: LongInt;
  A, B, C, D: TPoint;
  i: Boolean;
begin

  result := self;

  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  X := 10;
  i := True;
  for Y := 1 to Length(SequenciaHexa) do
  begin
    if SequenciaHexa[Y] = '0' then
      Imagem.Pen.Color := ClWhite
    else
      Imagem.Pen.Color := ClBlack;
    H := 1;
    A.X := X;
    A.Y := 0;
    B.X := X;
    B.Y := 50;
    C.X := X + H - 1;
    C.Y := 50;
    D.X := X + H - 1;
    D.Y := 0;
    case Y of
      1 .. 3, 46 .. 50, 93 .. 95:
        begin
          B.Y := 55;
          C.Y := 55;
        end;
    end;
    Imagem.Polygon([A, B, C, D]);
    i := not(i);
    X := X + H;
  end;

end;

destructor TClasseGerarCodigoBarras.destroy;
begin

  inherited;
end;

function TClasseGerarCodigoBarras.EAN13(CodigoDeBarras: String): String;
var
  nX: integer;
  nPeso: integer;
  nSoma: Double;
  nMaior: Double;
  nDigito: integer;
Begin

  nPeso := 3;
  nSoma := 0;

  For nX := 12 DownTo 1 do
  Begin

    nSoma := nSoma + StrToInt(CodigoDeBarras[nX]) * nPeso;

    If nPeso = 3 Then
      nPeso := 1
    Else
      nPeso := 3;

  End;

  nMaior := ((Trunc(nSoma / 10) + 1) * 10);
  nDigito := Trunc(nMaior) - Trunc(nSoma);
  If nDigito = 10 Then
    nDigito := 0;
  result := inttostr(nDigito);
End;

function TClasseGerarCodigoBarras.exibirCodigo: string;
var
  numero: string;
  digito: string;
  i: integer;
begin

  for i := 1 to 12 do
  begin
    numero := numero + inttostr(Random(9));
  end;

  digito := numero;

  numero := numero + EAN13(digito);

  result := numero;

end;

function TClasseGerarCodigoBarras.GeraBarrasEAN13(CodBarras: string;
  Imagem: TCanvas): iGerarCodigoBarras;
const
  TabelaA: array [0 .. 9] of string[7] = ('0001101', '0011001', '0010011',
    '0111101', '0100011', '0110001', '0101111', '0111011', '0110111',
    '0001011');
  TabelaB: array [0 .. 9] of string[7] = ('0100111', '0110011', '0011011',
    '0011011', '0011101', '0111001', '0000101', '0010001', '0001001',
    '0010111');
  TabelaC: array [0 .. 9] of string[7] = ('1110010', '1100110', '1101100',
    '1000010', '1011100', '1001110', '1010000', '1000100', '1001000',
    '1110100');
  TabAux: array [0 .. 9] of string[6] = ('AAAAAA', 'AABABB', 'AABBAB', 'AABBBA',
    'ABAABB', 'ABBAAB', 'ABBBAA', 'ABABAB', 'ABABBA', 'ABBABA');
var
  Codigo: string;
  Formato: string;
  PegaDaTabela: string;
  DecimoTerceiroDig: Byte;
  Cont: Byte;
begin
  Formato := '';
  Codigo := CodBarras;
  DecimoTerceiroDig := StrToIntDef(CodBarras[1], 0);
  { ---------------------------------------------------------------------------- }
  { Tendo o 13� d�gito definido, posso definir o padr�o de impress�o das barras }
  { no primeiro conjunto de 6 d�gitos baseado na tabela Auxiliar. }
  { ---------------------------------------------------------------------------- }
  PegaDaTabela := TabAux[DecimoTerceiroDig] + 'CCCCCC';
  Formato := Formato + '101'; // --> Barra Auxiliar de Guarda 'Esquerda'
  for Cont := 1 to Length(PegaDaTabela) do
  begin

    case PegaDaTabela[Cont] of
      'A':
        Formato := Formato + TabelaA[StrToInt(Codigo[Cont + 1])];
      'B':
        Formato := Formato + TabelaB[StrToInt(Codigo[Cont + 1])];
      'C':
        Formato := Formato + TabelaC[StrToInt(Codigo[Cont + 1])];
    end;

    if Cont = 6 then
      Formato := Formato + '01010'; // --> Barra Auxiliar de Guarda 'Central'

  end;
  Formato := Formato + '101'; // --> Barra Auxiliar de Guarda 'Direita'

  // ------ Desenha o c�digo alfa-num�rico na imagem
  Imagem.Font.Size := 10;
  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  Imagem.TextOut(02, 51, Copy(CodBarras, 01, 01));
  Imagem.TextOut(13, 51, Copy(CodBarras, 02, 06));
  Imagem.TextOut(60, 51, Copy(CodBarras, 08, 06));
  // ------ Desenha as barras na imagem
  DesenhaBarras(Formato, Imagem);
end;

class function TClasseGerarCodigoBarras.new: iGerarCodigoBarras;
begin
  result := self.create;
end;

end.
