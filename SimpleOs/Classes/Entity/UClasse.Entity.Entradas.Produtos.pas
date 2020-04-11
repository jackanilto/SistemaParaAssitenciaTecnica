unit UClasse.Entity.Entradas.Produtos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TEntityEntradasProdutos = class(TInterfacedObject, iEntradaProdutos)
  private

    FQuery: iConexaoQuery;
    FQueryAtulizarProdutos: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_PRODUTO: integer;
    FPRODUTO: string;
    FVALOR_POR_ITENS: currency;
    FQUANTIDADE: integer;
    FTOTAL_DA_ENTRADA: currency;
    FNUMERO_NOTA: string;
    F_FUNCIONARIO: integer;
    FDATA: string;
    FHORA: string;
    FOBSERVACAO: string;

    FCodigoProdutoAtualizar: integer;
    FQuantidadeProdutoAtualizar: integer;
    FvalorEntradaProdutoAtualizar: currency;
    FValorTotalEntradaProdutoAtualizar: currency;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iEntradaProdutos;
    function getCampo(value: string): iEntradaProdutos;
    function getValor(value: string): iEntradaProdutos;
    function getDataInicial(value: TDate): iEntradaProdutos;
    function getDataFinal(value: TDate): iEntradaProdutos;
    function open(value: string): iEntradaProdutos;
    function pesquisar: iEntradaProdutos;
    function ExecSql: iEntradaProdutos;
    function sqlPesquisa: iEntradaProdutos;
    function sqlPesquisaData: iEntradaProdutos;
    function sqlPesquisaEstatica: iEntradaProdutos;

    function abrir: iEntradaProdutos;
    function inserir: iEntradaProdutos;
    function Gravar: iEntradaProdutos;
    function deletar: iEntradaProdutos;
    function atualizar: iEntradaProdutos;
    function editar: iEntradaProdutos;
    function cancelar: iEntradaProdutos;
    function fecharQuery: iEntradaProdutos;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iEntradaProdutos;
    function ordenarGrid(column: TColumn): iEntradaProdutos;

    function getID(value: integer): iEntradaProdutos;
    function getID_PRODUTO(value: integer): iEntradaProdutos;
    function getProduto(value: string): iEntradaProdutos;
    function getVALOR_POR_ITENS(value: currency): iEntradaProdutos;
    function getQUANTIDADE(value: integer): iEntradaProdutos;
    function getTOTAL_DA_ENTRADA(value: currency): iEntradaProdutos;
    function getNUMERO_NOTA(value: string): iEntradaProdutos;
    function getFuncionario(value: integer): iEntradaProdutos;
    function getDATA(value: string): iEntradaProdutos;
    function getHORA(value: string): iEntradaProdutos;
    function getObservacao(value: string): iEntradaProdutos;

    function exportar: iEntradaProdutos;

    function atualizarEstoque: iEntradaProdutos;
    function getCodigoProdutoAtualizar(value: integer): iEntradaProdutos;
    function getQuantidadeProdutoAtualizar(value: integer): iEntradaProdutos;
    function getvalorEntradaProdutoAtualizar(value: currency): iEntradaProdutos;
    function getValorTotalEntradaProdutoAtualizar(value: currency)
      : iEntradaProdutos;
    procedure validarData(componet: tmaskEdit);

    constructor create;
    destructor destroy; override;
    class function new: iEntradaProdutos;
  end;

implementation

{ TEntityEntradasProdutos }

function TEntityEntradasProdutos.abrir: iEntradaProdutos;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityEntradasProdutos.atualizar: iEntradaProdutos;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityEntradasProdutos.atualizarEstoque: iEntradaProdutos;
begin
  result := self;

  with FQueryAtulizarProdutos do
  begin
    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from PRODUTOS where id =:i');
    TQuery.ParamByName('i').AsInteger := FCodigoProdutoAtualizar;
    TQuery.Active := true;

    if TQuery.RecordCount >= 1 then
    begin
      try

        TQuery.Edit;

        TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger :=
          TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger + FQUANTIDADE;

        TQuery.FieldByName('DATA_ALTERACAO').AsDateTime := date;

        TQuery.Post;
        // TQuery.ApplyUpdates(-1);
      except
        on e: exception do
        begin
          raise exception.create
            ('Erro ao tentar atualizar os dados do produto. ' + e.Message);
        end;

      end;

    end
    else
    begin
      raise exception.create('Nenhum produto foi localizado.');
    end;

  end;

