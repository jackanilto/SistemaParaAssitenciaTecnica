unit UClasse.Entity.Saidas.Produtos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TEntitySaidasProdutos = class(TInterfacedObject, iSaidaDeProdutos)
  private

    FQuery: iConexaoQuery;
    FQueryAtualizarProdutos: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_PRODUTO: integer;
    FPRODUTOS: string;
    FVALORPRODUTOS: Currency;
    FQUANTIDADE: integer;
    FTOTAL: Currency;
    FData: String;
    FHora: string;
    FMotivo: string;
    FFUNCIONARIO: integer;
    FOBSERVACAO: string;

    FCodigoProdutoAtualizar: integer;
    FQuantidadeProdutoAtualizar: integer;

    FCodigo: integer;
    FNome: string;
    function getCodigo(value: integer): iSaidaDeProdutos;
    function getNome(value: string): iSaidaDeProdutos;
    procedure validarData(componet: tmaskEdit);
    procedure selecionarProdutos(value: integer);

  public

    function nomeTabela(value: string): iSaidaDeProdutos;
    function getCampo(value: string): iSaidaDeProdutos;
    function getValor(value: string): iSaidaDeProdutos;
    function getDataInicial(value: TDate): iSaidaDeProdutos;
    function getDataFinal(value: TDate): iSaidaDeProdutos;
    function open(value: string): iSaidaDeProdutos;
    function pesquisar: iSaidaDeProdutos;
    function ExecSql: iSaidaDeProdutos;
    function sqlPesquisa: iSaidaDeProdutos;
    function sqlPesquisaData: iSaidaDeProdutos;
    function sqlPesquisaEstatica: iSaidaDeProdutos;

    function abrir: iSaidaDeProdutos;
    function inserir: iSaidaDeProdutos;
    function Gravar: iSaidaDeProdutos;
    function deletar: iSaidaDeProdutos;
    function atualizar: iSaidaDeProdutos;
    function editar: iSaidaDeProdutos;
    function cancelar: iSaidaDeProdutos;
    function fecharQuery: iSaidaDeProdutos;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iSaidaDeProdutos;
    function ordenarGrid(column: TColumn): iSaidaDeProdutos;

    function getID(value: integer): iSaidaDeProdutos;
    function getID_PRODUTO(value: integer): iSaidaDeProdutos;
    function getPRODUTOS(value: string): iSaidaDeProdutos;
    function getVALORPRODUTO(value: Currency): iSaidaDeProdutos;
    function getQUANTIDADE(value: integer): iSaidaDeProdutos;
    function getTOTAL(value: Currency): iSaidaDeProdutos;
    function getData(value: string): iSaidaDeProdutos;
    function getHora(value: string): iSaidaDeProdutos;
    function getMotivo(value: string): iSaidaDeProdutos;
    function getFuncionario(value: integer): iSaidaDeProdutos;
    function getObservacao(value: string): iSaidaDeProdutos;

    function exportar: iSaidaDeProdutos;

    function atualizarEstoque: iSaidaDeProdutos;
    function getCodigoProdutoAtualizar(value: integer): iSaidaDeProdutos;
    function getQuantidadeProdutoAtualizar(value: integer): iSaidaDeProdutos;

    constructor create;
    destructor destroy; override;
    class function new: iSaidaDeProdutos;
  end;

implementation

{ TEntitySaidasProdutos }

function TEntitySaidasProdutos.abrir: iSaidaDeProdutos;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntitySaidasProdutos.atualizar: iSaidaDeProdutos;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntitySaidasProdutos.atualizarEstoque: iSaidaDeProdutos;
begin
  result := self;

  with FQueryAtualizarProdutos do
  begin

    if TQuery.RecordCount >= 1 then
    begin
      try
        TQuery.Edit;

//        showmessage('Entrou');

        TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger :=
          TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger - FQUANTIDADE;
        TQuery.FieldByName('DATA_ALTERACAO').AsDateTime := date;

//        showmessage(inttostr(TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger));

        TQuery.Post;
      except
        on e: exception do
        begin
          raise exception.create('Houve um erro ao tentar atualizar o estoque. '
            + e.Message);
        end;

      end;
    end;

  end;

end;

function TEntitySaidasProdutos.cancelar: iSaidaDeProdutos;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntitySaidasProdutos.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntitySaidasProdutos.create;
begin
  FTabela := 'SAIDA_PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);
  FQueryAtualizarProdutos := TConexaoQuery.new.Query('PRODUTOS');

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Sa�das de produtos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

