unit UClasse.Calcular.Juros;

interface

uses Interfaces, math;

type
  TCalcularJuros = class(TInterfacedObject, iCalcularJuros)
  private
    FPeriodo: Integer;
    FJuros: Real;
    FCapital: Real;
  public
    constructor create;
    destructor destroy; override;
    class function new: iCalcularJuros;
    function calcularJurosSimplesPorPeriodo: Real;
    function calcularJurosCompostos: Real;
    function CalcularJuros: Real;
    function getPeriodo(value: Integer): iCalcularJuros;
    function getJuros(value: Real): iCalcularJuros;
    function getCapital(value: Real): iCalcularJuros;
    function percentualDeDesconto(valor, percentualACalular: Real): Real;
  end;

implementation

{ TModelosProdutos }

function TCalcularJuros.CalcularJuros: Real;
var
  total: Real;
begin
  total := FCapital * (FJuros / 100);
  result := FCapital + total;
end;

function TCalcularJuros.calcularJurosCompostos: Real;
begin
  result := FCapital / ((1 - Power(1 + (FJuros / 100), -1 * FPeriodo)) /
    (FJuros / 100));
end;

function TCalcularJuros.calcularJurosSimplesPorPeriodo: Real;
var
  total: Real;
begin
  total := FCapital * (FJuros / 100);
  result := FCapital + (total * FPeriodo);
end;

constructor TCalcularJuros.create;
begin

end;

destructor TCalcularJuros.destroy;
begin

  inherited;
end;

function TCalcularJuros.getCapital(value: Real): iCalcularJuros;
begin
  result := self;
  FCapital := value;
end;

function TCalcularJuros.getJuros(value: Real): iCalcularJuros;
begin
  result := self;
  FJuros := value;
end;

function TCalcularJuros.getPeriodo(value: Integer): iCalcularJuros;
begin
  result := self;
  FPeriodo := value;
end;

class function TCalcularJuros.new: iCalcularJuros;
begin
  result := self.create;
end;

function TCalcularJuros.percentualDeDesconto(valor, percentualACalular
  : Real): Real;
begin
  result := (percentualACalular / valor) * 100;
end;

end.


