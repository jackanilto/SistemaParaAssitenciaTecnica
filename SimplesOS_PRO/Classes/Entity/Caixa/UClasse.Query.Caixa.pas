unit UClasse.Query.Caixa;

interface

uses UDados.Conexao, FireDAC.Comp.Client, System.SysUtils;

type
  TQueryCaixa = class
    private
      FConexaoQuery:TFDQuery;
    public
     function retornarQuery:TFDQuery;

     constructor create;
     destructor destroy; override;
  end;

implementation

{ TQueryCaixa }

constructor TQueryCaixa.create;
begin
  FreeAndNil(FConexaoQuery);
end;

destructor TQueryCaixa.destroy;
begin

  inherited;
end;

function TQueryCaixa.retornarQuery: TFDQuery;
begin

  FConexaoQuery := TFDQuery.Create(nil);
  FConexaoQuery.Connection := DataModule1.Conexao;
  FConexaoQuery.Active := false;
  FConexaoQuery.SQL.Clear;
  FConexaoQuery.SQL.Add('select * from CAIXA_ABER_FECH');
  FConexaoQuery.Active := true;

  result := FConexaoQuery;


end;

end.
