unit UClasse.Estornar.Venda;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityVendasEstornadas = class(TInterfacedObject, iEstonarVenda)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID : integer;
    FID_VENDA : Integer;
    FID_CLIENTE : Integer;
    FVALOR_VENDA : Currency;
    FDATA : TDate;
    FHORA : TTime;
    FMOTIVO : String;
    FFUNCIONARIO : Integer;
    FOBSERVACAO : String;
    FNOME_FUNCIONARIO : String;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iEstonarVenda;
    function getCampo(value: string): iEstonarVenda;
    function getValor(value: string): iEstonarVenda;
    function getDataInicial(value: TDate): iEstonarVenda;
    function getDataFinal(value: TDate): iEstonarVenda;
    function open(value: string): iEstonarVenda;
    function pesquisar: iEstonarVenda;
    function ExecSql: iEstonarVenda;
    function sqlPesquisa: iEstonarVenda;
    function sqlPesquisaData: iEstonarVenda;
    function sqlPesquisaEstatica: iEstonarVenda;

    function abrir: iEstonarVenda;
    function inserir: iEstonarVenda;
    function gravar: iEstonarVenda;
    function atualizar: iEstonarVenda;
    function fecharQuery: iEstonarVenda;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iEstonarVenda;
    function ordenarGrid(column: TColumn): iEstonarVenda;

    function getID(value:integer):iEstonarVenda;
    function getID_VENDA(value:integer):iEstonarVenda;
    function getID_CLIENTE(value:integer):iEstonarVenda;
    function getVALOR_VENDA(value:Currency):iEstonarVenda;
    function getDATA(value:string):iEstonarVenda;
    function getHORA(value:string):iEstonarVenda;
    function getMOTIVO(value:string):iEstonarVenda;
    function getFUNCIONARIO(value:integer):iEstonarVenda;
    function getNOME_FUNCIONARIO(value:string):iEstonarVenda;
    function getOBSERVACAO(value:string):iEstonarVenda;

    function exportar: iEstonarVenda;
    function validarData(componet: tmaskEdit):iEstonarVenda;

    function getCodigo(value: integer): iEstonarVenda;
    function getNome(value: string): iEstonarVenda;

    constructor create;
    destructor destroy; override;
    class function new: iEstonarVenda;
  end;

implementation

{ TEntityVendasEstornadas }

function TEntityVendasEstornadas.abrir: iEstonarVenda;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityVendasEstornadas.atualizar: iEstonarVenda;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityVendasEstornadas.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityVendasEstornadas.create;
begin
  FTabela := 'ESTORNO_VENDA';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Estonar venda').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TEntityVendasEstornadas.destroy;
begin

  inherited;
end;

function TEntityVendasEstornadas.ExecSql: iEstonarVenda;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityVendasEstornadas.exportar: iEstonarVenda;
begin
  result := self;
end;

function TEntityVendasEstornadas.fecharQuery: iEstonarVenda;
begin
  FQuery.TQuery.close;
end;

function TEntityVendasEstornadas.getCampo(value: string): iEstonarVenda;
begin
  result := self;
  FCampo := value;
end;

function TEntityVendasEstornadas.getCodigo(value: integer): iEstonarVenda;
begin
  result := self;
  FCodigo := value;
end;

function TEntityVendasEstornadas.getDATA(value: string): iEstonarVenda;
begin
   result := self;
   try
    FDATA := StrToDate(value);
   except on e:exception do
   begin
     MessageDlg('Informe um data correta.', mtError, [mbOK], 0, mbOK);
     abort;
   end;
   end;
end;

function TEntityVendasEstornadas.getDataFinal(value: TDate): iEstonarVenda;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityVendasEstornadas.getDataInicial(value: TDate): iEstonarVenda;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityVendasEstornadas.getFUNCIONARIO(
  value: integer): iEstonarVenda;
begin
  result := self;
  FFUNCIONARIO := funcionarioLogado;
end;

