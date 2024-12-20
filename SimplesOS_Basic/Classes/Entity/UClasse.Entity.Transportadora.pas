unit UClasse.Entity.Transportadora;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB,
  Vcl.Dialogs, System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, System.Win.ComObj;

type

  TEntityCadastroTransportadora = class(TInterfacedObject,
    iCadastroTransportadora)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FNOME_FANTASIA: string;
    FRAZAO_SOCIAL: string;
    FCPF_CNPJ: string;
    FINSCRICAO_ESTADUAL: string;
    FENDERECO: string;
    FBAIRRO: string;
    FNUMERO: integer;
    FCOMPLEMENTO: string;
    FCEP: string;
    FCIDADE: string;
    FESTADO: string;
    FTELEFONE: string;
    FCELULAR: string;
    FEMAIL: string;
    F_FUNCIONARIO_CADASTRO: integer;
    FRESPONSAVEL: string;
    FOBSERVACAO: string;

    FCodigo: integer;
    FNome: string;
    function getNome(value: string): iCadastroTransportadora;

  public

    function nomeTabela(value: string): iCadastroTransportadora;
    function getCampo(value: string): iCadastroTransportadora;
    function getValor(value: string): iCadastroTransportadora;
    function getDataInicial(value: TDate): iCadastroTransportadora;
    function getDataFinal(value: TDate): iCadastroTransportadora;
    function open(value: string): iCadastroTransportadora;
    function pesquisar: iCadastroTransportadora;
    function ExecSql: iCadastroTransportadora;
    function sqlPesquisa: iCadastroTransportadora;
    function sqlPesquisaData: iCadastroTransportadora;
    function sqlPesquisaEstatica: iCadastroTransportadora;

    function abrir: iCadastroTransportadora;
    function inserir: iCadastroTransportadora;
    function Gravar: iCadastroTransportadora;
    function deletar: iCadastroTransportadora;
    function atualizar: iCadastroTransportadora;
    function editar: iCadastroTransportadora;
    function cancelar: iCadastroTransportadora;
    function fecharQuery: iCadastroTransportadora;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroTransportadora;
    function ordenarGrid(column: TColumn): iCadastroTransportadora;

    function getCodigo(value: integer): iCadastroTransportadora;
    function getNomeFantasia(value: string): iCadastroTransportadora;
    function getRazaoSocial(value: string): iCadastroTransportadora;
    function getCPFCNPJ(value: string): iCadastroTransportadora;
    function getInscricaoEstadual(value: string): iCadastroTransportadora;
    function getEndereco(value: string): iCadastroTransportadora;
    function getBairro(value: string): iCadastroTransportadora;
    function getNumero(value: integer): iCadastroTransportadora;
    function getComplemento(value: string): iCadastroTransportadora;
    function getCep(value: string): iCadastroTransportadora;
    function getCidade(value: string): iCadastroTransportadora;
    function getEstado(value: string): iCadastroTransportadora;
    function getTelefone(value: string): iCadastroTransportadora;
    function getCelular(value: string): iCadastroTransportadora;
    function getEmail(value: string): iCadastroTransportadora;
    function getFuncionario(value: integer): iCadastroTransportadora;
    function getResponsavel(value: string): iCadastroTransportadora;
    function getObservacao(value: string): iCadastroTransportadora;
    function exportar: iCadastroTransportadora;

    constructor create;
    destructor destroy; override;
    class function new: iCadastroTransportadora;
  end;

implementation

{ TEntityCadastroTransportadora }

function TEntityCadastroTransportadora.abrir: iCadastroTransportadora;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityCadastroTransportadora.atualizar: iCadastroTransportadora;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityCadastroTransportadora.cancelar: iCadastroTransportadora;
begin
  FQuery.TQuery.Cancel;
//  FQuery.TQuery.close;
end;

function TEntityCadastroTransportadora.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityCadastroTransportadora.create;
begin
  FTabela := 'TRANSPORTADORA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro transportadora').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityCadastroTransportadora.deletar: iCadastroTransportadora;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_FANTASIA')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .getOperacao('deletado').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityCadastroTransportadora.destroy;
begin

  inherited;
end;

