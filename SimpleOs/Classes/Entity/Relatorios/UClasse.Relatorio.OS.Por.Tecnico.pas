unit UClasse.Relatorio.OS.Por.Tecnico;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioOSPorTecnico = class(TInterfacedObject, iRelatorioOSPorTecnico)
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

    function nomeTabela(value: string): iRelatorioOSPorTecnico;
    function getCampo(value: string): iRelatorioOSPorTecnico;
    function getValor(value: string): iRelatorioOSPorTecnico;
    function getDataInicial(value: TDate): iRelatorioOSPorTecnico;
    function getDataFinal(value: TDate): iRelatorioOSPorTecnico;
    function open(value: string): iRelatorioOSPorTecnico;
    function pesquisar: iRelatorioOSPorTecnico;
    function ExecSql: iRelatorioOSPorTecnico;
    function sqlPesquisa: iRelatorioOSPorTecnico;
    function sqlPesquisaData: iRelatorioOSPorTecnico;
    function sqlPesquisaEstatica: iRelatorioOSPorTecnico;

    function abrir: iRelatorioOSPorTecnico;
    function atualizar: iRelatorioOSPorTecnico;
    function cancelar: iRelatorioOSPorTecnico;
    function fecharQuery: iRelatorioOSPorTecnico;
    function listarGrid(value: TDataSource): iRelatorioOSPorTecnico;
    function ordenarGrid(column: TColumn): iRelatorioOSPorTecnico;

    function exportar: iRelatorioOSPorTecnico;
    function validarData(componet: tmaskEdit):iRelatorioOSPorTecnico;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioOSPorTecnico;
  end;

implementation

{ TRelatorioOSPorTecnico }

function TRelatorioOSPorTecnico.abrir: iRelatorioOSPorTecnico;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioOSPorTecnico.atualizar: iRelatorioOSPorTecnico;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioOSPorTecnico.cancelar: iRelatorioOSPorTecnico;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioOSPorTecnico.create;
begin
  FTabela := 'VISUALIZAR_ORDENS_TECNICOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio de OS por t�cnico').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioOSPorTecnico.destroy;
begin

  inherited;
end;

function TRelatorioOSPorTecnico.ExecSql: iRelatorioOSPorTecnico;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioOSPorTecnico.exportar: iRelatorioOSPorTecnico;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio OS por T�cnico';
  pasta.visible := true;

  pasta.cells[1, 1] := 'OS';
  pasta.cells[1, 2] := 'C�d. T�cnico';
  pasta.cells[1, 3] := 'T�cnico';
  pasta.cells[1, 4] := 'Equipamento';
  pasta.cells[1, 5] := 'Valor da OS';
  pasta.cells[1, 6] := 'Situa��o da ordem';
  pasta.cells[1, 7] := 'PGTO';
  pasta.cells[1, 8] := 'Entrada';
  pasta.cells[1, 9] := 'Sa�da';
  pasta.cells[1, 10] := 'Status';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_TECNICO_RESPONSAVEL').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('TECNICO_RESPONSAVEL').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('EQUIPAMENTO').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('TOTAL_ORCAMENTO').AsCurrency;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('SITUACAO_DA_ORDEM').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('PGTO').AsString;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('DATA_ENTRADA').AsDateTime;

      if FQuery.TQuery.FieldByName('DATA_FINALIZACAO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DATA_FINALIZACAO').AsDateTime
      else
        pasta.cells[linha, 9] := ' ';

      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('STATUS').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioOSPorTecnico.fecharQuery: iRelatorioOSPorTecnico;
begin
  FQuery.TQuery.close;
end;

function TRelatorioOSPorTecnico.getCampo(value: string): iRelatorioOSPorTecnico;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioOSPorTecnico.getDataFinal(value: TDate): iRelatorioOSPorTecnico;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioOSPorTecnico.getDataInicial(value: TDate): iRelatorioOSPorTecnico;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioOSPorTecnico.getValor(value: string): iRelatorioOSPorTecnico;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioOSPorTecnico.listarGrid(value: TDataSource): iRelatorioOSPorTecnico;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID_ORDEM').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').Visible := false;
    FieldByName('NOME_CLIENTE').Visible := false;
    FieldByName('ID_TECNICO_RESPONSAVEL').DisplayLabel := 'C�d. T�cnico';
    FieldByName('TECNICO_RESPONSAVEL').DisplayLabel := 'T�cnico';
    FieldByName('EQUIPAMENTO').DisplayLabel := 'Equipamento';
    FieldByName('DEFEITO_RELATADO').Visible := false;
    FieldByName('MARCAS').Visible := false;
    FieldByName('MODELO').Visible := false;
    FieldByName('NUMERO_SERIE').Visible := false;
    FieldByName('DATA_FABRICACAO').Visible := false;
    FieldByName('LAUDO_DO_TECNICO').Visible := false;
    FieldByName('SOLUCAO_DO_PROBLEMA').Visible := false;
    FieldByName('VALOR_DA_ORDEM').Visible := false;
    FieldByName('DESCONTO').Visible := false;
    FieldByName('ACRESCIMO').Visible := false;
    FieldByName('TOTAL_ORCAMENTO').DisplayLabel := 'Total da OS';
    FieldByName('ID_FUNCIONARIO').Visible := false;
    FieldByName('NOME_FUNCIONARIO').Visible := false;
    FieldByName('RETORNO').Visible := false;
    FieldByName('DATA_RETORNO').Visible := false;
    FieldByName('SITUACAO_DA_ORDEM').DisplayLabel := 'Situa��o da OS';
    FieldByName('TOTAL_PARCELAS').Visible := false;
    FieldByName('VALOR_DA_PARCELA').Visible := false;
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('PRIORIDADE').Visible := false;
    FieldByName('DATA_ENTRADA').DisplayLabel := 'Entrada';
    FieldByName('DATA_FINALIZACAO').DisplayLabel := 'Sa�da';
    FieldByName('HORA_SAIDA').Visible := false;
    FieldByName('DATA_BASE_VENCIMENTO').Visible := false;
    FieldByName('OBSERVACAO').Visible := false;
    FieldByName('STATUS').DisplayLabel := 'Status';

    FieldByName('EQUIPAMENTO').DisplayWidth := 30;
    FieldByName('TECNICO_RESPONSAVEL').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioOSPorTecnico.new: iRelatorioOSPorTecnico;
begin
  result := self.create;
end;

function TRelatorioOSPorTecnico.nomeTabela(value: string): iRelatorioOSPorTecnico;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioOSPorTecnico.open(value: string): iRelatorioOSPorTecnico;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioOSPorTecnico.ordenarGrid(column: TColumn): iRelatorioOSPorTecnico;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioOSPorTecnico.pesquisar: iRelatorioOSPorTecnico;
begin
  result := self;
end;

function TRelatorioOSPorTecnico.sqlPesquisa: iRelatorioOSPorTecnico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioOSPorTecnico.sqlPesquisaData: iRelatorioOSPorTecnico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioOSPorTecnico.sqlPesquisaEstatica: iRelatorioOSPorTecnico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioOSPorTecnico.validarData(componet: tmaskEdit):iRelatorioOSPorTecnico;
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
