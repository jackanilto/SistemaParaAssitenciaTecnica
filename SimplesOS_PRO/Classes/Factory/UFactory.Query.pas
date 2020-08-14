unit UFactory.Query;

interface

uses
  UInterfaces, UDados.Conexao, UClasse.Query;

type

  TFactoryQuery<T> = class(TInterfacedObject, iFactoryQuery<T>)
  private
  public
  function queryTable:iConexaoQuery;
    constructor create;
    destructor destroy; override;
    class function new: iFactoryQuery<T>;
  end;

implementation

{ TFactoryQuery }

constructor TFactoryQuery<T>.create;
begin

end;



destructor TFactoryQuery<T>.destroy;
begin

  inherited;
end;

class function TFactoryQuery<T>.new: iFactoryQuery<T>;
begin
  result := self.create;
end;

function TFactoryQuery<T>.queryTable: iConexaoQuery;
begin
    result := TConexaoQuery.new;
end;

end.
