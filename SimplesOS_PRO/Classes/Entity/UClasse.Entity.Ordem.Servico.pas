unit UClasse.Entity.Ordem.Servico;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls;

type

  TEntityOrdemServico = class(TInterfacedObject, iOrdemServico)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_CLIENTE: integer;
    FEQUIPAMENTO: string;
    FDEFEITO_RELATADO: string;
    FMARCA: string;
    FMODELO: string;
    FNUMERO_SERIE: string;
    FDATA_FABRICACAO: string;
    FLAUDO_DO_TECNICO: string;
    FSOLUCAO_DO_PROBLEMA: string;
    FVALOR_DA_ORDEM: Currency;
    FDESCONTO: Currency;
    FACRESCIMO: Currency;
    FTOTAL_ORCAMENTO: Currency;
    FID_FUNCIONARIO: integer;
    FNOME_FUNCIONARIO: string;
    FRETORNO: string;
    FDATA_RETORNO: string;
    FSITUACAO_DA_ORDEM: string;
    FFORMA_PAGAMENTO: string;
    FPARCELADO: string;
    FTOTAL_PARCELAS: integer;
    FPGTO: string;
    FPRIORIDADE: string;
    FDATA_ENTRADA: string;
    FDATA_FINALIZACAO: string;
    FDATA_PAGAMENTO: string;
    FOBSERVACAO: string;
    FSTATUS: string;
    FID_TECNICO_RESPONSAVEL: integer;
    FTECNICO_RESPONSAVEL: string;

    FCodigo: integer;
    FNome: string;

    function getCodigo(value: integer): iOrdemServico;
    function getNome(value: string): iOrdemServico;
    procedure validarData(componet: tmaskEdit);

  public

    function nomeTabela(value: string): iOrdemServico;
    function getCampo(value: string): iOrdemServico;
    function getValor(value: string): iOrdemServico;
    function getDataInicial(value: TDate): iOrdemServico;
    function getDataFinal(value: TDate): iOrdemServico;
    function open(value: string): iOrdemServico;
    function pesquisar: iOrdemServico;
    function ExecSql: iOrdemServico;
    function sqlPesquisa: iOrdemServico;
    function sqlPesquisaData: iOrdemServico;
    function sqlPesquisaEstatica: iOrdemServico;

    function abrir: iOrdemServico;
    function inserir: iOrdemServico;
    function Gravar: iOrdemServico;
    function deletar: iOrdemServico;
    function atualizar: iOrdemServico;
    function editar: iOrdemServico;
    function cancelar: iOrdemServico;
    function fecharQuery: iOrdemServico;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iOrdemServico;
    function ordenarGrid(column: TColumn): iOrdemServico;
    function estornarOrdem(value: integer): iOrdemServico;

    function getID(value: integer): iOrdemServico;
    function getID_CLIENTE(value: string): iOrdemServico;
    function getEQUIPAMENTO(value: string): iOrdemServico;
    function getDEFEITO_RELATADO(value: string): iOrdemServico;
    function getMARCA(value: string): iOrdemServico;
    function getMODELO(value: string): iOrdemServico;
    function getNUMERO_SERIE(value: string): iOrdemServico;
    function getDATA_FABRICACAO(value: string): iOrdemServico;
    function getLAUDO_DO_TECNICO(value: string): iOrdemServico;
    function getSOLUCAO_DO_PROBLEMA(value: string): iOrdemServico;
    function getVALOR_DA_ORDEM(value: string): iOrdemServico;
    function getDESCONTO(value: string): iOrdemServico;
    function getACRESCIMO(value: string): iOrdemServico;
    function getTotalDoOrcamento(value: string): iOrdemServico;
    function getID_FUNCIONARIO(value: integer): iOrdemServico;
    function getNOME_FUNCIONARIO(value: string): iOrdemServico;
    function getRETORNO(value: string): iOrdemServico;
    function getDATA_RETORNO(value: string): iOrdemServico;
    function getSITUACAO_DA_ORDEM(value: string): iOrdemServico;
    function getFORMA_PAGAMENTO(value: string): iOrdemServico;
    function getPARCELADO(value: string): iOrdemServico;
    function getTOTAL_PARCELAS(value: string): iOrdemServico;
    function getPGTO(value: string): iOrdemServico;
    function getPRIORIDADE(value: string): iOrdemServico;
    function getDataCadastro(value: string): iOrdemServico;
    function getDataFinalizacao(value: string): iOrdemServico;
    function getDataPagamento(value: string): iOrdemServico;
    function getOBSERVACAO(value: string): iOrdemServico;
    function getSTATUS(value: string): iOrdemServico;
    function getIdTecnico(value: string): iOrdemServico;
    function getTecnico(value: string): iOrdemServico;

    function calcularDesconto(valor, desconto: TEdit): string;
    function calcularAcrescimo(valor, desconto, acrescimo: TEdit): string;

    function exportar: iOrdemServico;

    constructor create;
    destructor destroy; override;
    class function new: iOrdemServico;
  end;

