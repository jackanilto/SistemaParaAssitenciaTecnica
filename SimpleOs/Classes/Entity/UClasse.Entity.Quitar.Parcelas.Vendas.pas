unit UClasse.Entity.Quitar.Parcelas.Vendas;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  UClasse.Calcular.Juros, UClasse.DiasMeses, Vcl.StdCtrls, FireDAC.Comp.Client,
  System.Win.ComObj, RxCurrEdit;

type

  TEntityQuitarParcelaVenda = class(TInterfacedObject, iQuitarParcelasVenda)
  private

    FQuery: iConexaoQuery;
    FQueryParcela: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FCalularDiferencaDiasMes: TCalcularDiaMeses;
    FCalcularJuros: iCalcularJuros;
    FQueryConfigurarParcelas: iConexaoQuery;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigoParcela: integer;
    FDescontoParcela: Currency;
    FDataPagamento: TDate;
    FJurosParcelas: Currency;
    FMultaParcela: Currency;
    FTotalDaParcela: Currency;
    FFormaPagamento: String;

    FID_VENDA: integer;
    FID_CLIENTE: integer;
    FVALOR_VENDA: Currency;
    FQUANTIDADE_PARCELAS: integer;
    FPARCELA: integer;
    FVALOR_DA_PARCELA: Currency;
    FDATA_VENCIMENTO: TDate;

    F_JurosAtraso: real;
    F_MultaAtraso: Currency;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iQuitarParcelasVenda;
    function getCampo(value: string): iQuitarParcelasVenda;
    function getValor(value: string): iQuitarParcelasVenda;
    function getDataInicial(value: TDate): iQuitarParcelasVenda;
    function getDataFinal(value: TDate): iQuitarParcelasVenda;
    function open(value: string): iQuitarParcelasVenda;
    function pesquisar: iQuitarParcelasVenda;
    function ExecSql: iQuitarParcelasVenda;
    function sqlPesquisa: iQuitarParcelasVenda;
    function sqlPesquisaData: iQuitarParcelasVenda;
    function sqlPesquisaEstatica: iQuitarParcelasVenda;

    function abrir: iQuitarParcelasVenda;
    function atualizar: iQuitarParcelasVenda;
    function fecharQuery: iQuitarParcelasVenda;
    function listarGrid(value: TDataSource): iQuitarParcelasVenda;
    function ordenarGrid(column: TColumn): iQuitarParcelasVenda;

    function selecionarParcelaQuitar(value: integer): iQuitarParcelasVenda;
    function getCodigoParcela(value: integer): iQuitarParcelasVenda;
    function getDesconto(value: string): iQuitarParcelasVenda;
    function getJuros(value: string): iQuitarParcelasVenda;
    function getDataPagamento(value: string): iQuitarParcelasVenda;
    function getTotal(value: string): iQuitarParcelasVenda;
    function getFormaPagamento(value: string): iQuitarParcelasVenda;
    function quitarParcela: iQuitarParcelasVenda;
    function estornarParcela(value: integer): iQuitarParcelasVenda;

    function prepararAdicionarParcela: iQuitarParcelasVenda;
    function getID_VENDA(value: integer): iQuitarParcelasVenda;
    function getID_CLIENTE(value: integer): iQuitarParcelasVenda;
    function getVALOR_VENDA(value: string): iQuitarParcelasVenda;
    function getQUANTIDADE_PARCELAS(value: integer): iQuitarParcelasVenda;
    function getPARCELA(value: integer): iQuitarParcelasVenda;
    function getVALOR_DA_PARCELA(value: string): iQuitarParcelasVenda;
    function getDATA_VENCIMENTO(value: string): iQuitarParcelasVenda;

    function excluirParcela(value: integer): iQuitarParcelasVenda;

    function tableQuery: TFDQuery;

    function calcularJuros: string;
    function retornarTotalDeParcelas(value: integer): integer;

    function setJuros(value: TCurrencyEdit): iQuitarParcelasVenda;
    function setMulta(value: TCurrencyEdit): iQuitarParcelasVenda;

    function exportar: iQuitarParcelasVenda;
    procedure validarData(componet: tmaskEdit);

    constructor create;
    destructor destroy; override;
    class function new: iQuitarParcelasVenda;
  end;

implementation

{ TEntityQuitarParcelaVenda }

