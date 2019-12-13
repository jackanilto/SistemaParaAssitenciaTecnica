unit UClasse.Entity.Criar.Ordem.Parcelas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  UClasse.Calcular.Juros, UClasse.DiasMeses, Vcl.StdCtrls;

type

  TEntityGerarParcelas = class(TInterfacedObject, iParcelaOrdem)
  private

    FQuery: iConexaoQuery;
    FQueryConfigurarParcelas: iConexaoQuery;
    FCalularDiferencaDiasMes: TCalcularDiaMeses;
    FGravarLog: iGravarLogOperacoes;
    FCalcularJuros: iCalcularJuros;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_ORDEM: integer;
    FID_CLIENTE: integer;
    FTOTAL_PARCELAS: integer;
    FPARCELA: integer;
    FVALOR_PARCELA: Currency;
    FDATA_VENCIMENTO: String;
    FDESCONTO: Currency;
    FJUROS: Real;
    FMULTA: Currency;
    FVALOR_TOTAL: Currency;
    FDATA_PAGAMENTO: String;
    FHORA_PAGAMENTO: String;
    F_FORMA_PAGAMENTO: String;
    FPGTO: string;
    FID_FUNCIONARIO: integer;
    FNOME_FUNCIONARIO: string;
    FOBSERVACAO: string;

    F_JurosAtraso: Real;
    F_MultaAtraso: Currency;

    FCodigo: integer;
    FNome: string;
    function getCodigo(value: integer): iParcelaOrdem;
    function getNome(value: string): iParcelaOrdem;
    procedure validarData(componet: tmaskEdit);

  public

    function nomeTabela(value: string): iParcelaOrdem;
    function getCampo(value: string): iParcelaOrdem;
    function getValor(value: string): iParcelaOrdem;
    function getDataInicial(value: TDate): iParcelaOrdem;
    function getDataFinal(value: TDate): iParcelaOrdem;
    function open(value: string): iParcelaOrdem;
    function pesquisar: iParcelaOrdem;
    function ExecSql: iParcelaOrdem;
    function sqlPesquisa: iParcelaOrdem;
    function sqlPesquisaData: iParcelaOrdem;
    function sqlPesquisaEstatica: iParcelaOrdem;

    function abrir: iParcelaOrdem;
    function inserir: iParcelaOrdem;
    function Gravar: iParcelaOrdem;
    function deletar: iParcelaOrdem;
    function atualizar: iParcelaOrdem;
    function editar: iParcelaOrdem;
    function cancelar: iParcelaOrdem;
    function fecharQuery: iParcelaOrdem;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iParcelaOrdem;
    function ordenarGrid(column: TColumn): iParcelaOrdem;

    function getID(value: integer): iParcelaOrdem;
    function getID_ORDEM(value: integer): iParcelaOrdem;
    function getID_CLIENTE(value: integer): iParcelaOrdem;
    function getTOTAL_PARCELAS(value: integer): iParcelaOrdem;
    function getPARCELA(value: integer): iParcelaOrdem;
    function getVALOR_PARCELA(value: Currency): iParcelaOrdem;
    function getDATA_VENCIMENTO(value: string): iParcelaOrdem;
    function getDesconto(value: string): iParcelaOrdem;
    function getJuros(value: string): iParcelaOrdem;
    function getMulta(value: string): iParcelaOrdem;
    function getVALOR_TOTAL(value: string): iParcelaOrdem;
    function getDATA_PAGAMENTO(value: string): iParcelaOrdem;
    function getHORA_PAGAMENTO(value: string): iParcelaOrdem;
    function getFORMA_PAGAMENTO(value: string): iParcelaOrdem;
    function getPGTO(value: string): iParcelaOrdem;
    function getID_FUNCIONARIO(value: integer): iParcelaOrdem;
    function getNOME_FUNCIONARIO(value: string): iParcelaOrdem;
    function getObservacao(value: string): iParcelaOrdem;

    function exportar: iParcelaOrdem;
    function gerarParcelas: iParcelaOrdem;

    function calularJuros: string;

    function extornarParcelaSelecionada(value: integer): iParcelaOrdem;
    function adicionarParcela: iParcelaOrdem;

    constructor create;
    destructor destroy; override;
    class function new: iParcelaOrdem;
  end;

implementation

{ TEntityGerarParcelas }

