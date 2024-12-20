unit UClasse.Entity.Localizar.Produto.Venda;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type

  TEntityLocalizarProdutoVenda = class(TInterfacedObject,
    iLocalizarProdutosVenda)
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
    function nomeTabela(value: string): iLocalizarProdutosVenda;
    function getCampo(value: string): iLocalizarProdutosVenda;
    function getValor(value: string): iLocalizarProdutosVenda;
    function getDataInicial(value: TDate): iLocalizarProdutosVenda;
    function getDataFinal(value: TDate): iLocalizarProdutosVenda;
    function open(value: string): iLocalizarProdutosVenda;
    function pesquisar: iLocalizarProdutosVenda;
    function ExecSql: iLocalizarProdutosVenda;
    function sqlPesquisa: iLocalizarProdutosVenda;
    function sqlPesquisaData: iLocalizarProdutosVenda;
    function sqlPesquisaEstatica: iLocalizarProdutosVenda;
    function abrir: iLocalizarProdutosVenda;
    function listarGrid(value: TDataSource): iLocalizarProdutosVenda;
    function ordenarGrid(column: TColumn): iLocalizarProdutosVenda;

    function setCodigoDoProduto: integer;
    function setNomeDoProduto: string;
    function setQuantidade: integer;
    function setQuantidadeEmEstoque: integer;
    function setSituacaoDoEstoque: string;
    function setCodigoDeBarras: string;
    function setFotoProduto(value: TImage): iLocalizarProdutosVenda;
    function setValorUnitarioProduto:Currency;

    constructor create;
    destructor destroy; override;
    class function new: iLocalizarProdutosVenda;
  end;

implementation

{ TEntityLocalizarProdutoVenda }

function TEntityLocalizarProdutoVenda.abrir: iLocalizarProdutosVenda;
begin

  result := self;
  FQuery.Query(FTabela);

end;

constructor TEntityLocalizarProdutoVenda.create;
begin
  FTabela := 'PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Localizar produtos - Venda').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityLocalizarProdutoVenda.destroy;
begin

  inherited;
end;

function TEntityLocalizarProdutoVenda.ExecSql: iLocalizarProdutosVenda;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityLocalizarProdutoVenda.getCampo(value: string)
  : iLocalizarProdutosVenda;
begin
  result := self;
  FCampo := value;
end;

function TEntityLocalizarProdutoVenda.getDataFinal(value: TDate)
  : iLocalizarProdutosVenda;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityLocalizarProdutoVenda.getDataInicial(value: TDate)
  : iLocalizarProdutosVenda;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityLocalizarProdutoVenda.getValor(value: string)
  : iLocalizarProdutosVenda;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityLocalizarProdutoVenda.listarGrid(value: TDataSource)
  : iLocalizarProdutosVenda;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'C�digo';
    FieldByName('PRODUTO').DisplayLabel := 'Produto';
    FieldByName('CODIGO_BARRAS').DisplayLabel := 'C�digo de barras';
    FieldByName('DESCRICAO').Visible := false;
    FieldByName('VALOR_CUSTO').Visible := false;
    FieldByName('MARGEM_LUCRO').Visible := false;
    FieldByName('VALOR_VENDA').DisplayLabel := 'Pre�o';
    FieldByName('QUANTIDADE_MINIMA').Visible := false;
    FieldByName('QUANTIDADE_ATUAL').DisplayLabel := 'QTDE.Atual';
    FieldByName('DATA_VALIDADE').Visible := false;
    FieldByName('DATA_ALTERACAO').Visible := false;
    FieldByName('ID_GRUPO').Visible := false;
    FieldByName('GRUPO').Visible := false;
    FieldByName('ID_MARCA').Visible := false;
    FieldByName('MARCA').Visible := false;
    FieldByName('MODELO').Visible := false;
    FieldByName('NUMERO_SERIE').Visible := false;
    FieldByName('DATA_FABRICACAO').Visible := false;
    FieldByName('FUNCIONARIO').Visible := false;
    FieldByName('FOTO').Visible := false;
    FieldByName('OBSERVACAO').Visible := false;

    FieldByName('PRODUTO').DisplayWidth := 50;
    FieldByName('CODIGO_BARRAS').DisplayWidth := 37;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityLocalizarProdutoVenda.new: iLocalizarProdutosVenda;
begin
  result := self.create;
end;

function TEntityLocalizarProdutoVenda.nomeTabela(value: string)
  : iLocalizarProdutosVenda;
begin
  result := self;
  FTabela := value;
end;

function TEntityLocalizarProdutoVenda.open(value: string)
  : iLocalizarProdutosVenda;
begin
  FQuery.Query(FTabela);
end;

function TEntityLocalizarProdutoVenda.ordenarGrid(column: TColumn)
  : iLocalizarProdutosVenda;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityLocalizarProdutoVenda.pesquisar: iLocalizarProdutosVenda;
begin
  result := self;
end;

function TEntityLocalizarProdutoVenda.setCodigoDeBarras: string;
begin
  result := FQuery.TQuery.FieldByName('CODIGO_BARRAS').AsString;
end;

function TEntityLocalizarProdutoVenda.setCodigoDoProduto: integer;
begin
  result := FQuery.TQuery.FieldByName('ID').AsInteger;
end;

function TEntityLocalizarProdutoVenda.setFotoProduto(value: TImage)
  : iLocalizarProdutosVenda;
begin

  result := self;

  value.Picture.Assign(TGraphicField(FQuery.TQuery.FieldByName('FOTO')));


end;

function TEntityLocalizarProdutoVenda.setNomeDoProduto: string;
begin
  result := FQuery.TQuery.FieldByName('PRODUTO').AsString;
end;

function TEntityLocalizarProdutoVenda.setQuantidade: integer;
begin
  result := 1;
end;

function TEntityLocalizarProdutoVenda.setQuantidadeEmEstoque: integer;
begin
  result := FQuery.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger;
end;

function TEntityLocalizarProdutoVenda.setSituacaoDoEstoque: string;
begin

  if FQuery.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger <= 0 then
  begin
    result := 'zerado';
    raise Exception.create
      ('O estoque deste produto est� zerado. N�o � poss�vel realizar vendas at� normalizar este produto.');
  end
  else if FQuery.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger <=
    FQuery.TQuery.FieldByName('QUANTIDADE_MINIMA').AsInteger then
  begin
    result := 'baixo';
    showmessage('H� poucos itens deste produto no estoque.' +
      ' Total de itens restante no estoque: ' +
      IntToStr(FQuery.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger));
  end
  else
  begin
    result := 'normal';
  end;

end;

function TEntityLocalizarProdutoVenda.setValorUnitarioProduto: Currency;
begin
  result := FQuery.TQuery.FieldByName('VALOR_VENDA').AsCurrency;
end;

function TEntityLocalizarProdutoVenda.sqlPesquisa: iLocalizarProdutosVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityLocalizarProdutoVenda.sqlPesquisaData: iLocalizarProdutosVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityLocalizarProdutoVenda.sqlPesquisaEstatica
  : iLocalizarProdutosVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
