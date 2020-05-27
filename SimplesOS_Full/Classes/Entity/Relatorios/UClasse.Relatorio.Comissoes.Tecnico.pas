unit UClasse.Relatorio.Comissoes.Tecnico;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask,
  Datasnap.DBClient, System.Win.ComObj;

type

  TRelatorioComissoes = class(TInterfacedObject, iRelatorioComissoesTecnico)
  private

    function obterPercentualComissao(value:integer):real;

  var
    FQuery: iConexaoQuery;
    FQueryContabilizar: iConexaoQuery;
    FQueryPercentualComissao: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

    FQuantidadeOS:integer;
    FPercentualTecnico:real;


  public
    function nomeTabela(value: string): iRelatorioComissoesTecnico;
    function getCampo(value: string): iRelatorioComissoesTecnico;
    function getValor(value: string): iRelatorioComissoesTecnico;
    function getDataInicial(value: TDate): iRelatorioComissoesTecnico;
    function getDataFinal(value: TDate): iRelatorioComissoesTecnico;
    function open(value: string): iRelatorioComissoesTecnico;
    function pesquisar: iRelatorioComissoesTecnico;
    function ExecSql: iRelatorioComissoesTecnico;
    function sqlPesquisa: iRelatorioComissoesTecnico;
    function sqlPesquisaData: iRelatorioComissoesTecnico;
    function sqlPesquisaEstatica: iRelatorioComissoesTecnico;

    function abrir: iRelatorioComissoesTecnico;
    function atualizar: iRelatorioComissoesTecnico;
    function cancelar: iRelatorioComissoesTecnico;
    function fecharQuery: iRelatorioComissoesTecnico;
    function listarGrid(value: TDataSource): iRelatorioComissoesTecnico;
    function ordenarGrid(column: TColumn): iRelatorioComissoesTecnico;

    function obterValorComissao:Currency;

    function exportar: iRelatorioComissoesTecnico;
    function validarData(componet: tmaskEdit): iRelatorioComissoesTecnico;

    constructor create;
    destructor destroy; override;
    class function new: iRelatorioComissoesTecnico;
  end;

implementation

{ TRelatorioComissoes }

function TRelatorioComissoes.abrir: iRelatorioComissoesTecnico;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TRelatorioComissoes.atualizar: iRelatorioComissoesTecnico;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TRelatorioComissoes.cancelar: iRelatorioComissoesTecnico;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

constructor TRelatorioComissoes.create;
begin

  FTabela := 'VISUALIZAR_COMISSOES_TEC';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FQueryPercentualComissao := TConexaoQuery.new.Query('COMISSOES_FUNCIONARIOS');

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Relatório de comissões').getCodigoFuncionario
    (funcionarioLogado);
  // (0 { definir o usuário quando construir a aplicação } );

end;

destructor TRelatorioComissoes.destroy;
begin

  inherited;
end;

function TRelatorioComissoes.ExecSql: iRelatorioComissoesTecnico;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TRelatorioComissoes.exportar: iRelatorioComissoesTecnico;
var
  pasta: variant;
  linha: integer;
begin

  FQuery.TQuery.Filtered := false;
  FQuery.TQuery.First;

  linha := 2;
  pasta := CreateOleObject('Excel.application');
  pasta.workBooks.Add(1);

  pasta.Caption := 'Relatório de Comissões Técnicos';
  pasta.visible := true;

  pasta.cells[1, 1] := 'Cód. Técnico';
  pasta.cells[1, 2] := 'Técnico';
  pasta.cells[1, 3] := 'Aplicar comissão';
  pasta.cells[1, 4] := 'Percettual (%)';
  pasta.cells[1, 5] := 'OS';
  pasta.cells[1, 6] := 'Valor';
  pasta.cells[1, 7] := 'Entrada';
  pasta.cells[1, 8] := 'Saída';
  pasta.cells[1, 9] := 'Situação';

  try
    while not FQuery.TQuery.Eof do
    begin

      pasta.cells[linha, 1] := FQuery.TQuery.FieldByName('ID_FUNCIONARIO').AsInteger;
      pasta.cells[linha, 2] := FQuery.TQuery.FieldByName('NOME_FUNCIONARIO').AsString;
      pasta.cells[linha, 3] := FQuery.TQuery.FieldByName('APLICAR_COMISSAO').AsString;
      pasta.cells[linha, 4] := FQuery.TQuery.FieldByName('PERCENTUAL').AsFloat;
      pasta.cells[linha, 5] := FQuery.TQuery.FieldByName('OS').AsInteger;
      pasta.cells[linha, 6] := FQuery.TQuery.FieldByName('VALOR').AsCurrency;
      pasta.cells[linha, 7] := FQuery.TQuery.FieldByName('ENTRADA').AsDateTime;

      if FQuery.TQuery.FieldByName('SAIDA').AsDateTime <> StrToTime('00:00:00') then
         pasta.cells[linha, 8] := FQuery.TQuery.FieldByName('SAIDA').AsDateTime;

      pasta.cells[linha, 9] := FQuery.TQuery.FieldByName('SITUACAO').AsString;

      linha := linha + 1;

      FQuery.TQuery.Next;

    end;
    pasta.columns.autofit;
  finally
  end;
