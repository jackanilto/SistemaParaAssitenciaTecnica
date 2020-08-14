unit UClasse.Relatorio.Contas.A.Receber;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TEntityRelatorioContasAReceber = class(TInterfacedObject,
    iRelatorioContasAReceber)
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

    function nomeTabela(value: string): iRelatorioContasAReceber;
    function getCampo(value: string): iRelatorioContasAReceber;
    function getValor(value: string): iRelatorioContasAReceber;
    function getDataInicial(value: TDate): iRelatorioContasAReceber;
    function getDataFinal(value: TDate): iRelatorioContasAReceber;
    function open(value: string): iRelatorioContasAReceber;
    function pesquisar: iRelatorioContasAReceber;
    function ExecSql: iRelatorioContasAReceber;
    function sqlPesquisa: iRelatorioContasAReceber;
    function sqlPesquisaData: iRelatorioContasAReceber;
    function sqlPesquisaEstatica: iRelatorioContasAReceber;
    function SelectSql(value: string): iRelatorioContasAReceber;

    function abrir: iRelatorioContasAReceber;
    function atualizar: iRelatorioContasAReceber;
    function cancelar: iRelatorioContasAReceber;
    function fecharQuery: iRelatorioContasAReceber;
    function listarGrid(value: TDataSource): iRelatorioContasAReceber;
    function ordenarGrid(column: TColumn): iRelatorioContasAReceber;

    function exportar: iRelatorioContasAReceber;
    procedure validarData(componet: tmaskEdit);

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioContasAReceber;
  end;

implementation

{ TEntityRelatorioContasAReceber }

function TEntityRelatorioContasAReceber.abrir: iRelatorioContasAReceber;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityRelatorioContasAReceber.atualizar: iRelatorioContasAReceber;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityRelatorioContasAReceber.cancelar: iRelatorioContasAReceber;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TEntityRelatorioContasAReceber.create;
begin

  FTabela := 'VISUALIZAR_PARCELAS_OS_ARECEBER';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio contas a receber OS').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityRelatorioContasAReceber.destroy;
begin

  inherited;
end;

function TEntityRelatorioContasAReceber.ExecSql: iRelatorioContasAReceber;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityRelatorioContasAReceber.exportar: iRelatorioContasAReceber;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio de Contas a Receber OS';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Parcela';
  pasta.cells[1, 2] := 'C�d. OS';
  pasta.cells[1, 3] := 'C�d. Cliente';
  pasta.cells[1, 4] := 'Cliente';
  pasta.cells[1, 5] := 'Total de parcela';
  pasta.cells[1, 6] := 'Parcela';
  pasta.cells[1, 7] := 'Valor da parcela';
  pasta.cells[1, 8] := 'Vencimento';
  pasta.cells[1, 9] := 'PGTO';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('CLIENTE').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('TOTAL_PARCELAS').AsInteger;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('PARCELA').AsInteger;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('VALOR_PARCELA').AsCurrency;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsDateTime;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('PGTO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityRelatorioContasAReceber.fecharQuery: iRelatorioContasAReceber;
begin
  FQuery.TQuery.close;
end;

function TEntityRelatorioContasAReceber.getCampo(value: string)
  : iRelatorioContasAReceber;
begin
  result := self;
  FCampo := value;
end;

function TEntityRelatorioContasAReceber.getDataFinal(value: TDate)
  : iRelatorioContasAReceber;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityRelatorioContasAReceber.getDataInicial(value: TDate)
  : iRelatorioContasAReceber;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityRelatorioContasAReceber.getValor(value: string)
  : iRelatorioContasAReceber;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityRelatorioContasAReceber.listarGrid(value: TDataSource)
  : iRelatorioContasAReceber;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_PARCELA').DisplayLabel := 'Parcela';
    FieldByName('ID_ORDEM').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Nome do cliente';
    FieldByName('TOTAL_PARCELAS').Visible := false;
    FieldByName('PARCELA').DisplayLabel := 'N�. Parcela';
    FieldByName('VALOR_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Vencimento';
    FieldByName('DESCONTO').Visible := false;
    FieldByName('JUROS').Visible := false;
    FieldByName('MULTA').Visible := false;
    FieldByName('VALOR_TOTAL').Visible := false;
    FieldByName('DATA_PAGAMENTO').Visible := false;
    FieldByName('HORA_PAGAMENTO').Visible := false;
    FieldByName('FORMA_PAGAMENTO').Visible := false;
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('ID_FUNCIONARIO').Visible := false;
    FieldByName('NOME_FUNCIONARIO').Visible := false;
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('CLIENTE').DisplayWidth := 50;
    FieldByName('OBSERVACAO').DisplayWidth := 50;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityRelatorioContasAReceber.new: iRelatorioContasAReceber;
begin
  result := self.create;
end;

function TEntityRelatorioContasAReceber.nomeTabela(value: string)
  : iRelatorioContasAReceber;
begin
  result := self;
  FTabela := value;
end;

function TEntityRelatorioContasAReceber.open(value: string)
  : iRelatorioContasAReceber;
begin
  FQuery.Query(FTabela);
end;

function TEntityRelatorioContasAReceber.ordenarGrid(column: TColumn)
  : iRelatorioContasAReceber;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityRelatorioContasAReceber.pesquisar: iRelatorioContasAReceber;
begin
  result := self;
end;

function TEntityRelatorioContasAReceber.SelectSql(value: string)
  : iRelatorioContasAReceber;
begin

  result := self;

  with FQuery do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add(value);
    TQuery.Active := true;

    ShowMessage(IntToStr(TQuery.RecordCount));

  end;

end;

function TEntityRelatorioContasAReceber.sqlPesquisa: iRelatorioContasAReceber;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityRelatorioContasAReceber.sqlPesquisaData
  : iRelatorioContasAReceber;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityRelatorioContasAReceber.sqlPesquisaEstatica
  : iRelatorioContasAReceber;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityRelatorioContasAReceber.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
