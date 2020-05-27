unit UClasse.Obter.Data.Hora.PorExtenso;

interface

Uses UInterface.Conexao.Query, System.SysUtils, UClasse.ObertValorPorExtenso;

type
  TExtrairDiaData = class(TInterfacedObject, iObterDataHoraPorExtenso)
  private
    FVvalorPorExtenso: iObterValorPorExtenso;
  public
    function dia(Data: string): string;
    function mes(Data: string): string;
    function ano(Data: string): string;
    function dataPorExtenso(Data: tdate): string;
    function dataTexto(Data: tdate): string;
    function horaTexto(Hora: TTime): string;
    constructor create;
    destructor destroy; override;
    class function new: iObterDataHoraPorExtenso;
  end;

implementation

{ TExtrairDiaData }

function TExtrairDiaData.ano(Data: string): string;
var
  ano: string;
begin

  ano := formatdatetime('yyyy', strtodatetime(Data));

  Result := ano;
end;

constructor TExtrairDiaData.create;
begin
  FVvalorPorExtenso := TObertValorPorExtenco.new;
end;

function TExtrairDiaData.dataPorExtenso(Data: tdate): string;
var
  dias, meses, ano1: string;
  mesExtenso, diaExtenso: string;
  mesInteiro: Integer;
begin
  dias := dia(DateToStr(Data));
  meses := mes(DateToStr(Data));
  ano1 := ano(DateToStr(Data));

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

  diaExtenso := FVvalorPorExtenso.ValorPorExtenso(StrToFloat(dias));

  Result := '(' + diaExtenso + ') de ' + mesExtenso + ' de ' + ano1;

end;

function TExtrairDiaData.dataTexto(Data: tdate): string;
var // data no formato ddmmyyyy
  dias, meses, ano1: string;
begin
  dias := dia(DateToStr(Data));
  meses := mes(DateToStr(Data));
  ano1 := ano(DateToStr(Data));

  Result := dias + meses + ano1;

end;

destructor TExtrairDiaData.destroy;
begin

  inherited;
end;

function TExtrairDiaData.dia(Data: string): string;
var
  dia: string;
begin
  dia := formatdatetime('dd', strtodatetime(Data));

  Result := dia;
end;

function TExtrairDiaData.horaTexto(Hora: TTime): string;
var
  texto: string;
begin

  texto := Copy(TimeToStr(Hora), 1, 2) + Copy(TimeToStr(Hora), 4, 2) +
    Copy(TimeToStr(Hora), 7, 2);
  Result := texto;

end;

function TExtrairDiaData.mes(Data: string): string;
var
  mes: string;
begin

  mes := formatdatetime('mm', strtodatetime(Data));

  Result := mes;
end;

class function TExtrairDiaData.new: iObterDataHoraPorExtenso;
begin
  Result := self.create;
end;

end.
