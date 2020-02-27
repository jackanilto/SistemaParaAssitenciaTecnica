unit UClasse.Entity.Caixa;

interface

uses
  FireDAC.Comp.Client, UDados.Conexao, System.SysUtils, Vcl.StdCtrls,
  Vcl.Dialogs;

type
  TEntityCaixa = class

  private

    FQuery: TFDQuery;

  var
    FUltimaData: TDate;
    FOperacaoASerFeita: string;
    FValorUltimoCaixa: Currency;

    FTotalParcelasOS:Currency;
    FTotalParcelasVendas:Currency;
    FTotalParcelasOSEstornadas:Currency;
    FTotalParcelasVendasEstornadas:Currency;
    FTotalRetiradas:Currency;

  public

    function verificarSituacaoCaixa: string;

    function calcularParcelasOS(value: TEdit): Currency;
    function calcularEstornosOS(value: TEdit): Currency;

    function calcularParcelasVendas(value: TEdit): Currency;
    function calcularEstornoVendas(value: TEdit): Currency;

    function calcularRetiradas(value: TEdit): Currency;

    function ultimoValorDoCaixa(value: TEdit): Currency;

    function valorCaixaFEchado: Currency;
    function valorCaixaEmAberto: Currency;

    function calcularValorCaixa: Currency;

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TEntityCaixa }

function TEntityCaixa.calcularEstornosOS(value: TEdit): Currency;
var
  TQuery: TFDQuery;
  total: Currency;
begin

  result := 0;

  TQuery := TFDQuery.create(nil);
  TQuery.Connection := DataModule1.Conexao;

  TQuery.Active := false;
  TQuery.SQL.Clear;
  TQuery.SQL.Add
    ('select * from PARCELAS_ORDEM where PGTO =:p and DATA_ESTORNO =:d');
  TQuery.ParamByName('p').AsString := 'Estornada';
  TQuery.ParamByName('d').AsDate := FUltimaData;
  TQuery.Active := true;

  TQuery.First;
  total := 0;

  while not TQuery.Eof do
  begin
    total := total + TQuery.FieldByName('VALOR_TOTAL').AsCurrency;
    TQuery.Next;
  end;

  value.Text := formatFloat('R$ ###,##0.00', total);

  FTotalParcelasOSEstornadas := total;

  showmessage(CurrToStr(total) + ' OS estornadas');

  FreeAndNil(TQuery);

end;

function TEntityCaixa.calcularEstornoVendas(value: TEdit): Currency;
var
  TQuery: TFDQuery;
  total: Currency;
begin

  result := 0;

  TQuery := TFDQuery.create(nil);
  TQuery.Connection := DataModule1.Conexao;

  TQuery.Active := false;
  TQuery.SQL.Clear;
  TQuery.SQL.Add
    ('select * from parcelas_vendas where PAGO =:p and DATA_ESTORNO =:d');
  TQuery.ParamByName('p').AsString := 'Estornada';
  TQuery.ParamByName('d').AsDate := FUltimaData;
  TQuery.Active := true;

  TQuery.First;
  total := 0;

  while not TQuery.Eof do
  begin
    total := total + TQuery.FieldByName('TOTAL').AsCurrency;
    TQuery.Next;
  end;

  value.Text := formatFloat('R$ ###,##0.00', total);

  FTotalParcelasVendasEstornadas := total;

  showmessage(CurrToStr(total) + ' Vendas estornadas');

  FreeAndNil(TQuery);

end;

function TEntityCaixa.calcularParcelasOS(value: TEdit): Currency;
var
  TQuery: TFDQuery;
  total: Currency;
begin

  result := 0;

  TQuery := TFDQuery.create(nil);
  TQuery.Connection := DataModule1.Conexao;

  TQuery.Active := false;
  TQuery.SQL.Clear;
  TQuery.SQL.Add
    ('select * from PARCELAS_ORDEM where PGTO =:p and DATA_PAGAMENTO =:d');
  TQuery.ParamByName('p').AsString := 'Sim';
  TQuery.ParamByName('d').AsDate := FUltimaData;
  TQuery.Active := true;

  TQuery.First;
  total := 0;

  while not TQuery.Eof do
  begin
    total := total + TQuery.FieldByName('VALOR_TOTAL').AsCurrency;
    TQuery.Next;
  end;

  value.Text := formatFloat('R$ ###,##0.00', total);

  FTotalParcelasOS := total;

  showmessage(CurrToStr(total) + ' Parcelas OS Recebidas');

  FreeAndNil(TQuery);

end;

function TEntityCaixa.calcularParcelasVendas(value: TEdit): Currency;
var
  TQuery: TFDQuery;
  total: Currency;