end;

function TRelatorioComissoes.fecharQuery: iRelatorioComissoesTecnico;
begin
  FQuery.TQuery.close;
end;

function TRelatorioComissoes.getCampo(value: string)
  : iRelatorioComissoesTecnico;
begin
  result := self;
  FCampo := value;
end;

function TRelatorioComissoes.getDataFinal(value: TDate)
  : iRelatorioComissoesTecnico;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TRelatorioComissoes.getDataInicial(value: TDate)
  : iRelatorioComissoesTecnico;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;

function TRelatorioComissoes.getValor(value: string)
  : iRelatorioComissoesTecnico;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TRelatorioComissoes.listarGrid(value: TDataSource)
  : iRelatorioComissoesTecnico;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'Cód. Tecnico';
    FieldByName('NOME_FUNCIONARIO').DisplayLabel := 'Nome do técnico';
    FieldByName('APLICAR_COMISSAO').DisplayLabel := 'Aplicar comissão';
    FieldByName('PERCENTUAL').DisplayLabel := 'Percentual';
    FieldByName('OS').DisplayLabel := 'OS';
    FieldByName('VALOR').DisplayLabel := 'Valor';
    FieldByName('ENTRADA').DisplayLabel := 'Entrada';
    FieldByName('SAIDA').DisplayLabel := 'Saída';
    FieldByName('SITUACAO').DisplayLabel := 'Situação';
    FieldByName('PGTO').Visible := false;

    FieldByName('NOME_FUNCIONARIO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TRelatorioComissoes.new: iRelatorioComissoesTecnico;
begin
  result := self.create;
end;

function TRelatorioComissoes.nomeTabela(value: string)
  : iRelatorioComissoesTecnico;
begin
  result := self;
  FTabela := value;
end;

function TRelatorioComissoes.obterPercentualComissao(value: integer): real;
begin

  result := 0;

  with FQueryPercentualComissao do
  begin

    TQuery.Active := false;
    TQuery.SQL.Clear;
    TQuery.SQL.Add
                ('select * from COMISSOES_FUNCIONARIOS where ID_FUNCIONARIO =:i and APLICAR_COMISSAO =:a');
    TQuery.ParamByName('i').AsInteger := value;
    TQuery.ParamByName('a').AsString := 'Sim';
    TQuery.Active := false;


    if TQuery.RecordCount >= 1 then
    begin

      FPercentualTecnico := TQuery.FieldByName('VALOR_POR_ATENDIMENTO').AsFloat;

      result := TQuery.FieldByName('VALOR_POR_ATENDIMENTO').AsFloat;

    end;


  end;

end;

function TRelatorioComissoes.obterValorComissao: Currency;
begin
  result := 0;
end;

function TRelatorioComissoes.open(value: string): iRelatorioComissoesTecnico;
begin
  FQuery.Query(FTabela);
end;

function TRelatorioComissoes.ordenarGrid(column: TColumn)
  : iRelatorioComissoesTecnico;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TRelatorioComissoes.pesquisar: iRelatorioComissoesTecnico;
begin
  result := self;
end;

function TRelatorioComissoes.sqlPesquisa: iRelatorioComissoesTecnico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TRelatorioComissoes.sqlPesquisaData: iRelatorioComissoesTecnico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TRelatorioComissoes.sqlPesquisaEstatica: iRelatorioComissoesTecnico;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

function TRelatorioComissoes.validarData(componet: tmaskEdit)
  : iRelatorioComissoesTecnico;
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
