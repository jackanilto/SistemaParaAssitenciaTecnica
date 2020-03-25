unit UClasse.Entity.Configurar.Acesso.Funcionario;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityConfigAcessoFuncionario = class(TInterfacedObject, iNivelAcessoFuncionario)
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

    function nomeTabela(value: string): iNivelAcessoFuncionario;
    function getCampo(value: string): iNivelAcessoFuncionario;
    function getValor(value: string): iNivelAcessoFuncionario;
    function getDataInicial(value: TDate): iNivelAcessoFuncionario;
    function getDataFinal(value: TDate): iNivelAcessoFuncionario;
    function open(value: string): iNivelAcessoFuncionario;
    function pesquisar: iNivelAcessoFuncionario;
    function ExecSql: iNivelAcessoFuncionario;
    function sqlPesquisa: iNivelAcessoFuncionario;
    function sqlPesquisaData: iNivelAcessoFuncionario;
    function sqlPesquisaEstatica: iNivelAcessoFuncionario;
    function SelectSql(value: string): iNivelAcessoFuncionario;

    function abrir: iNivelAcessoFuncionario;
    function inserir: iNivelAcessoFuncionario;
    function gravar: iNivelAcessoFuncionario;
    function deletar: iNivelAcessoFuncionario;
    function atualizar: iNivelAcessoFuncionario;
    function editar: iNivelAcessoFuncionario;
    function cancelar: iNivelAcessoFuncionario;
    function fecharQuery: iNivelAcessoFuncionario;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iNivelAcessoFuncionario;
    function ordenarGrid(column: TColumn): iNivelAcessoFuncionario;

    constructor create;
    destructor destroy; override;
    class function new: iNivelAcessoFuncionario;
  end;

implementation

{ TEntityConfigAcessoFuncionario }

function TEntityConfigAcessoFuncionario.abrir: iNivelAcessoFuncionario;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityConfigAcessoFuncionario.atualizar: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityConfigAcessoFuncionario.cancelar: iNivelAcessoFuncionario;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityConfigAcessoFuncionario.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityConfigAcessoFuncionario.create;
begin
  FTabela := 'RECURSOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Configurar acesso recursos funcion�rios').getCodigoFuncionario
    (funcionarioLogado);

end;

function TEntityConfigAcessoFuncionario.deletar: iNivelAcessoFuncionario;
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

destructor TEntityConfigAcessoFuncionario.destroy;
begin

  inherited;
end;

function TEntityConfigAcessoFuncionario.editar: iNivelAcessoFuncionario;
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

function TEntityConfigAcessoFuncionario.ExecSql: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityConfigAcessoFuncionario.fecharQuery: iNivelAcessoFuncionario;
begin
  FQuery.TQuery.close;
end;

