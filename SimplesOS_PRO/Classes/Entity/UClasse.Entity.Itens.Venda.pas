unit UClasse.Entity.Itens.Venda;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls, Datasnap.DBClient, RxToolEdit, RxCurrEdit;

type

  TEntityItensVenda = class(TInterfacedObject, iItensVendas)
  private

    FQuery: iConexaoQuery;
    FQueryProdutos: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_VENDA: integer;
    FID_CLIENTE: integer;
    FID_PRODUTO: integer;
    FPRODUTO: string;
    FVALOR_UNITARIO: Currency;
    FQUANTIDADE: integer;
    FTOTAL: Currency;

    FCodigo: integer;
    FNome: string;

    FtotalUnitario: Currency;
    FQuantidadeUnitario: integer;

    procedure getValorUnitatio(vlrProduto: TCurrencyEdit);
    procedure totalDeItens(qtdeProduto: TEdit);
    procedure selecionarProdutoDecremento(value: integer);

  public

    function nomeTabela(value: string): iItensVendas;
    function getCampo(value: string): iItensVendas;
    function getValor(value: string): iItensVendas;
    function getDataInicial(value: TDate): iItensVendas;
    function getDataFinal(value: TDate): iItensVendas;
    function open(value: string): iItensVendas;
    function pesquisar: iItensVendas;
    function ExecSql: iItensVendas;
    function sqlPesquisa: iItensVendas;
    function sqlPesquisaData: iItensVendas;
    function sqlPesquisaEstatica: iItensVendas;

    function abrir: iItensVendas;
    function inserir: iItensVendas;
    function Gravar: iItensVendas;
    function deletar: iItensVendas;
    function atualizar: iItensVendas;
    function editar: iItensVendas;
    function cancelar: iItensVendas;
    function fecharQuery: iItensVendas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iItensVendas;
    function ordenarGrid(column: TColumn): iItensVendas;

    function getID(value: integer): iItensVendas;
    function getID_VENDA(value: integer): iItensVendas;
    function getID_CLIENTE(value: integer): iItensVendas;
    function getID_PRODUTO(value: integer): iItensVendas;
    function getProduto(value: string): iItensVendas;
    function getVALOR_UNITARIO(value: string): iItensVendas;
    function getQUANTIDADE(value: integer): iItensVendas;
    function getTOTAL(value: string): iItensVendas;

    function gravarItensDaVenda(value: TClientDataSet): iItensVendas;
    function decrementarEstoque(value: TClientDataSet): iItensVendas;

    function calularTotalXquantidade(qtdeProduto:TEDit ; vlrProduto:TCurrencyEdit): Currency;

    function exportar: iItensVendas;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iItensVendas;
    function getNome(value: string): iItensVendas;

    constructor create;
    destructor destroy; override;
    class function new: iItensVendas;
  end;

implementation

{ TEntityItensVenda }

function TEntityItensVenda.abrir: iItensVendas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityItensVenda.atualizar: iItensVendas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityItensVenda.calularTotalXquantidade(qtdeProduto:TEDit ; vlrProduto:TCurrencyEdit): Currency;
begin

  result := 0;

  getValorUnitatio(vlrProduto);
  totalDeItens(qtdeProduto);

  result := FtotalUnitario * FQuantidadeUnitario;

end;

