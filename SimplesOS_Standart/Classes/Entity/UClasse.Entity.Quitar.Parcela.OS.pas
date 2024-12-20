unit UClasse.Entity.Quitar.Parcela.OS;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  UClasse.DiasMeses, Vcl.StdCtrls, System.Win.ComObj, RxCurrEdit;

type

  TEntityQuitarParcelaOS = class(TInterfacedObject, iQuitarParcelaOS)
  private

    FQuery: iConexaoQuery;
    FQueryConfigPacelas: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FCalularDiferencaDiasMes: TCalcularDiaMeses;
    FEstornarParcela: iConexaoQuery;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    F_JurosPorAtraso: Real;
    F_MultaPorAtraso: Currency;
    FtotalAPagar: Currency;

    FJurosParcela: Currency;
    FMultaParcela: Currency;

    FDESCONTO: Currency;
    FJUROS: Currency;
    FMULTA: Currency;
    FVALOR_TOTAL: Currency;
    FDATA_PAGAMENTO: TDate;
    FHORA_PAGAMENTO: TTime;
    FFORMA_PAGAMENTO: String;
    FPGTO: String;

    FAdicionarValorParcela: Currency;
    FAdicionarDataVencimentoParcela: TDate;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iQuitarParcelaOS;
    function getCampo(value: string): iQuitarParcelaOS;
    function getValor(value: string): iQuitarParcelaOS;
    function getDataInicial(value: TDate): iQuitarParcelaOS;
    function getDataFinal(value: TDate): iQuitarParcelaOS;
    function open(value: string): iQuitarParcelaOS;
    function pesquisar: iQuitarParcelaOS;
    function ExecSql: iQuitarParcelaOS;
    function sqlPesquisa: iQuitarParcelaOS;
    function sqlPesquisaData: iQuitarParcelaOS;
    function sqlPesquisaEstatica: iQuitarParcelaOS;

    function abrir: iQuitarParcelaOS;
    function atualizar: iQuitarParcelaOS;
    function fecharQuery: iQuitarParcelaOS;
    function listarGrid(value: TDataSource): iQuitarParcelaOS;
    function ordenarGrid(column: TColumn): iQuitarParcelaOS;

    function CalularPagamento: iQuitarParcelaOS;
    function setTotalParcela(value: TCurrencyEdit): iQuitarParcelaOS;
    function setTotalJurosParcela(value: TCurrencyEdit): iQuitarParcelaOS;
    function setTotalMultaParcela(value: TCurrencyEdit): iQuitarParcelaOS;

    function getDESCONTO(value: string): iQuitarParcelaOS;
    function getJUROS(value: string): iQuitarParcelaOS;
    function getMULTA(value: string): iQuitarParcelaOS;
    function getVALOR_TOTAL(value: string): iQuitarParcelaOS;
    function getDATA_PAGAMENTO(value: string): iQuitarParcelaOS;
    function getHORA_PAGAMENTO(value: string): iQuitarParcelaOS;
    function getFORMA_PAGAMENTO(value: string): iQuitarParcelaOS;
    function getPGTO(value: string): iQuitarParcelaOS;

    function selecionarParcelaQuitar(value: integer): iQuitarParcelaOS;
    function estornarParcela(value: integer): iQuitarParcelaOS;

    function adicionarParcela: iQuitarParcelaOS;
    function salvarAlteracoesParcela(const valor:currency; const vencimento:TDate;
              const parcela:integer):iQuitarParcelaOS;// Incluido em 25/10/2020

    function getValorParcela(value: string): iQuitarParcelaOS;
    function getDataVencimento(value: string): iQuitarParcelaOS;

    function excluir(value: integer): iQuitarParcelaOS;

    function exportar: iQuitarParcelaOS;
    function validarData(componet: tmaskEdit): iQuitarParcelaOS;

    constructor create;
    destructor destroy; override;
    class function new: iQuitarParcelaOS;
  end;

implementation

{ TEntityQuitarParcelaOS }

