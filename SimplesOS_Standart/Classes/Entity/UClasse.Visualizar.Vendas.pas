unit UClasse.Visualizar.Vendas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj, UClasse.Estornar.Venda;

type

  TEntityVisuzaliarVendas = class(TInterfacedObject, iVisualizarVenda)
  private

    FQuery: iConexaoQuery;
    FQueryItens: iConexaoQuery;
    FQueryProdutos:iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FEstornarVenda: iEstonarVenda;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iVisualizarVenda;
    function getCampo(value: string): iVisualizarVenda;
    function getValor(value: string): iVisualizarVenda;
    function getDataInicial(value: TDate): iVisualizarVenda;
    function getDataFinal(value: TDate): iVisualizarVenda;
    function open(value: string): iVisualizarVenda;
    function pesquisar: iVisualizarVenda;
    function ExecSql: iVisualizarVenda;
    function sqlPesquisa: iVisualizarVenda;
    function sqlPesquisaData: iVisualizarVenda;
    function sqlPesquisaEstatica: iVisualizarVenda;

    function abrir: iVisualizarVenda;
    function atualizar: iVisualizarVenda;
    function fecharQuery: iVisualizarVenda;
    function listarGrid(value: TDataSource): iVisualizarVenda;
    function listarGridItens(value: TDataSource): iVisualizarVenda;
    function estornarVenda(value: integer): iVisualizarVenda;
    function selecionarItens(value: integer): iVisualizarVenda;
    function ordenarGrid(column: TColumn): iVisualizarVenda;

    function deletarVenda: iVisualizarVenda;
    function atualizarItens: iVisualizarVenda;

    function exportar: iVisualizarVenda;
    function exportarItens: iVisualizarVenda;

    function selecionarProdutos(value:integer):iVisualizarVenda;

    constructor create;
    destructor destroy; override;
    class function new: iVisualizarVenda;
  end;

implementation

{ TEntityVisuzaliarVendas }

function TEntityVisuzaliarVendas.abrir: iVisualizarVenda;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityVisuzaliarVendas.atualizar: iVisualizarVenda;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityVisuzaliarVendas.atualizarItens: iVisualizarVenda;
begin
  result := self;
  FQueryItens.TQuery.Refresh;
end;

constructor TEntityVisuzaliarVendas.create;
begin
  FTabela := 'VENDA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryItens := TConexaoQuery.new.Query('ITENS_VENDA');

  FQueryProdutos := TConexaoQuery.new.Query('PRODUTOS');

  FEstornarVenda := TEntityVendasEstornadas.new;

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Visualizar venda de produtos')
    .getCodigoFuncionario(funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityVisuzaliarVendas.deletarVenda: iVisualizarVenda;
begin

  result := self;
  if Application.MessageBox('Deseja realmente excluir esta venda?',
    'Pergunta do sistema', MB_YESNO + MB_ICONWARNING) = mryes then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_CLIENTE')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('ID')
      .AsInteger).getOperacao('estornada').gravarLog;

    FQuery.TQuery.Delete;

  end;

end;

destructor TEntityVisuzaliarVendas.destroy;
begin

  inherited;
end;

function TEntityVisuzaliarVendas.estornarVenda(value: integer)
  : iVisualizarVenda;
var
  F_QueryParcelas: iConexaoQuery;
  FMotivo:string;
begin

  result := self;

  if Application.MessageBox('Deseja realmente estornar esta venda?',
    'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = mryes then
  begin

    FMotivo := InputBox('Informe o motivo do estorno', 'Motivo do estorno', '');
    if FMotivo = EmptyStr then
       raise Exception.Create('OPERA��O DE ESTORNO CANCELADA!');

    try

      F_QueryParcelas := TConexaoQuery.new.Query('PARCELAS_VENDAS');

      FQuery.TQuery.Edit;
      FQuery.TQuery.FieldByName('STATUS').AsString := 'Estornada';
      FQuery.TQuery.Post;

      begin

        F_QueryParcelas.TQuery.Active := false;
        F_QueryParcelas.TQuery.SQL.Clear;
        F_QueryParcelas.TQuery.SQL.Add
          ('select * from PARCELAS_VENDAS where ID_VENDA =:v');
        F_QueryParcelas.TQuery.ParamByName('v').AsInteger := value;
        F_QueryParcelas.TQuery.Active := true;

        F_QueryParcelas.TQuery.First;

        while not F_QueryParcelas.TQuery.Eof do
        begin

          F_QueryParcelas.TQuery.Edit;
          F_QueryParcelas.TQuery.FieldByName('PAGO').AsString := 'Estornada';
          F_QueryParcelas.TQuery.FieldByName('DATA_ESTORNO').AsDateTime := date;
          F_QueryParcelas.TQuery.Post;

          F_QueryParcelas.TQuery.Next;

        end;
      end;

      FEstornarVenda
                  .getID_VENDA(FQuery.TQuery.FieldByName('ID').AsInteger)
                  .getID_CLIENTE(FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger)
                  .getVALOR_VENDA(FQuery.TQuery.FieldByName('TOTAL').AsCurrency)
                  .getDATA(DateToStr(date))
                  .getHORA(TimeToStr(time))
                  .getMOTIVO(FMotivo)
                  .getFUNCIONARIO(funcionarioLogado)
                  .getNOME_FUNCIONARIO(NomeFuncionarioLogado)
                  .getOBSERVACAO('')
                  .inserir.Gravar;

      showmessage('Venda estornada com sucesso!!!');

//      if application.MessageBox('Deseja readicionar os produtos da venda estornada no estoque?',
//       'Pergunta do sistema', MB_YESNO+MB_ICONWARNING)=mryes then
//       begin
//         selecionarProdutos(0);
//       end;


      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_CLIENTE')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('ID')
        .AsInteger).getOperacao('estornada').gravarLog;

    except
      on e: exception do
        raise exception.create('Houve um erro ao tentar estornar esta venda. ' +
          e.Message);

    end;
  end;

