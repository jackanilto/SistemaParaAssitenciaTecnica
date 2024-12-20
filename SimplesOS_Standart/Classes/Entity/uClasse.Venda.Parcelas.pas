unit uClasse.Venda.Parcelas;

interface

uses uClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  uClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls;

type

  TEntityVendasParcelas = class(TInterfacedObject, iParcelasVendas)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_VENDA: integer;
    FID_CLIENTE: integer;
    FVALOR_VENDA: Currency;
    FQUANTIDADE_PARCELAS: integer;
    FPARCELA: integer;
    FVALOR_DA_PARCELA: Currency;
    FDATA_VENCIMENTO: string;
    FJUROS: Currency;
    FMULTA: Currency;
    FDESCONTO: Currency;
    FTOTAL: Currency;
    FDATA_PAGAMENTO: string;
    FHORA_PAGAMENTO: string;
    F_FUNCIONARIO_PGTO: integer;
    FPAGO: string;
    FFormaPagamento:string;
    FOBSERVACAO: string;

    FDescontoEdit: Currency;
    FSutotalEdit: Currency;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iParcelasVendas;
    function getCampo(value: string): iParcelasVendas;
    function getValor(value: string): iParcelasVendas;
    function getDataInicial(value: TDate): iParcelasVendas;
    function getDataFinal(value: TDate): iParcelasVendas;
    function open(value: string): iParcelasVendas;
    function pesquisar: iParcelasVendas;
    function ExecSql: iParcelasVendas;
    function sqlPesquisa: iParcelasVendas;
    function sqlPesquisaData: iParcelasVendas;
    function sqlPesquisaEstatica: iParcelasVendas;

    function abrir: iParcelasVendas;
    function inserir: iParcelasVendas;
    function Gravar: iParcelasVendas;
    function deletar: iParcelasVendas;
    function atualizar: iParcelasVendas;
    function editar: iParcelasVendas;
    function cancelar: iParcelasVendas;
    function fecharQuery: iParcelasVendas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iParcelasVendas;
    function ordenarGrid(column: TColumn): iParcelasVendas;

    function quitarParcelas: iParcelasVendas;
    function estornarParcela: iParcelasVendas;

    function getID(value: integer): iParcelasVendas;
    function getID_VENDA(value: integer): iParcelasVendas;
    function getID_CLIENTE(value: integer): iParcelasVendas;
    function getVALOR_VENDA(value: string): iParcelasVendas;
    function getQUANTIDADE_PARCELAS(value: integer): iParcelasVendas;
    function getPARCELA(value: integer): iParcelasVendas;
    function getVALOR_DA_PARCELA(value: string): iParcelasVendas;
    function getDATA_VENCIMENTO(value: string): iParcelasVendas;
    function getJuros(value: string): iParcelasVendas;
    function getMulta(value: string): iParcelasVendas;
    function getDesconto(value: string): iParcelasVendas; overload;
    function getTOTAL(value: string): iParcelasVendas;
    function getDATA_PAGAMENTO(value: string): iParcelasVendas;
    function getHORA_PAGAMENTO(value: string): iParcelasVendas;
    function getFUNCIONARIO_PGTO(value: integer): iParcelasVendas;
    function getPAGO(value: string): iParcelasVendas;
    function getFormaPagamento(value:string):iParcelasVendas;
    function getObservacao(value: string): iParcelasVendas;

    function getDesconto(value: TEdit): iParcelasVendas; overload;
    function getSUBTOTAL(value: TEdit): iParcelasVendas;
    function calcularTotal: string;
    function gerarParcelas: iParcelasVendas;
    function gerarParcelaAvista: iParcelasVendas;

    function exportar: iParcelasVendas;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iParcelasVendas;
    function getNome(value: string): iParcelasVendas;

    constructor create;
    destructor destroy; override;
    class function new: iParcelasVendas;
  end;

implementation

{ TEntityVendasParcelas }

function TEntityVendasParcelas.abrir: iParcelasVendas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityVendasParcelas.atualizar: iParcelasVendas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityVendasParcelas.calcularTotal: string;
begin

  result := CurrToStr(FSutotalEdit - FDescontoEdit);

end;

function TEntityVendasParcelas.cancelar: iParcelasVendas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityVendasParcelas.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityVendasParcelas.create;
begin
  FTabela := 'PARCELAS_VENDAS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Parcelamento da venda').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntityVendasParcelas.deletar: iParcelasVendas;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(inttostr(FQuery.TQuery.FieldByName('id')
        .AsInteger)).gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityVendasParcelas.destroy;