function TEntityGerarParcelas.abrir: iParcelaOrdem;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityGerarParcelas.adicionarParcela: iParcelaOrdem;
begin
  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_PARCELAS_ORDEM_ID');

  with FQuery.TQuery do
  begin
    FieldByName('ID_ORDEM').AsInteger := FID_ORDEM;
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('TOTAL_PARCELAS').AsInteger := FTOTAL_PARCELAS;
    FieldByName('PARCELA').AsInteger := FPARCELA;
    FieldByName('VALOR_PARCELA').AsCurrency := FVALOR_PARCELA;
    FieldByName('DATA_VENCIMENTO').AsDateTime := StrToDate(FDATA_VENCIMENTO);
    FieldByName('PGTO').AsString := FPGTO;
    FieldByName('OBSERVACAO').AsString := FOBSERVACAO;
  end;

  try
    FQuery.TQuery.Post;
    showmessage('Parcela adicionada com sucesso!');
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar adicionar a nova parcela. ' +
        e.Message);
    end;

  end;

end;

function TEntityGerarParcelas.atualizar: iParcelaOrdem;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityGerarParcelas.calularJuros: string;
var
  periodo: integer;
  total: Currency;
  valorParcela: Currency;
  totalJuros: Currency;
begin

  result := '0';

  valorParcela := FQuery.TQuery.FieldByName('VALOR_PARCELA').AsCurrency;

  if date > FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime then
  begin

    periodo := FCalularDiferencaDiasMes.DifDiasMeses
      (FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime, date);

    if periodo >= 1 then
    begin
      total := valorParcela * (F_JurosAtraso / 100);
      total := valorParcela + (total * periodo);
      totalJuros := total - valorParcela;
    end
    else if periodo = 0 then
    begin
      total := valorParcela * (F_JurosAtraso / 100);
      total := valorParcela + (total * 1);
      totalJuros := total - valorParcela;
    end;

    FQuery.TQuery.FieldByName('JUROS').AsFloat := totalJuros;
    FQuery.TQuery.FieldByName('MULTA').AsCurrency := F_MultaAtraso;
    FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime := date;
    FQuery.TQuery.FieldByName('HORA_PAGAMENTO').AsDateTime := time;

    result := currtostr(totalJuros + F_MultaAtraso + valorParcela);

  end
  else
  begin

    FQuery.TQuery.FieldByName('JUROS').AsFloat := 0;
    FQuery.TQuery.FieldByName('MULTA').AsCurrency := 0;
    FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime := date;
    FQuery.TQuery.FieldByName('HORA_PAGAMENTO').AsDateTime := time;

    result := currtostr(valorParcela);

  end;

end;

function TEntityGerarParcelas.cancelar: iParcelaOrdem;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityGerarParcelas.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityGerarParcelas.create;
begin
  FTabela := 'PARCELAS_ORDEM';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryConfigurarParcelas := TConexaoQuery.new.Query('CONFIGURAR_PARCELA');

  F_JurosAtraso := FQueryConfigurarParcelas.TQuery.FieldByName('JUROS').AsFloat;
  F_MultaAtraso := FQueryConfigurarParcelas.TQuery.FieldByName('MULTA')
    .AsCurrency;

  FCalcularJuros := TCalcularJuros.new;

  FCalularDiferencaDiasMes := TCalcularDiaMeses.create;

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Parcelas da OS').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

function TEntityGerarParcelas.deletar: iParcelaOrdem;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('ID')
        .AsInteger.ToString).gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityGerarParcelas.destroy;
begin
  FreeAndNil(FCalularDiferencaDiasMes);
  inherited;
end;

function TEntityGerarParcelas.editar: iParcelaOrdem;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('ID').AsString)
      .gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntityGerarParcelas.ExecSql: iParcelaOrdem;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityGerarParcelas.exportar: iParcelaOrdem;
begin
  result := self;
end;

function TEntityGerarParcelas.extornarParcelaSelecionada(value: integer)
  : iParcelaOrdem;
begin

  result := self;

  if application.MessageBox('Deseja realmente estornar esta parcela?',
    'Pergunta do sistma', MB_YESNO + MB_ICONQUESTION) = mryes then
  begin

    try
      FQuery.TQuery.Edit;
      FQuery.TQuery.FieldByName('PGTO').AsString := 'Não';
      FQuery.TQuery.FieldByName('DATA_PAGAMENTO').Clear;
      FQuery.TQuery.FieldByName('HORA_PAGAMENTO').Clear;
      FQuery.TQuery.FieldByName('FORMA_PAGAMENTO').AsString := '';
      FQuery.TQuery.FieldByName('DESCONTO').AsCurrency := 0;
      FQuery.TQuery.FieldByName('JUROS').AsCurrency := 0;
      FQuery.TQuery.FieldByName('MULTA').AsCurrency := 0;
      FQuery.TQuery.FieldByName('VALOR_TOTAL').AsCurrency := 0;
      FQuery.TQuery.Post;
    except
      on e: exception do
      begin
        raise exception.create('Erro ao tentar extornar a parcela. ' +
          e.Message);
      end;

    end;
  end;

end;

function TEntityGerarParcelas.fecharQuery: iParcelaOrdem;
begin
  FQuery.TQuery.close;
