unit UClasse.Relatorio.OS.Estornadas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioOSEstornadas = class(TInterfacedObject, iRelatorioOSEstornadas)
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

    function nomeTabela(value: string): iRelatorioOSEstornadas;
    function getCampo(value: string): iRelatorioOSEstornadas;
    function getValor(value: string): iRelatorioOSEstornadas;
    function getDataInicial(value: TDate): iRelatorioOSEstornadas;
    function getDataFinal(value: TDate): iRelatorioOSEstornadas;
    function open(value: string): iRelatorioOSEstornadas;
    function pesquisar: iRelatorioOSEstornadas;
    function ExecSql: iRelatorioOSEstornadas;
    function sqlPesquisa: iRelatorioOSEstornadas;
    function sqlPesquisaData: iRelatorioOSEstornadas;
    function sqlPesquisaEstatica: iRelatorioOSEstornadas;

    function abrir: iRelatorioOSEstornadas;
    function atualizar: iRelatorioOSEstornadas;
    function cancelar: iRelatorioOSEstornadas;
    function fecharQuery: iRelatorioOSEstornadas;
    function listarGrid(value: TDataSource): iRelatorioOSEstornadas;
    function ordenarGrid(column: TColumn): iRelatorioOSEstornadas;

    function exportar: iRelatorioOSEstornadas;
    function validarData(componet: tmaskEdit):iRelatorioOSEstornadas;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioOSEstornadas;
  end;

implementation

{ TRelatorioOSEstornadas }

function TRelatorioOSEstornadas.abrir: iRelatorioOSEstornadas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioOSEstornadas.atualizar: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioOSEstornadas.cancelar: iRelatorioOSEstornadas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioOSEstornadas.create;
begin
  FTabela := 'VISULIZAR_OS_ESTORNO';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório os estornadas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioOSEstornadas.destroy;
begin

  inherited;
end;

function TRelatorioOSEstornadas.ExecSql: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioOSEstornadas.exportar: iRelatorioOSEstornadas;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório OS Estornadas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Estorno';
  pasta.cells[1, 2] := 'OS';
  pasta.cells[1, 3] := 'Cód. Cliente';
  pasta.cells[1, 4] := 'Nome do cliente';
  pasta.cells[1, 5] := 'Valor';
  pasta.cells[1, 6] := 'Data';
  pasta.cells[1, 7] := 'Hora';
  pasta.cells[1, 8] := 'Motivo';
  pasta.cells[1, 9] := 'HORA';
  pasta.cells[1, 10] := 'Nome do funcionário';
  pasta.cells[1, 11] := 'Observação';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_ESTORNO').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
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

function TRelatorioOSEstornadas.fecharQuery: iRelatorioOSEstornadas;
begin
  FQuery.TQuery.close;
end;

function TRelatorioOSEstornadas.getCampo(value: string): iRelatorioOSEstornadas;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioOSEstornadas.getDataFinal(value: TDate): iRelatorioOSEstornadas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioOSEstornadas.getDataInicial(value: TDate): iRelatorioOSEstornadas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioOSEstornadas.getValor(value: string): iRelatorioOSEstornadas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioOSEstornadas.listarGrid(value: TDataSource): iRelatorioOSEstornadas;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_ESTORNO').DisplayLabel := 'Estorno';
    FieldByName('ID_ORDEM').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'Cód. Cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Nome cliente';
    FieldByName('VALOR').DisplayLabel := 'Valor';
    FieldByName('DATA').DisplayLabel := 'Data';
    FieldByName('HORA').DisplayLabel := 'Data';
    FieldByName('MOTIVO').DisplayLabel := 'Motivo';
    FieldByName('FUNCIONARIO').DisplayLabel := 'Funcionário';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do funcionário';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('NOME_CLIENTE').DisplayWidth := 40;
    FieldByName('MOTIVO').DisplayWidth := 40;
    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioOSEstornadas.new: iRelatorioOSEstornadas;
begin
  result := self.create;
end;

function TRelatorioOSEstornadas.nomeTabela(value: string): iRelatorioOSEstornadas;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioOSEstornadas.open(value: string): iRelatorioOSEstornadas;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioOSEstornadas.ordenarGrid(column: TColumn): iRelatorioOSEstornadas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioOSEstornadas.pesquisar: iRelatorioOSEstornadas;
begin
  result := self;
end;

function TRelatorioOSEstornadas.sqlPesquisa: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioOSEstornadas.sqlPesquisaData: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioOSEstornadas.sqlPesquisaEstatica: iRelatorioOSEstornadas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioOSEstornadas.validarData(componet: tmaskEdit):iRelatorioOSEstornadas;
var
  d: TDate;
begin

  result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data válida.');
  end;
end;

end.