implementation

{ TEntityOrdemServico }

function TEntityOrdemServico.abrir: iOrdemServico;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityOrdemServico.atualizar: iOrdemServico;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityOrdemServico.calcularAcrescimo(valor, desconto,
  acrescimo: TEdit): string;
var
  FValorOrdem: Currency;
  FDescontoOrdem: Currency;
  FAcrescimoOrdem: Currency;
begin

  try
    FValorOrdem := StrToCurr(valor.Text);
  except
    on e: exception do
      raise exception.create('Informe um valor v�lido para a ordem.');
  end;

  try
    FDescontoOrdem := StrToCurr(desconto.Text);
  except
    on e: exception do
      raise exception.create
        ('Informe um valor igual ou maior que zero para o campo Desconto.')
  end;

  try
    FAcrescimoOrdem := StrToCurr(acrescimo.Text);
  except
    on e: exception do
      raise exception.create
        ('Informe um valor igual ou maior que zero para o campo Acr�scimo');

  end;

  if ((valor.Text <> '0') and (acrescimo.Text <> '0')) then
  begin
    result := CurrToStr(FAcrescimoOrdem + (FValorOrdem - FDescontoOrdem));
  end
  else
    result := valor.Text;

end;

function TEntityOrdemServico.calcularDesconto(valor, desconto: TEdit): string;
var
  FValorOrdem: Currency;
  FDescontoOrdem: Currency;
begin

  try
    FValorOrdem := StrToCurr(valor.Text);
  except
    on e: exception do
    begin
      valor.Text := '0';
      valor.SetFocus;
      raise exception.create('Informe um valor para o campo Valor da Ordem.');
    end;
  end;

  try
    FDescontoOrdem := StrToCurr(desconto.Text);
  except
    on e: exception do
    begin
      desconto.Text := '0';
      raise exception.create
        ('Informe um valor igual ou maior que zero para o campo Acr�scimo.')
    end;
  end;

  if ((valor.Text <> '0') and (desconto.Text <> '0')) then
  begin
    result := CurrToStr(FValorOrdem - FDescontoOrdem);
  end
  else
    result := valor.Text;

end;

function TEntityOrdemServico.cancelar: iOrdemServico;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityOrdemServico.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityOrdemServico.create;
begin
  FTabela := 'ORDEM_SERVICO';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Ordem de servi�o').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityOrdemServico.getDataFinalizacao(value: string): iOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_FINALIZACAO := ''
  else
    FDATA_FINALIZACAO := value;
end;

function TEntityOrdemServico.getDataPagamento(value: string): iOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_PAGAMENTO := ''
  else
    FDATA_PAGAMENTO := value;
end;

function TEntityOrdemServico.deletar: iOrdemServico;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('EQUIPAMENTO')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityOrdemServico.destroy;
begin

  inherited;
end;

function TEntityOrdemServico.editar: iOrdemServico;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('EQUIPAMENTO')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
      .gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntityOrdemServico.estornarOrdem(value: integer): iOrdemServico;
