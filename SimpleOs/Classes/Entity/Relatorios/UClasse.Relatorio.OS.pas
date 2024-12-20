unit UClasse.Relatorio.OS;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  UClasse.Relatorio.OS.Servicos, System.Win.ComObj;

type

  TRelatorioOS = class(TInterfacedObject, iRelatorioOS)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FRelatorioServicosRealizados:iRelatoriOSServicosRealiados;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

  public

    function nomeTabela(value: string): iRelatorioOS;
    function getCampo(value: string): iRelatorioOS;
    function getValor(value: string): iRelatorioOS;
    function getDataInicial(value: TDate): iRelatorioOS;
    function getDataFinal(value: TDate): iRelatorioOS;
    function open(value: string): iRelatorioOS;
    function pesquisar: iRelatorioOS;
    function ExecSql: iRelatorioOS;
    function sqlPesquisa: iRelatorioOS;
    function sqlPesquisaData: iRelatorioOS;
    function sqlPesquisaEstatica: iRelatorioOS;

    function abrir: iRelatorioOS;
    function atualizar: iRelatorioOS;
    function cancelar: iRelatorioOS;
    function fecharQuery: iRelatorioOS;
    function listarGrid(value: TDataSource): iRelatorioOS;
    function ordenarGrid(column: TColumn): iRelatorioOS;

    function listarGridServicos(value:TDataSource):iRelatorioOS;
    function listarGridOcorrencia(value:TDataSource):iRelatorioOS;

    function limparGridServicos(value:TDataSource):iRelatorioOS;

    function getSituacao(value: string): iRelatorioOS;
    function selecionarOSPorSituacaoECampo: iRelatorioOS;
    function exportarServicos:iRelatorioOS;

    function exportar: iRelatorioOS;
    function validarData(componet: tmaskEdit): iRelatorioOS;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioOS;
  end;

implementation

{ TRelatorioOS }

function TRelatorioOS.abrir: iRelatorioOS;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioOS.atualizar: iRelatorioOS;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioOS.cancelar: iRelatorioOS;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioOS.create;
begin
  FTabela := 'VISUALIZAR_ORDENS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FRelatorioServicosRealizados := TRelatorioOSServicos.new;

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relat�rio OS').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usu�rio quando construir a aplica��o } );

end;

destructor TRelatorioOS.destroy;
begin

  inherited;
end;

function TRelatorioOS.ExecSql: iRelatorioOS;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioOS.exportar: iRelatorioOS;
var
  pasta: variant;
  linha: integer;
