unit UClasse.Entity.Configurar.Parcelas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids;

type

  TEntityConfigurarParcelas = class(TInterfacedObject, iConfigurarParcelas)
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
    FValorJuros: string;
    FValorMulta: string;

  public

    function nomeTabela(value: string): iConfigurarParcelas;
    function getCampo(value: string): iConfigurarParcelas;
    function getValor(value: string): iConfigurarParcelas;
    function getDataInicial(value: TDate): iConfigurarParcelas;
    function getDataFinal(value: TDate): iConfigurarParcelas;
    function open(value: string): iConfigurarParcelas;
    function pesquisar: iConfigurarParcelas;
    function ExecSql: iConfigurarParcelas;
    function sqlPesquisa: iConfigurarParcelas;
    function sqlPesquisaData: iConfigurarParcelas;
    function sqlPesquisaEstatica: iConfigurarParcelas;

    function abrir: iConfigurarParcelas;
    function inserir: iConfigurarParcelas;
    function Gravar: iConfigurarParcelas;
    function deletar: iConfigurarParcelas;
    function atualizar: iConfigurarParcelas;
    function editar: iConfigurarParcelas;
    function cancelar: iConfigurarParcelas;
    function fecharQuery: iConfigurarParcelas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iConfigurarParcelas;
    function ordenarGrid(column: TColumn): iConfigurarParcelas;

    function getCodigo(value: integer): iConfigurarParcelas;
    function getConfigurarParcelaJuros(value: string): iConfigurarParcelas;
    function getConfigurarParcelaMulta(value: string): iConfigurarParcelas;

    constructor create;
    destructor destroy; override;
    class function new: iConfigurarParcelas;
  end;

implementation

{ TEntityConfigurarParcelas }

function TEntityConfigurarParcelas.abrir: iConfigurarParcelas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityConfigurarParcelas.atualizar: iConfigurarParcelas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityConfigurarParcelas.cancelar: iConfigurarParcelas;
begin
  FQuery.TQuery.Cancel;
//  FQuery.TQuery.close;
end;

function TEntityConfigurarParcelas.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityConfigurarParcelas.create;
begin
  FTabela := 'CONFIGURAR_PARCELA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Configurar parcelas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

function TEntityConfigurarParcelas.deletar: iConfigurarParcelas;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      // FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('grupo').AsString)
      // .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityConfigurarParcelas.destroy;
begin

  inherited;
end;

function TEntityConfigurarParcelas.editar: iConfigurarParcelas;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    // FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('grupo').AsString)
    // .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntityConfigurarParcelas.ExecSql: iConfigurarParcelas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityConfigurarParcelas.fecharQuery: iConfigurarParcelas;
begin
  FQuery.TQuery.close;
end;

function TEntityConfigurarParcelas.getCampo(value: string): iConfigurarParcelas;
begin
  result := self;
  FCampo := value;
end;

function TEntityConfigurarParcelas.getCodigo(value: integer)
  : iConfigurarParcelas;
begin
  result := self;
  FCodigo := value;
end;

function TEntityConfigurarParcelas.getDataFinal(value: TDate)
  : iConfigurarParcelas;
begin
  result := self;
  FQuery.getDataFinal(value);
end;

function TEntityConfigurarParcelas.getDataInicial(value: TDate)
  : iConfigurarParcelas;
begin
  result := self;
  FQuery.getDataInicial(value);
end;

function TEntityConfigurarParcelas.getConfigurarParcelaJuros(value: string)
  : iConfigurarParcelas;
begin
  result := self;
  FValorJuros := value;
end;

function TEntityConfigurarParcelas.getConfigurarParcelaMulta(value: string)
  : iConfigurarParcelas;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe o valor da multa por atraso.');
  FValorMulta := value;
end;

function TEntityConfigurarParcelas.getValor(value: string): iConfigurarParcelas;
begin
  result := self;
  FValor := value;
end;

function TEntityConfigurarParcelas.Gravar: iConfigurarParcelas;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_CONFIGURAR_PARCELA_ID');

  FQuery.TQuery.FieldByName('juros').AsCurrency := StrToCurr(FValorJuros);
  FQuery.TQuery.FieldByName('multa').AsCurrency := StrToCurr(FValorJuros);

  // FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('grupo').AsString)
  // .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

  try
    FQuery.TQuery.Post;
  except
    on e: Exception do
    begin
      raise Exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityConfigurarParcelas.inserir: iConfigurarParcelas;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityConfigurarParcelas.listarGrid(value: TDataSource)
  : iConfigurarParcelas;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'Código';
  FQuery.TQuery.FieldByName('juros').DisplayLabel := 'Juros';
  FQuery.TQuery.FieldByName('multa').DisplayLabel := 'Multa';
  FQuery.TQuery.FieldByName('juros').DisplayWidth := 50;
  FQuery.TQuery.FieldByName('multa').DisplayWidth := 50;
  FQuery.TQuery.FieldByName('multa').CurValue;

  // FQuery.TQuery.SQL.Add('order by id desc');

  value.DataSet := FQuery.TQuery;

end;

class function TEntityConfigurarParcelas.new: iConfigurarParcelas;
begin
  result := self.create;
end;

function TEntityConfigurarParcelas.nomeTabela(value: string)
  : iConfigurarParcelas;
begin
  result := self;
  FTabela := value;
end;

function TEntityConfigurarParcelas.open(value: string): iConfigurarParcelas;
begin
  FQuery.Query(FTabela);
end;

function TEntityConfigurarParcelas.ordenarGrid(column: TColumn)
  : iConfigurarParcelas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityConfigurarParcelas.pesquisar: iConfigurarParcelas;
begin
  result := self;
end;

function TEntityConfigurarParcelas.sqlPesquisa: iConfigurarParcelas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityConfigurarParcelas.sqlPesquisaData: iConfigurarParcelas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityConfigurarParcelas.sqlPesquisaEstatica: iConfigurarParcelas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
