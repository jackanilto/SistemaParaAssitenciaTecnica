unit UClasse.Entity.Problemas.Frequentes;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, System.Win.ComObj;

type

  TEntityProblemasFrequentes = class(TInterfacedObject,
    iCadastroProblemasFrequentes)
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
    FNOME_PECA: string;
    FNUMERO_SERIE: String;
    FMARCA: String;
    FDATA_FABRICACAO: TDate;
    FDATA_CADASTRO: TDate;
    FDEFEITO: String;
    FSOLUCAO_DEFEITO: string;
    F_FUNCIONARIO: integer;
    FOBSERVACAO: String;

    function getNome(value: string): iCadastroProblemasFrequentes;

  public

    function nomeTabela(value: string): iCadastroProblemasFrequentes;
    function getCampo(value: string): iCadastroProblemasFrequentes;
    function getValor(value: string): iCadastroProblemasFrequentes;
    function getDataInicial(value: TDate): iCadastroProblemasFrequentes;
    function getDataFinal(value: TDate): iCadastroProblemasFrequentes;
    function open(value: string): iCadastroProblemasFrequentes;
    function pesquisar: iCadastroProblemasFrequentes;
    function ExecSql: iCadastroProblemasFrequentes;
    function sqlPesquisa: iCadastroProblemasFrequentes;
    function sqlPesquisaData: iCadastroProblemasFrequentes;
    function sqlPesquisaEstatica: iCadastroProblemasFrequentes;

    function abrir: iCadastroProblemasFrequentes;
    function inserir: iCadastroProblemasFrequentes;
    function Gravar: iCadastroProblemasFrequentes;
    function deletar: iCadastroProblemasFrequentes;
    function atualizar: iCadastroProblemasFrequentes;
    function editar: iCadastroProblemasFrequentes;
    function cancelar: iCadastroProblemasFrequentes;
    function fecharQuery: iCadastroProblemasFrequentes;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroProblemasFrequentes;
    function ordenarGrid(column: TColumn): iCadastroProblemasFrequentes;

    function getCodigo(value: integer): iCadastroProblemasFrequentes;
    function getNomePeca(value: string): iCadastroProblemasFrequentes;
    function getNumeroSerie(value: string): iCadastroProblemasFrequentes;
    function getMarca(value: string): iCadastroProblemasFrequentes;
    function getDataDeFabricacao(value: string): iCadastroProblemasFrequentes;
    function getDataDeCadastro(value: string): iCadastroProblemasFrequentes;
    function getDefeitoRelatado(value: string): iCadastroProblemasFrequentes;
    function getSolucaoDoDefeito(value: string): iCadastroProblemasFrequentes;
    function getObservacao(value: string): iCadastroProblemasFrequentes;
    function exportar: iCadastroProblemasFrequentes;

    constructor create;
    destructor destroy; override;
    class function new: iCadastroProblemasFrequentes;
  end;

implementation

{ TEntityProblemasFrequentes }

function TEntityProblemasFrequentes.abrir: iCadastroProblemasFrequentes;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityProblemasFrequentes.atualizar: iCadastroProblemasFrequentes;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityProblemasFrequentes.cancelar: iCadastroProblemasFrequentes;
begin
  FQuery.TQuery.Cancel;
  FQuery.TQuery.close;
end;

function TEntityProblemasFrequentes.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityProblemasFrequentes.create;
begin
  FTabela := 'PROBLEMAS_FREQUENTES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Problemas frequentes').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityProblemasFrequentes.deletar: iCadastroProblemasFrequentes;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_PECA')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .getOperacao('deletando').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityProblemasFrequentes.destroy;
begin

  inherited;
end;

function TEntityProblemasFrequentes.editar: iCadastroProblemasFrequentes;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_PECA').AsString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityProblemasFrequentes.ExecSql: iCadastroProblemasFrequentes;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityProblemasFrequentes.exportar: iCadastroProblemasFrequentes;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio dos problemas frequentes';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'Equipamento';
  pasta.cells[1, 3] := 'N�mero de serie';
  pasta.cells[1, 4] := 'Marca';
  pasta.cells[1, 5] := 'Data de fabrica��o';
  pasta.cells[1, 6] := 'Data de cadastro';;
  pasta.cells[1, 7] := 'Defeito';
  pasta.cells[1, 8] := 'Solu��o';
  pasta.cells[1, 9] := 'Funcion�rio';
  pasta.cells[1, 10] := 'Observa��o';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('id').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('nome_peca').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName
        ('numero_serie').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('Marca').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('data_fabricacao')
        .AsDateTime;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('data_cadastro')
        .AsDateTime;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('defeito').Text;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName
        ('solucao_defeito').Text;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('funcionario')
        .AsInteger;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('observacao')
        .AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityProblemasFrequentes.fecharQuery: iCadastroProblemasFrequentes;
begin
  FQuery.TQuery.close;
end;

