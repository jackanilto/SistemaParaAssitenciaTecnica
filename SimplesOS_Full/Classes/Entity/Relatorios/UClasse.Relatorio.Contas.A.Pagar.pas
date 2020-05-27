unit UClasse.Relatorio.Contas.A.Pagar;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioContasAPagar = class(TInterfacedObject, iRelatorioContasAPagar)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iRelatorioContasAPagar;
    function getCampo(value: string): iRelatorioContasAPagar;
    function getValor(value: string): iRelatorioContasAPagar;
    function getDataInicial(value: TDate): iRelatorioContasAPagar;
    function getDataFinal(value: TDate): iRelatorioContasAPagar;
    function open(value: string): iRelatorioContasAPagar;
    function pesquisar: iRelatorioContasAPagar;
    function ExecSql: iRelatorioContasAPagar;
    function sqlPesquisa: iRelatorioContasAPagar;
    function sqlPesquisaData: iRelatorioContasAPagar;
    function sqlPesquisaEstatica: iRelatorioContasAPagar;

    function abrir: iRelatorioContasAPagar;
    function atualizar: iRelatorioContasAPagar;
    function cancelar: iRelatorioContasAPagar;
    function fecharQuery: iRelatorioContasAPagar;
    function listarGrid(value: TDataSource): iRelatorioContasAPagar;
    function ordenarGrid(column: TColumn): iRelatorioContasAPagar;

    function selecionarContasPagas:iRelatorioContasAPagar;
    function selecionarContasAVencer:iRelatorioContasAPagar;
    function selecionarContasAtrasadas:iRelatorioContasAPagar;

    function exportar: iRelatorioContasAPagar;
    function validarData(componet: tmaskEdit):iRelatorioContasAPagar;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioContasAPagar;
  end;

implementation

{ TRelatorioContasAPagar }

function TRelatorioContasAPagar.abrir: iRelatorioContasAPagar;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioContasAPagar.atualizar: iRelatorioContasAPagar;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioContasAPagar.cancelar: iRelatorioContasAPagar;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioContasAPagar.create;
begin
  FTabela := 'CONTAS_A_PAGAR';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório de contas a pagar').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioContasAPagar.destroy;
begin

  inherited;
end;

function TRelatorioContasAPagar.ExecSql: iRelatorioContasAPagar;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioContasAPagar.exportar: iRelatorioContasAPagar;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório Contas a Pagar';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Código';
  pasta.cells[1, 2] := 'Conta';
  pasta.cells[1, 3] := 'Vencimento';
  pasta.cells[1, 4] := 'Valor';
  pasta.cells[1, 5] := 'Juros';
  pasta.cells[1, 6] := 'Multa';
  pasta.cells[1, 7] := 'Desconto';
  pasta.cells[1, 8] := 'Valor total';
  pasta.cells[1, 9] := 'Pagamento';
  pasta.cells[1, 10] := 'Pago';
  pasta.cells[1, 11] := 'Funcionário';
  pasta.cells[1, 12] := 'Observação';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('CONTA').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('VALOR').AsCurrency;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('JUROS').AsCurrency;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('MULTA').AsCurrency;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('VALOR_TOTAL').AsCurrency;

      if FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime
      else
        pasta.cells[linha, 9] := ' ';


      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('PAGO').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').AsInteger;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioContasAPagar.fecharQuery: iRelatorioContasAPagar;
begin
  FQuery.TQuery.close;
end;

function TRelatorioContasAPagar.getCampo(value: string): iRelatorioContasAPagar;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioContasAPagar.getDataFinal(value: TDate): iRelatorioContasAPagar;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioContasAPagar.getDataInicial(value: TDate): iRelatorioContasAPagar;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioContasAPagar.getValor(value: string): iRelatorioContasAPagar;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioContasAPagar.listarGrid(value: TDataSource): iRelatorioContasAPagar;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'Código';
    FieldByName('CONTA').DisplayLabel := 'Conta';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('VALOR').DisplayLabel := 'Valor';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('VALOR_TOTAL').DisplayLabel := 'Total a pagar';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Data de pagamento';
    FieldByName('PAGO').DisplayLabel := 'Pago';
    FieldByName('FUNCIONARIO_CADASTRO').DisplayLabel := 'Funcionário';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('CONTA').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;


  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioContasAPagar.new: iRelatorioContasAPagar;
begin
  result := self.create;
end;

function TRelatorioContasAPagar.nomeTabela(value: string): iRelatorioContasAPagar;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioContasAPagar.open(value: string): iRelatorioContasAPagar;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioContasAPagar.ordenarGrid(column: TColumn): iRelatorioContasAPagar;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioContasAPagar.pesquisar: iRelatorioContasAPagar;
begin
  result := self;
end;

function TRelatorioContasAPagar.selecionarContasAtrasadas: iRelatorioContasAPagar;
begin

  result := self;

  with FQuery do
  begin
    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from CONTAS_A_PAGAR where PAGO =:p and DATA_VENCIMENTO <:d');
    TQuery.ParamByName('p').AsString := 'Nao';
    TQuery.ParamByName('d').AsDate := Date;
    TQuery.Active := true;
  end;


end;

function TRelatorioContasAPagar.selecionarContasAVencer: iRelatorioContasAPagar;
begin

  result := self;

  with FQuery do
  begin
    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from CONTAS_A_PAGAR where PAGO =:p and DATA_VENCIMENTO >:d');
    TQuery.ParamByName('p').AsString := 'Nao';
    TQuery.ParamByName('d').AsDate := Date;
    TQuery.Active := true;
  end;

end;

function TRelatorioContasAPagar.selecionarContasPagas: iRelatorioContasAPagar;
begin

  result := self;

  with FQuery do
  begin
    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from CONTAS_A_PAGAR where PAGO =:P');
    TQuery.ParamByName('p').AsString := 'Sim';
    TQuery.Active := true;
  end;

end;

function TRelatorioContasAPagar.sqlPesquisa: iRelatorioContasAPagar;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioContasAPagar.sqlPesquisaData: iRelatorioContasAPagar;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioContasAPagar.sqlPesquisaEstatica: iRelatorioContasAPagar;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioContasAPagar.validarData(componet: tmaskEdit):iRelatorioContasAPagar;
var
  d: TDate;
begin

  result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data válida.');
  end;
end;

end.