end;

function TEntityEntradasProdutos.cancelar: iEntradaProdutos;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityEntradasProdutos.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityEntradasProdutos.create;
begin
  FTabela := 'ENTRADAS_PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryAtulizarProdutos := TConexaoQuery.new.Query('PRODUTOS');

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Entradas de produtos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

function TEntityEntradasProdutos.deletar: iEntradaProdutos;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getCodigoRegistro(FQuery.TQuery.FieldByName('ID').AsInteger)
        .getNomeRegistro(FQuery.TQuery.FieldByName('PRODUTO').AsString)
        .getOperacao('deletando').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityEntradasProdutos.destroy;
begin

  inherited;
end;

function TEntityEntradasProdutos.editar: iEntradaProdutos;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

      FGravarLog.getCodigoRegistro(FQuery.TQuery.FieldByName('ID').AsInteger)
        .getNomeRegistro(FQuery.TQuery.FieldByName('PRODUTO').AsString)
        .getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityEntradasProdutos.ExecSql: iEntradaProdutos;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityEntradasProdutos.exportar: iEntradaProdutos;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório Entrada de Produtos';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Código';
  pasta.cells[1, 2] := 'Código do produto';
  pasta.cells[1, 3] := 'Produto';
  pasta.cells[1, 4] := 'Valor por item';
  pasta.cells[1, 5] := 'Quantidade';
  pasta.cells[1, 6] := 'Total da entrada';
  pasta.cells[1, 7] := 'Número da nota';
  pasta.cells[1, 8] := 'Funcionário';
  pasta.cells[1, 9] := 'Data';
  pasta.cells[1, 10] := 'Hora';
  pasta.cells[1, 11] := 'Observação';

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

function TEntityEntradasProdutos.fecharQuery: iEntradaProdutos;
begin
  FQuery.TQuery.close;
end;

function TEntityEntradasProdutos.getCampo(value: string): iEntradaProdutos;
begin
  result := self;
  FCampo := value;
end;

function TEntityEntradasProdutos.getCodigoProdutoAtualizar(value: integer)
  : iEntradaProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('Informe o código do produto.');
  FCodigoProdutoAtualizar := value;
end;

function TEntityEntradasProdutos.getDATA(value: string): iEntradaProdutos;
begin
  result := self;
  if value = '  /  /    ' then
    FDATA := ''
  else
    FDATA := value;
end;

function TEntityEntradasProdutos.getDataFinal(value: TDate): iEntradaProdutos;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityEntradasProdutos.getDataInicial(value: TDate): iEntradaProdutos;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityEntradasProdutos.getFuncionario(value: integer)
  : iEntradaProdutos;
begin
  result := self;
  F_FUNCIONARIO := value;
end;

function TEntityEntradasProdutos.getHORA(value: string): iEntradaProdutos;
begin
  result := self;
  FHORA := value;
end;

function TEntityEntradasProdutos.getID(value: integer): iEntradaProdutos;
begin
  result := self;
  FID := value;
end;

function TEntityEntradasProdutos.getID_PRODUTO(value: integer)
  : iEntradaProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('Informe o produto.');
  FID_PRODUTO := value;
end;

function TEntityEntradasProdutos.getNUMERO_NOTA(value: string)
  : iEntradaProdutos;
begin
  result := self;
  FNUMERO_NOTA := value;
end;

function TEntityEntradasProdutos.getObservacao(value: string): iEntradaProdutos;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityEntradasProdutos.getProduto(value: string): iEntradaProdutos;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Informe o produto.');
  FPRODUTO := value;
end;

function TEntityEntradasProdutos.getQUANTIDADE(value: integer)
  : iEntradaProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('Informe uma quantidade maior que 0(Zero).');
  FQUANTIDADE := value;
end;

function TEntityEntradasProdutos.getQuantidadeProdutoAtualizar(value: integer)
  : iEntradaProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('Informe uma quantidade superior a 0(Zero)');
  FQuantidadeProdutoAtualizar := value;
end;

function TEntityEntradasProdutos.getTOTAL_DA_ENTRADA(value: currency)
  : iEntradaProdutos;
begin
  result := self;
  FTOTAL_DA_ENTRADA := value;
end;

