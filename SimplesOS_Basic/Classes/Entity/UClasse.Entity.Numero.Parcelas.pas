unit UClasse.Entity.Numero.Parcelas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityNumeroParcelas = class(TInterfacedObject, iNumeroParcelas)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FNUM_PARCELAS: integer;
    FJUROS: real;
    FAPLICAR_NA_OS: string;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iNumeroParcelas;
    function getCampo(value: string): iNumeroParcelas;
    function getValor(value: string): iNumeroParcelas;
    function getDataInicial(value: TDate): iNumeroParcelas;
    function getDataFinal(value: TDate): iNumeroParcelas;
    function open(value: string): iNumeroParcelas;
    function pesquisar: iNumeroParcelas;
    function ExecSql: iNumeroParcelas;
    function sqlPesquisa: iNumeroParcelas;
    function sqlPesquisaData: iNumeroParcelas;
    function sqlPesquisaEstatica: iNumeroParcelas;

    function abrir: iNumeroParcelas;
    function inserir: iNumeroParcelas;
    function Gravar: iNumeroParcelas;
    function deletar: iNumeroParcelas;
    function atualizar: iNumeroParcelas;
    function editar: iNumeroParcelas;
    function cancelar: iNumeroParcelas;
    function fecharQuery: iNumeroParcelas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iNumeroParcelas;
    function ordenarGrid(column: TColumn): iNumeroParcelas;

    function getID(value: integer): iNumeroParcelas;
    function getNUM_PARCELAS(value: integer): iNumeroParcelas;
    function getJUROS(value: real): iNumeroParcelas;
    function getAPLICAR_NA_OS(value: string): iNumeroParcelas;

    function exportar: iNumeroParcelas;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iNumeroParcelas;
    function getNome(value: string): iNumeroParcelas;

    constructor create;
    destructor destroy; override;
    class function new: iNumeroParcelas;
  end;

implementation

{ TEntityNumeroParcelas }

function TEntityNumeroParcelas.abrir: iNumeroParcelas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityNumeroParcelas.atualizar: iNumeroParcelas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityNumeroParcelas.cancelar: iNumeroParcelas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityNumeroParcelas.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityNumeroParcelas.create;
begin
  FTabela := 'NUMERO_PARCELAS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro n�mero de parcelas')
    .getCodigoFuncionario(funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityNumeroParcelas.deletar: iNumeroParcelas;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('ID')
        .AsInteger.ToString).getOperacao('deletado').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityNumeroParcelas.destroy;
begin

  inherited;
end;

function TEntityNumeroParcelas.editar: iNumeroParcelas;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('ID')
      .AsInteger.ToString).getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityNumeroParcelas.ExecSql: iNumeroParcelas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityNumeroParcelas.exportar: iNumeroParcelas;
begin
  result := self;
end;

function TEntityNumeroParcelas.fecharQuery: iNumeroParcelas;
begin
  FQuery.TQuery.close;
end;

function TEntityNumeroParcelas.getAPLICAR_NA_OS(value: string): iNumeroParcelas;
begin
  result := self;
  FAPLICAR_NA_OS := value;
end;

function TEntityNumeroParcelas.getCampo(value: string): iNumeroParcelas;
begin
  result := self;
  FCampo := value;
end;

function TEntityNumeroParcelas.getCodigo(value: integer): iNumeroParcelas;
begin
  result := self;
  FCodigo := value;
end;

function TEntityNumeroParcelas.getDataFinal(value: TDate): iNumeroParcelas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityNumeroParcelas.getDataInicial(value: TDate): iNumeroParcelas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityNumeroParcelas.getID(value: integer): iNumeroParcelas;
begin
  result := self;
  FID := value;
end;

function TEntityNumeroParcelas.getJUROS(value: real): iNumeroParcelas;
begin
  result := self;
  FJUROS := value;
end;

function TEntityNumeroParcelas.getNome(value: string): iNumeroParcelas;
begin
  result := self;
  FNome := value;
end;

function TEntityNumeroParcelas.getNUM_PARCELAS(value: integer): iNumeroParcelas;
begin
  result := self;
  if value = 0 then
    raise Exception.create('Informe um valor superior a 0(zero)');
  FNUM_PARCELAS := value;

end;

function TEntityNumeroParcelas.getValor(value: string): iNumeroParcelas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityNumeroParcelas.Gravar: iNumeroParcelas;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_NUMERO_PARCELAS_ID');

  with FQuery.TQuery do
  begin
    FieldByName('NUM_PARCELAS').AsInteger := FNUM_PARCELAS;
    FieldByName('JUROS').AsFloat := FJUROS;
    FieldByName('APLICAR_NA_OS').AsString := FAPLICAR_NA_OS;
  end;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('ID').AsInteger.ToString)
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

function TEntityNumeroParcelas.inserir: iNumeroParcelas;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo');
end;

function TEntityNumeroParcelas.listarGrid(value: TDataSource): iNumeroParcelas;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'C�digo';
    FieldByName('NUM_PARCELAS').DisplayLabel := 'N�mero de parcelas';
    FieldByName('JUROS').DisplayLabel := 'Juros (%)';
    FieldByName('APLICAR_NA_OS').DisplayLabel := 'Aplicar nas OS';

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityNumeroParcelas.new: iNumeroParcelas;
begin
  result := self.create;
end;

function TEntityNumeroParcelas.nomeTabela(value: string): iNumeroParcelas;
begin
  result := self;
  FTabela := value;
end;

function TEntityNumeroParcelas.open(value: string): iNumeroParcelas;
begin
  FQuery.Query(FTabela);
end;

function TEntityNumeroParcelas.ordenarGrid(column: TColumn): iNumeroParcelas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityNumeroParcelas.pesquisar: iNumeroParcelas;
begin
  result := self;
end;

function TEntityNumeroParcelas.sqlPesquisa: iNumeroParcelas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityNumeroParcelas.sqlPesquisaData: iNumeroParcelas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityNumeroParcelas.sqlPesquisaEstatica: iNumeroParcelas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityNumeroParcelas.validarData(componet: tmaskEdit);
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
