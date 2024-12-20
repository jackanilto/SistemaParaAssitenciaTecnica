unit UClasse.Relatorio.Situacao.Estoque;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioSituacaoEstoque = class(TInterfacedObject, iRelatorioSituacaoEstoque)
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

    function nomeTabela(value: string): iRelatorioSituacaoEstoque;
    function getCampo(value: string): iRelatorioSituacaoEstoque;
    function getValor(value: string): iRelatorioSituacaoEstoque;
    function getDataInicial(value: TDate): iRelatorioSituacaoEstoque;
    function getDataFinal(value: TDate): iRelatorioSituacaoEstoque;
    function open(value: string): iRelatorioSituacaoEstoque;
    function pesquisar: iRelatorioSituacaoEstoque;
    function ExecSql: iRelatorioSituacaoEstoque;
    function sqlPesquisa: iRelatorioSituacaoEstoque;
    function sqlPesquisaData: iRelatorioSituacaoEstoque;
    function sqlPesquisaEstatica: iRelatorioSituacaoEstoque;

    function abrir: iRelatorioSituacaoEstoque;
    function atualizar: iRelatorioSituacaoEstoque;
    function cancelar: iRelatorioSituacaoEstoque;
    function fecharQuery: iRelatorioSituacaoEstoque;
    function listarGrid(value: TDataSource): iRelatorioSituacaoEstoque;
    function ordenarGrid(column: TColumn): iRelatorioSituacaoEstoque;

    function selecionarEStoqueAtencao:iRelatorioSituacaoEstoque;
    function selecionarEStoqueBaixo:iRelatorioSituacaoEstoque;
    function selecionarEStoqueNorma:iRelatorioSituacaoEstoque;
    function selecionarEStoqueTodos:iRelatorioSituacaoEstoque;

    function exportar: iRelatorioSituacaoEstoque;
    function validarData(componet: tmaskEdit): iRelatorioSituacaoEstoque;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioSituacaoEstoque;
  end;

implementation

{ TRelatorioSituacaoEstoque }

function TRelatorioSituacaoEstoque.abrir: iRelatorioSituacaoEstoque;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioSituacaoEstoque.atualizar: iRelatorioSituacaoEstoque;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioSituacaoEstoque.cancelar: iRelatorioSituacaoEstoque;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioSituacaoEstoque.create;
begin
  FTabela := 'PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio de produtos por situa�ao').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioSituacaoEstoque.destroy;
begin

  inherited;
end;

function TRelatorioSituacaoEstoque.ExecSql: iRelatorioSituacaoEstoque;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioSituacaoEstoque.exportar: iRelatorioSituacaoEstoque;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Situa��o Estoque';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'Produto';
  pasta.cells[1, 3] := 'C�digo de barras';
  pasta.cells[1, 4] := 'QTDE. M�nima';
  pasta.cells[1, 5] := 'QTDE. Atual';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('PRODUTO').AsString;
      pasta.cells[linha, 3] := '"'+FQuery.TQuery.FieldByName('CODIGO_BARRAS').AsString+'"';
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('QUANTIDADE_MINIMA').AsInteger;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioSituacaoEstoque.fecharQuery: iRelatorioSituacaoEstoque;
begin
  FQuery.TQuery.close;
end;

