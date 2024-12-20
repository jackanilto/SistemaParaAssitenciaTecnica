unit UClasse.Historico.Produtos.Mais.Vendidos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TRelatorioMaisVendidos = class(TInterfacedObject, iRealatorioProdutosMaisVendidos)
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

function TRelatorioMaisVendidos.abrir:iRealatorioProdutosMaisVendidos ;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioMaisVendidos.atualizar:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioMaisVendidos.cancelar:iRealatorioProdutosMaisVendidos ;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioMaisVendidos.create;
begin
  FTabela := 'PRODUTOS_MAIS_VENDIDOS01';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio de produtos mais vendidos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioMaisVendidos.destroy;
begin

  inherited;
end;

function TRelatorioMaisVendidos.ExecSql:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioMaisVendidos.exportar:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
end;

function TRelatorioMaisVendidos.fecharQuery:iRealatorioProdutosMaisVendidos ;
begin
  FQuery.TQuery.close;
end;

function TRelatorioMaisVendidos.getCampo(value: string):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioMaisVendidos.getDataFinal(value: TDate):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioMaisVendidos.getDataInicial(value: TDate):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioMaisVendidos.getValor(value: string):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioMaisVendidos.listarGrid(value: TDataSource):iRealatorioProdutosMaisVendidos ;
begin

  result := self;

  FQuery.TQuery.FieldByName('QTDE').DisplayLabel := 'Quantidade';
  FQuery.TQuery.FieldByName('ID_PRODUTO').DisplayLabel := 'C�d. Produto';
  FQuery.TQuery.FieldByName('PRODTUO').DisplayLabel := 'Produto';

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioMaisVendidos.new:iRealatorioProdutosMaisVendidos ;
begin
  result := self.create;
end;

function TRelatorioMaisVendidos.nomeTabela(value: string):iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioMaisVendidos.open(value: string):iRealatorioProdutosMaisVendidos ;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioMaisVendidos.ordenarGrid(column: TColumn):iRealatorioProdutosMaisVendidos ;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioMaisVendidos.pesquisar:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
end;

function TRelatorioMaisVendidos.produtosMaisVendidos: iRealatorioProdutosMaisVendidos;
begin
  result := self;
end;

function TRelatorioMaisVendidos.produtosMenosVendidos: iRealatorioProdutosMaisVendidos;
begin
  result := self;
end;

function TRelatorioMaisVendidos.sqlPesquisa:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioMaisVendidos.sqlPesquisaData:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioMaisVendidos.sqlPesquisaEstatica:iRealatorioProdutosMaisVendidos ;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioMaisVendidos.validarData(componet: tmaskEdit):iRealatorioProdutosMaisVendidos;
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
