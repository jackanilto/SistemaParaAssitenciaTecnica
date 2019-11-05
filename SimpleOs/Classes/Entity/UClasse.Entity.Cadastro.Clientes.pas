unit UClasse.Entity.Cadastro.Clientes;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Imaging.jpeg;

type

  TEntityCadastroClientes = class(TInterfacedObject, iCadastroClientes)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FID: integer;
    FNOME: string;
    FTIPO_CADASTRO: string;
    FDATA_NASCIMENTO: string;
    FDATA_CADASTRO: string;
    FCPF_CNPJ: string;
    FDOCUMENTO: string;
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
    FSITUACAO_CLIENTE: string;
    F_FOTO: TJPEGImage;
    FOBSERVACAO: string;
    function getCodigo(value: integer): iCadastroClientes;
    function pesquisar: iCadastroClientes;

  public

    function nomeTabela(value: string): iCadastroClientes;
    function getCampo(value: string): iCadastroClientes;
    function getValor(value: string): iCadastroClientes;
    function getDataInicial(value: TDate): iCadastroClientes;
    function getDataFinal(value: TDate): iCadastroClientes;
    function open(value: string): iCadastroClientes;
    function ExecSql: iCadastroClientes;
    function sqlPesquisa: iCadastroClientes;
    function sqlPesquisaData: iCadastroClientes;
    function sqlPesquisaEstatica: iCadastroClientes;

    function abrir: iCadastroClientes;
    function inserir: iCadastroClientes;
    function Gravar: iCadastroClientes;
    function deletar: iCadastroClientes;
    function atualizar: iCadastroClientes;
    function editar: iCadastroClientes;
    function cancelar: iCadastroClientes;
    function fecharQuery: iCadastroClientes;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroClientes;
    function ordenarGrid(column: TColumn): iCadastroClientes;

    function getID(value: integer): iCadastroClientes;
    function getNOME(value: string): iCadastroClientes;
    function getTIPO_CADASTRO(value: string): iCadastroClientes;
    function getDATA_NASCIMENTO(value: string): iCadastroClientes;
    function getDATA_CADASTRO(value: string): iCadastroClientes;
    function getCPF_CNPJ(value: string): iCadastroClientes;
    function getDOCUMENTO(value: string): iCadastroClientes;
    function getENDERECO(value: string): iCadastroClientes;
    function getBAIRRO(value: string): iCadastroClientes;
    function getNUMERO(value: integer): iCadastroClientes;
    function getCOMPLEMENTO(value: string): iCadastroClientes;
    function getCEP(value: string): iCadastroClientes;
    function getCIDADE(value: string): iCadastroClientes;
    function getESTADO(value: string): iCadastroClientes;
    function getTELEFONE(value: string): iCadastroClientes;
    function getCELULAR(value: string): iCadastroClientes;
    function getEmail(value: string): iCadastroClientes;
    function getFUNCIONARIO_CADASTRO(value: integer): iCadastroClientes;
    function getSITUACAO_CLIENTE(value: string): iCadastroClientes;
    function getFOTO(value: TJPEGImage): iCadastroClientes;
    function getOBSERVACAO(value: string): iCadastroClientes;

    constructor create;
    destructor destroy; override;
    class function new: iCadastroClientes;
  end;

implementation

{ TEntityCadastroClientes }

function TEntityCadastroClientes.abrir: iCadastroClientes;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityCadastroClientes.atualizar: iCadastroClientes;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityCadastroClientes.cancelar: iCadastroClientes;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityCadastroClientes.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityCadastroClientes.create;
begin
  FTabela := 'CLIENTES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro de clientes').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityCadastroClientes.deletar: iCadastroClientes;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME').AsString)
        .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityCadastroClientes.destroy;
begin

  inherited;
end;

function TEntityCadastroClientes.editar: iCadastroClientes;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME').AsString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntityCadastroClientes.ExecSql: iCadastroClientes;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityCadastroClientes.fecharQuery: iCadastroClientes;
begin
  FQuery.TQuery.close;
end;

function TEntityCadastroClientes.getBAIRRO(value: string): iCadastroClientes;
begin
  result := self;
  FBAIRRO := value;
end;

function TEntityCadastroClientes.getCampo(value: string): iCadastroClientes;
begin
  result := self;
  FCampo := value;
end;

function TEntityCadastroClientes.getCELULAR(value: string): iCadastroClientes;
begin
  result := self;
  FCELULAR := value;
end;

