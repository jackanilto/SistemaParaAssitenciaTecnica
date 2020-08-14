unit UClasse.Relatorio.OS.Servicos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioOSServicos = class(TInterfacedObject, iRelatoriOSServicosRealiados)
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

    function nomeTabela(value: string): iRelatoriOSServicosRealiados;
    function getCampo(value: string): iRelatoriOSServicosRealiados;
    function getValor(value: string): iRelatoriOSServicosRealiados;
    function getDataInicial(value: TDate): iRelatoriOSServicosRealiados;
    function getDataFinal(value: TDate): iRelatoriOSServicosRealiados;
    function open(value: string): iRelatoriOSServicosRealiados;
    function pesquisar: iRelatoriOSServicosRealiados;
    function ExecSql: iRelatoriOSServicosRealiados;
    function sqlPesquisa: iRelatoriOSServicosRealiados;
    function sqlPesquisaData: iRelatoriOSServicosRealiados;
    function sqlPesquisaEstatica: iRelatoriOSServicosRealiados;

    function abrir: iRelatoriOSServicosRealiados;
    function atualizar: iRelatoriOSServicosRealiados;
    function cancelar: iRelatoriOSServicosRealiados;
    function fecharQuery: iRelatoriOSServicosRealiados;
    function listarGrid(value: TDataSource): iRelatoriOSServicosRealiados;
    function ordenarGrid(column: TColumn): iRelatoriOSServicosRealiados;


    function exportar: iRelatoriOSServicosRealiados;
    function validarData(componet: tmaskEdit): iRelatoriOSServicosRealiados;

    constructor create;
    destructor destroy; override;
    class function new: iRelatoriOSServicosRealiados;
  end;

implementation

{ TRelatorioOSServicos }

function TRelatorioOSServicos.abrir: iRelatoriOSServicosRealiados;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioOSServicos.atualizar: iRelatoriOSServicosRealiados;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioOSServicos.cancelar: iRelatoriOSServicosRealiados;
begin
  FQuery.TQuery.Cancel;
end;

constructor TRelatorioOSServicos.create;
begin
  FTabela := 'SERVICOS_ORDEM';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório OS - Serviços realizados').getCodigoFuncionario
    (funcionarioLogado);

end;

destructor TRelatorioOSServicos.destroy;
begin

  inherited;
end;

function TRelatorioOSServicos.ExecSql: iRelatoriOSServicosRealiados;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioOSServicos.exportar: iRelatoriOSServicosRealiados;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório OS - Serviços';
  pasta.visible := true;

  pasta.cells[1, 1] := 'OS';
  pasta.cells[1, 2] := 'Cód. Serviço';
  pasta.cells[1, 3] := 'Serviço realizado';
  pasta.cells[1, 4] := 'Valor';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_SERVICO').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('SERVICO').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('VALOR').AsCurrency;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioOSServicos.fecharQuery: iRelatoriOSServicosRealiados;
begin
  FQuery.TQuery.close;
end;

function TRelatorioOSServicos.getCampo(value: string): iRelatoriOSServicosRealiados;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioOSServicos.getDataFinal(value: TDate): iRelatoriOSServicosRealiados;
begin
  result := self;
  FDataFinal := value;
end;

function TRelatorioOSServicos.getDataInicial(value: TDate): iRelatoriOSServicosRealiados;
begin
  result := self;
  FDataInicial := value;
end;

function TRelatorioOSServicos.getValor(value: string): iRelatoriOSServicosRealiados;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioOSServicos.listarGrid(value: TDataSource): iRelatoriOSServicosRealiados;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID').Visible := false;
    FieldByName('ID_ORDEM').visible := false;
    FieldByName('ID_SERVICO').Visible := false;
    FieldByName('SERVICO').DisplayLabel := 'Serviços';
    FieldByName('VALOR').DisplayLabel := 'Valor';

    FieldByName('SERVICO').DisplayWidth := 45;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioOSServicos.new: iRelatoriOSServicosRealiados;
begin
  result := self.create;
end;

function TRelatorioOSServicos.nomeTabela(value: string): iRelatoriOSServicosRealiados;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioOSServicos.open(value: string): iRelatoriOSServicosRealiados;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioOSServicos.ordenarGrid(column: TColumn): iRelatoriOSServicosRealiados;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioOSServicos.pesquisar: iRelatoriOSServicosRealiados;
begin
  result := self;
end;

function TRelatorioOSServicos.sqlPesquisa: iRelatoriOSServicosRealiados;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioOSServicos.sqlPesquisaData: iRelatoriOSServicosRealiados;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioOSServicos.sqlPesquisaEstatica: iRelatoriOSServicosRealiados;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioOSServicos.validarData(componet: tmaskEdit):iRelatoriOSServicosRealiados;
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
