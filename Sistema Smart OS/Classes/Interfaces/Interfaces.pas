unit Interfaces;

interface

uses
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FMX.Grid;

type
  iQuery = interface
    ['{E9A2BA41-9513-46F9-9736-8F71E8F5A9E9}']
    function openQuery(value: string): iQuery;
    function query: TFDQuery;
    function storedProcedure(value: string): integer;

    function ExecSql(value: string): iQuery;
    function sqlPesquisa(value: string): iQuery; overload;
    function sqlPesquisa(value: TDate): iQuery; overload;
    function sqlPesquisa(data1, data2: TDate): iQuery; overload;
    function sqlPesquisaEstatica(value: string): iQuery;
    function getCampo(value: string): iQuery;
    function getTabela(value: string): iQuery;

  end;

  iEntityModelo = interface // modelo de entidade a ser seguida
    ['{D7AAD4D3-8970-48C2-B4A7-0B9B28E54DD0}']
    function openEntity: iEntityModelo;
    function novoRegistros: iEntityModelo;
    function gravarRegistro: iEntityModelo;
    function editarRegistro: iEntityModelo;
    function deletarRegistro: iEntityModelo;
    function cancelarRegistro: iEntityModelo;
    function fecharQuery: iEntityModelo;
    function atualizarRegistro: iEntityModelo;
    function listarDados(value: TDataSource): iEntityModelo;
    function redimensionarGrig(value: TStringGrid): iEntityModelo;

    function ExecSql(value: string): iEntityModelo;
    function sqlPesquisa(value: string): iEntityModelo; overload;
    function sqlPesquisa(value: TDate): iEntityModelo; overload;
    function sqlPesquisa(data1, data2: TDate): iEntityModelo; overload;
    function sqlPesquisaEstatica(value: string): iEntityModelo;
    function getCampo(value: string): iEntityModelo;
    function ordenarGrid(column: TColumn): iEntityModelo;

    function getNomeGrupo(value: string): iEntityModelo;

  end;

  iCalcularJuros = interface
    ['{C27604DE-D63A-424F-822E-7D435196D62C}']
    function calcularJurosSimplesPorPeriodo: Real;
    function calcularJurosCompostos: Real;
    function CalcularJuros: Real;
    function getPeriodo(value: integer): iCalcularJuros;
    function getJuros(value: Real): iCalcularJuros;
    function getCapital(value: Real): iCalcularJuros;
    function percentualDeDesconto(valor, percentualACalular: Real): Real;
  end;

  iObterValorPorExtenso = interface
    ['{4991D111-A235-4ACE-ACBB-8288D4B0D2B9}']
    function ValorPorExtenso(vlr: Real): string;
    function valorPorExtensoSimples(vlr: Real): string;
  end;

  iObterDataHoraPorExtenso = interface
    ['{91E16333-A8BE-4266-9413-3624207225F5}']
    function dia(Data: string): string;
    function mes(Data: string): string;
    function ano(Data: string): string;
    function dataPorExtenso(Data: TDate): string;
    function dataTexto(Data: TDate): string;
    function horaTexto(Hora: TTime): string;
  end;

  iFDTable = interface
    ['{3F94A5E9-68C1-4A9D-B1BA-FAB07D858E5B}']
    function FD_Table(value: string): TFDTable;
  end;

  iLogErro = interface
    ['{0FD9F8B2-E848-44BE-823D-2CA87E100B3B}']
    function logErro(erro, tela, botao:string):iLogErro;
  end;

implementation

end.