begin
  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relat�rio Ordem de Servi�o';
  pasta.visible := true;

  pasta.cells[1, 1] := 'OS';
  pasta.cells[1, 2] := 'C�d. Cliente';
  pasta.cells[1, 3] := 'Nome do cliente';
  pasta.cells[1, 4] := 'Equipamento';
  pasta.cells[1, 5] := 'Defeito relatado';
  pasta.cells[1, 6] := 'Marca';
  pasta.cells[1, 7] := 'Modelo';
  pasta.cells[1, 8] := 'N�mero de serie';
  pasta.cells[1, 9] := 'Data de fabrica��o';
  pasta.cells[1, 10] := 'Laudo t�cnico';
  pasta.cells[1, 11] := 'Solu��ao do problema';
  pasta.cells[1, 12] := 'Valor da OS';
  pasta.cells[1, 13] := 'Desconto';
  pasta.cells[1, 14] := 'Acr�scimo';
  pasta.cells[1, 15] := 'Total da OS';
  pasta.cells[1, 16] := 'C�d. Funcion�rio';
  pasta.cells[1, 17] := 'Funcion�rio';
  pasta.cells[1, 18] := 'Retorno';
  pasta.cells[1, 19] := 'Data de retorno';
  pasta.cells[1, 20] := 'Situa��o da OS';
  pasta.cells[1, 21] := 'Total de parcelas';
  pasta.cells[1, 22] := 'Valor da parcela';
  pasta.cells[1, 23] := 'PGTO';
  pasta.cells[1, 24] := 'Prioridade';
  pasta.cells[1, 25] := 'Entrada';
  pasta.cells[1, 26] := 'Sa�da';
  pasta.cells[1, 27] := 'Hora da sa�da';
  pasta.cells[1, 28] := 'Data base para o vencimento';
  pasta.cells[1, 29] := 'C�d. T�cnico';
  pasta.cells[1, 30] := 'T�cnico';
  pasta.cells[1, 31] := 'Observa��o';
  pasta.cells[1, 32] := 'Status';


  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('ID_CLIENTE').AsInteger;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('NOME_CLIENTE').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('EQUIPAMENTO').AsString;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('DEFEITO_RELATADO').AsString;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('MARCAS').AsString;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('MODELO').AsString;
      pasta.cells[linha, 8] := '"'+FQuery.TQuery.FieldByName('NUMERO_SERIE').AsString+'"';

      if FQuery.TQuery.FieldByName('DATA_FABRICACAO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('DATA_FABRICACAO').AsDateTime;

      pasta.cells[linha, 10] := FQuery.TQuery.FieldByName('LAUDO_DO_TECNICO').AsString;
      pasta.cells[linha, 11] := FQuery.TQuery.FieldByName('SOLUCAO_DO_PROBLEMA').AsString;
      pasta.cells[linha, 12] := FQuery.TQuery.FieldByName('VALOR_DA_ORDEM').AsCurrency;
      pasta.cells[linha, 13] := FQuery.TQuery.FieldByName('DESCONTO').AsCurrency;
      pasta.cells[linha, 14] := FQuery.TQuery.FieldByName('ACRESCIMO').AsCurrency;
      pasta.cells[linha, 15] := FQuery.TQuery.FieldByName('TOTAL_ORCAMENTO').AsCurrency;
      pasta.cells[linha, 16] := FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger;
      pasta.cells[linha, 17] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').AsString;
      pasta.cells[linha, 18] := FQuery.TQuery.FieldByName('RETORNO').AsString;

      if FQuery.TQuery.FieldByName('DATA_RETORNO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 19] := FQuery.TQuery.FieldByName('DATA_RETORNO').AsDateTime;

      pasta.cells[linha, 20] := FQuery.TQuery.FieldByName('SITUACAO_DA_ORDEM').AsString;
      pasta.cells[linha, 21] := FQuery.TQuery.FieldByName('TOTAL_PARCELAS').AsInteger;
      pasta.cells[linha, 22] := FQuery.TQuery.FieldByName('VALOR_DA_PARCELA').AsCurrency;
      pasta.cells[linha, 23] := FQuery.TQuery.FieldByName('PGTO').AsString;
      pasta.cells[linha, 24] := FQuery.TQuery.FieldByName('PRIORIDADE').AsString;


      if FQuery.TQuery.FieldByName('DATA_ENTRADA').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 25] := FQuery.TQuery.FieldByName('DATA_ENTRADA').AsDateTime;

      if FQuery.TQuery.FieldByName('DATA_FINALIZACAO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 26] := FQuery.TQuery.FieldByName('DATA_FINALIZACAO').AsDateTime;

      if FQuery.TQuery.FieldByName('HORA_SAIDA').AsDateTime <> StrToTime('00:00:00') then
        pasta.cells[linha, 27] := FQuery.TQuery.FieldByName('HORA_SAIDA').AsDateTime;

     if FQuery.TQuery.FieldByName('DATA_BASE_VENCIMENTO').AsDateTime <> StrToDate('30/12/1899') then
        pasta.cells[linha, 28] := FQuery.TQuery.FieldByName('DATA_BASE_VENCIMENTO').AsDateTime;

      pasta.cells[linha, 29] := FQuery.TQuery.FieldByName('ID_TECNICO_RESPONSAVEL').AsInteger;
      pasta.cells[linha, 30] := FQuery.TQuery.FieldByName('TECNICO_RESPONSAVEL').AsString;
      pasta.cells[linha, 31] := FQuery.TQuery.FieldByName('OBSERVACAO').AsString;
      pasta.cells[linha, 32] := FQuery.TQuery.FieldByName('STATUS').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioOS.exportarServicos: iRelatorioOS;
begin
  result := self;
  FRelatorioServicosRealizados.exportar;
end;

function TRelatorioOS.fecharQuery: iRelatorioOS;
begin
  FQuery.TQuery.close;
end;

function TRelatorioOS.getCampo(value: string): iRelatorioOS;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioOS.getDataFinal(value: TDate): iRelatorioOS;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioOS.getDataInicial(value: TDate): iRelatorioOS;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioOS.getSituacao(value: string): iRelatorioOS;
begin
  result := self;
end;

function TRelatorioOS.getValor(value: string): iRelatorioOS;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioOS.limparGridServicos(value: TDataSource): iRelatorioOS;
begin

  result := self;

  FRelatorioServicosRealizados
                              .getCampo('ID_ORDEM')
                              .getValor('0')
                              .sqlPesquisa
                              .listarGrid(value);

end;

function TRelatorioOS.listarGrid(value: TDataSource): iRelatorioOS;
begin

  result := self;

  with FQuery.TQuery do
  begin
    FieldByName('ID_ORDEM').DisplayLabel := 'OS';
    FieldByName('ID_CLIENTE').DisplayLabel := 'C�d. Cliente';
    FieldByName('NOME_CLIENTE').DisplayLabel := 'Cliente';
    FieldByName('EQUIPAMENTO').DisplayLabel := 'Equipamento';
    FieldByName('DEFEITO_RELATADO').DisplayLabel := 'Defeito';
    FieldByName('MARCAS').DisplayLabel := 'Marca';
    FieldByName('MODELO').DisplayLabel := 'Modelo';
    FieldByName('NUMERO_SERIE').DisplayLabel := 'N�mero de serie';
    FieldByName('DATA_FABRICACAO').DisplayLabel := 'Fabrica��o';
    FieldByName('LAUDO_DO_TECNICO').DisplayLabel := 'Laudo t�cnico';
    FieldByName('SOLUCAO_DO_PROBLEMA').DisplayLabel := 'Solu��o do problema';
    FieldByName('VALOR_DA_ORDEM').DisplayLabel := 'Valor da OS';
    FieldByName('DESCONTO').DisplayLabel := 'Desconto';
    FieldByName('ACRESCIMO').DisplayLabel := 'Acr�scimo';
    FieldByName('TOTAL_ORCAMENTO').DisplayLabel := 'Total do or�amento';
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do funcion�rio';
    FieldByName('RETORNO').DisplayLabel := 'Retorno';
    FieldByName('DATA_RETORNO').DisplayLabel := 'Data de retorno';
    FieldByName('SITUACAO_DA_ORDEM').DisplayLabel := 'Situa��o da OS';
    FieldByName('TOTAL_PARCELAS').DisplayLabel := 'Total de parcela';
    FieldByName('VALOR_DA_PARCELA').DisplayLabel := 'Valor da parcela';
    FieldByName('PGTO').DisplayLabel := 'PGTO';
    FieldByName('PRIORIDADE').DisplayLabel := 'Prioridade';
    FieldByName('DATA_ENTRADA').DisplayLabel := 'Entrada';
    FieldByName('DATA_FINALIZACAO').DisplayLabel := 'Sa�da';
    FieldByName('HORA_SAIDA').DisplayLabel := 'Hor�rio da sa�da';
    FieldByName('DATA_BASE_VENCIMENTO').Visible := false;
    FieldByName('ID_TECNICO_RESPONSAVEL').DisplayLabel := 'C�d. T�cnico';
    FieldByName('TECNICO_RESPONSAVEL').DisplayLabel := 'T�cnico';
    FieldByName('OBSERVACAO').DisplayLabel := 'Observa��o';
    FieldByName('STATUS').DisplayLabel := 'Status';


    FieldByName('NOME_CLIENTE').DisplayWidth := 30;
    FieldByName('EQUIPAMENTO').DisplayWidth := 30;
    FieldByName('DEFEITO_RELATADO').DisplayWidth := 30;
    FieldByName('MARCAS').DisplayWidth := 30;
    FieldByName('MODELO').DisplayWidth := 30;
    FieldByName('LAUDO_DO_TECNICO').DisplayWidth := 40;
    FieldByName('SOLUCAO_DO_PROBLEMA').DisplayWidth := 40;
    FieldByName('RETORNO').DisplayWidth := 30;
    FieldByName('TECNICO_RESPONSAVEL').DisplayWidth := 40;
    FieldByName('OBSERVACAO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

function TRelatorioOS.listarGridOcorrencia(value: TDataSource): iRelatorioOS;
begin
  result := self;
end;

function TRelatorioOS.listarGridServicos(value: TDataSource): iRelatorioOS;
begin

  result := self;

  FRelatorioServicosRealizados
                              .getCampo('ID_ORDEM')
                              .getValor(FQuery.TQuery.FieldByName('ID_ORDEM').AsInteger.ToString)
                              .sqlPesquisa
                              .listarGrid(value);

end;

class function TRelatorioOS.new: iRelatorioOS;
begin
  result := self.create;
end;

function TRelatorioOS.nomeTabela(value: string): iRelatorioOS;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioOS.open(value: string): iRelatorioOS;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioOS.ordenarGrid(column: TColumn): iRelatorioOS;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioOS.pesquisar: iRelatorioOS;
begin
  result := self;
end;

function TRelatorioOS.selecionarOSPorSituacaoECampo: iRelatorioOS;
begin

end;

function TRelatorioOS.sqlPesquisa: iRelatorioOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioOS.sqlPesquisaData: iRelatorioOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioOS.sqlPesquisaEstatica: iRelatorioOS;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioOS.validarData(componet: tmaskEdit):iRelatorioOS;
var
  d: TDate;
begin

  result := self;

  try
    d := strtodate(componet.Text);
  except
    componet.SetFocus;
    componet.Clear;
    raise exception.create('Digite uma data v�lida.');
  end;
end;

end.
