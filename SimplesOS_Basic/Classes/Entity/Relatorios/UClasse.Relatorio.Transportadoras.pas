unit UClasse.Relatorio.Transportadoras;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TRelatorioTransportadoras = class(TInterfacedObject, iRelatorioTransportadores)
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

    function nomeTabela(value: string): iRelatorioTransportadores;
    function getCampo(value: string): iRelatorioTransportadores;
    function getValor(value: string): iRelatorioTransportadores;
    function getDataInicial(value: TDate): iRelatorioTransportadores;
    function getDataFinal(value: TDate): iRelatorioTransportadores;
    function open(value: string): iRelatorioTransportadores;
    function pesquisar: iRelatorioTransportadores;
    function ExecSql: iRelatorioTransportadores;
    function sqlPesquisa: iRelatorioTransportadores;
    function sqlPesquisaData: iRelatorioTransportadores;
    function sqlPesquisaEstatica: iRelatorioTransportadores;

    function abrir: iRelatorioTransportadores;
    function atualizar: iRelatorioTransportadores;
    function cancelar: iRelatorioTransportadores;
    function fecharQuery: iRelatorioTransportadores;
    function listarGrid(value: TDataSource): iRelatorioTransportadores;
    function ordenarGrid(column: TColumn): iRelatorioTransportadores;

    function exportar: iRelatorioTransportadores;
    function validarData(componet: tmaskEdit): iRelatorioTransportadores;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioTransportadores;
  end;

implementation

{ TRelatorioTransportadoras }

function TRelatorioTransportadoras.abrir: iRelatorioTransportadores;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioTransportadoras.atualizar: iRelatorioTransportadores;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioTransportadoras.cancelar: iRelatorioTransportadores;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioTransportadoras.create;
begin
  FTabela := 'TRANSPORTADORA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório Transportadora').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioTransportadoras.destroy;
begin

  inherited;
end;

function TRelatorioTransportadoras.ExecSql: iRelatorioTransportadores;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioTransportadoras.exportar: iRelatorioTransportadores;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório Transportadoras';
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
  pasta.cells[1, 12] := 'Estado';
  pasta.cells[1, 13] := 'Telefone';
  pasta.cells[1, 14] := 'Celular';
  pasta.cells[1, 15] := 'E-Mail';
  pasta.cells[1, 16] := 'Funcionário';
  pasta.cells[1, 17] := 'REsponsável';
  pasta.cells[1, 18] := 'Observação';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('NOME_FANTASIA').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('RAZAO_SOCIAL').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('CPF_CNPJ').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('INSCRICAO_ESTADUAL').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('ENDERECO').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('BAIRRO').AsString;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('NUMERO').AsInteger;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('COMPLEMENTO').AsString;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('CEP').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('CIDADE').AsString;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('ESTADO').AsString;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('TELEFONE').AsString;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('CELULAR').AsString;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('EMAIL').AsString;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('FUNCIONARIO_CADASTRO').AsInteger;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('RESPONSAVEL').AsString;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioTransportadoras.fecharQuery: iRelatorioTransportadores;
begin
  FQuery.TQuery.close;
end;

function TRelatorioTransportadoras.getCampo(value: string): iRelatorioTransportadores;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioTransportadoras.getDataFinal(value: TDate): iRelatorioTransportadores;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioTransportadoras.getDataInicial(value: TDate): iRelatorioTransportadores;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioTransportadoras.getValor(value: string): iRelatorioTransportadores;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioTransportadoras.listarGrid(value: TDataSource): iRelatorioTransportadores;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'Código';
    FieldByName('NOME_FANTASIA').DisplayLabel := 'Nome';
    FieldByName('RAZAO_SOCIAL').DisplayLabel := 'Razão social';
    FieldByName('CPF_CNPJ').DisplayLabel := 'CPF ou CNPJ';
    FieldByName('INSCRICAO_ESTADUAL').DisplayLabel := 'Inscrição estadual';
    FieldByName('ENDERECO').DisplayLabel := 'Endereço';
    FieldByName('BAIRRO').DisplayLabel := 'Bairro';
    FieldByName('NUMERO').DisplayLabel := 'Número';
    FieldByName('COMPLEMENTO').DisplayLabel := 'Complemento';
    FieldByName('CEP').DisplayLabel := 'CEP';
    FieldByName('CIDADE').DisplayLabel := 'Cidade';
    FieldByName('ESTADO').DisplayLabel := 'Estado';
    FieldByName('TELEFONE').DisplayLabel := 'Telafone';
    FieldByName('CELULAR').DisplayLabel := 'Celular';
    FieldByName('EMAIL').DisplayLabel := 'E-Mail';
    FieldByName('FUNCIONARIO_CADASTRO').DisplayLabel := 'Funcionário';
    FieldByName('RESPONSAVEL').DisplayLabel := 'Responsável';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observação';

    FieldByName('NOME_FANTASIA').DisplayWidth := 40;
    FieldByName('RAZAO_SOCIAL').DisplayWidth := 40;
    FieldByName('ENDERECO').DisplayWidth := 40;
    FieldByName('BAIRRO').DisplayWidth := 30;
    FieldByName('COMPLEMENTO').DisplayWidth := 30;
    FieldByName('EMAIL').DisplayWidth := 40;
    FieldByName('RESPONSAVEL').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioTransportadoras.new: iRelatorioTransportadores;
begin
  result := self.create;
end;

function TRelatorioTransportadoras.nomeTabela(value: string): iRelatorioTransportadores;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioTransportadoras.open(value: string): iRelatorioTransportadores;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioTransportadoras.ordenarGrid(column: TColumn): iRelatorioTransportadores;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioTransportadoras.pesquisar: iRelatorioTransportadores;
begin
  result := self;
end;

function TRelatorioTransportadoras.sqlPesquisa: iRelatorioTransportadores;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioTransportadoras.sqlPesquisaData: iRelatorioTransportadores;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioTransportadoras.sqlPesquisaEstatica: iRelatorioTransportadores;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioTransportadoras.validarData(componet: tmaskEdit):iRelatorioTransportadores;
var
  d: TDate;
begin

  Result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data válida.');
  end;
end;

end.
