unit UClasse.Relatorio.Vendas.Estornadas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioVendasEstornadas = class(TInterfacedObject, iRelatorioVendasEstornadas)
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

    function nomeTabela(value: string): iRelatorioVendasEstornadas;
    function getCampo(value: string): iRelatorioVendasEstornadas;
    function getValor(value: string): iRelatorioVendasEstornadas;
    function getDataInicial(value: TDate): iRelatorioVendasEstornadas;
    function getDataFinal(value: TDate): iRelatorioVendasEstornadas;
    function open(value: string): iRelatorioVendasEstornadas;
    function pesquisar: iRelatorioVendasEstornadas;
    function ExecSql: iRelatorioVendasEstornadas;
    function sqlPesquisa: iRelatorioVendasEstornadas;
    function sqlPesquisaData: iRelatorioVendasEstornadas;
    function sqlPesquisaEstatica: iRelatorioVendasEstornadas;

    function abrir: iRelatorioVendasEstornadas;
    function atualizar: iRelatorioVendasEstornadas;
    function cancelar: iRelatorioVendasEstornadas;
    function fecharQuery: iRelatorioVendasEstornadas;
    function listarGrid(value: TDataSource): iRelatorioVendasEstornadas;
    function ordenarGrid(column: TColumn): iRelatorioVendasEstornadas;

    function exportar: iRelatorioVendasEstornadas;
    function validarData(componet: tmaskEdit):iRelatorioVendasEstornadas;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioVendasEstornadas;
  end;

implementation

{ TRelatorioVendasEstornadas }

function TRelatorioVendasEstornadas.abrir: iRelatorioVendasEstornadas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioVendasEstornadas.atualizar: iRelatorioVendasEstornadas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioVendasEstornadas.cancelar: iRelatorioVendasEstornadas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioVendasEstornadas.create;
begin
  FTabela := 'VISUALIZAR_VENDAS_ESTORNADAS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatorio Vendas Estornadas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioVendasEstornadas.destroy;
begin

  inherited;
end;

function TRelatorioVendasEstornadas.ExecSql: iRelatorioVendasEstornadas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioVendasEstornadas.exportar: iRelatorioVendasEstornadas;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Vendas Estornadas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Estorno';
  pasta.cells[1, 2] := 'Venda';
  pasta.cells[1, 3] := 'C�d. Cliente';
  pasta.cells[1, 4] := 'Nome do cliente';
  pasta.cells[1, 5] := 'Valor';
  pasta.cells[1, 6] := 'Data';
  pasta.cells[1, 7] := 'Hora';
  pasta.cells[1, 8] := 'Motivo';
  pasta.cells[1, 9] := 'C�d. Funcion�rio';
  pasta.cells[1, 10] := 'Nome do funcion�rio';
  pasta.cells[1, 11] := 'Observa��o';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_ESTORNO').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_VENDA').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('NOME_CLIENTE').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('VALOR').AsCurrency;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('DATA').AsDateTime;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('HORA').AsDateTime;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('MOTIVO').AsString;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioVendasEstornadas.fecharQuery: iRelatorioVendasEstornadas;
begin
  FQuery.TQuery.close;
end;

function TRelatorioVendasEstornadas.getCampo(value: string): iRelatorioVendasEstornadas;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioVendasEstornadas.getDataFinal(value: TDate): iRelatorioVendasEstornadas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioVendasEstornadas.getDataInicial(value: TDate): iRelatorioVendasEstornadas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioVendasEstornadas.getValor(value: string): iRelatorioVendasEstornadas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioVendasEstornadas.listarGrid(value: TDataSource): iRelatorioVendasEstornadas;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_ESTORNO').DisplayLabel := 'C�d. Estorno';
    FieldByName('ID_VENDA').DisplayLabel := 'Venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Nome do cliente';
    FieldByName('VALOR').DisplayLabel := 'Valor';
    FieldByName('DATA').DisplayLabel := 'Data';
    FieldByName('HORA').DisplayLabel := 'Hora';
    FieldByName('MOTIVO').DisplayLabel := 'Motivo';
    FieldByName('FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do funcion�rio';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('NOME_CLIENTE').DisplayWidth := 40;
    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 40;
    FieldByName('MOTIVO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioVendasEstornadas.new: iRelatorioVendasEstornadas;
begin
  result := self.create;
end;

function TRelatorioVendasEstornadas.nomeTabela(value: string): iRelatorioVendasEstornadas;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioVendasEstornadas.open(value: string): iRelatorioVendasEstornadas;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioVendasEstornadas.ordenarGrid(column: TColumn): iRelatorioVendasEstornadas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioVendasEstornadas.pesquisar: iRelatorioVendasEstornadas;
begin
  result := self;
end;

function TRelatorioVendasEstornadas.sqlPesquisa: iRelatorioVendasEstornadas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioVendasEstornadas.sqlPesquisaData: iRelatorioVendasEstornadas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioVendasEstornadas.sqlPesquisaEstatica: iRelatorioVendasEstornadas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioVendasEstornadas.validarData(componet: tmaskEdit):iRelatorioVendasEstornadas;
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