function TEntityQuitarParcelaVenda.abrir: iQuitarParcelasVenda;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityQuitarParcelaVenda.atualizar: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityQuitarParcelaVenda.calcularJuros: string;
var
  periodo: integer;
  total: Currency;
  valorParcela: Currency;
  totalJuros: Currency;
begin

  result := '0';

  valorParcela := FQuery.TQuery.FieldByName('VALOR_DA_PARCELA').AsCurrency;

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

    FJurosParcelas := totalJuros;
    FMultaParcela := F_MultaAtraso;

    result := currtostr(totalJuros + F_MultaAtraso + valorParcela);

  end
  else
  begin

    FJurosParcelas := 0;
    FMultaParcela := 0;

    result := currtostr(valorParcela);

  end;

end;

constructor TEntityQuitarParcelaVenda.create;
begin

  FTabela := 'VISUALIZAR_PARCELAS_VENDA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryParcela := TConexaoQuery.new.Query('PARCELAS_VENDAS');

  FQueryConfigurarParcelas := TConexaoQuery.new.Query('CONFIGURAR_PARCELA');

  F_JurosAtraso := FQueryConfigurarParcelas.TQuery.FieldByName('JUROS').AsFloat;
  F_MultaAtraso := FQueryConfigurarParcelas.TQuery.FieldByName('MULTA')
    .AsCurrency;

  FCalcularJuros := TCalcularJuros.new;

  FCalularDiferencaDiasMes := TCalcularDiaMeses.create;

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Parcelas das vendas').getCodigoFuncionario
    (funcionarioLogado);

end;

destructor TEntityQuitarParcelaVenda.destroy;
begin
  FreeAndNil(FCalularDiferencaDiasMes);
  inherited;
end;

function TEntityQuitarParcelaVenda.estornarParcela(value: integer)
  : iQuitarParcelasVenda;