function TEntityCadastroTransportadora.editar: iCadastroTransportadora;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_FANTASIA')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
      .getOperacao('Editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityCadastroTransportadora.ExecSql: iCadastroTransportadora;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityCadastroTransportadora.exportar: iCadastroTransportadora;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Transportadora';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'Nome fantasia';
  pasta.cells[1, 3] := 'Raz�o social';
  pasta.cells[1, 4] := 'CPF ou CNPJ';
  pasta.cells[1, 5] := 'Inscri��o municipal';
  pasta.cells[1, 6] := 'Endere�o';
  pasta.cells[1, 7] := 'Bairro';
  pasta.cells[1, 8] := 'N�mero';
  pasta.cells[1, 9] := 'Complemento';
  pasta.cells[1, 10] := 'CEP';
  pasta.cells[1, 11] := 'Cidade';
  pasta.cells[1, 12] := 'UF';
  pasta.cells[1, 13] := 'Telefone';
  pasta.cells[1, 14] := 'Celular';
  pasta.cells[1, 15] := 'E-Mail';
  pasta.cells[1, 16] := 'Responsavel';
  pasta.cells[1, 17] := 'Funcion�rio';
  pasta.cells[1, 18] := 'Observa��o';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName
        ('NOME_FANTASIA').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName
        ('RAZAO_SOCIAL').AsString;
      pasta.cells[linha, 4] := '�'+FQuery.TQuery.FieldByName('CPF_CNPJ').AsString+'�';
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName
        ('INSCRICAO_ESTADUAL').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('ENDERECO').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('BAIRRO').AsString;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('NUMERO').AsInteger;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('COMPLEMENTO')
        .AsString;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('CEP').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('CIDADE').AsString;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('ESTADO').AsString;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('TELEFONE').AsString;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('CELULAR').AsString;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('EMAIL').AsString;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName
        ('RESPONSAVEL').AsString;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName
        ('FUNCIONARIO_CADASTRO').AsInteger;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('OBSERVACAO')
        .AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityCadastroTransportadora.fecharQuery: iCadastroTransportadora;
begin
  FQuery.TQuery.close;
end;

function TEntityCadastroTransportadora.getBairro(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FBAIRRO := value;
end;

function TEntityCadastroTransportadora.getCampo(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FCampo := value;
end;

function TEntityCadastroTransportadora.getCelular(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FCELULAR := value;
end;

function TEntityCadastroTransportadora.getCep(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FCEP := value;
end;

function TEntityCadastroTransportadora.getCidade(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FCIDADE := value;
end;

function TEntityCadastroTransportadora.getCodigo(value: integer)
  : iCadastroTransportadora;
begin
  result := self;
  FCodigo := value;
end;

function TEntityCadastroTransportadora.getComplemento(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FCOMPLEMENTO := value;
end;

function TEntityCadastroTransportadora.getCPFCNPJ(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FCPF_CNPJ := value;
end;

function TEntityCadastroTransportadora.getDataFinal(value: TDate)
  : iCadastroTransportadora;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityCadastroTransportadora.getDataInicial(value: TDate)
  : iCadastroTransportadora;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityCadastroTransportadora.getEmail(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FEMAIL := value;
end;

function TEntityCadastroTransportadora.getEndereco(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FENDERECO := value;
end;

function TEntityCadastroTransportadora.getEstado(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FESTADO := value;
end;

function TEntityCadastroTransportadora.getFuncionario(value: integer)
  : iCadastroTransportadora;
begin
  result := self;
  F_FUNCIONARIO_CADASTRO := value;
end;

function TEntityCadastroTransportadora.getInscricaoEstadual(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FINSCRICAO_ESTADUAL := value;
end;

function TEntityCadastroTransportadora.getNome(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FNome := value;
end;

function TEntityCadastroTransportadora.getNomeFantasia(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.Create('Informe o nome fantasia da transportadora.');
  FNOME_FANTASIA := value;
end;

function TEntityCadastroTransportadora.getNumero(value: integer)
  : iCadastroTransportadora;
begin
  result := self;
  FNUMERO := value;
end;

function TEntityCadastroTransportadora.getObservacao(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityCadastroTransportadora.getRazaoSocial(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FRAZAO_SOCIAL := value;
end;

function TEntityCadastroTransportadora.getResponsavel(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FRESPONSAVEL := value;
end;

function TEntityCadastroTransportadora.getTelefone(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FTELEFONE := value;
end;

function TEntityCadastroTransportadora.getValor(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityCadastroTransportadora.Gravar: iCadastroTransportadora;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_TRANSPORTADORA_ID');

  FQuery.TQuery.FieldByName('NOME_FANTASIA').AsString := FNOME_FANTASIA;
  FQuery.TQuery.FieldByName('RAZAO_SOCIAL').AsString := FRAZAO_SOCIAL;
  FQuery.TQuery.FieldByName('CPF_CNPJ').AsString := FCPF_CNPJ;
  FQuery.TQuery.FieldByName('INSCRICAO_ESTADUAL').AsString :=
    FINSCRICAO_ESTADUAL;
  FQuery.TQuery.FieldByName('ENDERECO').AsString := FENDERECO;
  FQuery.TQuery.FieldByName('BAIRRO').AsString := FBAIRRO;
  FQuery.TQuery.FieldByName('NUMERO').AsInteger := FNUMERO;
  FQuery.TQuery.FieldByName('COMPLEMENTO').AsString := FCOMPLEMENTO;
  FQuery.TQuery.FieldByName('CEP').AsString := FCEP;
  FQuery.TQuery.FieldByName('CIDADE').AsString := FCIDADE;
  FQuery.TQuery.FieldByName('ESTADO').AsString := FESTADO;
  FQuery.TQuery.FieldByName('TELEFONE').AsString := FTELEFONE;
  FQuery.TQuery.FieldByName('CELULAR').AsString := FCELULAR;
  FQuery.TQuery.FieldByName('EMAIL').AsString := FEMAIL;
  FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').AsInteger :=
    funcionarioLogado;
  FQuery.TQuery.FieldByName('RESPONSAVEL').AsString := FRESPONSAVEL;
  FQuery.TQuery.FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_FANTASIA')
    .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
    .gravarLog;

  try
    FQuery.TQuery.Post;

  except
    on e: Exception do
    begin
      raise Exception.create('Erro ao tentar gravar os registros. ' +
        e.Message);
    end;

  end;

end;

function TEntityCadastroTransportadora.inserir: iCadastroTransportadora;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('Inserindo');
end;

function TEntityCadastroTransportadora.listarGrid(value: TDataSource)
  : iCadastroTransportadora;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('NOME_FANTASIA').DisplayLabel := 'Nome fantasia';
  FQuery.TQuery.FieldByName('RAZAO_SOCIAL').DisplayLabel := 'Raz�o social';
  FQuery.TQuery.FieldByName('CPF_CNPJ').DisplayLabel := 'CPF ou CNPJ';
  FQuery.TQuery.FieldByName('INSCRICAO_ESTADUAL').DisplayLabel :=
    'Inscri��o estadual';
  FQuery.TQuery.FieldByName('ENDERECO').DisplayLabel := 'Endere�o';
  FQuery.TQuery.FieldByName('BAIRRO').DisplayLabel := 'Bairro';
  FQuery.TQuery.FieldByName('NUMERO').DisplayLabel := 'N�mero';
  FQuery.TQuery.FieldByName('COMPLEMENTO').DisplayLabel := 'Complemento';
  FQuery.TQuery.FieldByName('CEP').DisplayLabel := 'CEP';
  FQuery.TQuery.FieldByName('CIDADE').DisplayLabel := 'Cidade';
  FQuery.TQuery.FieldByName('ESTADO').DisplayLabel := 'Estado';
  FQuery.TQuery.FieldByName('TELEFONE').DisplayLabel := 'Telefone';
  FQuery.TQuery.FieldByName('CELULAR').DisplayLabel := 'Celular';
  FQuery.TQuery.FieldByName('EMAIL').DisplayLabel := 'E-mail';
  FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').DisplayLabel :=
    'Funcion�rio';
  FQuery.TQuery.FieldByName('RESPONSAVEL').DisplayLabel := 'Respons�vel';
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

  FQuery.TQuery.FieldByName('NOME_FANTASIA').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('RAZAO_SOCIAL').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('ENDERECO').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('BAIRRO').DisplayWidth := 30;
  FQuery.TQuery.FieldByName('COMPLEMENTO').DisplayWidth := 30;
  FQuery.TQuery.FieldByName('EMAIL').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('RESPONSAVEL').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayWidth := 40;

  // FQuery.TQuery.SQL.Add('order by id desc');

  value.DataSet := FQuery.TQuery;

end;

class function TEntityCadastroTransportadora.new: iCadastroTransportadora;
begin
  result := self.create;
end;

function TEntityCadastroTransportadora.nomeTabela(value: string)
  : iCadastroTransportadora;
begin
  result := self;
  FTabela := value;
end;

function TEntityCadastroTransportadora.open(value: string)
  : iCadastroTransportadora;
begin
  FQuery.Query(FTabela);
end;

function TEntityCadastroTransportadora.ordenarGrid(column: TColumn)
  : iCadastroTransportadora;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityCadastroTransportadora.pesquisar: iCadastroTransportadora;
begin
  result := self;
end;

function TEntityCadastroTransportadora.sqlPesquisa: iCadastroTransportadora;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityCadastroTransportadora.sqlPesquisaData: iCadastroTransportadora;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityCadastroTransportadora.sqlPesquisaEstatica
  : iCadastroTransportadora;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
