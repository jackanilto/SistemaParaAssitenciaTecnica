unit UClasse.Localizar.Registro.Especifico;

interface

uses UInterfaces;

type
  TClassLocalizarRegistro = class(TInterfacedObject,
    iLocalizarRegistroEspecifico)
  private
  public
    function localizarRegistro(campo: string; valor: integer): string; overload;
    function localizarRegistro(campo: string; valor: string): string; overload;

    constructor create;
    destructor destroy; override;
    class function new: iLocalizarRegistroEspecifico;
  end;

implementation

{ TClassLocalizarRegistro }

constructor TClassLocalizarRegistro.create;
begin

end;

destructor TClassLocalizarRegistro.destroy;
begin

  inherited;
end;

function TClassLocalizarRegistro.localizarRegistro(campo,
  valor: string): string;
begin
   result := '';
end;

function TClassLocalizarRegistro.localizarRegistro(campo: string;
  valor: integer): string;
begin
  result := '';
end;

class function TClassLocalizarRegistro.new: iLocalizarRegistroEspecifico;
begin
  result := self.create;
end;

end.