begin

  inherited;
end;

function TEntityVendasParcelas.editar: iParcelasVendas;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(inttostr(FQuery.TQuery.FieldByName('id')
      .AsInteger)).gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntityVendasParcelas.estornarParcela: iParcelasVendas;
begin
  { C�DIFICAR METODO ASSIM QUE A PARTE DE VENDAS FOR CONCLUIDA }
end;

function TEntityVendasParcelas.ExecSql: iParcelasVendas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityVendasParcelas.exportar: iParcelasVendas;
begin
  result := self;
end;

function TEntityVendasParcelas.fecharQuery: iParcelasVendas;
begin
  FQuery.TQuery.close;
end;

function TEntityVendasParcelas.gerarParcelas: iParcelasVendas;
var
  i: integer;
  vencimento: TDate;
begin

  result := self;

  vencimento := StrToDate(FDATA_VENCIMENTO);

  for i := 1 to FQUANTIDADE_PARCELAS do
  begin
    FQuery.TQuery.Insert;
    with FQuery.TQuery do
    begin
      FieldByName('id').AsInteger := FQuery.codigoCadastro
        ('SP_GEN_PARCELAS_VENDAS_ID');
      FieldByName('ID_VENDA').AsInteger := FID_VENDA;
      FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
      FieldByName('VALOR_VENDA').AsCurrency := FVALOR_VENDA;
      FieldByName('QUANTIDADE_PARCELAS').AsInteger := FQUANTIDADE_PARCELAS;
      FieldByName('PARCELA').AsInteger := i;
      FieldByName('VALOR_DA_PARCELA').AsCurrency := FVALOR_DA_PARCELA;
      FieldByName('DATA_VENCIMENTO').AsDateTime := vencimento;
      FieldByName('PAGO').AsString := FFormaPagamento;
      vencimento := IncMonth(vencimento, 1);
    end;

    FQuery.TQuery.Post;

  end;

end;

function TEntityVendasParcelas.getCampo(value: string): iParcelasVendas;
begin
  result := self;
  FCampo := value;
end;

function TEntityVendasParcelas.getCodigo(value: integer): iParcelasVendas;
begin
  result := self;
  FCodigo := value;
end;

function TEntityVendasParcelas.getDataFinal(value: TDate): iParcelasVendas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityVendasParcelas.getDataInicial(value: TDate): iParcelasVendas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityVendasParcelas.getDATA_PAGAMENTO(value: string)
  : iParcelasVendas;
begin
  result := self;
  if value = '  /  /    ' then
    FDATA_PAGAMENTO := ''
  else
    FDATA_PAGAMENTO := value;
end;

function TEntityVendasParcelas.getDATA_VENCIMENTO(value: string)
  : iParcelasVendas;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create('Informe a data de vencimento da parcela');

  if value = '  /  /    ' then
    raise Exception.create('Informe a data de vencimento da parcela');

  FDATA_VENCIMENTO := value;

end;

function TEntityVendasParcelas.getDesconto(value: string): iParcelasVendas;
begin

  result := self;

  if value = EmptyStr then
  begin
    FDESCONTO := 0;
  end
  else
  begin
    try
      FDESCONTO := StrToCurr(value);
    except
      on e: Exception do
      begin
        raise Exception.create
          ('Digite um valor v�lido para o campo de desconto');
      end;

    end;
  end;

end;

function TEntityVendasParcelas.getDesconto(value: TEdit): iParcelasVendas;
begin

  result := self;

  if value.Text = EmptyStr then
  begin
    FDescontoEdit := 0;
  end
  else
  begin
    try
      FDescontoEdit := StrToCurr(value.Text);
    except
      on e: Exception do
      begin
        raise Exception.create
          ('Infome um valor v�lido para o campo de desconto');
      end;

    end;
  end;

end;

function TEntityVendasParcelas.getFormaPagamento(
  value: string): iParcelasVendas;
begin
   result := self;
   FFormaPagamento := value;
end;

function TEntityVendasParcelas.getFUNCIONARIO_PGTO(value: integer)
  : iParcelasVendas;
begin
  result := self;
  F_FUNCIONARIO_PGTO := value;
end;

function TEntityVendasParcelas.getHORA_PAGAMENTO(value: string)
  : iParcelasVendas;
begin
  result := self;
  FHORA_PAGAMENTO := value;
