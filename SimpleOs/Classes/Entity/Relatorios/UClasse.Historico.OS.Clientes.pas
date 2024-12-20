unit UClasse.Historico.OS.Clientes;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  System.Win.ComObj;

type

  TEntityHistoricoOSClientes = class(TInterfacedObject, iHistoricoOSClientes)
  private

    FQuery: iConexaoQuery;
    FQueryServicos: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

  public

    function nomeTabela(value: string): iHistoricoOSClientes;
    function getCampo(value: string): iHistoricoOSClientes;
    function getValor(value: string): iHistoricoOSClientes;
    function getDataInicial(value: TDate): iHistoricoOSClientes;
    function getDataFinal(value: TDate): iHistoricoOSClientes;
    function open(value: string): iHistoricoOSClientes;
    function pesquisar: iHistoricoOSClientes;
    function ExecSql: iHistoricoOSClientes;
    function sqlPesquisa: iHistoricoOSClientes;
    function sqlPesquisaData: iHistoricoOSClientes;
    function sqlPesquisaEstatica: iHistoricoOSClientes;

    function abrir: iHistoricoOSClientes;
    function atualizar: iHistoricoOSClientes;
    function cancelar: iHistoricoOSClientes;
    function fecharQuery: iHistoricoOSClientes;
    function listarGrid(value: TDataSource): iHistoricoOSClientes;
    function ordenarGrid(column: TColumn): iHistoricoOSClientes;

    function selecionarServicosOS(value: integer): iHistoricoOSClientes;
    function listarGridServicos(value: TDataSource): iHistoricoOSClientes;
    function ordenarListaServicos(column: TColumn): iHistoricoOSClientes;

    function exportar: iHistoricoOSClientes;
    function exportarListaServicos:iHistoricoOSClientes;
    procedure validarData(componet: tmaskEdit);

    constructor create;
    destructor destroy; override;
    class function new: iHistoricoOSClientes;
  end;

implementation

{ TEntityHistoricoOSClientes }

function TEntityHistoricoOSClientes.abrir: iHistoricoOSClientes;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityHistoricoOSClientes.atualizar: iHistoricoOSClientes;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityHistoricoOSClientes.cancelar: iHistoricoOSClientes;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TEntityHistoricoOSClientes.create;
begin
  FTabela := 'VISUALIZAR_ORDENS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryServicos := TConexaoQuery.new.Query('SERVICOS_ORDEM');

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Hist�rico de OS do cliente').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TEntityHistoricoOSClientes.destroy;
begin

  inherited;
end;

