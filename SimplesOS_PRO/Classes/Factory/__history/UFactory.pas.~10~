unit UFactory;

interface

uses UInterfaces, UClasse.Criar.Janela, UClasse.Validar.Documento,
  UClasse.Calcular.Juros;

type
  TFactory = class(TInterfacedObject, iFactory)

  private
  public
    function obertValorPorExtenso: iObterValorPorExtenso;
    function oberterDataHoraPorExtenso: iObterDataHoraPorExtenso;
    function CalcularJuros: iCalcularJuros;
    function criarJanela: iCriarJanelas;
    function validarDocumento: iValidarDocumento;
    function gerarCodigoEan13: iGerarCodigoBarras;
    constructor create;
    destructor destroy; override;
    class function new: iFactory;

  end;

implementation

{ TFactory }

uses UClasse.Gerar.Codigo.Barras;

function TFactory.CalcularJuros: iCalcularJuros;
begin
  result := TCalcularJuros.new;
end;

constructor TFactory.create;
begin

end;

function TFactory.criarJanela: iCriarJanelas;
begin
  result := TCriarJanela.new;
end;

destructor TFactory.destroy;
begin

  inherited;
end;

function TFactory.gerarCodigoEan13: iGerarCodigoBarras;
begin
  result := TClasseGerarCodigoBarras.new;
end;

class function TFactory.new: iFactory;
begin
  result := self.create;
end;

function TFactory.oberterDataHoraPorExtenso: iObterDataHoraPorExtenso;
begin
  // result := self;
end;

function TFactory.obertValorPorExtenso: iObterValorPorExtenso;
begin
  // result := self;
end;

function TFactory.validarDocumento: iValidarDocumento;
begin
  result := TValidarDocumento.new;
end;

end.
