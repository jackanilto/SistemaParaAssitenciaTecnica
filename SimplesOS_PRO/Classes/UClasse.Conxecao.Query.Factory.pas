unit UClasse.Conxecao.Query.Factory;

interface

uses UClasse.Conxecao.Query, UInterface.Conexao.Query;

type

  TConexaoQueryFactory = class(TInterfacedObject, iFactoryConexaoQuery)
  private
  public
    function conexaoQuery: iConexaoQuery;
    constructor create;
    destructor destroy; override;
    class function new: iFactoryConexaoQuery;
  end;

implementation

{ TConexaoQueryFactory }

function TConexaoQueryFactory.conexaoQuery: iConexaoQuery;
begin
  result := TConexaoQuery.new;
end;

constructor TConexaoQueryFactory.create;
begin

end;

destructor TConexaoQueryFactory.destroy;
begin
  inherited;
end;

class function TConexaoQueryFactory.new: iFactoryConexaoQuery;
begin
  result := self.create;
end;

end.