function TEntityQuitarParcelaOS.abrir: iQuitarParcelaOS;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityQuitarParcelaOS.adicionarParcela: iQuitarParcelaOS;
var
  FAdicionarParcela: iConexaoQuery;
begin

  result := self;

  FAdicionarParcela := TConexaoQuery.new.Query('PARCELAS_ORDEM');

  FAdicionarParcela.TQuery.Insert;

  FAdicionarParcela.TQuery.FieldByName('ID').AsInteger :=
    FAdicionarParcela.codigoCadastro('SP_GEN_PARCELAS_ORDEM_ID');

  FAdicionarParcela.TQuery.FieldByName('ID_ORDEM').AsInteger :=
    FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;

  FAdicionarParcela.TQuery.FieldByName('ID_CLIENTE').AsInteger :=
    FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;

  FAdicionarParcela.TQuery.FieldByName('TOTAL_PARCELAS').AsInteger :=
    FQuery.TQuery.FieldByName('TOTAL_PARCELAS').AsInteger + 1;

  FAdicionarParcela.TQuery.FieldByName('PARCELA').AsInteger :=
    FQuery.TQuery.FieldByName('TOTAL_PARCELAS').AsInteger + 1;

  FAdicionarParcela.TQuery.FieldByName('VALOR_PARCELA').AsCurrency :=
    FAdicionarValorParcela;
  FAdicionarParcela.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime :=
    FAdicionarDataVencimentoParcela;
  FAdicionarParcela.TQuery.FieldByName('PGTO').AsString := 'Nao';


  try

    FAdicionarParcela.TQuery.Post;
    showmessage('Parcela adicionada com sucesso!!!');

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('CLIENTE').AsString +
      ' Parcela: ' + FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger.ToString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger)
      .getOperacao('parcela adicionada').gravarLog;

  except
    on e: exception do
    begin
      MessageDlg('ERRO. Ocorreu um erro ao adicionar a parcela . ' + e.Message,
        mtError, [mbOk], 0, mbOk);
    end;

  end;

end;

function TEntityQuitarParcelaOS.atualizar: iQuitarParcelaOS;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

constructor TEntityQuitarParcelaOS.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_OS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Quitar parcela OS').getCodigoFuncionario
    (funcionarioLogado);

  FCalularDiferencaDiasMes := TCalcularDiaMeses.create;

  FQueryConfigPacelas := TConexaoQuery.new.Query('CONFIGURAR_PARCELA');

  F_JurosPorAtraso := FQueryConfigPacelas.TQuery.FieldByName('JUROS').AsFloat;
  F_MultaPorAtraso := FQueryConfigPacelas.TQuery.FieldByName('MULTA')
    .AsCurrency;

end;

function TEntityQuitarParcelaOS.getDataVencimento(value: string)
  : iQuitarParcelaOS;
begin

  result := self;

  try
    FAdicionarDataVencimentoParcela := StrToDate(value);
  except
    on e: exception do
    begin
      MessageDlg('ERRO. Informe a data de vencimento v�lida. ' + e.Message,
        mtError, [mbOk], 0, mbOk);
    end;

  end;

end;

destructor TEntityQuitarParcelaOS.destroy;
begin
  FreeAndNil(FCalularDiferencaDiasMes);
  inherited;
end;

function TEntityQuitarParcelaOS.estornarParcela(value: integer)
  : iQuitarParcelaOS;
