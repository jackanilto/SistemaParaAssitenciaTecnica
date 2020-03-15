unit UClasse.Entity.Quitar.Parcela.OS;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityQuitarParcelaOS = class(TInterfacedObject, iQuitarParcelaOS)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iQuitarParcelaOS;
    function getCampo(value: string): iQuitarParcelaOS;
    function getValor(value: string): iQuitarParcelaOS;
    function getDataInicial(value: TDate): iQuitarParcelaOS;
    function getDataFinal(value: TDate): iQuitarParcelaOS;
    function open(value: string): iQuitarParcelaOS;
    function pesquisar: iQuitarParcelaOS;
    function ExecSql: iQuitarParcelaOS;
    function sqlPesquisa: iQuitarParcelaOS;
    function sqlPesquisaData: iQuitarParcelaOS;
    function sqlPesquisaEstatica: iQuitarParcelaOS;

    function abrir: iQuitarParcelaOS;
    function atualizar: iQuitarParcelaOS;
    function fecharQuery: iQuitarParcelaOS;
    function listarGrid(value: TDataSource): iQuitarParcelaOS;
    function ordenarGrid(column: TColumn): iQuitarParcelaOS;

    function exportar: iQuitarParcelaOS;
    function validarData(componet: tmaskEdit):iQuitarParcelaOS;

    constructor create;
    destructor destroy; override;
    class function new: iQuitarParcelaOS;
  end;

implementation

{ TEntityQuitarParcelaOS }

function TEntityQuitarParcelaOS.abrir: iQuitarParcelaOS;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityQuitarParcelaOS.atualizar: iQuitarParcelaOS;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

constructor TEntityQuitarParcelaOS.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_OS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Quitar parcela OS').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityQuitarParcelaOS.destroy;
begin

  inherited;
end;

function TEntityQuitarParcelaOS.ExecSql: iQuitarParcelaOS;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityQuitarParcelaOS.exportar: iQuitarParcelaOS;
begin
  result := self;
end;

function TEntityQuitarParcelaOS.fecharQuery: iQuitarParcelaOS;
begin
  FQuery.TQuery.close;
end;

function TEntityQuitarParcelaOS.getCampo(value: string): iQuitarParcelaOS;
begin
  result := self;
  FCampo := value;
end;

function TEntityQuitarParcelaOS.getDataFinal(value: TDate): iQuitarParcelaOS;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityQuitarParcelaOS.getDataInicial(value: TDate): iQuitarParcelaOS;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityQuitarParcelaOS.getValor(value: string): iQuitarParcelaOS;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityQuitarParcelaOS.listarGrid(value: TDataSource): iQuitarParcelaOS;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID_PARCELA').DisplayLabel := 'Parcela';
    FieldByName('ID_ORDEM').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcelas';
    FieldByName('PARCELA').DisplayLabel := 'Parcela';
    FieldByName('VALOR_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('VALOR_TOTAL').DisplayLabel := 'Valor total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Data de pagamento';
    FieldByName('HORA_PAGAMENTO').DisplayLabel := 'Hor�rio de pagamento';
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('PGTO').DisplayLabel := 'Pago';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do funcion�rio';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('CLIENTE').DisplayWidth := 40;
    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityQuitarParcelaOS.new: iQuitarParcelaOS;
begin
  result := self.create;
end;

function TEntityQuitarParcelaOS.nomeTabela(value: string): iQuitarParcelaOS;
begin
  result := self;
  FTabela := value;
end;

function TEntityQuitarParcelaOS.open(value: string): iQuitarParcelaOS;
begin
  FQuery.Query(FTabela);
end;

function TEntityQuitarParcelaOS.ordenarGrid(column: TColumn): iQuitarParcelaOS;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityQuitarParcelaOS.pesquisar: iQuitarParcelaOS;
begin
  result := self;
end;

function TEntityQuitarParcelaOS.sqlPesquisa: iQuitarParcelaOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityQuitarParcelaOS.sqlPesquisaData: iQuitarParcelaOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityQuitarParcelaOS.sqlPesquisaEstatica: iQuitarParcelaOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TEntityQuitarParcelaOS.validarData(componet: tmaskEdit):iQuitarParcelaOS;
var
  d: TDate;
begin

  result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
