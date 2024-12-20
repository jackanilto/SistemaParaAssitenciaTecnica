unit UClasse.Relatorio.OS.Inadimplentes;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioOSInadimplentes = class(TInterfacedObject, iRelatorioOSInadimpelentes)
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

    function nomeTabela(value: string): iRelatorioOSInadimpelentes;
    function getCampo(value: string): iRelatorioOSInadimpelentes;
    function getValor(value: string): iRelatorioOSInadimpelentes;
    function getDataInicial(value: TDate): iRelatorioOSInadimpelentes;
    function getDataFinal(value: TDate): iRelatorioOSInadimpelentes;
    function open(value: string): iRelatorioOSInadimpelentes;
    function pesquisar: iRelatorioOSInadimpelentes;
    function ExecSql: iRelatorioOSInadimpelentes;
    function sqlPesquisa: iRelatorioOSInadimpelentes;
    function sqlPesquisaData: iRelatorioOSInadimpelentes;
    function sqlPesquisaEstatica: iRelatorioOSInadimpelentes;

    function retornarPesquisaInadimplentes(value:string):iRelatorioOSInadimpelentes; overload;
    function retornarPesquisaInadimplentes(data1, data2:string):iRelatorioOSInadimpelentes; overload;

    function abrir: iRelatorioOSInadimpelentes;
    function atualizar: iRelatorioOSInadimpelentes;
    function cancelar: iRelatorioOSInadimpelentes;
    function fecharQuery: iRelatorioOSInadimpelentes;
    function listarGrid(value: TDataSource): iRelatorioOSInadimpelentes;
    function ordenarGrid(column: TColumn): iRelatorioOSInadimpelentes;

    function exportar: iRelatorioOSInadimpelentes;
    function validarData(componet: tmaskEdit): iRelatorioOSInadimpelentes;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioOSInadimpelentes;
  end;

implementation

{ TRelatorioOSInadimplentes }

function TRelatorioOSInadimplentes.abrir: iRelatorioOSInadimpelentes;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioOSInadimplentes.atualizar: iRelatorioOSInadimpelentes;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioOSInadimplentes.cancelar: iRelatorioOSInadimpelentes;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioOSInadimplentes.create;
begin
  FTabela := 'VISUALIZAR_PARCELAS_OS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio de clientes com pagamento de OS atrasadas').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioOSInadimplentes.destroy;
begin

  inherited;
end;

function TRelatorioOSInadimplentes.ExecSql: iRelatorioOSInadimpelentes;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioOSInadimplentes.exportar: iRelatorioOSInadimpelentes;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio clientes com parcelas das OS atrasadas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Parcela';
  pasta.cells[1, 2] := 'OS';
  pasta.cells[1, 3] := 'C�d. Cliente';
  pasta.cells[1, 4] := 'Nome do cliente';
  pasta.cells[1, 5] := 'Parcela';
  pasta.cells[1, 6] := 'Valor da parcela';
  pasta.cells[1, 7] := 'Vencimento';
  pasta.cells[1, 8] := 'PGTO';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_PARCELA').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('CLIENTE').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('PARCELA').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('VALOR_PARCELA').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('DATA_VENCIMENTO').AsString;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('PGTO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioOSInadimplentes.fecharQuery: iRelatorioOSInadimpelentes;
begin
  FQuery.TQuery.close;
end;

function TRelatorioOSInadimplentes.getCampo(value: string): iRelatorioOSInadimpelentes;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioOSInadimplentes.getDataFinal(value: TDate): iRelatorioOSInadimpelentes;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioOSInadimplentes.getDataInicial(value: TDate): iRelatorioOSInadimpelentes;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioOSInadimplentes.getValor(value: string): iRelatorioOSInadimpelentes;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioOSInadimplentes.listarGrid(value: TDataSource): iRelatorioOSInadimpelentes;
begin

  result := self;

    with FQuery.TQuery do
  begin

    FieldByName('ID_PARCELA').DisplayLabel := 'Parcela';
    FieldByName('ID_ORDEM').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('CLIENTE').DisplayLabel := 'Nome do cliente';
    FieldByName('TOTAL_PARCELAS').Visible := false;
    FieldByName('PARCELA').DisplayLabel := 'Parcela';
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
    FieldByName('OBSERVACAO').Visible := false;

    FieldByName('CLIENTE').DisplayWidth := 50;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioOSInadimplentes.new: iRelatorioOSInadimpelentes;
begin
  result := self.create;
end;

function TRelatorioOSInadimplentes.nomeTabela(value: string): iRelatorioOSInadimpelentes;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioOSInadimplentes.open(value: string): iRelatorioOSInadimpelentes;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioOSInadimplentes.ordenarGrid(column: TColumn): iRelatorioOSInadimpelentes;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioOSInadimplentes.pesquisar: iRelatorioOSInadimpelentes;
begin
  result := self;
end;

function TRelatorioOSInadimplentes.retornarPesquisaInadimplentes(data1,
  data2: string): iRelatorioOSInadimpelentes;
begin
  result := self;

  with FQuery do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from VISUALIZAR_PARCELAS_OS where DATA_VENCIMENTO <:d '+
                  'and PGTO =:p and DATA_VENCIMENTO between :d1 and :d2');
    TQuery.ParamByName('d').AsDate := date;
    TQuery.ParamByName('p').AsString := 'Nao';
    TQuery.ParamByName('d1').AsDate := StrToDate(data1);
    TQuery.ParamByName('d2').AsDate := StrToDate(data2);
    TQuery.Active := true;

  end;


end;

function TRelatorioOSInadimplentes.retornarPesquisaInadimplentes(
  value: string): iRelatorioOSInadimpelentes;
begin

  result := self;

  with FQuery do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from VISUALIZAR_PARCELAS_OS where DATA_VENCIMENTO <:d '+
                  'and PGTO =:p and '+FCampo+' like :valor');
    TQuery.ParamByName('d').AsDate := date;
    TQuery.ParamByName('p').AsString := 'Nao';
    TQuery.ParamByName('valor').AsString := UpperCase(value+'%');
    TQuery.Active := true;

  end;

end;

function TRelatorioOSInadimplentes.sqlPesquisa: iRelatorioOSInadimpelentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioOSInadimplentes.sqlPesquisaData: iRelatorioOSInadimpelentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioOSInadimplentes.sqlPesquisaEstatica: iRelatorioOSInadimpelentes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioOSInadimplentes.validarData(componet: tmaskEdit):iRelatorioOSInadimpelentes;
var
  d: TDate;
begin

  result := Self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
