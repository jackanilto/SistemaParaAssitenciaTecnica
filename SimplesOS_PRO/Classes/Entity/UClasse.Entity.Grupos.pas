unit UClasse.Entity.Grupos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids;

type

  TEntityGrupos = class(TInterfacedObject, iCadastroGrupos)
  private

    FQuery: iConexaoQuery;
    FEntityQuery: TFDQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iCadastroGrupos;
    function getCampo(value: string): iCadastroGrupos;
    function getValor(value: string): iCadastroGrupos;
    function getDataInicial(value: TDate): iCadastroGrupos;
    function getDataFinal(value: TDate): iCadastroGrupos;
    function open(value: string): iCadastroGrupos;
    function ExecSql: iCadastroGrupos;
    function sqlPesquisa: iCadastroGrupos;
    function sqlPesquisaData: iCadastroGrupos;
    function sqlPesquisaEstatica: iCadastroGrupos;

    function abrir: iCadastroGrupos;
    function inserir: iCadastroGrupos;
    function Gravar: iCadastroGrupos;
    function deletar: iCadastroGrupos;
    function atualizar: iCadastroGrupos;
    function editar: iCadastroGrupos;
    function cancelar: iCadastroGrupos;
    function fecharQuery: iCadastroGrupos;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroGrupos;
    function ordenarGrid(column: TColumn): iCadastroGrupos;

    function getCodigo(value: integer): iCadastroGrupos;
    function getGrupo(value: string): iCadastroGrupos;

    constructor create;
    destructor destroy; override;
    class function new: iCadastroGrupos;
  end;

implementation

{ TEntityGrupos }

function TEntityGrupos.abrir: iCadastroGrupos;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityGrupos.atualizar: iCadastroGrupos;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityGrupos.cancelar: iCadastroGrupos;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityGrupos.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityGrupos.create;
begin
  FTabela := 'Grupos';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro grupos').getCodigoFuncionario(funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityGrupos.deletar: iCadastroGrupos;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('grupo').AsString)
        .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('deletando').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityGrupos.destroy;
begin

  inherited;
end;

function TEntityGrupos.editar: iCadastroGrupos;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('grupo').AsString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityGrupos.ExecSql: iCadastroGrupos;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityGrupos.fecharQuery: iCadastroGrupos;
begin
  FQuery.TQuery.close;
end;

function TEntityGrupos.getCampo(value: string): iCadastroGrupos;
begin
  result := self;
  FCampo := value;
  // FQuery.getCampo(value);
end;

function TEntityGrupos.getCodigo(value: integer): iCadastroGrupos;
begin
  result := self;
  FCodigo := value;
end;

function TEntityGrupos.getDataFinal(value: TDate): iCadastroGrupos;
begin
  result := self;
  FQuery.getDataFinal(value);
end;

function TEntityGrupos.getDataInicial(value: TDate): iCadastroGrupos;
begin
  result := self;
  FQuery.getDataInicial(value);
end;

function TEntityGrupos.getGrupo(value: string): iCadastroGrupos;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Digite um valor v�lido no campo GRUPO.');
  FNome := value;
end;

function TEntityGrupos.getValor(value: string): iCadastroGrupos;
begin
  result := self;
  FValor := UpperCase(value);
  // FQuery.getValor(value);
end;

function TEntityGrupos.Gravar: iCadastroGrupos;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_GRUPOS_ID');

  FQuery.TQuery.FieldByName('grupo').AsString := FNome;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('grupo').AsString)
    .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

  try
    FQuery.TQuery.Post;
  except
    on e: Exception do
    begin
      raise Exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityGrupos.inserir: iCadastroGrupos;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo')
end;

function TEntityGrupos.listarGrid(value: TDataSource): iCadastroGrupos;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('grupo').DisplayLabel := 'Grupo';
  FQuery.TQuery.FieldByName('grupo').DisplayWidth := 50;

  // FQuery.TQuery.SQL.Add('order by id desc');

  value.DataSet := FQuery.TQuery;

end;

class function TEntityGrupos.new: iCadastroGrupos;
begin
  result := self.create;
end;

function TEntityGrupos.nomeTabela(value: string): iCadastroGrupos;
begin
  result := self;
  FTabela := value;
end;

function TEntityGrupos.open(value: string): iCadastroGrupos;
begin
  FQuery.Query(FTabela);
end;

function TEntityGrupos.ordenarGrid(column: TColumn): iCadastroGrupos;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityGrupos.sqlPesquisa: iCadastroGrupos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityGrupos.sqlPesquisaData: iCadastroGrupos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityGrupos.sqlPesquisaEstatica: iCadastroGrupos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
