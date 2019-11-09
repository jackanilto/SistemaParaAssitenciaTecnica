unit UClasse.Entity.Saidas.Produtos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntitySaidasProdutos = class(TInterfacedObject, iSaidaDeProdutos)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_PRODUTO: integer;
    FPRODUTOS: string;
    FVALORPRODUTOS: Currency;
    FQUANTIDADE: integer;
    FTOTAL: Currency;
    FFUNCIONARIO: integer;
    FOBSERVACAO: string;

    FCodigoProdutoAtualizar: integer;
    FQuantidadeProdutoAtualizar: integer;

    FCodigo: integer;
    FNome: string;
    function getCodigo(value: integer): iSaidaDeProdutos;
    function getNome(value: string): iSaidaDeProdutos;
    procedure validarData(componet: tmaskEdit);

  public

    function nomeTabela(value: string): iSaidaDeProdutos;
    function getCampo(value: string): iSaidaDeProdutos;
    function getValor(value: string): iSaidaDeProdutos;
    function getDataInicial(value: TDate): iSaidaDeProdutos;
    function getDataFinal(value: TDate): iSaidaDeProdutos;
    function open(value: string): iSaidaDeProdutos;
    function pesquisar: iSaidaDeProdutos;
    function ExecSql: iSaidaDeProdutos;
    function sqlPesquisa: iSaidaDeProdutos;
    function sqlPesquisaData: iSaidaDeProdutos;
    function sqlPesquisaEstatica: iSaidaDeProdutos;

    function abrir: iSaidaDeProdutos;
    function inserir: iSaidaDeProdutos;
    function Gravar: iSaidaDeProdutos;
    function deletar: iSaidaDeProdutos;
    function atualizar: iSaidaDeProdutos;
    function editar: iSaidaDeProdutos;
    function cancelar: iSaidaDeProdutos;
    function fecharQuery: iSaidaDeProdutos;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iSaidaDeProdutos;
    function ordenarGrid(column: TColumn): iSaidaDeProdutos;

    function getID(value: integer): iSaidaDeProdutos;
    function getID_PRODUTO(value: integer): iSaidaDeProdutos;
    function getPRODUTOS(value: string): iSaidaDeProdutos;
    function getVALORPRODUTO(value: Currency): iSaidaDeProdutos;
    function getQUANTIDADE(value: integer): iSaidaDeProdutos;
    function getTOTAL(value: Currency): iSaidaDeProdutos;
    function getFuncionario(value: integer): iSaidaDeProdutos;
    function getObservacao(value: string): iSaidaDeProdutos;

    function exportar: iSaidaDeProdutos;
    function atualizarEstoque: iSaidaDeProdutos;
    function getCodigoProdutoAtualizar(value: integer): iSaidaDeProdutos;
    function getQuantidadeProdutoAtualizar(value: integer): iSaidaDeProdutos;

    constructor create;
    destructor destroy; override;
    class function new: iSaidaDeProdutos;
  end;

implementation

{ TEntitySaidasProdutos }

function TEntitySaidasProdutos.abrir: iSaidaDeProdutos;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntitySaidasProdutos.atualizar: iSaidaDeProdutos;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntitySaidasProdutos.atualizarEstoque: iSaidaDeProdutos;
begin
  result := self;
end;

function TEntitySaidasProdutos.cancelar: iSaidaDeProdutos;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntitySaidasProdutos.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntitySaidasProdutos.create;
begin
  FTabela := 'PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro de produtos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

function TEntitySaidasProdutos.deletar: iSaidaDeProdutos;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SERVICO_PRODUTO')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntitySaidasProdutos.destroy;
begin

  inherited;
end;

function TEntitySaidasProdutos.editar: iSaidaDeProdutos;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SERVICO_PRODUTO')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
      .gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntitySaidasProdutos.ExecSql: iSaidaDeProdutos;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntitySaidasProdutos.exportar: iSaidaDeProdutos;
begin
  result := self;
end;

function TEntitySaidasProdutos.fecharQuery: iSaidaDeProdutos;
begin
  FQuery.TQuery.close;
end;

