unit UClasse.Entity.Quitar.Parcelas.Vendas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  FireDAC.Comp.Client;

type

  TEntityQuitarParcelaVenda = class(TInterfacedObject, iQuitarParcelasVenda)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigoParcela: integer;
    FDescontoParcela: Currency;
    FDataPagamento: TDate;
    FJurosParcelas: Currency;
    FMultaParcela: Currency;
    FTotalDaParcela: Currency;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iQuitarParcelasVenda;
    function getCampo(value: string): iQuitarParcelasVenda;
    function getValor(value: string): iQuitarParcelasVenda;
    function getDataInicial(value: TDate): iQuitarParcelasVenda;
    function getDataFinal(value: TDate): iQuitarParcelasVenda;
    function open(value: string): iQuitarParcelasVenda;
    function pesquisar: iQuitarParcelasVenda;
    function ExecSql: iQuitarParcelasVenda;
    function sqlPesquisa: iQuitarParcelasVenda;
    function sqlPesquisaData: iQuitarParcelasVenda;
    function sqlPesquisaEstatica: iQuitarParcelasVenda;

    function abrir: iQuitarParcelasVenda;
    function atualizar: iQuitarParcelasVenda;
    function fecharQuery: iQuitarParcelasVenda;
    function listarGrid(value: TDataSource): iQuitarParcelasVenda;
    function ordenarGrid(column: TColumn): iQuitarParcelasVenda;

    function getCodigoParcela(value: integer): iQuitarParcelasVenda;
    function getDesconto(value: string): iQuitarParcelasVenda;
    function getJuros(value: string): iQuitarParcelasVenda;
    function getDataPagamento(value: string): iQuitarParcelasVenda;
    function getTotal(value: string): iQuitarParcelasVenda;
    function quitarParcela: iQuitarParcelasVenda;

    function exportar: iQuitarParcelasVenda;
    procedure validarData(componet: tmaskEdit);

    constructor create;
    destructor destroy; override;
    class function new: iQuitarParcelasVenda;
  end;

implementation

{ TEntityQuitarParcelaVenda }

function TEntityQuitarParcelaVenda.abrir: iQuitarParcelasVenda;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityQuitarParcelaVenda.atualizar: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

constructor TEntityQuitarParcelaVenda.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_VENDA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Parcelas das vendas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityQuitarParcelaVenda.destroy;
begin

  inherited;
end;

function TEntityQuitarParcelaVenda.ExecSql: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityQuitarParcelaVenda.exportar: iQuitarParcelasVenda;
begin
  result := self;
end;

function TEntityQuitarParcelaVenda.fecharQuery: iQuitarParcelasVenda;
begin
  FQuery.TQuery.close;
end;

function TEntityQuitarParcelaVenda.getCampo(value: string)
  : iQuitarParcelasVenda;
begin
  result := self;
  FCampo := value;
end;

function TEntityQuitarParcelaVenda.getCodigoParcela(value: integer)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = 0 then
    raise Exception.create('Informe codigo da parcela');

  FCodigoParcela := value;

end;

function TEntityQuitarParcelaVenda.getDataFinal(value: TDate)
  : iQuitarParcelasVenda;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityQuitarParcelaVenda.getDataInicial(value: TDate)
  : iQuitarParcelasVenda;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityQuitarParcelaVenda.getDataPagamento(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = '  /  /    ' then
    FDataPagamento := Date
  else
  begin
    try
      FDataPagamento := StrToDate(value);
    except
      begin
        raise Exception.create('Informe uma data de pagamento valida.');
      end;

    end;

  end;

end;

function TEntityQuitarParcelaVenda.getDesconto(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  try
    FDescontoParcela := StrToCurr(value);
  except
    raise Exception.create('Informe um valor de desconto v�lido');

  end;

end;

function TEntityQuitarParcelaVenda.getJuros(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  try
    FJurosParcelas := StrToCurr(value);
  except
    raise Exception.create('Informe um valor v�lido para o campo juros');
  end;

end;

function TEntityQuitarParcelaVenda.getTotal(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  try
    FTotalDaParcela := StrToCurr(value);
  except
    raise Exception.create
      ('Informe um valor v�lido para o campo Total da Parcela');
  end;

end;

function TEntityQuitarParcelaVenda.getValor(value: string)
  : iQuitarParcelasVenda;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityQuitarParcelaVenda.listarGrid(value: TDataSource)
  : iQuitarParcelasVenda;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_PARCELA').DisplayLabel := 'C�d. Parcela';
    FieldByName('ID_VENDA').DisplayLabel := 'Venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Nome do cliente';
    FieldByName('VALOR_VENDA').DisplayLabel := 'Valor da venda';
    FieldByName('QUANTIDADE_PARCELAS').DisplayLabel := 'Qtde. Parcelas';
    FieldByName('PARCELA').DisplayLabel := 'Parcelas';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('TOTAL').DisplayLabel := 'Total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Data de pagamento';
    FieldByName('HORA_PAGAMENTO').DisplayLabel := 'Hora do pagamento';
    FieldByName('FUNCIONARIO_PGTO').DisplayLabel := 'Funcion�rio';
    FieldByName('PAGO').DisplayLabel := 'Pago';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityQuitarParcelaVenda.new: iQuitarParcelasVenda;
begin
  result := self.create;
end;

function TEntityQuitarParcelaVenda.nomeTabela(value: string)
  : iQuitarParcelasVenda;
begin
  result := self;
  FTabela := value;
end;

function TEntityQuitarParcelaVenda.open(value: string): iQuitarParcelasVenda;
begin
  FQuery.Query(FTabela);
end;

function TEntityQuitarParcelaVenda.ordenarGrid(column: TColumn)
  : iQuitarParcelasVenda;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityQuitarParcelaVenda.pesquisar: iQuitarParcelasVenda;
begin
  result := self;
end;

function TEntityQuitarParcelaVenda.quitarParcela: iQuitarParcelasVenda;
begin
  { criar esta parte }
end;

function TEntityQuitarParcelaVenda.sqlPesquisa: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityQuitarParcelaVenda.sqlPesquisaData: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityQuitarParcelaVenda.sqlPesquisaEstatica: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityQuitarParcelaVenda.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := StrToDate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise Exception.create('Digite uma data v�lida.');
  end;
end;

end.
