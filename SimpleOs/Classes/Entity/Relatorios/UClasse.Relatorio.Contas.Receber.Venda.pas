unit UClasse.Relatorio.Contas.Receber.Venda;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TEntityRelatorioContasAReceberVenda = class(TInterfacedObject, iRelatorioContasAReceberVendas)
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

    function nomeTabela(value: string): iRelatorioContasAReceberVendas;
    function getCampo(value: string): iRelatorioContasAReceberVendas;
    function getValor(value: string): iRelatorioContasAReceberVendas;
    function getDataInicial(value: TDate): iRelatorioContasAReceberVendas;
    function getDataFinal(value: TDate): iRelatorioContasAReceberVendas;
    function open(value: string): iRelatorioContasAReceberVendas;
    function pesquisar: iRelatorioContasAReceberVendas;
    function ExecSql: iRelatorioContasAReceberVendas;
    function sqlPesquisa: iRelatorioContasAReceberVendas;
    function sqlPesquisaData: iRelatorioContasAReceberVendas;
    function sqlPesquisaEstatica: iRelatorioContasAReceberVendas;

    function abrir: iRelatorioContasAReceberVendas;
    function atualizar: iRelatorioContasAReceberVendas;
    function cancelar: iRelatorioContasAReceberVendas;
    function fecharQuery: iRelatorioContasAReceberVendas;
    function listarGrid(value: TDataSource): iRelatorioContasAReceberVendas;
    function ordenarGrid(column: TColumn): iRelatorioContasAReceberVendas;

    function exportar: iRelatorioContasAReceberVendas;
    function validarData(componet: tmaskEdit):iRelatorioContasAReceberVendas;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioContasAReceberVendas;
  end;

implementation

{ TEntityRelatorioContasAReceberVenda }

function TEntityRelatorioContasAReceberVenda.abrir: iRelatorioContasAReceberVendas;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityRelatorioContasAReceberVenda.atualizar: iRelatorioContasAReceberVendas;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityRelatorioContasAReceberVenda.cancelar: iRelatorioContasAReceberVendas;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TEntityRelatorioContasAReceberVenda.create;
begin
  FTabela := 'VISUALIZAR_P_VENDA_RECEBER';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório contas a receber Vendas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );
end;

destructor TEntityRelatorioContasAReceberVenda.destroy;
begin

  inherited;
end;

function TEntityRelatorioContasAReceberVenda.ExecSql: iRelatorioContasAReceberVendas;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityRelatorioContasAReceberVenda.exportar: iRelatorioContasAReceberVendas;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório de Contas a Receber Vendas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Parcela';
  pasta.cells[1, 2] := 'Venda';
  pasta.cells[1, 3] := 'Cód. Cliente';
  pasta.cells[1, 4] := 'Cliente';
  pasta.cells[1, 5] := 'Valor da venda';
  pasta.cells[1, 6] := 'Total de parcela';
  pasta.cells[1, 7] := 'Parcela';
  pasta.cells[1, 8] := 'Valor da parcela';
  pasta.cells[1, 9] := 'Vencimento';
  pasta.cells[1, 10] := 'Pago';

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
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('PAGO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityRelatorioContasAReceberVenda.fecharQuery: iRelatorioContasAReceberVendas;
begin
  FQuery.TQuery.close;
end;

function TEntityRelatorioContasAReceberVenda.getCampo(value: string): iRelatorioContasAReceberVendas;
begin
  result := self;
  FCampo := value;
end;

function TEntityRelatorioContasAReceberVenda.getDataFinal(value: TDate): iRelatorioContasAReceberVendas;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityRelatorioContasAReceberVenda.getDataInicial(value: TDate): iRelatorioContasAReceberVendas;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityRelatorioContasAReceberVenda.getValor(value: string): iRelatorioContasAReceberVendas;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityRelatorioContasAReceberVenda.listarGrid(value: TDataSource): iRelatorioContasAReceberVendas;
begin

  result := self;

  with FQuery.TQuery do
  begin
   FieldByName('ID_PARCELA').DisplayLabel := 'Cód. Parcela';
    FieldByName('ID_VENDA').DisplayLabel := 'Venda';
    FieldByName('ID_CLIENTE').DisplayLabel := 'Cód. Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('VALOR_VENDA').DisplayLabel := 'Valor da venda';
    FieldByName('QUANTIDADE_PARCELAS').DisplayLabel := 'QTDE de parcelas';
    FieldByName('PARCELA').DisplayLabel := 'Parcela';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('DATA_VENCIMENTO').DisplayLabel := 'Data de vencimento';
    FieldByName('JUROS').Visible := false;
    FieldByName('MULTA').Visible := false;
    FieldByName('DESCONTO').Visible := false;
    FieldByName('TOTAL').Visible := false;
    FieldByName('DATA_PAGAMENTO').Visible := false;
    FieldByName('HORA_PAGAMENTO').Visible := false;
    FieldByName('FUNCIONARIO_PGTO').Visible := false;
    FieldByName('FORMA_PAGAMENTO').Visible := false;
    FieldByName('PAGO').DisplayLabel := 'Pago';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('CLIENTE').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 50;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityRelatorioContasAReceberVenda.new: iRelatorioContasAReceberVendas;
begin
  result := self.create;
end;

function TEntityRelatorioContasAReceberVenda.nomeTabela(value: string): iRelatorioContasAReceberVendas;
begin
  result := self;
  FTabela := value;
end;

function TEntityRelatorioContasAReceberVenda.open(value: string): iRelatorioContasAReceberVendas;
begin
  FQuery.Query(FTabela);
end;

function TEntityRelatorioContasAReceberVenda.ordenarGrid(column: TColumn): iRelatorioContasAReceberVendas;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityRelatorioContasAReceberVenda.pesquisar: iRelatorioContasAReceberVendas;
begin
  result := self;
end;

function TEntityRelatorioContasAReceberVenda.sqlPesquisa: iRelatorioContasAReceberVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityRelatorioContasAReceberVenda.sqlPesquisaData: iRelatorioContasAReceberVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityRelatorioContasAReceberVenda.sqlPesquisaEstatica: iRelatorioContasAReceberVendas;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TEntityRelatorioContasAReceberVenda.validarData(componet: tmaskEdit):iRelatorioContasAReceberVendas;
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