begin

  result := self;

  if application.MessageBox
    ('Deseja realmente Cancelar o pagamento desta parcela ',
    'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
  begin

    FEstornarParcela := TConexaoQuery.new.Query('PARCELAS_ORDEM');

    FEstornarParcela.TQuery.Active := false;
    FEstornarParcela.TQuery.SQL.Clear;
    FEstornarParcela.TQuery.SQL.Add
      ('select * from PARCELAS_ORDEM where ID =:i');
    FEstornarParcela.TQuery.ParamByName('i').AsInteger := value;
    FEstornarParcela.TQuery.Active := true;

    if FEstornarParcela.TQuery.RecordCount >= 1 then
    begin

      if FEstornarParcela.TQuery.FieldByName('PGTO').AsString = 'Sim' then
      begin
        FEstornarParcela.TQuery.Edit;

        FEstornarParcela.TQuery.FieldByName('DESCONTO').Clear;
        FEstornarParcela.TQuery.FieldByName('JUROS').Clear;
        FEstornarParcela.TQuery.FieldByName('MULTA').Clear;
        FEstornarParcela.TQuery.FieldByName('VALOR_TOTAL').Clear;
        FEstornarParcela.TQuery.FieldByName('DATA_PAGAMENTO').Clear;
        FEstornarParcela.TQuery.FieldByName('HORA_PAGAMENTO').Clear;
        FEstornarParcela.TQuery.FieldByName('FORMA_PAGAMENTO').Clear;
        FEstornarParcela.TQuery.FieldByName('PGTO').AsString := 'Nao';

        try
          FEstornarParcela.TQuery.Post;
          showmessage('Pagamento da parcela cancelada com sucesso!!!');

          FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('CLIENTE')
            .AsString + ' Parcela: ' + FQuery.TQuery.FieldByName('ID_PARCELA')
            .AsInteger.ToString).getCodigoRegistro
            (FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger)
            .getOperacao('estornada').gravarLog;

        except
          on e: exception do
          begin
            MessageDlg
              ('ERRO. Ocorreu um erro ao tentar estornada esta parcela. ' +
              e.Message, mtError, [mbOk], 0, mbOk);
          end;

        end;

      end
      else
      begin
        MessageDlg('ERRO. Esta parcela j� foi estornada. ', mtError, [mbOk], 0, mbOk);
      end;
    end;
  end;

end;

function TEntityQuitarParcelaOS.excluir(value: integer): iQuitarParcelaOS;
var
  FDeletarParcela: iConexaoQuery;
begin

  result := self;

  FDeletarParcela := TConexaoQuery.new.Query('PARCELAS_ORDEM');

  if application.MessageBox('Deseja excluir esta parcela?',
    'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
  begin

    FDeletarParcela.TQuery.Active := false;
    FDeletarParcela.TQuery.SQL.Clear;
    FDeletarParcela.TQuery.SQL.Add('select * from PARCELAS_ORDEM where ID =:i');
    FDeletarParcela.TQuery.ParamByName('i').AsInteger := value;
    FDeletarParcela.TQuery.Active := true;

    if FDeletarParcela.TQuery.FieldByName('PGTO').AsString <> 'Sim' then
      begin
        FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('CLIENTE').AsString +
          ' Parcela: ' + FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger.ToString)
          .getCodigoRegistro(FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger)
          .getOperacao('deletada').gravarLog;

        FDeletarParcela.TQuery.Delete;
        showmessage('Parcela excluida com sucesso!!!');
      end
      else
      begin
        MessageDlg('ERRO. N�o � poss�vel excluir esta parcela pois a mesma j� esta quitada.',
          mtError, [mbOk], 0, mbOk)
      end;

  end;

end;

