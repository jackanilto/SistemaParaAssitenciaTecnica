unit UClasse.Config.Acesso.Banco;

interface

uses
  UClasse.Config.Conexao;

Type
  TMyClass = class(TClasseConexaoConfig)
  private
  public

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TMyClass }

constructor TMyClass.create;
begin

end;

destructor TMyClass.destroy;
begin

  inherited;
end;

end.
