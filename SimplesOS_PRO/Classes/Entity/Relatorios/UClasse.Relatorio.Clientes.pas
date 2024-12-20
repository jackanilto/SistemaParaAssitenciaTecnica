unit UClasse.Relatorio.Clientes;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TEntityModeloRelatorio = class(TInterfacedObject, iRelatorioClientes)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

  public

    function nomeTabela(value: string): iRelatorioClientes;
    function getCampo(value: string): iRelatorioClientes;
    function getValor(value: string): iRelatorioClientes;
    function getDataInicial(value: TDate): iRelatorioClientes;
    function getDataFinal(value: TDate): iRelatorioClientes;
    function open(value: string): iRelatorioClientes;
    function pesquisar: iRelatorioClientes;
    function ExecSql: iRelatorioClientes;
    function sqlPesquisa: iRelatorioClientes;
    function sqlPesquisaData: iRelatorioClientes;
    function sqlPesquisaEstatica: iRelatorioClientes;

    function abrir: iRelatorioClientes;
    function atualizar: iRelatorioClientes;
    function cancelar: iRelatorioClientes;
    function fecharQuery: iRelatorioClientes;
    function listarGrid(value: TDataSource): iRelatorioClientes;
    function ordenarGrid(column: TColumn): iRelatorioClientes;

    function exportar: iRelatorioClientes;
    procedure validarData(componet: tmaskEdit);

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioClientes;
  end;

implementation

{ TEntityModeloRelatorio }

function TEntityModeloRelatorio.abrir: iRelatorioClientes;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityModeloRelatorio.atualizar: iRelatorioClientes;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityModeloRelatorio.cancelar: iRelatorioClientes;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TEntityModeloRelatorio.create;
begin
  FTabela := 'CLIENTES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio de clientes').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityModeloRelatorio.destroy;
begin

  inherited;
end;

