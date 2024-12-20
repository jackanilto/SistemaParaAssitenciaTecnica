unit uClasse.Venda;

interface

uses uClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  uClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls, Datasnap.DBClient;

type

  TEntityVenda = class(TInterfacedObject, iVenda)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FValorDeAcrescimo: Currency;
    FValorDeDesconto: Currency;
    FValorSubtotal: Currency;
    FValorTotal: Currency;

    FID: integer;
    FID_CLIENTE: integer;
    FNOME_CLIENTE: string;
    F_FUNCIONARIO: integer;
    FNOME_FUNCIONARIO: string;
    FDATA_VENDA: string;
    FHORA_VENDA: string;
    FSUBTOTAL: Currency;
    FDESCONTO: Currency;
    FACRESCIMO: Currency;
    FTOTAL: Currency;
    FQUANTIDADE_PARCELAS: integer;
    F_FORMA_PAGAMENTO: string;
    FSTATUS: string;
    FOBSERACAO: string;
    FVENCIMENTO: string;

    FTipo_De_Venda: string;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iVenda;
    function getCampo(value: string): iVenda;
    function getValor(value: string): iVenda;
    function getDataInicial(value: TDate): iVenda;
    function getDataFinal(value: TDate): iVenda;
    function open(value: string): iVenda;
    function pesquisar: iVenda;
    function ExecSql: iVenda;
    function sqlPesquisa: iVenda;
    function sqlPesquisaData: iVenda;
    function sqlPesquisaEstatica: iVenda;

    function abrir: iVenda;
    function inserir: iVenda;
    function Gravar: iVenda;
    function deletar: iVenda;
    function atualizar: iVenda;
    function editar: iVenda;
    function cancelar: iVenda;
    function fecharQuery: iVenda;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iVenda;
    function ordenarGrid(column: TColumn): iVenda;

    function getID(value: integer): iVenda;
    function getID_CLIENTE(value: integer): iVenda;
    function getNOME_CLIENTE(value: string): iVenda;
    function getFuncionario(value: integer): iVenda;
    function getNOME_FUNCIONARIO(value: string): iVenda;
    function getDATA_VENDA(value: string): iVenda;
    function getHORA_VENDA(value: string): iVenda;
    function getSUBTOTAL(value: string): iVenda; overload;
    function getDesconto(value: string): iVenda; overload;
    function getACRESCIMO(value: string): iVenda; overload;
    function getTOTAL(value: string): iVenda; overload;
    function getVENCIMENTO(value: string): iVenda;
    function getQUANTIDADE_PARCELAS(value: integer): iVenda;
    function getFORMA_PAGAMENTO(value: string): iVenda;
    function getSTATUS(value: string): iVenda;
    function getOBSERACAO(value: string): iVenda;

    function getDesconto(value: TEdit): iVenda; overload;
    function getACRESCIMO(value: TEdit): iVenda; overload;
    function getSUBTOTAL(value: TEdit): iVenda; overload;
    function getTOTAL(value: TEdit): iVenda; overload;

    function EstornarVenda: iVenda;
    function calularDesconto: string;
    function calularAcrescimo: string;
    function contarTotalItens(value: TClientDataSet): integer;
    function somarItensDaVenda(value: TClientDataSet): Currency;
    function setNomeFuncionario: string;
    function setCodigoVenda: integer;
    function tipoDeVenda(value: string): iVenda;

    function exportar: iVenda;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iVenda;
    function getNome(value: string): iVenda;

    constructor create;
    destructor destroy; override;
    class function new: iVenda;
  end;

implementation

{ TEntityVenda }

function TEntityVenda.abrir: iVenda;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityVenda.atualizar: iVenda;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityVenda.calularAcrescimo: string;
begin

  result := '0';

  result := CurrToStr((FValorSubtotal + FValorDeAcrescimo) - FValorDeDesconto);

end;

function TEntityVenda.calularDesconto: string;
begin
  result := '0';

  result := CurrToStr((FValorSubtotal + FValorDeAcrescimo) - FValorDeDesconto);

end;

function TEntityVenda.cancelar: iVenda;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityVenda.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

function TEntityVenda.contarTotalItens(value: TClientDataSet): integer;
var
  total: integer;
begin

  result := 0;
  total := 0;

  value.First;

  while not value.Eof do
  begin
    total := total + value.FieldByName('Quantidade').AsInteger;
    value.Next;
  end;

  result := total;

end;

constructor TEntityVenda.create;
begin
  FTabela := 'VENDA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Venda de produtos').getCodigoFuncionario
    (funcionarioLogado);

end;

function TEntityVenda.deletar: iVenda;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_CLIENTE')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .getOperacao('deletado').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityVenda.destroy;
begin

  inherited;
