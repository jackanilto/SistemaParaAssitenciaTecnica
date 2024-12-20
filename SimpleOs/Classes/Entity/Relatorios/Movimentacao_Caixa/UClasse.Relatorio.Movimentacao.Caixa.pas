unit UClasse.Relatorio.Movimentacao.Caixa;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TRelatorioMovimentacaoCaixa = class(TInterfacedObject, iRelatorioMovimentacaoCaixa)
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

    function nomeTabela(value: string): iRelatorioMovimentacaoCaixa;
    function getCampo(value: string): iRelatorioMovimentacaoCaixa;
    function getValor(value: string): iRelatorioMovimentacaoCaixa;
    function getDataInicial(value: TDate): iRelatorioMovimentacaoCaixa;
    function getDataFinal(value: TDate): iRelatorioMovimentacaoCaixa;
    function open(value: string): iRelatorioMovimentacaoCaixa;
    function pesquisar: iRelatorioMovimentacaoCaixa;
    function ExecSql: iRelatorioMovimentacaoCaixa;
    function sqlPesquisa: iRelatorioMovimentacaoCaixa;
    function sqlPesquisaData: iRelatorioMovimentacaoCaixa;
    function sqlPesquisaEstatica: iRelatorioMovimentacaoCaixa;
    function SelectSql(value: string): iRelatorioMovimentacaoCaixa;

    function abrir: iRelatorioMovimentacaoCaixa;
    function atualizar: iRelatorioMovimentacaoCaixa;
    function cancelar: iRelatorioMovimentacaoCaixa;
    function fecharQuery: iRelatorioMovimentacaoCaixa;
    function listarGrid(value: TDataSource): iRelatorioMovimentacaoCaixa;
    function ordenarGrid(column: TColumn): iRelatorioMovimentacaoCaixa;

    function exportar: iRelatorioMovimentacaoCaixa;
    function validarData(componet: tmaskEdit):iRelatorioMovimentacaoCaixa;

    function selecionarParcelasOrdemData(data1, data2:TDate):iRelatorioMovimentacaoCaixa;
    function retornarTotal:Currency;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioMovimentacaoCaixa;
  end;

implementation

{ TRelatorioMovimentacaoCaixa }

function TRelatorioMovimentacaoCaixa.abrir: iRelatorioMovimentacaoCaixa;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioMovimentacaoCaixa.atualizar: iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioMovimentacaoCaixa.cancelar: iRelatorioMovimentacaoCaixa;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioMovimentacaoCaixa.create;
begin
  FTabela := 'CAIXA_ABER_FECH';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Movimenta��o de caixa - Caixa').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;


destructor TRelatorioMovimentacaoCaixa.destroy;
begin

  inherited;
end;

function TRelatorioMovimentacaoCaixa.ExecSql: iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioMovimentacaoCaixa.exportar: iRelatorioMovimentacaoCaixa;
begin
  result := self;
end;

function TRelatorioMovimentacaoCaixa.fecharQuery: iRelatorioMovimentacaoCaixa;
begin
  FQuery.TQuery.close;
end;

function TRelatorioMovimentacaoCaixa.getCampo(value: string): iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioMovimentacaoCaixa.getDataFinal(value: TDate): iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioMovimentacaoCaixa.getDataInicial(value: TDate): iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioMovimentacaoCaixa.getValor(value: string): iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioMovimentacaoCaixa.listarGrid(value: TDataSource): iRelatorioMovimentacaoCaixa;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'C�digo';
    FieldByName('DATA_ABERTURA').DisplayLabel := 'Abertura';
    FieldByName('HORA_ABERTURA').DisplayLabel := 'H. Abertura';
    FieldByName('FUNCIONARIO_ABERTURA').DisplayLabel := 'Funcion�rio';
    FieldByName('NOME_FUNCIONARIO_ABERTURA').Visible := false;
    FieldByName('VALOR_ANTERIRO').DisplayLabel := 'Valor anterior';
    FieldByName('VALOR_INFORMADO').DisplayLabel := 'Valor informado';
    FieldByName('DATA_ENCERRAMENTO').DisplayLabel := 'Encerramento';
    FieldByName('HORA_ENCERRAMENTO').DisplayLabel := 'H. Encerrramento';
    FieldByName('FUNCIONARIO_ENCERRAMENTO').DisplayLabel := 'Funcion�rio';
    FieldByName('NOME_FUNCIONARIO_ENCERRAMENTO').Visible := false;
    FieldByName('VALOR_ENCERRAMENTO').DisplayLabel := 'Valor encerramento';
    FieldByName('STATUS').DisplayLabel := 'Status';

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioMovimentacaoCaixa.new: iRelatorioMovimentacaoCaixa;
begin
  result := self.create;
end;

function TRelatorioMovimentacaoCaixa.nomeTabela(value: string): iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioMovimentacaoCaixa.open(value: string): iRelatorioMovimentacaoCaixa;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioMovimentacaoCaixa.ordenarGrid(column: TColumn): iRelatorioMovimentacaoCaixa;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioMovimentacaoCaixa.pesquisar: iRelatorioMovimentacaoCaixa;
begin
  result := self;
end;

function TRelatorioMovimentacaoCaixa.retornarTotal: Currency;
begin

  result := 0;

  FQuery.TQuery.First;

  result := FQuery.TQuery.FieldByName('VALOR_INFORMADO').AsCurrency;

end;

function TRelatorioMovimentacaoCaixa.selecionarParcelasOrdemData(data1,
  data2: TDate): iRelatorioMovimentacaoCaixa;
begin

  result := self;

  with FQuery do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('SELECT * FROM CAIXA_ABER_FECH WHERE DATA_ABERTURA BETWEEN :D1 AND :D2 ORDER BY ID DESC');
    TQuery.ParamByName('D1').AsDate := data1;
    TQuery.ParamByName('D2').AsDate := data2;
    TQuery.Active := true;

  end;

end;

function TRelatorioMovimentacaoCaixa.SelectSql(value: string): iRelatorioMovimentacaoCaixa;
begin

end;

function TRelatorioMovimentacaoCaixa.sqlPesquisa: iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioMovimentacaoCaixa.sqlPesquisaData: iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioMovimentacaoCaixa.sqlPesquisaEstatica: iRelatorioMovimentacaoCaixa;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioMovimentacaoCaixa.validarData(componet: tmaskEdit):iRelatorioMovimentacaoCaixa;
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
