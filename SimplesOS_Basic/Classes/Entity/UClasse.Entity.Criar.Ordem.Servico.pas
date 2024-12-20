unit UClasse.Entity.Criar.Ordem.Servico;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls, UClasse.Entity.Criar.Ordem.Parcelas, UClasse.Entity.Estornar.OS,
  RxToolEdit, RxCurrEdit;

type

  TEntityCriarOrdemServico = class(TInterfacedObject, iCriarOrdemServico)
  private

    FQuery: iConexaoQuery;
    FQueryParcelas: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FEstornarOS: iEstornarOS;
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
    FTOTAL_PARCELAS: integer;
    FVALOR_DA_PARCELA: Currency;
    FPGTO: string;
    FPRIORIDADE: string;
    FDATA_ENTRADA: string;
    FDATA_FINALIZACAO: string;
    FHORA_FINALIZACAO: string;
    FDATA_BASE_VENCIMENTO: string;
    FOBSERVACAO: string;
    FSTATUS: string;
    FID_TECNICO_RESPONSAVEL: integer;
    FTECNICO_RESPONSAVEL: string;

    FCodigo: integer;
    FNome: string;

    function getCodigo(value: integer): iCriarOrdemServico;
    function getNome(value: string): iCriarOrdemServico;
    procedure validarData(componet: tmaskEdit);

    procedure estornarParcelas(value: integer);

  public

    function nomeTabela(value: string): iCriarOrdemServico;
    function getCampo(value: string): iCriarOrdemServico;
    function getValor(value: string): iCriarOrdemServico;
    function getDataInicial(value: TDate): iCriarOrdemServico;
    function getDataFinal(value: TDate): iCriarOrdemServico;
    function open(value: string): iCriarOrdemServico;
    function pesquisar: iCriarOrdemServico;
    function ExecSql: iCriarOrdemServico;
    function sqlPesquisa: iCriarOrdemServico;
    function sqlPesquisaData: iCriarOrdemServico;
    function sqlPesquisaEstatica: iCriarOrdemServico;

    function abrir: iCriarOrdemServico;
    function inserir: iCriarOrdemServico;
    function Gravar: iCriarOrdemServico;
    function deletar: iCriarOrdemServico;
    function atualizar: iCriarOrdemServico;
    function editar: iCriarOrdemServico;
    function cancelar: iCriarOrdemServico;
    function fecharQuery: iCriarOrdemServico;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCriarOrdemServico;
    function ordenarGrid(column: TColumn): iCriarOrdemServico;
    function estornarOrdem(value: integer): iCriarOrdemServico;

    function getID(value: integer): iCriarOrdemServico;
    function getID_CLIENTE(value: string): iCriarOrdemServico;
    function getEQUIPAMENTO(value: string): iCriarOrdemServico;
    function getDEFEITO_RELATADO(value: string): iCriarOrdemServico;
    function getMARCA(value: string): iCriarOrdemServico;
    function getMODELO(value: string): iCriarOrdemServico;
    function getNUMERO_SERIE(value: string): iCriarOrdemServico;
    function getDATA_FABRICACAO(value: string): iCriarOrdemServico;
    function getLAUDO_DO_TECNICO(value: string): iCriarOrdemServico;
    function getSOLUCAO_DO_PROBLEMA(value: string): iCriarOrdemServico;
    function getVALOR_DA_ORDEM(value: string): iCriarOrdemServico;
    function getDESCONTO(value: string): iCriarOrdemServico;
    function getACRESCIMO(value: string): iCriarOrdemServico;
    function getTotalDoOrcamento(value: string): iCriarOrdemServico;
    function getID_FUNCIONARIO(value: integer): iCriarOrdemServico;
    function getNOME_FUNCIONARIO(value: string): iCriarOrdemServico;
    function getRETORNO(value: string): iCriarOrdemServico;
    function getDATA_RETORNO(value: string): iCriarOrdemServico;
    function getSITUACAO_DA_ORDEM(value: string): iCriarOrdemServico;
    function getTOTAL_PARCELAS(value: string): iCriarOrdemServico;
    function getVALOR_DA_PARCELA(value: string): iCriarOrdemServico;
    function getPRIORIDADE(value: string): iCriarOrdemServico;
    function getDataCadastro(value: string): iCriarOrdemServico;
    function getDataFinalizacao(value: string): iCriarOrdemServico;
    function getHoraFinalizacao(value: string): iCriarOrdemServico;
    function getDataBaseVencimento(value: string): iCriarOrdemServico;
    function getOBSERVACAO(value: string): iCriarOrdemServico;
    function getSTATUS(value: string): iCriarOrdemServico;
    function getIdTecnico(value: string): iCriarOrdemServico;
    function getTecnico(value: string): iCriarOrdemServico;

    function setId: integer;
    function setId_Cliente: integer;
    function setTotalDeParcelas: integer;
    function setValorDaParcelas: Currency;
    function setDataBaseVencimento: TDate;

    function calcularDesconto(valor, desconto: TCurrencyEdit): string;
    function calcularAcrescimo(valor, desconto, acrescimo: TCurrencyEdit): string;
    function calularTotalPorNumeroDeParcela(total:TCurrencyEdit; qtde:TComboBox): string;
    // function calcularValorTotal():string;

    function exportar: iCriarOrdemServico;

    function estadoDaTabela: string;

    constructor create;
    destructor destroy; override;
    class function new: iCriarOrdemServico;
  end;

