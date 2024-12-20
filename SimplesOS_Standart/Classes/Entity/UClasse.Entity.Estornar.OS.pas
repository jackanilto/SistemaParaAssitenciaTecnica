unit UClasse.Entity.Estornar.OS;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityEstornarOS = class(TInterfacedObject, iEstornarOS)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FID: integer;
    FID_ORDEM: integer;
    FID_CLIENTE: integer;
    FVALOR_OS: Currency;
    FDATA: TDate;
    FHORA: TDateTime;
    FMOTIVO: string;
    FFUNCIONARIO: integer;
    FNOME_FUNCIONARIO: string;
    FOBSERVACAO: string;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iEstornarOS;
    function getCampo(value: string): iEstornarOS;
    function getValor(value: string): iEstornarOS;
    function getDataInicial(value: TDate): iEstornarOS;
    function getDataFinal(value: TDate): iEstornarOS;
    function open(value: string): iEstornarOS;
    function pesquisar: iEstornarOS;
    function ExecSql: iEstornarOS;
    function sqlPesquisa: iEstornarOS;
    function sqlPesquisaData: iEstornarOS;
    function sqlPesquisaEstatica: iEstornarOS;

    function abrir: iEstornarOS;
    function inserir: iEstornarOS;
    function Gravar: iEstornarOS;
    function atualizar: iEstornarOS;
    function cancelar: iEstornarOS;
    function fecharQuery: iEstornarOS;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iEstornarOS;
    function ordenarGrid(column: TColumn): iEstornarOS;

    function getID(value: integer): iEstornarOS;
    function getID_ORDEM(value: integer): iEstornarOS;
    function getID_CLIENTE(value: integer): iEstornarOS;
    function getVALOR_OS(value: Currency): iEstornarOS;
    function getDATA(value: string): iEstornarOS;
    function getHORA(value: string): iEstornarOS;
    function getMOTIVO(value: string): iEstornarOS;
    function getFUNCIONARIO(value: integer): iEstornarOS;
    function getNOME_FUNCIONARIO(value: string): iEstornarOS;
    function getOBSERVACAO(value: string): iEstornarOS;

    function exportar: iEstornarOS;
    function validarData(componet: tmaskEdit): iEstornarOS;

    function getCodigo(value: integer): iEstornarOS;
    function getNome(value: string): iEstornarOS;

    constructor create;
    destructor destroy; override;
    class function new: iEstornarOS;
  end;

implementation

{ TEntityEstornarOS }

function TEntityEstornarOS.abrir: iEstornarOS;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityEstornarOS.atualizar: iEstornarOS;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityEstornarOS.cancelar: iEstornarOS;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityEstornarOS.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityEstornarOS.create;
begin
  FTabela := 'ESTORNO_ORDEM';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Estornado OS').getCodigoFuncionario(funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityEstornarOS.destroy;
begin

  inherited;
end;

function TEntityEstornarOS.ExecSql: iEstornarOS;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityEstornarOS.exportar: iEstornarOS;
begin
  result := self;
end;

function TEntityEstornarOS.fecharQuery: iEstornarOS;
begin
  FQuery.TQuery.close;
end;

function TEntityEstornarOS.getCampo(value: string): iEstornarOS;
begin
  result := self;
  FCampo := value;
end;

function TEntityEstornarOS.getCodigo(value: integer): iEstornarOS;
begin
  result := self;
  FCodigo := value;
end;

function TEntityEstornarOS.getDATA(value: string): iEstornarOS;
begin
  result := self;

  if value = EmptyStr then
    raise Exception.create('Erro! Informe um data para o estorno');

  try
    FDATA := StrToDate(value);
  except
    on e: Exception do
    begin
      raise Exception.create('Erro! Informe um data v�lida');
    end;

  end;

end;

function TEntityEstornarOS.getDataFinal(value: TDate): iEstornarOS;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityEstornarOS.getDataInicial(value: TDate): iEstornarOS;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityEstornarOS.getFUNCIONARIO(value: integer): iEstornarOS;
begin
  result := self;
  FFUNCIONARIO := funcionarioLogado;
end;

function TEntityEstornarOS.getHORA(value: string): iEstornarOS;
begin

  result := self;

  if value = EmptyStr then
    raise Exception.create('Erro! Informe um h�rario para o estorno');

  try
    FHORA := StrToTime(value);
  except
    on e: Exception do
    begin
      raise Exception.create('Erro! Informe um hor�rio v�lido para o estorno');
    end;

  end;