function TEntitySaidasProdutos.deletar: iSaidaDeProdutos;
begin

  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('PRODUTOS').AsString)
        .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('deletado').gravarLog;

      FQuery.TQuery.Delete;

    end;
  end;

end;

destructor TEntitySaidasProdutos.destroy;
begin

  inherited;
end;

function TEntitySaidasProdutos.editar: iSaidaDeProdutos;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('PRODUTOS').AsString)
      .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).getOperacao('editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntitySaidasProdutos.ExecSql: iSaidaDeProdutos;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntitySaidasProdutos.exportar: iSaidaDeProdutos;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Entrada de Produtos';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo';
  pasta.cells[1, 2] := 'C�digo do produto';
  pasta.cells[1, 3] := 'Produto/Servi�o';
  pasta.cells[1, 4] := 'Valor do produto';
  pasta.cells[1, 5] := 'Quantidade';
  pasta.cells[1, 6] := 'Total';
  pasta.cells[1, 7] := 'Data';
  pasta.cells[1, 8] := 'Hora';
  pasta.cells[1, 9] := 'Funcion�rio';
  pasta.cells[1, 10] := 'Motivo';
  pasta.cells[1, 11] := 'Observa��o';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_PRODUTO')
        .AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('PRODUTOS').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('VALOR').AsCurrency;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('QUANTIDADE')
        .AsInteger;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('TOTAL').AsCurrency;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('DATA').AsDateTime;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('HORA').AsDateTime;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('FUNCIONARIO')
        .AsInteger;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('MOTIVO').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('OBSERVACAO')
        .AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntitySaidasProdutos.fecharQuery: iSaidaDeProdutos;
begin
  FQuery.TQuery.close;
end;

function TEntitySaidasProdutos.getCampo(value: string): iSaidaDeProdutos;
begin
  result := self;
  FCampo := value;
end;

function TEntitySaidasProdutos.getCodigo(value: integer): iSaidaDeProdutos;
begin
  result := self;
  FCodigo := value;
end;

function TEntitySaidasProdutos.getCodigoProdutoAtualizar(value: integer)
  : iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('Infome o c�digo do produto.');
  FCodigoProdutoAtualizar := value;
end;

function TEntitySaidasProdutos.getData(value: string): iSaidaDeProdutos;
begin
  result := self;
  if value = '  /  /    ' then
    FData := ''
  else
    FData := value;
end;

function TEntitySaidasProdutos.getDataFinal(value: TDate): iSaidaDeProdutos;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntitySaidasProdutos.getDataInicial(value: TDate): iSaidaDeProdutos;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntitySaidasProdutos.getFuncionario(value: integer): iSaidaDeProdutos;
begin
  result := self;
  FFUNCIONARIO := value;
end;

function TEntitySaidasProdutos.getHora(value: string): iSaidaDeProdutos;
begin
  result := self;
  FHora := value;
end;

function TEntitySaidasProdutos.getID(value: integer): iSaidaDeProdutos;
begin
  result := self;
  FID := value;
end;

function TEntitySaidasProdutos.getID_PRODUTO(value: integer): iSaidaDeProdutos;
begin
  result := self;
  FID_PRODUTO := value;
end;

function TEntitySaidasProdutos.getMotivo(value: string): iSaidaDeProdutos;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Voc� deve informar um motivo para a sa�da.');
  FMotivo := value;
end;

function TEntitySaidasProdutos.getNome(value: string): iSaidaDeProdutos;
begin
  result := self;
  FNome := value;
end;

function TEntitySaidasProdutos.getObservacao(value: string): iSaidaDeProdutos;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntitySaidasProdutos.getPRODUTOS(value: string): iSaidaDeProdutos;
begin
  result := self;
  if value = EmptyStr then
    raise exception.create('Informe o nome do produto.');
  FPRODUTOS := value;
end;

function TEntitySaidasProdutos.getQUANTIDADE(value: integer): iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('Informe uma quantidade superior a 0 (zero).');
  FQUANTIDADE := value;
end;

function TEntitySaidasProdutos.getQuantidadeProdutoAtualizar(value: integer)
  : iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('Informe a quantidade de produtos sa sa�da.');
  FQuantidadeProdutoAtualizar := value;
end;

function TEntitySaidasProdutos.getTOTAL(value: Currency): iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('O total da sa�da deve ser superior a 0 (zero).');
  FTOTAL := value;
end;

function TEntitySaidasProdutos.getValor(value: string): iSaidaDeProdutos;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntitySaidasProdutos.getVALORPRODUTO(value: Currency)
  : iSaidaDeProdutos;
begin
  result := self;
  if value = 0 then
    raise exception.create('O valor do produto deve ser maior que 0 (zero)');
  FVALORPRODUTOS := value;
end;

function TEntitySaidasProdutos.Gravar: iSaidaDeProdutos;
begin

  result := self;

  selecionarProdutos(FCodigoProdutoAtualizar);

  if FQueryAtualizarProdutos.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger < FQUANTIDADE
  then
    raise exception.create
      ('N�o h� produtos o suficiente para efetuar esta sa�da. Informe uma quantidade menor.');

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_SAIDA_PRODUTOS_ID');

  FQuery.TQuery.FieldByName('ID_PRODUTO').AsInteger := FID_PRODUTO;
  FQuery.TQuery.FieldByName('PRODUTOS').AsString := FPRODUTOS;
  FQuery.TQuery.FieldByName('VALOR').AsCurrency := FVALORPRODUTOS;
  FQuery.TQuery.FieldByName('QUANTIDADE').AsInteger := FQUANTIDADE;
  FQuery.TQuery.FieldByName('TOTAL').AsCurrency := FTOTAL;
  FQuery.TQuery.FieldByName('MOTIVO').AsString := FMotivo;
  FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger := funcionarioLogado;
  FQuery.TQuery.FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

  if FData <> '  /  /    ' then
    FQuery.TQuery.FieldByName('DATA').AsDateTime := StrToDate(FData);

  if FHora <> '  :  :  ' then
    FQuery.TQuery.FieldByName('HORA').AsDateTime := StrToTime(FHora);

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('PRODUTOS').AsString)
    .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger).gravarLog;

  try
    FQuery.TQuery.Post;
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntitySaidasProdutos.inserir: iSaidaDeProdutos;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
  FGravarLog.getOperacao('inserindo');
