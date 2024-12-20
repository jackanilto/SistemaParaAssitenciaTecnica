unit UClasse.Relatorio.Reparos.Por.Periodo;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioReparosPeriodo = class(TInterfacedObject, iRelatorioReparosPorPeriodo)
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

    function nomeTabela(value: string): iRelatorioReparosPorPeriodo;
    function getCampo(value: string): iRelatorioReparosPorPeriodo;
    function getValor(value: string): iRelatorioReparosPorPeriodo;
    function getDataInicial(value: TDate): iRelatorioReparosPorPeriodo;
    function getDataFinal(value: TDate): iRelatorioReparosPorPeriodo;
    function open(value: string): iRelatorioReparosPorPeriodo;
    function pesquisar: iRelatorioReparosPorPeriodo;
    function ExecSql: iRelatorioReparosPorPeriodo;
    function sqlPesquisa: iRelatorioReparosPorPeriodo;
    function sqlPesquisaData: iRelatorioReparosPorPeriodo;
    function sqlPesquisaEstatica: iRelatorioReparosPorPeriodo;

    function abrir: iRelatorioReparosPorPeriodo;
    function atualizar: iRelatorioReparosPorPeriodo;
    function cancelar: iRelatorioReparosPorPeriodo;
    function fecharQuery: iRelatorioReparosPorPeriodo;
    function listarGrid(value: TDataSource): iRelatorioReparosPorPeriodo;
    function ordenarGrid(column: TColumn): iRelatorioReparosPorPeriodo;

    function exportar: iRelatorioReparosPorPeriodo;
    function validarData(componet: tmaskEdit):iRelatorioReparosPorPeriodo;

    function getCodigo(value: integer): iRelatorioReparosPorPeriodo;
    function getNome(value: string): iRelatorioReparosPorPeriodo;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioReparosPorPeriodo;
  end;

implementation

{ TRelatorioReparosPeriodo }

function TRelatorioReparosPeriodo.abrir: iRelatorioReparosPorPeriodo;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioReparosPeriodo.atualizar: iRelatorioReparosPorPeriodo;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioReparosPeriodo.cancelar: iRelatorioReparosPorPeriodo;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioReparosPeriodo.create;
begin
  FTabela := 'VISUALIZAR_ORDENS_CLIENTES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio Reparos por per�odo').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioReparosPeriodo.destroy;
begin

  inherited;
end;

function TRelatorioReparosPeriodo.ExecSql: iRelatorioReparosPorPeriodo;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioReparosPeriodo.exportar: iRelatorioReparosPorPeriodo;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Reparos por Per�odo';
  pasta.visible := true;

  pasta.cells[1, 1] := 'OS';
  pasta.cells[1, 2] := 'C�d. Cliente';
  pasta.cells[1, 3] := 'Nome cliente';
  pasta.cells[1, 4] := 'Equipamento';
  pasta.cells[1, 5] := 'Defeito';
  pasta.cells[1, 6] := 'Marcas';
  pasta.cells[1, 7] := 'Situa��o da ordem';
  pasta.cells[1, 8] := 'Entrada';
  pasta.cells[1, 9] := 'Sa�da';
  pasta.cells[1, 10] := 'Pago';
  pasta.cells[1, 11] := 'Valor da os';
  pasta.cells[1, 12] := 'Status';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('NOME_CLIENTE').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('EQUIPAMENTO').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('DEFEITO_RELATADO').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('MARCAS').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('SITUACAO_DA_ORDEM').AsString;

      if FQuery.TQuery.FieldByName('DATA_DE_ENTRADA').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('DATA_DE_ENTRADA').AsDateTime
      else
        pasta.cells[linha, 8] := ' ';

     if FQuery.TQuery.FieldByName('DATA_SAIDA').AsDateTime <> StrToDate('30/12/1899') then
       pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DATA_SAIDA').AsDateTime
     else
      pasta.cells[linha, 9] := ' ';


      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('PGTO').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('VALOR_OS').AsCurrency;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('STATUS').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioReparosPeriodo.fecharQuery: iRelatorioReparosPorPeriodo;
begin
  FQuery.TQuery.close;
end;

function TRelatorioReparosPeriodo.getCampo(value: string): iRelatorioReparosPorPeriodo;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioReparosPeriodo.getCodigo(value: integer): iRelatorioReparosPorPeriodo;
begin
  result := self;
  FCodigo := value;
end;

function TRelatorioReparosPeriodo.getDataFinal(value: TDate): iRelatorioReparosPorPeriodo;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioReparosPeriodo.getDataInicial(value: TDate): iRelatorioReparosPorPeriodo;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioReparosPeriodo.getNome(value: string): iRelatorioReparosPorPeriodo;
begin
  result := self;
  FNome := value;
end;

function TRelatorioReparosPeriodo.getValor(value: string): iRelatorioReparosPorPeriodo;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioReparosPeriodo.listarGrid(value: TDataSource): iRelatorioReparosPorPeriodo;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID_ORDEM').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Nome do cliente';
    FieldByName('CPF_CNPJ').Visible := false;
    FieldByName('TELEFONE').Visible := false;
    FieldByName('CELULAR').Visible := false;
    FieldByName('EMAIL').Visible := false;
    FieldByName('EQUIPAMENTO').DisplayLabel := 'Equipamento';
    FieldByName('DEFEITO_RELATADO').DisplayLabel := 'Defeito';
    FieldByName('MARCAS').DisplayLabel := 'Marca';
    FieldByName('SITUACAO_DA_ORDEM').DisplayLabel := 'Situa��o da ordem';
    FieldByName('DATA_DE_ENTRADA').DisplayLabel := 'Entrada';
    FieldByName('DATA_SAIDA').DisplayLabel := 'Sa�da';
    FieldByName('PGTO').DisplayLabel := 'Pago';
    FieldByName('VALOR_OS').DisplayLabel := 'Total da OS';
    FieldByName('STATUS').DisplayLabel := 'Status';

    FieldByName('NOME_CLIENTE').DisplayWidth := 40;
    FieldByName('EQUIPAMENTO').DisplayWidth := 40;
    FieldByName('DEFEITO_RELATADO').DisplayWidth := 30;
    FieldByName('MARCAS').DisplayWidth := 30;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioReparosPeriodo.new: iRelatorioReparosPorPeriodo;
begin
  result := self.create;
end;

function TRelatorioReparosPeriodo.nomeTabela(value: string): iRelatorioReparosPorPeriodo;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioReparosPeriodo.open(value: string): iRelatorioReparosPorPeriodo;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioReparosPeriodo.ordenarGrid(column: TColumn): iRelatorioReparosPorPeriodo;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioReparosPeriodo.pesquisar: iRelatorioReparosPorPeriodo;
begin
  result := self;
end;

function TRelatorioReparosPeriodo.sqlPesquisa: iRelatorioReparosPorPeriodo;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioReparosPeriodo.sqlPesquisaData: iRelatorioReparosPorPeriodo;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioReparosPeriodo.sqlPesquisaEstatica: iRelatorioReparosPorPeriodo;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioReparosPeriodo.validarData(componet: tmaskEdit):iRelatorioReparosPorPeriodo;
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