end;

function TEntityGerarParcelas.gerarParcelas: iParcelaOrdem;
var
  parcelaAtual: integer;
  vencimento: TDate;
begin
  result := self;

  parcelaAtual := 1;
  vencimento := StrToDate(FDATA_VENCIMENTO);

  while parcelaAtual <= FTOTAL_PARCELAS do
  begin

    FQuery.TQuery.open;
    FQuery.TQuery.Append;

    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_PARCELAS_ORDEM_ID');

    with FQuery.TQuery do
    begin
      FieldByName('ID_ORDEM').AsInteger := FID_ORDEM;
      FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
      FieldByName('TOTAL_PARCELAS').AsInteger := FTOTAL_PARCELAS;
      FieldByName('PARCELA').AsInteger := parcelaAtual;
      FieldByName('VALOR_PARCELA').AsCurrency := FVALOR_PARCELA;
      FieldByName('DATA_VENCIMENTO').AsDateTime := vencimento;
      FieldByName('PGTO').AsString := 'Não';
    end;

    try

      FQuery.TQuery.Post;

      inc(parcelaAtual);
      vencimento := IncMonth(vencimento, 1)

    except
      on e: exception do
      begin
        raise exception.create('Erro ao tentar Gerar as parcelas. ' +
          e.Message);
      end;

    end;

  end;

end;

function TEntityGerarParcelas.getCampo(value: string): iParcelaOrdem;
begin
  result := self;
  FCampo := value;
end;

function TEntityGerarParcelas.getCodigo(value: integer): iParcelaOrdem;
begin
  result := self;
  FCodigo := value;
end;

function TEntityGerarParcelas.getDataFinal(value: TDate): iParcelaOrdem;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityGerarParcelas.getDataInicial(value: TDate): iParcelaOrdem;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityGerarParcelas.getDATA_PAGAMENTO(value: string): iParcelaOrdem;
begin
  result := self;

  if value = '  /  /    ' then
    FDATA_PAGAMENTO := ''
  else
    FDATA_PAGAMENTO := value;

end;

function TEntityGerarParcelas.getDATA_VENCIMENTO(value: string): iParcelaOrdem;
begin

  result := self;

  if value = '  /  /    ' then
    FDATA_VENCIMENTO := ''
  else
    FDATA_VENCIMENTO := value;
end;

function TEntityGerarParcelas.getDesconto(value: string): iParcelaOrdem;
begin

  result := self;

  try
    FDESCONTO := StrToCurr(value);
  except
    raise exception.create
      ('Informe um valor válido para o desconto da parcela.');

  end;

end;

function TEntityGerarParcelas.getFORMA_PAGAMENTO(value: string): iParcelaOrdem;
begin

  result := self;

  if value = EmptyStr then
    raise exception.create('Informe a forma de pagamento.');
  F_FORMA_PAGAMENTO := value;

end;

function TEntityGerarParcelas.getHORA_PAGAMENTO(value: string): iParcelaOrdem;
begin
  result := self;
  FHORA_PAGAMENTO := value;
end;

function TEntityGerarParcelas.getID(value: integer): iParcelaOrdem;
begin
  result := self;
  FID := value;
end;

function TEntityGerarParcelas.getID_CLIENTE(value: integer): iParcelaOrdem;
begin

  result := self;

  if value = 0 then
    raise exception.create('Informe um cliente para esta parcela.');

  FID_CLIENTE := value

end;

function TEntityGerarParcelas.getID_FUNCIONARIO(value: integer): iParcelaOrdem;
begin
  result := self;
  FID_FUNCIONARIO := value;
end;

function TEntityGerarParcelas.getID_ORDEM(value: integer): iParcelaOrdem;
begin
  result := self;
  if value = 0 then
    raise exception.create('Informe o código do orçamento.');

  FID_ORDEM := value;

end;

function TEntityGerarParcelas.getJuros(value: string): iParcelaOrdem;
begin
  result := self;
  try
    FJUROS := StrToFloat(value);
  except
    raise exception.create
      ('Informe um valor válido para o campo juros da parcela.');

  end;
end;

function TEntityGerarParcelas.getMulta(value: string): iParcelaOrdem;
begin
  result := self;
  try
    FMULTA := StrToCurr(value);
  except
    raise exception.create('Informe um valor válido para a Multa da parccela.');

  end;

end;

function TEntityGerarParcelas.getNome(value: string): iParcelaOrdem;
begin
  result := self;
  FNome := value;
end;

function TEntityGerarParcelas.getNOME_FUNCIONARIO(value: string): iParcelaOrdem;
begin

  result := self;
  FNOME_FUNCIONARIO := value;

end;

