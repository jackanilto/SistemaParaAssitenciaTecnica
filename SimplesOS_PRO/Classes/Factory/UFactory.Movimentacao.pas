unit UFactory.Movimentacao;

interface

uses
  UInterfaces, UClasse.Relatorio.Movimentacao.OS;

Type
  TFactoryMovimentacao = class(TInterfacedObject, iFactoryMovimentacao)
  private
  public

    function movimentacaoOS: iRelatorioMovimentacaoOS;
    function movimentacaoVenda: iRelatorioMovimentacaoVenda;
    function movimentacaoRetiradas: iRelatorioMovimentacaoRetiradas;
    function movimentacaoContas: iRelatorioMovimentacaoContas;
    function movimentacaoCaixa: iRelatorioMovimentacaoCaixa;

    constructor create;
    destructor destroy; override;
    class function new: iFactoryMovimentacao;

  end;

implementation

{ TFactoryMovimentacao }

constructor TFactoryMovimentacao.create;
begin

end;

destructor TFactoryMovimentacao.destroy;
begin

  inherited;
end;

function TFactoryMovimentacao.movimentacaoCaixa: iRelatorioMovimentacaoCaixa;
begin

end;

function TFactoryMovimentacao.movimentacaoContas: iRelatorioMovimentacaoContas;
begin

end;

function TFactoryMovimentacao.movimentacaoOS: iRelatorioMovimentacaoOS;
begin
  result := TRelatorioMovimentacaoOS.new;
end;

function TFactoryMovimentacao.movimentacaoRetiradas: iRelatorioMovimentacaoRetiradas;
begin

end;

function TFactoryMovimentacao.movimentacaoVenda: iRelatorioMovimentacaoVenda;
begin

end;

class function TFactoryMovimentacao.new: iFactoryMovimentacao;
begin
  result := self.create;
end;

end.
