unit UClasse.Relatorio.Venda.Estornada;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TRElatorioVendasEstornadas = class(TInterfacedObject, iEstonarVenda)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID : integer;
    FID_VENDA : Integer;
    FID_CLIENTE : Integer;
    FVALOR_venda : Currency;
    FDATA : TDate;
    FHORA : TTime;
    FMOTIVO : String;
    FFUNCIONARIO : Integer;
    FOBSERVACAO : String;
    FNOME_FUNCIONARIO : String;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iEstonarVenda;
    function getCampo(value: string): iEstonarVenda;
    function getValor(value: string): iEstonarVenda;
    function getDataInicial(value: TDate): iEstonarVenda;
    function getDataFinal(value: TDate): iEstonarVenda;
    function open(value: string): iEstonarVenda;
    function pesquisar: iEstonarVenda;
    function ExecSql: iEstonarVenda;
    function sqlPesquisa: iEstonarVenda;
    function sqlPesquisaData: iEstonarVenda;
    function sqlPesquisaEstatica: iEstonarVenda;

    function abrir: iEstonarVenda;
    function inserir: iEstonarVenda;
    function gravar: iEstonarVenda;
    function atualizar: iEstonarVenda;
    function fecharQuery: iEstonarVenda;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iEstonarVenda;
    function ordenarGrid(column: TColumn): iEstonarVenda;

    function getID(value:integer):iEstonarVenda;
    function getID_VENDA(value:integer):iEstonarVenda;
    function getID_CLIENTE(value:integer):iEstonarVenda;
    function getVALOR_OS(value:Currency):iEstonarVenda;
    function getDATA(value:string):iEstonarVenda;
    function getHORA(value:string):iEstonarVenda;
    function getMOTIVO(value:string):iEstonarVenda;
    function getFUNCIONARIO(value:integer):iEstonarVenda;
    function getNOME_FUNCIONARIO(value:string):iEstonarVenda;
    function getOBSERVACAO(value:string):iEstonarVenda;

    function exportar: iEstonarVenda;
    function validarData(componet: tmaskEdit):iEstonarVenda;

    function getCodigo(value: integer): iEstonarVenda;
    function getNome(value: string): iEstonarVenda;

    constructor create;
    destructor destroy; override;
    class function new: iEstonarVenda;
  end;

implementation

{ TRElatorioVendasEstornadas }

function TRElatorioVendasEstornadas.abrir: iEstonarVenda;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRElatorioVendasEstornadas.atualizar: iEstonarVenda;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRElatorioVendasEstornadas.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TRElatorioVendasEstornadas.create;
begin
  FTabela := 'PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro de produtos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRElatorioVendasEstornadas.destroy;
begin

  inherited;
end;

function TRElatorioVendasEstornadas.ExecSql: iEstonarVenda;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRElatorioVendasEstornadas.exportar: iEstonarVenda;
begin
  result := self;
end;

function TRElatorioVendasEstornadas.fecharQuery: iEstonarVenda;
begin
  FQuery.TQuery.close;
end;

function TRElatorioVendasEstornadas.getCampo(value: string): iEstonarVenda;
begin
  result := self;
  FCampo := value;
end;

function TRElatorioVendasEstornadas.getCodigo(value: integer): iEstonarVenda;
begin
  result := self;
  FCodigo := value;
end;

function TRElatorioVendasEstornadas.getDATA(value: string): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.getDataFinal(value: TDate): iEstonarVenda;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRElatorioVendasEstornadas.getDataInicial(value: TDate): iEstonarVenda;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRElatorioVendasEstornadas.getFUNCIONARIO(
  value: integer): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.getHORA(value: string): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.getID(value: integer): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.getID_CLIENTE(
  value: integer): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.getID_VENDA(value: integer): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.getMOTIVO(value: string): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.getNome(value: string): iEstonarVenda;
begin
  result := self;
  FNome := value;
end;

function TRElatorioVendasEstornadas.getNOME_FUNCIONARIO(
  value: string): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.getOBSERVACAO(value: string): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.getValor(value: string): iEstonarVenda;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRElatorioVendasEstornadas.getVALOR_OS(value: Currency): iEstonarVenda;
begin

end;

function TRElatorioVendasEstornadas.Gravar: iEstonarVenda;
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

function TRElatorioVendasEstornadas.inserir: iEstonarVenda;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TRElatorioVendasEstornadas.listarGrid(value: TDataSource): iEstonarVenda;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('grupo').DisplayLabel := 'Grupo';
  FQuery.TQuery.FieldByName('grupo').DisplayWidth := 50;

  value.DataSet := FQuery.TQuery;

end;

class function TRElatorioVendasEstornadas.new: iEstonarVenda;
begin
  result := self.create;
end;

function TRElatorioVendasEstornadas.nomeTabela(value: string): iEstonarVenda;
begin
  result := self;
  FTabela := value;
end;

function TRElatorioVendasEstornadas.open(value: string): iEstonarVenda;
begin
  FQuery.Query(FTabela);
end;

function TRElatorioVendasEstornadas.ordenarGrid(column: TColumn): iEstonarVenda;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRElatorioVendasEstornadas.pesquisar: iEstonarVenda;
begin
  result := self;
end;

function TRElatorioVendasEstornadas.sqlPesquisa: iEstonarVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRElatorioVendasEstornadas.sqlPesquisaData: iEstonarVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRElatorioVendasEstornadas.sqlPesquisaEstatica: iEstonarVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRElatorioVendasEstornadas.validarData(componet: tmaskEdit):iEstonarVenda;
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
