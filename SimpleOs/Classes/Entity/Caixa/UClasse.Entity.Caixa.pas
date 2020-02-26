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

  public

    function verificarSituacaoCaixa: string;

    function calcularParcelasOS(value: TEdit): Currency;
    function calcularEstornosOS(value: TEdit): Currency;

    function calcularParcelasVendas(value: TEdit): Currency;
    function calcularEstornoVendas(value: TEdit): Currency;

    function calcularRetiradas(value: TEdit): Currency;

    function ultimoValorDoCaixa(value: TEdit): Currency;

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
  TQuery.SQL.Add('select * from PARCELAS_ORDEM where PGTO =:p and DATA_ESTORNO =:d');
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

  showmessage(CurrToStr(total)+' OS estornadas');

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
  TQuery.SQL.Add('select * from parcelas_vendas where PAGO =:p and DATA_ESTORNO =:d');
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

  showmessage(CurrToStr(total)+' Vendas estornadas');

  FreeAndNil(TQuery);

end;

function TEntityCaixa.calcularParcelasOS(value: TEdit): Currency;
var
  TQuery:TFDQuery;
  total:Currency;
begin

  result := 0;

  TQuery := TFDQuery.create(nil);
  TQuery.Connection := DataModule1.Conexao;

  TQuery.Active := false;
  TQuery.SQL.Clear;
  TQuery.SQL.Add('select * from PARCELAS_ORDEM where PGTO =:p and DATA_PAGAMENTO =:d');
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

  showmessage(CurrToStr(total)+' Parcelas OS Recebidas');

  FreeAndNil(TQuery);

end;

function TEntityCaixa.calcularParcelasVendas(value: TEdit): Currency;
var
  TQuery: TFDQuery;
  total: Currency;
  {CRIAR O PROCESSO PARA OBTER O VALOR DO �LTIMO CAIXA}
begin

  result := 0;

  TQuery := TFDQuery.create(nil);
  TQuery.Connection := DataModule1.Conexao;

  TQuery.Active := false;
  TQuery.SQL.Clear;
  TQuery.SQL.Add('select * from parcelas_vendas where PAGO =:p and DATA_PAGAMENTO =:d');
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

  showmessage(CurrToStr(total)+' Parcelas Vendas recebidas');

  FreeAndNil(TQuery);

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
    FUltimaData := Date;
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
