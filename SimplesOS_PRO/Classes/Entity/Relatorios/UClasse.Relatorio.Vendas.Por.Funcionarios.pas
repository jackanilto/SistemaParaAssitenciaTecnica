unit UClasse.Relatorio.Vendas.Por.Funcionarios;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioVendasPorFuncionarios = class(TInterfacedObject, iRelatorioVendasPorFucnionario)
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

    function nomeTabela(value: string): iRelatorioVendasPorFucnionario;
    function getCampo(value: string): iRelatorioVendasPorFucnionario;
    function getValor(value: string): iRelatorioVendasPorFucnionario;
    function getDataInicial(value: TDate): iRelatorioVendasPorFucnionario;
    function getDataFinal(value: TDate): iRelatorioVendasPorFucnionario;
    function open(value: string): iRelatorioVendasPorFucnionario;
    function pesquisar: iRelatorioVendasPorFucnionario;
    function ExecSql: iRelatorioVendasPorFucnionario;
    function sqlPesquisa: iRelatorioVendasPorFucnionario;
    function sqlPesquisaData: iRelatorioVendasPorFucnionario;
    function sqlPesquisaEstatica: iRelatorioVendasPorFucnionario;

    function abrir: iRelatorioVendasPorFucnionario;
    function atualizar: iRelatorioVendasPorFucnionario;
    function cancelar: iRelatorioVendasPorFucnionario;
    function fecharQuery: iRelatorioVendasPorFucnionario;
    function listarGrid(value: TDataSource): iRelatorioVendasPorFucnionario;
    function ordenarGrid(column: TColumn): iRelatorioVendasPorFucnionario;

    function maiorNumeroDeVendas:iRelatorioVendasPorFucnionario;
    function menorNumeroDeVendas:iRelatorioVendasPorFucnionario;

    function exportar: iRelatorioVendasPorFucnionario;
    function validarData(componet: tmaskEdit): iRelatorioVendasPorFucnionario;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioVendasPorFucnionario;
  end;

implementation

{ TRelatorioVendasPorFuncionarios }

function TRelatorioVendasPorFuncionarios.abrir: iRelatorioVendasPorFucnionario;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioVendasPorFuncionarios.atualizar: iRelatorioVendasPorFucnionario;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioVendasPorFuncionarios.cancelar: iRelatorioVendasPorFucnionario;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioVendasPorFuncionarios.create;
begin
  FTabela := 'VISUALIZAR_VENDA_FUNCINARIO1';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio de Vendas por Funcion�rios').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioVendasPorFuncionarios.destroy;
begin

  inherited;
end;

function TRelatorioVendasPorFuncionarios.ExecSql: iRelatorioVendasPorFucnionario;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioVendasPorFuncionarios.exportar: iRelatorioVendasPorFucnionario;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Vendas por Funcion�rios';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�d. Funcion�rio';
  pasta.cells[1, 2] := 'Nome do funcion�rio';
  pasta.cells[1, 3] := 'Quantidade';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('QTDE').AsInteger;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioVendasPorFuncionarios.fecharQuery: iRelatorioVendasPorFucnionario;
begin
  FQuery.TQuery.close;
end;

function TRelatorioVendasPorFuncionarios.getCampo(value: string): iRelatorioVendasPorFucnionario;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioVendasPorFuncionarios.getDataFinal(value: TDate): iRelatorioVendasPorFucnionario;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioVendasPorFuncionarios.getDataInicial(value: TDate): iRelatorioVendasPorFucnionario;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioVendasPorFuncionarios.getValor(value: string): iRelatorioVendasPorFucnionario;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioVendasPorFuncionarios.listarGrid(value: TDataSource): iRelatorioVendasPorFucnionario;
begin

  result := self;

  FQuery.TQuery.FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
  FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do funcion�rio';
  FQuery.TQuery.FieldByName('QTDE').DisplayLabel := 'QTDE';

  FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').DisplayWidth := 80;

  value.DataSet := FQuery.TQuery;

end;

function TRelatorioVendasPorFuncionarios.maiorNumeroDeVendas: iRelatorioVendasPorFucnionario;
begin
  result := self;
  FQuery.ExecSql('select * from VISUALIZAR_VENDA_FUNCINARIO1 order by QTDE desc')
end;

function TRelatorioVendasPorFuncionarios.menorNumeroDeVendas: iRelatorioVendasPorFucnionario;
begin
  result := self;
  FQuery.ExecSql('select * from VISUALIZAR_VENDA_FUNCINARIO1 order by QTDE asc')
end;

class function TRelatorioVendasPorFuncionarios.new: iRelatorioVendasPorFucnionario;
begin
  result := self.create;
end;

function TRelatorioVendasPorFuncionarios.nomeTabela(value: string): iRelatorioVendasPorFucnionario;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioVendasPorFuncionarios.open(value: string): iRelatorioVendasPorFucnionario;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioVendasPorFuncionarios.ordenarGrid(column: TColumn): iRelatorioVendasPorFucnionario;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioVendasPorFuncionarios.pesquisar: iRelatorioVendasPorFucnionario;
begin
  result := self;
end;

function TRelatorioVendasPorFuncionarios.sqlPesquisa: iRelatorioVendasPorFucnionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioVendasPorFuncionarios.sqlPesquisaData: iRelatorioVendasPorFucnionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioVendasPorFuncionarios.sqlPesquisaEstatica: iRelatorioVendasPorFucnionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioVendasPorFuncionarios.validarData(componet: tmaskEdit):iRelatorioVendasPorFucnionario;
var
  d: TDate;
begin

  Result := Self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
