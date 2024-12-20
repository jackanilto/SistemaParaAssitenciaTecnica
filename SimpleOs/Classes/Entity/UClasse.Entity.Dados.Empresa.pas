unit UClasse.Entity.Dados.Empresa;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TEntityCadastroDadosEmpresa = class(TInterfacedObject, iDadosEmpresa)
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
    FCNPJ: string;
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
    FRESPONSAVEL: string;
    FOBSERVACAO: string;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iDadosEmpresa;
    function getCampo(value: string): iDadosEmpresa;
    function getValor(value: string): iDadosEmpresa;
    function getDataInicial(value: TDate): iDadosEmpresa;
    function getDataFinal(value: TDate): iDadosEmpresa;
    function open(value: string): iDadosEmpresa;
    function pesquisar: iDadosEmpresa;
    function ExecSql: iDadosEmpresa;
    function sqlPesquisa: iDadosEmpresa;
    function sqlPesquisaData: iDadosEmpresa;
    function sqlPesquisaEstatica: iDadosEmpresa;

    function abrir: iDadosEmpresa;
    function inserir: iDadosEmpresa;
    function Gravar: iDadosEmpresa;
    function deletar: iDadosEmpresa;
    function atualizar: iDadosEmpresa;
    function editar: iDadosEmpresa;
    function cancelar: iDadosEmpresa;
    function fecharQuery: iDadosEmpresa;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iDadosEmpresa;
    function ordenarGrid(column: TColumn): iDadosEmpresa;

    function getID(value: integer): iDadosEmpresa;
    function getNOME_FANTASIA(value: string): iDadosEmpresa;
    function getRAZAO_SOCIAL(value: string): iDadosEmpresa;
    function getCNPJ(value: string): iDadosEmpresa;
    function getINSCRICAO_ESTADUAL(value: string): iDadosEmpresa;
    function getEndereco(value: string): iDadosEmpresa;
    function getBairro(value: string): iDadosEmpresa;
    function getNumero(value: integer): iDadosEmpresa;
    function getComplemento(value: string): iDadosEmpresa;
    function getCep(value: string): iDadosEmpresa;
    function getCidade(value: string): iDadosEmpresa;
    function getEstado(value: string): iDadosEmpresa;
    function getTelefone(value: string): iDadosEmpresa;
    function getCelular(value: string): iDadosEmpresa;
    function getEmail(value: string): iDadosEmpresa;
    function getResponsavel(value: string): iDadosEmpresa;
    function getObservacao(value: string): iDadosEmpresa;

    function exportar: iDadosEmpresa;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iDadosEmpresa;
    function getNome(value: string): iDadosEmpresa;

    constructor create;
    destructor destroy; override;
    class function new: iDadosEmpresa;
  end;

implementation

{ TEntityCadastroDadosEmpresa }

function TEntityCadastroDadosEmpresa.abrir: iDadosEmpresa;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityCadastroDadosEmpresa.atualizar: iDadosEmpresa;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityCadastroDadosEmpresa.cancelar: iDadosEmpresa;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityCadastroDadosEmpresa.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityCadastroDadosEmpresa.create;
begin
  FTabela := 'EMPRESA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro Dados da Empresa').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityCadastroDadosEmpresa.deletar: iDadosEmpresa;
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

destructor TEntityCadastroDadosEmpresa.destroy;
begin

  inherited;
end;

function TEntityCadastroDadosEmpresa.editar: iDadosEmpresa;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_FANTASIA')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
      .getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityCadastroDadosEmpresa.ExecSql: iDadosEmpresa;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityCadastroDadosEmpresa.exportar: iDadosEmpresa;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Dados da Empresa';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Nome fantasia';
  pasta.cells[1, 2] := 'Raz�o social';
  pasta.cells[1, 3] := 'CNPJ';
  pasta.cells[1, 4] := 'Inscri��o estadual';
  pasta.cells[1, 5] := 'Endere�o';
  pasta.cells[1, 6] := 'Bairro';
  pasta.cells[1, 7] := 'N�mero';
  pasta.cells[1, 8] := 'Complemento';
  pasta.cells[1, 9] := 'CEP';
  pasta.cells[1, 10] := 'Cidade';
  pasta.cells[1, 11] := 'Estado';
  pasta.cells[1, 12] := 'Telefone';
  pasta.cells[1, 13] := 'Celular';
  pasta.cells[1, 14] := 'E-Mail';
  pasta.cells[1, 15] := 'Respons�vel';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('NOME_FANTASIA').AsString;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('RAZAO_SOCIAL').AsString;
      pasta.cells[linha, 3] := '"'+FQuery.TQuery.FieldByName('CNPJ').AsString+'"';
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('INSCRICAO_ESTADUAL').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('ENDERECO').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('BAIRRO').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('NUMERO').AsInteger;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('COMPLEMENTO').AsString;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('CEP').AsString;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('CIDADE').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('ESTADO').AsString;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('TELEFONE').AsString;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('CELULAR').AsString;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('EMAIL').AsString;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('RESPONSAVEL').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityCadastroDadosEmpresa.fecharQuery: iDadosEmpresa;
begin
  FQuery.TQuery.close;