begin

  result := 0;

  TQuery := TFDQuery.create(nil);
  TQuery.Connection := DataModule1.Conexao;

  TQuery.Active := false;
  TQuery.SQL.Clear;
  TQuery.SQL.Add
    ('select * from parcelas_vendas where PAGO =:p and DATA_PAGAMENTO =:d');
  TQuery.ParamByName('p').AsString := 'Sim';
  TQuery.ParamByName('d').AsDate := FUltimaData;
  TQuery.Active := true;

  TQuery.First;
  total := 0;

  while not TQuery.Eof do
  begin
    total := total + TQuery.FieldByName('TOTAL').AsCurrency;
    TQuery.Next;
  end;

  value.Text := formatFloat('R$ ###,##0.00', total);

  FTotalParcelasVendas := total;

  showmessage(CurrToStr(total) + ' Parcelas Vendas recebidas');

  FreeAndNil(TQuery);

end;

function TEntityCaixa.calcularRetiradas(value: TEdit): Currency;
var
  TQuery: TFDQuery;
  total: Currency;
begin

  result := 0;

  TQuery := TFDQuery.create(nil);
  TQuery.Connection := DataModule1.Conexao;

  TQuery.Active := false;
  TQuery.SQL.Clear;
  TQuery.SQL.Add('select * from RETIRADAS where DATA =:d');
  TQuery.ParamByName('d').AsDate := FUltimaData;
  TQuery.Active := true;

  TQuery.First;
  total := 0;

  while not TQuery.Eof do
  begin
    total := total + TQuery.FieldByName('VALOR').AsCurrency;
    TQuery.Next;
  end;

  value.Text := formatFloat('R$ ###,##0.00', total);

  FTotalRetiradas := total;

  showmessage(CurrToStr(total) + ' OS estornadas');

  FreeAndNil(TQuery);
end;

function TEntityCaixa.calcularValorCaixa: Currency;
var
  totalVendasOS:currency;
  totalEmCaixa:Currency;
begin

  result := 0;

  totalVendasOS := (FTotalParcelasOS + FTotalParcelasVendas) -
            (FTotalParcelasOSEstornadas + FTotalParcelasVendasEstornadas);

  totalEmCaixa := (totalVendasOS + FValorUltimoCaixa) - FTotalRetiradas;

  Result := totalEmCaixa;

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

  FreeAndNil(FQuery);

  inherited;
end;

function TEntityCaixa.ultimoValorDoCaixa(value: TEdit): Currency;
begin
  result := FValorUltimoCaixa;
  value.Text := formatFloat('R$ ###,##0.00', FValorUltimoCaixa);
end;

function TEntityCaixa.valorCaixaEmAberto: Currency;
begin

  if FQuery.FieldByName('VALOR_INFORMADO').AsCurrency <> 0 then
  begin
    result := FQuery.FieldByName('VALOR_INFORMADO').AsCurrency;
  end
  else
  begin
    result := 0;
  end;

end;

function TEntityCaixa.valorCaixaFEchado: Currency;
begin

  if FQuery.FieldByName('VALOR_ENCERRAMENTO').AsCurrency <> 0 then
  begin
    result := FQuery.FieldByName('VALOR_ENCERRAMENTO').AsCurrency;
  end
  else
  begin
    result := 0;
  end;

end;

function TEntityCaixa.verificarSituacaoCaixa: string;
begin

  if FQuery.RecordCount = 0 then
  begin // se for a primeira vez que o caixa esta iniciando
    result := 'nao foi iniciado';
    FUltimaData := Date;
  end
  else if ((FQuery.FieldByName('DATA_ABERTURA').AsDateTime = Date) and
    (FQuery.FieldByName('STATUS').AsString = 'aberto')) then
  begin // Se o caixa esta em atividade. Foi iniciado no memos dia
    result := 'aberto';
    FUltimaData := FQuery.FieldByName('DATA_ABERTURA').AsDateTime;
    FValorUltimoCaixa := FQuery.FieldByName('VALOR_INFORMADO').AsCurrency;
  end
  else if ((FQuery.FieldByName('DATA_ABERTURA').AsDateTime <> Date) and
    (FQuery.FieldByName('STATUS').AsString = 'aberto')) then
  begin // Caso o caixa esteja aberto, mas n�o foi encerrado no dia anterior
    result := 'encerrar caixa anterior';
    FUltimaData := FQuery.FieldByName('DATA_ABERTURA').AsDateTime;
    FValorUltimoCaixa := FQuery.FieldByName('VALOR_INFORMADO').AsCurrency;
  end
  else if ((FQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime = Date) and
    (FQuery.FieldByName('STATUS').AsString = 'fechado')) then
  begin // O caixa foi encerrado no dia atual
    result := 'fechado';
    FUltimaData := FQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime;
    FValorUltimoCaixa := FQuery.FieldByName('VALOR_ENCERRAMENTO').AsCurrency;
  end
  else if ((FQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime <> Date) and
    (FQuery.FieldByName('STATUS').AsString = 'fechado')) then
  begin // O caixa foi encerrado no dia anterior e esta pronto para ser inciado novamente
    result := 'iniciar novo caixa';
    FUltimaData := FQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime;
    FValorUltimoCaixa := FQuery.FieldByName('VALOR_ENCERRAMENTO').AsCurrency;
  end

end;

end.