function TEntityProblemasFrequentes.getCampo(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FCampo := value;
end;

function TEntityProblemasFrequentes.getCodigo(value: integer)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FCodigo := value;
end;

function TEntityProblemasFrequentes.getDataDeCadastro(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  try
    FDATA_CADASTRO := StrToDate(value);
  except
    on e: exception do
      raise exception.create('Informe uma data de cadastro v�lida.');
  end;
end;

function TEntityProblemasFrequentes.getDataDeFabricacao(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  if value <> '  /  /    ' then
  begin
    try
      FDATA_FABRICACAO := StrToDate(value);
    except
      on e: exception do
        raise exception.create('Informe uma data de fabrica��o v�lida.');
    end;
  end;

end;

function TEntityProblemasFrequentes.getDataFinal(value: TDate)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityProblemasFrequentes.getDataInicial(value: TDate)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityProblemasFrequentes.getDefeitoRelatado(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Informe o defeito apresentado no equipamento.');
  FDEFEITO := value;
end;

function TEntityProblemasFrequentes.getMarca(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Infome a marca do equipamento.');
  FMARCA := value;
end;

function TEntityProblemasFrequentes.getNome(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  // FNome := value;
end;

function TEntityProblemasFrequentes.getNomePeca(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Infome o nome do equipamento.');
  FNOME_PECA := value;
end;

function TEntityProblemasFrequentes.getNumeroSerie(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FNUMERO_SERIE := value;;
end;

function TEntityProblemasFrequentes.getObservacao(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityProblemasFrequentes.getSolucaoDoDefeito(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FSOLUCAO_DEFEITO := value;
end;

function TEntityProblemasFrequentes.getValor(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityProblemasFrequentes.Gravar: iCadastroProblemasFrequentes;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_PROBLEMAS_FREQUENTES_ID');

  FQuery.TQuery.FieldByName('NOME_PECA').AsString := FNOME_PECA;
  FQuery.TQuery.FieldByName('NUMERO_SERIE').AsString := FNUMERO_SERIE;
  FQuery.TQuery.FieldByName('MARCA').AsString := FMARCA;
  FQuery.TQuery.FieldByName('DATA_CADASTRO').AsDateTime := FDATA_CADASTRO;
  FQuery.TQuery.FieldByName('DEFEITO').AsString := FDEFEITO;
  FQuery.TQuery.FieldByName('SOLUCAO_DEFEITO').AsString := FSOLUCAO_DEFEITO;
  FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger := funcionarioLogado;
  FQuery.TQuery.FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_PECA').AsString)
    .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

  if FDATA_FABRICACAO <> StrToDate('30/12/1899') then
    FQuery.TQuery.FieldByName('DATA_FABRICACAO').AsDateTime := FDATA_FABRICACAO;

  try
    FQuery.TQuery.Post;
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityProblemasFrequentes.inserir: iCadastroProblemasFrequentes;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo')
end;

function TEntityProblemasFrequentes.listarGrid(value: TDataSource)
  : iCadastroProblemasFrequentes;
begin

  result := self;

  FQuery.TQuery.FieldByName('ID').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('NOME_PECA').DisplayLabel := 'Equipamento';
  FQuery.TQuery.FieldByName('NUMERO_SERIE').DisplayLabel := 'Numero de serie';
  FQuery.TQuery.FieldByName('MARCA').DisplayLabel := 'Marca';
  FQuery.TQuery.FieldByName('DEFEITO').DisplayLabel := 'Defeito';
  FQuery.TQuery.FieldByName('SOLUCAO_DEFEITO').DisplayLabel :=
    'Solu��o do defeito';
  FQuery.TQuery.FieldByName('DATA_FABRICACAO').DisplayLabel :=
    'Data de fabrica��o';
  FQuery.TQuery.FieldByName('DATA_CADASTRO').DisplayLabel := 'Data de cadastro';

  FQuery.TQuery.FieldByName('FUNCIONARIO').DisplayLabel := 'Funcion�rio';
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

  FQuery.TQuery.FieldByName('NOME_PECA').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('NUMERO_SERIE').DisplayWidth := 20;
  FQuery.TQuery.FieldByName('MARCA').DisplayWidth := 20;
  FQuery.TQuery.FieldByName('DEFEITO').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('SOLUCAO_DEFEITO').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayWidth := 50;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityProblemasFrequentes.new: iCadastroProblemasFrequentes;
begin
  result := self.create;
end;

function TEntityProblemasFrequentes.nomeTabela(value: string)
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FTabela := value;
end;

function TEntityProblemasFrequentes.open(value: string)
  : iCadastroProblemasFrequentes;
begin
  FQuery.Query(FTabela);
end;

function TEntityProblemasFrequentes.ordenarGrid(column: TColumn)
  : iCadastroProblemasFrequentes;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityProblemasFrequentes.pesquisar: iCadastroProblemasFrequentes;
begin
  result := self;
end;

function TEntityProblemasFrequentes.sqlPesquisa: iCadastroProblemasFrequentes;
begin
  result := self;
  if FValor <> EmptyStr then
    FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityProblemasFrequentes.sqlPesquisaData
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityProblemasFrequentes.sqlPesquisaEstatica
  : iCadastroProblemasFrequentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