end;

function TEntityCadastroDadosEmpresa.getBairro(value: string): iDadosEmpresa;
begin
  result := self;
  FBAIRRO := value;
end;

function TEntityCadastroDadosEmpresa.getCampo(value: string): iDadosEmpresa;
begin
  result := self;
  FCampo := value;
end;

function TEntityCadastroDadosEmpresa.getCelular(value: string): iDadosEmpresa;
begin
  result := self;
  FCELULAR := value;
end;

function TEntityCadastroDadosEmpresa.getCep(value: string): iDadosEmpresa;
begin
  result := self;
  FCEP := value;
end;

function TEntityCadastroDadosEmpresa.getCidade(value: string): iDadosEmpresa;
begin
  result := self;
  FCIDADE := value;
end;

function TEntityCadastroDadosEmpresa.getCNPJ(value: string): iDadosEmpresa;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe um CNPJ v�lido.');
  FCNPJ := value;
end;

function TEntityCadastroDadosEmpresa.getCodigo(value: integer): iDadosEmpresa;
begin
  result := self;
  FCodigo := value;
end;

function TEntityCadastroDadosEmpresa.getComplemento(value: string)
  : iDadosEmpresa;
begin
  result := self;
  FCOMPLEMENTO := value;
end;

function TEntityCadastroDadosEmpresa.getDataFinal(value: TDate): iDadosEmpresa;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityCadastroDadosEmpresa.getDataInicial(value: TDate)
  : iDadosEmpresa;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityCadastroDadosEmpresa.getEmail(value: string): iDadosEmpresa;
begin
  result := self;
  FEMAIL := value;
end;

function TEntityCadastroDadosEmpresa.getEndereco(value: string): iDadosEmpresa;
begin
  result := self;
  FENDERECO := value;
end;

function TEntityCadastroDadosEmpresa.getEstado(value: string): iDadosEmpresa;
begin
  result := self;
  FESTADO := value;
end;

function TEntityCadastroDadosEmpresa.getID(value: integer): iDadosEmpresa;
begin
  result := self;
  FID := value;
end;

function TEntityCadastroDadosEmpresa.getINSCRICAO_ESTADUAL(value: string)
  : iDadosEmpresa;
begin
  result := self;
  FINSCRICAO_ESTADUAL := value;;
end;

function TEntityCadastroDadosEmpresa.getNome(value: string): iDadosEmpresa;
begin
  result := self;
  FNome := value;
end;

function TEntityCadastroDadosEmpresa.getNOME_FANTASIA(value: string)
  : iDadosEmpresa;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe o Nome Fantasia da Empresa.');
  FNOME_FANTASIA := value;
end;

function TEntityCadastroDadosEmpresa.getNumero(value: integer): iDadosEmpresa;
begin
  result := self;
  FNUMERO := value;
end;

function TEntityCadastroDadosEmpresa.getObservacao(value: string)
  : iDadosEmpresa;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityCadastroDadosEmpresa.getRAZAO_SOCIAL(value: string)
  : iDadosEmpresa;
begin
  result := self;
  FRAZAO_SOCIAL := value;
end;

function TEntityCadastroDadosEmpresa.getResponsavel(value: string)
  : iDadosEmpresa;
begin
  result := self;
  FRESPONSAVEL := value;
end;

function TEntityCadastroDadosEmpresa.getTelefone(value: string): iDadosEmpresa;
begin
  result := self;
  FTELEFONE := value;
end;

