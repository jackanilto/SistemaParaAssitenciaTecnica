unit UClasse.Relatorio.Aniversariantes;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.DateUtils, System.Win.ComObj;

type

  TRelatorioAniversariantes = class(TInterfacedObject,
    iRelatorioAniversariantes)
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

    function nomeTabela(value: string): iRelatorioAniversariantes;
    function getCampo(value: string): iRelatorioAniversariantes;
    function getValor(value: string): iRelatorioAniversariantes;
    function getDataInicial(value: TDate): iRelatorioAniversariantes;
    function getDataFinal(value: TDate): iRelatorioAniversariantes;
    function open(value: string): iRelatorioAniversariantes;
    function pesquisar: iRelatorioAniversariantes;
    function ExecSql: iRelatorioAniversariantes;
    function sqlPesquisa: iRelatorioAniversariantes;
    function sqlPesquisaData: iRelatorioAniversariantes;
    function sqlPesquisaEstatica: iRelatorioAniversariantes;

    function abrir: iRelatorioAniversariantes;
    function atualizar: iRelatorioAniversariantes;
    function cancelar: iRelatorioAniversariantes;
    function fecharQuery: iRelatorioAniversariantes;
    function listarGrid(value: TDataSource): iRelatorioAniversariantes;
    function ordenarGrid(column: TColumn): iRelatorioAniversariantes;

    function retornarAniversariantes(value:TDate): iRelatorioAniversariantes;

    function exportar: iRelatorioAniversariantes;
    function validarData(componet: tmaskEdit): iRelatorioAniversariantes;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioAniversariantes;
  end;

implementation

{ TRelatorioAniversariantes }

function TRelatorioAniversariantes.abrir: iRelatorioAniversariantes;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioAniversariantes.atualizar: iRelatorioAniversariantes;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioAniversariantes.cancelar: iRelatorioAniversariantes;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioAniversariantes.create;
begin
  FTabela := 'CLIENTES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório dos clientes aniversariantes')
    .getCodigoFuncionario(funcionarioLogado);

end;

destructor TRelatorioAniversariantes.destroy;
begin

  inherited;
end;