end;

function TEntityVendasParcelas.getID(value: integer): iParcelasVendas;
begin
  result := self;
  FID := value;
end;

function TEntityVendasParcelas.getID_CLIENTE(value: integer): iParcelasVendas;
begin
  result := self;
  FID_CLIENTE := value;
end;

function TEntityVendasParcelas.getID_VENDA(value: integer): iParcelasVendas;
begin
  result := self;
  if value = 0 then
    raise Exception.create('Informe para qual venda deve ser gerada a parcela');
  FID_VENDA := value;
end;

function TEntityVendasParcelas.getJuros(value: string): iParcelasVendas;
begin
  result := self;
  if value = EmptyStr then
    FJUROS := 0
  else
  begin
    try
      FJUROS := StrToCurr(value);
    except
      raise Exception.create('Digite um valor v�lido para o campo Juros');
    end;

  end;
end;

function TEntityVendasParcelas.getMulta(value: string): iParcelasVendas;
begin
  result := self;
  if value = EmptyStr then
    FMULTA := 0
  else
  begin
    try
      FMULTA := StrToCurr(value);
    except
      begin
        raise Exception.create('Digite um valor v�lido para o campo multa');
      end;

    end;
  end;
end;

function TEntityVendasParcelas.getNome(value: string): iParcelasVendas;
begin
  result := self;
  FNome := value;
end;

function TEntityVendasParcelas.getObservacao(value: string): iParcelasVendas;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityVendasParcelas.getPAGO(value: string): iParcelasVendas;
begin
  result := self;
  FPAGO := value;
end;

function TEntityVendasParcelas.getPARCELA(value: integer): iParcelasVendas;
begin

  result := self;

  if value = 0 then
    raise Exception.create
      ('Informe um valor superior a 0(zero) para o campo parcela');

  FPARCELA := value;

end;

function TEntityVendasParcelas.getQUANTIDADE_PARCELAS(value: integer)
  : iParcelasVendas;
begin

  result := self;

  if value = 0 then
    raise Exception.create
      ('Digite uma quantidade maior que 0(zero) para a quantidade de parcelas');

  FQUANTIDADE_PARCELAS := value;

end;

function TEntityVendasParcelas.getSUBTOTAL(value: TEdit): iParcelasVendas;
begin

  result := self;

  if value.Text = EmptyStr then
  begin
    FSutotalEdit := 0;
  end
  else
  begin
    try
      FSutotalEdit := StrToCurr(value.Text);
    except
      begin
        raise Exception.create
          ('Informe um valor v�lido para o subtotal da parcela');
      end;

    end;
  end;

end;

function TEntityVendasParcelas.getTOTAL(value: string): iParcelasVendas;
begin
  result := self;
  try
    FTOTAL := StrToCurr(value);
  except
    raise Exception.create('Digite um valor v�lido para o campo Total');
  end;
end;

function TEntityVendasParcelas.getValor(value: string): iParcelasVendas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityVendasParcelas.getVALOR_DA_PARCELA(value: string)
  : iParcelasVendas;
begin
  result := self;
  try
    FVALOR_DA_PARCELA := StrToCurr(value);
  except
    raise Exception.create
      ('Digite um valor v�lido para o campo Valor da parcela');
  end;
end;

function TEntityVendasParcelas.getVALOR_VENDA(value: string): iParcelasVendas;
begin
  result := self;
  try
    FVALOR_VENDA := StrToCurr(value);
  except
    raise Exception.create
      ('Digite um valor v�lido para o campo Valor da venda');
  end;
end;