function TEntityVendasEstornadas.getHORA(value: string): iEstonarVenda;
begin
 result := self;
 try
   FHORA := StrToTime(value);
 except on e:exception do
 begin
   MessageDlg('Informe uma data válida', mtError, [mbOK], 0, mbOK);
   abort;
 end;

 end;
end;

function TEntityVendasEstornadas.getID(value: integer): iEstonarVenda;
begin
  result := self;
  FID := value;
end;

function TEntityVendasEstornadas.getID_CLIENTE(
  value: integer): iEstonarVenda;
begin
   result := self;
   FID_CLIENTE := value;
end;

function TEntityVendasEstornadas.getID_VENDA(value: integer): iEstonarVenda;
begin
  result := self;
  FID_VENDA := value;
end;

function TEntityVendasEstornadas.getMOTIVO(value: string): iEstonarVenda;
var
  motivo:string;
begin

  result := self;

  while motivo = EmptyStr do
  begin

     motivo := InputBox('Informe o motivo do estorno', 'Motivo do estorno', '');

     if motivo = EmptyStr then
     begin
       MessageDlg('Você precisa informar o motivo do estorno', mtWarning, [mbOK], 0, mbOK);
     end;

  end;

  FMOTIVO := motivo;

end;

function TEntityVendasEstornadas.getNome(value: string): iEstonarVenda;
begin
  result := self;
  FNome := value;
end;

function TEntityVendasEstornadas.getNOME_FUNCIONARIO(
  value: string): iEstonarVenda;
begin
  result := self;
  FNOME_FUNCIONARIO := value;
end;

function TEntityVendasEstornadas.getOBSERVACAO(value: string): iEstonarVenda;
begin
 result := self;
 FOBSERVACAO := value;
end;

function TEntityVendasEstornadas.getValor(value: string): iEstonarVenda;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityVendasEstornadas.getVALOR_VENDA(value: Currency): iEstonarVenda;
begin
  result := self;
  FVALOR_VENDA := value;
end;

function TEntityVendasEstornadas.Gravar: iEstonarVenda;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_ESTORNO_VENDA_ID');

  with FQuery.TQuery do
  begin

    FieldByName('ID_VENDA').AsInteger := FID_VENDA;
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('VALOR').AsCurrency := FVALOR_VENDA;
    FieldByName('DATA').AsDateTime  := FData;
    FieldByName('HORA').AsDateTime := FHORA;
    FieldByName('MOTIVO').AsString := FMOTIVO;
    FieldByName('FUNCIONARIO').AsInteger := FFUNCIONARIO;
    FieldByName('NOME_FUNCIONARIO').AsString := FNOME_FUNCIONARIO;
    FieldByName('OBSERVACAO').AsString := FOBSERVACAO;

  end;

  try
    FQuery.TQuery.Post;
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityVendasEstornadas.inserir: iEstonarVenda;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityVendasEstornadas.listarGrid(value: TDataSource): iEstonarVenda;
begin

  result := self;

  FQuery.TQuery.FieldByName('id').DisplayLabel := 'Código';
  FQuery.TQuery.FieldByName('grupo').DisplayLabel := 'Grupo';
  FQuery.TQuery.FieldByName('grupo').DisplayWidth := 50;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityVendasEstornadas.new: iEstonarVenda;
begin
  result := self.create;
end;

function TEntityVendasEstornadas.nomeTabela(value: string): iEstonarVenda;
begin
  result := self;
  FTabela := value;
end;

function TEntityVendasEstornadas.open(value: string): iEstonarVenda;
begin
  FQuery.Query(FTabela);
end;

function TEntityVendasEstornadas.ordenarGrid(column: TColumn): iEstonarVenda;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityVendasEstornadas.pesquisar: iEstonarVenda;
begin
  result := self;
end;

function TEntityVendasEstornadas.sqlPesquisa: iEstonarVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityVendasEstornadas.sqlPesquisaData: iEstonarVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityVendasEstornadas.sqlPesquisaEstatica: iEstonarVenda;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TEntityVendasEstornadas.validarData(componet: tmaskEdit):iEstonarVenda;
var
  d: TDate;
begin
  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data válida.');
  end;
end;

end.