function TRelatorioSituacaoEstoque.getCampo(value: string): iRelatorioSituacaoEstoque;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioSituacaoEstoque.getDataFinal(value: TDate): iRelatorioSituacaoEstoque;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioSituacaoEstoque.getDataInicial(value: TDate): iRelatorioSituacaoEstoque;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioSituacaoEstoque.getValor(value: string): iRelatorioSituacaoEstoque;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioSituacaoEstoque.listarGrid(value: TDataSource): iRelatorioSituacaoEstoque;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID').DisplayLabel := 'C�digo';
    FieldByName('PRODUTO').DisplayLabel := 'Produto';
    FieldByName('CODIGO_BARRAS').DisplayLabel := 'C�digo de barras';
    FieldByName('DESCRICAO').Visible := false;
    FieldByName('VALOR_CUSTO').Visible := false;
    FieldByName('MARGEM_LUCRO').Visible := false;
    FieldByName('VALOR_VENDA').Visible := false;
    FieldByName('QUANTIDADE_MINIMA').DisplayLabel := 'QTDE. M�nima';
    FieldByName('QUANTIDADE_ATUAL').DisplayLabel := 'QTDE. Atual';
    FieldByName('DATA_VALIDADE').Visible := false;
    FieldByName('DATA_ALTERACAO').Visible := false;
    FieldByName('ID_GRUPO').Visible := false;
    FieldByName('GRUPO').Visible := false;
    FieldByName('ID_MARCA').Visible := false;
    FieldByName('MARCA').Visible := false;
    FieldByName('MODELO').Visible := false;
    FieldByName('NUMERO_SERIE').Visible := false;
    FieldByName('DATA_FABRICACAO').Visible := false;
    FieldByName('FUNCIONARIO').Visible := false;
    FieldByName('FOTO').Visible := false;
    FieldByName('OBSERVACAO').Visible := false;

    FieldByName('PRODUTO').DisplayWidth := 50;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioSituacaoEstoque.new: iRelatorioSituacaoEstoque;
begin
  result := self.create;
end;

function TRelatorioSituacaoEstoque.nomeTabela(value: string): iRelatorioSituacaoEstoque;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioSituacaoEstoque.open(value: string): iRelatorioSituacaoEstoque;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioSituacaoEstoque.ordenarGrid(column: TColumn): iRelatorioSituacaoEstoque;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioSituacaoEstoque.pesquisar: iRelatorioSituacaoEstoque;
begin
  result := self;
end;

function TRelatorioSituacaoEstoque.selecionarEStoqueAtencao: iRelatorioSituacaoEstoque;
begin

   result := self;

   with FQuery do
   begin
     TQuery.Active := false;
     TQuery.SQL.Clear;
     TQuery.SQL.Add('select * from PRODUTOS where QUANTIDADE_ATUAL <= QUANTIDADE_MINIMA');
     TQuery.Active := true;
   end;

end;

function TRelatorioSituacaoEstoque.selecionarEStoqueBaixo: iRelatorioSituacaoEstoque;
begin

  result := self;

   with FQuery do
   begin
     TQuery.Active := false;
     TQuery.SQL.Clear;
     TQuery.SQL.Add('select * from PRODUTOS where QUANTIDADE_ATUAL < QUANTIDADE_MINIMA');
     TQuery.Active := true;
   end;

end;

function TRelatorioSituacaoEstoque.selecionarEStoqueNorma: iRelatorioSituacaoEstoque;
begin

  result := self;

  with FQuery do
   begin
     TQuery.Active := false;
     TQuery.SQL.Clear;
     TQuery.SQL.Add('select * from PRODUTOS where QUANTIDADE_ATUAL > QUANTIDADE_MINIMA');
     TQuery.Active := true;
   end;


end;

function TRelatorioSituacaoEstoque.selecionarEStoqueTodos: iRelatorioSituacaoEstoque;
begin

  result := self;
  with FQuery do
   begin
     TQuery.Active := false;
     TQuery.SQL.Clear;
     TQuery.SQL.Add('select * from PRODUTOS');
     TQuery.Active := true;
   end;

end;

function TRelatorioSituacaoEstoque.sqlPesquisa: iRelatorioSituacaoEstoque;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioSituacaoEstoque.sqlPesquisaData: iRelatorioSituacaoEstoque;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioSituacaoEstoque.sqlPesquisaEstatica: iRelatorioSituacaoEstoque;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioSituacaoEstoque.validarData(componet: tmaskEdit):iRelatorioSituacaoEstoque;
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