implementation

{ TEntityCriarOrdemServico }

function TEntityCriarOrdemServico.abrir: iCriarOrdemServico;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityCriarOrdemServico.atualizar: iCriarOrdemServico;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityCriarOrdemServico.calcularAcrescimo(valor, desconto,
  acrescimo: TCurrencyEdit): string;
var
  FValorOrdem: Currency;
  FDescontoOrdem: Currency;
  FAcrescimoOrdem: Currency;
begin

  try
    FValorOrdem := StrToCurr(valor.Text);
  except
    on e: exception do
    begin
      valor.Text := '0';
      raise exception.create('Informe um valor v�lido para a ordem.');
    end;
  end;

  try
    FDescontoOrdem := StrToCurr(desconto.Text);
  except
    on e: exception do
    begin
      desconto.Text := '0';
      raise exception.create
        ('Informe um valor igual ou maior que zero para o campo Desconto.')
    end;
  end;

  try
    FAcrescimoOrdem := StrToCurr(acrescimo.Text);
  except
    on e: exception do
    begin
      acrescimo.Text := '0';
      raise exception.create
        ('Informe um valor igual ou maior que zero para o campo Acr�scimo');
    end;

  end;

  if valor.Text <> '0' then
  begin
    result := CurrToStr((FAcrescimoOrdem + FValorOrdem) - FDescontoOrdem);
  end
  else
  begin
    result := valor.Text;
  end;

end;

function TEntityCriarOrdemServico.calcularDesconto(valor,
  desconto: TCurrencyEdit): string;
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
        ('Informe um valor igual ou maior que zero para o campo Desconto.')
    end;
  end;

  if ((valor.Text <> '0') and (desconto.Text <> '0')) then
  begin
    result := CurrToStr(FValorOrdem - FDescontoOrdem);
  end
  else
    result := valor.Text;

end;

function TEntityCriarOrdemServico.calularTotalPorNumeroDeParcela(total:TCurrencyEdit;
         qtde:TComboBox): string;
var
  valor: Currency;
  quantidade: integer;
begin

  try
    valor := StrToCurr(total.Text);
  except
    raise exception.create
      ('Informe um n�mero v�lido para o campo Total Da OS.');
  end;

  try
    quantidade := StrToInt(qtde.Text);
  except
    begin
      qtde.Text := '1';
      raise exception.create('Informe um n�mero v�lido para a quantidade.');
    end;
  end;

  if ((valor <> 0) and (quantidade <> 0)) then
  begin
    result := CurrToStr(valor / quantidade);
  end;

end;

function TEntityCriarOrdemServico.cancelar: iCriarOrdemServico;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityCriarOrdemServico.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityCriarOrdemServico.create;
begin

  FTabela := 'ORDEM_SERVICO';
  FQuery := TConexaoQuery.new.Query(FTabela);
  FQueryParcelas := TConexaoQuery.new.Query('PARCELAS_ORDEM');

  FEstornarOS := TEntityEstornarOS.new;

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Ordem de servi�o').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityCriarOrdemServico.getDataFinalizacao(value: string)
  : iCriarOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_FINALIZACAO := ''
  else
    FDATA_FINALIZACAO := value;
end;

function TEntityCriarOrdemServico.getDataBaseVencimento(value: string)
  : iCriarOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    raise exception.create('Informe a data base para o vencimento.');

  FDATA_BASE_VENCIMENTO := value;
end;