end;

function TEntitySaidasProdutos.listarGrid(value: TDataSource): iSaidaDeProdutos;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'C�digo';
  FQuery.TQuery.FieldByName('ID_PRODUTO').DisplayLabel := 'C�d. Produto';
  FQuery.TQuery.FieldByName('PRODUTOS').DisplayLabel := 'Produto';
  FQuery.TQuery.FieldByName('VALOR').DisplayLabel := 'Valor';
  FQuery.TQuery.FieldByName('QUANTIDADE').DisplayLabel := 'Quantidade';
  FQuery.TQuery.FieldByName('TOTAL').DisplayLabel := 'Total';
  FQuery.TQuery.FieldByName('DATA').DisplayLabel := 'Data';
  FQuery.TQuery.FieldByName('HORA').DisplayLabel := 'Hora';
  FQuery.TQuery.FieldByName('MOTIVO').DisplayLabel := 'Motivo';
  FQuery.TQuery.FieldByName('FUNCIONARIO').DisplayLabel := 'Funcion�rio';
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

  FQuery.TQuery.FieldByName('PRODUTOS').DisplayWidth := 30;
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('MOTIVO').DisplayWidth := 30;

  value.DataSet := FQuery.TQuery;

end;

class function TEntitySaidasProdutos.new: iSaidaDeProdutos;
begin
  result := self.create;
end;

function TEntitySaidasProdutos.nomeTabela(value: string): iSaidaDeProdutos;
begin
  result := self;
  FTabela := value;
end;

function TEntitySaidasProdutos.open(value: string): iSaidaDeProdutos;
begin
  FQuery.Query(FTabela);
end;

function TEntitySaidasProdutos.ordenarGrid(column: TColumn): iSaidaDeProdutos;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntitySaidasProdutos.pesquisar: iSaidaDeProdutos;
begin
  result := self;
end;

procedure TEntitySaidasProdutos.selecionarProdutos(value: integer);
begin
  with FQueryAtualizarProdutos do
  begin
    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from produtos where id =:i');
    TQuery.ParamByName('i').AsInteger := FCodigoProdutoAtualizar;
    TQuery.Active := true;
  end;
end;

function TEntitySaidasProdutos.sqlPesquisa: iSaidaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntitySaidasProdutos.sqlPesquisaData: iSaidaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntitySaidasProdutos.sqlPesquisaEstatica: iSaidaDeProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntitySaidasProdutos.validarData(componet: tmaskEdit);
var
  d: TDate;
begin
  try
    d := StrToDate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
