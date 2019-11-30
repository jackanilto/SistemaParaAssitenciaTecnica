unit UClasse.Adicionar.Itens.Ordem;

interface

uses UDados.Conexao, FireDAC.Comp.Client, Data.DB;

type
  TMyClass = class
  private
    FQueryLocalizarProdutos: TFDQuery;
    FQueryProdutosAdicionados: TFDQuery;
  public
  procedure listarProdutosParaAOrdem(value:tdatasource);
    constructor create;
    destructor destroy; override;
  end;

implementation

{ TMyClass }

constructor TMyClass.create;
begin

  FQueryLocalizarProdutos := TFDQuery.create(nil);
  FQueryLocalizarProdutos.Connection := DataModule1.Conexao;

  FQueryProdutosAdicionados := TFDQuery.create(nil);
  FQueryProdutosAdicionados.Connection := DataModule1.Conexao;

end;

destructor TMyClass.destroy;
begin
  FQueryLocalizarProdutos.Free;
  FQueryProdutosAdicionados.Free;
  inherited;
end;

procedure TMyClass.listarProdutosParaAOrdem(value: tdatasource);
begin

end;

end.
