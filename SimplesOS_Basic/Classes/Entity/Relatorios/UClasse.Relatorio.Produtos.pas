unit UClasse.Relatorio.Produtos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioProdutos = class(TInterfacedObject, iRelatorioDeProdutos)
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

    function nomeTabela(value: string): iRelatorioDeProdutos;
    function getCampo(value: string): iRelatorioDeProdutos;
    function getValor(value: string): iRelatorioDeProdutos;
    function getDataInicial(value: TDate): iRelatorioDeProdutos;
    function getDataFinal(value: TDate): iRelatorioDeProdutos;
    function open(value: string): iRelatorioDeProdutos;
    function pesquisar: iRelatorioDeProdutos;
    function ExecSql: iRelatorioDeProdutos;
    function sqlPesquisa: iRelatorioDeProdutos;
    function sqlPesquisaData: iRelatorioDeProdutos;
    function sqlPesquisaEstatica: iRelatorioDeProdutos;

    function abrir: iRelatorioDeProdutos;
    function atualizar: iRelatorioDeProdutos;
    function cancelar: iRelatorioDeProdutos;
    function fecharQuery: iRelatorioDeProdutos;
    function listarGrid(value: TDataSource): iRelatorioDeProdutos;
    function ordenarGrid(column: TColumn): iRelatorioDeProdutos;

    function exportar: iRelatorioDeProdutos;
    function validarData(componet: tmaskEdit): iRelatorioDeProdutos;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioDeProdutos;
  end;

implementation

{ TRelatorioProdutos }

function TRelatorioProdutos.abrir: iRelatorioDeProdutos;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioProdutos.atualizar: iRelatorioDeProdutos;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioProdutos.cancelar: iRelatorioDeProdutos;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioProdutos.create;
begin
  FTabela := 'PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio de produtos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;


destructor TRelatorioProdutos.destroy;
begin

  inherited;
end;

function TRelatorioProdutos.ExecSql: iRelatorioDeProdutos;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioProdutos.exportar: iRelatorioDeProdutos;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Ordem de Servi�o';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'Produto';
  pasta.cells[1, 3] := 'C�digo de barras';
  pasta.cells[1, 4] := 'Descri��o';
  pasta.cells[1, 5] := 'Valor de custo';
  pasta.cells[1, 6] := 'Margem de lucro';
  pasta.cells[1, 7] := 'Valor de venda';
  pasta.cells[1, 8] := 'QTDE. M�nima';
  pasta.cells[1, 9] := 'QTDE. Atual';
  pasta.cells[1, 10] := 'Validade';
  pasta.cells[1, 11] := 'Altera��o';
  pasta.cells[1, 12] := 'Grupo';
  pasta.cells[1, 13] := 'Marca';
  pasta.cells[1, 14] := 'Modelo';
  pasta.cells[1, 15] := 'N�mero de serie';
  pasta.cells[1, 16] := 'Data de fabrica��o';
  pasta.cells[1, 17] := 'Funcion�rio';
  pasta.cells[1, 18] := 'Observa��o';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('PRODUTO').AsString;
      pasta.cells[linha, 3] := '"'+FQuery.TQuery.FieldByName('CODIGO_BARRAS').AsString+'"';
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('DESCRICAO').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('VALOR_CUSTO').AsCurrency;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('MARGEM_LUCRO').AsCurrency;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('VALOR_VENDA').AsCurrency;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('QUANTIDADE_MINIMA').AsInteger;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger;

      if FQuery.TQuery.FieldByName('DATA_VALIDADE').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('DATA_VALIDADE').AsDateTime
      else
        pasta.cells[linha, 10] := ' ';

      if FQuery.TQuery.FieldByName('DATA_ALTERACAO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('DATA_ALTERACAO').AsDateTime
      else
        pasta.cells[linha, 11] := ' ';

      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('GRUPO').AsString;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('MARCA').AsString;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('MODELO').AsString;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('NUMERO_SERIE').AsString;

      if FQuery.TQuery.FieldByName('DATA_FABRICACAO').AsDateTime <> StrToDate('30/12/1899')  then
        pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('DATA_FABRICACAO').AsDateTime
      else
        pasta.cells[linha, 16] := ' ';

      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioProdutos.fecharQuery: iRelatorioDeProdutos;
begin
  FQuery.TQuery.close;
end;

function TRelatorioProdutos.getCampo(value: string): iRelatorioDeProdutos;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioProdutos.getDataFinal(value: TDate): iRelatorioDeProdutos;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioProdutos.getDataInicial(value: TDate): iRelatorioDeProdutos;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioProdutos.getValor(value: string): iRelatorioDeProdutos;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioProdutos.listarGrid(value: TDataSource): iRelatorioDeProdutos;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID').DisplayLabel := 'C�digo';
    FieldByName('PRODUTO').DisplayLabel := 'Produto';
    FieldByName('CODIGO_BARRAS').DisplayLabel := 'C�digo de barras';
    FieldByName('DESCRICAO').DisplayLabel := 'Descri��o';
    FieldByName('VALOR_CUSTO').DisplayLabel := 'Valor de custo';
    FieldByName('MARGEM_LUCRO').DisplayLabel := 'Margem de lucro';
    FieldByName('VALOR_VENDA').DisplayLabel := 'Valor de venda';
    FieldByName('QUANTIDADE_MINIMA').DisplayLabel := 'QTDE. M�nima';
    FieldByName('QUANTIDADE_ATUAL').DisplayLabel := 'QTDE. Atual';
    FieldByName('DATA_VALIDADE').DisplayLabel := 'Validade';
    FieldByName('DATA_ALTERACAO').DisplayLabel := 'Altera��o';
    FieldByName('ID_GRUPO').Visible := false;
    FieldByName('GRUPO').DisplayLabel := 'Grupo';
    FieldByName('ID_MARCA').Visible := false;
    FieldByName('MARCA').DisplayLabel := 'Marca';
    FieldByName('MODELO').DisplayLabel := 'Modelo';
    FieldByName('NUMERO_SERIE').DisplayLabel := 'N�mero de serie';
    FieldByName('DATA_FABRICACAO').DisplayLabel := 'Data de fabrica��o';
    FieldByName('FUNCIONARIO').DisplayLabel := 'Funcion�rio';
    FieldByName('FOTO').Visible := false;
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('PRODUTO').DisplayWidth := 40;
    FieldByName('DESCRICAO').DisplayWidth := 40;
    FieldByName('GRUPO').DisplayWidth := 30;
    FieldByName('MARCA').DisplayWidth := 30;
    FieldByName('MODELO').DisplayWidth := 30;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioProdutos.new: iRelatorioDeProdutos;
begin
  result := self.create;
end;

function TRelatorioProdutos.nomeTabela(value: string): iRelatorioDeProdutos;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioProdutos.open(value: string): iRelatorioDeProdutos;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioProdutos.ordenarGrid(column: TColumn): iRelatorioDeProdutos;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioProdutos.pesquisar: iRelatorioDeProdutos;
begin
  result := self;
end;

function TRelatorioProdutos.sqlPesquisa: iRelatorioDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioProdutos.sqlPesquisaData: iRelatorioDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioProdutos.sqlPesquisaEstatica: iRelatorioDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioProdutos.validarData(componet: tmaskEdit):iRelatorioDeProdutos;
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
