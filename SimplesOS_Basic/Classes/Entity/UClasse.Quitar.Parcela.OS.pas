unit UClasse.Quitar.Parcela.OS;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntity = class(TInterfacedObject, iEntity)
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

    function nomeTabela(value: string): iQuitarParcelaOS;
    function getCampo(value: string): iQuitarParcelaOS;
    function getValor(value: string): iQuitarParcelaOS;
    function getDataInicial(value: TDate): iQuitarParcelaOS;
    function getDataFinal(value: TDate): iQuitarParcelaOS;
    function open(value: string): iQuitarParcelaOS;
    function pesquisar: iQuitarParcelaOS;
    function ExecSql: iQuitarParcelaOS;
    function sqlPesquisa: iQuitarParcelaOS;
    function sqlPesquisaData: iQuitarParcelaOS;
    function sqlPesquisaEstatica: iQuitarParcelaOS;

    function abrir: iQuitarParcelaOS;
    function atualizar: iQuitarParcelaOS;
    function fecharQuery: iQuitarParcelaOS;
    function listarGrid(value: TDataSource): iQuitarParcelaOS;
    function ordenarGrid(column: TColumn): iQuitarParcelaOS;

    function exportar: iQuitarParcelaOS;
    function validarData(componet: tmaskEdit):iQuitarParcelaOS;

    constructor create;
    destructor destroy; override;
    class function new: iEntity;
  end;

implementation

{ TEntity }

function TEntity.abrir: iEntity;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntity.atualizar: iEntity;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntity.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntity.create;
begin
  FTabela := 'PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro de produtos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntity.deletar: iEntity;
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

destructor TEntity.destroy;
begin

  inherited;
end;

function TEntity.editar: iEntity;
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

function TEntity.ExecSql: iEntity;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntity.exportar: iEntity;
begin
  result := self;
end;

function TEntity.fecharQuery: iEntity;
begin
  FQuery.TQuery.close;
end;

function TEntity.getCampo(value: string): iEntity;
begin
  result := self;
  FCampo := value;
end;

function TEntity.getCodigo(value: integer): iEntity;
begin
  result := self;
  FCodigo := value;
end;

function TEntity.getDataFinal(value: TDate): iEntity;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntity.getDataInicial(value: TDate): iEntity;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntity.getNome(value: string): iEntity;
begin
  result := self;
  FNome := value;
end;

function TEntity.getValor(value: string): iEntity;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntity.Gravar: iEntity;
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
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntity.inserir: iEntity;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntity.listarGrid(value: TDataSource): iEntity;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('grupo').DisplayLabel := 'Grupo';
  FQuery.TQuery.FieldByName('grupo').DisplayWidth := 50;

  value.DataSet := FQuery.TQuery;

end;

class function TEntity.new: iEntity;
begin
  result := self.create;
end;

function TEntity.nomeTabela(value: string): iEntity;
begin
  result := self;
  FTabela := value;
end;

function TEntity.open(value: string): iEntity;
begin
  FQuery.Query(FTabela);
end;

function TEntity.ordenarGrid(column: TColumn): iEntity;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntity.pesquisar: iEntity;
begin
  result := self;
end;

function TEntity.sqlPesquisa: iEntity;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntity.sqlPesquisaData: iEntity;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntity.sqlPesquisaEstatica: iEntity;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntity.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
