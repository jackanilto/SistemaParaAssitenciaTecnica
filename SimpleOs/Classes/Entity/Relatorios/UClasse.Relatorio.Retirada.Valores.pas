unit UClasse.Relatorio.Retirada.Valores;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioRetiradaValores = class(TInterfacedObject, iRelatorioRetiradaDeValores)
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

    function nomeTabela(value: string): iRelatorioRetiradaDeValores;
    function getCampo(value: string): iRelatorioRetiradaDeValores;
    function getValor(value: string): iRelatorioRetiradaDeValores;
    function getDataInicial(value: TDate): iRelatorioRetiradaDeValores;
    function getDataFinal(value: TDate): iRelatorioRetiradaDeValores;
    function open(value: string): iRelatorioRetiradaDeValores;
    function pesquisar: iRelatorioRetiradaDeValores;
    function ExecSql: iRelatorioRetiradaDeValores;
    function sqlPesquisa: iRelatorioRetiradaDeValores;
    function sqlPesquisaData: iRelatorioRetiradaDeValores;
    function sqlPesquisaEstatica: iRelatorioRetiradaDeValores;

    function abrir: iRelatorioRetiradaDeValores;
    function atualizar: iRelatorioRetiradaDeValores;
    function cancelar: iRelatorioRetiradaDeValores;
    function fecharQuery: iRelatorioRetiradaDeValores;
    function listarGrid(value: TDataSource): iRelatorioRetiradaDeValores;
    function ordenarGrid(column: TColumn): iRelatorioRetiradaDeValores;

    function exportar: iRelatorioRetiradaDeValores;
    function validarData(componet: tmaskEdit):iRelatorioRetiradaDeValores;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioRetiradaDeValores;
  end;

implementation

{ TRelatorioRetiradaValores }

function TRelatorioRetiradaValores.abrir: iRelatorioRetiradaDeValores;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioRetiradaValores.atualizar: iRelatorioRetiradaDeValores;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioRetiradaValores.cancelar: iRelatorioRetiradaDeValores;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioRetiradaValores.create;
begin
  FTabela := 'RETIRADAS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório Retirada de Valores').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioRetiradaValores.destroy;
begin

  inherited;
end;

function TRelatorioRetiradaValores.ExecSql: iRelatorioRetiradaDeValores;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioRetiradaValores.exportar: iRelatorioRetiradaDeValores;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório de Clientes';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Código';
  pasta.cells[1, 2] := 'Cód. Motivo';
  pasta.cells[1, 3] := 'Motivo';
  pasta.cells[1, 4] := 'Valor';
  pasta.cells[1, 5] := 'Data';
  pasta.cells[1, 6] := 'Hora';
  pasta.cells[1, 7] := 'Funcionário';
  pasta.cells[1, 8] := 'Observação';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_MOTIVO').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('MOTIVO').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('VALOR').AsCurrency;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('DATA').AsDateTime;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('HORA').AsDateTime;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioRetiradaValores.fecharQuery: iRelatorioRetiradaDeValores;
begin
  FQuery.TQuery.close;
end;

function TRelatorioRetiradaValores.getCampo(value: string): iRelatorioRetiradaDeValores;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioRetiradaValores.getDataFinal(value: TDate): iRelatorioRetiradaDeValores;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioRetiradaValores.getDataInicial(value: TDate): iRelatorioRetiradaDeValores;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioRetiradaValores.getValor(value: string): iRelatorioRetiradaDeValores;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioRetiradaValores.listarGrid(value: TDataSource): iRelatorioRetiradaDeValores;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID').DisplayLabel := 'Código';
    FieldByName('ID_MOTIVO').DisplayLabel := 'Cód. Motivo';
    FieldByName('MOTIVO').DisplayLabel := 'Motivo';
    FieldByName('VALOR').DisplayLabel := 'Valor';
    FieldByName('DATA').DisplayLabel := 'Data';
    FieldByName('HORA').DisplayLabel := 'Hora';
    FieldByName('FUNCIONARIO').DisplayLabel := 'Funcionário';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('MOTIVO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioRetiradaValores.new: iRelatorioRetiradaDeValores;
begin
  result := self.create;
end;

function TRelatorioRetiradaValores.nomeTabela(value: string): iRelatorioRetiradaDeValores;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioRetiradaValores.open(value: string): iRelatorioRetiradaDeValores;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioRetiradaValores.ordenarGrid(column: TColumn): iRelatorioRetiradaDeValores;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioRetiradaValores.pesquisar: iRelatorioRetiradaDeValores;
begin
  result := self;
end;

function TRelatorioRetiradaValores.sqlPesquisa: iRelatorioRetiradaDeValores;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioRetiradaValores.sqlPesquisaData: iRelatorioRetiradaDeValores;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioRetiradaValores.sqlPesquisaEstatica: iRelatorioRetiradaDeValores;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioRetiradaValores.validarData(componet: tmaskEdit):iRelatorioRetiradaDeValores;
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
