unit UInterfaces;

interface

uses
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.DBGrids,
  Vcl.Forms;

type
  iConexaoQuery = interface
    ['{91E5FAFC-04DB-4F7B-8C16-6ADCFFAC5FB7}']
    function Query(value: string): iConexaoQuery;
    function TQuery: TFDQuery;
    function DataSet(value: TDataSource): iConexaoQuery;
    function ExecSql(value: string): iConexaoQuery;
    function sqlPesquisa(value: string): iConexaoQuery; overload;
    function sqlPesquisaData(value: string): iConexaoQuery;
    function sqlPesquisaEstatica(value: string): iConexaoQuery;
    function getCampo(value: string): iConexaoQuery;
    function getValor(value: string): iConexaoQuery;
    function getDataInicial(value: TDate): iConexaoQuery;
    function getDataFinal(value: TDate): iConexaoQuery;
    function codigoCadastro(sp: string): integer;
  end;

  iEntity = interface
    ['{4B0F56B8-F9E9-48E8-ABFE-800B770DFF21}']
    function nomeTabela(value: string): iEntity;
    function getCampo(value: string): iEntity;
    function getValor(value: string): iEntity;
    function getDataInicial(value: TDate): iEntity;
    function getDataFinal(value: TDate): iEntity;
    function open(value: string): iEntity;
    function pesquisar: iEntity;
    function ExecSql: iEntity;
    function sqlPesquisa: iEntity;
    function sqlPesquisaData: iEntity;
    function sqlPesquisaEstatica: iEntity;

    function abrir: iEntity;
    function inserir: iEntity;
    function gravar: iEntity;
    function deletar: iEntity;
    function atualizar: iEntity;
    function editar: iEntity;
    function cancelar: iEntity;
    function fecharQuery: iEntity;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iEntity;
    function ordenarGrid(column: TColumn): iEntity;

    function getCodigo(value: integer): iEntity;
    function getNome(value: string): iEntity;

  end;

  iFDTable = interface
    ['{ABFB0FD7-63BA-48B9-BE43-183AA153F762}']
    function FD_Table(value: string): TFDTable;
  end;

  iObterValorPorExtenso = interface
    ['{A3F846DB-7D1C-4C55-9AF7-F55F9416601C}']
    function ValorPorExtenso(vlr: real): string;
    function valorPorExtensoSimples(vlr: real): string;
  end;

  iObterDataHoraPorExtenso = interface
    ['{6C99601F-9A56-4EDF-B2BF-703DCFBABD22}']
    function dia(Data: string): string;
    function mes(Data: string): string;
    function ano(Data: string): string;
    function dataPorExtenso(Data: TDate): string;
    function dataTexto(Data: TDate): string;
    function horaTexto(hora: TTime): string;
  end;

  iCalcularJuros = interface
    ['{14838CF7-3A33-42CB-A847-D2CE1F0D4246}']
    function calcularJurosSimplesPorPeriodo: real;
    function calcularJurosCompostos: real;
    function CalcularJuros: real;
    function getPeriodo(value: integer): iCalcularJuros;
    function getJuros(value: real): iCalcularJuros;
    function getCapital(value: real): iCalcularJuros;
    function percentualDeDesconto(valor, percentualACalular: real): real;
  end;

  iGravarLogOperacoes = interface
    ['{47863ECB-9C09-4E8A-A0BA-386B1428D14F}']
    function getJanela(value: string): iGravarLogOperacoes;
    function getOperacao(value: string): iGravarLogOperacoes;
    function getNomeRegistro(value: string): iGravarLogOperacoes;
    function getCodigoRegistro(value: integer): iGravarLogOperacoes;
    function getCodigoFuncionario(value: integer): iGravarLogOperacoes;
    function gravarLog: iGravarLogOperacoes;
  end;

  iCriarJanelas = interface
    ['{BEA3A61C-1058-4F51-B6AB-C488A1B18E1D}']
    function formShow(form: TForm; nomeForm: string): iCriarJanelas;
  end;

  iCadastroMarcas = interface
    ['{8E103BB1-A4BC-4EA6-AB36-339FDDF2E46B}']

    function getCampo(value: string): iCadastroMarcas;
    function getValor(value: string): iCadastroMarcas;
    function getDataInicial(value: TDate): iCadastroMarcas;
    function getDataFinal(value: TDate): iCadastroMarcas;
    function open(value: string): iCadastroMarcas;
    function pesquisar: iCadastroMarcas;
    function ExecSql: iCadastroMarcas;
    function sqlPesquisa: iCadastroMarcas;
    function sqlPesquisaData: iCadastroMarcas;
    function sqlPesquisaEstatica: iCadastroMarcas;

    function abrir: iCadastroMarcas;
    function inserir: iCadastroMarcas;
    function gravar: iCadastroMarcas;
    function deletar: iCadastroMarcas;
    function atualizar: iCadastroMarcas;
    function editar: iCadastroMarcas;
    function cancelar: iCadastroMarcas;
    function fecharQuery: iCadastroMarcas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroMarcas;
    function ordenarGrid(column: TColumn): iCadastroMarcas;

    function getCodigo(value: integer): iCadastroMarcas;
    function getMarca(value: string): iCadastroMarcas;
  end;

  iFactory = interface
    ['{05E76D27-7C57-4506-880D-F3720CC622E8}']
    function obertValorPorExtenso: iObterValorPorExtenso;
    function oberterDataHoraPorExtenso: iObterDataHoraPorExtenso;
    function CalcularJuros: iCalcularJuros;
    function criarJanela:iCriarJanelas;
  end;

  iFactoryEntity = interface
    ['{3DFCA13B-EC0F-4597-B527-D42F90034001}']
    function entityTable: iEntity;
  end;

  iFactoryQuery = interface
    ['{6A9FF249-F3A8-4660-BCFB-F227FCD3B86D}']
    function queryTable: iConexaoQuery;
  end;

implementation

end.
