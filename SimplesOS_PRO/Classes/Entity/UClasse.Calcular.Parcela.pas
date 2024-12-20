unit UClasse.Calcular.Parcela;

interface

uses UInterfaces, UDados.Conexao, FireDAC.Comp.Client, System.SysUtils;

type
  TCalcularParcela = class(TInterfacedObject, iCalcularParcelas)
  private

    FValor: Currency;
    FNumeroParcela: Integer;
    FQuery: TFDQuery;

  public

    function getvalor(value: Currency): iCalcularParcelas;
    function getNumeroParcelas(value: Integer): iCalcularParcelas;
    function valorDeCadaParcela: Currency;

    constructor create;
    destructor destroy; override;
    class function new: iCalcularParcelas;
  end;

implementation

{ TCalcularParcela }

constructor TCalcularParcela.create;
begin
  FQuery := TFDQuery.create(nil);
  FQuery.Connection := DataModule1.Conexao;
end;

destructor TCalcularParcela.destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TCalcularParcela.getNumeroParcelas(value: Integer): iCalcularParcelas;
begin
  result := self;
  FNumeroParcela := value;
end;

function TCalcularParcela.getvalor(value: Currency): iCalcularParcelas;
begin
  result := self;
  FValor := value;
end;

class function TCalcularParcela.new: iCalcularParcelas;
begin
  result := self.create;
end;

function TCalcularParcela.valorDeCadaParcela: Currency;
var
  valorDaParcela: Currency;
  Fjuros: Real;
  valorParceladoComJuros: Currency;
begin

  result := 0;

  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from NUMERO_PARCELAS where NUM_PARCELAS =:n');
  FQuery.ParamByName('n').AsInteger := FNumeroParcela;
  FQuery.Active := true;

  if FQuery.RecordCount >= 1 then
  begin

    valorDaParcela := FValor / FNumeroParcela;
    Fjuros := FQuery.FieldByName('JUROS').AsFloat;

    valorParceladoComJuros := valorDaParcela * (Fjuros / 100);
    result := valorDaParcela + valorParceladoComJuros;

  end
  else
    result := FValor / FNumeroParcela;

end;

end.
