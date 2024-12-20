unit UClasse.Entity.Ordem.Itens;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityOrdemItens = class(TInterfacedObject, iItensOrdem)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_ORDEM: integer;
    FID_PRODUTO: integer;
    FPRODUTO: string;
    FVALOR_ITEM: Currency;
    FQUANTIDADE: integer;
    FVALOR_TOTAL: Currency;

    FCodigo: integer;
    FNome: string;
    function getCodigo(value: integer): iItensOrdem;
    function getNome(value: string): iItensOrdem;

  public

    function nomeTabela(value: string): iItensOrdem;
    function getCampo(value: string): iItensOrdem;
    function getValor(value: string): iItensOrdem;
    function getDataInicial(value: TDate): iItensOrdem;
    function getDataFinal(value: TDate): iItensOrdem;
    function open(value: string): iItensOrdem;
    function pesquisar: iItensOrdem;
    function ExecSql: iItensOrdem;
    function sqlPesquisa: iItensOrdem;
    function sqlPesquisaData: iItensOrdem;
    function sqlPesquisaEstatica: iItensOrdem;

    function abrir: iItensOrdem;
    function inserir: iItensOrdem;
    function Gravar: iItensOrdem;
    function deletar: iItensOrdem;
    function atualizar: iItensOrdem;
    function editar: iItensOrdem;
    function cancelar: iItensOrdem;
    function fecharQuery: iItensOrdem;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iItensOrdem;
    function ordenarGrid(column: TColumn): iItensOrdem;

    function exportar: iItensOrdem;
    procedure validarData(componet: tmaskEdit);

    function getID(value: integer): iItensOrdem;
    function getID_ORDEM(value: integer): iItensOrdem;
    function getID_PRODUTO(value: integer): iItensOrdem;
    function getPRODUTO(value: string): iItensOrdem;
    function getVALOR_ITEM(value: string): iItensOrdem;
    function getQUANTIDADE(value: integer): iItensOrdem;
    function getVALOR_TOTAL(value: string): iItensOrdem;

    constructor create;
    destructor destroy; override;
    class function new: iItensOrdem;
  end;

implementation

{ TEntityOrdemItens }

function TEntityOrdemItens.abrir: iItensOrdem;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityOrdemItens.atualizar: iItensOrdem;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityOrdemItens.cancelar: iItensOrdem;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityOrdemItens.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityOrdemItens.create;
begin
  FTabela := 'ITENS_UTILIZADOS_ORDEM';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Itens da ordem de servi�o').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityOrdemItens.deletar: iItensOrdem;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('ID_ORDEM').AsString)
        .gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityOrdemItens.destroy;
begin

  inherited;
end;

function TEntityOrdemItens.editar: iItensOrdem;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('ID_ORDEM').AsString)
      .gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntityOrdemItens.ExecSql: iItensOrdem;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityOrdemItens.exportar: iItensOrdem;
begin
  result := self;
end;

function TEntityOrdemItens.fecharQuery: iItensOrdem;
begin
  FQuery.TQuery.close;
end;

function TEntityOrdemItens.getCampo(value: string): iItensOrdem;
begin
  result := self;
  FCampo := value;
end;

function TEntityOrdemItens.getCodigo(value: integer): iItensOrdem;
begin
  result := self;
  FCodigo := value;
end;

function TEntityOrdemItens.getDataFinal(value: TDate): iItensOrdem;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityOrdemItens.getDataInicial(value: TDate): iItensOrdem;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityOrdemItens.getID(value: integer): iItensOrdem;
begin
  result := self;
  FID := value;
end;

function TEntityOrdemItens.getID_ORDEM(value: integer): iItensOrdem;
begin
  result := self;
  FID_ORDEM := value;
end;

function TEntityOrdemItens.getID_PRODUTO(value: integer): iItensOrdem;
begin
  result := self;
  if value = 0 then
    raise Exception.create('Voc� deve informar o produtos que esta inserindo.');
  FID_PRODUTO := value;
end;

function TEntityOrdemItens.getNome(value: string): iItensOrdem;
begin
  result := self;
  FNome := value;
end;

function TEntityOrdemItens.getPRODUTO(value: string): iItensOrdem;
begin
  result := self;

  if value = EmptyStr then
    raise Exception.create('Informe o produto que esta inserindo');

  FPRODUTO := value;
end;

function TEntityOrdemItens.getQUANTIDADE(value: integer): iItensOrdem;
begin
  result := self;
  if value = 0 then
    raise Exception.create
      ('Informe a quantidade produtos de produdos usados na ordem.');

  FQUANTIDADE := value;

end;

function TEntityOrdemItens.getValor(value: string): iItensOrdem;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityOrdemItens.getVALOR_ITEM(value: string): iItensOrdem;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create
      ('Informe um valor para o  produto maior ou igual a zero.');

  try
    FVALOR_ITEM := StrToCurr(value);
  except
    on e: Exception do
    begin
      raise Exception.create
        ('Informe um valor v�lido para o valor do produto.');
    end;

  end;

end;

function TEntityOrdemItens.getVALOR_TOTAL(value: string): iItensOrdem;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create
      ('Informe um valor maior ou igual a zero para o total do produto.');

  try
    FVALOR_TOTAL := StrToCurr(value);
  except
    on e: Exception do
    begin
      raise Exception.create
        ('informe um valor v�lido para o total do produto.');
    end;

  end;

end;

function TEntityOrdemItens.Gravar: iItensOrdem;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_ITENS_UTILIZADOS_ORDEM_I');

  FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger := FID_ORDEM;
  FQuery.TQuery.FieldByName('ID_PRODUTO').AsInteger := FID_PRODUTO;
  FQuery.TQuery.FieldByName('PRODUTO').AsString := FPRODUTO;
  FQuery.TQuery.FieldByName('VALOR').AsCurrency := FVALOR_ITEM;
  FQuery.TQuery.FieldByName('QUANTIDADE').AsInteger := FQUANTIDADE;
  FQuery.TQuery.FieldByName('VALOR_TOTAL').AsCurrency := FVALOR_TOTAL;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('ID_ORDEM').AsString)
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

function TEntityOrdemItens.inserir: iItensOrdem;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityOrdemItens.listarGrid(value: TDataSource): iItensOrdem;
begin

  result := self;
  with FQuery.TQuery do
  begin
    FieldByName('id').Visible := false;
    FieldByName('ID_ORDEM').Visible := false;
    FieldByName('ID_PRODUTO').Visible := false;
    FieldByName('PRODUTO').DisplayLabel := 'Produtos';
    FieldByName('VALOR').DisplayLabel := 'Valor UN';
    FieldByName('QUANTIDADE').DisplayLabel := 'QTDE';
    FieldByName('VALOR_TOTAL').DisplayLabel := 'Valor total';

    FieldByName('PRODUTO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityOrdemItens.new: iItensOrdem;
begin
  result := self.create;
end;

function TEntityOrdemItens.nomeTabela(value: string): iItensOrdem;
begin
  result := self;
  FTabela := value;
end;

function TEntityOrdemItens.open(value: string): iItensOrdem;
begin
  FQuery.Query(FTabela);
end;

function TEntityOrdemItens.ordenarGrid(column: TColumn): iItensOrdem;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityOrdemItens.pesquisar: iItensOrdem;
begin
  result := self;
end;

function TEntityOrdemItens.sqlPesquisa: iItensOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityOrdemItens.sqlPesquisaData: iItensOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityOrdemItens.sqlPesquisaEstatica: iItensOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityOrdemItens.validarData(componet: tmaskEdit);
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
