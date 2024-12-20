unit UClasse.Relatorio.Historico.Caixa;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatrioHistoricoCaixa = class(TInterfacedObject, iRelatorioHistoricoCaixa)
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

    function nomeTabela(value: string): iRelatorioHistoricoCaixa;
    function getCampo(value: string): iRelatorioHistoricoCaixa;
    function getValor(value: string): iRelatorioHistoricoCaixa;
    function getDataInicial(value: TDate): iRelatorioHistoricoCaixa;
    function getDataFinal(value: TDate): iRelatorioHistoricoCaixa;
    function open(value: string): iRelatorioHistoricoCaixa;
    function pesquisar: iRelatorioHistoricoCaixa;
    function ExecSql: iRelatorioHistoricoCaixa;
    function sqlPesquisa: iRelatorioHistoricoCaixa;
    function sqlPesquisaData: iRelatorioHistoricoCaixa;
    function sqlPesquisaEstatica: iRelatorioHistoricoCaixa;

    function abrir: iRelatorioHistoricoCaixa;
    function atualizar: iRelatorioHistoricoCaixa;
    function cancelar: iRelatorioHistoricoCaixa;
    function fecharQuery: iRelatorioHistoricoCaixa;
    function listarGrid(value: TDataSource): iRelatorioHistoricoCaixa;
    function ordenarGrid(column: TColumn): iRelatorioHistoricoCaixa;

    function exportar: iRelatorioHistoricoCaixa;
    function validarData(componet: tmaskEdit):iRelatorioHistoricoCaixa;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioHistoricoCaixa;

  end;

implementation

{ TRelatrioHistoricoCaixa }

function TRelatrioHistoricoCaixa.abrir: iRelatorioHistoricoCaixa;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatrioHistoricoCaixa.atualizar: iRelatorioHistoricoCaixa;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatrioHistoricoCaixa.cancelar: iRelatorioHistoricoCaixa;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatrioHistoricoCaixa.create;
begin
  FTabela := 'CAIXA_ABER_FECH';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Historico do caixa').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatrioHistoricoCaixa.destroy;
begin

  inherited;
end;

function TRelatrioHistoricoCaixa.ExecSql: iRelatorioHistoricoCaixa;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatrioHistoricoCaixa.exportar: iRelatorioHistoricoCaixa;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio de Clientes';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'Data de abertura';
  pasta.cells[1, 3] := 'Hor�rio de abertura';
  pasta.cells[1, 4] := 'C�d. Funcion�rio abertura';
  pasta.cells[1, 5] := 'Nome funcion�rio abertura';
  pasta.cells[1, 6] := 'Valor anterior';
  pasta.cells[1, 7] := 'Valor informado';
  pasta.cells[1, 8] := 'Data de encerramento';
  pasta.cells[1, 9] := 'Hor�rio de encerramento';
  pasta.cells[1, 10] := 'C�d. Funcion�rio encerramento';
  pasta.cells[1, 11] := 'Nome funcion�rio encerramento';
  pasta.cells[1, 12] := 'Valor do encerramento';
  pasta.cells[1, 13] := 'Status';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('DATA_ABERTURA').AsDateTime;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('HORA_ABERTURA').AsDateTime;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('FUNCIONARIO_ABERTURA').AsInteger;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO_ABERTURA').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('VALOR_ANTERIRO').AsCurrency;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('VALOR_INFORMADO').AsCurrency;

      if FQuery.TQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime <> StrToDate('30/12/1899') then
      begin
        pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('DATA_ENCERRAMENTO').AsDateTime;
        pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('HORA_ENCERRAMENTO').AsDateTime;
      end;

      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('FUNCIONARIO_ENCERRAMENTO').AsInteger;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO_ENCERRAMENTO').AsString;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('VALOR_ENCERRAMENTO').AsCurrency;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('STATUS').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;
function TRelatrioHistoricoCaixa.fecharQuery: iRelatorioHistoricoCaixa;
begin
  FQuery.TQuery.close;
end;

function TRelatrioHistoricoCaixa.getCampo(value: string): iRelatorioHistoricoCaixa;
begin
  result := self;
  FCampo := value;
end;

function TRelatrioHistoricoCaixa.getDataFinal(value: TDate): iRelatorioHistoricoCaixa;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatrioHistoricoCaixa.getDataInicial(value: TDate): iRelatorioHistoricoCaixa;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatrioHistoricoCaixa.getValor(value: string): iRelatorioHistoricoCaixa;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatrioHistoricoCaixa.listarGrid(value: TDataSource): iRelatorioHistoricoCaixa;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'C�digo abertura';
    FieldByName('DATA_ABERTURA').DisplayLabel := 'Data de abertura';
    FieldByName('HORA_ABERTURA').DisplayLabel := 'Hora de abertura';
    FieldByName('FUNCIONARIO_ABERTURA').Visible := false;
    FieldByName('NOME_FUNCIONARIO_ABERTURA').DisplayLabel := 'Funcion�rio(Abertura)';
    FieldByName('VALOR_ANTERIRO').DisplayLabel := 'Valor anterior';
    FieldByName('VALOR_INFORMADO').DisplayLabel := 'Valor informado';
    FieldByName('DATA_ENCERRAMENTO').DisplayLabel := 'Data do encerramento';
    FieldByName('HORA_ENCERRAMENTO').DisplayLabel := 'Hora do encerramento';
    FieldByName('FUNCIONARIO_ENCERRAMENTO').Visible := false;
    FieldByName('NOME_FUNCIONARIO_ENCERRAMENTO').DisplayLabel := 'Funcion�rio(Encerramento)';
    FieldByName('VALOR_ENCERRAMENTO').DisplayLabel := 'Vaalor do encerramento';
    FieldByName('STATUS').DisplayLabel := 'Status';

    FieldByName('NOME_FUNCIONARIO_ABERTURA').DisplayWidth := 30;
    FieldByName('NOME_FUNCIONARIO_ENCERRAMENTO').DisplayWidth := 30;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatrioHistoricoCaixa.new: iRelatorioHistoricoCaixa;
begin
  result := self.create;
end;

function TRelatrioHistoricoCaixa.nomeTabela(value: string): iRelatorioHistoricoCaixa;
begin
  result := self;
  FTabela := value;
end;

function TRelatrioHistoricoCaixa.open(value: string): iRelatorioHistoricoCaixa;
begin
  FQuery.Query(FTabela);
end;

function TRelatrioHistoricoCaixa.ordenarGrid(column: TColumn): iRelatorioHistoricoCaixa;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatrioHistoricoCaixa.pesquisar: iRelatorioHistoricoCaixa;
begin
  result := self;
end;

function TRelatrioHistoricoCaixa.sqlPesquisa: iRelatorioHistoricoCaixa;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatrioHistoricoCaixa.sqlPesquisaData: iRelatorioHistoricoCaixa;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatrioHistoricoCaixa.sqlPesquisaEstatica: iRelatorioHistoricoCaixa;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatrioHistoricoCaixa.validarData(componet: tmaskEdit):iRelatorioHistoricoCaixa;
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
