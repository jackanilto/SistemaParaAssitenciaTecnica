unit UClasse.Entity.Cadastro.Situacoes.Ordem;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids;

type

  TEntityCadastroSituacoesOrdem = class(TInterfacedObject,
    iCadastroSituacoesOrdem)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FSituacoesOrdem: string;
    FNome: string;
    function getCodigo(value: integer): iCadastroSituacoesOrdem;
    function getNome(value: string): iCadastroSituacoesOrdem;
    function pesquisar: iCadastroSituacoesOrdem;

  public

    function nomeTabela(value: string): iCadastroSituacoesOrdem;
    function getCampo(value: string): iCadastroSituacoesOrdem;
    function getValor(value: string): iCadastroSituacoesOrdem;
    function getDataInicial(value: TDate): iCadastroSituacoesOrdem;
    function getDataFinal(value: TDate): iCadastroSituacoesOrdem;
    function open(value: string): iCadastroSituacoesOrdem;
    function ExecSql: iCadastroSituacoesOrdem;
    function sqlPesquisa: iCadastroSituacoesOrdem;
    function sqlPesquisaData: iCadastroSituacoesOrdem;
    function sqlPesquisaEstatica: iCadastroSituacoesOrdem;

    function abrir: iCadastroSituacoesOrdem;
    function inserir: iCadastroSituacoesOrdem;
    function Gravar: iCadastroSituacoesOrdem;
    function deletar: iCadastroSituacoesOrdem;
    function atualizar: iCadastroSituacoesOrdem;
    function editar: iCadastroSituacoesOrdem;
    function cancelar: iCadastroSituacoesOrdem;
    function fecharQuery: iCadastroSituacoesOrdem;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroSituacoesOrdem;
    function ordenarGrid(column: TColumn): iCadastroSituacoesOrdem;

    function getSITUACAO_ORDEM(value: string): iCadastroSituacoesOrdem;
    constructor create;
    destructor destroy; override;
    class function new: iCadastroSituacoesOrdem;
  end;

implementation

{ TEntityCadastroSituacoesOrdem }

function TEntityCadastroSituacoesOrdem.abrir: iCadastroSituacoesOrdem;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityCadastroSituacoesOrdem.atualizar: iCadastroSituacoesOrdem;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityCadastroSituacoesOrdem.cancelar: iCadastroSituacoesOrdem;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityCadastroSituacoesOrdem.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityCadastroSituacoesOrdem.create;
begin
  FTabela := 'SITUACAO_ORDEM';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro situações da ordem').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

function TEntityCadastroSituacoesOrdem.deletar: iCadastroSituacoesOrdem;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SITUACAO_ORDEM')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .getOperacao('deletado').gravarLog;

      FQuery.TQuery.Delete;

    end;
  end;

end;

destructor TEntityCadastroSituacoesOrdem.destroy;
begin

  inherited;
end;

function TEntityCadastroSituacoesOrdem.editar: iCadastroSituacoesOrdem;
begin

  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SITUACAO_ORDEM')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
      .getOperacao('editando');

    FQuery.TQuery.Edit;

  end;

end;

function TEntityCadastroSituacoesOrdem.ExecSql: iCadastroSituacoesOrdem;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityCadastroSituacoesOrdem.fecharQuery: iCadastroSituacoesOrdem;
begin
  FQuery.TQuery.close;
end;

function TEntityCadastroSituacoesOrdem.getCampo(value: string)
  : iCadastroSituacoesOrdem;
begin
  result := self;
  FCampo := value;
end;

function TEntityCadastroSituacoesOrdem.getCodigo(value: integer)
  : iCadastroSituacoesOrdem;
begin
  result := self;
  FCodigo := value;
end;

function TEntityCadastroSituacoesOrdem.getDataFinal(value: TDate)
  : iCadastroSituacoesOrdem;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityCadastroSituacoesOrdem.getDataInicial(value: TDate)
  : iCadastroSituacoesOrdem;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityCadastroSituacoesOrdem.getNome(value: string)
  : iCadastroSituacoesOrdem;
begin
  result := self;
  FNome := value;
end;

function TEntityCadastroSituacoesOrdem.getSITUACAO_ORDEM(value: string)
  : iCadastroSituacoesOrdem;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create
      ('Infome um valor válido para o campo Situacao da ordem.');
  FSituacoesOrdem := value;
end;

function TEntityCadastroSituacoesOrdem.getValor(value: string)
  : iCadastroSituacoesOrdem;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityCadastroSituacoesOrdem.Gravar: iCadastroSituacoesOrdem;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_SITUACAO_ORDEM_ID');

  FQuery.TQuery.FieldByName('SITUACAO_ORDEM').AsString := FSituacoesOrdem;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SITUACAO_ORDEM')
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

function TEntityCadastroSituacoesOrdem.inserir: iCadastroSituacoesOrdem;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo');
end;

function TEntityCadastroSituacoesOrdem.listarGrid(value: TDataSource)
  : iCadastroSituacoesOrdem;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'Código';
  FQuery.TQuery.FieldByName('SITUACAO_ORDEM').DisplayLabel := 'Situação da ordem';


  value.DataSet := FQuery.TQuery;

end;

class function TEntityCadastroSituacoesOrdem.new: iCadastroSituacoesOrdem;
begin
  result := self.create;
end;

function TEntityCadastroSituacoesOrdem.nomeTabela(value: string)
  : iCadastroSituacoesOrdem;
begin
  result := self;
  FTabela := value;
end;

function TEntityCadastroSituacoesOrdem.open(value: string)
  : iCadastroSituacoesOrdem;
begin
  FQuery.Query(FTabela);
end;

function TEntityCadastroSituacoesOrdem.ordenarGrid(column: TColumn)
  : iCadastroSituacoesOrdem;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityCadastroSituacoesOrdem.pesquisar: iCadastroSituacoesOrdem;
begin
  result := self;
end;

function TEntityCadastroSituacoesOrdem.sqlPesquisa: iCadastroSituacoesOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityCadastroSituacoesOrdem.sqlPesquisaData: iCadastroSituacoesOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityCadastroSituacoesOrdem.sqlPesquisaEstatica
  : iCadastroSituacoesOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
