unit UClasse.Entity.Cadastro.Servicos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TEntityCadastroServicos = class(TInterfacedObject, iCadastroServico)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: Integer;
    FSERVICO: String;
    FVALORSERVICO: Currency;
    FDESCRICAO: string;

    FCodigo: Integer;
    FNome: string;
    function getCodigo(value: Integer): iCadastroServico;
    function getNome(value: string): iCadastroServico;
    procedure validarData(componet: tmaskEdit);

  public

    function nomeTabela(value: string): iCadastroServico;
    function getCampo(value: string): iCadastroServico;
    function getValor(value: string): iCadastroServico;
    function getDataInicial(value: TDate): iCadastroServico;
    function getDataFinal(value: TDate): iCadastroServico;
    function open(value: string): iCadastroServico;
    function pesquisar: iCadastroServico;
    function ExecSql: iCadastroServico;
    function sqlPesquisa: iCadastroServico;
    function sqlPesquisaData: iCadastroServico;
    function sqlPesquisaEstatica: iCadastroServico;

    function abrir: iCadastroServico;
    function inserir: iCadastroServico;
    function Gravar: iCadastroServico;
    function deletar: iCadastroServico;
    function atualizar: iCadastroServico;
    function editar: iCadastroServico;
    function cancelar: iCadastroServico;
    function fecharQuery: iCadastroServico;
    function codigoCadastro(sp: string): Integer;
    function listarGrid(value: TDataSource): iCadastroServico;
    function ordenarGrid(column: TColumn): iCadastroServico;

    function getID(value: Integer): iCadastroServico;
    function getSERVICO(value: string): iCadastroServico;
    function getVALORSERVICO(value: string): iCadastroServico;
    function getDescricao(value: string): iCadastroServico;

    function exportar: iCadastroServico;

    constructor create;
    destructor destroy; override;
    class function new: iCadastroServico;
  end;

implementation

{ TEntityCadastroServicos }

function TEntityCadastroServicos.abrir: iCadastroServico;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityCadastroServicos.atualizar: iCadastroServico;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityCadastroServicos.cancelar: iCadastroServico;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityCadastroServicos.codigoCadastro(sp: string): Integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityCadastroServicos.create;
begin
  FTabela := 'SERVICOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro de servi�os').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityCadastroServicos.deletar: iCadastroServico;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SERVICO').AsString)
        .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('deletado').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityCadastroServicos.destroy;
begin

  inherited;
end;

function TEntityCadastroServicos.editar: iCadastroServico;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SERVICO').AsString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityCadastroServicos.ExecSql: iCadastroServico;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityCadastroServicos.exportar: iCadastroServico;
var
  pasta: variant;
  linha: Integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio de Servi�oes';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'Servi�o';
  pasta.cells[1, 3] := 'Valor';
  pasta.cells[1, 4] := 'Descri��o';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('SERVICO').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('VALOR').AsCurrency;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('DESCRICAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityCadastroServicos.fecharQuery: iCadastroServico;
begin
  FQuery.TQuery.close;
end;

function TEntityCadastroServicos.getCampo(value: string): iCadastroServico;
begin
  result := self;
  FCampo := value;
end;

function TEntityCadastroServicos.getCodigo(value: Integer): iCadastroServico;
begin
  result := self;
  FCodigo := value;
end;

function TEntityCadastroServicos.getDataFinal(value: TDate): iCadastroServico;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityCadastroServicos.getDataInicial(value: TDate): iCadastroServico;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityCadastroServicos.getDescricao(value: string): iCadastroServico;
begin
  result := self;
  FDESCRICAO := value;
end;

function TEntityCadastroServicos.getID(value: Integer): iCadastroServico;
begin
  result := self;
  FID := value;
end;

function TEntityCadastroServicos.getNome(value: string): iCadastroServico;
begin
  result := self;
  FNome := value;
end;

function TEntityCadastroServicos.getSERVICO(value: string): iCadastroServico;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe o nome para o servi�o.');

  FSERVICO := value;
end;

function TEntityCadastroServicos.getValor(value: string): iCadastroServico;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityCadastroServicos.getVALORSERVICO(value: string)
  : iCadastroServico;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe um n�mero v�lido para o Valor do Servi�o.');

  try
    FVALORSERVICO := StrToCurr(value);
  except
    on e: Exception do
    begin
      raise Exception.create
        ('Informe um n�mero valido para o Valor do Servi�o.');
    end;

  end;

end;

function TEntityCadastroServicos.Gravar: iCadastroServico;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_SERVICOS_ID');

  FQuery.TQuery.FieldByName('SERVICO').AsString := FSERVICO;
  FQuery.TQuery.FieldByName('VALOR').AsCurrency := FVALORSERVICO;
  FQuery.TQuery.FieldByName('DESCRICAO').AsString := FDESCRICAO;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('SERVICO').AsString)
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

function TEntityCadastroServicos.inserir: iCadastroServico;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo');
end;

function TEntityCadastroServicos.listarGrid(value: TDataSource)
  : iCadastroServico;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('SERVICO').DisplayLabel := 'Servi�o';
  FQuery.TQuery.FieldByName('VALOR').DisplayLabel := 'Valor';
  FQuery.TQuery.FieldByName('DESCRICAO').DisplayLabel := 'Descri��o';

  FQuery.TQuery.FieldByName('SERVICO').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('DESCRICAO').DisplayWidth := 50;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityCadastroServicos.new: iCadastroServico;
begin
  result := self.create;
end;

function TEntityCadastroServicos.nomeTabela(value: string): iCadastroServico;
begin
  result := self;
  FTabela := value;
end;

function TEntityCadastroServicos.open(value: string): iCadastroServico;
begin
  FQuery.Query(FTabela);
end;

function TEntityCadastroServicos.ordenarGrid(column: TColumn): iCadastroServico;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityCadastroServicos.pesquisar: iCadastroServico;
begin
  result := self;
end;

function TEntityCadastroServicos.sqlPesquisa: iCadastroServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityCadastroServicos.sqlPesquisaData: iCadastroServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityCadastroServicos.sqlPesquisaEstatica: iCadastroServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityCadastroServicos.validarData(componet: tmaskEdit);
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
