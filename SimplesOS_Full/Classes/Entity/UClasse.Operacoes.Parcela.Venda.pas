unit UClasse.Operacoes.Parcela.Venda;

interface

uses
  FireDAC.Comp.Client;

Type
  TOperacoesParcelaVenda = class
  private
       F_Query:TFDQuery;
  public

  function query:TFDQuery;
  procedure quitarParcela;
  procedure estornarParcela;
  procedure editarParcela;
  procedure excluirParcela;

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TOperacoesParcelaVenda }

constructor TOperacoesParcelaVenda.create;
begin

end;

destructor TOperacoesParcelaVenda.destroy;
begin

  inherited;
end;

end.
