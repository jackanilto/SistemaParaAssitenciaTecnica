unit UClasse.Entity.Marcas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids;

type

  TEntityMarcas = class(TInterfacedObject, iCadastroMarcas)
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
    FMarca: string;

  public

    function getCampo(value: string): iCadastroMarcas;
    function getValor(value: string): iCadastroMarcas;
    function getDataInicial(value: TDate): iCadastroMarcas;
    function getDataFinal(value: TDate): iCadastroMarcas;
    function open(value: string): iCadastroMarcas;
    function ExecSql: iCadastroMarcas;
    function sqlPesquisa: iCadastroMarcas;
    function sqlPesquisaData: iCadastroMarcas;
    function sqlPesquisaEstatica: iCadastroMarcas;

    function abrir: iCadastroMarcas;
    function inserir: iCadastroMarcas;
    function Gravar: iCadastroMarcas;
    function deletar: iCadastroMarcas;
    function atualizar: iCadastroMarcas;
    function editar: iCadastroMarcas;
    function cancelar: iCadastroMarcas;
    function fecharQuery: iCadastroMarcas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroMarcas;
    function ordenarGrid(column: TColumn): iCadastroMarcas;

    function getCodigo(value: integer): iCadastroMarcas;
    function getMarca(value: string): iCadastroMarcas;

    constructor create;
    destructor destroy; override;
    class function new: iCadastroMarcas;
  end;

implementation

{ TEntityMarcas }

function TEntityMarcas.abrir: iCadastroMarcas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityMarcas.atualizar: iCadastroMarcas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityMarcas.cancelar: iCadastroMarcas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityMarcas.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityMarcas.create;
begin
  FTabela := 'Marca';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro marca').getCodigoFuncionario(funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityMarcas.deletar: iCadastroMarcas;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('Marca').AsString)
        .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('deletado').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityMarcas.destroy;
begin

  inherited;
end;

function TEntityMarcas.editar: iCadastroMarcas;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('marca').AsString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityMarcas.ExecSql: iCadastroMarcas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityMarcas.fecharQuery: iCadastroMarcas;
begin
  FQuery.TQuery.close;
end;

function TEntityMarcas.getCampo(value: string): iCadastroMarcas;
begin
  result := self;
  FCampo := value;
end;

function TEntityMarcas.getCodigo(value: integer): iCadastroMarcas;
begin
  result := self;
  FCodigo := value;
end;

function TEntityMarcas.getDataFinal(value: TDate): iCadastroMarcas;
begin
  result := self;
  FQuery.getDataFinal(value);
end;

function TEntityMarcas.getDataInicial(value: TDate): iCadastroMarcas;
begin
  result := self;
  FQuery.getDataInicial(value);
end;

function TEntityMarcas.getMarca(value: string): iCadastroMarcas;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Digite uma valor v�lido no campo MARCA.');
  FMarca := value;
end;

function TEntityMarcas.getValor(value: string): iCadastroMarcas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityMarcas.Gravar: iCadastroMarcas;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('sp_GEN_MARCA_ID');

  FQuery.TQuery.FieldByName('marca').AsString := FMarca;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('marca').AsString)
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

function TEntityMarcas.inserir: iCadastroMarcas;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo')
end;

function TEntityMarcas.listarGrid(value: TDataSource): iCadastroMarcas;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('marca').DisplayLabel := 'Marca';
  FQuery.TQuery.FieldByName('marca').DisplayWidth := 50;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityMarcas.new: iCadastroMarcas;
begin
  result := self.create;
end;

function TEntityMarcas.open(value: string): iCadastroMarcas;
begin
  FQuery.Query(FTabela);
end;

function TEntityMarcas.ordenarGrid(column: TColumn): iCadastroMarcas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityMarcas.sqlPesquisa: iCadastroMarcas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityMarcas.sqlPesquisaData: iCadastroMarcas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityMarcas.sqlPesquisaEstatica: iCadastroMarcas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
