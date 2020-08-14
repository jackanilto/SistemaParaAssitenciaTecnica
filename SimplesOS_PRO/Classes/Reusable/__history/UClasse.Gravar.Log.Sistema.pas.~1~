unit UClasse.Gravar.Log.Sistema;

interface

uses
  UInterfaces, UDados.Conexao, System.SysUtils,
  UClasse.Query, FireDAC.Comp.Client;

type

  TGravarLogSistema = class(TInterfacedObject, iGravarLogOperacoes)
  private
    FJanela: string;
    FOperacoes: string;
    FNomeRegistro: string;
    FCodigoRegistro: string;
    FCodigoFuncionario: string;
    FConexaoQuery:TFDQuery;
  public
    function getJanela(value: string): iGravarLogOperacoes;
    function getOperacao(value: string): iGravarLogOperacoes;
    function getNomeRegistro(value: string): iGravarLogOperacoes;
    function getCodigoRegistro(value: integer): iGravarLogOperacoes;
    function getCodigoFuncionario(value: integer): iGravarLogOperacoes;
    function gravarLog: iGravarLogOperacoes;
    constructor create;
    destructor destroy; override;
    class function new: iGravarLogOperacoes;
  end;

implementation

{ TGravarLogSistema }

constructor TGravarLogSistema.create;
begin
  //implementar a criação da query
end;

destructor TGravarLogSistema.destroy;
begin

  inherited;
end;

function TGravarLogSistema.getCodigoFuncionario(value: integer)
  : iGravarLogOperacoes;
begin

  result := self;
  if value = 0 then
    raise Exception.create('É necessário o código do usuário.');

  FCodigoFuncionario := value.ToString;

end;

function TGravarLogSistema.getCodigoRegistro(value: integer)
  : iGravarLogOperacoes;
begin

  result := self;

  FCodigoRegistro := value.ToString;

end;

function TGravarLogSistema.getJanela(value: string): iGravarLogOperacoes;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create
      ('Informe a janela em que esta ocorrendo a operação.');

  FJanela := value;

end;

function TGravarLogSistema.getNomeRegistro(value: string): iGravarLogOperacoes;
begin

  result := self;
  FNomeRegistro := value;

end;

function TGravarLogSistema.getOperacao(value: string): iGravarLogOperacoes;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create('Informe qual operação em andamento.');

  FOperacoes := value;

end;

function TGravarLogSistema.gravarLog: iGravarLogOperacoes;
begin
 {criar o processo para gravar os logs no sistema}
end;

class function TGravarLogSistema.new: iGravarLogOperacoes;
begin
  result := self.create;
end;

end.
