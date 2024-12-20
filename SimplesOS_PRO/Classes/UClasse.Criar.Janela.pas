unit UClasse.Criar.Janela;

interface

uses UInterfaces, Vcl.Forms, System.SysUtils,
  FireDAC.Comp.Client, UDados.Conexao, Vcl.Dialogs;

type

  TCriarJanela = class(TInterfacedObject, iCriarJanelas)
  private
    FQuery: TFDQuery;
    function permitirAcesso(value: string): boolean;
  public
    function formShow(form: TForm; nomeForm: string): iCriarJanelas;
    function verificarPermisao(value:string):iCriarJanelas;
    constructor create;
    destructor destroy; override;
    class function new: iCriarJanelas;
  end;

implementation

{ TCriarJanela }

constructor TCriarJanela.create;
begin
  FQuery := TFDQuery.create(nil);
  FQuery.Connection := DataModule1.Conexao;
end;

destructor TCriarJanela.destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TCriarJanela.formShow(form: TForm; nomeForm: string): iCriarJanelas;
begin

  try
    if permitirAcesso(nomeForm) = true then
    begin
      form.ShowModal;
    end
    else
    begin
      raise Exception.create('Voc� n�o possui acesso a este recurso.');
    end;
  finally
    FreeAndNil(form);
  end;

end;

class function TCriarJanela.new: iCriarJanelas;
begin
  result := self.create;
end;

function TCriarJanela.permitirAcesso(value: string): boolean;
begin

  result := true;

  with DataModule1 do
  begin

    FQuery.Active := false;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('select * from RECURSOS where ID_FUNCIONARIO =:F and ' +
      value + ' =:valor');
    FQuery.ParamByName('F').AsString := funcionarioLogado.ToString;
    FQuery.ParamByName('valor').AsString := 'Sim';
    FQuery.Active := true;

//    showmessage(FQuery.FieldByName(value).AsString);

    if FQuery.RecordCount >= 1 then
      result := true
    else
      result := false;

  end;

end;

function TCriarJanela.verificarPermisao(value: string): iCriarJanelas;
begin
  if permitirAcesso(value) = false then
    raise Exception.Create('Voc� n�o possuir acesso a este recurso do sistema');
end;

end.