end;

function TEntityVenda.editar: iVenda;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_CLIENTE')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
      .gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntityVenda.EstornarVenda: iVenda;
begin
  result := self;
end;

function TEntityVenda.ExecSql: iVenda;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityVenda.exportar: iVenda;
begin
  result := self;
end;

function TEntityVenda.fecharQuery: iVenda;
begin
  FQuery.TQuery.close;
end;

function TEntityVenda.getACRESCIMO(value: string): iVenda;
begin
  result := self;

  try
    FACRESCIMO := StrToCurr(value);
  except
    on e: exception do
      raise exception.create('Informe um valor de acr�scimo v�lido.');

  end;

end;

function TEntityVenda.getACRESCIMO(value: TEdit): iVenda;
begin
  result := self;

  try
    FValorDeAcrescimo := StrToCurr(value.Text);
  except
    on e: exception do
    begin
      value.Clear;
      value.SetFocus;
      raise exception.create('Informe um v�lor v�lido para o acr�scimo.');
    end;

  end;
end;

function TEntityVenda.getCampo(value: string): iVenda;
begin
  result := self;
  FCampo := value;
end;

function TEntityVenda.getCodigo(value: integer): iVenda;
begin
  result := self;
  FCodigo := value;
end;

function TEntityVenda.getDataFinal(value: TDate): iVenda;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityVenda.getDataInicial(value: TDate): iVenda;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityVenda.getDATA_VENDA(value: string): iVenda;
begin

  result := self;

  if value = '  /  /    ' then
    FDATA_VENDA := ''
  else
    FDATA_VENDA := value;

end;

function TEntityVenda.getDesconto(value: TEdit): iVenda;
begin
  result := self;

  try
    FValorDeDesconto := StrToCurr(value.Text);
  except
    on e: exception do
    begin
      value.Clear;
      value.SetFocus;
      raise exception.create('Informe um v�lor v�lido para o desconto.');
    end;

  end;
end;

function TEntityVenda.getDesconto(value: string): iVenda;
begin

  result := self;

  try
    FDESCONTO := StrToCurr(value);
  except
    on e: exception do
      raise exception.create('Informe um valor v�lido para o Desconto.');

  end;

end;

function TEntityVenda.getFORMA_PAGAMENTO(value: string): iVenda;
begin

  result := self;

  if FTipo_De_Venda = '� vista' then
  begin

    if value = EmptyStr then
      raise exception.create('ERRO! Infome o meio de pagamento do venda');

    F_FORMA_PAGAMENTO := value;

  end
  else
    F_FORMA_PAGAMENTO := value;

end;

function TEntityVenda.getFuncionario(value: integer): iVenda;
begin
  result := self;
  F_FUNCIONARIO := value;
end;

function TEntityVenda.getHORA_VENDA(value: string): iVenda;
begin

  result := self;
  FHORA_VENDA := value;

end;

function TEntityVenda.getID(value: integer): iVenda;
begin

  result := self;
  FID := value;

end;

function TEntityVenda.getID_CLIENTE(value: integer): iVenda;
begin

  result := self;
  FID_CLIENTE := value;

end;

function TEntityVenda.getNome(value: string): iVenda;
begin
  result := self;
  FNome := value;
end;

function TEntityVenda.getNOME_CLIENTE(value: string): iVenda;
begin
  result := self;
  FNOME_CLIENTE := value;
end;

function TEntityVenda.getNOME_FUNCIONARIO(value: string): iVenda;
begin
  result := self;
  FNOME_FUNCIONARIO := value;
end;

function TEntityVenda.getOBSERACAO(value: string): iVenda;
begin
  result := self;
  FOBSERACAO := value;
end;

function TEntityVenda.getQUANTIDADE_PARCELAS(value: integer): iVenda;
begin
  result := self;
  if value = 0 then
    raise exception.create('Informe a quantidade de parcelas da venda.');
  FQUANTIDADE_PARCELAS := value;
end;

function TEntityVenda.getSTATUS(value: string): iVenda;
begin
  result := self;
  FSTATUS := value;
end;

function TEntityVenda.getSUBTOTAL(value: string): iVenda;
begin
  result := self;

  try
    FSUBTOTAL := StrToCurr(value);
  except
    on e: exception do
      raise exception.create('Informe um valor v�lido para o campo Subtotal.');
  end;
end;

function TEntityVenda.getSUBTOTAL(value: TEdit): iVenda;
begin
  result := self;

  try
    FValorSubtotal := StrToCurr(value.Text);

  except
    on e: exception do
    begin
      value.Clear;
      value.SetFocus;
      raise exception.create('Informe um valor v�lido para o campo Subtotal');
    end;

  end;

