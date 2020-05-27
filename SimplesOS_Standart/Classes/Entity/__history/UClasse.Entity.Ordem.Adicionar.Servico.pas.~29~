unit UClasse.Entity.Ordem.Adicionar.Servico;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  Datasnap.DBClient;

type

  TEntityAdicionarItemsOrdem = class(TInterfacedObject, iAdicionarServicosOrdem)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_ORDEM: integer;
    FID_SERVICO: integer;
    FSERVICO: String;
    FVALORSERVICO: string;

    FID_Servico_Temporario: integer;
    FServico_Temporario: string;
    FValor_Servico_Temporario: Currency;

    FCodigo: integer;
    FNome: string;
    function exportar: iAdicionarServicosOrdem;
    function getCodigo(value: integer): iAdicionarServicosOrdem;
    function getNome(value: string): iAdicionarServicosOrdem;
    procedure validarData(componet: tmaskEdit);

  public

    function nomeTabela(value: string): iAdicionarServicosOrdem;
    function getCampo(value: string): iAdicionarServicosOrdem;
    function getValor(value: string): iAdicionarServicosOrdem;
    function getDataInicial(value: TDate): iAdicionarServicosOrdem;
    function getDataFinal(value: TDate): iAdicionarServicosOrdem;
    function open(value: string): iAdicionarServicosOrdem;
    function pesquisar: iAdicionarServicosOrdem;
    function ExecSql: iAdicionarServicosOrdem;
    function sqlPesquisa: iAdicionarServicosOrdem;
    function sqlPesquisaData: iAdicionarServicosOrdem;
    function sqlPesquisaEstatica: iAdicionarServicosOrdem;

    function abrir: iAdicionarServicosOrdem;
    function inserir: iAdicionarServicosOrdem;
    function Gravar: iAdicionarServicosOrdem;
    function deletar: iAdicionarServicosOrdem;
    function atualizar: iAdicionarServicosOrdem;
    function editar: iAdicionarServicosOrdem;
    function cancelar: iAdicionarServicosOrdem;
    function fecharQuery: iAdicionarServicosOrdem;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iAdicionarServicosOrdem;
    function ordenarGrid(column: TColumn): iAdicionarServicosOrdem;

    function adicionarItemsTemporiamenteID(value: integer)
      : iAdicionarServicosOrdem;
    function adicionarItemsTemporariamenteServico(value: string)
      : iAdicionarServicosOrdem;
    function adicionarItemTemporariamenteValor(value: Currency)
      : iAdicionarServicosOrdem;
    function adicionarItemsTemporariamente(value: TDataSource)
      : iAdicionarServicosOrdem;

    function getID(value: integer): iAdicionarServicosOrdem;
    function getID_ORDEM(value: integer): iAdicionarServicosOrdem;
    function getID_SERVICO(value: integer): iAdicionarServicosOrdem;
    function getSERVICO(value: string): iAdicionarServicosOrdem;
    function getVALOR_ITEM(value: string): iAdicionarServicosOrdem;

    function gravarServicosAdicionadosInsert(value: TclientDataSet;
      codigoOrdem: integer): iAdicionarServicosOrdem;
    function gravarServicosAdicionadosEdit(value: TclientDataSet;
      codigoOrdem: integer): iAdicionarServicosOrdem;

    function listarItensDaOS(value: TclientDataSet): iAdicionarServicosOrdem;

    constructor create;
    destructor destroy; override;
    class function new: iAdicionarServicosOrdem;

  end;

implementation

{ TEntityAdicionarItemsOrdem }

function TEntityAdicionarItemsOrdem.abrir: iAdicionarServicosOrdem;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityAdicionarItemsOrdem.adicionarItemsTemporariamente
  (value: TDataSource): iAdicionarServicosOrdem;
begin

  result := self;

  value.DataSet.open;
  value.DataSet.Append;

  value.DataSet.FieldByName('id').AsInteger := FID_Servico_Temporario;
  value.DataSet.FieldByName('servico').AsString := FServico_Temporario;
  value.DataSet.FieldByName('valor').AsCurrency := FValor_Servico_Temporario;

  value.DataSet.Post;

