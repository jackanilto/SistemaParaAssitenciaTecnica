unit UClasse.Relatorio.Produtos.Mais.Vendidos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioProdutosMaisVendidos = class(TInterfacedObject, iRealatorioProdutosMaisVendidos)
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

    function nomeTabela(value: string): iRealatorioProdutosMaisVendidos;
    function getCampo(value: string): iRealatorioProdutosMaisVendidos;
    function getValor(value: string): iRealatorioProdutosMaisVendidos;
    function getDataInicial(value: TDate): iRealatorioProdutosMaisVendidos;
    function getDataFinal(value: TDate): iRealatorioProdutosMaisVendidos;
    function open(value: string): iRealatorioProdutosMaisVendidos;
    function pesquisar: iRealatorioProdutosMaisVendidos;
    function ExecSql: iRealatorioProdutosMaisVendidos;
    function sqlPesquisa: iRealatorioProdutosMaisVendidos;
    function sqlPesquisaData: iRealatorioProdutosMaisVendidos;
    function sqlPesquisaEstatica: iRealatorioProdutosMaisVendidos;

    function abrir: iRealatorioProdutosMaisVendidos;
    function atualizar: iRealatorioProdutosMaisVendidos;
    function cancelar: iRealatorioProdutosMaisVendidos;
    function fecharQuery: iRealatorioProdutosMaisVendidos;
    function listarGrid(value: TDataSource): iRealatorioProdutosMaisVendidos;
    function ordenarGrid(column: TColumn): iRealatorioProdutosMaisVendidos;

    function produtosMaisVendidos:iRealatorioProdutosMaisVendidos;
    function produtosMenosVendidos:iRealatorioProdutosMaisVendidos;

    function exportar: iRealatorioProdutosMaisVendidos;
    function validarData(componet: tmaskEdit): iRealatorioProdutosMaisVendidos;

    constructor create;
    destructor destroy; override;
    class function new:iRealatorioProdutosMaisVendidos ;
  end;

implementation

{ TRelatorioMaisVendidos }

function TRelatorioProdutosMaisVendidos.abrir:iRealatorioProdutosMaisVendidos ;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioProdutosMaisVendidos.atualizar:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioProdutosMaisVendidos.cancelar:iRealatorioProdutosMaisVendidos ;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioProdutosMaisVendidos.create;
begin
  FTabela := 'PRODUTOS_MAIS_VENDIDOS01';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio de produtos mais vendidos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioProdutosMaisVendidos.destroy;
begin

  inherited;
end;

function TRelatorioProdutosMaisVendidos.ExecSql:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioProdutosMaisVendidos.exportar:iRealatorioProdutosMaisVendidos ;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Produtos mais / menos vendidos';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'Produto';
  pasta.cells[1, 3] := 'Quantidade';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_PRODUTO').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('PRODUTO').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('QTDE').AsInteger;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioProdutosMaisVendidos.fecharQuery:iRealatorioProdutosMaisVendidos ;
begin
  FQuery.TQuery.close;
end;

function TRelatorioProdutosMaisVendidos.getCampo(value: string):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioProdutosMaisVendidos.getDataFinal(value: TDate):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioProdutosMaisVendidos.getDataInicial(value: TDate):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioProdutosMaisVendidos.getValor(value: string):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioProdutosMaisVendidos.listarGrid(value: TDataSource):iRealatorioProdutosMaisVendidos ;
begin

  result := self;

  FQuery.TQuery.FieldByName('QTDE').DisplayLabel := 'Quantidade';
  FQuery.TQuery.FieldByName('ID_PRODUTO').DisplayLabel := 'C�d. Produto';
  FQuery.TQuery.FieldByName('PRODUTO').DisplayLabel := 'Produto';

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioProdutosMaisVendidos.new:iRealatorioProdutosMaisVendidos ;
begin
  result := self.create;
end;

function TRelatorioProdutosMaisVendidos.nomeTabela(value: string):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioProdutosMaisVendidos.open(value: string):iRealatorioProdutosMaisVendidos ;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioProdutosMaisVendidos.ordenarGrid(column: TColumn):iRealatorioProdutosMaisVendidos ;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioProdutosMaisVendidos.pesquisar:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
end;

function TRelatorioProdutosMaisVendidos.produtosMaisVendidos: iRealatorioProdutosMaisVendidos;
begin
  result := self;
  FQuery.ExecSql('select * from  PRODUTOS_MAIS_VENDIDOS01 order by QTDE desc')
end;

function TRelatorioProdutosMaisVendidos.produtosMenosVendidos: iRealatorioProdutosMaisVendidos;
begin
  result := self;
  FQuery.ExecSql('select * from  PRODUTOS_MAIS_VENDIDOS01 order by QTDE asc')
end;

function TRelatorioProdutosMaisVendidos.sqlPesquisa:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioProdutosMaisVendidos.sqlPesquisaData:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioProdutosMaisVendidos.sqlPesquisaEstatica:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioProdutosMaisVendidos.validarData(componet: tmaskEdit):iRealatorioProdutosMaisVendidos;
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
