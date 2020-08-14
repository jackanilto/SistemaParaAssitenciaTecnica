unit UFactory;

interface

uses UInterfaces, UClasse.Criar.Janela, UClasse.Validar.Documento,
  UClasse.Calcular.Juros, UClasse.Cript.password, UClasse.Entity.Table,
  UClasse.Query, UClasse.Localizar.Registro.Especifico,
  UClasse.Calcular.Parcela;

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
    function FClassQuery: iConexaoQuery;
    function criptPass: iCriptPasss;
    function ftTable: iFDTable;
    function CalcJuros<T>: iCalcularJuros;
    function localizarRegistroEspecifico: iLocalizarRegistroEspecifico;
    function calcularParcela: iCalcularParcelas;
    constructor create;
    destructor destroy; override;
    class function new: iFactory;

  end;

implementation

{ TFactory }

uses UClasse.Gerar.Codigo.Barras;

function TFactory.CalcJuros<T>: iCalcularJuros;
begin

end;

function TFactory.CalcularJuros: iCalcularJuros;
begin
  result := TCalcularJuros.new;
end;

function TFactory.calcularParcela: iCalcularParcelas;
begin
  result := TCalcularParcela.new;
end;

constructor TFactory.create;
begin

end;

function TFactory.criarJanela: iCriarJanelas;
begin
  result := TCriarJanela.new;
end;

function TFactory.criptPass: iCriptPasss;
begin
  result := TCriptPass.new;
end;

destructor TFactory.destroy;
begin

  inherited;
end;

function TFactory.FClassQuery: iConexaoQuery;
begin
  result := TConexaoQuery.new;
end;

function TFactory.ftTable: iFDTable;
begin
  result := TEntityTable.new;
end;

function TFactory.gerarCodigoEan13: iGerarCodigoBarras;
begin
  result := TClasseGerarCodigoBarras.new;
end;

function TFactory.localizarRegistroEspecifico: iLocalizarRegistroEspecifico;
begin
  result := TClassLocalizarRegistro.new;
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