function TEntitySaidasProdutos.getCampo(value: string): iSaidaDeProdutos;
begin
  result := self;
  FCampo := value;
end;

function TEntitySaidasProdutos.getCodigo(value: integer): iSaidaDeProdutos;
begin
  result := self;
  FCodigo := value;
end;

function TEntitySaidasProdutos.getCodigoProdutoAtualizar(value: integer)
  : iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise Exception.create('Infome o código do produto.');
  FCodigoProdutoAtualizar := value;
end;

function TEntitySaidasProdutos.getDataFinal(value: TDate): iSaidaDeProdutos;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntitySaidasProdutos.getDataInicial(value: TDate): iSaidaDeProdutos;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntitySaidasProdutos.getFuncionario(value: integer): iSaidaDeProdutos;
begin
  result := self;
  FFUNCIONARIO := value;
end;

function TEntitySaidasProdutos.getID(value: integer): iSaidaDeProdutos;
begin
  result := self;
  FID := value;
end;

function TEntitySaidasProdutos.getID_PRODUTO(value: integer): iSaidaDeProdutos;
begin
  result := self;
  FID_PRODUTO := value;
end;

function TEntitySaidasProdutos.getNome(value: string): iSaidaDeProdutos;
begin
  result := self;
  FNome := value;
end;

function TEntitySaidasProdutos.getObservacao(value: string): iSaidaDeProdutos;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntitySaidasProdutos.getPRODUTOS(value: string): iSaidaDeProdutos;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe o nome do produto.');
  FPRODUTOS := value;
end;

function TEntitySaidasProdutos.getQUANTIDADE(value: integer): iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise Exception.create('Informe uma quantidade superior a 0 (zero).');
  FQUANTIDADE := value;
end;

function TEntitySaidasProdutos.getQuantidadeProdutoAtualizar(value: integer)
  : iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise Exception.create('Informe a quantidade de produtos sa saída.');
  FQuantidadeProdutoAtualizar := value;
end;

function TEntitySaidasProdutos.getTOTAL(value: Currency): iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise Exception.create('O total da saída deve ser superior a 0 (zero).');
  FTOTAL := value;
end;

function TEntitySaidasProdutos.getValor(value: string): iSaidaDeProdutos;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntitySaidasProdutos.getVALORPRODUTO(value: Currency)
  : iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise Exception.create('O valor do produto deve ser maior que 0 (zero)');
  FVALORPRODUTOS := value;
end;

function TEntitySaidasProdutos.Gravar: iSaidaDeProdutos;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_PRODUTOS_ID');

  FQuery.TQuery.FieldByName('SERVICO_PRODUTO').AsString := FNome;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SERVICO_PRODUTO')
    .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
    .gravarLog;

  try
    FQuery.TQuery.Post;
  except
    on e: Exception do
    begin
      raise Exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntitySaidasProdutos.inserir: iSaidaDeProdutos;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntitySaidasProdutos.listarGrid(value: TDataSource): iSaidaDeProdutos;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'Código';
  FQuery.TQuery.FieldByName('grupo').DisplayLabel := 'Grupo';
  FQuery.TQuery.FieldByName('grupo').DisplayWidth := 50;

  value.DataSet := FQuery.TQuery;

end;

class function TEntitySaidasProdutos.new: iSaidaDeProdutos;
begin
  result := self.create;
end;

function TEntitySaidasProdutos.nomeTabela(value: string): iSaidaDeProdutos;
begin
  result := self;
  FTabela := value;
end;

function TEntitySaidasProdutos.open(value: string): iSaidaDeProdutos;
begin
  FQuery.Query(FTabela);
end;

function TEntitySaidasProdutos.ordenarGrid(column: TColumn): iSaidaDeProdutos;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntitySaidasProdutos.pesquisar: iSaidaDeProdutos;
begin
  result := self;
end;

function TEntitySaidasProdutos.sqlPesquisa: iSaidaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntitySaidasProdutos.sqlPesquisaData: iSaidaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntitySaidasProdutos.sqlPesquisaEstatica: iSaidaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntitySaidasProdutos.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise Exception.create('Digite uma data válida.');
  end;
end;

end.