end;

function TEntityVenda.getTOTAL(value: TEdit): iVenda;
begin
  result := self;

  try
    FValorTotal := StrToCurr(value.Text);

  except
    on e: exception do
    begin
      value.Clear;
      value.SetFocus;
      raise exception.create('Informe um valor v�lido para o campo Total');
    end;

  end;
end;

function TEntityVenda.getTOTAL(value: string): iVenda;
begin
  result := self;

  try
    FTOTAL := StrToCurr(value);
  except
    on e: exception do
      raise exception.create('Informe um valor v�lido para o campo Total');

  end;

end;

function TEntityVenda.getValor(value: string): iVenda;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityVenda.getVENCIMENTO(value: string): iVenda;
begin
  result := self;

  if value = '  /  /    ' then
    FVENCIMENTO := ''
  else
    FVENCIMENTO := value;

end;

function TEntityVenda.Gravar: iVenda;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_VENDA_ID');
  with FQuery.TQuery do
  begin
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('NOME_CLIENTE').AsString := FNOME_CLIENTE;
    FieldByName('FUNCIONARIO').AsInteger := funcionarioLogado;
    FieldByName('NOME_FUNCIONARIO').AsString := NomeFuncionarioLogado;
    FieldByName('HORA_VENDA').AsDateTime := StrToTime(FHORA_VENDA);
    FieldByName('SUBTOTAL').AsCurrency := FSUBTOTAL;
    FieldByName('DESCONTO').AsCurrency := FDESCONTO;
    FieldByName('ACRESCIMO').AsCurrency := FACRESCIMO;
    FieldByName('TOTAL').AsCurrency := FTOTAL;
    FieldByName('QUANTIDADE_PARCELAS').AsInteger := FQUANTIDADE_PARCELAS;
    FieldByName('FORMA_PAGAMENTO').AsString := F_FORMA_PAGAMENTO;
    FieldByName('STATUS').AsString := FSTATUS;
    FieldByName('OBSERACAO').AsString := FOBSERACAO;

    if FDATA_VENDA <> EmptyStr then
      FieldByName('DATA_VENDA').AsDateTime := StrToDate(FDATA_VENDA);

    if FVENCIMENTO <> EmptyStr then
      FieldByName('VENCIMENTO').AsDateTime := StrToDate(FVENCIMENTO);

  end;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('NOME_CLIENTE').AsString)
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

function TEntityVenda.inserir: iVenda;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo');
end;

function TEntityVenda.listarGrid(value: TDataSource): iVenda;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'C�digo';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('FUNCIONARIO').Visible := false;
    FieldByName('NOME_FUNCIONARIO').Visible := false;
    FieldByName('DATA_VENDA').DisplayLabel := 'Data da venda';
    FieldByName('HORA_VENDA').DisplayLabel := 'Hora da venda';
    FieldByName('SUBTOTAL').DisplayLabel := 'Subtotal';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('ACRESCIMO').DisplayLabel := 'Acr�scimo';
    FieldByName('TOTAL').DisplayLabel := 'Total';
    FieldByName('QUANTIDADE_PARCELAS').DisplayLabel := 'Quantidade de parcelas';
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('STATUS').DisplayLabel := 'Status';
    FieldByName('OBSERACAO').DisplayLabel := 'Observa��o';
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityVenda.new: iVenda;
begin
  result := self.create;
end;

function TEntityVenda.nomeTabela(value: string): iVenda;
begin
  result := self;
  FTabela := value;
end;

function TEntityVenda.open(value: string): iVenda;
begin
  FQuery.Query(FTabela);
end;

function TEntityVenda.ordenarGrid(column: TColumn): iVenda;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityVenda.pesquisar: iVenda;
begin
  result := self;
end;

function TEntityVenda.setCodigoVenda: integer;
begin
  result := FQuery.TQuery.FieldByName('ID').AsInteger;
end;

function TEntityVenda.setNomeFuncionario: string;
begin
  result := NomeFuncionarioLogado;
end;

function TEntityVenda.somarItensDaVenda(value: TClientDataSet): Currency;
var
  total: Currency;
begin

  result := 0;

  value.First;

  total := 0;

  while not value.Eof do
  begin
    total := total + value.FieldByName('Total_do_produto').AsCurrency;
    value.Next;
  end;

  result := total;

end;

function TEntityVenda.sqlPesquisa: iVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityVenda.sqlPesquisaData: iVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityVenda.sqlPesquisaEstatica: iVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TEntityVenda.tipoDeVenda(value: string): iVenda;
begin
  result := self;
  FTipo_De_Venda := value;
end;

procedure TEntityVenda.validarData(componet: tmaskEdit);
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
