unit UClasse.Entity.Contas.APagar;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, System.Variants,
  ComOBJ;

type

  TEntityContasAPagar = class(TInterfacedObject, iCadastroContasAPagar)
  private

    FQuery: iConexaoQuery;
    FEntityQuery: TFDQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;
    FCONTA: string;
    FDATA_VENCIMENTO: TDate;
    FVALORCONTA: Currency;
    FJUROS: real;
    FMULTA: Currency;
    FDESCONTO: Currency;
    FVALOR_TOTAL: Currency;
    FDATA_PAGAMENTO: string;
    FPAGO: String;
    F_FUNCIONARIO: integer;
    FOBSERVACAO: String;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iCadastroContasAPagar;
    function getCampo(value: string): iCadastroContasAPagar;
    function getValor(value: string): iCadastroContasAPagar;
    function getDataInicial(value: TDate): iCadastroContasAPagar;
    function getDataFinal(value: TDate): iCadastroContasAPagar;
    function open(value: string): iCadastroContasAPagar;
    function pesquisar: iCadastroContasAPagar;
    function ExecSql: iCadastroContasAPagar;
    function sqlPesquisa: iCadastroContasAPagar;
    function sqlPesquisaData: iCadastroContasAPagar;
    function sqlPesquisaEstatica: iCadastroContasAPagar;

    function abrir: iCadastroContasAPagar;
    function inserir: iCadastroContasAPagar;
    function Gravar: iCadastroContasAPagar;
    function deletar: iCadastroContasAPagar;
    function atualizar: iCadastroContasAPagar;
    function editar: iCadastroContasAPagar;
    function cancelar: iCadastroContasAPagar;
    function fecharQuery: iCadastroContasAPagar;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroContasAPagar;
    function ordenarGrid(column: TColumn): iCadastroContasAPagar;

    function getCodigo(value: integer): iCadastroContasAPagar;
    function getConta(value: string): iCadastroContasAPagar;
    function getDataVencimento(value: string): iCadastroContasAPagar;
    function getValorConta(value: string): iCadastroContasAPagar;
    function getJurosConta(value: string): iCadastroContasAPagar;
    function getMulta(value: string): iCadastroContasAPagar;
    function getDesconto(value: string): iCadastroContasAPagar;
    function getValorTotalConta(value: string): iCadastroContasAPagar;
    function getDataPagamento(value: string): iCadastroContasAPagar;
    function getPGTO(value: string): iCadastroContasAPagar;
    function getFuncionario(value: integer): iCadastroContasAPagar;
    function getObservacao(value: string): iCadastroContasAPagar;

    function exportar: iCadastroContasAPagar;
    function quitarParcela:iCadastroContasAPagar;

    constructor create;
    destructor destroy; override;
    class function new: iCadastroContasAPagar;
  end;

implementation

{ TEntityContasAPagar }

function TEntityContasAPagar.abrir: iCadastroContasAPagar;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityContasAPagar.atualizar: iCadastroContasAPagar;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityContasAPagar.cancelar: iCadastroContasAPagar;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityContasAPagar.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityContasAPagar.create;
begin
  FTabela := 'CONTAS_A_PAGAR';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro contas a pagar').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

function TEntityContasAPagar.deletar: iCadastroContasAPagar;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('conta').AsString)
        .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('deletando').gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityContasAPagar.destroy;
begin

  inherited;
end;

function TEntityContasAPagar.editar: iCadastroContasAPagar;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('conta').AsString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityContasAPagar.ExecSql: iCadastroContasAPagar;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityContasAPagar.exportar: iCadastroContasAPagar;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório Contas a pagar';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Código';
  pasta.cells[1, 2] := 'Conta';
  pasta.cells[1, 3] := 'Data vencimento';
  pasta.cells[1, 4] := 'Valor';
  pasta.cells[1, 5] := 'Juros';
  pasta.cells[1, 6] := 'Multa';
  pasta.cells[1, 7] := 'Desconto';
  pasta.cells[1, 8] := 'Valor total';
  pasta.cells[1, 9] := 'Data de pagamento';
  pasta.cells[1, 10] := 'Pago';
  pasta.cells[1, 11] := 'Funcionário';
  pasta.cells[1, 12] := 'Observação';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('id').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('conta').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('VALOR').AsCurrency;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('JUROS').AsFloat;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('MULTA').AsCurrency;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('VALOR_TOTAL').AsCurrency;

      if FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime
      else
        pasta.cells[linha, 9] := ' ';

      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('PAGO').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').AsInteger;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityContasAPagar.fecharQuery: iCadastroContasAPagar;
