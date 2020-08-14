unit UClasse.Relatorio.Saida.Produtos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioSaidaProdutos = class(TInterfacedObject, iRelatorioSaidaDeProdutos)
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

    function nomeTabela(value: string): iRelatorioSaidaDeProdutos;
    function getCampo(value: string): iRelatorioSaidaDeProdutos;
    function getValor(value: string): iRelatorioSaidaDeProdutos;
    function getDataInicial(value: TDate): iRelatorioSaidaDeProdutos;
    function getDataFinal(value: TDate): iRelatorioSaidaDeProdutos;
    function open(value: string): iRelatorioSaidaDeProdutos;
    function pesquisar: iRelatorioSaidaDeProdutos;
    function ExecSql: iRelatorioSaidaDeProdutos;
    function sqlPesquisa: iRelatorioSaidaDeProdutos;
    function sqlPesquisaData: iRelatorioSaidaDeProdutos;
    function sqlPesquisaEstatica: iRelatorioSaidaDeProdutos;

    function abrir: iRelatorioSaidaDeProdutos;
    function atualizar: iRelatorioSaidaDeProdutos;
    function cancelar: iRelatorioSaidaDeProdutos;
    function fecharQuery: iRelatorioSaidaDeProdutos;
    function listarGrid(value: TDataSource): iRelatorioSaidaDeProdutos;
    function ordenarGrid(column: TColumn): iRelatorioSaidaDeProdutos;

    function exportar: iRelatorioSaidaDeProdutos;
    function validarData(componet: tmaskEdit): iRelatorioSaidaDeProdutos;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioSaidaDeProdutos;
  end;

implementation

{ TRelatorioSaidaProdutos }

function TRelatorioSaidaProdutos.abrir: iRelatorioSaidaDeProdutos;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioSaidaProdutos.atualizar: iRelatorioSaidaDeProdutos;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioSaidaProdutos.cancelar: iRelatorioSaidaDeProdutos;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioSaidaProdutos.create;
begin
  FTabela := 'SAIDA_PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório Saída de Produtos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioSaidaProdutos.destroy;
begin

  inherited;
end;

function TRelatorioSaidaProdutos.ExecSql: iRelatorioSaidaDeProdutos;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioSaidaProdutos.exportar: iRelatorioSaidaDeProdutos;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório Saída de Produtos';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Código';
  pasta.cells[1, 2] := 'Cód. Produto';
  pasta.cells[1, 3] := 'Produto';
  pasta.cells[1, 4] := 'Valor';
  pasta.cells[1, 5] := 'Quantidade';
  pasta.cells[1, 6] := 'Total';
  pasta.cells[1, 7] := 'Data';
  pasta.cells[1, 8] := 'Horário';
  pasta.cells[1, 9] := 'Motivo';
  pasta.cells[1, 10] := 'Funcionário';
  pasta.cells[1, 11] := 'Observação';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_PRODUTO').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('PRODUTOS').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('VALOR').AsCurrency;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('QUANTIDADE').AsInteger;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('TOTAL').AsCurrency;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('DATA').AsDateTime;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('HORA').AsDateTime;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('MOTIVO').AsString;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioSaidaProdutos.fecharQuery: iRelatorioSaidaDeProdutos;
begin
  FQuery.TQuery.close;
end;

function TRelatorioSaidaProdutos.getCampo(value: string): iRelatorioSaidaDeProdutos;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioSaidaProdutos.getDataFinal(value: TDate): iRelatorioSaidaDeProdutos;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioSaidaProdutos.getDataInicial(value: TDate): iRelatorioSaidaDeProdutos;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioSaidaProdutos.getValor(value: string): iRelatorioSaidaDeProdutos;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioSaidaProdutos.listarGrid(value: TDataSource): iRelatorioSaidaDeProdutos;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'Código';
    FieldByName('ID_PRODUTO').DisplayLabel := 'Cód. Produto';
    FieldByName('PRODUTOS').DisplayLabel := 'Produto';
    FieldByName('VALOR').DisplayLabel := 'Valor';
    FieldByName('QUANTIDADE').DisplayLabel := 'QTDE';
    FieldByName('TOTAL').DisplayLabel := 'Total';
    FieldByName('DATA').DisplayLabel := 'Data';
    FieldByName('HORA').DisplayLabel := 'Horário';
    FieldByName('MOTIVO').DisplayLabel := 'Motivo';
    FieldByName('FUNCIONARIO').DisplayLabel := 'Funcionário';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('PRODUTOS').DisplayWidth := 37;
    FieldByName('MOTIVO').DisplayWidth := 37;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioSaidaProdutos.new: iRelatorioSaidaDeProdutos;
begin
  result := self.create;
end;

function TRelatorioSaidaProdutos.nomeTabela(value: string): iRelatorioSaidaDeProdutos;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioSaidaProdutos.open(value: string): iRelatorioSaidaDeProdutos;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioSaidaProdutos.ordenarGrid(column: TColumn): iRelatorioSaidaDeProdutos;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioSaidaProdutos.pesquisar: iRelatorioSaidaDeProdutos;
begin
  result := self;
end;

function TRelatorioSaidaProdutos.sqlPesquisa: iRelatorioSaidaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioSaidaProdutos.sqlPesquisaData: iRelatorioSaidaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioSaidaProdutos.sqlPesquisaEstatica: iRelatorioSaidaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioSaidaProdutos.validarData(componet: tmaskEdit):iRelatorioSaidaDeProdutos;
var
  d: TDate;
begin

  Result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data válida.');
  end;
end;

end.
