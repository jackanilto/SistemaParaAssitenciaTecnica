unit UClasse.Criar.Janela;

interface

uses UInterfaces, Vcl.Forms, System.SysUtils,
  FireDAC.Comp.Client, UDados.Conexao;

type

  TCriarJanela = class(TInterfacedObject, iCriarJanelas)
  private
    FQuery: TFDQuery;
    function permitirAcesso(value: string): boolean;
  public
    function formShow(form: TForm; nomeForm: string): iCriarJanelas;
    constructor create;
    destructor destroy; override;
    class function new: iCriarJanelas;
  end;

implementation

{ TCriarJanela }

constructor TCriarJanela.create;
begin

end;

destructor TCriarJanela.destroy;
begin

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
      raise Exception.create('Você não possui acesso a este recurso.');
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

  // with Dados do
  // begin
  //
  // FQuery := TFDQuery.create(nil);
  // FQuery.Connection := Dados.conexao;
  //
  // FQuery.Active := false;
  // FQuery.SQL.Clear;
  // FQuery.SQL.Add('select * from ACESSO_REC where ID_FUNCIONARIO =:F and ' +
  // value + ' =:valor');
  // FQuery.ParamByName('F').AsString := funcionarioAtivo.ToString;
  // FQuery.ParamByName('valor').AsString := 'Sim';
  // FQuery.Active := true;
  //
  // if FQuery.RecordCount >= 1 then
  // result := true
  // else
  // result := false;
  //
  // FQuery.Free;

end;

end.