begin
  FQuery.TQuery.close;
end;

function TEntityContasAPagar.getCampo(value: string): iCadastroContasAPagar;
begin
  result := self;
  FCampo := value;
end;

function TEntityContasAPagar.getCodigo(value: integer): iCadastroContasAPagar;
begin
  result := self;
  FCodigo := value;
end;

function TEntityContasAPagar.getConta(value: string): iCadastroContasAPagar;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe um nome para a conta.');
  FCONTA := value;
end;

function TEntityContasAPagar.getDataFinal(value: TDate): iCadastroContasAPagar;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityContasAPagar.getDataInicial(value: TDate)
  : iCadastroContasAPagar;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityContasAPagar.getDataPagamento(value: string)
  : iCadastroContasAPagar;
begin

  result := self;

  if value = '  /  /    ' then
    FDATA_PAGAMENTO := ''
  else
    FDATA_PAGAMENTO := value;

end;

function TEntityContasAPagar.getDataVencimento(value: string)
  : iCadastroContasAPagar;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe uma data de vencimento.');
  try
    FDATA_VENCIMENTO := StrToDate(value);
  except
    on e: Exception do
      raise Exception.create
        ('Informe um valor válido para a data de vencimento');

  end;
end;

function TEntityContasAPagar.getDesconto(value: string): iCadastroContasAPagar;
begin

  result := self;

  if value = EmptyStr then
    FDESCONTO := 0;

  try
    FDESCONTO := StrToCurr(value);
  except
    on e: Exception do
      raise Exception.create('Informe um valor válido para o desconto.');
  end;

end;

function TEntityContasAPagar.getFuncionario(value: integer)
  : iCadastroContasAPagar;
begin
  result := self;
  F_FUNCIONARIO := funcionarioLogado;
end;

function TEntityContasAPagar.getJurosConta(value: string)
  : iCadastroContasAPagar;
begin

  result := self;

  if value = EmptyStr then
    FJUROS := 0;

  try
    FJUROS := strtofloat(value);
  except
    on e: Exception do
    begin
      raise Exception.create('Informe um valor válido para o juros');
    end;

  end;

end;

function TEntityContasAPagar.getMulta(value: string): iCadastroContasAPagar;
begin

  result := self;

  if value = EmptyStr then
    FMULTA := 0;

  try
    FMULTA := StrToCurr(value);
  except
    on e: Exception do
      raise Exception.create('Informe um valor válido para a multa.');

  end;
end;

function TEntityContasAPagar.getObservacao(value: string)
  : iCadastroContasAPagar;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityContasAPagar.getPGTO(value: string): iCadastroContasAPagar;
begin

  result := self;

  if value = EmptyStr then
    FPAGO := 'Nao'
  else
    FPAGO := value;
end;

function TEntityContasAPagar.getValor(value: string): iCadastroContasAPagar;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityContasAPagar.getValorConta(value: string)
  : iCadastroContasAPagar;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe o valor da conta.');
  try
    FVALORCONTA := StrToCurr(value);
  except
    on e: Exception do
      raise Exception.create('Informe um valor válido para a conta');

  end;
end;

function TEntityContasAPagar.getValorTotalConta(value: string)
  : iCadastroContasAPagar;
begin

  result := self;

  if value = EmptyStr then
    FVALOR_TOTAL := 0;

  try
    FVALOR_TOTAL := StrToCurr(value);
  except
    on e: Exception do
      raise Exception.create('Informe um valor válido para o total da conta.');
  end;

end;

function TEntityContasAPagar.Gravar: iCadastroContasAPagar;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_CONTAS_A_PAGAR_ID');

  FQuery.TQuery.FieldByName('conta').AsString := FCONTA;
  FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime := FDATA_VENCIMENTO;
  FQuery.TQuery.FieldByName('VALOR').AsCurrency := FVALORCONTA;
  FQuery.TQuery.FieldByName('JUROS').AsFloat := FJUROS;
  FQuery.TQuery.FieldByName('MULTA').AsCurrency := FMULTA;
  FQuery.TQuery.FieldByName('DESCONTO').AsCurrency := FDESCONTO;
  FQuery.TQuery.FieldByName('VALOR_TOTAL').AsCurrency := FVALOR_TOTAL;

  if FDATA_PAGAMENTO <> EmptyStr then
    FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime := StrToDate(FDATA_PAGAMENTO);

  FQuery.TQuery.FieldByName('PAGO').AsString := FPAGO;
  FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').AsInteger := funcionarioLogado;
  FQuery.TQuery.FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('conta').AsString)
    .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

  try
    FQuery.TQuery.Post;
  except
    on e: Exception do
    begin
      raise Exception.create('ERRO! Não foi possíve salvar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityContasAPagar.inserir: iCadastroContasAPagar;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo');