function TEntityModeloRelatorio.ExecSql: iRelatorioClientes;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityModeloRelatorio.exportar: iRelatorioClientes;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio de Clientes';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'Tipo de cadastro';
  pasta.cells[1, 3] := 'Nome';
  pasta.cells[1, 4] := 'Data nascimento';
  pasta.cells[1, 5] := 'Data de cadastro';
  pasta.cells[1, 6] := 'CPF ou CNPJ';
  pasta.cells[1, 7] := 'Documento';
  pasta.cells[1, 8] := 'Endere�o';
  pasta.cells[1, 9] := 'Bairro';
  pasta.cells[1, 10] := 'N�mero';
  pasta.cells[1, 11] := 'Complemento';
  pasta.cells[1, 12] := 'CEP';
  pasta.cells[1, 13] := 'Cidade';
  pasta.cells[1, 14] := 'Estado';
  pasta.cells[1, 15] := 'Telefone';
  pasta.cells[1, 16] := 'Celular';
  pasta.cells[1, 17] := 'E-Mail';
  pasta.cells[1, 18] := 'Funcion�rio';
  pasta.cells[1, 19] := 'Situa��o do cliente';
  pasta.cells[1, 20] := 'Observa��o';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName
        ('TIPO_CADASTRO').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('NOME').AsString;

      if FQuery.TQuery.FieldByName('DATA_NASCIMENTO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('DATA_NASCIMENTO')
        .AsDateTime
      else
        pasta.cells[linha, 4] := ' ';

        if FQuery.TQuery.FieldByName('DATA_CADASTRO').AsDateTime <> StrToDate('30/12/1899') then
          pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('DATA_CADASTRO').AsDateTime
        else
          pasta.cells[linha, 5] := ' ';

      pasta.cells[linha, 6] := '"' + FQuery.TQuery.FieldByName('CPF_CNPJ')
        .AsString + '"';
      pasta.cells[linha, 7] := '"' + FQuery.TQuery.FieldByName('DOCUMENTO')
        .AsString + '"';
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('ENDERECO').AsString;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('BAIRRO').AsString;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('NUMERO').AsInteger;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName
        ('COMPLEMENTO').AsString;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('CEP').AsString;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('CIDADE').AsString;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('ESTADO').AsString;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('TELEFONE').AsString;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('CELULAR').AsString;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('EMAIL').AsString;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName
        ('FUNCIONARIO_CADASTRO').AsInteger;
      pasta.cells[linha, 19] := FQuery.TQuery.FieldByName
        ('SITUACAO_CLIENTE').AsString;
      pasta.cells[linha, 20] := FQuery.TQuery.FieldByName('OBSERVACAO')
        .AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityModeloRelatorio.fecharQuery: iRelatorioClientes;
begin
  FQuery.TQuery.close;
end;

function TEntityModeloRelatorio.getCampo(value: string): iRelatorioClientes;
begin
  result := self;
  FCampo := value;
end;

function TEntityModeloRelatorio.getDataFinal(value: TDate): iRelatorioClientes;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityModeloRelatorio.getDataInicial(value: TDate)
  : iRelatorioClientes;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityModeloRelatorio.getValor(value: string): iRelatorioClientes;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityModeloRelatorio.listarGrid(value: TDataSource)
  : iRelatorioClientes;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'C�digo';
    FieldByName('NOME').DisplayLabel := 'Nome';
    FieldByName('TIPO_CADASTRO').DisplayLabel := 'Tipo de cadastro';
    FieldByName('DATA_NASCIMENTO').DisplayLabel := 'Data de nascimento';
    FieldByName('DATA_CADASTRO').DisplayLabel := 'Data de cadastro';
    FieldByName('CPF_CNPJ').DisplayLabel := 'CPF ou CNPJ';
    FieldByName('DOCUMENTO').DisplayLabel := 'Dumento';
    FieldByName('ENDERECO').DisplayLabel := 'Endere�o';
    FieldByName('BAIRRO').DisplayLabel := 'Bairro';
    FieldByName('NUMERO').DisplayLabel := 'N�mero';
    FieldByName('COMPLEMENTO').DisplayLabel := 'Complemento';
    FieldByName('CEP').DisplayLabel := 'CEP';
    FieldByName('CIDADE').DisplayLabel := 'Cidade';
    FieldByName('ESTADO').DisplayLabel := 'Estado';
    FieldByName('TELEFONE').DisplayLabel := 'Telefone';
    FieldByName('CELULAR').DisplayLabel := 'Celular';
    FieldByName('EMAIL').DisplayLabel := 'E-Mail';
    FieldByName('FUNCIONARIO_CADASTRO').DisplayLabel := 'Funcion�rio';
    FieldByName('SITUACAO_CLIENTE').DisplayLabel := 'Situa��o do cliente';
    FieldByName('FOTO').Visible := false;
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('NOME').DisplayWidth := 40;
    FieldByName('ENDERECO').DisplayWidth := 40;
    FieldByName('BAIRRO').DisplayWidth := 30;
    FieldByName('COMPLEMENTO').DisplayWidth := 30;
    FieldByName('CIDADE').DisplayWidth := 35;
    FieldByName('EMAIL').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityModeloRelatorio.new: iRelatorioClientes;
begin
  result := self.create;
end;

function TEntityModeloRelatorio.nomeTabela(value: string): iRelatorioClientes;
begin
  result := self;
  FTabela := value;
end;

function TEntityModeloRelatorio.open(value: string): iRelatorioClientes;
begin
  FQuery.Query(FTabela);
end;

function TEntityModeloRelatorio.ordenarGrid(column: TColumn)
  : iRelatorioClientes;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityModeloRelatorio.pesquisar: iRelatorioClientes;
begin
  result := self;
end;

function TEntityModeloRelatorio.sqlPesquisa: iRelatorioClientes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityModeloRelatorio.sqlPesquisaData: iRelatorioClientes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityModeloRelatorio.sqlPesquisaEstatica: iRelatorioClientes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityModeloRelatorio.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
