unit UClasse.Validar.Documento;

interface

uses
  UInterfaces, System.SysUtils;

type
  TValidarDocumento = class(TInterfacedObject, iValidarDocumento)

  private
    function validarCPF(value: string): boolean;
    function validarCNPJ(value: string): boolean;
    function limparDocumento(value: string; cartacterRemove: string): string;

  var
    FDocumento: string;
  public
    function getDocumento(value: String): boolean;
    constructor create;
    destructor destroy; override;
    class function new: iValidarDocumento;

  end;

implementation

{ TValidarDocumento }

constructor TValidarDocumento.create;
begin

end;

destructor TValidarDocumento.destroy;
begin

  inherited;
end;

function TValidarDocumento.getDocumento(value: String): boolean;
var
  texto: string;
begin
  result := false;

  texto := value;

  texto := limparDocumento(texto, '/');
  texto := limparDocumento(texto, '-');
  texto := limparDocumento(texto, '.');
  texto := limparDocumento(texto, ',');
  texto := limparDocumento(texto, '\');

  if Length(texto) = 11 then
    result := validarCPF(texto)
  else if Length(texto) = 14 then
    result := validarCNPJ(texto)
  else
    result := false;

end;

function TValidarDocumento.limparDocumento(value: string;
  cartacterRemove: string): string;
var
  i: Integer;
begin
  result := '';
  if value = '' then
    exit;
  for i := 1 to Length(value) do
    if Pos(value[i], cartacterRemove) = 0 then
      result := result + value[i];
end;

class function TValidarDocumento.new: iValidarDocumento;
begin
  result := self.create;
end;

function TValidarDocumento.validarCNPJ(value: string): boolean;
var
  dig13, dig14: string;
  sm, i, r, peso: Integer;
begin
  if ((value = '00000000000000') or (value = '11111111111111') or
    (value = '22222222222222') or (value = '33333333333333') or
    (value = '44444444444444') or (value = '55555555555555') or
    (value = '66666666666666') or (value = '7777777777777') or
    (value = '88888888888888') or (value = '99999999999999') or
    (Length(value) <> 14)) then
  begin
    result := false;
    exit;
  end;
  try
    { *-- cáculo do 10. Digito--* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
      sm := sm + (strtoint(value[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11 - r): 1, dig13); // conversao em caractere númericos

    { *--cácula o segundo digito--* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (strtoint(value[i]) * peso);
      peso := peso + 1;
      if peso = 10 then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig14 := '0'
    else
      str((11 - r): 1, dig14);

    { verifica se os digigitos informados conferem com o resultado }

    if ((dig13 = value[13]) and (dig14 = value[14])) then
      result := true
    else
      result := false
  except
    result := false;
  end;
end;

function TValidarDocumento.validarCPF(value: string): boolean;
var
  dig10, dig11: string;
  s, i, r, peso: Integer;
begin
  if ((value = '00000000000') or (value = '11111111111') or
    (value = '22222222222') or (value = '33333333333') or
    (value = '44444444444') or (value = '55555555555') or
    (value = '66666666666') or (value = '77777777777') or
    (value = '88888888888') or (value = '99999999999') or (Length(value) <> 11))
  then
  begin
    result := false;
    exit;
  end;
  try
    { *-- cáculo do 10. Digito--* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
      s := s + (strtoint(value[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r: 1, dig10); // conversao em caractere númericos

    { *--cácula o segundo digito--* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (strtoint(value[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r: 1, dig11);

    { verifica se os digigitos informados conferem com o resultado }

    if ((dig10 = value[10]) and (dig11 = value[11])) then
      result := true
    else
      result := false
  except
    result := false;
  end;
end;

end.
