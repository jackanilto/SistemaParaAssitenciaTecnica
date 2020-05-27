unit UClasse.Entity.Produtos;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Imaging.jpeg,
  System.Win.ComObj;

type

  TEntityProdutos = class(TInterfacedObject, iCadastroProdutos)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FSERVICO_PRODUTO: string;
    FCodigoBarras: string;
    FDescricao: string;
    FTIPO_CADASTROS: string;
    FVALOR_CUSTO: Currency;
    FMARGEM_LUCRO: real;
    FVALOR_VENDA: Currency;
    FQUANTIDADE_MINIMA: string;
    FQUANTIDADE_ATUAL: string;
    FDATA_VALIDADE: string;
    FDATA_ALTERACAO: string;
    FID_GRUPO: string;
    FGRUPO: string;
    FMODELO: String;
    FNUMERO_SERIE: string;
    FDATA_FABRICACAO: string;
    FID_MARCA: string;
    FMARCA: string;
    F_FUNCIONARIO: integer;
    F_FOTO: TJPEGImage;
    FOBSERVACAO: string;
    FNome: string;
    function getNome(value: string): iCadastroProdutos;

  public

    function nomeTabela(value: string): iCadastroProdutos;
    function getCampo(value: string): iCadastroProdutos;
    function getValor(value: string): iCadastroProdutos;
    function getDataInicial(value: TDate): iCadastroProdutos;
    function getDataFinal(value: TDate): iCadastroProdutos;
    function open(value: string): iCadastroProdutos;
    function pesquisar: iCadastroProdutos;
    function ExecSql: iCadastroProdutos;
    function sqlPesquisa: iCadastroProdutos;
    function sqlPesquisaData: iCadastroProdutos;
    function sqlPesquisaEstatica: iCadastroProdutos;

    function abrir: iCadastroProdutos;
    function inserir: iCadastroProdutos;
    function Gravar: iCadastroProdutos;
    function deletar: iCadastroProdutos;
    function atualizar: iCadastroProdutos;
    function editar: iCadastroProdutos;
    function cancelar: iCadastroProdutos;
    function fecharQuery: iCadastroProdutos;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroProdutos;
    function ordenarGrid(column: TColumn): iCadastroProdutos;

    function getCodigo(value: integer): iCadastroProdutos;
    function getServicoProdutos(value: string): iCadastroProdutos;
    function getTipoCadastro(value: string): iCadastroProdutos;
    function getCodigoBarras(value: string): iCadastroProdutos;
    function getDescricao(value: string): iCadastroProdutos;
    function getValorDeCusto(value: string): iCadastroProdutos;
    function getMargemDeLUcro(value: String): iCadastroProdutos;
    function getValorDeVenda(value: string): iCadastroProdutos;
    function getQuantidadeMinima(value: string): iCadastroProdutos;
    function getQuantidadeAtual(value: string): iCadastroProdutos;
    function getDataDeValidade(value: string): iCadastroProdutos;
    function getDataAlteracao(value: string): iCadastroProdutos;
    function getCodigoGrupo(value: string): iCadastroProdutos;
    function getGrupo(value: string): iCadastroProdutos;
    function getModelo(value: string): iCadastroProdutos;
    function getNumeroDeSerie(value: string): iCadastroProdutos;
    function getDataFabricacao(value: string): iCadastroProdutos;
    function getCodigoMarca(value: string): iCadastroProdutos;
    function getMarca(value: string): iCadastroProdutos;
    function getCodigoFuncionario(value: integer): iCadastroProdutos;
    function getFoto(value: TJPEGImage): iCadastroProdutos;
    function getObservacao(value: string): iCadastroProdutos;

    function exportar: iCadastroProdutos;

    constructor create;
    destructor destroy; override;
    class function new: iCadastroProdutos;
  end;

implementation

{ TEntityProdutos }

