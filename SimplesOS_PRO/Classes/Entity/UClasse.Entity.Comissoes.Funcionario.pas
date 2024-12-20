unit UClasse.Entity.Comissoes.Funcionario;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids;

type

  TEntityComissoesFuncionarios = class(TInterfacedObject, iComissoesFuncionario)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FCodigo: integer;
    FNome: string;

    FID_FUNCIONARIO: integer;
    FAPLICAR_COMISSAO: string;
    FVALOR_POR_ATENDIMENTO: Currency;
    FOBSERVACAO: string;

    function getCodigo(value: integer): iComissoesFuncionario;
    function getNome(value: string): iComissoesFuncionario;
    function pesquisar: iComissoesFuncionario;

  public
    function nomeTabela(value: string): iComissoesFuncionario;
    function getCampo(value: string): iComissoesFuncionario;
    function getValor(value: string): iComissoesFuncionario;
    function open(value: string): iComissoesFuncionario;
    function ExecSql: iComissoesFuncionario;
    function sqlPesquisa: iComissoesFuncionario;
    function sqlPesquisaEstatica: iComissoesFuncionario; overload;
    function sqlPesquisaEstatica(value: integer)
      : iComissoesFuncionario; overload;

    function abrir: iComissoesFuncionario;
    function inserir: iComissoesFuncionario;
    function Gravar: iComissoesFuncionario;
    function deletar: iComissoesFuncionario;
    function atualizar: iComissoesFuncionario;
    function editar: iComissoesFuncionario;
    function cancelar: iComissoesFuncionario;
    function fecharQuery: iComissoesFuncionario;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iComissoesFuncionario;
    function ordenarGrid(column: TColumn): iComissoesFuncionario;

    function getID_FUNCIONARIO(value: integer): iComissoesFuncionario;
    function getAPLICAR_COMISSAO(value: string): iComissoesFuncionario;
    function getVALOR_POR_ATENDIMENTO(value: string): iComissoesFuncionario;
    function getOBSERVACAO(value: string): iComissoesFuncionario;

    constructor create;
    destructor destroy; override;
    class function new: iComissoesFuncionario;
  end;

implementation

{ TEntityComissoesFuncionarios }

function TEntityComissoesFuncionarios.abrir: iComissoesFuncionario;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityComissoesFuncionarios.atualizar: iComissoesFuncionario;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityComissoesFuncionarios.cancelar: iComissoesFuncionario;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityComissoesFuncionarios.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityComissoesFuncionarios.create;
begin
  FTabela := 'COMISSOES_FUNCIONARIOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Comiss�es dos funcion�rios').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityComissoesFuncionarios.deletar: iComissoesFuncionario;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro
        ('C�digo do funcion�rio: '+FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger.ToString)
        .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('deletado').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityComissoesFuncionarios.destroy;
begin

  inherited;
end;

function TEntityComissoesFuncionarios.editar: iComissoesFuncionario;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro
      ('C�digo do funcion�rio: '+FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger.ToString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityComissoesFuncionarios.ExecSql: iComissoesFuncionario;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityComissoesFuncionarios.fecharQuery: iComissoesFuncionario;
begin
  FQuery.TQuery.close;
end;

function TEntityComissoesFuncionarios.getAPLICAR_COMISSAO(value: string)
  : iComissoesFuncionario;
begin
  result := self;
  if value = EmptyStr then
    FAPLICAR_COMISSAO := 'sim'
  else
    FAPLICAR_COMISSAO := value;
end;

function TEntityComissoesFuncionarios.getCampo(value: string)
  : iComissoesFuncionario;
begin
  result := self;
  FCampo := value;
end;

function TEntityComissoesFuncionarios.getCodigo(value: integer)
  : iComissoesFuncionario;
begin
  result := self;
  FCodigo := value;
end;

function TEntityComissoesFuncionarios.getID_FUNCIONARIO(value: integer)
  : iComissoesFuncionario;
begin
  result := self;
  if value = 0 then
    raise Exception.create
      ('Voc� deve informar um funcion�rio para cadastrar a comiss�o.');

  FID_FUNCIONARIO := value;

end;

function TEntityComissoesFuncionarios.getNome(value: string)
  : iComissoesFuncionario;
begin
  result := self;
  FNome := value;
end;

function TEntityComissoesFuncionarios.getOBSERVACAO(value: string)
  : iComissoesFuncionario;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityComissoesFuncionarios.getValor(value: string)
  : iComissoesFuncionario;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityComissoesFuncionarios.getVALOR_POR_ATENDIMENTO(value: string)
  : iComissoesFuncionario;
begin
  result := self;
  if value = EmptyStr then
    FVALOR_POR_ATENDIMENTO := 0
  else
    try
      FVALOR_POR_ATENDIMENTO := StrToCurr(value);
    except
      on e: Exception do
      begin
        raise Exception.create('Informe um valor v�lido para a comiss�o.');
      end;

    end;
end;

function TEntityComissoesFuncionarios.Gravar: iComissoesFuncionario;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_COMISSOES_FUNCIONARIOS_I');

  FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger := FID_FUNCIONARIO;
  FQuery.TQuery.FieldByName('APLICAR_COMISSAO').AsString := FAPLICAR_COMISSAO;
  FQuery.TQuery.FieldByName('VALOR_POR_ATENDIMENTO').AsCurrency :=
    FVALOR_POR_ATENDIMENTO;
  FQuery.TQuery.FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

  FGravarLog.getNomeRegistro
    ('C�digo do funcion�rio: '+FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger.ToString)
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

function TEntityComissoesFuncionarios.inserir: iComissoesFuncionario;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo')
end;

function TEntityComissoesFuncionarios.listarGrid(value: TDataSource)
  : iComissoesFuncionario;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('ID_FUNCIONARIO').DisplayLabel :=
    'C�d. Funcion�rio';
  FQuery.TQuery.FieldByName('APLICAR_COMISSAO').DisplayLabel :=
    'Aplicar Comiss�o';
  FQuery.TQuery.FieldByName('VALOR_POR_ATENDIMENTO').DisplayLabel :=
    'Valor por atendimento';
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

  value.DataSet := FQuery.TQuery;

end;

class function TEntityComissoesFuncionarios.new: iComissoesFuncionario;
begin
  result := self.create;
end;

function TEntityComissoesFuncionarios.nomeTabela(value: string)
  : iComissoesFuncionario;
begin
  result := self;
  FTabela := value;
end;

function TEntityComissoesFuncionarios.open(value: string)
  : iComissoesFuncionario;
begin
  FQuery.Query(FTabela);
end;

function TEntityComissoesFuncionarios.ordenarGrid(column: TColumn)
  : iComissoesFuncionario;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityComissoesFuncionarios.pesquisar: iComissoesFuncionario;
begin
  result := self;
end;

function TEntityComissoesFuncionarios.sqlPesquisa: iComissoesFuncionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityComissoesFuncionarios.sqlPesquisaEstatica(value: integer)
  : iComissoesFuncionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(value.ToString).sqlPesquisaEstatica(FTabela);
end;

function TEntityComissoesFuncionarios.sqlPesquisaEstatica
  : iComissoesFuncionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisaEstatica(FTabela);

  // modifica��o do m�tod de pesquisa estatica
  if FQuery.TQuery.RecordCount >= 1 then
  begin
    raise Exception.create
      ('Este funcion�rio j� possui uma taxa de comiss�o cadastrada.' +
      ' Tente editar ou exluir para incluir uma nova comiss�o.');
  end;

end;

end.
