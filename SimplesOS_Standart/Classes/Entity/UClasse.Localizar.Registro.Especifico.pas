unit UClasse.Localizar.Registro.Especifico;

interface

uses UInterfaces, FireDAC.Comp.Client, UDados.Conexao, System.SysUtils,
  Vcl.Dialogs;

type
  TClassLocalizarRegistro = class(TInterfacedObject,
    iLocalizarRegistroEspecifico)
  private
    FQuery: TFDQuery;
    FCampoRetorno: string;
    FTabela: string;
  public

    function getTabela(value: string): iLocalizarRegistroEspecifico;
    function getCampoRetorno(value: string): iLocalizarRegistroEspecifico;

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
  FQuery := TFDQuery.create(nil);
  FQuery.Connection := DataModule1.Conexao;
end;

destructor TClassLocalizarRegistro.destroy;
begin
  FQuery.Free;
  inherited;
end;

function TClassLocalizarRegistro.getCampoRetorno(value: string)
  : iLocalizarRegistroEspecifico;
begin

  result := self;

  if value = emptystr then
    raise Exception.create('Informe o campo de retorno para a opera��o.');

  FCampoRetorno := value;

end;

function TClassLocalizarRegistro.getTabela(value: string)
  : iLocalizarRegistroEspecifico;
begin
  result := self;
  FTabela := value;
end;

function TClassLocalizarRegistro.localizarRegistro(campo,
  valor: string): string;
begin

  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from ' + FTabela + ' where ' + campo + ' =:v');
  FQuery.ParamByName('v').AsString := valor;
  FQuery.Active := true;

  result := FQuery.FieldByName(FCampoRetorno).AsString;

end;

function TClassLocalizarRegistro.localizarRegistro(campo: string;
  valor: integer): string;
begin

  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from ' + FTabela + ' where ' + campo + ' =:v');
  FQuery.ParamByName('v').AsInteger := valor;
  FQuery.Active := true;

  result := FQuery.FieldByName(FCampoRetorno).AsString;

end;

class function TClassLocalizarRegistro.new: iLocalizarRegistroEspecifico;
begin
  result := self.create;
end;

end.
