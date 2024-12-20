﻿unit UClasse.DiasMeses;

interface

type

  TCalcularDiaMeses = class
  private
  public
    function DiaEmMes(DataVenc: TDateTime; DataAtual: TDateTime): String;
    function DifDias(DataVenc: TDateTime; DataAtual: TDateTime): String;
    function DifDiasMeses(DataVenc: TDateTime; DataAtual: TDateTime): Integer;
  end;

implementation

uses
  System.SysUtils, Vcl.Forms, Vcl.Dialogs;

function TCalcularDiaMeses.DiaEmMes(DataVenc: TDateTime;
  DataAtual: TDateTime): String;
Var // calcula os dias e depois converte em meses
  data: TDateTime;
  dia, mes, ano: Word;
  datadia: string;
  testaData, posicao: Integer;
begin
  if DataAtual < DataVenc then
  begin
    Result := 'A data data atual não pode ser menor que a data inicial';
  end
  else
  begin
    data := DataAtual - DataVenc;
    DecodeDate(data, ano, mes, dia);
    datadia := FloatToStr(data / 30);
  end;

  if copy(datadia, 1, 1) <> '0' then
  begin
    posicao := pos(',', datadia);
    Result := copy(datadia, 1, posicao - 1);
  end;

end;

function TCalcularDiaMeses.DifDias(DataVenc: TDateTime;
  DataAtual: TDateTime): String;
Var // calcula os dias
  data: TDateTime;
  dia, mes, ano: Word;
begin
  if DataAtual < DataVenc then
  begin
    Result := 'A data data atual n�o pode ser menor que a data inicial';
  end
  else
  begin
    data := DataAtual - DataVenc;
    DecodeDate(data, ano, mes, dia);
    Result := FloatToStr(data);
  end;
end;

function TCalcularDiaMeses.DifDiasMeses(DataVenc: TDateTime;
  DataAtual: TDateTime): Integer;
Var // calcula os dias
  data: TDateTime;
  dia, mes, ano: Word;
  resultado: Integer;
begin
  if DataAtual < DataVenc then
  begin
    raise Exception.Create
      ('A data data atual não pode ser menor que a data inicial');
    resultado := 0;
  end
  else
  begin
    data := DataAtual - DataVenc;
    DecodeDate(data, ano, mes, dia);
    Result := Trunc(data / 30);

  end;

end;

end.