function TEntityQuitarParcelaOS.ExecSql: iQuitarParcelaOS;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityQuitarParcelaOS.exportar: iQuitarParcelaOS;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Parcelas OS';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Parcela';
  pasta.cells[1, 2] := 'OS';
  pasta.cells[1, 3] := 'C�d. Cliente';
  pasta.cells[1, 4] := 'Nome do cliente';
  pasta.cells[1, 5] := 'Total de parcelas';
  pasta.cells[1, 6] := 'Parcela';
  pasta.cells[1, 7] := 'Valor da parcela';
  pasta.cells[1, 8] := 'Vencimento';
  pasta.cells[1, 9] := 'Desconto';
  pasta.cells[1, 10] := 'Juros';
  pasta.cells[1, 11] := 'Multa';
  pasta.cells[1, 12] := 'Valor total';
  pasta.cells[1, 13] := 'Data de pagamento';
  pasta.cells[1, 14] := 'Hor�rio de pagamento';
  pasta.cells[1, 15] := 'Forma de pagamento';
  pasta.cells[1, 16] := 'Pago';
  pasta.cells[1, 17] := 'C�d. Funcion�rio';
  pasta.cells[1, 18] := 'Nome funcion�rio';
  pasta.cells[1, 20] := 'Observa��o';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_PARCELA')
        .AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('ID_CLIENTE')
        .AsInteger;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('CLIENTE').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('TOTAL_PARCELAS')
        .AsInteger;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('PARCELA').AsInteger;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('VALOR_PARCELA')
        .AsCurrency;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('DATA_VENCIMENTO')
        .AsDateTime;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('JUROS').AsCurrency;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('MULTA').AsCurrency;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('VALOR_TOTAL')
        .AsCurrency;

      if FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime <> StrToDate
        ('30/12/1899') then
      begin
        pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('DATA_PAGAMENTO')
          .AsDateTime;
        pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('HORA_PAGAMENTO')
          .AsDateTime;
      end
      else
      begin
        pasta.cells[linha, 13] := ' ';
        pasta.cells[linha, 14] := ' ';
      end;

      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName
        ('FORMA_PAGAMENTO').AsString;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('PGTO').AsString;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('ID_FUNCIONARIO')
        .AsInteger;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName
        ('NOME_FUNCIONARIO').AsString;
      pasta.cells[linha, 19] := FQuery.TQuery.FieldByName('OBSERVACAO')
        .AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityQuitarParcelaOS.CalularPagamento: iQuitarParcelaOS;
var
  periodo: integer;
  total: Currency;
  valorParcela: Currency;
  totalJuros: Currency;
begin

  result := self;
  valorParcela := FQuery.TQuery.FieldByName('VALOR_PARCELA').AsCurrency;

  if date > FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime then
  begin

    periodo := FCalularDiferencaDiasMes.DifDiasMeses
      (FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime, date);

    if periodo >= 1 then
    begin
      total := valorParcela * (F_JurosPorAtraso / 100);
      total := valorParcela + (total * periodo);
      totalJuros := total - valorParcela;
    end
    else if periodo = 0 then
    begin
      total := valorParcela * (F_JurosPorAtraso / 100);
      total := valorParcela + (total * 1);
      totalJuros := total - valorParcela;
    end;

    FJurosParcela := totalJuros;
    FMultaParcela := F_MultaPorAtraso;

    FtotalAPagar := totalJuros + F_MultaPorAtraso + valorParcela;

  end
  else
  begin

    FJurosParcela := 0;
    FMultaParcela := 0;

    FtotalAPagar := valorParcela;

  end;

end;

function TEntityQuitarParcelaOS.fecharQuery: iQuitarParcelaOS;
begin
  FQuery.TQuery.close;
end;

function TEntityQuitarParcelaOS.getCampo(value: string): iQuitarParcelaOS;
begin
  result := self;
  FCampo := value;
end;

function TEntityQuitarParcelaOS.getDataFinal(value: TDate): iQuitarParcelaOS;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityQuitarParcelaOS.getDataInicial(value: TDate): iQuitarParcelaOS;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityQuitarParcelaOS.getDATA_PAGAMENTO(value: string)
  : iQuitarParcelaOS;
begin

  result := self;

  try
    FDATA_PAGAMENTO := StrToDate(value);
  except
    on e: exception do
    begin
      MessageDlg('ERRO. Insira uma data v�lida.' + e.Message, mtError,
        [mbOk], 0, mbOk);
    end;

  end;

end;

function TEntityQuitarParcelaOS.getDESCONTO(value: string): iQuitarParcelaOS;
begin

  result := self;

  try
    FDESCONTO := StrToCurr(value);
  except
    on e: exception do
    begin
      MessageDlg('ERRO. Informe um valor de desconto v�lido.' + e.Message,
        mtError, [mbOk], 0, mbOk);
    end;

  end;

end;

function TEntityQuitarParcelaOS.getFORMA_PAGAMENTO(value: string)
  : iQuitarParcelaOS;
begin

  result := self;

  if value = EmptyStr then
  begin
    MessageDlg('ERRO. Informe a forma de pagamento da parcela.', mtError,
      [mbOk], 0, mbOk);
    abort;
  end;

  FFORMA_PAGAMENTO := value;

