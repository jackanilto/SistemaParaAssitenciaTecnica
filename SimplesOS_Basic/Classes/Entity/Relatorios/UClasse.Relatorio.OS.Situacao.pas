unit UClasse.Relatorio.OS.Situacao;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioOSSituacao = class(TInterfacedObject, iRelatorioOSPorSituacao)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;
    FSituacao:String;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iRelatorioOSPorSituacao;
    function getCampo(value: string): iRelatorioOSPorSituacao;
    function getValor(value: string): iRelatorioOSPorSituacao;
    function getDataInicial(value: TDate): iRelatorioOSPorSituacao;
    function getDataFinal(value: TDate): iRelatorioOSPorSituacao;
    function open(value: string): iRelatorioOSPorSituacao;
    function pesquisar: iRelatorioOSPorSituacao;
    function ExecSql: iRelatorioOSPorSituacao;
    function sqlPesquisa: iRelatorioOSPorSituacao;
    function sqlPesquisaData: iRelatorioOSPorSituacao;
    function sqlPesquisaEstatica: iRelatorioOSPorSituacao;

    function abrir: iRelatorioOSPorSituacao;
    function atualizar: iRelatorioOSPorSituacao;
    function cancelar: iRelatorioOSPorSituacao;
    function fecharQuery: iRelatorioOSPorSituacao;
    function listarGrid(value: TDataSource): iRelatorioOSPorSituacao;
    function ordenarGrid(column: TColumn): iRelatorioOSPorSituacao;

    function getSituacao(value:string):iRelatorioOSPorSituacao;
    function selecionarOSPorSituacaoECampo: iRelatorioOSPorSituacao;

    function exportar: iRelatorioOSPorSituacao;
    function validarData(componet: tmaskEdit): iRelatorioOSPorSituacao;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioOSPorSituacao;
  end;

implementation

{ TRelatorioOSSituacao }

function TRelatorioOSSituacao.abrir: iRelatorioOSPorSituacao;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioOSSituacao.atualizar: iRelatorioOSPorSituacao;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioOSSituacao.cancelar: iRelatorioOSPorSituacao;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioOSSituacao.create;
begin
  FTabela := 'VISUALIZAR_ORDENS_CLIENTES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio OS por Status').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioOSSituacao.destroy;
begin

  inherited;
end;

function TRelatorioOSSituacao.ExecSql: iRelatorioOSPorSituacao;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioOSSituacao.exportar: iRelatorioOSPorSituacao;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Situa��o das OS';
  pasta.visible := true;

  pasta.cells[1, 1] := 'OS';
  pasta.cells[1, 2] := 'C�d. Cliente';
  pasta.cells[1, 3] := 'Cliente';
  pasta.cells[1, 4] := 'CPF ou CNPJ';
  pasta.cells[1, 5] := 'Telefone';
  pasta.cells[1, 6] := 'Celular';
  pasta.cells[1, 7] := 'E-Mail';
  pasta.cells[1, 8] := 'Equipamento';
  pasta.cells[1, 9] := 'Defeito relatado';
  pasta.cells[1, 10] := 'Situa��o';
  pasta.cells[1, 11] := 'Marca';
  pasta.cells[1, 12] := 'Entrada';
  pasta.cells[1, 13] := 'Sa�da';
  pasta.cells[1, 14] := 'PGTO';
  pasta.cells[1, 15] := 'Valor';
  pasta.cells[1, 16] := 'Status';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('NOME_CLIENTE').AsString;
      pasta.cells[linha, 4] := '"'+FQuery.TQuery.FieldByName('CPF_CNPJ').AsString+'"';
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('TELEFONE').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('CELULAR').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('EMAIL').AsString;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('EQUIPAMENTO').AsString;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DEFEITO_RELATADO').AsString;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('MARCAS').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('SITUACAO_DA_ORDEM').AsString;

      if FQuery.TQuery.FieldByName('DATA_DE_ENTRADA').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('DATA_DE_ENTRADA').AsDateTime
      else
        pasta.cells[linha, 12] := '';

      if FQuery.TQuery.FieldByName('DATA_SAIDA').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('DATA_SAIDA').AsDateTime
      else
        pasta.cells[linha, 13] := '';

      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('PGTO').AsString;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('VALOR_OS').AsCurrency;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('STATUS').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;
function TRelatorioOSSituacao.fecharQuery: iRelatorioOSPorSituacao;
begin
  FQuery.TQuery.close;
end;

function TRelatorioOSSituacao.getCampo(value: string): iRelatorioOSPorSituacao;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioOSSituacao.getDataFinal(value: TDate)
  : iRelatorioOSPorSituacao;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioOSSituacao.getDataInicial(value: TDate)
  : iRelatorioOSPorSituacao;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioOSSituacao.getSituacao(
  value: string): iRelatorioOSPorSituacao;
begin

  Result := self;

  FSituacao := value;

end;

function TRelatorioOSSituacao.getValor(value: string): iRelatorioOSPorSituacao;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioOSSituacao.listarGrid(value: TDataSource)
  : iRelatorioOSPorSituacao;
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

class function TRelatorioOSSituacao.new: iRelatorioOSPorSituacao;
begin
  result := self.create;
end;

function TRelatorioOSSituacao.nomeTabela(value: string)
  : iRelatorioOSPorSituacao;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioOSSituacao.open(value: string): iRelatorioOSPorSituacao;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioOSSituacao.ordenarGrid(column: TColumn)
  : iRelatorioOSPorSituacao;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioOSSituacao.pesquisar: iRelatorioOSPorSituacao;
begin
  result := self;
end;

function TRelatorioOSSituacao.selecionarOSPorSituacaoECampo
  : iRelatorioOSPorSituacao;
begin

  result := self;

  with FQuery do
  begin
//    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add
      ('select * from VISUALIZAR_ORDENS_CLIENTES where'+
      ' SITUACAO_DA_ORDEM =:s and '+FCampo+' between :d1 and :d2');
    TQuery.ParamByName('d1').AsDate := FDataInicial;
    TQuery.ParamByName('d2').AsDate := FDataFinal;
    TQuery.ParamByName('s').AsString := FSituacao;
    TQuery.Active := true;
  end;

end;

function TRelatorioOSSituacao.sqlPesquisa: iRelatorioOSPorSituacao;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioOSSituacao.sqlPesquisaData: iRelatorioOSPorSituacao;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioOSSituacao.sqlPesquisaEstatica: iRelatorioOSPorSituacao;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioOSSituacao.validarData(componet: tmaskEdit)
  : iRelatorioOSPorSituacao;
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