function TEntityEntradasProdutos.getValor(value: string): iEntradaProdutos;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityEntradasProdutos.getvalorEntradaProdutoAtualizar
  (value: currency): iEntradaProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('Informe um valor de entrada superior a 0(Zero)');
  FvalorEntradaProdutoAtualizar := value;
end;

function TEntityEntradasProdutos.getValorTotalEntradaProdutoAtualizar
  (value: currency): iEntradaProdutos;
begin
  result := self;
  ShowMessage(CurrToStr(value));
  if value = 0 then
    raise exception.create
      ('Informe um valor total da entrada acima de 0(Zero).');
  FValorTotalEntradaProdutoAtualizar := value;
end;

function TEntityEntradasProdutos.getVALOR_POR_ITENS(value: currency)
  : iEntradaProdutos;
begin
  result := self;
  FVALOR_POR_ITENS := value;
end;

function TEntityEntradasProdutos.Gravar: iEntradaProdutos;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_ENTRADAS_PRODUTOS_ID');

  FQuery.TQuery.FieldByName('ID_PRODUTO').AsInteger := FID_PRODUTO;
  FQuery.TQuery.FieldByName('PRODUTO').AsString := FPRODUTO;
  FQuery.TQuery.FieldByName('VALOR_POR_ITENS').AsCurrency := FVALOR_POR_ITENS;
  FQuery.TQuery.FieldByName('QUANTIDADE').AsInteger := FQUANTIDADE;
  FQuery.TQuery.FieldByName('TOTAL_DA_ENTRADA').AsCurrency := FTOTAL_DA_ENTRADA;
  FQuery.TQuery.FieldByName('NUMERO_NOTA').AsString := FNUMERO_NOTA;
  FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger := funcionarioLogado;
  FQuery.TQuery.FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

  if FDATA <> '  /  /    ' then
    FQuery.TQuery.FieldByName('DATA').AsDateTime := StrToDate(FDATA);

  if FHORA <> '  :  :  ' then
    FQuery.TQuery.FieldByName('HORA').AsDateTime := StrToTime(FHORA);

      FGravarLog.getCodigoRegistro(FQuery.TQuery.FieldByName('ID').AsInteger)
        .getNomeRegistro(FQuery.TQuery.FieldByName('PRODUTO').AsString)
        .getOperacao('deletando').gravarLog;
  try
    FQuery.TQuery.Post;
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityEntradasProdutos.inserir: iEntradaProdutos;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo');
end;

function TEntityEntradasProdutos.listarGrid(value: TDataSource)
  : iEntradaProdutos;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'Código';
  FQuery.TQuery.FieldByName('ID_PRODUTO').DisplayLabel := 'Código do produto';
  FQuery.TQuery.FieldByName('PRODUTO').DisplayLabel := 'Produto';
  FQuery.TQuery.FieldByName('VALOR_POR_ITENS').DisplayLabel := 'Valor unitário';
  FQuery.TQuery.FieldByName('QUANTIDADE').DisplayLabel := 'Quantidade';
  FQuery.TQuery.FieldByName('TOTAL_DA_ENTRADA').DisplayLabel :=
    'Total da entrada';
  FQuery.TQuery.FieldByName('NUMERO_NOTA').DisplayLabel := 'Número da nota';
  FQuery.TQuery.FieldByName('FUNCIONARIO').DisplayLabel := 'Funcionário';
  FQuery.TQuery.FieldByName('DATA').DisplayLabel := 'Data';
  FQuery.TQuery.FieldByName('HORA').DisplayLabel := 'Hora';
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

  FQuery.TQuery.FieldByName('PRODUTO').DisplayWidth := 40;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityEntradasProdutos.new: iEntradaProdutos;
begin
  result := self.create;
end;

function TEntityEntradasProdutos.nomeTabela(value: string): iEntradaProdutos;
begin
  result := self;
  FTabela := value;
end;

function TEntityEntradasProdutos.open(value: string): iEntradaProdutos;
begin
  FQuery.Query(FTabela);
end;

function TEntityEntradasProdutos.ordenarGrid(column: TColumn): iEntradaProdutos;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityEntradasProdutos.pesquisar: iEntradaProdutos;
begin
  result := self;
end;

function TEntityEntradasProdutos.sqlPesquisa: iEntradaProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityEntradasProdutos.sqlPesquisaData: iEntradaProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityEntradasProdutos.sqlPesquisaEstatica: iEntradaProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityEntradasProdutos.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := StrToDate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data válida.');
  end;
end;

end.