end;

function TEntityAdicionarItemsOrdem.adicionarItemsTemporariamenteServico
  (value: string): iAdicionarServicosOrdem;
begin
  result := self;
  FServico_Temporario := value;
end;

function TEntityAdicionarItemsOrdem.adicionarItemsTemporiamenteID
  (value: integer): iAdicionarServicosOrdem;
begin
  result := self;
  FID_Servico_Temporario := value;
end;

function TEntityAdicionarItemsOrdem.adicionarItemTemporariamenteValor
  (value: Currency): iAdicionarServicosOrdem;
begin
  result := self;
  FValor_Servico_Temporario := value;
end;

function TEntityAdicionarItemsOrdem.atualizar: iAdicionarServicosOrdem;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityAdicionarItemsOrdem.cancelar: iAdicionarServicosOrdem;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityAdicionarItemsOrdem.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityAdicionarItemsOrdem.create;
begin
  FTabela := 'SERVICOS_ORDEM';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Adicionar Itens Ordem').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

function TEntityAdicionarItemsOrdem.deletar: iAdicionarServicosOrdem;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SERVICO').AsString)
        .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityAdicionarItemsOrdem.destroy;
begin

  inherited;
end;

function TEntityAdicionarItemsOrdem.editar: iAdicionarServicosOrdem;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SERVICO').AsString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntityAdicionarItemsOrdem.ExecSql: iAdicionarServicosOrdem;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityAdicionarItemsOrdem.exportar: iAdicionarServicosOrdem;
begin
  result := self;
end;

function TEntityAdicionarItemsOrdem.fecharQuery: iAdicionarServicosOrdem;
begin
  FQuery.TQuery.close;
end;

function TEntityAdicionarItemsOrdem.getCampo(value: string)
  : iAdicionarServicosOrdem;
begin
  result := self;
  FCampo := value;
end;

function TEntityAdicionarItemsOrdem.getCodigo(value: integer)
  : iAdicionarServicosOrdem;
begin
  result := self;
  FCodigo := value;
end;

function TEntityAdicionarItemsOrdem.getDataFinal(value: TDate)
  : iAdicionarServicosOrdem;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityAdicionarItemsOrdem.getDataInicial(value: TDate)
  : iAdicionarServicosOrdem;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityAdicionarItemsOrdem.getID(value: integer)
  : iAdicionarServicosOrdem;
begin

end;

function TEntityAdicionarItemsOrdem.getID_ORDEM(value: integer)
  : iAdicionarServicosOrdem;
begin

end;

function TEntityAdicionarItemsOrdem.getID_SERVICO(value: integer)
  : iAdicionarServicosOrdem;
begin

end;

function TEntityAdicionarItemsOrdem.getNome(value: string)
  : iAdicionarServicosOrdem;
begin
  result := self;
  FNome := value;
end;

function TEntityAdicionarItemsOrdem.getSERVICO(value: string)
  : iAdicionarServicosOrdem;
begin

end;

function TEntityAdicionarItemsOrdem.getValor(value: string)
  : iAdicionarServicosOrdem;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityAdicionarItemsOrdem.getVALOR_ITEM(value: string)
  : iAdicionarServicosOrdem;
begin

end;

function TEntityAdicionarItemsOrdem.Gravar: iAdicionarServicosOrdem;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_SERVICOS_ORDEM_ID');

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SERVICO').AsString)
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

function TEntityAdicionarItemsOrdem.gravarServicosAdicionadosEdit
  (value: TclientDataSet; codigoOrdem: integer): iAdicionarServicosOrdem;
