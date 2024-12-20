unit UClasse.Relatorio.Logs.Eventos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioLogEventos = class(TInterfacedObject, iRelatorioLogEventos)
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

    function nomeTabela(value: string): iRelatorioLogEventos;
    function getCampo(value: string): iRelatorioLogEventos;
    function getValor(value: string): iRelatorioLogEventos;
    function getDataInicial(value: TDate): iRelatorioLogEventos;
    function getDataFinal(value: TDate): iRelatorioLogEventos;
    function open(value: string): iRelatorioLogEventos;
    function pesquisar: iRelatorioLogEventos;
    function ExecSql: iRelatorioLogEventos;
    function sqlPesquisa: iRelatorioLogEventos;
    function sqlPesquisaData: iRelatorioLogEventos;
    function sqlPesquisaEstatica: iRelatorioLogEventos;

    function abrir: iRelatorioLogEventos;
    function atualizar: iRelatorioLogEventos;
    function cancelar: iRelatorioLogEventos;
    function fecharQuery: iRelatorioLogEventos;
    function listarGrid(value: TDataSource): iRelatorioLogEventos;
    function ordenarGrid(column: TColumn): iRelatorioLogEventos;

    function exportar: iRelatorioLogEventos;
    function validarData(componet: tmaskEdit):iRelatorioLogEventos;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioLogEventos;
  end;

implementation

{ TRelatorioLogEventos }

function TRelatorioLogEventos.abrir: iRelatorioLogEventos;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioLogEventos.atualizar: iRelatorioLogEventos;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioLogEventos.cancelar: iRelatorioLogEventos;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioLogEventos.create;
begin
  FTabela := 'LOG_EVENTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio Log de Eventos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioLogEventos.destroy;
begin

  inherited;
end;

function TRelatorioLogEventos.ExecSql: iRelatorioLogEventos;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioLogEventos.exportar: iRelatorioLogEventos;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Log de Eventos';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Data';
  pasta.cells[1, 2] := 'Horario';
  pasta.cells[1, 3] := 'C�d. Funcion�rio';
  pasta.cells[1, 4] := 'Nome do funcion�rio';
  pasta.cells[1, 5] := 'Registro';
  pasta.cells[1, 6] := 'Opera��o';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('DATA').AsDateTime;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('HORA').AsDateTime;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('REGISTRO').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('OPERACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioLogEventos.fecharQuery: iRelatorioLogEventos;
begin
  FQuery.TQuery.close;
end;

function TRelatorioLogEventos.getCampo(value: string): iRelatorioLogEventos;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioLogEventos.getDataFinal(value: TDate): iRelatorioLogEventos;
begin
  result := self;
  FDataFinal := value;
end;

function TRelatorioLogEventos.getDataInicial(value: TDate): iRelatorioLogEventos;
begin
  result := self;
  FDataInicial := value;
end;

function TRelatorioLogEventos.getValor(value: string): iRelatorioLogEventos;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioLogEventos.listarGrid(value: TDataSource): iRelatorioLogEventos;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').Visible := false;
    FieldByName('DATA').DisplayLabel := 'Data';
    FieldByName('HORA').DisplayLabel := 'Horario';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do funcion�rio';
    FieldByName('REGISTRO').DisplayLabel := 'Registro';
    FieldByName('OPERACAO').DisplayLabel := 'Opera��o';

    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 40;
    FieldByName('REGISTRO').DisplayWidth := 40;
    FieldByName('OPERACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioLogEventos.new: iRelatorioLogEventos;
begin
  result := self.create;
end;

function TRelatorioLogEventos.nomeTabela(value: string): iRelatorioLogEventos;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioLogEventos.open(value: string): iRelatorioLogEventos;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioLogEventos.ordenarGrid(column: TColumn): iRelatorioLogEventos;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioLogEventos.pesquisar: iRelatorioLogEventos;
begin
  result := self;
end;

function TRelatorioLogEventos.sqlPesquisa: iRelatorioLogEventos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioLogEventos.sqlPesquisaData: iRelatorioLogEventos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioLogEventos.sqlPesquisaEstatica: iRelatorioLogEventos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioLogEventos.validarData(componet: tmaskEdit):iRelatorioLogEventos;
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
