unit UClasse.Listar.Ordens.Servico;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityListarOrdensServico = class(TInterfacedObject, iListarOrdensServico)
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

    function nomeTabela(value: string): iListarOrdensServico;
    function getCampo(value: string): iListarOrdensServico;
    function getValor(value: string): iListarOrdensServico;
    function getDataInicial(value: TDate): iListarOrdensServico;
    function getDataFinal(value: TDate): iListarOrdensServico;
    function open(value: string): iListarOrdensServico;
    function pesquisar: iListarOrdensServico;
    function ExecSql: iListarOrdensServico;
    function sqlPesquisa: iListarOrdensServico;
    function sqlPesquisaData: iListarOrdensServico;
    function sqlPesquisaEstatica: iListarOrdensServico;

    function abrir: iListarOrdensServico;
    function fecharQuery: iListarOrdensServico;
    function listarGrid(value: TDataSource): iListarOrdensServico;
    function ordenarGrid(column: TColumn): iListarOrdensServico;
    function atualizar: iListarOrdensServico;

    function exportar: iListarOrdensServico;

    constructor create;
    destructor destroy; override;
    class function new: iListarOrdensServico;
  end;

implementation

uses
  System.Win.ComObj;

{ TEntityListarOrdensServico }

function TEntityListarOrdensServico.abrir: iListarOrdensServico;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityListarOrdensServico.atualizar: iListarOrdensServico;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

constructor TEntityListarOrdensServico.create;
begin
  FTabela := 'VISUALIZAR_ORDENS_CLIENTES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Lista de ordens').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityListarOrdensServico.destroy;
begin

  inherited;
end;

function TEntityListarOrdensServico.ExecSql: iListarOrdensServico;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityListarOrdensServico.exportar: iListarOrdensServico;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Lista de O.S selecionadas';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo da O.S';
  pasta.cells[1, 2] := 'C�digo do cliente';
  pasta.cells[1, 3] := 'Nome do cliente';
  pasta.cells[1, 4] := 'CPF ou CNPJ';
  pasta.cells[1, 5] := 'Telefone';
  pasta.cells[1, 6] := 'Celular';
  pasta.cells[1, 7] := 'E-Mail';
  pasta.cells[1, 8] := 'Equipamento';
  pasta.cells[1, 9] := 'Defeito relatado';
  pasta.cells[1, 10] := 'Marca';
  pasta.cells[1, 11] := 'Situa��o da ordem';
  pasta.cells[1, 12] := 'Data de entrada';
  pasta.cells[1, 13] := 'Data de sa�da';
  pasta.cells[1, 14] := 'PGTO';
  pasta.cells[1, 15] := 'Status';

  try
    while not FQuery.TQuery.Eof do
    begin

      with FQuery.TQuery do
      begin
        pasta.cells[linha, 1] := FieldByName('ID_ORDEM').AsInteger;
        pasta.cells[linha, 2] := FieldByName('ID_CLIENTE').AsInteger;
        pasta.cells[linha, 3] := FieldByName('NOME_CLIENTE').AsString;
        pasta.cells[linha, 4] := FieldByName('CPF_CNPJ').AsString;
        pasta.cells[linha, 5] := FieldByName('TELEFONE').AsString;
        pasta.cells[linha, 6] := FieldByName('CELULAR').AsString;
        pasta.cells[linha, 7] := FieldByName('EMAIL').AsString;
        pasta.cells[linha, 8] := FieldByName('EQUIPAMENTO').AsString;
        pasta.cells[linha, 9] := FieldByName('DEFEITO_RELATADO').AsString;
        pasta.cells[linha, 10] := FieldByName('MARCAS').AsString;
        pasta.cells[linha, 11] := FieldByName('SITUACAO_DA_ORDEM').AsString;
        pasta.cells[linha, 12] := FieldByName('DATA_DE_ENTRADA').AsDateTime;

        if FieldByName('DATA_SAIDA').AsDateTime <> StrToDateTime('30/12/1899') then
          pasta.cells[linha, 13] := FieldByName('DATA_SAIDA').AsDateTime
        else
          pasta.cells[linha, 13] := ' ';

        pasta.cells[linha, 14] := FieldByName('PGTO').AsString;
        pasta.cells[linha, 15] := FieldByName('STATUS').AsString;
      end;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityListarOrdensServico.fecharQuery: iListarOrdensServico;
begin
  FQuery.TQuery.close;
end;

function TEntityListarOrdensServico.getCampo(value: string)
  : iListarOrdensServico;
begin
  result := self;
  FCampo := value;
end;

function TEntityListarOrdensServico.getDataFinal(value: TDate)
  : iListarOrdensServico;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityListarOrdensServico.getDataInicial(value: TDate)
  : iListarOrdensServico;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityListarOrdensServico.getValor(value: string)
  : iListarOrdensServico;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityListarOrdensServico.listarGrid(value: TDataSource)
  : iListarOrdensServico;
begin

  result := self;
  with FQuery.TQuery do
  begin
    FieldByName('ID_ORDEM').DisplayLabel := 'Ordem';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Nome do cliente';
    FieldByName('CPF_CNPJ').DisplayLabel := 'CPF ou CNPJ';
    FieldByName('TELEFONE').visible := false;
    FieldByName('CELULAR').visible := false;
    FieldByName('EMAIL').visible := false;
    FieldByName('EQUIPAMENTO').DisplayLabel := 'Equipamento';
    FieldByName('DEFEITO_RELATADO').visible := false;
    FieldByName('MARCAS').visible := false;
    FieldByName('SITUACAO_DA_ORDEM').DisplayLabel := 'Situa��o da ordem';
    FieldByName('DATA_DE_ENTRADA').DisplayLabel := 'Entrada';
    FieldByName('DATA_SAIDA').DisplayLabel := 'Saida';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('VALOR_OS').DisplayLabel := 'Valor da OS';
    FieldByName('STATUS').DisplayLabel := 'Status';

    FieldByName('ID_ORDEM').DisplayWidth := 15;
    FieldByName('NOME_CLIENTE').DisplayWidth := 30;
    FieldByName('EQUIPAMENTO').DisplayWidth := 25;
    FieldByName('SITUACAO_DA_ORDEM').DisplayWidth := 15;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityListarOrdensServico.new: iListarOrdensServico;
begin
  result := self.create;
end;

function TEntityListarOrdensServico.nomeTabela(value: string)
  : iListarOrdensServico;
begin
  result := self;
  FTabela := value;
end;

function TEntityListarOrdensServico.open(value: string): iListarOrdensServico;
begin
  FQuery.Query(FTabela);
end;

function TEntityListarOrdensServico.ordenarGrid(column: TColumn)
  : iListarOrdensServico;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityListarOrdensServico.pesquisar: iListarOrdensServico;
begin
  result := self;
end;

function TEntityListarOrdensServico.sqlPesquisa: iListarOrdensServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityListarOrdensServico.sqlPesquisaData: iListarOrdensServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityListarOrdensServico.sqlPesquisaEstatica: iListarOrdensServico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
