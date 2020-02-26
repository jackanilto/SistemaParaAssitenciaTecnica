unit UClasse.Entity.Caixa;

interface

uses
  FireDAC.Comp.Client, UDados.Conexao, System.SysUtils, Vcl.StdCtrls;

type
  TEntityCaixa = class

  private

    FQuery: TFDQuery;

  var
    FUltimaData: TDate;
    FOperacaoASerFeita: string;

  public

    function verificarSituacaoCaixa: string;
    function calcularParcelasOS(value: TEdit): Currency;
    function calcularParcelasVendas(value: TEdit): Currency;
    function calcularRetiradas(value: TEdit): Currency;
    function calcularEstornos(value: TEdit): Currency;
    function ultimoValorDoCaixa(value: TEdit): Currency;

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TEntityCaixa }

function TEntityCaixa.calcularEstornos(value: TEdit): Currency;
var
  TQuery: TFDQuery;
  total: Currency;
begin

  result := 0;

  TQuery := TFDQuery.create(nil);
  TQuery.Connection := DataModule1.Conexao;

  TQuery.Active := false;
  TQuery.SQL.Clear;
  TQuery.SQL.Add('select * from PARCELAS_ORDEM where PGTO =p and ');
  TQuery.ParamByName('p').AsString := 'Estornada';
  TQuery.Active := true;

  TQuery.First;
  total := 0;

  while not TQuery.Eof do
  begin
    total := total + FQuery.FieldByName('VALOR_TOTAL').AsCurrency;
    TQuery.Next;
  end;

  value.Text := formatFloat('R$ ###,##0.00', total);

end;

function TEntityCaixa.calcularParcelasOS(value: TEdit): Currency;
begin

end;

function TEntityCaixa.calcularParcelasVendas(value: TEdit): Currency;
begin

end;

function TEntityCaixa.calcularRetiradas(value: TEdit): Currency;
begin

end;

constructor TEntityCaixa.create;
begin

  FQuery := TFDQuery.create(nil);
  FQuery.Connection := DataModule1.Conexao;
  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from CAIXA_ABER_FECH order by id desc');
  FQuery.Active := true;

end;

destructor TEntityCaixa.destroy;
begin

  freeandnil(FQuery);

  inherited;
end;

function TEntityCaixa.ultimoValorDoCaixa(value: TEdit): Currency;
begin

end;

function TEntityCaixa.verificarSituacaoCaixa: string;
begin

  if FQuery.RecordCount = 0 then
  begin
    result := 'nao foi iniciado';
  end
  else if ((FQuery.FieldByName('DATA_ABERTURA').AsDateTime = date) and
    (FQuery.FieldByName('STATUS').AsString = 'aberto')) then
  begin
    result := 'aberto';
    FUltimaData := FQuery.FieldByName('DATA_ABERTURA').AsDateTime;
  end
  else if ((FQuery.FieldByName('DATA_ABERTURA').AsDateTime <> date) and
    (FQuery.FieldByName('STATUS').AsString = 'aberto')) then
  begin
    result := 'encerrar caixa anterior';
    FUltimaData := FQuery.FieldByName('DATA_ABERTURA').AsDateTime;
  end
  else if ((FQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime = date) and
    (FQuery.FieldByName('STATUS').AsString = 'fechado')) then
  begin
    result := 'fechado';
    FUltimaData := FQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime;
  end
  else if ((FQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime <> date) and
    (FQuery.FieldByName('STATUS').AsString = 'fechado')) then
  begin
    result := 'iniciar novo caixa';
    FUltimaData := FQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime;
  end

end;

end.
