unit UClasse.Relatorio.Fornecedores;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioFornecedores = class(TInterfacedObject, iRelatorioFornecedores)
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

    function nomeTabela(value: string): iRelatorioFornecedores;
    function getCampo(value: string): iRelatorioFornecedores;
    function getValor(value: string): iRelatorioFornecedores;
    function getDataInicial(value: TDate): iRelatorioFornecedores;
    function getDataFinal(value: TDate): iRelatorioFornecedores;
    function open(value: string): iRelatorioFornecedores;
    function pesquisar: iRelatorioFornecedores;
    function ExecSql: iRelatorioFornecedores;
    function sqlPesquisa: iRelatorioFornecedores;
    function sqlPesquisaData: iRelatorioFornecedores;
    function sqlPesquisaEstatica: iRelatorioFornecedores;

    function abrir: iRelatorioFornecedores;
    function atualizar: iRelatorioFornecedores;
    function cancelar: iRelatorioFornecedores;
    function fecharQuery: iRelatorioFornecedores;
    function listarGrid(value: TDataSource): iRelatorioFornecedores;
    function ordenarGrid(column: TColumn): iRelatorioFornecedores;

    function exportar: iRelatorioFornecedores;
    function validarData(componet: tmaskEdit): iRelatorioFornecedores;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioFornecedores;
  end;

implementation

{ TRelatorioFornecedores }

function TRelatorioFornecedores.abrir: iRelatorioFornecedores;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioFornecedores.atualizar: iRelatorioFornecedores;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioFornecedores.cancelar: iRelatorioFornecedores;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioFornecedores.create;
begin
  FTabela := 'FORNECEDORES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório de fornecedores').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioFornecedores.destroy;
begin

  inherited;
end;

function TRelatorioFornecedores.ExecSql: iRelatorioFornecedores;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioFornecedores.exportar: iRelatorioFornecedores;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório Fornecedores';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Código';
  pasta.cells[1, 2] := 'Nome';
  pasta.cells[1, 3] := 'Razão social';
  pasta.cells[1, 4] := 'CPF ou CNPJ';
  pasta.cells[1, 5] := 'Inscrição estadual';
  pasta.cells[1, 6] := 'Endereço';
  pasta.cells[1, 7] := 'Bairro';
  pasta.cells[1, 8] := 'Número';
  pasta.cells[1, 9] := 'Complemento';
  pasta.cells[1, 10] := 'CEP';
  pasta.cells[1, 11] := 'Cidade';
  pasta.cells[1, 12] := 'UF';
  pasta.cells[1, 13] := 'Telefone';
  pasta.cells[1, 14] := 'Celular';
  pasta.cells[1, 15] := 'E-Mail';
  pasta.cells[1, 16] := 'Responsável';
  pasta.cells[1, 17] := 'Funcionário';
  pasta.cells[1, 18] := 'Observação';



  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('NOME_FANTASIA').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('RAZAO_SOCIAL').AsString;
      pasta.cells[linha, 4] := '"'+FQuery.TQuery.FieldByName('CPF_CNPJ').AsString+'"';
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('INSCRICAO_ESTADUAL').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('ENDERECO').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('BAIRRO').AsString;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('NUMERO').AsInteger;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('COMPLEMENTO').AsString;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('CEP').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('CIDADE').AsString;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('UF').AsString;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('TELEFONE').AsString;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('CELULAR').AsString;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('EMAIL').AsString;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('RESPONSAVEL').AsString;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('FUINCIONARIO_CADASTRO').AsInteger;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;
function TRelatorioFornecedores.fecharQuery: iRelatorioFornecedores;
begin
  FQuery.TQuery.close;
end;

function TRelatorioFornecedores.getCampo(value: string): iRelatorioFornecedores;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioFornecedores.getDataFinal(value: TDate): iRelatorioFornecedores;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioFornecedores.getDataInicial(value: TDate): iRelatorioFornecedores;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioFornecedores.getValor(value: string): iRelatorioFornecedores;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioFornecedores.listarGrid(value: TDataSource): iRelatorioFornecedores;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID').DisplayLabel := 'Código';
    FieldByName('NOME_FANTASIA').DisplayLabel := 'Nome fantasia';
    FieldByName('RAZAO_SOCIAL').DisplayLabel := 'Razão social';
    FieldByName('CPF_CNPJ').DisplayLabel := 'CPF ou CNPJ';
    FieldByName('INSCRICAO_ESTADUAL').DisplayLabel := 'Inscrição estadual';
    FieldByName('ENDERECO').DisplayLabel := 'Endereço';
    FieldByName('BAIRRO').DisplayLabel := 'Bairro';
    FieldByName('NUMERO').DisplayLabel := 'Número';
    FieldByName('COMPLEMENTO').DisplayLabel := 'Complemento';
    FieldByName('CEP').DisplayLabel := 'CEP';
    FieldByName('CIDADE').DisplayLabel := 'Cidade';
    FieldByName('UF').DisplayLabel := 'Estado';
    FieldByName('TELEFONE').DisplayLabel := 'Telefone';
    FieldByName('CELULAR').DisplayLabel := 'Celular';
    FieldByName('EMAIL').DisplayLabel := 'E-Mail';
    FieldByName('RESPONSAVEL').DisplayLabel := 'Responsável';
    FieldByName('FUINCIONARIO_CADASTRO').DisplayLabel := 'Funcionário';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('NOME_FANTASIA').DisplayWidth := 40;
    FieldByName('RAZAO_SOCIAL').DisplayWidth := 40;
    FieldByName('ENDERECO').DisplayWidth := 30;
    FieldByName('BAIRRO').DisplayWidth := 30;
    FieldByName('COMPLEMENTO').DisplayWidth := 30;
    FieldByName('EMAIL').DisplayWidth := 30;
    FieldByName('RESPONSAVEL').DisplayWidth := 30;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioFornecedores.new: iRelatorioFornecedores;
begin
  result := self.create;
end;

function TRelatorioFornecedores.nomeTabela(value: string): iRelatorioFornecedores;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioFornecedores.open(value: string): iRelatorioFornecedores;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioFornecedores.ordenarGrid(column: TColumn): iRelatorioFornecedores;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioFornecedores.pesquisar: iRelatorioFornecedores;
begin
  result := self;
end;

function TRelatorioFornecedores.sqlPesquisa: iRelatorioFornecedores;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioFornecedores.sqlPesquisaData: iRelatorioFornecedores;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioFornecedores.sqlPesquisaEstatica: iRelatorioFornecedores;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioFornecedores.validarData(componet: tmaskEdit):iRelatorioFornecedores;
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