function TEntityCriarOrdemServico.deletar: iCriarOrdemServico;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('EQUIPAMENTO')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .getOperacao('deletado').gravarLog;

      FQuery.TQuery.Edit;
      FQuery.TQuery.FieldByName('STATUS').AsString := 'Deletado';
      FQuery.TQuery.Post;

    end;
  end;

end;

destructor TEntityCriarOrdemServico.destroy;
begin

  inherited;
end;

function TEntityCriarOrdemServico.editar: iCriarOrdemServico;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FQuery.TQuery.Edit;

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('EQUIPAMENTO')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
      .getOperacao('deletado');

  end;
end;

function TEntityCriarOrdemServico.estadoDaTabela: string;
begin
  if FQuery.TQuery.State in [dsInsert] then
    result := 'insert'
  else if FQuery.TQuery.State in [dsEdit] then
    result := 'edit'
  else
    result := '';
end;

function TEntityCriarOrdemServico.estornarOrdem(value: integer)
  : iCriarOrdemServico;
  var
  FMotivo:String;
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

        FMotivo := InputBox('Informe o motivo do estorno', 'Motivo do estorno', '');

        if FMotivo = EmptyStr then
          raise Exception.Create('OPERA��O DE ESTORNO CANCELADA!');


        FQuery.TQuery.Edit;
        FQuery.TQuery.FieldByName('PGTO').AsString := 'Estornada';
        FQuery.TQuery.Post;

        estornarParcelas(FQuery.TQuery.FieldByName('ID').AsInteger);

        FEstornarOS
                  .getID_ORDEM(FQuery.TQuery.FieldByName('ID').AsInteger)
                  .getID_CLIENTE(FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger)
                  .getVALOR_OS(FQuery.TQuery.FieldByName('VALOR_DA_ORDEM').AsCurrency)
                  .getDATA(datetostr(date))
                  .getHORA(TimeToStr(time))
                  .getMOTIVO(FMotivo)
                  .inserir
                  .Gravar;

        FGravarLog
                .getNomeRegistro(FQuery.TQuery.FieldByName('EQUIPAMENTO').AsString)
                .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
                .getOperacao('estornado')
                .gravarLog;

      end;
    end
    else
      raise exception.create('Esta ordem j� foi estornada.');
  end;
end;

procedure TEntityCriarOrdemServico.estornarParcelas(value: integer);
begin

  FQueryParcelas.getCampo('ID_ORDEM').getValor(value.ToString)
    .sqlPesquisa('PARCELAS_ORDEM');

  if FQueryParcelas.TQuery.RecordCount >= 1 then
  begin

    FQueryParcelas.TQuery.First;

    while not FQueryParcelas.TQuery.Eof do
    begin

      FQueryParcelas.TQuery.Edit;
      FQueryParcelas.TQuery.FieldByName('PGTO').AsString := 'Estornada';
      FQueryParcelas.TQuery.FieldByName('DATA_ESTORNO').AsDateTime := date;
      FQueryParcelas.TQuery.Post;

      FQueryParcelas.TQuery.Next;

    end;

  end;

end;

function TEntityCriarOrdemServico.ExecSql: iCriarOrdemServico;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityCriarOrdemServico.exportar: iCriarOrdemServico;
begin
  result := self;
end;

function TEntityCriarOrdemServico.fecharQuery: iCriarOrdemServico;
begin
  FQuery.TQuery.Close;
end;

