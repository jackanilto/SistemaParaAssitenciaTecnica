unit UClasse.Entity.Localizar.Cliente.Venda;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityPesquisarCliente = class(TInterfacedObject, iLocalizarClienteVenda)
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

    function nomeTabela(value: string): iLocalizarClienteVenda;
    function getCampo(value: string): iLocalizarClienteVenda;
    function getValor(value: string): iLocalizarClienteVenda;
    function getDataInicial(value: TDate): iLocalizarClienteVenda;
    function getDataFinal(value: TDate): iLocalizarClienteVenda;
    function open(value: string): iLocalizarClienteVenda;
    function pesquisar: iLocalizarClienteVenda;
    function ExecSql: iLocalizarClienteVenda;
    function sqlPesquisa: iLocalizarClienteVenda;
    function sqlPesquisaData: iLocalizarClienteVenda;
    function sqlPesquisaEstatica: iLocalizarClienteVenda;

    function abrir: iLocalizarClienteVenda;
    function listarGrid(value: TDataSource): iLocalizarClienteVenda;
    function ordenarGrid(column: TColumn): iLocalizarClienteVenda;

    function setCodigoDoCliente: string;
    function setNomeDoCliente: string;
    function setCpf_CnpjDoCliente: string;

    function exportar: iLocalizarClienteVenda;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iLocalizarClienteVenda;
    function getNome(value: string): iLocalizarClienteVenda;

    constructor create;
    destructor destroy; override;
    class function new: iLocalizarClienteVenda;
  end;

implementation

{ TEntityPesquisarCliente }

function TEntityPesquisarCliente.abrir: iLocalizarClienteVenda;
begin

  result := self;
  FQuery.Query(FTabela);

end;

constructor TEntityPesquisarCliente.create;
begin
  FTabela := 'CLIENTES';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Pesquisa de cliente - Vendas')
    .getCodigoFuncionario(funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityPesquisarCliente.destroy;
begin

  inherited;
end;

function TEntityPesquisarCliente.ExecSql: iLocalizarClienteVenda;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityPesquisarCliente.exportar: iLocalizarClienteVenda;
begin
  result := self;
end;

function TEntityPesquisarCliente.getCampo(value: string)
  : iLocalizarClienteVenda;
begin
  result := self;
  FCampo := value;
end;

function TEntityPesquisarCliente.getCodigo(value: integer)
  : iLocalizarClienteVenda;
begin
  result := self;
  FCodigo := value;
end;

function TEntityPesquisarCliente.getDataFinal(value: TDate)
  : iLocalizarClienteVenda;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityPesquisarCliente.getDataInicial(value: TDate)
  : iLocalizarClienteVenda;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityPesquisarCliente.getNome(value: string): iLocalizarClienteVenda;
begin
  result := self;
  FNome := value;
end;

function TEntityPesquisarCliente.getValor(value: string)
  : iLocalizarClienteVenda;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityPesquisarCliente.listarGrid(value: TDataSource)
  : iLocalizarClienteVenda;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('id').DisplayLabel := 'C�digo';
    FieldByName('NOME').DisplayLabel := 'Nome';
    FieldByName('TIPO_CADASTRO').DisplayLabel := 'Tipo de Cadastro';
    FieldByName('DATA_NASCIMENTO').Visible := false;
    FieldByName('DATA_CADASTRO').Visible := false;
    FieldByName('CPF_CNPJ').DisplayLabel := 'CPF ou CNPJ';
    FieldByName('DOCUMENTO').Visible := false;
    FieldByName('ENDERECO').Visible := false;
    FieldByName('BAIRRO').Visible := false;
    FieldByName('NUMERO').Visible := false;
    FieldByName('COMPLEMENTO').Visible := false;
    FieldByName('CEP').Visible := false;
    FieldByName('CIDADE').Visible := false;
    FieldByName('ESTADO').Visible := false;
    FieldByName('TELEFONE').Visible := false;
    FieldByName('CELULAR').Visible := false;
    FieldByName('EMAIL').Visible := false;
    FieldByName('FUNCIONARIO_CADASTRO').Visible := false;
    FieldByName('SITUACAO_CLIENTE').Visible := false;
    FieldByName('FOTO').Visible := false;
    FieldByName('OBSERVACAO').Visible := false;

    FieldByName('NOME').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityPesquisarCliente.new: iLocalizarClienteVenda;
begin
  result := self.create;
end;

function TEntityPesquisarCliente.nomeTabela(value: string)
  : iLocalizarClienteVenda;
begin
  result := self;
  FTabela := value;
end;

function TEntityPesquisarCliente.open(value: string): iLocalizarClienteVenda;
begin
  FQuery.Query(FTabela);
end;

function TEntityPesquisarCliente.ordenarGrid(column: TColumn)
  : iLocalizarClienteVenda;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityPesquisarCliente.pesquisar: iLocalizarClienteVenda;
begin
  result := self;
end;

function TEntityPesquisarCliente.setCodigoDoCliente: string;
begin
  result := FQuery.TQuery.FieldByName('ID').AsInteger.ToString;
end;

function TEntityPesquisarCliente.setCpf_CnpjDoCliente: string;
begin
  result := FQuery.TQuery.FieldByName('CPF_CNPJ').AsString;
end;

function TEntityPesquisarCliente.setNomeDoCliente: string;
begin
  result := FQuery.TQuery.FieldByName('NOME').AsString;
end;

function TEntityPesquisarCliente.sqlPesquisa: iLocalizarClienteVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityPesquisarCliente.sqlPesquisaData: iLocalizarClienteVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityPesquisarCliente.sqlPesquisaEstatica: iLocalizarClienteVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityPesquisarCliente.validarData(componet: tmaskEdit);
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
