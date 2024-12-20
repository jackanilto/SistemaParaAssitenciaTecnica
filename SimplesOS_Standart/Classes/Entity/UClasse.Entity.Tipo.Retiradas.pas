unit UClasse.Entity.Tipo.Retiradas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids;

type

  TEntityTipoPagamento = class(TInterfacedObject, iTipoRetirada)
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
    FTipoRetirada: string;

  public

    function nomeTabela(value: string): iTipoRetirada;
    function getCampo(value: string): iTipoRetirada;
    function getValor(value: string): iTipoRetirada;
    function getDataInicial(value: TDate): iTipoRetirada;
    function getDataFinal(value: TDate): iTipoRetirada;
    function open(value: string): iTipoRetirada;
    function ExecSql: iTipoRetirada;
    function sqlPesquisa: iTipoRetirada;
    function sqlPesquisaData: iTipoRetirada;
    function sqlPesquisaEstatica: iTipoRetirada;

    function abrir: iTipoRetirada;
    function inserir: iTipoRetirada;
    function Gravar: iTipoRetirada;
    function deletar: iTipoRetirada;
    function atualizar: iTipoRetirada;
    function editar: iTipoRetirada;
    function cancelar: iTipoRetirada;
    function fecharQuery: iTipoRetirada;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iTipoRetirada;
    function ordenarGrid(column: TColumn): iTipoRetirada;

    function getCodigo(value: integer): iTipoRetirada;
    function getTipoRetirada(value: string): iTipoRetirada;

    constructor create;
    destructor destroy; override;
    class function new: iTipoRetirada;
  end;

implementation

{ TEntityTipoPagamento }

function TEntityTipoPagamento.abrir: iTipoRetirada;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityTipoPagamento.atualizar: iTipoRetirada;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityTipoPagamento.cancelar: iTipoRetirada;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityTipoPagamento.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityTipoPagamento.create;
begin
  FTabela := 'TIPO_RETIRADAS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro tipo retiradas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityTipoPagamento.deletar: iTipoRetirada;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('TIPO_SAIDA')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .getOperacao('deletando').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityTipoPagamento.destroy;
begin

  inherited;
end;

function TEntityTipoPagamento.editar: iTipoRetirada;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('TIPO_SAIDA').AsString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('editando');

    FQuery.TQuery.Edit;
    // FQuery.TQuery.FieldByName('grupo').AsString := FValor;
    // FQuery.TQuery.Post;
    // showmessage('Opera��o realizada com sucesso!');
  end;
end;

function TEntityTipoPagamento.ExecSql: iTipoRetirada;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityTipoPagamento.fecharQuery: iTipoRetirada;
begin
  FQuery.TQuery.close;
end;

function TEntityTipoPagamento.getCampo(value: string): iTipoRetirada;
begin
  result := self;
  FCampo := value;
end;

function TEntityTipoPagamento.getCodigo(value: integer): iTipoRetirada;
begin
  result := self;
  FCodigo := value;
end;

function TEntityTipoPagamento.getDataFinal(value: TDate): iTipoRetirada;
begin
  result := self;
  FQuery.getDataFinal(value);
end;

function TEntityTipoPagamento.getDataInicial(value: TDate): iTipoRetirada;
begin
  result := self;
  FQuery.getDataInicial(value);
end;

function TEntityTipoPagamento.getTipoRetirada(value: string): iTipoRetirada;
begin
  result := self;
  FTipoRetirada := value;
end;

function TEntityTipoPagamento.getValor(value: string): iTipoRetirada;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityTipoPagamento.Gravar: iTipoRetirada;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_TIPO_RETIRADAS_ID');

  FQuery.TQuery.FieldByName('TIPO_SAIDA').AsString := FTipoRetirada;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('TIPO_SAIDA').AsString)
    .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

  try
    FQuery.TQuery.Post;
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityTipoPagamento.inserir: iTipoRetirada;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo')
end;

function TEntityTipoPagamento.listarGrid(value: TDataSource): iTipoRetirada;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('TIPO_SAIDA').DisplayLabel :=
    'Tipo da sa�da/Retiradas';
  FQuery.TQuery.FieldByName('TIPO_SAIDA').DisplayWidth := 80;

  // FQuery.TQuery.SQL.Add('order by id desc');

  value.DataSet := FQuery.TQuery;

end;

class function TEntityTipoPagamento.new: iTipoRetirada;
begin
  result := self.create;
end;

function TEntityTipoPagamento.nomeTabela(value: string): iTipoRetirada;
begin
  result := self;
  FTabela := value;
end;

function TEntityTipoPagamento.open(value: string): iTipoRetirada;
begin
  FQuery.Query(FTabela);
end;

function TEntityTipoPagamento.ordenarGrid(column: TColumn): iTipoRetirada;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityTipoPagamento.sqlPesquisa: iTipoRetirada;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityTipoPagamento.sqlPesquisaData: iTipoRetirada;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityTipoPagamento.sqlPesquisaEstatica: iTipoRetirada;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
