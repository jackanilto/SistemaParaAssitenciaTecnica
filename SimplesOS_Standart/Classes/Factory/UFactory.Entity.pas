unit UFactory.Entity;

interface

uses
  UInterfaces, UClasse.Entity, UDados.Conexao, UClasse.Entity.Table;

type

  TFactoryEntity = class(TInterfacedObject, iFactoryEntity)
  private
  public
    function entityTable: iFDTable;
    constructor create;
    destructor destroy; override;
    class function new: iFactoryEntity;
  end;

implementation

{ TFactoryEntity }

constructor TFactoryEntity.create;
begin

end;

destructor TFactoryEntity.destroy;
begin

  inherited;
end;

function TFactoryEntity.entityTable: iFDTable;
begin
  result := TEntityTable.new;
end;

class function TFactoryEntity.new: iFactoryEntity;
begin
  result := self.create;
end;

end.
