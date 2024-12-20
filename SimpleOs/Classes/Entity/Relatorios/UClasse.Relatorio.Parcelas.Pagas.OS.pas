unit UClasse.Relatorio.Parcelas.Pagas.OS;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TEntityRelatorioParcelasPagasOS = class(TInterfacedObject, iRelatorioParcelasPagasOS)
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

    function nomeTabela(value: string): iRelatorioParcelasPagasOS;
    function getCampo(value: string): iRelatorioParcelasPagasOS;
    function getValor(value: string): iRelatorioParcelasPagasOS;
    function getDataInicial(value: TDate): iRelatorioParcelasPagasOS;
    function getDataFinal(value: TDate): iRelatorioParcelasPagasOS;
    function open(value: string): iRelatorioParcelasPagasOS;
    function pesquisar: iRelatorioParcelasPagasOS;
    function ExecSql: iRelatorioParcelasPagasOS;
    function sqlPesquisa: iRelatorioParcelasPagasOS;
    function sqlPesquisaData: iRelatorioParcelasPagasOS;
    function sqlPesquisaEstatica: iRelatorioParcelasPagasOS;

    function abrir: iRelatorioParcelasPagasOS;
    function atualizar: iRelatorioParcelasPagasOS;
    function cancelar: iRelatorioParcelasPagasOS;
    function fecharQuery: iRelatorioParcelasPagasOS;
    function listarGrid(value: TDataSource): iRelatorioParcelasPagasOS;
    function ordenarGrid(column: TColumn): iRelatorioParcelasPagasOS;

    function exportar: iRelatorioParcelasPagasOS;
    function validarData(componet: tmaskEdit):iRelatorioParcelasPagasOS;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioParcelasPagasOS;
  end;

implementation

{ TEntityRelatorioParcelasPagasOS }

function TEntityRelatorioParcelasPagasOS.abrir: iRelatorioParcelasPagasOS;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityRelatorioParcelasPagasOS.atualizar: iRelatorioParcelasPagasOS;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityRelatorioParcelasPagasOS.cancelar: iRelatorioParcelasPagasOS;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TEntityRelatorioParcelasPagasOS.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_OS_PAGAS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio Parcelas Recebidas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );
end;

destructor TEntityRelatorioParcelasPagasOS.destroy;
begin

  inherited;
end;

function TEntityRelatorioParcelasPagasOS.ExecSql: iRelatorioParcelasPagasOS;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityRelatorioParcelasPagasOS.exportar: iRelatorioParcelasPagasOS;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio das parcelas pagas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Parcela';
  pasta.cells[1, 2] := 'C�d. OS';
  pasta.cells[1, 3] := 'C�d. Cliente';
  pasta.cells[1, 4] := 'Cliente';
  pasta.cells[1, 5] := 'Total de parcela';
  pasta.cells[1, 6] := 'Parcela';
  pasta.cells[1, 7] := 'Valor da parcela';
  pasta.cells[1, 8] := 'Vencimento';
  pasta.cells[1, 9] := 'Desconto';
  pasta.cells[1, 10] := 'Juros';
  pasta.cells[1, 11] := 'Multa';
  pasta.cells[1, 12] := 'Valor total';
  pasta.cells[1, 13] := 'Pagamento';
  pasta.cells[1, 14] := 'Hor�rio do pagamento';
  pasta.cells[1, 15] := 'Forma de pagamento';
  pasta.cells[1, 16] := 'PGTO';
  pasta.cells[1, 17] := 'C�d. Funcion�rio';
  pasta.cells[1, 18] := 'Funcion�rio';
  pasta.cells[1, 19] := 'Observa��o';


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
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('JUROS').AsCurrency;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('MULTA').AsCurrency;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('VALOR_TOTAL').AsCurrency;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('DATA_PAGAMENTO').AsDateTime;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('HORA_PAGAMENTO').AsDateTime;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('FORMA_PAGAMENTO').AsString;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('PGTO').AsString;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').AsString;
      pasta.cells[linha, 19] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;
function TEntityRelatorioParcelasPagasOS.fecharQuery: iRelatorioParcelasPagasOS;
begin
  FQuery.TQuery.close;
end;

function TEntityRelatorioParcelasPagasOS.getCampo(value: string): iRelatorioParcelasPagasOS;
begin
  result := self;
  FCampo := value;
end;

function TEntityRelatorioParcelasPagasOS.getDataFinal(value: TDate): iRelatorioParcelasPagasOS;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityRelatorioParcelasPagasOS.getDataInicial(value: TDate): iRelatorioParcelasPagasOS;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityRelatorioParcelasPagasOS.getValor(value: string): iRelatorioParcelasPagasOS;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityRelatorioParcelasPagasOS.listarGrid(value: TDataSource): iRelatorioParcelasPagasOS;
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
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('JUROS').DisplayLabel := 'Juros';
    FieldByName('MULTA').DisplayLabel := 'Multa';
    FieldByName('VALOR_TOTAL').DisplayLabel := 'Valor total';
    FieldByName('DATA_PAGAMENTO').DisplayLabel := 'Data de pagamento';
    FieldByName('HORA_PAGAMENTO').DisplayLabel := 'Hora de pagamento';
    FieldByName('FORMA_PAGAMENTO').DisplayLabel := 'Forma de pagamento';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Funcion�rio';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('CLIENTE').DisplayWidth := 50;
    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 50;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityRelatorioParcelasPagasOS.new: iRelatorioParcelasPagasOS;
begin
  result := self.create;
end;

function TEntityRelatorioParcelasPagasOS.nomeTabela(value: string): iRelatorioParcelasPagasOS;
begin
  result := self;
  FTabela := value;
end;

function TEntityRelatorioParcelasPagasOS.open(value: string): iRelatorioParcelasPagasOS;
begin
  FQuery.Query(FTabela);
end;

function TEntityRelatorioParcelasPagasOS.ordenarGrid(column: TColumn): iRelatorioParcelasPagasOS;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityRelatorioParcelasPagasOS.pesquisar: iRelatorioParcelasPagasOS;
begin
  result := self;
end;

function TEntityRelatorioParcelasPagasOS.sqlPesquisa: iRelatorioParcelasPagasOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityRelatorioParcelasPagasOS.sqlPesquisaData: iRelatorioParcelasPagasOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityRelatorioParcelasPagasOS.sqlPesquisaEstatica: iRelatorioParcelasPagasOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TEntityRelatorioParcelasPagasOS.validarData(componet: tmaskEdit):iRelatorioParcelasPagasOS;
var
  d: TDate;
begin

  result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