function TRelatorioAniversariantes.ExecSql: iRelatorioAniversariantes;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioAniversariantes.exportar: iRelatorioAniversariantes;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório dos clientes aniversariantes';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Código';
  pasta.cells[1, 2] := 'Tipo de cadastro';
  pasta.cells[1, 3] := 'Nome';
  pasta.cells[1, 4] := 'Data nascimento';
  pasta.cells[1, 5] := 'Data de cadastro';
  pasta.cells[1, 6] := 'CPF ou CNPJ';
  pasta.cells[1, 7] := 'Documento';
  pasta.cells[1, 8] := 'Endereço';
  pasta.cells[1, 9] := 'Bairro';
  pasta.cells[1, 10] := 'Número';
  pasta.cells[1, 11] := 'Complemento';
  pasta.cells[1, 12] := 'CEP';
  pasta.cells[1, 13] := 'Cidade';
  pasta.cells[1, 14] := 'Estado';
  pasta.cells[1, 15] := 'Telefone';
  pasta.cells[1, 16] := 'Celular';
  pasta.cells[1, 17] := 'E-Mail';
  pasta.cells[1, 18] := 'Funcionário';
  pasta.cells[1, 19] := 'Situação do cliente';
  pasta.cells[1, 20] := 'Observação';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('TIPO_CADASTRO').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('NOME').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('DATA_NASCIMENTO').AsDateTime;

      if FQuery.TQuery.FieldByName('DATA_CADASTRO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('DATA_CADASTRO').AsDateTime
      else
        pasta.cells[linha, 5] := ' ';

      pasta.cells[linha, 6] := '"' + FQuery.TQuery.FieldByName('CPF_CNPJ').AsString + '"';
      pasta.cells[linha, 7] := '"' + FQuery.TQuery.FieldByName('DOCUMENTO').AsString + '"';
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('ENDERECO').AsString;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('BAIRRO').AsString;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('NUMERO').AsInteger;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('COMPLEMENTO').AsString;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('CEP').AsString;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('CIDADE').AsString;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('ESTADO').AsString;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('TELEFONE').AsString;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('CELULAR').AsString;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('EMAIL').AsString;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').AsInteger;
      pasta.cells[linha, 19] := FQuery.TQuery.FieldByName('SITUACAO_CLIENTE').AsString;
      pasta.cells[linha, 20] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioAniversariantes.fecharQuery: iRelatorioAniversariantes;
begin
  FQuery.TQuery.close;
end;

function TRelatorioAniversariantes.getCampo(value: string)
  : iRelatorioAniversariantes;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioAniversariantes.getDataFinal(value: TDate)
  : iRelatorioAniversariantes;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioAniversariantes.getDataInicial(value: TDate)
  : iRelatorioAniversariantes;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioAniversariantes.getValor(value: string)
  : iRelatorioAniversariantes;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioAniversariantes.listarGrid(value: TDataSource)
  : iRelatorioAniversariantes;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'Código';
    FieldByName('NOME').DisplayLabel := 'Nome';
    FieldByName('TIPO_CADASTRO').DisplayLabel := 'Tipo de cadastro';
    FieldByName('DATA_NASCIMENTO').DisplayLabel := 'Data de nascimeto';
    FieldByName('DATA_CADASTRO').DisplayLabel := 'Data de cadastro';
    FieldByName('CPF_CNPJ').Visible := false;
    FieldByName('DOCUMENTO').Visible := false;
    FieldByName('ENDERECO').Visible := false;
    FieldByName('BAIRRO').Visible := false;
    FieldByName('NUMERO').Visible := false;
    FieldByName('COMPLEMENTO').Visible := false;
    FieldByName('CEP').Visible := false;
    FieldByName('CIDADE').Visible := false;
    FieldByName('ESTADO').Visible := false;
    FieldByName('TELEFONE').DisplayLabel := 'Telefone';
    FieldByName('CELULAR').DisplayLabel := 'Celular';
    FieldByName('EMAIL').DisplayLabel := 'E-Mail';
    FieldByName('FUNCIONARIO_CADASTRO').Visible := false;
    FieldByName('SITUACAO_CLIENTE').DisplayLabel := 'Situação do cliente';
    FieldByName('FOTO').Visible := false;
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('NOME').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 30;
    FieldByName('EMAIL').DisplayWidth := 30;
  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioAniversariantes.new: iRelatorioAniversariantes;
begin
  result := self.create;
end;

function TRelatorioAniversariantes.nomeTabela(value: string)
  : iRelatorioAniversariantes;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioAniversariantes.open(value: string)
  : iRelatorioAniversariantes;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioAniversariantes.ordenarGrid(column: TColumn)
  : iRelatorioAniversariantes;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioAniversariantes.pesquisar: iRelatorioAniversariantes;
begin
  result := self;
end;

function TRelatorioAniversariantes.retornarAniversariantes(value:TDate)
  : iRelatorioAniversariantes;
begin

  result := self;

  FQuery.TQuery.Active := false;
  FQuery.TQuery.SQL.Clear;
  FQuery.TQuery.SQL.Add('SELECT DISTINCT * from CLIENTES');
  FQuery.TQuery.SQL.Add
    ('WHERE EXTRACT(MONTH from DATA_NASCIMENTO ' + ') =:mes');
  FQuery.TQuery.paramByName('mes').value := MonthOf(value);
  FQuery.TQuery.Active := true;

end;

function TRelatorioAniversariantes.sqlPesquisa: iRelatorioAniversariantes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioAniversariantes.sqlPesquisaData: iRelatorioAniversariantes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioAniversariantes.sqlPesquisaEstatica
  : iRelatorioAniversariantes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioAniversariantes.validarData(componet: tmaskEdit)
  : iRelatorioAniversariantes;
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