function TEntityCadastroClientes.getCEP(value: string): iCadastroClientes;
begin
  result := self;
  FCEP := value;
end;

function TEntityCadastroClientes.getCIDADE(value: string): iCadastroClientes;
begin
  result := self;
  FCIDADE := value;
end;

function TEntityCadastroClientes.getCodigo(value: integer): iCadastroClientes;
begin
  result := self;
  FCodigo := value;
end;

function TEntityCadastroClientes.getCOMPLEMENTO(value: string)
  : iCadastroClientes;
begin
  result := self;
  FCOMPLEMENTO := value;
end;

function TEntityCadastroClientes.getCPF_CNPJ(value: string): iCadastroClientes;
begin

  result := self;
  FCPF_CNPJ := value;

end;

function TEntityCadastroClientes.getDataFinal(value: TDate): iCadastroClientes;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityCadastroClientes.getDataInicial(value: TDate)
  : iCadastroClientes;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityCadastroClientes.getDATA_CADASTRO(value: string)
  : iCadastroClientes;
begin
  result := self;
  if value = '  /  /    ' then
    FDATA_CADASTRO := ''
  else
    FDATA_CADASTRO := value;
end;

function TEntityCadastroClientes.getDATA_NASCIMENTO(value: string)
  : iCadastroClientes;
begin
  result := self;
  if value = '  /  /    ' then
    FDATA_NASCIMENTO := ''
  else
    FDATA_NASCIMENTO := value;
end;

function TEntityCadastroClientes.getDOCUMENTO(value: string): iCadastroClientes;
begin
  result := self;
  FDOCUMENTO := value;
end;

function TEntityCadastroClientes.getEmail(value: string): iCadastroClientes;
begin
  result := self;
  FEMAIL := value;
end;

function TEntityCadastroClientes.getENDERECO(value: string): iCadastroClientes;
begin
  result := self;
  FENDERECO := value;
end;

function TEntityCadastroClientes.getESTADO(value: string): iCadastroClientes;
begin
  result := self;
  FESTADO := value;
end;

function TEntityCadastroClientes.getFOTO(value: TJPEGImage): iCadastroClientes;
begin
  result := self;
  F_FOTO := value;
end;

function TEntityCadastroClientes.getFUNCIONARIO_CADASTRO(value: integer)
  : iCadastroClientes;
begin
  result := self;
  F_FUNCIONARIO_CADASTRO := value;
end;

function TEntityCadastroClientes.getID(value: integer): iCadastroClientes;
begin
  result := self;
  FID := value;
end;

function TEntityCadastroClientes.getNOME(value: string): iCadastroClientes;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe um nome para o cliente.');
  FNOME := value;
end;

function TEntityCadastroClientes.getNUMERO(value: integer): iCadastroClientes;
begin
  result := self;
  FNUMERO := value;
end;

function TEntityCadastroClientes.getOBSERVACAO(value: string)
  : iCadastroClientes;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityCadastroClientes.getSITUACAO_CLIENTE(value: string)
  : iCadastroClientes;
begin
  result := self;
  FSITUACAO_CLIENTE := value;
end;

function TEntityCadastroClientes.getTELEFONE(value: string): iCadastroClientes;
begin
  result := self;
  FTELEFONE := value;
end;

function TEntityCadastroClientes.getTIPO_CADASTRO(value: string)
  : iCadastroClientes;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe o tipo de cadastro realizado.');
  FTIPO_CADASTRO := value;
end;