function TEntityConfigAcessoFuncionario.getCampo(value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FCampo := value;
end;

function TEntityConfigAcessoFuncionario.getDataFinal(value: TDate): iNivelAcessoFuncionario;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityConfigAcessoFuncionario.getDataInicial(value: TDate): iNivelAcessoFuncionario;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityConfigAcessoFuncionario.getValor(value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityConfigAcessoFuncionario.Gravar: iNivelAcessoFuncionario;
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

function TEntityConfigAcessoFuncionario.inserir: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityConfigAcessoFuncionario.listarGrid(value: TDataSource): iNivelAcessoFuncionario;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').Visible := false;
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('FUNCIONARIO').DisplayLabel := 'Funcion�rio';
    FieldByName('FORMCADASTROMARCAS').DisplayLabel := 'Cadastro de marcas';
    FieldByName('FORMCADASTROGRUPOS').DisplayLabel := 'Cadastro de grupos';
    FieldByName('FORMFORMAPAGAMENTO').DisplayLabel := 'Formas de pagamento';
    FieldByName('FORMTIPORETIRADAS').DisplayLabel := 'Tipo de retirada';
    FieldByName('FORMCONFIGPARCELAS').DisplayLabel := 'Configurar parcelas';
    FieldByName('FORMATFUNCIONARIO').DisplayLabel := 'Atividade funcion�rio';
    FieldByName('FORMCADCONTASAPAGAR').DisplayLabel := 'Contas a pagar';
    FieldByName('FORMCADPROBLEMASFREQUENTES').DisplayLabel := 'Cadastro de problemas';
    FieldByName('FORMCADFORNECEDORES').DisplayLabel := 'Cadastro de fornecedores';
    FieldByName('FORMCADTRANSPORTADORA').DisplayLabel := 'Cadastro de transportadora';
    FieldByName('FORMCADPRODUTOS').DisplayLabel := 'Cadastro de produtos';
    FieldByName('FORMCOMFUNCIONARIOS').DisplayLabel := 'Comiss�es funcion�rios';
    FieldByName('FORMCADDEFUNCIONARIOS').DisplayLabel := 'Cadastro de funcion�rios';
    FieldByName('FORMCADSITUACOESORDEM').DisplayLabel := 'Situa��es da ordem';
    FieldByName('FORMCADDECLIENTES').DisplayLabel := 'Cadastro de clientes';
    FieldByName('FORMENTDEPRODUTOS').DisplayLabel := 'Cadastro de produtos';
    FieldByName('FORMSAIDADEPRODUTOS').DisplayLabel := 'Sa�da de produtos';
    FieldByName('FORMORDEMSERVICO').DisplayLabel := 'Ordem de servi�o';
    FieldByName('FORMCCONSORDEMSERVICO').DisplayLabel := 'Criar OS';
    FieldByName('FORMCADDESERVICOS').DisplayLabel := 'Cadastro de servi�os';
    FieldByName('FORMCADEMPRESA').DisplayLabel := 'Cadastro de empresa';
    FieldByName('FORMVENDAS').DisplayLabel := 'Vendas';
    FieldByName('FORMNUMPARCELAS').DisplayLabel := 'N�mero de parcelas';
    FieldByName('FORMQUITARPARCVENDAS').DisplayLabel := 'Quitar parcela venda';
    FieldByName('FORMVISUALIZARVENDAS').DisplayLabel := 'Visualizar venda';
    FieldByName('FORMRELCLIENTES').DisplayLabel := 'Relat�rio de clientes';
    FieldByName('FORMRELHISTORICOOS').DisplayLabel := 'Historico OS';
    FieldByName('FORMRELCONTASARECEBEROS').DisplayLabel := 'Contas a receber OS';
    FieldByName('FORMRELCONTASARECEBERVENDA').DisplayLabel := 'Contas a receber Venda';
    FieldByName('FORMRELPARCELASPAGASOS').DisplayLabel := 'Parcelas pagas OS';
    FieldByName('FORMOSESTORNADAS').DisplayLabel := 'OS estornadas';
    FieldByName('FORMRELVENDASESTORNADAS').DisplayLabel := 'Vendas estornadas';
    FieldByName('FORMRELCONTASAPAGAR').DisplayLabel := 'Relat�rio contas a pagar';
    FieldByName('FORMRELREPAROSPORPERIODO').DisplayLabel := 'Rel. Reparos por per�odo';
    FieldByName('FORMRELATOSPORTECNICO').DisplayLabel := 'OS por t�cnicos';
    FieldByName('FORMRELATOSPORSTATUS').DisplayLabel := 'OS por status';
    FieldByName('FORMRELATORDEMDESERVICO').DisplayLabel := 'Relatorio OS';
    FieldByName('FORMRELATFORNECEDORES').DisplayLabel := 'Rel. Fornecedores';
    FieldByName('FORMRELATOSINADIMPLENTES').DisplayLabel := 'Rel. OS inadimplentes';
    FieldByName('FORMRELATDEPRODUTOS').DisplayLabel := 'Relat�rio produtos';
    FieldByName('FORMRELATSITUACAODOESTOQUE').DisplayLabel := 'Situa��o do estoque';
    FieldByName('FORMRELATPRODVENDIDOS').DisplayLabel := 'Produtos vendidos';
    FieldByName('FORMRELATVENDAS').DisplayLabel := 'Relat�rio vendas';
    FieldByName('FORMRELATVENDASINADIMP').DisplayLabel := 'Vendas inadimplentes';
    FieldByName('FORMRELATSERVICOSMAISREALIZ').DisplayLabel := 'Servi�os realizados';
    FieldByName('FORMRELATSAIDADEPRODUTOS').DisplayLabel := 'Rel. Sa�da de produtos';
    FieldByName('FORMRELATENTRDEPRODUTOS').DisplayLabel := 'Rel. Entrada de produtos';
    FieldByName('FORMRELATVENDASFUNCIONARIO').DisplayLabel := 'Rel. Vendas por funcion�rio';
    FieldByName('FORMRELATTRANSPORTADORA').DisplayLabel := 'Relat�rio transportadora';
    FieldByName('FORMINICIARCAIXA').DisplayLabel := 'Iniciar caixa';
    FieldByName('FORMENCERRAMENTOCAIXA').DisplayLabel := 'Encerramento de caixa';
    FieldByName('FORMREABERTURADECAIXA').DisplayLabel := 'Abertura de caixa';
    FieldByName('FORMRETIRADADEVALORES').DisplayLabel := 'Retirada de valores';
    FieldByName('FORMRELATRETIRDEVALORES').DisplayLabel := 'Rel. Retirada valores';
    FieldByName('FORMCOMISSOESTECNICOS').DisplayLabel := 'Comiss�es t�cnicos';
    FieldByName('FORMCONFIGCONEXAOBANCO').DisplayLabel := 'Configurar conex�o';
    FieldByName('FORMCONFIGBACKUP').DisplayLabel := 'Configurar backup';
    FieldByName('FORMBACKUPMANUAL').DisplayLabel := 'BackUp manual';
    FieldByName('FORMRELATPROBLFREQUENTES').DisplayLabel := 'Rel. Problemas frequentes';
    FieldByName('FORMRELATHISTORICOCAIXA').DisplayLabel := 'Rel. Historio caixa';
    FieldByName('FORMQUITARPARCELAOS').DisplayLabel := 'Quitar Parcelas OS';
    FieldByName('FORMMOVIMENTACAOCAIXA').DisplayLabel := 'Movimneta��o do caixa';
    FieldByName('ESTORNAR').DisplayLabel := 'Estornar';
    FieldByName('ADICIONARPARCELA').DisplayLabel := 'Adiconar parcela';
    FieldByName('EXCLUIRPARCELA').DisplayLabel := 'Excluir parcela';

    FieldByName('FUNCIONARIO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityConfigAcessoFuncionario.new: iNivelAcessoFuncionario;
begin
  result := self.create;
end;

function TEntityConfigAcessoFuncionario.nomeTabela(value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FTabela := value;
end;

function TEntityConfigAcessoFuncionario.open(value: string): iNivelAcessoFuncionario;
begin
  FQuery.Query(FTabela);
end;

function TEntityConfigAcessoFuncionario.ordenarGrid(column: TColumn): iNivelAcessoFuncionario;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityConfigAcessoFuncionario.pesquisar: iNivelAcessoFuncionario;
begin
  result := self;
end;

function TEntityConfigAcessoFuncionario.SelectSql(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
end;

function TEntityConfigAcessoFuncionario.sqlPesquisa: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityConfigAcessoFuncionario.sqlPesquisaData: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityConfigAcessoFuncionario.sqlPesquisaEstatica: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.