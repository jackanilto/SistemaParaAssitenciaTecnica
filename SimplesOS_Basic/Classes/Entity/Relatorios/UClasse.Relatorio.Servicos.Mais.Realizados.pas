unit UClasse.Relatorio.Servicos.Mais.Realizados;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioServicosMaisRealizados = class(TInterfacedObject, iRelatorioServicosMaisRealizados)
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

    function nomeTabela(value: string): iRelatorioServicosMaisRealizados;
    function getCampo(value: string): iRelatorioServicosMaisRealizados;
    function getValor(value: string): iRelatorioServicosMaisRealizados;
    function getDataInicial(value: TDate): iRelatorioServicosMaisRealizados;
    function getDataFinal(value: TDate): iRelatorioServicosMaisRealizados;
    function open(value: string): iRelatorioServicosMaisRealizados;
    function pesquisar: iRelatorioServicosMaisRealizados;
    function ExecSql: iRelatorioServicosMaisRealizados;
    function sqlPesquisa: iRelatorioServicosMaisRealizados;
    function sqlPesquisaData: iRelatorioServicosMaisRealizados;
    function sqlPesquisaEstatica: iRelatorioServicosMaisRealizados;

    function abrir: iRelatorioServicosMaisRealizados;
    function atualizar: iRelatorioServicosMaisRealizados;
    function cancelar: iRelatorioServicosMaisRealizados;
    function fecharQuery: iRelatorioServicosMaisRealizados;
    function listarGrid(value: TDataSource): iRelatorioServicosMaisRealizados;
    function ordenarGrid(column: TColumn): iRelatorioServicosMaisRealizados;

    function servicosMaisRealizados:iRelatorioServicosMaisRealizados;
    function servicosMenosRealizados:iRelatorioServicosMaisRealizados;

    function exportar: iRelatorioServicosMaisRealizados;
    function validarData(componet: tmaskEdit): iRelatorioServicosMaisRealizados;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioServicosMaisRealizados;
  end;

implementation

{ TRelatorioServicosMaisRealizados }

function TRelatorioServicosMaisRealizados.abrir: iRelatorioServicosMaisRealizados;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioServicosMaisRealizados.atualizar: iRelatorioServicosMaisRealizados;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioServicosMaisRealizados.cancelar: iRelatorioServicosMaisRealizados;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioServicosMaisRealizados.create;
begin
  FTabela := 'SERVICOS_MAIS_REALIZADOS1';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio servi�os mais realizados').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioServicosMaisRealizados.destroy;
begin

  inherited;
end;

function TRelatorioServicosMaisRealizados.ExecSql: iRelatorioServicosMaisRealizados;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioServicosMaisRealizados.exportar: iRelatorioServicosMaisRealizados;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Servi�os mais / menos realizados';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'Servi�o';
  pasta.cells[1, 3] := 'Quantidade';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_SERVICOS').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('SERVICO').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('QTDE').AsInteger;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioServicosMaisRealizados.fecharQuery: iRelatorioServicosMaisRealizados;
begin
  FQuery.TQuery.close;
end;

function TRelatorioServicosMaisRealizados.getCampo(value: string): iRelatorioServicosMaisRealizados;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioServicosMaisRealizados.getDataFinal(value: TDate): iRelatorioServicosMaisRealizados;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioServicosMaisRealizados.getDataInicial(value: TDate): iRelatorioServicosMaisRealizados;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioServicosMaisRealizados.getValor(value: string): iRelatorioServicosMaisRealizados;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioServicosMaisRealizados.listarGrid(value: TDataSource): iRelatorioServicosMaisRealizados;
begin

  result := self;

  FQuery.TQuery.FieldByName('ID_SERVICOS').DisplayLabel := 'C�d. Servi�os';
  FQuery.TQuery.FieldByName('SERVICO').DisplayLabel := 'Servi�os';
  FQuery.TQuery.FieldByName('QTDE').DisplayLabel := 'QTDE';

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioServicosMaisRealizados.new: iRelatorioServicosMaisRealizados;
begin
  result := self.create;
end;

function TRelatorioServicosMaisRealizados.nomeTabela(value: string): iRelatorioServicosMaisRealizados;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioServicosMaisRealizados.open(value: string): iRelatorioServicosMaisRealizados;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioServicosMaisRealizados.ordenarGrid(column: TColumn): iRelatorioServicosMaisRealizados;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioServicosMaisRealizados.pesquisar: iRelatorioServicosMaisRealizados;
begin
  result := self;
end;

function TRelatorioServicosMaisRealizados.servicosMaisRealizados: iRelatorioServicosMaisRealizados;
begin
   result := self;
   FQuery.ExecSql('Select * from SERVICOS_MAIS_REALIZADOS1 order by qtde desc')
end;

function TRelatorioServicosMaisRealizados.servicosMenosRealizados: iRelatorioServicosMaisRealizados;
begin
   result := self;
   FQuery.ExecSql('Select * from SERVICOS_MAIS_REALIZADOS1 order by qtde asc')
end;

function TRelatorioServicosMaisRealizados.sqlPesquisa: iRelatorioServicosMaisRealizados;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioServicosMaisRealizados.sqlPesquisaData: iRelatorioServicosMaisRealizados;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioServicosMaisRealizados.sqlPesquisaEstatica: iRelatorioServicosMaisRealizados;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioServicosMaisRealizados.validarData(componet: tmaskEdit):iRelatorioServicosMaisRealizados;
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