function TEntityCriarOrdemServico.getACRESCIMO(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  try
    FACRESCIMO := StrToCurr(value);
  except
    on e: exception do
      FACRESCIMO := 0;
  end;
end;

function TEntityCriarOrdemServico.getCampo(value: string): iCriarOrdemServico;
begin
  result := self;
  FCampo := value;
end;

function TEntityCriarOrdemServico.getCodigo(value: integer): iCriarOrdemServico;
begin
  result := self;
  FCodigo := value;
end;

function TEntityCriarOrdemServico.getDataCadastro(value: string)
  : iCriarOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_ENTRADA := ''
  else
    FDATA_ENTRADA := value;
end;

function TEntityCriarOrdemServico.getDataFinal(value: TDate)
  : iCriarOrdemServico;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityCriarOrdemServico.getDataInicial(value: TDate)
  : iCriarOrdemServico;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityCriarOrdemServico.getDATA_FABRICACAO(value: string)
  : iCriarOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_FABRICACAO := ''
  else
    FDATA_FABRICACAO := value;
end;

function TEntityCriarOrdemServico.getDATA_RETORNO(value: string)
  : iCriarOrdemServico;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_RETORNO := ''
  else
    FDATA_RETORNO := value;
end;

function TEntityCriarOrdemServico.getDEFEITO_RELATADO(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Informe o defeito do equipamento.');
  FDEFEITO_RELATADO := value;
end;

function TEntityCriarOrdemServico.getDESCONTO(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  try
    FDESCONTO := StrToCurr(value);
  except
    on e: exception do
      FDESCONTO := 0;
  end;
end;

function TEntityCriarOrdemServico.getEQUIPAMENTO(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Informe qual equipamento esta sendo cadastrado.');
  FEQUIPAMENTO := value;
end;

function TEntityCriarOrdemServico.getHoraFinalizacao(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  FHORA_FINALIZACAO := value;
end;

function TEntityCriarOrdemServico.getID(value: integer): iCriarOrdemServico;
begin
  result := self;
end;

function TEntityCriarOrdemServico.getIdTecnico(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  if value <> EmptyStr then
    FID_TECNICO_RESPONSAVEL := value.ToInteger;
end;

function TEntityCriarOrdemServico.getID_CLIENTE(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  if value = '0' then
    raise exception.create('Informe o c�digo do cliente.');

  if value = EmptyStr then
    raise exception.create('Informe o c�digo do cliente.');

  FID_CLIENTE := value.ToInteger;

end;

function TEntityCriarOrdemServico.getID_FUNCIONARIO(value: integer)
  : iCriarOrdemServico;
begin
  result := self;
  FID_FUNCIONARIO := value;
end;

function TEntityCriarOrdemServico.getLAUDO_DO_TECNICO(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  FLAUDO_DO_TECNICO := value;
end;

function TEntityCriarOrdemServico.getMARCA(value: string): iCriarOrdemServico;
begin
  result := self;
  FMARCA := value;
end;

function TEntityCriarOrdemServico.getMODELO(value: string): iCriarOrdemServico;
begin
  result := self;
  FMODELO := value;
end;

function TEntityCriarOrdemServico.getNome(value: string): iCriarOrdemServico;
begin
  result := self;
  FNome := value;
end;

function TEntityCriarOrdemServico.getNOME_FUNCIONARIO(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  FNOME_FUNCIONARIO := value;
end;

function TEntityCriarOrdemServico.getNUMERO_SERIE(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  FNUMERO_SERIE := value;
end;

function TEntityCriarOrdemServico.getOBSERVACAO(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityCriarOrdemServico.getPRIORIDADE(value: string)
  : iCriarOrdemServico;
begin
  result := self;

  if value = EmptyStr then
    FPRIORIDADE := 'N�o'
  else
    FPRIORIDADE := value;

end;

function TEntityCriarOrdemServico.getRETORNO(value: string): iCriarOrdemServico;
begin
  result := self;
  FRETORNO := value;
end;

function TEntityCriarOrdemServico.getSITUACAO_DA_ORDEM(value: string)
  : iCriarOrdemServico;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.Create('ERRO! Informe a situa��o da Ordem de Servi�o');

  FSITUACAO_DA_ORDEM := value;

end;

function TEntityCriarOrdemServico.getSOLUCAO_DO_PROBLEMA(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  FSOLUCAO_DO_PROBLEMA := value;
end;

function TEntityCriarOrdemServico.getSTATUS(value: string): iCriarOrdemServico;
begin
  result := self;
  FSTATUS := value;
end;

function TEntityCriarOrdemServico.getTecnico(value: string): iCriarOrdemServico;
begin
  result := self;
  FTECNICO_RESPONSAVEL := value;
end;

function TEntityCriarOrdemServico.getTotalDoOrcamento(value: string)
  : iCriarOrdemServico;
begin
  result := self;
  try
    FTOTAL_ORCAMENTO := StrToCurr(value);
  except
    on e: exception do
      raise exception.create('Informe um valor v�lido para o Total da Ordem');
  end;
end;

function TEntityCriarOrdemServico.getTOTAL_PARCELAS(value: string)
  : iCriarOrdemServico;
begin
  result := self;

  if value = EmptyStr then
    FTOTAL_PARCELAS := 1
  else if value = '0' then
    FTOTAL_PARCELAS := 1
  else
    FTOTAL_PARCELAS := value.ToInteger;

end;

function TEntityCriarOrdemServico.getValor(value: string): iCriarOrdemServico;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityCriarOrdemServico.getVALOR_DA_ORDEM(value: string)
  : iCriarOrdemServico;
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

function TEntityCriarOrdemServico.getVALOR_DA_PARCELA(value: string)
  : iCriarOrdemServico;
begin
  result := self;

  try
    FVALOR_DA_PARCELA := StrToCurr(value);
  except
    raise exception.create('Informe um valor v�lido para o Valor da Parcela.');
  end;

end;

function TEntityCriarOrdemServico.Gravar: iCriarOrdemServico;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_ORDEM_SERVICO_ID');

  with FQuery.TQuery do
  begin
    FID := FieldByName('ID').AsInteger;
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
    FieldByName('TOTAL_PARCELAS').AsInteger := FTOTAL_PARCELAS;
    FieldByName('VALOR_DA_PARCELA').AsCurrency := FVALOR_DA_PARCELA;
    // FieldByName('PGTO').Visible := False;
    FieldByName('PRIORIDADE').AsString := FPRIORIDADE;
    FieldByName('OBSERVACAO').AsString := FOBSERVACAO;
    FieldByName('STATUS').AsString := FSTATUS;
    FieldByName('HORA_SAIDA').AsDateTime := StrToTime(FHORA_FINALIZACAO);
    FieldByName('ID_TECNICO_RESPONSAVEL').AsInteger := FID_TECNICO_RESPONSAVEL;
    FieldByName('TECNICO_RESPONSAVEL').AsString := FTECNICO_RESPONSAVEL;

    if FDATA_FABRICACAO <> '' then
      FieldByName('DATA_FABRICACAO').AsDateTime := StrToDate(FDATA_FABRICACAO);

    if FDATA_RETORNO <> '' then
      FieldByName('DATA_RETORNO').AsDateTime := StrToDate(FDATA_RETORNO);

    if FDATA_ENTRADA <> '' then
      FieldByName('DATA_ENTRADA').AsDateTime := StrToDate(FDATA_ENTRADA);

    if FDATA_FINALIZACAO <> '' then
      FieldByName('DATA_FINALIZACAO').AsDateTime :=
        StrToDate(FDATA_FINALIZACAO);

    if FDATA_BASE_VENCIMENTO <> '' then
      FieldByName('DATA_BASE_VENCIMENTO').AsDateTime :=
        StrToDate(FDATA_BASE_VENCIMENTO);

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

function TEntityCriarOrdemServico.inserir: iCriarOrdemServico;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo');
end;

function TEntityCriarOrdemServico.listarGrid(value: TDataSource)
  : iCriarOrdemServico;
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
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcelas';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('PRIORIDADE').DisplayLabel := 'Prioridade';
    FieldByName('DATA_ENTRADA').DisplayLabel := 'Data de entrada';
    FieldByName('DATA_FINALIZACAO').DisplayLabel := 'DAta de finalia��o';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';
    FieldByName('STATUS').DisplayLabel := 'Status';
    FieldByName('ID_TECNICO_RESPONSAVEL').DisplayLabel := 'C�d. T�cnico';
    FieldByName('TECNICO_RESPONSAVEL').DisplayLabel := 'T�cnico respons�vel';

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

class function TEntityCriarOrdemServico.new: iCriarOrdemServico;
begin
  result := self.create;
end;

function TEntityCriarOrdemServico.nomeTabela(value: string): iCriarOrdemServico;
begin
  result := self;
  FTabela := value;
end;

function TEntityCriarOrdemServico.open(value: string): iCriarOrdemServico;
begin
  FQuery.Query(FTabela);
end;

function TEntityCriarOrdemServico.ordenarGrid(column: TColumn)
  : iCriarOrdemServico;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityCriarOrdemServico.pesquisar: iCriarOrdemServico;
begin
  result := self;
end;

function TEntityCriarOrdemServico.setDataBaseVencimento: TDate;
begin
  result := StrToDate(FDATA_BASE_VENCIMENTO);
end;

function TEntityCriarOrdemServico.setId: integer;
begin
  result := FID;
end;

function TEntityCriarOrdemServico.setId_Cliente: integer;
begin
  result := FID_CLIENTE;
end;

function TEntityCriarOrdemServico.setTotalDeParcelas: integer;
begin
  result := FTOTAL_PARCELAS;
end;

function TEntityCriarOrdemServico.setValorDaParcelas: Currency;
begin
  result := FVALOR_DA_PARCELA;
end;

function TEntityCriarOrdemServico.sqlPesquisa: iCriarOrdemServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityCriarOrdemServico.sqlPesquisaData: iCriarOrdemServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityCriarOrdemServico.sqlPesquisaEstatica: iCriarOrdemServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityCriarOrdemServico.validarData(componet: tmaskEdit);
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