function TEntityHistoricoOSClientes.ExecSql: iHistoricoOSClientes;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityHistoricoOSClientes.exportar: iHistoricoOSClientes;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Hist�rico de OS do cliente';
  pasta.visible := true;

  pasta.cells[1, 1] := 'OS';
  pasta.cells[1, 2] := 'C�d. Cliente';
  pasta.cells[1, 3] := 'Cliente';
  pasta.cells[1, 4] := 'Equipamento';
  pasta.cells[1, 5] := 'Defeito relatado';
  pasta.cells[1, 6] := 'Marcas';
  pasta.cells[1, 7] := 'Modelo';
  pasta.cells[1, 8] := 'N�mero de serie';
  pasta.cells[1, 9] := 'Data de fabrica��o';
  pasta.cells[1, 10] := 'Laudo t�cnico';
  pasta.cells[1, 11] := 'Solu��o do problema';
  pasta.cells[1, 12] := 'Valor da OS';
  pasta.cells[1, 13] := 'Desconto';
  pasta.cells[1, 14] := 'Acr�scimo';
  pasta.cells[1, 15] := 'Total da OS';
  pasta.cells[1, 16] := 'Retorno';
  pasta.cells[1, 17] := 'Data de retorno';
  pasta.cells[1, 18] := 'Situa��o da ordem';
  pasta.cells[1, 19] := 'Total de parcelas';
  pasta.cells[1, 20] := 'Valor da parcela';
  pasta.cells[1, 21] := 'PGTO';
  pasta.cells[1, 22] := 'Prioridade';
  pasta.cells[1, 23] := 'Data de entrada';
  pasta.cells[1, 24] := 'Data de saida';
  pasta.cells[1, 25] := 'Hora da sa�da';
  pasta.cells[1, 26] := 'Vencimento base';
  pasta.cells[1, 27] := 'C�d. T�cnico respons�vel';
  pasta.cells[1, 28] := 'T�cnico respons�vel';
  pasta.cells[1, 29] := 'Observa��o';
  pasta.cells[1, 30] := 'Status';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('NOME_CLIENTE').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('EQUIPAMENTO').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('DEFEITO_RELATADO').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('MARCAS').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('MODELO').AsString;
      pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('NUMERO_SERIE').AsString;
      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DATA_FABRICACAO').AsDateTime;
      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('LAUDO_DO_TECNICO').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('SOLUCAO_DO_PROBLEMA').AsString;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('VALOR_DA_ORDEM').AsCurrency;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('ACRESCIMO').AsCurrency;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('TOTAL_ORCAMENTO').AsCurrency;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('RETORNO').AsString;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('DATA_RETORNO').AsDateTime;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('SITUACAO_DA_ORDEM').AsString;
      pasta.cells[linha, 19] := FQuery.TQuery.FieldByName('TOTAL_PARCELAS').AsInteger;
      pasta.cells[linha, 20] := FQuery.TQuery.FieldByName('VALOR_DA_PARCELA').AsCurrency;
      pasta.cells[linha, 21] := FQuery.TQuery.FieldByName('PGTO').AsString;
      pasta.cells[linha, 22] := FQuery.TQuery.FieldByName('PRIORIDADE').AsString;
      pasta.cells[linha, 23] := FQuery.TQuery.FieldByName('DATA_ENTRADA').AsDateTime;
      pasta.cells[linha, 24] := FQuery.TQuery.FieldByName('DATA_FINALIZACAO').AsDateTime;
      pasta.cells[linha, 25] := FQuery.TQuery.FieldByName('HORA_SAIDA').AsDateTime;
      pasta.cells[linha, 26] := FQuery.TQuery.FieldByName('DATA_BASE_VENCIMENTO').AsDateTime;
      pasta.cells[linha, 27] := FQuery.TQuery.FieldByName('ID_TECNICO_RESPONSAVEL').AsInteger;
      pasta.cells[linha, 28] := FQuery.TQuery.FieldByName('TECNICO_RESPONSAVEL').AsString;
      pasta.cells[linha, 29] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;
      pasta.cells[linha, 30] := FQuery.TQuery.FieldByName('STATUS').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;
function TEntityHistoricoOSClientes.exportarListaServicos: iHistoricoOSClientes;
var
  pasta: variant;
  linha: integer;
begin

  FQueryServicos.TQuery.Filtered := false;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Lista de servi�os da OS do cliente';
  pasta.visible := true;

  pasta.cells[1, 1] := 'C�digo Item';
  pasta.cells[1, 2] := 'OS';
  pasta.cells[1, 3] := 'C�d. Servi�o';
  pasta.cells[1, 4] := 'Servi�o';
  pasta.cells[1, 5] := 'Valor';

  try
    while not FQueryServicos.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQueryServicos.TQuery.FieldByName('ID').AsInteger;
      pasta.cells[linha, 2] := FQueryServicos.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 3] := FQueryServicos.TQuery.FieldByName('ID_SERVICO').AsInteger;
      pasta.cells[linha, 4] := FQueryServicos.TQuery.FieldByName('SERVICO').AsString;
      pasta.cells[linha, 5] := FQueryServicos.TQuery.FieldByName('VALOR').AsCurrency;

      linha := linha + 1;

      FQueryServicos.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TEntityHistoricoOSClientes.fecharQuery: iHistoricoOSClientes;
begin
  FQuery.TQuery.close;
end;

function TEntityHistoricoOSClientes.getCampo(value: string)
  : iHistoricoOSClientes;
begin
  result := self;
  FCampo := value;
end;

