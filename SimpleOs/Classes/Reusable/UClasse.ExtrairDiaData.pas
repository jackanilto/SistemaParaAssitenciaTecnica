unit UClasse.ExtrairDiaData;

interface

uses sysUtils, UInterfaces, UClasse.ObertValorPorExtenso;

type
  TExtrairDiaData = class(TInterfacedObject, iExtrairDiaData)
  private
    FValorExtenso: iObterValorPorExtenso;
  public
    function dia(data: string): string;
    function mes(data: string): string;
    function ano(data: string): string;
    function dataPorExtenso(data: tdate): string;
    function dataTexto(data: tdate): string;
    function horaTexto(hora: TTime): string;
    constructor create;
    destructor destroy; override;
    class function new: iExtrairDiaData;
  end;

implementation

{ TExtrairDiaData }

function TExtrairDiaData.ano(data: string): string;
var
  ano: string;
begin

  ano := formatdatetime('yyyy', strtodatetime(data));

  Result := ano;
end;

constructor TExtrairDiaData.create;
begin
  FValorExtenso := TObertValorPorExtenco.new;
end;

function TExtrairDiaData.dataPorExtenso(data: tdate): string;
var
  dias, meses, ano1: string;
  mesExtenso, diaExtenso: string;
  mesInteiro: Integer;
begin
  dias := dia(DateToStr(data));
  meses := mes(DateToStr(data));
  ano1 := ano(DateToStr(data));

  mesInteiro := StrToInt(meses);

  case mesInteiro of
    1:
      mesExtenso := 'Janeiro';
    2:
      mesExtenso := 'Fevereiro';
    3:
      mesExtenso := 'Mar�o';
    4:
      mesExtenso := 'Abril';
    5:
      mesExtenso := 'Maio';
    6:
      mesExtenso := 'Junho';
    7:
      mesExtenso := 'Julho';
    8:
      mesExtenso := 'Agosto';
    9:
      mesExtenso := 'Setembro';
    10:
      mesExtenso := 'Outubro';
    11:
      mesExtenso := 'Novembro';
    12:
      mesExtenso := 'Dezembro';
  end;

  diaExtenso := FValorExtenso.ValorPorExtenso(StrToFloat(dias));

  Result := '(' + diaExtenso + ') de ' + mesExtenso + ' de ' + ano1;

end;

function TExtrairDiaData.dataTexto(data: tdate): string;
var // data no formato ddmmyyyy
  dias, meses, ano1: string;
begin
  dias := dia(DateToStr(data));
  meses := mes(DateToStr(data));
  ano1 := ano(DateToStr(data));

  Result := dias + meses + ano1;

end;

destructor TExtrairDiaData.destroy;
begin

  inherited;
end;

function TExtrairDiaData.dia(data: string): string;
var
  dia: string;
begin
  dia := formatdatetime('dd', strtodatetime(data));

  Result := dia;
end;

function TExtrairDiaData.horaTexto(hora: TTime): string;
var
  texto: string;
begin

  texto := Copy(TimeToStr(hora), 1, 2) + Copy(TimeToStr(hora), 4, 2) +
    Copy(TimeToStr(hora), 7, 2);
  Result := texto;

end;

function TExtrairDiaData.mes(data: string): string;
var
  mes: string;
begin

  mes := formatdatetime('mm', strtodatetime(data));

  Result := mes;
end;

class function TExtrairDiaData.new: iExtrairDiaData;
begin
  Result := self.create;
end;

end.