end;

function TEntityEstornarOS.getID(value: integer): iEstornarOS;
begin
  result := self;
  FID := value;
end;

function TEntityEstornarOS.getID_CLIENTE(value: integer): iEstornarOS;
begin

  result := self;

  if value = 0 then
    raise Exception.create('Erro! Informe o c�digo do cliente para o estorno');

  FID_CLIENTE := value;

end;

function TEntityEstornarOS.getID_ORDEM(value: integer): iEstornarOS;
begin

  result := self;

  if value = 0 then
    raise Exception.create('Erro! Informe a OS que esta estornando');

  FID_ORDEM := value;

end;

function TEntityEstornarOS.getMOTIVO(value: string): iEstornarOS;
begin

  result := self;

//  while motivo = EmptyStr do
//  begin
//    motivo := InputBox('Informe o motivo do estorno', 'Motivo do estorno', '');
//
//    if motivo = EmptyStr then
//    begin
//      MessageDlg('Voc� precisa informa um motivo para este estorno', mtWarning,
//        [mbOK], 0, mbOK);
//    end;
//  end;

  FMOTIVO := value;

end;

function TEntityEstornarOS.getNome(value: string): iEstornarOS;
begin
  result := self;
  FNome := value;
end;

function TEntityEstornarOS.getNOME_FUNCIONARIO(value: string): iEstornarOS;
begin

  result := self;
  FNOME_FUNCIONARIO := NomeFuncionarioLogado;

end;

function TEntityEstornarOS.getOBSERVACAO(value: string): iEstornarOS;
begin

  result := self;
  FOBSERVACAO := value;

end;

function TEntityEstornarOS.getValor(value: string): iEstornarOS;
begin
  result := self;
  FValor := UpperCase(value);

end;

function TEntityEstornarOS.getVALOR_OS(value: Currency): iEstornarOS;
begin
  result := self;
  FVALOR_OS := value;
end;

function TEntityEstornarOS.Gravar: iEstornarOS;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_ESTORNO_ORDEM_ID');

  with FQuery.TQuery do
  begin
    FieldByName('ID_ORDEM').AsInteger := FID_ORDEM;
    FieldByName('ID_CLIENTE').AsInteger := FID_CLIENTE;
    FieldByName('VALOR').AsFloat := FVALOR_OS;
    FieldByName('DATA').AsDateTime := FDATA;
    FieldByName('HORA').AsDateTime := FHORA;
    FieldByName('MOTIVO').AsString := FMOTIVO;
    FieldByName('FUNCIONARIO').AsInteger := funcionarioLogado;
    FieldByName('OBSERVACAO').AsString := FOBSERVACAO;
    FieldByName('NOME_FUNCIONARIO').AsString := NomeFuncionarioLogado;

  end;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('id_ordem')
    .AsInteger.ToString).gravarLog;

  try
    FQuery.TQuery.Post;
    showmessage('Opera��o realizada com sucesso!');
  except
    on e: Exception do
    begin
      raise Exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityEstornarOS.inserir: iEstornarOS;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityEstornarOS.listarGrid(value: TDataSource): iEstornarOS;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').DisplayLabel := 'C�digo estorno';
    FieldByName('ID_ORDEM ').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('VALOR').DisplayLabel := 'Valor';
    FieldByName('DATA').DisplayLabel := 'Data';
    FieldByName('HORA').DisplayLabel := 'HOra';
    FieldByName('MOTIVO').DisplayLabel := 'Motivo';
    FieldByName('FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Funcion�rio';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';

    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityEstornarOS.new: iEstornarOS;
begin
  result := self.create;
end;

function TEntityEstornarOS.nomeTabela(value: string): iEstornarOS;
begin
  result := self;
  FTabela := value;
end;

function TEntityEstornarOS.open(value: string): iEstornarOS;
begin
  FQuery.Query(FTabela);
end;

function TEntityEstornarOS.ordenarGrid(column: TColumn): iEstornarOS;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityEstornarOS.pesquisar: iEstornarOS;
begin
  result := self;
end;

function TEntityEstornarOS.sqlPesquisa: iEstornarOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityEstornarOS.sqlPesquisaData: iEstornarOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityEstornarOS.sqlPesquisaEstatica: iEstornarOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TEntityEstornarOS.validarData(componet: tmaskEdit): iEstornarOS;
var
  d: TDate;
begin

  result := self;

  try
    d := StrToDate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise Exception.create('Digite uma data v�lida.');
  end;
end;

end.