begin
  result := self;

  if application.MessageBox('Deseja realmente cancelar o pagamento desta parcela?',
    'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = mryes then
  begin
    FQueryParcela.getCampo('ID').getValor(value.ToString)
      .sqlPesquisaEstatica('PARCELAS_VENDAS');

    if FQueryParcela.TQuery.RecordCount >= 1 then
    begin


    try
      FQueryParcela.TQuery.Edit;

      FQueryParcela.TQuery.FieldByName('JUROS').AsCurrency := 0;
      FQueryParcela.TQuery.FieldByName('MULTA').AsCurrency := 0;
      FQueryParcela.TQuery.FieldByName('DESCONTO').AsCurrency := 0;
      FQueryParcela.TQuery.FieldByName('TOTAL').AsCurrency := 0;
      FQueryParcela.TQuery.FieldByName('DATA_PAGAMENTO').Clear;
      FQueryParcela.TQuery.FieldByName('HORA_PAGAMENTO').Clear;
      FQueryParcela.TQuery.FieldByName('FORMA_PAGAMENTO').AsString := '';
      FQueryParcela.TQuery.FieldByName('PAGO').AsString := 'Nao';

      FQueryParcela.TQuery.Post;

      showmessage('Pagamento da parcela cancelado com sucesso!');

      FGravarLog
              .getNomeRegistro('Parcela: '+FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger.ToString)
              .getCodigoRegistro(+FQuery.TQuery.FieldByName('ID_VENDA').AsInteger)
              .getOperacao('estornada')
              .gravarLog;


    except on e:exception do
    begin
      raise Exception.Create('ERRO! N�o foi poss�vel cancelar o pagamento da parcela selecionada. '+e.Message);
    end;

    end;

    end;
  end;

end;

function TEntityQuitarParcelaVenda.excluirParcela(value: integer)
  : iQuitarParcelasVenda;
var
  F_Query: TFDQuery;
begin

  result := self;

  F_Query := TFDQuery.create(nil);
  F_Query.Connection := DataModule1.Conexao;

  try
    F_Query.Active := false;
    F_Query.SQL.Clear;
    F_Query.SQL.Add('select * from PARCELAS_VENDAS where ID =:i');
    F_Query.ParamByName('i').AsInteger := value;
    F_Query.Active := true;

      if F_Query.RecordCount >= 1 then
      begin

        if F_Query.FieldByName('PAGO').AsString <> 'Sim' then
          begin

            if application.MessageBox('Deseja realmente excluir esta parcela?',
                'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = mryes then
              begin
                F_Query.Delete;

              FGravarLog
                      .getNomeRegistro('Parcela: '+FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger.ToString)
                      .getCodigoRegistro(FQuery.TQuery.FieldByName('ID_VENDA').AsInteger)
                      .getOperacao('deletada')
                      .gravarLog;

              end;
          end
          else
          begin
               MessageDlg('ERRO!. N�o � poss�vel excluir a parcela pois j� esta quitada.', mtError, [mbOk], 0, mbOk);
           end;

      end;
  finally
    FreeAndNil(F_Query);
  end;

end;

function TEntityQuitarParcelaVenda.ExecSql: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityQuitarParcelaVenda.exportar: iQuitarParcelasVenda;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Parcelas das vendas realizadas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Parcela';
  pasta.cells[1, 2] := 'Venda';
  pasta.cells[1, 3] := 'C�d. Cliente';
  pasta.cells[1, 4] := 'Nome do cliente';
  pasta.cells[1, 5] := 'Valor da venda';
  pasta.cells[1, 6] := 'QTDE. Parcelas';
  pasta.cells[1, 7] := 'Parcela';
  pasta.cells[1, 8] := 'Valor da parcela';
  pasta.cells[1, 9] := 'Vencimento';
  pasta.cells[1, 10] := 'Juros';
  pasta.cells[1, 11] := 'Multa';
  pasta.cells[1, 12] := 'Desconto';
  pasta.cells[1, 13] := 'Total';
  pasta.cells[1, 14] := 'Data de pagamento';
  pasta.cells[1, 15] := 'Hora de pagamento';
  pasta.cells[1, 16] := 'Funcion�rio';
  pasta.cells[1, 17] := 'Forma de pagamento';
  pasta.cells[1, 18] := 'PGTO';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_VENDA').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('CLIENTE').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('VALOR_VENDA').AsCurrency;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('QUANTIDADE_PARCELAS').AsInteger;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('PARCELA').AsInteger;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('VALOR_DA_PARCELA').AsCurrency;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('JUROS').AsCurrency;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('MULTA').AsCurrency;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('TOTAL').AsCurrency;

      if FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime
      else
        pasta.cells[linha, 14] := ' ';

      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('HORA_PAGAMENTO').AsDateTime;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('FUNCIONARIO_PGTO').AsInteger;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('FORMA_PAGAMENTO').AsString;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('PAGO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;
function TEntityQuitarParcelaVenda.fecharQuery: iQuitarParcelasVenda;
begin
  FQuery.TQuery.close;
end;

function TEntityQuitarParcelaVenda.getCampo(value: string)
  : iQuitarParcelasVenda;
begin
  result := self;
  FCampo := value;
end;

function TEntityQuitarParcelaVenda.getCodigoParcela(value: integer)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = 0 then
    raise Exception.create('Informe codigo da parcela');

  FCodigoParcela := value;

end;

function TEntityQuitarParcelaVenda.getDataFinal(value: TDate)
  : iQuitarParcelasVenda;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityQuitarParcelaVenda.getDataInicial(value: TDate)
  : iQuitarParcelasVenda;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityQuitarParcelaVenda.getDataPagamento(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = '  /  /    ' then
    FDataPagamento := date
  else
  begin
    try
      FDataPagamento := StrToDate(value);
    except
      begin
        raise Exception.create('Informe uma data de pagamento valida.');
      end;

    end;

  end;

end;

function TEntityQuitarParcelaVenda.getDATA_VENCIMENTO(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create
      ('ERRO! Informe um data para o vencimento da parcela.');

  try
    FDATA_VENCIMENTO := StrToDate(value);
  except
    on e: Exception do
    begin
      raise Exception.create
        ('ERRO! Digite uma data v�lido para o vencimento da parela.');
    end;

  end;

end;

function TEntityQuitarParcelaVenda.getDesconto(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  try
    FDescontoParcela := StrToCurr(value);
  except
    raise Exception.create('Informe um valor de desconto v�lido');

  end;

end;

function TEntityQuitarParcelaVenda.getFormaPagamento(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create('ERRO! Informe o meio de pagamento da parcela.');
  FFormaPagamento := value;

end;

function TEntityQuitarParcelaVenda.getID_CLIENTE(value: integer)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = 0 then
    raise Exception.create
      ('ERRO! Informe o c�digo do cliente que esta inserindo a parela');

  FID_CLIENTE := value;

end;

function TEntityQuitarParcelaVenda.getID_VENDA(value: integer)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = 0 then
    raise Exception.create
      ('ERRO! Informe o c�digo da venda que esta inserindo a parela');

  FID_VENDA := value;

end;

function TEntityQuitarParcelaVenda.getJuros(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  try
    FJurosParcelas := StrToCurr(value);
  except
    raise Exception.create('Informe um valor v�lido para o campo juros');
  end;

end;

function TEntityQuitarParcelaVenda.getPARCELA(value: integer)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = 0 then
    raise Exception.create('ERRO! Informe a parcela que esta inserindo.');

  FPARCELA := value;

end;

function TEntityQuitarParcelaVenda.getQUANTIDADE_PARCELAS(value: integer)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = 0 then
    raise Exception.create
      ('Informe a quantidade de parelas que esta inserindo');

  FQUANTIDADE_PARCELAS := value;

end;

function TEntityQuitarParcelaVenda.getTotal(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  try
    FTotalDaParcela := StrToCurr(value);
  except
    raise Exception.create
      ('Informe um valor v�lido para o campo Total da Parcela');
  end;

end;

function TEntityQuitarParcelaVenda.getValor(value: string)
  : iQuitarParcelasVenda;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityQuitarParcelaVenda.getVALOR_DA_PARCELA(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create
      ('ERRO. Informe o valor da parcela que esa inseriendo.');

  try
    FVALOR_DA_PARCELA := StrToCurr(value);
  except
    on e: Exception do
    begin
      raise Exception.create('Informe um valor v�lido para o valor da parcela');
    end;

  end;

end;

function TEntityQuitarParcelaVenda.getVALOR_VENDA(value: string)
  : iQuitarParcelasVenda;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create
      ('ERRO. Informe o valor da parcela que esa inseriendo.');

  try
    FVALOR_VENDA := StrToCurr(value);
  except
    on e: Exception do
    begin
      raise Exception.create('Informe um valor v�lido para o valor da venda');
    end;

  end;

end;

function TEntityQuitarParcelaVenda.listarGrid(value: TDataSource)
  : iQuitarParcelasVenda;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_PARCELA').DisplayLabel := 'C�d. Parcela';
    FieldByName('ID_VENDA').DisplayLabel := 'Venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Nome do cliente';
    FieldByName('VALOR_VENDA').DisplayLabel := 'Valor da venda';
    FieldByName('QUANTIDADE_PARCELAS').DisplayLabel := 'Qtde. Parcelas';
    FieldByName('PARCELA').DisplayLabel := 'Parcelas';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('TOTAL').DisplayLabel := 'Total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Data de pagamento';
    FieldByName('HORA_PAGAMENTO').DisplayLabel := 'Hora do pagamento';
    FieldByName('FUNCIONARIO_PGTO').DisplayLabel := 'Funcion�rio';
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('PAGO').DisplayLabel := 'Pago';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('CLIENTE').DisplayWidth := 35;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityQuitarParcelaVenda.new: iQuitarParcelasVenda;
begin
  result := self.create;
end;

function TEntityQuitarParcelaVenda.nomeTabela(value: string)
  : iQuitarParcelasVenda;
begin
  result := self;
  FTabela := value;
end;

function TEntityQuitarParcelaVenda.open(value: string): iQuitarParcelasVenda;
begin
  FQuery.Query(FTabela);
end;

function TEntityQuitarParcelaVenda.ordenarGrid(column: TColumn)
  : iQuitarParcelasVenda;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityQuitarParcelaVenda.pesquisar: iQuitarParcelasVenda;
begin
  result := self;
end;

function TEntityQuitarParcelaVenda.prepararAdicionarParcela
  : iQuitarParcelasVenda;
begin
  result := self;

  FQueryParcela.TQuery.Insert;

  FQueryParcela.TQuery.FieldByName('ID').AsInteger :=
    FQueryParcela.codigoCadastro('SP_GEN_PARCELAS_VENDAS_ID');

  with FQueryParcela.TQuery do
  begin
    FieldByName('ID_VENDA').AsInteger := FID_VENDA;
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('VALOR_VENDA').AsCurrency := FVALOR_VENDA;
    FieldByName('QUANTIDADE_PARCELAS').AsInteger := FQUANTIDADE_PARCELAS;
    FieldByName('PARCELA').AsInteger := FPARCELA;
    FieldByName('VALOR_DA_PARCELA').AsCurrency := FVALOR_DA_PARCELA;
    FieldByName('DATA_VENCIMENTO').AsDateTime := FDATA_VENCIMENTO;
    FieldByName('PAGO').AsString := 'Nao';
    FieldByName('FUNCIONARIO_PGTO').AsInteger := funcionarioLogado;
  end;

  FQueryParcela.TQuery.Post;
  ShowMessage('Parcela adicionada com sucesso.');

        FGravarLog
              .getNomeRegistro('Parcela: '+FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger.ToString)
              .getCodigoRegistro(FQuery.TQuery.FieldByName('ID_VENDA').AsInteger)
              .getOperacao('adicionando')
              .gravarLog;

end;

function TEntityQuitarParcelaVenda.quitarParcela: iQuitarParcelasVenda;
begin

  result := self;

  if FQueryParcela.TQuery.RecordCount >= 1 then
  begin

    FQueryParcela.TQuery.Edit;

    FQueryParcela.TQuery.FieldByName('JUROS').AsFloat := FJurosParcelas;
    FQueryParcela.TQuery.FieldByName('MULTA').AsCurrency := FMultaParcela;
    FQueryParcela.TQuery.FieldByName('DESCONTO').AsCurrency := FDescontoParcela;
    FQueryParcela.TQuery.FieldByName('TOTAL').AsCurrency := FTotalDaParcela;
    FQueryParcela.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime :=
      FDataPagamento;
    FQueryParcela.TQuery.FieldByName('FORMA_PAGAMENTO').AsString :=
      FFormaPagamento;
    FQueryParcela.TQuery.FieldByName('HORA_PAGAMENTO').AsDateTime := time;
    FQueryParcela.TQuery.FieldByName('PAGO').AsString := 'Sim';

    try
      FQueryParcela.TQuery.Post;

            FGravarLog
              .getNomeRegistro('Parcela: '+FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger.ToString)
              .getCodigoRegistro(FQuery.TQuery.FieldByName('ID_VENDA').AsInteger)
              .getOperacao('quitada')
              .gravarLog;

    except
      on e: Exception do
      begin
        raise Exception.create('Houve um erro ao tentar quitar esta parcela. ' +
          e.Message);
      end;

    end;
  end;

end;

function TEntityQuitarParcelaVenda.retornarTotalDeParcelas
  (value: integer): integer;
var
  F_Query: TFDQuery;
begin

  result := 0;

  F_Query := TFDQuery.create(nil);
  F_Query.Connection := DataModule1.Conexao;

  try
    F_Query.Active := false;
    F_Query.SQL.Clear;
    F_Query.SQL.Add
      ('select * from VISUALIZAR_PARCELAS_VENDA where ID_VENDA =:v');
    F_Query.ParamByName('v').AsInteger := value;
    F_Query.Active := true;

    result := F_Query.RecordCount;
  finally
    FreeAndNil(F_Query);
  end;

end;

function TEntityQuitarParcelaVenda.selecionarParcelaQuitar(value: integer)
  : iQuitarParcelasVenda;
begin

  result := self;

  FQueryParcela.getCampo('ID').getValor(IntToStr(FCodigoParcela))
    .sqlPesquisaEstatica('PARCELAS_VENDAS');

end;

function TEntityQuitarParcelaVenda.setJuros(value: TCurrencyEdit): iQuitarParcelasVenda;
begin
  result := self;
  value.Text := currtostr(FJurosParcelas);
end;

function TEntityQuitarParcelaVenda.setMulta(value: TCurrencyEdit): iQuitarParcelasVenda;
begin
  result := self;
  value.Text := currtostr(FMultaParcela);
end;

function TEntityQuitarParcelaVenda.sqlPesquisa: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityQuitarParcelaVenda.sqlPesquisaData: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityQuitarParcelaVenda.sqlPesquisaEstatica: iQuitarParcelasVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TEntityQuitarParcelaVenda.tableQuery: TFDQuery;
begin
  result := FQuery.TQuery;
end;

procedure TEntityQuitarParcelaVenda.validarData(componet: tmaskEdit);
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