function TEntityCadastroClientes.getValor(value: string): iCadastroClientes;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityCadastroClientes.Gravar: iCadastroClientes;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_CLIENTES_ID');

  FQuery.TQuery.FieldByName('NOME').AsString := FNOME;
  FQuery.TQuery.FieldByName('TIPO_CADASTRO').AsString := FTIPO_CADASTRO;
  FQuery.TQuery.FieldByName('CPF_CNPJ').AsString := FCPF_CNPJ;
  FQuery.TQuery.FieldByName('DOCUMENTO').AsString := FDOCUMENTO;
  FQuery.TQuery.FieldByName('ENDERECO').AsString := FENDERECO;
  FQuery.TQuery.FieldByName('BAIRRO').AsString := FBAIRRO;
  FQuery.TQuery.FieldByName('NUMERO').AsInteger := FNUMERO;;
  FQuery.TQuery.FieldByName('COMPLEMENTO').AsString := FCOMPLEMENTO;
  FQuery.TQuery.FieldByName('CEP').AsString := FCEP;
  FQuery.TQuery.FieldByName('CIDADE').AsString := FCIDADE;
  FQuery.TQuery.FieldByName('ESTADO').AsString := FESTADO;
  FQuery.TQuery.FieldByName('TELEFONE').AsString := FTELEFONE;
  FQuery.TQuery.FieldByName('CELULAR').AsString := FCELULAR;
  FQuery.TQuery.FieldByName('EMAIL').AsString := FEMAIL;
  FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').AsInteger :=
    funcionarioLogado;
  FQuery.TQuery.FieldByName('SITUACAO_CLIENTE').AsString := FSITUACAO_CLIENTE;
  FQuery.TQuery.FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

  if FDATA_NASCIMENTO <> EmptyStr then
    FQuery.TQuery.FieldByName('DATA_NASCIMENTO').AsDateTime :=
      strtodate(FDATA_NASCIMENTO);

  if FDATA_CADASTRO <> EmptyStr then
    FQuery.TQuery.FieldByName('DATA_CADASTRO').AsDateTime :=
      strtodate(FDATA_CADASTRO);

  if Assigned(F_FOTO) then
    FQuery.TQuery.FieldByName('FOTO').Assign(F_FOTO);

  try
    FQuery.TQuery.Post;
  except
    on e: Exception do
    begin
      raise Exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityCadastroClientes.inserir: iCadastroClientes;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityCadastroClientes.listarGrid(value: TDataSource)
  : iCadastroClientes;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('NOME').DisplayLabel := 'Nome';
  FQuery.TQuery.FieldByName('TIPO_CADASTRO').DisplayLabel := 'Tipo de cadastro';
  FQuery.TQuery.FieldByName('DATA_NASCIMENTO').DisplayLabel :=
    'Data de nascimeto';
  FQuery.TQuery.FieldByName('DATA_CADASTRO').DisplayLabel := 'Data de cadastro';
  FQuery.TQuery.FieldByName('CPF_CNPJ').DisplayLabel := 'CPF ou CNPJ';
  FQuery.TQuery.FieldByName('DOCUMENTO').DisplayLabel := 'Documento';
  FQuery.TQuery.FieldByName('ENDERECO').DisplayLabel := 'Endere�o';
  FQuery.TQuery.FieldByName('BAIRRO').DisplayLabel := 'Bairro';
  FQuery.TQuery.FieldByName('NUMERO').DisplayLabel := 'N�mero';
  FQuery.TQuery.FieldByName('COMPLEMENTO').DisplayLabel := 'Complemento';
  FQuery.TQuery.FieldByName('CEP').DisplayLabel := 'CEP';
  FQuery.TQuery.FieldByName('CIDADE').DisplayLabel := 'Cidade';
  FQuery.TQuery.FieldByName('ESTADO').DisplayLabel := 'Estado';
  FQuery.TQuery.FieldByName('TELEFONE').DisplayLabel := 'Telefone';
  FQuery.TQuery.FieldByName('CELULAR').DisplayLabel := 'Celular';
  FQuery.TQuery.FieldByName('EMAIL').DisplayLabel := 'E-Mail';
  FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').DisplayLabel :=
    'Funcion�rio';
  FQuery.TQuery.FieldByName('SITUACAO_CLIENTE').DisplayLabel :=
    'Situa��o do cliente';
  FQuery.TQuery.FieldByName('FOTO').Visible := false;
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

  FQuery.TQuery.FieldByName('NOME').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('ENDERECO').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('BAIRRO').DisplayWidth := 20;
  FQuery.TQuery.FieldByName('COMPLEMENTO').DisplayWidth := 20;
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayWidth := 30;
  FQuery.TQuery.FieldByName('EMAIL').DisplayWidth := 30;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityCadastroClientes.new: iCadastroClientes;
begin
  result := self.create;
end;

function TEntityCadastroClientes.nomeTabela(value: string): iCadastroClientes;
begin
  result := self;
  FTabela := value;
end;

function TEntityCadastroClientes.open(value: string): iCadastroClientes;
begin
  FQuery.Query(FTabela);
end;

function TEntityCadastroClientes.ordenarGrid(column: TColumn)
  : iCadastroClientes;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityCadastroClientes.pesquisar: iCadastroClientes;
begin
  result := self;
end;

function TEntityCadastroClientes.sqlPesquisa: iCadastroClientes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityCadastroClientes.sqlPesquisaData: iCadastroClientes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityCadastroClientes.sqlPesquisaEstatica: iCadastroClientes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