end;

function TEntityVisuzaliarVendas.ExecSql: iVisualizarVenda;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityVisuzaliarVendas.exportar: iVisualizarVenda;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Lista da vendas realizadas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Venda';
  pasta.cells[1, 2] := 'C�d. cliente';
  pasta.cells[1, 3] := 'Nome do cliente';
  pasta.cells[1, 4] := 'Funcion�rio';
  pasta.cells[1, 5] := 'Nome do funcionario';
  pasta.cells[1, 6] := 'Data da venda';
  pasta.cells[1, 7] := 'Hora da venda';
  pasta.cells[1, 8] := 'Subtotal';
  pasta.cells[1, 9] := 'Desconto';
  pasta.cells[1, 10] := 'Total';
  pasta.cells[1, 11] := 'QTDE de parcelas';
  pasta.cells[1, 12] := 'Forma de pagamento';
  pasta.cells[1, 13] := 'Status';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('id').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('NOME_CLIENTE').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('DATA_VENDA').AsDateTime;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('HORA_VENDA').AsDateTime;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('SUBTOTAL').AsCurrency;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('TOTAL').AsCurrency;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('QUANTIDADE_PARCELAS').AsInteger;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('FORMA_PAGAMENTO').AsString;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('STATUS').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityVisuzaliarVendas.exportarItens: iVisualizarVenda;
var
  pasta: variant;
  linha: integer;
begin

  FQueryItens.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Itens da venda selecionada';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Venda';
  pasta.cells[1, 2] := 'C�d. ID_VENDA';
  pasta.cells[1, 3] := 'C�d. Cliente';
  pasta.cells[1, 4] := 'C�d. Produto';
  pasta.cells[1, 5] := 'Produto';
  pasta.cells[1, 6] := 'Valor unit�rio';
  pasta.cells[1, 7] := 'Quantidade';

  try
    while not FQueryItens.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQueryItens.TQuery.FieldByName('ID_VENDA')
        .AsInteger;
      pasta.cells[linha, 2] := FQueryItens.TQuery.FieldByName('ID_CLIENTE')
        .AsInteger;
      pasta.cells[linha, 3] := FQueryItens.TQuery.FieldByName('ID_PRODUTO')
        .AsInteger;
      pasta.cells[linha, 4] := FQueryItens.TQuery.FieldByName
        ('PRODUTO').AsString;
      pasta.cells[linha, 5] := FQueryItens.TQuery.FieldByName('VALOR_UNITARIO')
        .AsCurrency;
      pasta.cells[linha, 6] := FQueryItens.TQuery.FieldByName('QUANTIDADE')
        .AsInteger;
      pasta.cells[linha, 7] := FQueryItens.TQuery.FieldByName('TOTAL')
        .AsCurrency;

      linha := linha + 1;

      FQueryItens.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityVisuzaliarVendas.fecharQuery: iVisualizarVenda;
begin
  FQuery.TQuery.close;
end;

function TEntityVisuzaliarVendas.getCampo(value: string): iVisualizarVenda;
begin
  result := self;
  FCampo := value;
end;

function TEntityVisuzaliarVendas.getDataFinal(value: TDate): iVisualizarVenda;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityVisuzaliarVendas.getDataInicial(value: TDate): iVisualizarVenda;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityVisuzaliarVendas.getValor(value: string): iVisualizarVenda;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityVisuzaliarVendas.listarGrid(value: TDataSource)
  : iVisualizarVenda;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'Venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Nome do cliente';
    FieldByName('FUNCIONARIO').visible := false;
    FieldByName('NOME_FUNCIONARIO').visible := false;
    FieldByName('DATA_VENDA').DisplayLabel := 'Data de venda';
    FieldByName('HORA_VENDA').DisplayLabel := 'Hora da venda';
    FieldByName('SUBTOTAL').DisplayLabel := 'Subtotal';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('ACRESCIMO').visible := false;
    FieldByName('TOTAL').DisplayLabel := 'Total';
    FieldByName('QUANTIDADE_PARCELAS').DisplayLabel := 'QTDE parcelas';
    FieldByName('VENCIMENTO').visible := false;
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('STATUS').DisplayLabel := 'Status';
    FieldByName('OBSERACAO').visible := false;

    FieldByName('NOME_CLIENTE').DisplayWidth := 30;
    FieldByName('FORMA_PAGAMENTO').DisplayWidth := 20;

  end;

  value.DataSet := FQuery.TQuery;

