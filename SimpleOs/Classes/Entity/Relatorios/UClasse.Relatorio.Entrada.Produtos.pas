unit UClasse.Relatorio.Entrada.Produtos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioEntradaprodutos = class(TInterfacedObject, iRelatorioEntradaDeProdutos)
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

    function nomeTabela(value: string): iRelatorioEntradaDeProdutos;
    function getCampo(value: string): iRelatorioEntradaDeProdutos;
    function getValor(value: string): iRelatorioEntradaDeProdutos;
    function getDataInicial(value: TDate): iRelatorioEntradaDeProdutos;
    function getDataFinal(value: TDate): iRelatorioEntradaDeProdutos;
    function open(value: string): iRelatorioEntradaDeProdutos;
    function pesquisar: iRelatorioEntradaDeProdutos;
    function ExecSql: iRelatorioEntradaDeProdutos;
    function sqlPesquisa: iRelatorioEntradaDeProdutos;
    function sqlPesquisaData: iRelatorioEntradaDeProdutos;
    function sqlPesquisaEstatica: iRelatorioEntradaDeProdutos;

    function abrir: iRelatorioEntradaDeProdutos;
    function atualizar: iRelatorioEntradaDeProdutos;
    function cancelar: iRelatorioEntradaDeProdutos;
    function fecharQuery: iRelatorioEntradaDeProdutos;
    function listarGrid(value: TDataSource): iRelatorioEntradaDeProdutos;
    function ordenarGrid(column: TColumn): iRelatorioEntradaDeProdutos;

    function exportar: iRelatorioEntradaDeProdutos;
    function validarData(componet: tmaskEdit): iRelatorioEntradaDeProdutos;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioEntradaDeProdutos;
  end;

implementation

{ TRelatorioEntradaprodutos }

function TRelatorioEntradaprodutos.abrir: iRelatorioEntradaDeProdutos;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioEntradaprodutos.atualizar: iRelatorioEntradaDeProdutos;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioEntradaprodutos.cancelar: iRelatorioEntradaDeProdutos;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioEntradaprodutos.create;
begin
  FTabela := 'ENTRADAS_PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio Entrada de Produtos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioEntradaprodutos.destroy;
begin

  inherited;
end;

function TRelatorioEntradaprodutos.ExecSql: iRelatorioEntradaDeProdutos;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioEntradaprodutos.exportar: iRelatorioEntradaDeProdutos;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Entrada de Produtos';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'C�d. Produto';
  pasta.cells[1, 3] := 'Produto';
  pasta.cells[1, 4] := 'Valor';
  pasta.cells[1, 5] := 'Quantidade';
  pasta.cells[1, 6] := 'Total';
  pasta.cells[1, 7] := 'N�mero da nota';
  pasta.cells[1, 8] := 'Funcion�rio';
  pasta.cells[1, 9] := 'Data';
  pasta.cells[1, 10] := 'Hor�rio';
  pasta.cells[1, 11] := 'Observa��o';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_PRODUTO').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('PRODUTO').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('VALOR_POR_ITENS').AsCurrency;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('QUANTIDADE').AsInteger;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('TOTAL_DA_ENTRADA').AsCurrency;
      pasta.cells[linha, 7] := '"'+FQuery.TQuery.FieldByName('NUMERO_NOTA').AsString+'"';
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DATA').AsDateTime;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('HORA').AsDateTime;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;
function TRelatorioEntradaprodutos.fecharQuery: iRelatorioEntradaDeProdutos;
begin
  FQuery.TQuery.close;
end;

function TRelatorioEntradaprodutos.getCampo(value: string): iRelatorioEntradaDeProdutos;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioEntradaprodutos.getDataFinal(value: TDate): iRelatorioEntradaDeProdutos;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioEntradaprodutos.getDataInicial(value: TDate): iRelatorioEntradaDeProdutos;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioEntradaprodutos.getValor(value: string): iRelatorioEntradaDeProdutos;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioEntradaprodutos.listarGrid(value: TDataSource): iRelatorioEntradaDeProdutos;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'C�digo';
    FieldByName('ID_PRODUTO').DisplayLabel := 'C�d. Produto';
    FieldByName('PRODUTO').DisplayLabel := 'Produto';
    FieldByName('VALOR_POR_ITENS').DisplayLabel := 'Valor por item';
    FieldByName('QUANTIDADE').DisplayLabel := 'QTDE';
    FieldByName('TOTAL_DA_ENTRADA').DisplayLabel := 'Total';
    FieldByName('NUMERO_NOTA').DisplayLabel := 'N�mero da nota';
    FieldByName('FUNCIONARIO').DisplayLabel := 'Funcion�rio';
    FieldByName('DATA').DisplayLabel := 'Data';
    FieldByName('HORA').DisplayLabel := 'Hor�rio';
    FieldByName('OBSERVACAO').DisplayLabel := 'observa��o';

    FieldByName('PRODUTO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;
    FieldByName('NUMERO_NOTA').DisplayWidth := 30;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioEntradaprodutos.new: iRelatorioEntradaDeProdutos;
begin
  result := self.create;
end;

function TRelatorioEntradaprodutos.nomeTabela(value: string): iRelatorioEntradaDeProdutos;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioEntradaprodutos.open(value: string): iRelatorioEntradaDeProdutos;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioEntradaprodutos.ordenarGrid(column: TColumn): iRelatorioEntradaDeProdutos;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioEntradaprodutos.pesquisar: iRelatorioEntradaDeProdutos;
begin
  result := self;
end;

function TRelatorioEntradaprodutos.sqlPesquisa: iRelatorioEntradaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioEntradaprodutos.sqlPesquisaData: iRelatorioEntradaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioEntradaprodutos.sqlPesquisaEstatica: iRelatorioEntradaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioEntradaprodutos.validarData(componet: tmaskEdit):iRelatorioEntradaDeProdutos;
var
  d: TDate;
begin

  Result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