function TEntityProdutos.abrir: iCadastroProdutos;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityProdutos.atualizar: iCadastroProdutos;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityProdutos.cancelar: iCadastroProdutos;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityProdutos.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityProdutos.create;
begin
  FTabela := 'PRODUTOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Cadastro de produtos').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

function TEntityProdutos.deletar: iCadastroProdutos;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog
              .getNomeRegistro(FQuery.TQuery.FieldByName('PRODUTO').AsString)
              .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
              .getOperacao('excluindo')
              .gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityProdutos.destroy;
begin
  inherited;

end;

function TEntityProdutos.editar: iCadastroProdutos;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog
            .getNomeRegistro(FQuery.TQuery.FieldByName('PRODUTO').AsString)
            .getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
            .getOperacao('Editando');

    FQuery.TQuery.Edit;

  end;
end;

function TEntityProdutos.ExecSql: iCadastroProdutos;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityProdutos.exportar: iCadastroProdutos;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório de Produtos';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Código';
  pasta.cells[1, 2] := 'Produto';
  pasta.cells[1, 3] := 'Código de barras';
  pasta.cells[1, 4] := 'Descrição';
  pasta.cells[1, 5] := 'Valor de custo';
  pasta.cells[1, 6] := 'Margem de lucro';
  pasta.cells[1, 7] := 'Valor de venda';
  pasta.cells[1, 8] := 'Quantidade mínima';
  pasta.cells[1, 9] := 'Quantidade atual';
  pasta.cells[1, 10] := 'Data de validade';
  pasta.cells[1, 11] := 'Data de alteração';
  pasta.cells[1, 12] := 'Código grupo';
  pasta.cells[1, 13] := 'Grupo';
  pasta.cells[1, 14] := 'Código marca';
  pasta.cells[1, 15] := 'Marca';
  pasta.cells[1, 16] := 'Modelo';
  pasta.cells[1, 17]:= 'Número de serie';
  pasta.cells[1, 18]:= 'Data de fabricação';
  pasta.cells[1, 19]:= 'Funcionário';
  pasta.cells[1, 20]:= 'Obsercação';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('PRODUTO').AsString;
      pasta.cells[linha, 3] := '"' + FQuery.TQuery.FieldByName('CODIGO_BARRAS').AsString + '"';
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('DESCRICAO').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('VALOR_CUSTO').AsCurrency;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('MARGEM_LUCRO').AsFloat;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('VALOR_VENDA').AsCurrency;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('QUANTIDADE_MINIMA').AsInteger;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger;


      if FQuery.TQuery.FieldByName('DATA_VALIDADE').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('DATA_VALIDADE').AsDateTime
      else
        pasta.cells[linha, 10] := ' ';

      if FQuery.TQuery.FieldByName('DATA_ALTERACAO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('DATA_ALTERACAO').AsDateTime
      else
        pasta.cells[linha, 11] := ' ';

      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('ID_GRUPO').AsInteger;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('GRUPO').AsString;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('ID_MARCA').AsInteger;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('MARCA').AsString;
      pasta.cells[linha, 16] := '"' + FQuery.TQuery.FieldByName('MODELO').AsString + '"';
      pasta.cells[linha, 17] := '"' + FQuery.TQuery.FieldByName('NUMERO_SERIE').AsString + '"';

      if FQuery.TQuery.FieldByName('DATA_FABRICACAO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('DATA_FABRICACAO').AsDateTime
      else
        pasta.cells[linha, 18] := ' ';

      pasta.cells[linha, 19] := FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger;
      pasta.cells[linha, 20] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityProdutos.fecharQuery: iCadastroProdutos;
begin
  FQuery.TQuery.close;
end;

function TEntityProdutos.getCampo(value: string): iCadastroProdutos;
begin
  result := self;
  FCampo := value;
end;

function TEntityProdutos.getCodigo(value: integer): iCadastroProdutos;
begin
  result := self;
  FCodigo := value;
end;

function TEntityProdutos.getCodigoBarras(value: string): iCadastroProdutos;
begin
  result := self;
  FCodigoBarras := value;
end;

function TEntityProdutos.getCodigoFuncionario(value: integer)
  : iCadastroProdutos;
begin
  result := self;
  F_FUNCIONARIO := value;
end;

function TEntityProdutos.getCodigoGrupo(value: string): iCadastroProdutos;
begin
  result := self;
  FID_GRUPO := value;
end;

function TEntityProdutos.getCodigoMarca(value: string): iCadastroProdutos;
begin
  result := self;
  FID_MARCA := value;
end;

function TEntityProdutos.getDataAlteracao(value: string): iCadastroProdutos;
begin
  result := self;
  if value = '  /  /    ' then
    FDATA_ALTERACAO := ''
  else
    FDATA_ALTERACAO := value;
end;

function TEntityProdutos.getDataDeValidade(value: string): iCadastroProdutos;
begin
  result := self;
  if value = '  /  /    ' then
    FDATA_VALIDADE := ''
  else
    FDATA_VALIDADE := value;
end;

function TEntityProdutos.getDataFabricacao(value: string): iCadastroProdutos;
begin
  result := self;
  if value = '  /  /    ' then
    FDATA_FABRICACAO := ''
  else
    FDATA_FABRICACAO := value;
end;

function TEntityProdutos.getDataFinal(value: TDate): iCadastroProdutos;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityProdutos.getDataInicial(value: TDate): iCadastroProdutos;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityProdutos.getDescricao(value: string): iCadastroProdutos;
begin
  result := self;
  FDescricao := value;
end;

function TEntityProdutos.getFoto(value: TJPEGImage): iCadastroProdutos;
begin
  result := self;

  F_FOTO := value;

end;

function TEntityProdutos.getGrupo(value: string): iCadastroProdutos;
begin
  result := self;
  FGRUPO := value;
end;

function TEntityProdutos.getMarca(value: string): iCadastroProdutos;
begin
  result := self;
  FMARCA := value;
end;

function TEntityProdutos.getMargemDeLUcro(value: String): iCadastroProdutos;
begin

  result := self;

  if value = '0' then
    raise Exception.Create('ERRO! Você deve informar uma MARGEM DE LUCRO maior que zero(0)');

  if value = EmptyStr then
    raise Exception.create
      ('Informe a margem de lucro para a venda do produto.');

  try
    FMARGEM_LUCRO := StrToCurr(value);
  except
    on e: Exception do
    begin
      raise Exception.create('Informe um valor válido para a margem de lucro.');
    end;

  end;

end;

function TEntityProdutos.getModelo(value: string): iCadastroProdutos;
begin

  result := self;
  FMODELO := value;

end;

function TEntityProdutos.getNome(value: string): iCadastroProdutos;
begin
  result := self;
  FNome := value;
end;

function TEntityProdutos.getNumeroDeSerie(value: string): iCadastroProdutos;
begin
  result := self;
  FNUMERO_SERIE := value;
end;

function TEntityProdutos.getObservacao(value: string): iCadastroProdutos;
begin
  result := self;
  FOBSERVACAO := value;
end;

function TEntityProdutos.getQuantidadeAtual(value: string): iCadastroProdutos;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe a quantidade de produtos atual.');
  FQUANTIDADE_ATUAL := value;
end;

function TEntityProdutos.getQuantidadeMinima(value: string): iCadastroProdutos;
begin

  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe a quantidade mínima do produto.');

  FQUANTIDADE_MINIMA := value;

end;

function TEntityProdutos.getServicoProdutos(value: string): iCadastroProdutos;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create('Informe o nome do produtos ou serviço.');
  FSERVICO_PRODUTO := value;
end;

function TEntityProdutos.getTipoCadastro(value: string): iCadastroProdutos;
begin
  result := self;
  if value = EmptyStr then
    raise Exception.create
      ('Informe o tipo de cadastro que esta sendo relizado');
  FTIPO_CADASTROS := value;
end;

function TEntityProdutos.getValor(value: string): iCadastroProdutos;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityProdutos.getValorDeCusto(value: string): iCadastroProdutos;
begin
  result := self;

  if value = '0' then
    raise Exception.Create('ERRO! Você deve informar um VALOR DE CUSTO maior que zero(0)');

  try
    FVALOR_CUSTO := StrToCurr(value);
  except
    on e: Exception do
      raise Exception.create('Informe o valor de custo do produto.');
  end;

end;

function TEntityProdutos.getValorDeVenda(value: string): iCadastroProdutos;
begin
  result := self;

  if value = '0' then
    raise Exception.Create('ERRO! O VALOR DE VENDA deve ser maior que zero(0)');

  try
    FVALOR_VENDA := StrToCurr(value);
  except
    on e: Exception do
      raise Exception.create('Informe o valor de venda do produto.');
  end;
end;

function TEntityProdutos.Gravar: iCadastroProdutos;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_PRODUTOS_ID');

  FQuery.TQuery.FieldByName('PRODUTO').AsString := FSERVICO_PRODUTO;
  FQuery.TQuery.FieldByName('CODIGO_BARRAS').AsString := FCodigoBarras;
  FQuery.TQuery.FieldByName('DESCRICAO').AsString := FDescricao;
  FQuery.TQuery.FieldByName('VALOR_CUSTO').AsCurrency := FVALOR_CUSTO;
  FQuery.TQuery.FieldByName('MARGEM_LUCRO').AsFloat := FMARGEM_LUCRO;
  FQuery.TQuery.FieldByName('VALOR_VENDA').AsCurrency := FVALOR_VENDA;
  FQuery.TQuery.FieldByName('QUANTIDADE_MINIMA').AsInteger := StrToInt(FQUANTIDADE_MINIMA);
  FQuery.TQuery.FieldByName('QUANTIDADE_ATUAL').AsInteger := StrToInt(FQUANTIDADE_ATUAL);
  FQuery.TQuery.FieldByName('MODELO').AsString := FMODELO;
  FQuery.TQuery.FieldByName('NUMERO_SERIE').AsString := FNUMERO_SERIE;
  FQuery.TQuery.FieldByName('GRUPO').AsString := FGRUPO;
  FQuery.TQuery.FieldByName('MARCA').AsString := FMARCA;
  FQuery.TQuery.FieldByName('FUNCIONARIO').AsInteger := funcionarioLogado;
  FQuery.TQuery.FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

  if FID_GRUPO <> EmptyStr then
    FQuery.TQuery.FieldByName('ID_GRUPO').AsInteger := StrToInt(FID_GRUPO);

  if FID_MARCA <> EmptyStr then
    FQuery.TQuery.FieldByName('ID_MARCA').AsInteger := StrToInt(FID_MARCA);

  if FDATA_VALIDADE <> EmptyStr then
    FQuery.TQuery.FieldByName('DATA_VALIDADE').AsDateTime := strtodate(FDATA_VALIDADE);

  if FDATA_ALTERACAO <> EmptyStr then
    FQuery.TQuery.FieldByName('DATA_ALTERACAO').AsDateTime := strtodate(FDATA_ALTERACAO);

  if FDATA_FABRICACAO <> EmptyStr then
    FQuery.TQuery.FieldByName('DATA_FABRICACAO').AsDateTime := strtodate(FDATA_FABRICACAO);

  if Assigned(F_FOTO) then
  begin
    FQuery.TQuery.FieldByName('FOTO').Assign(F_FOTO);
  end;

  // F_FOTO.Free;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('PRODUTO')
    .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
    .gravarLog;

  try
    FQuery.TQuery.Post;
  except
    on e: Exception do
    begin
      raise Exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityProdutos.inserir: iCadastroProdutos;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;

  FGravarLog.getOperacao('Inserindo');

end;

function TEntityProdutos.listarGrid(value: TDataSource): iCadastroProdutos;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'Código';
  FQuery.TQuery.FieldByName('PRODUTO').DisplayLabel :=
    'Produtos';
  FQuery.TQuery.FieldByName('CODIGO_BARRAS').DisplayLabel := 'Código de barras';
  FQuery.TQuery.FieldByName('DESCRICAO').DisplayLabel := 'Descrição';
  FQuery.TQuery.FieldByName('VALOR_CUSTO').DisplayLabel := 'Valor de custo';
  FQuery.TQuery.FieldByName('MARGEM_LUCRO').DisplayLabel := 'Margem de lucro';
  FQuery.TQuery.FieldByName('VALOR_VENDA').DisplayLabel := 'Valor de venda';
  FQuery.TQuery.FieldByName('QUANTIDADE_MINIMA').DisplayLabel :=
    'Quantidade mínima';
  FQuery.TQuery.FieldByName('QUANTIDADE_ATUAL').DisplayLabel :=
    'Quantidade atual';
  FQuery.TQuery.FieldByName('DATA_VALIDADE').DisplayLabel := 'Data de validade';
  FQuery.TQuery.FieldByName('DATA_ALTERACAO').DisplayLabel :=
    'Data de alteração';
  FQuery.TQuery.FieldByName('ID_GRUPO').DisplayLabel := 'Cód. Grupo';
  FQuery.TQuery.FieldByName('GRUPO').DisplayLabel := 'Grupo';
  FQuery.TQuery.FieldByName('MODELO').DisplayLabel := 'Modelo';
  FQuery.TQuery.FieldByName('NUMERO_SERIE').DisplayLabel := 'Número de serie';
  FQuery.TQuery.FieldByName('DATA_FABRICACAO').DisplayLabel :=
    'Data de fabricação';
  FQuery.TQuery.FieldByName('ID_MARCA').DisplayLabel := 'Cód. Marca';
  FQuery.TQuery.FieldByName('MARCA').DisplayLabel := 'Marca';
  FQuery.TQuery.FieldByName('FUNCIONARIO').DisplayLabel := 'Funcionário';
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayLabel := 'Observação';
  FQuery.TQuery.FieldByName('FOTO').visible := false;

  FQuery.TQuery.FieldByName('CODIGO_BARRAS').DisplayWidth := 30;
  FQuery.TQuery.FieldByName('GRUPO').DisplayWidth := 30;
  FQuery.TQuery.FieldByName('MARCA').DisplayWidth := 30;
  FQuery.TQuery.FieldByName('DESCRICAO').DisplayWidth := 30;
  FQuery.TQuery.FieldByName('PRODUTO').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('MODELO').DisplayWidth := 40;
  FQuery.TQuery.FieldByName('OBSERVACAO').DisplayWidth := 40;

  // FOTO               BLOB SUB_TYPE

  // FQuery.TQuery.SQL.Add('order by id desc');

  value.DataSet := FQuery.TQuery;

end;

class function TEntityProdutos.new: iCadastroProdutos;
begin
  result := self.create;
end;

function TEntityProdutos.nomeTabela(value: string): iCadastroProdutos;
begin
  result := self;
  FTabela := value;
end;

function TEntityProdutos.open(value: string): iCadastroProdutos;
begin
  FQuery.Query(FTabela);
end;

function TEntityProdutos.ordenarGrid(column: TColumn): iCadastroProdutos;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityProdutos.pesquisar: iCadastroProdutos;
begin
  result := self;
end;

function TEntityProdutos.sqlPesquisa: iCadastroProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityProdutos.sqlPesquisaData: iCadastroProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityProdutos.sqlPesquisaEstatica: iCadastroProdutos;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