end;

function TEntityQuitarParcelaOS.getHORA_PAGAMENTO(value: string)
  : iQuitarParcelaOS;
begin

  result := self;

  try
    FHORA_PAGAMENTO := StrToTime(value);
  except
    on e: exception do
    begin
      MessageDlg('ERRO. Insrira um hor�rio de pagamento v�lido.' + e.Message,
        mtError, [mbOk], 0, mbOk);
    end;

  end;

end;

function TEntityQuitarParcelaOS.getJUROS(value: string): iQuitarParcelaOS;
begin

  result := self;

  try
    FJUROS := StrToCurr(value);
  except
    on e: exception do
    begin
      MessageDlg('ERRO. Informe um valor de juros v�lido.' + e.Message, mtError,
        [mbOk], 0, mbOk);
    end;

  end;

end;

function TEntityQuitarParcelaOS.getMULTA(value: string): iQuitarParcelaOS;
begin

  result := self;

  try
    FMULTA := StrToCurr(value);
  except
    on e: exception do
    begin
      MessageDlg('ERRO. Informe um valor para a multa v�lido.' + e.Message,
        mtError, [mbOk], 0, mbOk);
    end;

  end;

end;

function TEntityQuitarParcelaOS.getPGTO(value: string): iQuitarParcelaOS;
begin

  result := self;

  FPGTO := 'Sim';

end;

function TEntityQuitarParcelaOS.getValor(value: string): iQuitarParcelaOS;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityQuitarParcelaOS.getValorParcela(value: string)
  : iQuitarParcelaOS;
begin

  result := self;

  try
    FAdicionarValorParcela := StrToCurr(value);
  except
    on e: exception do
    begin
      MessageDlg('ERRO. Informe o valor da parcela. ' + e.Message, mtError,
        [mbOk], 0, mbOk);
    end;

  end;

end;

function TEntityQuitarParcelaOS.getVALOR_TOTAL(value: string): iQuitarParcelaOS;
begin

  result := self;

  try
    FVALOR_TOTAL := StrToCurr(value);
  except
    on e: exception do
    begin
      MessageDlg('ERRO. Informe o total de pagamento da parcela.' + e.Message,
        mtError, [mbOk], 0, mbOk);
    end;
  end;

end;