function TEntityHistoricoOSClientes.getDataFinal(value: TDate)
  : iHistoricoOSClientes;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityHistoricoOSClientes.getDataInicial(value: TDate)
  : iHistoricoOSClientes;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TEntityHistoricoOSClientes.getValor(value: string)
  : iHistoricoOSClientes;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityHistoricoOSClientes.listarGrid(value: TDataSource)
  : iHistoricoOSClientes;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_ORDEM').DisplayLabel := 'C�digo da OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('EQUIPAMENTO').DisplayLabel := 'Equipamento';
    FieldByName('DEFEITO_RELATADO').DisplayLabel := 'Defeito relatado';
    FieldByName('MARCAS').DisplayLabel := 'Marcas';
    FieldByName('MODELO').DisplayLabel := 'Modelo';
    FieldByName('NUMERO_SERIE').DisplayLabel := 'N�mero de serie';
    FieldByName('DATA_FABRICACAO').DisplayLabel := 'Data de fabrica��o';
    FieldByName('LAUDO_DO_TECNICO').DisplayLabel := 'Laudo t�cnico';
    FieldByName('SOLUCAO_DO_PROBLEMA').DisplayLabel := 'Solu��o do problema';
    FieldByName('VALOR_DA_ORDEM').DisplayLabel := 'Valor da OS';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('ACRESCIMO').DisplayLabel := 'Acrescimo';
    FieldByName('TOTAL_ORCAMENTO').DisplayLabel := 'Total do or�amento';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do funcion�rio';
    FieldByName('RETORNO').DisplayLabel := 'Retorno';
    FieldByName('DATA_RETORNO').DisplayLabel := 'Data de retorno';
    FieldByName('SITUACAO_DA_ORDEM').DisplayLabel := 'Situa��o da OS';
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcelas';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('PRIORIDADE').DisplayLabel := 'Prioridade';
    FieldByName('DATA_ENTRADA').DisplayLabel := 'Entrada';
    FieldByName('DATA_FINALIZACAO').DisplayLabel := 'Sa�da';
    FieldByName('HORA_SAIDA').DisplayLabel := 'Hor�rio de sa�da';
    FieldByName('DATA_BASE_VENCIMENTO').DisplayLabel := 'Vencimento base';
    FieldByName('ID_TECNICO_RESPONSAVEL').DisplayLabel := 'C�d. T�cnico';
    FieldByName('TECNICO_RESPONSAVEL').DisplayLabel := 'T�cnico';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';
    FieldByName('STATUS').DisplayLabel := 'Status';

    FieldByName('NOME_CLIENTE').DisplayWidth := 40;
    FieldByName('EQUIPAMENTO').DisplayWidth := 40;
    FieldByName('DEFEITO_RELATADO').DisplayWidth := 40;
    FieldByName('LAUDO_DO_TECNICO').DisplayWidth := 40;
    FieldByName('SOLUCAO_DO_PROBLEMA').DisplayWidth := 40;
    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 30;
    FieldByName('RETORNO').DisplayWidth := 30;
    FieldByName('TECNICO_RESPONSAVEL').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

function TEntityHistoricoOSClientes.listarGridServicos(value: TDataSource)
  : iHistoricoOSClientes;
begin

  result := self;

  with FQueryServicos.TQuery do
  begin
    FieldByName('ID').Visible := false;
    FieldByName('ID_ORDEM').Visible := false;
    FieldByName('ID_SERVICO').DisplayLabel := 'C�d. Servi�o';
    FieldByName('SERVICO').DisplayLabel := 'Servi�o';
    FieldByName('VALOR').DisplayLabel := 'Valor';

    FieldByName('SERVICO').DisplayWidth := 50;

  end;

  value.DataSet := FQueryServicos.TQuery;

end;

class function TEntityHistoricoOSClientes.new: iHistoricoOSClientes;
begin
  result := self.create;
end;

function TEntityHistoricoOSClientes.nomeTabela(value: string)
  : iHistoricoOSClientes;
begin
  result := self;
  FTabela := value;
end;

function TEntityHistoricoOSClientes.open(value: string): iHistoricoOSClientes;
begin
  FQuery.Query(FTabela);
end;

function TEntityHistoricoOSClientes.ordenarGrid(column: TColumn)
  : iHistoricoOSClientes;
begin

  result := self;

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityHistoricoOSClientes.ordenarListaServicos(column: TColumn)
  : iHistoricoOSClientes;
begin
  result := self;

  if FQueryServicos.TQuery.IndexFieldNames = column.FieldName then
    FQueryServicos.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQueryServicos.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityHistoricoOSClientes.pesquisar: iHistoricoOSClientes;
begin
  result := self;
end;

function TEntityHistoricoOSClientes.selecionarServicosOS(value: integer)
  : iHistoricoOSClientes;
begin
  result := self;

  with FQueryServicos do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add('select * from SERVICOS_ORDEM where ID_ORDEM =:i');
    TQuery.ParamByName('i').AsInteger := value;
    TQuery.Active := true;

  end;

end;

function TEntityHistoricoOSClientes.sqlPesquisa: iHistoricoOSClientes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityHistoricoOSClientes.sqlPesquisaData: iHistoricoOSClientes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityHistoricoOSClientes.sqlPesquisaEstatica: iHistoricoOSClientes;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

procedure TEntityHistoricoOSClientes.validarData(componet: tmaskEdit);
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
