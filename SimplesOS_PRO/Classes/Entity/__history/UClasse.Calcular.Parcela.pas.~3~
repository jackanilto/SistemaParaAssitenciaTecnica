unit UClasse.Calcular.Parcela;

interface

uses UInterfaces, UDados.Conexao, FireDAC.Comp.Client;

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
begin

end;

end.