begin
  result := self;

  value.First;

  while not value.Eof do
  begin

    FQuery.TQuery.Insert;

    with FQuery.TQuery do
    begin
      FieldByName('ID').AsInteger := FQuery.codigoCadastro
        ('SP_GEN_SERVICOS_ID');

      FieldByName('ID_ORDEM').AsInteger := codigoOrdem;
      FieldByName('ID_SERVICO').AsInteger := value.FieldByName('id').AsInteger;
      FieldByName('SERVICO').AsString := value.FieldByName('servico').AsString;
      FieldByName('VALOR').AsCurrency := value.FieldByName('valor').AsCurrency;
    end;

    FQuery.TQuery.Post;

    value.Next;

  end;
end;

function TEntityAdicionarItemsOrdem.gravarServicosAdicionadosInsert
  (value: TclientDataSet; codigoOrdem: integer): iAdicionarServicosOrdem;
begin
  result := self;

  value.First;

  while not value.Eof do
  begin

    FQuery.TQuery.Insert;

    with FQuery.TQuery do
    begin
      FieldByName('ID').AsInteger := FQuery.codigoCadastro
        ('SP_GEN_SERVICOS_ID');

      FieldByName('ID_ORDEM').AsInteger := codigoOrdem;
      FieldByName('ID_SERVICO').AsInteger := value.FieldByName('id').AsInteger;
      FieldByName('SERVICO').AsString := value.FieldByName('servico').AsString;
      FieldByName('VALOR').AsCurrency := value.FieldByName('valor').AsCurrency;
    end;

    FQuery.TQuery.Post;

    value.Next;

  end;

end;

function TEntityAdicionarItemsOrdem.inserir: iAdicionarServicosOrdem;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityAdicionarItemsOrdem.listarGrid(value: TDataSource)
  : iAdicionarServicosOrdem;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'Código';
  FQuery.TQuery.FieldByName('ID_ORDEM').DisplayLabel := 'Código da OS';
  FQuery.TQuery.FieldByName('ID_SERVICO').DisplayLabel := 'Cód. Serviço';
  FQuery.TQuery.FieldByName('SERVICO').DisplayLabel := 'Serviço';
  FQuery.TQuery.FieldByName('VALOR').DisplayLabel := 'Valor';

  value.DataSet := FQuery.TQuery;

end;

function TEntityAdicionarItemsOrdem.listarItensDaOS(value: TclientDataSet)
  : iAdicionarServicosOrdem;
begin

  with FQuery do
  begin

    if TQuery.RecordCount >= 1 then
    begin

      TQuery.First;

      value.open;
      value.EmptyDataSet;

      while not TQuery.Eof do
      begin
        value.Append;

        value.FieldByName('id').AsInteger := TQuery.FieldByName('ID_SERVICO')
          .AsInteger;
        value.FieldByName('servico').AsString :=
          TQuery.FieldByName('SERVICO').AsString;
        value.FieldByName('valor').AsCurrency := TQuery.FieldByName('VALOR')
          .AsCurrency;

        value.Post;

        TQuery.Next;
      end;

    end;

  end;

end;

class function TEntityAdicionarItemsOrdem.new: iAdicionarServicosOrdem;
begin
  result := self.create;
end;

function TEntityAdicionarItemsOrdem.nomeTabela(value: string)
  : iAdicionarServicosOrdem;
begin
  result := self;
  FTabela := value;
end;

function TEntityAdicionarItemsOrdem.open(value: string)
  : iAdicionarServicosOrdem;
begin
  FQuery.Query(FTabela);
end;

function TEntityAdicionarItemsOrdem.ordenarGrid(column: TColumn)
  : iAdicionarServicosOrdem;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityAdicionarItemsOrdem.pesquisar: iAdicionarServicosOrdem;
begin
  result := self;
end;

function TEntityAdicionarItemsOrdem.sqlPesquisa: iAdicionarServicosOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityAdicionarItemsOrdem.sqlPesquisaData: iAdicionarServicosOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityAdicionarItemsOrdem.sqlPesquisaEstatica
  : iAdicionarServicosOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityAdicionarItemsOrdem.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data válida.');
  end;
end;

end.