end;

function TEntityContasAPagar.listarGrid(value: TDataSource)
  : iCadastroContasAPagar;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'Código';
  FQuery.TQuery.FieldByName('conta').DisplayLabel := 'Conta';
  FQuery.TQuery.FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
  FQuery.TQuery.FieldByName('VALOR').DisplayLabel := 'Valor';
  FQuery.TQuery.FieldByName('JUROS').DisplayLabel := 'Juros';
  FQuery.TQuery.FieldByName('MULTA').DisplayLabel := 'Multa';
  FQuery.TQuery.FieldByName('DESCONTO').DisplayLabel := 'Desconto';
  FQuery.TQuery.FieldByName('VALOR_TOTAL').DisplayLabel := 'Valor total';
  FQuery.TQuery.FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Pagamento';
  FQuery.TQuery.FieldByName('PAGO').DisplayLabel := 'Pago';
  FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').DisplayLabel :=
    'Funcionário';
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

  FQuery.TQuery.FieldByName('VALOR').CurValue;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityContasAPagar.new: iCadastroContasAPagar;
begin
  result := self.create;
end;

function TEntityContasAPagar.nomeTabela(value: string): iCadastroContasAPagar;
begin
  result := self;
  FTabela := value;
end;

function TEntityContasAPagar.open(value: string): iCadastroContasAPagar;
begin
  FQuery.Query(FTabela);
end;

function TEntityContasAPagar.ordenarGrid(column: TColumn)
  : iCadastroContasAPagar;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityContasAPagar.pesquisar: iCadastroContasAPagar;
begin
  result := self;
end;

function TEntityContasAPagar.quitarParcela: iCadastroContasAPagar;
begin

  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin

    if FQuery.TQuery.FieldByName('PAGO').AsString = 'Nao' then
    begin

        FQuery.TQuery.Edit;

        FQuery.TQuery.FieldByName('VALOR').AsCurrency := FVALORCONTA;
        FQuery.TQuery.FieldByName('JUROS').AsFloat := FJUROS;
        FQuery.TQuery.FieldByName('MULTA').AsCurrency := FMULTA;
        FQuery.TQuery.FieldByName('DESCONTO').AsCurrency := FDESCONTO;
        FQuery.TQuery.FieldByName('VALOR_TOTAL').AsCurrency := FVALOR_TOTAL;

        if FDATA_PAGAMENTO <> EmptyStr then
          FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime := StrToDate(FDATA_PAGAMENTO)
        else
          raise Exception.Create('ERRO! Informe a data de pagamento.');

        FQuery.TQuery.FieldByName('PAGO').AsString := 'Sim';
        FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').AsInteger := funcionarioLogado;
        FQuery.TQuery.FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

        FGravarLog
                .getOperacao('quitar parcela: ')
                .getNomeRegistro(FQuery.TQuery.FieldByName('conta').AsString)
                .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
                .gravarLog;

        try
          FQuery.TQuery.Post;
          ShowMessage('Operação realizada com sucesso!');
        except on e:exception do
        begin
          MessageDlg('ERRO. Não foi possível quitar a parcela ' +
            e.Message, mtError, [mbOk], 0, mbOk);
          abort;
        end;

        end;
    end;


  end;

end;

function TEntityContasAPagar.sqlPesquisa: iCadastroContasAPagar;
begin
  result := self;
  if FValor <> EmptyStr then
    FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityContasAPagar.sqlPesquisaData: iCadastroContasAPagar;
begin
  result := self;
  FQuery.getCampo(FCampo).getDataInicial(FDataInicial).getDataFinal(FDataFinal)
    .sqlPesquisaData(FTabela);
end;

function TEntityContasAPagar.sqlPesquisaEstatica: iCadastroContasAPagar;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