begin
  result := self;

  FQuery.getCampo('ID').getValor(value.ToString).sqlPesquisa(FTabela);

  if FQuery.TQuery.RecordCount >= 1 then
  begin

    if FQuery.TQuery.FieldByName('PGTO').AsString <> 'Estornada' then
    begin
      if application.MessageBox
        ('Deseja realmente estornar esta ordem de servi�o?',
        'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = mryes then
      begin
        FQuery.TQuery.Edit;
        FQuery.TQuery.FieldByName('PGTO').AsString := 'Estornada';
        FQuery.TQuery.Post;
      end;
    end
    else
    raise Exception.Create('Esta ordem j� foi estornada.');
  end;
end;

function TEntityOrdemServico.ExecSql: iOrdemServico;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityOrdemServico.exportar: iOrdemServico;
begin
  result := self;
end;

function TEntityOrdemServico.fecharQuery: iOrdemServico;
begin
  FQuery.TQuery.close;
end;

function TEntityOrdemServico.getACRESCIMO(value: string): iOrdemServico;
begin
  result := self;
  try
    FACRESCIMO := StrToCurr(value);
  except
    on e: exception do
      raise exception.create('Informe um valor v�lido para o acr�scimo.');
  end;
end;

function TEntityOrdemServico.getCampo(value: string): iOrdemServico;
begin
  result := self;
  FCampo := value;
end;

function TEntityOrdemServico.getCodigo(value: integer): iOrdemServico;
begin
  result := self;
  FCodigo := value;
end;

function TEntityOrdemServico.getDataCadastro(value: string): iOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_ENTRADA := ''
  else
    FDATA_ENTRADA := value;
end;

function TEntityOrdemServico.getDataFinal(value: TDate): iOrdemServico;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityOrdemServico.getDataInicial(value: TDate): iOrdemServico;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityOrdemServico.getDATA_FABRICACAO(value: string): iOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_FABRICACAO := ''
  else
    FDATA_FABRICACAO := value;
end;

function TEntityOrdemServico.getDATA_RETORNO(value: string): iOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_RETORNO := ''
  else
    FDATA_RETORNO := value;
end;

function TEntityOrdemServico.getDEFEITO_RELATADO(value: string): iOrdemServico;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Informe o defeito do equipamento.');
  FDEFEITO_RELATADO := value;
end;

function TEntityOrdemServico.getDESCONTO(value: string): iOrdemServico;
begin
  result := self;
  try
    FDESCONTO := StrToCurr(value);
  except
    on e: exception do
      raise exception.create('Informe um valor v�lido para o Desconto');
  end;
end;

function TEntityOrdemServico.getEQUIPAMENTO(value: string): iOrdemServico;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Informe qual equipamento esta sendo cadastrado.');
  FEQUIPAMENTO := value;
end;

function TEntityOrdemServico.getFORMA_PAGAMENTO(value: string): iOrdemServico;
begin
  result := self;
  FFORMA_PAGAMENTO := value;
end;

function TEntityOrdemServico.getID(value: integer): iOrdemServico;
begin
  result := self;
end;

function TEntityOrdemServico.getIdTecnico(value: string): iOrdemServico;
begin
  result := self;
  if value <> EmptyStr then
    FID_TECNICO_RESPONSAVEL := value.ToInteger;
end;

function TEntityOrdemServico.getID_CLIENTE(value: string): iOrdemServico;
begin
  result := self;
  if value = '0' then
    raise exception.create('Informe o c�digo do cliente.');
  FID_CLIENTE := value.ToInteger;

end;

function TEntityOrdemServico.getID_FUNCIONARIO(value: integer): iOrdemServico;
begin
  result := self;
  FID_FUNCIONARIO := value;
end;

function TEntityOrdemServico.getLAUDO_DO_TECNICO(value: string): iOrdemServico;
begin
  result := self;
  FLAUDO_DO_TECNICO := value;
end;

function TEntityOrdemServico.getMARCA(value: string): iOrdemServico;
begin
  result := self;
  FMARCA := value;
end;

function TEntityOrdemServico.getMODELO(value: string): iOrdemServico;
begin
  result := self;
  FMODELO := value;
end;

function TEntityOrdemServico.getNome(value: string): iOrdemServico;
begin
  result := self;
  FNome := value;
end;

function TEntityOrdemServico.getNOME_FUNCIONARIO(value: string): iOrdemServico;
begin
  result := self;
  FNOME_FUNCIONARIO := value;
end;

function TEntityOrdemServico.getNUMERO_SERIE(value: string): iOrdemServico;
begin
  result := self;
  FNUMERO_SERIE := value;
end;

function TEntityOrdemServico.getOBSERVACAO(value: string): iOrdemServico;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityOrdemServico.getPARCELADO(value: string): iOrdemServico;
begin
  result := self;
  FPARCELADO := value;
end;

function TEntityOrdemServico.getPGTO(value: string): iOrdemServico;
begin
  result := self;
  if value = EmptyStr then
    FPGTO := 'N�o'
  else
    FPGTO := value;
end;

function TEntityOrdemServico.getPRIORIDADE(value: string): iOrdemServico;
begin
  result := self;
  FPRIORIDADE := value;
end;

function TEntityOrdemServico.getRETORNO(value: string): iOrdemServico;
begin
  result := self;
  FRETORNO := value;
end;

function TEntityOrdemServico.getSITUACAO_DA_ORDEM(value: string): iOrdemServico;
begin
  result := self;
  FSITUACAO_DA_ORDEM := value;
end;

function TEntityOrdemServico.getSOLUCAO_DO_PROBLEMA(value: string)
  : iOrdemServico;
begin
  result := self;
  FSOLUCAO_DO_PROBLEMA := value;
end;

function TEntityOrdemServico.getSTATUS(value: string): iOrdemServico;
begin
  result := self;
  FSTATUS := value;
end;

function TEntityOrdemServico.getTecnico(value: string): iOrdemServico;
begin
  result := self;
  FTECNICO_RESPONSAVEL := value;
end;

function TEntityOrdemServico.getTotalDoOrcamento(value: string): iOrdemServico;
begin
  result := self;
  try
    FTOTAL_ORCAMENTO := StrToCurr(value);
  except
    on e: exception do
      raise exception.create('Informe um valor v�lido para o Total da Ordem');
  end;
end;

function TEntityOrdemServico.getTOTAL_PARCELAS(value: string): iOrdemServico;
begin
  result := self;

  if value = EmptyStr then
    FTOTAL_PARCELAS := 0
  else
    FTOTAL_PARCELAS := value.ToInteger;

end;

function TEntityOrdemServico.getValor(value: string): iOrdemServico;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityOrdemServico.getVALOR_DA_ORDEM(value: string): iOrdemServico;
begin
  result := self;
  try
    FVALOR_DA_ORDEM := StrToCurr(value);
  except
    on e: exception do
      raise exception.create
        ('Informe um valor v�lido para o campo Valor da Ordem.');
  end;
end;

function TEntityOrdemServico.Gravar: iOrdemServico;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_ORDEM_SERVICO_ID');

  with FQuery.TQuery do
  begin
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('EQUIPAMENTO').AsString := FEQUIPAMENTO;
    FieldByName('DEFEITO_RELATADO').AsString := FDEFEITO_RELATADO;
    FieldByName('MARCA').AsString := FMARCA;
    FieldByName('MODELO').AsString := FMODELO;
    FieldByName('NUMERO_SERIE').AsString := FNUMERO_SERIE;
    FieldByName('LAUDO_DO_TECNICO').AsString := FLAUDO_DO_TECNICO;
    FieldByName('SOLUCAO_DO_PROBLEMA').AsString := FSOLUCAO_DO_PROBLEMA;
    FieldByName('VALOR_DA_ORDEM').AsCurrency := FVALOR_DA_ORDEM;
    FieldByName('DESCONTO').AsCurrency := FDESCONTO;
    FieldByName('ACRESCIMO').AsCurrency := FACRESCIMO;
    FieldByName('TOTAL_ORCAMENTO').AsCurrency := FTOTAL_ORCAMENTO;
    FieldByName('ID_FUNCIONARIO').AsInteger := funcionarioLogado;
    FieldByName('NOME_FUNCIONARIO').AsString := nomeFuncionarioLogado;
    FieldByName('RETORNO').AsString := FRETORNO;
    FieldByName('SITUACAO_DA_ORDEM').AsString := FSITUACAO_DA_ORDEM;
    FieldByName('FORMA_PAGAMENTO').AsString := FFORMA_PAGAMENTO;
    FieldByName('PARCELADO').AsString := FPARCELADO;
    FieldByName('TOTAL_PARCELAS').AsInteger := FTOTAL_PARCELAS;
    FieldByName('PGTO').AsString := FPGTO;
    FieldByName('PRIORIDADE').AsString := FPRIORIDADE;
    FieldByName('OBSERVACAO').AsString := FOBSERVACAO;
    FieldByName('STATUS').AsString := FSTATUS;

    if FDATA_FABRICACAO <> '' then
      FieldByName('DATA_FABRICACAO').AsDateTime := StrToDate(FDATA_FABRICACAO);

    if FDATA_RETORNO <> '' then
      FieldByName('DATA_RETORNO').AsDateTime := StrToDate(FDATA_RETORNO);

    if FDATA_ENTRADA <> '' then
      FieldByName('DATA_ENTRADA').AsDateTime := StrToDate(FDATA_ENTRADA);

    if FDATA_FINALIZACAO <> '' then
      FieldByName('DATA_FINALIZACAO').AsDateTime :=
        StrToDate(FDATA_FINALIZACAO);

    if FDATA_PAGAMENTO <> '' then
      FieldByName('DATA_PAGAMENTO').AsDateTime := StrToDate(FDATA_PAGAMENTO);

    FGravarLog.getNomeRegistro(FieldByName('EQUIPAMENTO').AsString)
      .getCodigoRegistro(FieldByName('id').AsInteger).gravarLog;
  end;

  try
    FQuery.TQuery.Post;
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityOrdemServico.inserir: iOrdemServico;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityOrdemServico.listarGrid(value: TDataSource): iOrdemServico;
var
  campoVirtual: TStringField;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'C�digo';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('EQUIPAMENTO').DisplayLabel := 'Equipamento';
    FieldByName('DEFEITO_RELATADO').DisplayLabel := 'Defeito relatado';
    FieldByName('MARCA').DisplayLabel := 'Marca';
    FieldByName('MODELO').DisplayLabel := 'Modelo';
    FieldByName('NUMERO_SERIE').DisplayLabel := 'N�mero de serie';
    FieldByName('DATA_FABRICACAO').DisplayLabel := 'Fabrica��o';
    FieldByName('LAUDO_DO_TECNICO').DisplayLabel := 'Laudo t�cnico';
    FieldByName('SOLUCAO_DO_PROBLEMA').DisplayLabel := 'Solu��o do problema';
    FieldByName('VALOR_DA_ORDEM').DisplayLabel := 'Valor do reparo';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('ACRESCIMO').DisplayLabel := 'Acr�scimo';
    FieldByName('TOTAL_ORCAMENTO').DisplayLabel := 'Total do reparo';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do funcion�rio';
    FieldByName('RETORNO').DisplayLabel := 'Retorno';
    FieldByName('DATA_RETORNO').DisplayLabel := 'Data do retorno';
    FieldByName('SITUACAO_DA_ORDEM').DisplayLabel := 'situa��o da ordem';
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('PARCELADO').DisplayLabel := 'Parcelado';
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcelas';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('PRIORIDADE').DisplayLabel := 'Prioridade';
    FieldByName('DATA_ENTRADA').DisplayLabel := 'Data de entrada';
    FieldByName('DATA_FINALIZACAO').DisplayLabel := 'DAta de finalia��o';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Data de pagamento';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';
    FieldByName('STATUS').DisplayLabel := 'Status';

    FieldByName('EQUIPAMENTO').DisplayWidth := 40;
    FieldByName('DEFEITO_RELATADO').DisplayWidth := 40;
    FieldByName('MARCA').DisplayWidth := 30;
    FieldByName('MODELO').DisplayWidth := 30;
    FieldByName('NUMERO_SERIE').DisplayWidth := 30;
    FieldByName('LAUDO_DO_TECNICO').DisplayWidth := 40;
    FieldByName('SOLUCAO_DO_PROBLEMA').DisplayWidth := 40;
    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 30;
    FieldByName('RETORNO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityOrdemServico.new: iOrdemServico;
begin
  result := self.create;
end;

function TEntityOrdemServico.nomeTabela(value: string): iOrdemServico;
begin
  result := self;
  FTabela := value;
end;

function TEntityOrdemServico.open(value: string): iOrdemServico;
begin
  FQuery.Query(FTabela);
end;

function TEntityOrdemServico.ordenarGrid(column: TColumn): iOrdemServico;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityOrdemServico.pesquisar: iOrdemServico;
begin
  result := self;
end;

function TEntityOrdemServico.sqlPesquisa: iOrdemServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityOrdemServico.sqlPesquisaData: iOrdemServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityOrdemServico.sqlPesquisaEstatica: iOrdemServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityOrdemServico.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := StrToDate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