function TEntityCadastroDadosEmpresa.getValor(value: string): iDadosEmpresa;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityCadastroDadosEmpresa.Gravar: iDadosEmpresa;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_EMPRESA_ID');

  with FQuery.TQuery do
  begin
    FieldByName('NOME_FANTASIA').AsString := FNOME_FANTASIA;
    FieldByName('RAZAO_SOCIAL').AsString := FRAZAO_SOCIAL;
    FieldByName('CNPJ').AsString := FCNPJ;;
    FieldByName('INSCRICAO_ESTADUAL').AsString := FINSCRICAO_ESTADUAL;
    FieldByName('ENDERECO').AsString := FENDERECO;
    FieldByName('BAIRRO').AsString := FBAIRRO;
    FieldByName('NUMERO').AsInteger := FNUMERO;
    FieldByName('COMPLEMENTO').AsString := FCOMPLEMENTO;
    FieldByName('CEP').AsString := FCEP;
    FieldByName('CIDADE').AsString := FCIDADE;
    FieldByName('ESTADO').AsString := FESTADO;
    FieldByName('TELEFONE').AsString := FTELEFONE;
    FieldByName('CELULAR').AsString := FCELULAR;
    FieldByName('EMAIL').AsString := FEMAIL;
    FieldByName('RESPONSAVEL').AsString := FRESPONSAVEL;
    FieldByName('OBSERVACAO').AsString := FOBSERVACAO;
  end;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_FANTASIA')
    .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
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

function TEntityCadastroDadosEmpresa.inserir: iDadosEmpresa;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo')
end;

function TEntityCadastroDadosEmpresa.listarGrid(value: TDataSource)
  : iDadosEmpresa;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'C�digo';
    FieldByName('NOME_FANTASIA').DisplayLabel := 'Nome fantasia';
    FieldByName('RAZAO_SOCIAL').DisplayLabel := 'Raz�o social';
    FieldByName('CNPJ').DisplayLabel := 'CNPJ';
    FieldByName('INSCRICAO_ESTADUAL').DisplayLabel := 'Inscri��o estadual';
    FieldByName('ENDERECO').DisplayLabel := 'Endere�o';
    FieldByName('BAIRRO').DisplayLabel := 'Bairro';
    FieldByName('NUMERO').DisplayLabel := 'N�mero';
    FieldByName('COMPLEMENTO').DisplayLabel := 'Complemento';
    FieldByName('CEP').DisplayLabel := 'CEP';
    FieldByName('CIDADE').DisplayLabel := 'Cidade';
    FieldByName('ESTADO').DisplayLabel := 'Estado';
    FieldByName('TELEFONE').DisplayLabel := 'Telefone';
    FieldByName('CELULAR').DisplayLabel := 'Ceular';
    FieldByName('EMAIL').DisplayLabel := 'E-Mail';
    FieldByName('RESPONSAVEL').DisplayLabel := 'Respons�vel';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('NOME_FANTASIA').DisplayWidth := 30;
    FieldByName('RAZAO_SOCIAL').DisplayWidth := 30;
    FieldByName('ENDERECO').DisplayWidth := 30;
    FieldByName('BAIRRO').DisplayWidth := 20;
    FieldByName('COMPLEMENTO').DisplayWidth := 20;
    FieldByName('EMAIL').DisplayWidth := 30;
    FieldByName('RESPONSAVEL').DisplayWidth := 30;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityCadastroDadosEmpresa.new: iDadosEmpresa;
begin
  result := self.create;
end;

function TEntityCadastroDadosEmpresa.nomeTabela(value: string): iDadosEmpresa;
begin
  result := self;
  FTabela := value;
end;

function TEntityCadastroDadosEmpresa.open(value: string): iDadosEmpresa;
begin
  FQuery.Query(FTabela);
end;

function TEntityCadastroDadosEmpresa.ordenarGrid(column: TColumn)
  : iDadosEmpresa;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityCadastroDadosEmpresa.pesquisar: iDadosEmpresa;
begin
  result := self;
end;

function TEntityCadastroDadosEmpresa.sqlPesquisa: iDadosEmpresa;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityCadastroDadosEmpresa.sqlPesquisaData: iDadosEmpresa;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityCadastroDadosEmpresa.sqlPesquisaEstatica: iDadosEmpresa;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityCadastroDadosEmpresa.validarData(componet: tmaskEdit);
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