end;

function TEntityVisuzaliarVendas.listarGridItens(value: TDataSource)
  : iVisualizarVenda;
begin
  result := self;

  with FQueryItens.TQuery do
  begin

    FieldByName('ID').visible := false;
    FieldByName('ID_VENDA').visible := false;
    FieldByName('ID_CLIENTE').visible := false;
    FieldByName('ID_PRODUTO').DisplayLabel := 'C�d. Produto';
    FieldByName('PRODUTO').DisplayLabel := 'Produto';
    FieldByName('VALOR_UNITARIO').DisplayLabel := 'Valor unit�rio';
    FieldByName('QUANTIDADE').DisplayLabel := 'Quantidade';
    FieldByName('TOTAL').DisplayLabel := 'Total';

    FieldByName('PRODUTO').DisplayWidth := 40;

  end;

  value.DataSet := FQueryItens.TQuery;

end;

class function TEntityVisuzaliarVendas.new: iVisualizarVenda;
begin
  result := self.create;
end;

function TEntityVisuzaliarVendas.nomeTabela(value: string): iVisualizarVenda;
begin
  result := self;
  FTabela := value;
end;

function TEntityVisuzaliarVendas.open(value: string): iVisualizarVenda;
begin
  FQuery.Query(FTabela);
end;

function TEntityVisuzaliarVendas.ordenarGrid(column: TColumn): iVisualizarVenda;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityVisuzaliarVendas.pesquisar: iVisualizarVenda;
begin
  result := self;
end;

function TEntityVisuzaliarVendas.selecionarItens(value: integer)
  : iVisualizarVenda;
begin
  result := self;

  with FQueryItens do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from ITENS_VENDA where ID_VENDA =:v');
    TQuery.ParamByName('v').AsInteger := value;
    TQuery.Active := true;

  end;

end;

function TEntityVisuzaliarVendas.selecionarProdutos(
  value: integer): iVisualizarVenda;
  var
     qtdeAtualProdutos:integer;
     idProdutos:integer;
     nomeProduto:string;
begin

  result := self;

  FQueryItens
            .getCampo('ID_VENDA')
            .getValor(FQuery.TQuery.FieldByName('id').AsInteger.ToString)
            .sqlPesquisaEstatica('ITENS_VENDA');

   showmessage(FQueryItens.TQuery.RecordCount.ToString);

  FQueryItens.TQuery.First;

  while not FQueryItens.TQuery.Eof do
  begin

      FQueryProdutos
                .getCampo('ID')
                .getValor(FQueryItens.TQuery.FieldByName('ID_VENDA').AsInteger.ToString)
                .sqlPesquisaEstatica('PRODUTOS');

    idProdutos := FQueryProdutos.TQuery.FieldByName('ID').AsInteger;

    FQueryProdutos.TQuery.ExecSQL('update produtos set produtos.QUANTIDADE_ATUAL =:qtde where produtos.id =:i');
    FQueryProdutos.TQuery.ParamByName('qtde').AsInteger :=
                      FQueryProdutos.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger +
                      FQueryItens.TQuery.FieldByName('QUANTIDADE').AsInteger;
    FQueryProdutos.TQuery.ParamByName('i').AsInteger := idProdutos;

//    FQueryProdutos
//                .getCampo('ID')
//                .getValor(FQueryItens.TQuery.FieldByName('ID_VENDA').AsInteger.ToString)
//                .sqlPesquisaEstatica('PRODUTOS');
//
//    ShowMessage(FQuery.TQuery.RecordCount.ToString);
//
//    qtdeAtualProdutos := FQueryProdutos.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger;
//
//    idProdutos := FQueryProdutos.TQuery.FieldByName('ID').AsInteger;
//    nomeProduto := FQueryProdutos.TQuery.FieldByName('PRODUTO').AsString;
//
//    FQueryProdutos.TQuery.Edit;
//    FQueryProdutos.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger := qtdeAtualProdutos +
//                            FQueryItens.TQuery.FieldByName('QUANTIDADE').AsInteger;
//
//    FQueryProdutos.TQuery.FieldByName('ID').AsInteger := idProdutos;
//    FQueryProdutos.TQuery.FieldByName('PRODUTO').AsString := nomeProduto;
//
//    try
//      FQueryProdutos.TQuery.Post;
//    except on e:exception do
//    begin
//      raise Exception.Create('ERRO! N�o foi poss�vel atualizar o estoque. '
//        + e.Message);
//    end;

    end;


    FQueryItens.TQuery.Next;

  end;

function TEntityVisuzaliarVendas.sqlPesquisa: iVisualizarVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityVisuzaliarVendas.sqlPesquisaData: iVisualizarVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityVisuzaliarVendas.sqlPesquisaEstatica: iVisualizarVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