function TEntityQuitarParcelaOS.listarGrid(value: TDataSource)
  : iQuitarParcelaOS;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID_PARCELA').DisplayLabel := 'Parcela';
    FieldByName('ID_ORDEM').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcelas';
    FieldByName('PARCELA').DisplayLabel := 'Parcela';
    FieldByName('VALOR_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('VALOR_TOTAL').DisplayLabel := 'Valor total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Data de pagamento';
    FieldByName('HORA_PAGAMENTO').DisplayLabel := 'Hor�rio de pagamento';
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('PGTO').DisplayLabel := 'Pago';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do funcion�rio';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('CLIENTE').DisplayWidth := 40;
    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityQuitarParcelaOS.new: iQuitarParcelaOS;
begin
  result := self.create;
end;

function TEntityQuitarParcelaOS.nomeTabela(value: string): iQuitarParcelaOS;
begin
  result := self;
  FTabela := value;
end;

function TEntityQuitarParcelaOS.open(value: string): iQuitarParcelaOS;
begin
  FQuery.Query(FTabela);
end;

function TEntityQuitarParcelaOS.ordenarGrid(column: TColumn): iQuitarParcelaOS;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityQuitarParcelaOS.pesquisar: iQuitarParcelaOS;
begin
  result := self;
end;

function TEntityQuitarParcelaOS.salvarAlteracoesParcela(const valor: currency;
  const vencimento: TDate; const parcela:integer): iQuitarParcelaOS;
var
  FAdicionarParcela: iConexaoQuery;
begin

  result := self;

  FAdicionarParcela := TConexaoQuery.new.getCampo('ID').getValor(parcela.ToString).sqlPesquisaEstatica('PARCELAS_ORDEM');

  FAdicionarParcela.TQuery.Edit;

  try

    FAdicionarParcela.TQuery.FieldByName('VALOR_PARCELA').AsCurrency := valor;
    FAdicionarParcela.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime := vencimento;

    FAdicionarParcela.TQuery.Post;

    FQuery.TQuery.Refresh;

  except on e:exception do
  begin
    MessageDlg('ERRO! N�o foi poss�vel alterar os dados da parcela', mtError, [mbOK], 00, mbOK);
  end;

  end;

end;

function TEntityQuitarParcelaOS.selecionarParcelaQuitar(value: integer)
  : iQuitarParcelaOS;
var
  FQueryParcelaOS: iConexaoQuery;
begin

  result := self;

  FQueryParcelaOS := TConexaoQuery.new.Query('PARCELAS_ORDEM');

  FQueryParcelaOS.TQuery.Active := false;
  FQueryParcelaOS.TQuery.SQL.Clear;
  FQueryParcelaOS.TQuery.SQL.Add('select * from PARCELAS_ORDEM where ID =:i');
  FQueryParcelaOS.TQuery.ParamByName('i').AsInteger := value;
  FQueryParcelaOS.TQuery.Active := true;

  if FQueryParcelaOS.TQuery.RecordCount >= 1 then
  begin

    FQueryParcelaOS.TQuery.Edit;

    FQueryParcelaOS.TQuery.FieldByName('DESCONTO').AsCurrency := FDESCONTO;
    FQueryParcelaOS.TQuery.FieldByName('JUROS').AsCurrency := FJUROS;
    FQueryParcelaOS.TQuery.FieldByName('MULTA').AsCurrency := FMULTA;
    FQueryParcelaOS.TQuery.FieldByName('VALOR_TOTAL').AsCurrency := FVALOR_TOTAL;
    FQueryParcelaOS.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger := funcionarioLogado;
    FQueryParcelaOS.TQuery.FieldByName('NOME_FUNCIONARIO').AsString := NomeFuncionarioLogado;
    FQueryParcelaOS.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime := FDATA_PAGAMENTO;
    FQueryParcelaOS.TQuery.FieldByName('HORA_PAGAMENTO').AsDateTime := FHORA_PAGAMENTO;
    FQueryParcelaOS.TQuery.FieldByName('FORMA_PAGAMENTO').AsString := FFORMA_PAGAMENTO;
    FQueryParcelaOS.TQuery.FieldByName('PGTO').AsString := FPGTO;

    try
      FQueryParcelaOS.TQuery.Post;
      showmessage('Parcela quitada com sucesso!!!');

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('CLIENTE').AsString)
        .getCodigoRegistro(FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger)
        .getOperacao('quitada').gravarLog;

    except
      on e: exception do
      begin
        MessageDlg('ERRO. Ocorreu um erro ao tentar quitar esta parcela. ' +
          e.Message, mtError, [mbOk], 0, mbOk);
      end;

    end;

  end;

end;

function TEntityQuitarParcelaOS.setTotalJurosParcela(value: TCurrencyEdit)
  : iQuitarParcelaOS;
begin
  result := self;
  value.Text := CurrToStr(FJurosParcela);
end;

function TEntityQuitarParcelaOS.setTotalMultaParcela(value: TCurrencyEdit)
  : iQuitarParcelaOS;
begin
  result := self;
  value.Text := CurrToStr(FMultaParcela);
end;

function TEntityQuitarParcelaOS.setTotalParcela(value: TCurrencyEdit): iQuitarParcelaOS;
begin
  result := self;
  value.Text := CurrToStr(FtotalAPagar)
end;

function TEntityQuitarParcelaOS.sqlPesquisa: iQuitarParcelaOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityQuitarParcelaOS.sqlPesquisaData: iQuitarParcelaOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityQuitarParcelaOS.sqlPesquisaEstatica: iQuitarParcelaOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TEntityQuitarParcelaOS.validarData(componet: tmaskEdit)
  : iQuitarParcelaOS;
var
  d: TDate;
begin

  result := self;

  try
    d := StrToDate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
