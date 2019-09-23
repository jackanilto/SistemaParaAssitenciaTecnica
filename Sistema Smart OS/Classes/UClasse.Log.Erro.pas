unit UClasse.Log.Erro;

interface

uses Interfaces, SysUtils, System.Classes;

type
  TLogErro = class(TInterfacedObject, iLogErro)

  private
    FLogFile: String;
  public
    function logErro(erro, tela, botao:string): iLogErro;
    constructor create;
    destructor destroy; override;
    class function new: iLogErro;

  end;

implementation

{ TLogErro }

constructor TLogErro.create;
begin
   FLogFile := ChangeFileExt(ParamStr(0), '.log');
end;

destructor TLogErro.destroy;
begin

  inherited;
end;

function TLogErro.logErro(erro, tela, botao:string): iLogErro;
var
  txtLog: TextFile;
begin
  AssignFile(txtLog, FLogFile);
  if FileExists(FLogFile) then
    Append(txtLog)
  else
    Rewrite(txtLog);
  Writeln(txtLog, FormatDateTime('dd/mm/YY hh:nn:ss - ', Now) +'Erro'+ erro+' Janela '+'Bot�o '+botao);
  CloseFile(txtLog);
end;

class function TLogErro.new: iLogErro;
begin
  result := self.create;
end;

end.
