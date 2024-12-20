unit UClasse.Relatorio.OS.Status;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TRelatorioOSStatus = class(TInterfacedObject, iRelatorioOSPorStatus)
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

    function nomeTabela(value: string): iRelatorioOSPorStatus;
    function getCampo(value: string): iRelatorioOSPorStatus;
    function getValor(value: string): iRelatorioOSPorStatus;
    function getDataInicial(value: TDate): iRelatorioOSPorStatus;
    function getDataFinal(value: TDate): iRelatorioOSPorStatus;
    function open(value: string): iRelatorioOSPorStatus;
    function pesquisar: iRelatorioOSPorStatus;
    function ExecSql: iRelatorioOSPorStatus;
    function sqlPesquisa: iRelatorioOSPorStatus;
    function sqlPesquisaData: iRelatorioOSPorStatus;
    function sqlPesquisaEstatica: iRelatorioOSPorStatus;

    function abrir: iRelatorioOSPorStatus;
    function atualizar: iRelatorioOSPorStatus;
    function cancelar: iRelatorioOSPorStatus;
    function fecharQuery: iRelatorioOSPorStatus;
    function listarGrid(value: TDataSource): iRelatorioOSPorStatus;
    function ordenarGrid(column: TColumn): iRelatorioOSPorStatus;

    function exportar: iRelatorioOSPorStatus;
    function validarData(componet: tmaskEdit): iRelatorioOSPorStatus;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioOSPorStatus;
  end;

implementation

{ TRelatorioOSStatus }

function TRelatorioOSStatus.abrir: iRelatorioOSPorStatus;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioOSStatus.atualizar: iRelatorioOSPorStatus;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioOSStatus.cancelar: iRelatorioOSPorStatus;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioOSStatus.create;
begin
  FTabela := 'VISUALIZAR_ORDENS_CLIENTES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio OS por Status').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioOSStatus.destroy;
begin

  inherited;
end;

function TRelatorioOSStatus.ExecSql: iRelatorioOSPorStatus;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioOSStatus.exportar: iRelatorioOSPorStatus;
begin
  result := self;
end;

function TRelatorioOSStatus.fecharQuery: iRelatorioOSPorStatus;
begin
  FQuery.TQuery.close;
end;

function TRelatorioOSStatus.getCampo(value: string): iRelatorioOSPorStatus;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioOSStatus.getDataFinal(value: TDate): iRelatorioOSPorStatus;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioOSStatus.getDataInicial(value: TDate): iRelatorioOSPorStatus;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioOSStatus.getValor(value: string): iRelatorioOSPorStatus;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioOSStatus.listarGrid(value: TDataSource): iRelatorioOSPorStatus;
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
    FieldByName('DEFEITO_RELATADO').Visible := false;
    FieldByName('MARCAS').Visible := false;
    FieldByName('SITUACAO_DA_ORDEM').DisplayLabel := 'Situa��o da ordem';
    FieldByName('DATA_DE_ENTRADA').DisplayLabel := 'Entrada';
    FieldByName('DATA_SAIDA').DisplayLabel := 'Sa�da';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('VALOR_OS').DisplayLabel := 'Valor da OS';
    FieldByName('STATUS').DisplayLabel := 'Status';

    FieldByName('NOME_CLIENTE').DisplayWidth := 40;
    FieldByName('EQUIPAMENTO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioOSStatus.new: iRelatorioOSPorStatus;
begin
  result := self.create;
end;

function TRelatorioOSStatus.nomeTabela(value: string): iRelatorioOSPorStatus;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioOSStatus.open(value: string): iRelatorioOSPorStatus;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioOSStatus.ordenarGrid(column: TColumn): iRelatorioOSPorStatus;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioOSStatus.pesquisar: iRelatorioOSPorStatus;
begin
  result := self;
end;

function TRelatorioOSStatus.sqlPesquisa: iRelatorioOSPorStatus;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioOSStatus.sqlPesquisaData: iRelatorioOSPorStatus;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioOSStatus.sqlPesquisaEstatica: iRelatorioOSPorStatus;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioOSStatus.validarData(componet: tmaskEdit):iRelatorioOSPorStatus;
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