function TEntityVendasParcelas.Gravar: iParcelasVendas;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_PARCELAS_VENDAS_ID');

  with FQuery.TQuery do
  begin
    FieldByName('ID_VENDA').AsInteger := FID_VENDA;
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('VALOR_VENDA').AsCurrency := FVALOR_VENDA;
    FieldByName('QUANTIDADE_PARCELAS').AsInteger := FQUANTIDADE_PARCELAS;
    FieldByName('PARCELA').AsInteger := FPARCELA;
    FieldByName('VALOR_DA_PARCELA').AsCurrency := FVALOR_DA_PARCELA;
    FieldByName('JUROS').AsCurrency := FJUROS;
    FieldByName('MULTA').AsCurrency := FMULTA;
    FieldByName('DESCONTO').AsCurrency := FDESCONTO;
    FieldByName('TOTAL').AsCurrency := FTOTAL;
    FieldByName('HORA_PAGAMENTO').AsDateTime := StrToTime(FHORA_PAGAMENTO);
    FieldByName('FUNCIONARIO_PGTO').AsInteger := funcionarioLogado;
    FieldByName('PAGO').AsString := FPAGO;
    FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

    if FDATA_VENCIMENTO <> EmptyStr then
      FieldByName('DATA_VENCIMENTO').AsDateTime := StrToDate(FDATA_PAGAMENTO);

    if FDATA_PAGAMENTO <> EmptyStr then
      FieldByName('DATA_PAGAMENTO').AsDateTime := StrToDate(FDATA_PAGAMENTO);
  end;

  FGravarLog.getNomeRegistro(inttostr(FQuery.TQuery.FieldByName('id').AsInteger)
    ).gravarLog;

  try
    FQuery.TQuery.Post;
  except
    on e: Exception do
    begin
      raise Exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityVendasParcelas.inserir: iParcelasVendas;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityVendasParcelas.listarGrid(value: TDataSource): iParcelasVendas;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'C�d. Parcela';
    FieldByName('ID_VENDA').DisplayLabel := 'Venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('VALOR_VENDA').DisplayLabel := 'Valor da venda';
    FieldByName('QUANTIDADE_PARCELAS').DisplayLabel := 'Qtde. Parcelas';
    FieldByName('PARCELA').DisplayLabel := 'N� Parcela';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('TOTAL').DisplayLabel := 'Total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Data de pagamento';
    FieldByName('HORA_PAGAMENTO').DisplayLabel := 'Hora de pagamento';
    FieldByName('FUNCIONARIO_PGTO').DisplayLabel := 'Funcion�rio';
    FieldByName('PAGO').DisplayLabel := 'Pago';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityVendasParcelas.new: iParcelasVendas;
begin
  result := self.create;
end;

function TEntityVendasParcelas.nomeTabela(value: string): iParcelasVendas;
begin
  result := self;
  FTabela := value;
end;

function TEntityVendasParcelas.open(value: string): iParcelasVendas;
begin
  FQuery.Query(FTabela);
end;

function TEntityVendasParcelas.ordenarGrid(column: TColumn): iParcelasVendas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityVendasParcelas.pesquisar: iParcelasVendas;
begin
  result := self;
end;

function TEntityVendasParcelas.gerarParcelaAvista: iParcelasVendas;
var
  i: integer;
begin

  result := self;

  FQuery.TQuery.Insert;
  with FQuery.TQuery do
  begin
    FieldByName('id').AsInteger := FQuery.codigoCadastro
      ('SP_GEN_PARCELAS_VENDAS_ID');
    FieldByName('ID_VENDA').AsInteger := FID_VENDA;
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('VALOR_VENDA').AsCurrency := FVALOR_VENDA;
    FieldByName('QUANTIDADE_PARCELAS').AsInteger := FQUANTIDADE_PARCELAS;
    FieldByName('PARCELA').AsInteger := 1;
    FieldByName('VALOR_DA_PARCELA').AsCurrency := FVALOR_DA_PARCELA;
    FieldByName('DATA_VENCIMENTO').AsDateTime := StrToDate(FDATA_VENCIMENTO);
    FieldByName('JUROS').AsFloat := 0;
    FieldByName('MULTA').AsFloat := 0;
    FieldByName('DESCONTO').AsCurrency := FDESCONTO;
    FieldByName('TOTAL').AsCurrency := FVALOR_DA_PARCELA;
    FieldByName('DATA_PAGAMENTO').AsDateTime := Date;
    FieldByName('HORA_PAGAMENTO').AsDateTime := time;
    FieldByName('FUNCIONARIO_PGTO').AsInteger := funcionarioLogado;
    FieldByName('FORMA_PAGAMENTO').AsString := FFormaPagamento;
    FieldByName('PAGO').AsString := 'Sim';
    FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

    FQuery.TQuery.Post;

  end;

end;

function TEntityVendasParcelas.quitarParcelas: iParcelasVendas;
begin
  result := self;
  { C�DIFICAR ESTA PARTE NO FINAL DO PROJETO }
end;

function TEntityVendasParcelas.sqlPesquisa: iParcelasVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityVendasParcelas.sqlPesquisaData: iParcelasVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityVendasParcelas.sqlPesquisaEstatica: iParcelasVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityVendasParcelas.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := StrToDate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise Exception.create('Digite uma data v�lida.');
  end;
end;

end.