function TEntityGerarParcelas.getObservacao(value: string): iParcelaOrdem;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityGerarParcelas.getPARCELA(value: integer): iParcelaOrdem;
begin
  result := self;
  if value = 0 then
    raise exception.create
      ('Informe um valor superior a 0(Zero) para o número da parcela.');
  FPARCELA := value;

end;

function TEntityGerarParcelas.getPGTO(value: string): iParcelaOrdem;
begin
  result := self;
  FPGTO := value;
end;

function TEntityGerarParcelas.getTOTAL_PARCELAS(value: integer): iParcelaOrdem;
begin
  result := self;
  FTOTAL_PARCELAS := value;

end;

function TEntityGerarParcelas.getValor(value: string): iParcelaOrdem;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityGerarParcelas.getVALOR_PARCELA(value: Currency): iParcelaOrdem;
begin
  result := self;
  if value = 0 then
    raise exception.create
      ('informe um valor deferente de 0(Zero) para o valor da parcela.');
  FVALOR_PARCELA := value;
end;

function TEntityGerarParcelas.getVALOR_TOTAL(value: string): iParcelaOrdem;
begin
  result := self;
  try
    FVALOR_TOTAL := StrToCurr(value);
  except
    raise exception.create
      ('Digite um valor válido para o Valor total da parcela.');
  end;
end;

function TEntityGerarParcelas.Gravar: iParcelaOrdem;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_PARCELAS_ORDEM_ID');

  if FQuery.TQuery.State in [dsEdit] then
  begin
    FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger := funcionarioLogado;
    FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').AsString :=
      NomeFuncionarioLogado;
    FQuery.TQuery.FieldByName('ID').AsInteger := FID;
  end;

  with FQuery.TQuery do
  begin
    FieldByName('ID_ORDEM').AsInteger := FID_ORDEM;
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('TOTAL_PARCELAS').AsInteger := FTOTAL_PARCELAS;
    FieldByName('PARCELA').AsInteger := FPARCELA;
    FieldByName('VALOR_PARCELA').AsCurrency := FVALOR_PARCELA;
    FieldByName('DESCONTO').AsCurrency := FDESCONTO;
    FieldByName('JUROS').AsCurrency := FJUROS;
    FieldByName('MULTA').AsCurrency := FMULTA;
    FieldByName('VALOR_TOTAL').AsCurrency := FVALOR_TOTAL;
    FieldByName('FORMA_PAGAMENTO').AsString := F_FORMA_PAGAMENTO;
    FieldByName('PGTO').AsString := FPGTO;
    FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

    if FDATA_VENCIMENTO <> '  /  /    ' then
      FieldByName('DATA_VENCIMENTO').AsDateTime := StrToDate(FDATA_VENCIMENTO);

    if FDATA_PAGAMENTO <> '  /  /    ' then
      FieldByName('DATA_PAGAMENTO').AsDateTime := StrToDate(FDATA_PAGAMENTO);

    if FHORA_PAGAMENTO <> '  :  :  ' then
      FieldByName('HORA_PAGAMENTO').AsDateTime := StrToTime(FHORA_PAGAMENTO);

  end;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('ID').AsString)
    .gravarLog;

  try
    FQuery.TQuery.Post;
    showmessage('Parcela quitada com sucesso.');
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityGerarParcelas.inserir: iParcelaOrdem;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityGerarParcelas.listarGrid(value: TDataSource): iParcelaOrdem;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'Código';
    FieldByName('ID_ORDEM').DisplayLabel := 'Código OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'Cód. Cliente';
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcelas';
    FieldByName('PARCELA').DisplayLabel := 'Parcela';
    FieldByName('VALOR_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'vencimento';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('VALOR_TOTAL').DisplayLabel := 'Valor total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Pagamento';
    FieldByName('HORA_PAGAMENTO').DisplayLabel := 'Hora do pagamento';
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'Cód. Funcionário';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Furcionário';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('ID_CLIENTE').visible := false;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityGerarParcelas.new: iParcelaOrdem;
begin
  result := self.create;
end;

function TEntityGerarParcelas.nomeTabela(value: string): iParcelaOrdem;
begin
  result := self;
  FTabela := value;
end;

function TEntityGerarParcelas.open(value: string): iParcelaOrdem;
begin
  FQuery.Query(FTabela);
end;

function TEntityGerarParcelas.ordenarGrid(column: TColumn): iParcelaOrdem;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityGerarParcelas.pesquisar: iParcelaOrdem;
begin
  result := self;
end;

function TEntityGerarParcelas.sqlPesquisa: iParcelaOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityGerarParcelas.sqlPesquisaData: iParcelaOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityGerarParcelas.sqlPesquisaEstatica: iParcelaOrdem;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityGerarParcelas.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := StrToDate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data válida.');
  end;
end;

end.
