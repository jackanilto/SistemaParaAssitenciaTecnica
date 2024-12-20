unit UClasse.Entity.Forma.Pagamento;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids;

type

  TEntityFormaPagamento = class(TInterfacedObject, iFormaPagamento)
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
    FFormaPagamento: string;

  public

    function nomeTabela(value: string): iFormaPagamento;
    function getCampo(value: string): iFormaPagamento;
    function getValor(value: string): iFormaPagamento;
    function getDataInicial(value: TDate): iFormaPagamento;
    function getDataFinal(value: TDate): iFormaPagamento;
    function open(value: string): iFormaPagamento;
    function pesquisar: iFormaPagamento;
    function ExecSql: iFormaPagamento;
    function sqlPesquisa: iFormaPagamento;
    function sqlPesquisaData: iFormaPagamento;
    function sqlPesquisaEstatica: iFormaPagamento;

    function abrir: iFormaPagamento;
    function inserir: iFormaPagamento;
    function Gravar: iFormaPagamento;
    function deletar: iFormaPagamento;
    function atualizar: iFormaPagamento;
    function editar: iFormaPagamento;
    function cancelar: iFormaPagamento;
    function fecharQuery: iFormaPagamento;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iFormaPagamento;
    function ordenarGrid(column: TColumn): iFormaPagamento;

    function getCodigo(value: integer): iFormaPagamento;
    function getFormaPagamento(value: string): iFormaPagamento;

    constructor create;
    destructor destroy; override;
    class function new: iFormaPagamento;
  end;

implementation

{ TEntityFormaPagamento }

function TEntityFormaPagamento.abrir: iFormaPagamento;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityFormaPagamento.atualizar: iFormaPagamento;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityFormaPagamento.cancelar: iFormaPagamento;
begin
  FQuery.TQuery.Cancel;
//  FQuery.TQuery.close;
end;

function TEntityFormaPagamento.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityFormaPagamento.create;
begin
  FTabela := 'FORMAS_PAGAMENTO';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro formas de pagamento').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityFormaPagamento.deletar: iFormaPagamento;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('FORMA_PAGAMENTO')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .getOperacao('deletando').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityFormaPagamento.destroy;
begin

  inherited;
end;

function TEntityFormaPagamento.editar: iFormaPagamento;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('FORMA_PAGAMENTO')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
      .getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityFormaPagamento.ExecSql: iFormaPagamento;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityFormaPagamento.fecharQuery: iFormaPagamento;
begin
  FQuery.TQuery.close;
end;

function TEntityFormaPagamento.getCampo(value: string): iFormaPagamento;
begin
  result := self;
  FCampo := value;
end;

function TEntityFormaPagamento.getCodigo(value: integer): iFormaPagamento;
begin
  result := self;
  FCodigo := value;
end;

function TEntityFormaPagamento.getDataFinal(value: TDate): iFormaPagamento;
begin
  result := self;
  FQuery.getDataFinal(value);
end;

function TEntityFormaPagamento.getDataInicial(value: TDate): iFormaPagamento;
begin
  result := self;
  FQuery.getDataInicial(value);
end;

function TEntityFormaPagamento.getFormaPagamento(value: string)
  : iFormaPagamento;
begin
  result := self;
  FFormaPagamento := value;
end;

function TEntityFormaPagamento.getValor(value: string): iFormaPagamento;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityFormaPagamento.Gravar: iFormaPagamento;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_FORMAS_PAGAMENTO_ID');

  FQuery.TQuery.FieldByName('FORMA_PAGAMENTO').AsString := FFormaPagamento;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('FORMA_PAGAMENTO')
    .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
    .gravarLog;

  try
    FQuery.TQuery.Post;
//    showmessage('Opera��o realizada com sucesso!');
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityFormaPagamento.inserir: iFormaPagamento;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo');
end;

function TEntityFormaPagamento.listarGrid(value: TDataSource): iFormaPagamento;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('FORMA_PAGAMENTO').DisplayLabel :=
    'Forma de pagamento';
  FQuery.TQuery.FieldByName('FORMA_PAGAMENTO').DisplayWidth := 50;

  // FQuery.TQuery.SQL.Add('order by id desc');

  value.DataSet := FQuery.TQuery;

end;

class function TEntityFormaPagamento.new: iFormaPagamento;
begin
  result := self.create;
end;

function TEntityFormaPagamento.nomeTabela(value: string): iFormaPagamento;
begin
  result := self;
  FTabela := value;
end;

function TEntityFormaPagamento.open(value: string): iFormaPagamento;
begin
  FQuery.Query(FTabela);
end;

function TEntityFormaPagamento.ordenarGrid(column: TColumn): iFormaPagamento;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityFormaPagamento.pesquisar: iFormaPagamento;
begin
  result := self;
end;

function TEntityFormaPagamento.sqlPesquisa: iFormaPagamento;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityFormaPagamento.sqlPesquisaData: iFormaPagamento;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityFormaPagamento.sqlPesquisaEstatica: iFormaPagamento;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