function TEntityItensVenda.cancelar: iItensVendas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityItensVenda.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityItensVenda.create;
begin
  FTabela := 'ITENS_VENDA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryProdutos := TConexaoQuery.new.Query('PRODUTOS');

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('ID_VENDA').getCodigoFuncionario(funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityItensVenda.decrementarEstoque(value: TClientDataSet)
  : iItensVendas;
begin

  result := self;

  value.First;

  while not value.Eof do
  begin

   selecionarProdutoDecremento(value.FieldByName('codigo_produto').AsInteger);

   FQueryProdutos.TQuery.Edit;

   FQueryProdutos.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger :=
        FQueryProdutos.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger -
        value.FieldByName('Quantidade').AsInteger;

   FQueryProdutos.TQuery.Post;


    value.Next;
  end;

end;

function TEntityItensVenda.deletar: iItensVendas;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog := TGravarLogSistema.new;
      FGravarLog.getJanela('ID_VENDA').getCodigoFuncionario(funcionarioLogado);

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityItensVenda.destroy;
begin

  inherited;
end;

function TEntityItensVenda.editar: iItensVendas;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog := TGravarLogSistema.new;
    FGravarLog.getJanela('ID_VENDA').getCodigoFuncionario(funcionarioLogado);

    FQuery.TQuery.Edit;

  end;
end;

function TEntityItensVenda.ExecSql: iItensVendas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityItensVenda.exportar: iItensVendas;
begin
  result := self;
end;

function TEntityItensVenda.fecharQuery: iItensVendas;
begin
  FQuery.TQuery.close;
end;

function TEntityItensVenda.getCampo(value: string): iItensVendas;
begin
  result := self;
  FCampo := value;
end;

function TEntityItensVenda.getCodigo(value: integer): iItensVendas;
begin
  result := self;
  FCodigo := value;
end;

function TEntityItensVenda.getDataFinal(value: TDate): iItensVendas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityItensVenda.getDataInicial(value: TDate): iItensVendas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityItensVenda.getID(value: integer): iItensVendas;
begin
  result := self;
  FID := value;
end;

function TEntityItensVenda.getID_CLIENTE(value: integer): iItensVendas;
begin
  result := self;
  FID_CLIENTE := value;
end;

function TEntityItensVenda.getID_PRODUTO(value: integer): iItensVendas;
begin
  result := self;
  if value = 0 then
    raise Exception.create('Informe o produto que esta inserindo.');
  FID_PRODUTO := value;
end;

function TEntityItensVenda.getID_VENDA(value: integer): iItensVendas;
begin
  result := self;
  if value = 0 then
    raise Exception.create('Informe a venda para este item do produtos.');
  FID_VENDA := value;
end;

function TEntityItensVenda.getNome(value: string): iItensVendas;
begin
  result := self;
  FNome := value;
end;

function TEntityItensVenda.getProduto(value: string): iItensVendas;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe o produto antes de continuar');
  FPRODUTO := value;
end;

function TEntityItensVenda.getQUANTIDADE(value: integer): iItensVendas;
begin
  result := self;
  if value = 0 then
    raise Exception.create('Informe a quantidade de itens do produto');
  FQUANTIDADE := value;
end;

function TEntityItensVenda.getTOTAL(value: string): iItensVendas;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe o valor total dos itens deste produtos');
  try
    FTOTAL := StrToCurr(value);
  except
    on e: Exception do
    begin
      raise Exception.create
        ('Digite um valor v�lido para o campo Total dos itens.');
    end;

  end;

end;

function TEntityItensVenda.getValor(value: string): iItensVendas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityItensVenda.getVALOR_UNITARIO(value: string): iItensVendas;
begin
  result := self;

  if value = EmptyStr then
    raise Exception.create
      ('Informe uma quantidade superior a zero(0) para a quantidade de itens');

  try
    FVALOR_UNITARIO := StrToCurr(value);
  except
    on e: Exception do
    begin
      raise Exception.create('Digite um valor v�lido para o Valor Unit�rio');
    end;

  end;

end;

function TEntityItensVenda.Gravar: iItensVendas;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_ITENS_VENDA_ID');

  with FQuery.TQuery do
  begin
    FieldByName('ID_VENDA').AsInteger := FID_VENDA;
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('ID_PRODUTO').AsInteger := FID_PRODUTO;
    FieldByName('PRODUTO').AsString := FPRODUTO;
    FieldByName('VALOR_UNITARIO').AsCurrency := FVALOR_UNITARIO;
    FieldByName('QUANTIDADE').AsInteger := FQUANTIDADE;
    FieldByName('TOTAL').AsCurrency := FTOTAL;
  end;

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('ID_VENDA').getCodigoFuncionario(funcionarioLogado);

  try
    FQuery.TQuery.Post;
  except
    on e: Exception do
    begin
      raise Exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityItensVenda.gravarItensDaVenda(value: TClientDataSet)
  : iItensVendas;
begin
  result := self;

  value.First;

  while not value.Eof do
  begin

    FQuery.TQuery.Insert;

    if FQuery.TQuery.State in [dsInsert] then
      FQuery.TQuery.FieldByName('id').AsInteger :=
        FQuery.codigoCadastro('SP_GEN_ITENS_VENDA_ID');

    with FQuery.TQuery do
    begin
      FieldByName('ID_VENDA').AsInteger := FID_VENDA;
      FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
      FieldByName('ID_PRODUTO').AsInteger := value.FieldByName('codigo_produto')
        .AsInteger;
      FieldByName('PRODUTO').AsString := value.FieldByName('Produto').AsString;
      FieldByName('VALOR_UNITARIO').AsCurrency :=
        value.FieldByName('Valor_unitario').AsCurrency;
      FieldByName('QUANTIDADE').AsInteger := value.FieldByName('Quantidade')
        .AsInteger;
      FieldByName('TOTAL').AsCurrency := value.FieldByName('Total_do_produto')
        .AsCurrency;
    end;

    FQuery.TQuery.Post;

    value.Next;
  end;

end;

function TEntityItensVenda.inserir: iItensVendas;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityItensVenda.listarGrid(value: TDataSource): iItensVendas;
begin

  result := self;
  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'C�digo';
    FieldByName('ID_VENDA').DisplayLabel := 'Venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('ID_PRODUTO').DisplayLabel := 'C�d. Produto';
    FieldByName('PRODUTO').DisplayLabel := 'Produto';
    FieldByName('VALOR_UNITARIO').DisplayLabel := 'Valor unit�rio';
    FieldByName('QUANTIDADE').DisplayLabel := 'Quantidade';
    FieldByName('TOTAL').DisplayLabel := 'Total dos itens';
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityItensVenda.new: iItensVendas;
begin
  result := self.create;
end;

procedure TEntityItensVenda.totalDeItens(qtdeProduto: TEdit);
begin
  if qtdeProduto.Text <> EmptyStr then
  begin
    try
      FQuantidadeUnitario := StrToInt(qtdeProduto.Text);
    except
      on e: Exception do
      begin
        qtdeProduto.Clear;
        qtdeProduto.SetFocus;
        raise Exception.create
          ('Digite um valor v�lido para o Valor do Produto.');
      end;
    end;
  end
  else
  begin
    raise Exception.create
      ('Digite um valor igual ou maior que zero(0) para o valor do produto');
  end;
end;

procedure TEntityItensVenda.getValorUnitatio(vlrProduto: TCurrencyEdit);
begin
  if vlrProduto.Text <> EmptyStr then
  begin
    try
      FtotalUnitario := StrToCurr(vlrProduto.Text);
    except
      on e: Exception do
      begin
        vlrProduto.Clear;
        vlrProduto.SetFocus;
        raise Exception.create
          ('Digite um valor v�lido para o Valor do Produto.');
      end;
    end;
  end
  else
  begin
    raise Exception.create
      ('Digite um valor igual ou maior que zero(0) para o valor do produto');
  end;
end;

function TEntityItensVenda.nomeTabela(value: string): iItensVendas;
begin
  result := self;
  FTabela := value;
end;

function TEntityItensVenda.open(value: string): iItensVendas;
begin
  FQuery.Query(FTabela);
end;

function TEntityItensVenda.ordenarGrid(column: TColumn): iItensVendas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityItensVenda.pesquisar: iItensVendas;
begin
  result := self;
end;

procedure TEntityItensVenda.selecionarProdutoDecremento(value: integer);
begin

  FQueryProdutos.getCampo('ID').getValor(value.ToString)
    .sqlPesquisaEstatica('PRODUTOS');

end;

function TEntityItensVenda.sqlPesquisa: iItensVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityItensVenda.sqlPesquisaData: iItensVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityItensVenda.sqlPesquisaEstatica: iItensVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityItensVenda.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise Exception.create('Digite uma data v�lida.');
  end;
end;

end.
