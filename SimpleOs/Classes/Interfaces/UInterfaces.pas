unit UInterfaces;

interface

uses
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.DBGrids,
  Vcl.Forms, Vcl.StdCtrls, jpeg, Vcl.Graphics, Vcl.Mask, Datasnap.DBClient,
  Vcl.ExtCtrls, System.Classes, RxToolEdit, RxCurrEdit, Vcl.ComCtrls;

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

    function exportar: iEntity;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iEntity;
    function getNome(value: string): iEntity;

  end;

  iEntityModeloRelatorio = interface
    ['{188C8512-8BE4-4998-A213-70F3B7ED6CB0}']

    function nomeTabela(value: string): iEntityModeloRelatorio;
    function getCampo(value: string): iEntityModeloRelatorio;
    function getValor(value: string): iEntityModeloRelatorio;
    function getDataInicial(value: TDate): iEntityModeloRelatorio;
    function getDataFinal(value: TDate): iEntityModeloRelatorio;
    function open(value: string): iEntityModeloRelatorio;
    function pesquisar: iEntityModeloRelatorio;
    function ExecSql: iEntityModeloRelatorio;
    function sqlPesquisa: iEntityModeloRelatorio;
    function sqlPesquisaData: iEntityModeloRelatorio;
    function sqlPesquisaEstatica: iEntityModeloRelatorio;

    function abrir: iEntityModeloRelatorio;
    function atualizar: iEntityModeloRelatorio;
    function cancelar: iEntityModeloRelatorio;
    function fecharQuery: iEntityModeloRelatorio;
    function listarGrid(value: TDataSource): iEntityModeloRelatorio;
    function ordenarGrid(column: TColumn): iEntityModeloRelatorio;

    function exportar: iEntityModeloRelatorio;
    procedure validarData(componet: tmaskEdit);

  end;

  iFDTable = interface
    ['{ABFB0FD7-63BA-48B9-BE43-183AA153F762}']
    function FD_Table(value: string): iFDTable;
    function getCampoTabela(value: string): iFDTable;
    function popularComponenteComboBox(value: TcomboBox): iFDTable;
    function localizarRegistro(codigo, campo: string): string;
    function retornaTable(value: TDataSource): iFDTable;
  end;

  iLocalizarRegistroEspecifico = interface
    ['{7BB256A7-0108-4712-AF4C-CE8B542BC43C}']
    function getTabela(value: string): iLocalizarRegistroEspecifico;
    function getCampoRetorno(value: string): iLocalizarRegistroEspecifico;
    function localizarRegistro(campo: string; valor: integer): string; overload;
    function localizarRegistro(campo: string; valor: string): string; overload;
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

  iCriptPasss = interface
    ['{89DF0430-320C-4C48-BDB5-C434DF97992B}']
    function md5(const Input: String): String;
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
    function calcularDiferencaPercentual(MaiorValor, Menorvalor: Currency)
      : Currency;
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

  iValidarDocumento = interface
    ['{E0F56A96-5255-4E34-B8E3-018D6AA8FD65}']
    function getDocumento(value: String): boolean;
    function limparValorRS(value: string): string;
  end;

  iCriarJanelas = interface
    ['{BEA3A61C-1058-4F51-B6AB-C488A1B18E1D}']
    function formShow(form: TForm; nomeForm: string): iCriarJanelas;
    function verificarPermisao(value: string): iCriarJanelas;
  end;

  iGerarCodigoBarras = interface
    ['{8B48DA43-62B7-4770-917B-1B529378C4E7}']
    function GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas)
      : iGerarCodigoBarras;
    function DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas)
      : iGerarCodigoBarras;
    Function EAN13(CodigoDeBarras: String): String;
    function exibirCodigo: string;
  end;

  iExtrairDiaData = interface
    ['{529649F1-DF15-44EE-B87F-9DA89DE48050}']
    function dia(Data: string): string;
    function mes(Data: string): string;
    function ano(Data: string): string;
    function dataPorExtenso(Data: TDate): string;
    function dataTexto(Data: TDate): string;
    function horaTexto(hora: TTime): string;
  end;

  iCadastroMarcas = interface
    ['{8E103BB1-A4BC-4EA6-AB36-339FDDF2E46B}']

    function getCampo(value: string): iCadastroMarcas;
    function getValor(value: string): iCadastroMarcas;
    function getDataInicial(value: TDate): iCadastroMarcas;
    function getDataFinal(value: TDate): iCadastroMarcas;
    function open(value: string): iCadastroMarcas;
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

  iCadastroGrupos = interface
    ['{4B0F56B8-F9E9-48E8-ABFE-800B770DFF21}']
    function nomeTabela(value: string): iCadastroGrupos;
    function getCampo(value: string): iCadastroGrupos;
    function getValor(value: string): iCadastroGrupos;
    function getDataInicial(value: TDate): iCadastroGrupos;
    function getDataFinal(value: TDate): iCadastroGrupos;
    function open(value: string): iCadastroGrupos;
    function ExecSql: iCadastroGrupos;
    function sqlPesquisa: iCadastroGrupos;
    function sqlPesquisaData: iCadastroGrupos;
    function sqlPesquisaEstatica: iCadastroGrupos;

    function abrir: iCadastroGrupos;
    function inserir: iCadastroGrupos;
    function gravar: iCadastroGrupos;
    function deletar: iCadastroGrupos;
    function atualizar: iCadastroGrupos;
    function editar: iCadastroGrupos;
    function cancelar: iCadastroGrupos;
    function fecharQuery: iCadastroGrupos;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroGrupos;
    function ordenarGrid(column: TColumn): iCadastroGrupos;

    function getCodigo(value: integer): iCadastroGrupos;
    function getGrupo(value: string): iCadastroGrupos;

  end;

  iFormaPagamento = interface
    ['{4B0F56B8-F9E9-48E8-ABFE-800B770DFF21}']

    function nomeTabela(value: string): iFormaPagamento;
    function getCampo(value: string): iFormaPagamento;
    function getValor(value: string): iFormaPagamento;
    function getDataInicial(value: TDate): iFormaPagamento;
    function getDataFinal(value: TDate): iFormaPagamento;
    function open(value: string): iFormaPagamento;
    function ExecSql: iFormaPagamento;
    function sqlPesquisa: iFormaPagamento;
    function sqlPesquisaData: iFormaPagamento;
    function sqlPesquisaEstatica: iFormaPagamento;

    function abrir: iFormaPagamento;
    function inserir: iFormaPagamento;
    function gravar: iFormaPagamento;
    function deletar: iFormaPagamento;
    function atualizar: iFormaPagamento;
    function editar: iFormaPagamento;
    function cancelar: iFormaPagamento;
    function fecharQuery: iFormaPagamento;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iFormaPagamento;
    function ordenarGrid(column: TColumn): iFormaPagamento;

    function getCodigo(value: integer): iFormaPagamento;
    function getFormaPagamento(value: string): iFormaPagamento;

  end;

  iTipoRetirada = interface
    ['{C194F099-E3C3-45BF-9CAB-C5DAD8C982B9}']
    function nomeTabela(value: string): iTipoRetirada;
    function getCampo(value: string): iTipoRetirada;
    function getValor(value: string): iTipoRetirada;
    function getDataInicial(value: TDate): iTipoRetirada;
    function getDataFinal(value: TDate): iTipoRetirada;
    function open(value: string): iTipoRetirada;
    function ExecSql: iTipoRetirada;
    function sqlPesquisa: iTipoRetirada;
    function sqlPesquisaData: iTipoRetirada;
    function sqlPesquisaEstatica: iTipoRetirada;

    function abrir: iTipoRetirada;
    function inserir: iTipoRetirada;
    function gravar: iTipoRetirada;
    function deletar: iTipoRetirada;
    function atualizar: iTipoRetirada;
    function editar: iTipoRetirada;
    function cancelar: iTipoRetirada;
    function fecharQuery: iTipoRetirada;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iTipoRetirada;
    function ordenarGrid(column: TColumn): iTipoRetirada;

    function getCodigo(value: integer): iTipoRetirada;
    function getTipoRetirada(value: string): iTipoRetirada;
  end;

  iConfigurarParcelas = interface
    ['{62B31E42-F4DB-4B6E-97B0-B93C63E179DC}']
    function nomeTabela(value: string): iConfigurarParcelas;
    function getCampo(value: string): iConfigurarParcelas;
    function getValor(value: string): iConfigurarParcelas;
    function getDataInicial(value: TDate): iConfigurarParcelas;
    function getDataFinal(value: TDate): iConfigurarParcelas;
    function open(value: string): iConfigurarParcelas;
    function ExecSql: iConfigurarParcelas;
    function sqlPesquisa: iConfigurarParcelas;
    function sqlPesquisaData: iConfigurarParcelas;
    function sqlPesquisaEstatica: iConfigurarParcelas;

    function abrir: iConfigurarParcelas;
    function inserir: iConfigurarParcelas;
    function gravar: iConfigurarParcelas;
    function deletar: iConfigurarParcelas;
    function atualizar: iConfigurarParcelas;
    function editar: iConfigurarParcelas;
    function cancelar: iConfigurarParcelas;
    function fecharQuery: iConfigurarParcelas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iConfigurarParcelas;
    function ordenarGrid(column: TColumn): iConfigurarParcelas;

    function getCodigo(value: integer): iConfigurarParcelas;
    function getConfigurarParcelaJuros(value: string): iConfigurarParcelas;
    function getConfigurarParcelaMulta(value: string): iConfigurarParcelas;

  end;

  iAtividadeFuncionarios = interface
    ['{0A82AB1E-1F99-42E0-80FE-12387A1DA3A9}']
    function nomeTabela(value: string): iAtividadeFuncionarios;
    function getCampo(value: string): iAtividadeFuncionarios;
    function getValor(value: string): iAtividadeFuncionarios;
    function getDataInicial(value: TDate): iAtividadeFuncionarios;
    function getDataFinal(value: TDate): iAtividadeFuncionarios;
    function open(value: string): iAtividadeFuncionarios;
    function ExecSql: iAtividadeFuncionarios;
    function sqlPesquisa: iAtividadeFuncionarios;
    function sqlPesquisaData: iAtividadeFuncionarios;
    function sqlPesquisaEstatica: iAtividadeFuncionarios;

    function abrir: iAtividadeFuncionarios;
    function inserir: iAtividadeFuncionarios;
    function gravar: iAtividadeFuncionarios;
    function deletar: iAtividadeFuncionarios;
    function atualizar: iAtividadeFuncionarios;
    function editar: iAtividadeFuncionarios;
    function cancelar: iAtividadeFuncionarios;
    function fecharQuery: iAtividadeFuncionarios;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iAtividadeFuncionarios;
    function ordenarGrid(column: TColumn): iAtividadeFuncionarios;

    function getCodigo(value: integer): iAtividadeFuncionarios;
    function getAtividadeFuncionario(value: string): iAtividadeFuncionarios;

  end;

  iCadastroContasAPagar = interface
    ['{DA369C18-5E3E-4C03-8562-F7B8AEA25B65}']
    function nomeTabela(value: string): iCadastroContasAPagar;
    function getCampo(value: string): iCadastroContasAPagar;
    function getValor(value: string): iCadastroContasAPagar;
    function getDataInicial(value: TDate): iCadastroContasAPagar;
    function getDataFinal(value: TDate): iCadastroContasAPagar;
    function open(value: string): iCadastroContasAPagar;
    function ExecSql: iCadastroContasAPagar;
    function sqlPesquisa: iCadastroContasAPagar;
    function sqlPesquisaData: iCadastroContasAPagar;
    function sqlPesquisaEstatica: iCadastroContasAPagar;

    function abrir: iCadastroContasAPagar;
    function inserir: iCadastroContasAPagar;
    function gravar: iCadastroContasAPagar;
    function deletar: iCadastroContasAPagar;
    function atualizar: iCadastroContasAPagar;
    function editar: iCadastroContasAPagar;
    function cancelar: iCadastroContasAPagar;
    function fecharQuery: iCadastroContasAPagar;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroContasAPagar;
    function ordenarGrid(column: TColumn): iCadastroContasAPagar;

    function getCodigo(value: integer): iCadastroContasAPagar;
    function getConta(value: string): iCadastroContasAPagar;
    function getDataVencimento(value: string): iCadastroContasAPagar;
    function getValorConta(value: string): iCadastroContasAPagar;
    function getJurosConta(value: string): iCadastroContasAPagar;
    function getMulta(value: string): iCadastroContasAPagar;
    function getDesconto(value: string): iCadastroContasAPagar;
    function getValorTotalConta(value: string): iCadastroContasAPagar;
    function getDataPagamento(value: string): iCadastroContasAPagar;
    function getPGTO(value: string): iCadastroContasAPagar;
    function getFuncionario(value: integer): iCadastroContasAPagar;
    function getObservacao(value: string): iCadastroContasAPagar;

    function exportar: iCadastroContasAPagar;
    function quitarParcela: iCadastroContasAPagar;

  end;

  iCadastroProblemasFrequentes = interface
    ['{DA369C18-5E3E-4C03-8562-F7B8AEA25B65}']
    function nomeTabela(value: string): iCadastroProblemasFrequentes;
    function getCampo(value: string): iCadastroProblemasFrequentes;
    function getValor(value: string): iCadastroProblemasFrequentes;
    function getDataInicial(value: TDate): iCadastroProblemasFrequentes;
    function getDataFinal(value: TDate): iCadastroProblemasFrequentes;
    function open(value: string): iCadastroProblemasFrequentes;
    function ExecSql: iCadastroProblemasFrequentes;
    function sqlPesquisa: iCadastroProblemasFrequentes;
    function sqlPesquisaData: iCadastroProblemasFrequentes;
    function sqlPesquisaEstatica: iCadastroProblemasFrequentes;

    function abrir: iCadastroProblemasFrequentes;
    function inserir: iCadastroProblemasFrequentes;
    function gravar: iCadastroProblemasFrequentes;
    function deletar: iCadastroProblemasFrequentes;
    function atualizar: iCadastroProblemasFrequentes;
    function editar: iCadastroProblemasFrequentes;
    function cancelar: iCadastroProblemasFrequentes;
    function fecharQuery: iCadastroProblemasFrequentes;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroProblemasFrequentes;
    function ordenarGrid(column: TColumn): iCadastroProblemasFrequentes;

    function getCodigo(value: integer): iCadastroProblemasFrequentes;
    function getNomePeca(value: string): iCadastroProblemasFrequentes;
    function getNumeroSerie(value: string): iCadastroProblemasFrequentes;
    function getMarca(value: string): iCadastroProblemasFrequentes;
    function getDataDeFabricacao(value: string): iCadastroProblemasFrequentes;
    function getDataDeCadastro(value: string): iCadastroProblemasFrequentes;
    function getDefeitoRelatado(value: string): iCadastroProblemasFrequentes;
    function getSolucaoDoDefeito(value: string): iCadastroProblemasFrequentes;
    function getObservacao(value: string): iCadastroProblemasFrequentes;
    function exportar: iCadastroProblemasFrequentes;

  end;

  iCadastroFornecedores = interface
    ['{060E03C2-3842-48EC-ADBF-3D8E00CCDB5E}']
    function nomeTabela(value: string): iCadastroFornecedores;
    function getCampo(value: string): iCadastroFornecedores;
    function getValor(value: string): iCadastroFornecedores;
    function getDataInicial(value: TDate): iCadastroFornecedores;
    function getDataFinal(value: TDate): iCadastroFornecedores;
    function open(value: string): iCadastroFornecedores;
    function ExecSql: iCadastroFornecedores;
    function sqlPesquisa: iCadastroFornecedores;
    function sqlPesquisaData: iCadastroFornecedores;
    function sqlPesquisaEstatica: iCadastroFornecedores;

    function abrir: iCadastroFornecedores;
    function inserir: iCadastroFornecedores;
    function gravar: iCadastroFornecedores;
    function deletar: iCadastroFornecedores;
    function atualizar: iCadastroFornecedores;
    function editar: iCadastroFornecedores;
    function cancelar: iCadastroFornecedores;
    function fecharQuery: iCadastroFornecedores;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroFornecedores;
    function ordenarGrid(column: TColumn): iCadastroFornecedores;

    function getCodigo(value: integer): iCadastroFornecedores;
    function getNomeFantasia(value: string): iCadastroFornecedores;
    function getRazaoSocial(value: string): iCadastroFornecedores;
    function getCPFCNPJ(value: string): iCadastroFornecedores;
    function getInscricaoEstadual(value: string): iCadastroFornecedores;
    function getEndereco(value: string): iCadastroFornecedores;
    function getBairro(value: string): iCadastroFornecedores;
    function getNumero(value: integer): iCadastroFornecedores;
    function getComplemento(value: string): iCadastroFornecedores;
    function getCep(value: string): iCadastroFornecedores;
    function getCidade(value: string): iCadastroFornecedores;
    function getEstado(value: string): iCadastroFornecedores;
    function getTelefone(value: string): iCadastroFornecedores;
    function getCelular(value: string): iCadastroFornecedores;
    function getEmail(value: string): iCadastroFornecedores;
    function getFuncionario(value: integer): iCadastroFornecedores;
    function getResponsavel(value: string): iCadastroFornecedores;
    function getObservacao(value: string): iCadastroFornecedores;
    function exportar: iCadastroFornecedores;
  end;

  iCadastroTransportadora = interface
    ['{B32A85CB-D877-42D7-9185-398C68E7BCE1}']
    function nomeTabela(value: string): iCadastroTransportadora;
    function getCampo(value: string): iCadastroTransportadora;
    function getValor(value: string): iCadastroTransportadora;
    function getDataInicial(value: TDate): iCadastroTransportadora;
    function getDataFinal(value: TDate): iCadastroTransportadora;
    function open(value: string): iCadastroTransportadora;
    function ExecSql: iCadastroTransportadora;
    function sqlPesquisa: iCadastroTransportadora;
    function sqlPesquisaData: iCadastroTransportadora;
    function sqlPesquisaEstatica: iCadastroTransportadora;

    function abrir: iCadastroTransportadora;
    function inserir: iCadastroTransportadora;
    function gravar: iCadastroTransportadora;
    function deletar: iCadastroTransportadora;
    function atualizar: iCadastroTransportadora;
    function editar: iCadastroTransportadora;
    function cancelar: iCadastroTransportadora;
    function fecharQuery: iCadastroTransportadora;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroTransportadora;
    function ordenarGrid(column: TColumn): iCadastroTransportadora;

    function getCodigo(value: integer): iCadastroTransportadora;
    function getNomeFantasia(value: string): iCadastroTransportadora;
    function getRazaoSocial(value: string): iCadastroTransportadora;
    function getCPFCNPJ(value: string): iCadastroTransportadora;
    function getInscricaoEstadual(value: string): iCadastroTransportadora;
    function getEndereco(value: string): iCadastroTransportadora;
    function getBairro(value: string): iCadastroTransportadora;
    function getNumero(value: integer): iCadastroTransportadora;
    function getComplemento(value: string): iCadastroTransportadora;
    function getCep(value: string): iCadastroTransportadora;
    function getCidade(value: string): iCadastroTransportadora;
    function getEstado(value: string): iCadastroTransportadora;
    function getTelefone(value: string): iCadastroTransportadora;
    function getCelular(value: string): iCadastroTransportadora;
    function getEmail(value: string): iCadastroTransportadora;
    function getFuncionario(value: integer): iCadastroTransportadora;
    function getResponsavel(value: string): iCadastroTransportadora;
    function getObservacao(value: string): iCadastroTransportadora;
    function exportar: iCadastroTransportadora;

  end;

  iCadastroProdutos = interface
    ['{A164199D-BE1A-4BBB-9E89-8CAB049192E7}']
    function nomeTabela(value: string): iCadastroProdutos;
    function getCampo(value: string): iCadastroProdutos;
    function getValor(value: string): iCadastroProdutos;
    function getDataInicial(value: TDate): iCadastroProdutos;
    function getDataFinal(value: TDate): iCadastroProdutos;
    function open(value: string): iCadastroProdutos;
    function ExecSql: iCadastroProdutos;
    function sqlPesquisa: iCadastroProdutos;
    function sqlPesquisaData: iCadastroProdutos;
    function sqlPesquisaEstatica: iCadastroProdutos;

    function abrir: iCadastroProdutos;
    function inserir: iCadastroProdutos;
    function gravar: iCadastroProdutos;
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
    function getModelo(value: string): iCadastroProdutos;
    function getNumeroDeSerie(value: string): iCadastroProdutos;
    function getDataFabricacao(value: string): iCadastroProdutos;
    function getCodigoMarca(value: string): iCadastroProdutos;
    function getCodigoFuncionario(value: integer): iCadastroProdutos;
    function getFoto(value: TJPEGImage): iCadastroProdutos;
    function getObservacao(value: string): iCadastroProdutos;
    function getGrupo(value: string): iCadastroProdutos;
    function getMarca(value: string): iCadastroProdutos;

    function exportar: iCadastroProdutos;

  end;

  iCadastroFuncionario = interface
    ['{633E9D61-F59C-42F5-987A-8F7DDDBF089F}']
    function nomeTabela(value: string): iCadastroFuncionario;
    function getCampo(value: string): iCadastroFuncionario;
    function getValor(value: string): iCadastroFuncionario;
    function getDataInicial(value: TDate): iCadastroFuncionario;
    function getDataFinal(value: TDate): iCadastroFuncionario;
    function open(value: string): iCadastroFuncionario;
    function ExecSql: iCadastroFuncionario;
    function sqlPesquisa: iCadastroFuncionario;
    function sqlPesquisaData: iCadastroFuncionario;
    function sqlPesquisaEstatica: iCadastroFuncionario;

    function abrir: iCadastroFuncionario;
    function inserir: iCadastroFuncionario;
    function gravar: iCadastroFuncionario;
    function gravarEditando: iCadastroFuncionario;
    function deletar: iCadastroFuncionario;
    function atualizar: iCadastroFuncionario;
    function editar: iCadastroFuncionario;
    function cancelar: iCadastroFuncionario;
    function fecharQuery: iCadastroFuncionario;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroFuncionario;
    function ordenarGrid(column: TColumn): iCadastroFuncionario;

    function getNome(value: string): iCadastroFuncionario;
    function getDATA_NASCIMENTO(value: string): iCadastroFuncionario;
    function getDocumento(value: string): iCadastroFuncionario;
    function getCPF(value: string): iCadastroFuncionario;
    function getEndereco(value: string): iCadastroFuncionario;
    function getBairro(value: string): iCadastroFuncionario;
    function getNumero(value: integer): iCadastroFuncionario;
    function getComplemento(value: string): iCadastroFuncionario;
    function getCep(value: string): iCadastroFuncionario;
    function getCidade(value: string): iCadastroFuncionario;
    function getUF(value: string): iCadastroFuncionario;
    function getDATA_CADASTRO(value: string): iCadastroFuncionario;
    function getDATA_DEMISSAO(value: string): iCadastroFuncionario;
    function getATIVIDADE(value: integer): iCadastroFuncionario;
    function getNomeAtividade(value: string): iCadastroFuncionario;
    function getTelefone(value: string): iCadastroFuncionario;
    function getCelular(value: string): iCadastroFuncionario;
    function getEmail(value: string): iCadastroFuncionario;
    function getUSUARIO(value: string): iCadastroFuncionario;
    function getSENHA(value: string): iCadastroFuncionario;
    function getSTATUS(value: string): iCadastroFuncionario;
    function getEXCLUIDO(value: string): iCadastroFuncionario;
    function getFoto(value: TJPEGImage): iCadastroFuncionario;
    function getFUNCIONARIO_CADASTRO(value: integer): iCadastroFuncionario;
    function getObservacao(value: string): iCadastroFuncionario;
    function exportar: iCadastroFuncionario;

    function validarUsuario(value: string): iCadastroFuncionario;
    function validarUsuarioEditando(codigo: integer; usuario: string)
      : iCadastroFuncionario;
    function validarSenha(value1, value2: string): iCadastroFuncionario;
    function validarSenhaEditando(value1, value2: string): iCadastroFuncionario;

  end;

  iComissoesFuncionario = interface
    ['{95401B1A-970D-4471-ACA6-B7A3C058C5B7}']

    function nomeTabela(value: string): iComissoesFuncionario;
    function getCampo(value: string): iComissoesFuncionario;
    function getValor(value: string): iComissoesFuncionario;
    function open(value: string): iComissoesFuncionario;
    function ExecSql: iComissoesFuncionario;
    function sqlPesquisa: iComissoesFuncionario;
    function sqlPesquisaEstatica: iComissoesFuncionario; overload;
    function sqlPesquisaEstatica(value: integer)
      : iComissoesFuncionario; overload;

    function abrir: iComissoesFuncionario;
    function inserir: iComissoesFuncionario;
    function gravar: iComissoesFuncionario;
    function deletar: iComissoesFuncionario;
    function atualizar: iComissoesFuncionario;
    function editar: iComissoesFuncionario;
    function cancelar: iComissoesFuncionario;
    function fecharQuery: iComissoesFuncionario;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iComissoesFuncionario;
    function ordenarGrid(column: TColumn): iComissoesFuncionario;

    function getID_FUNCIONARIO(value: integer): iComissoesFuncionario;
    function getAPLICAR_COMISSAO(value: string): iComissoesFuncionario;
    function getVALOR_POR_ATENDIMENTO(value: string): iComissoesFuncionario;
    function getObservacao(value: string): iComissoesFuncionario;

  end;

  iCadastroSituacoesOrdem = interface
    ['{2BCC9FBF-46B9-4242-8722-5296F610EFAA}']

    function nomeTabela(value: string): iCadastroSituacoesOrdem;
    function getCampo(value: string): iCadastroSituacoesOrdem;
    function getValor(value: string): iCadastroSituacoesOrdem;
    function getDataInicial(value: TDate): iCadastroSituacoesOrdem;
    function getDataFinal(value: TDate): iCadastroSituacoesOrdem;
    function open(value: string): iCadastroSituacoesOrdem;
    function ExecSql: iCadastroSituacoesOrdem;
    function sqlPesquisa: iCadastroSituacoesOrdem;
    function sqlPesquisaData: iCadastroSituacoesOrdem;
    function sqlPesquisaEstatica: iCadastroSituacoesOrdem;

    function abrir: iCadastroSituacoesOrdem;
    function inserir: iCadastroSituacoesOrdem;
    function gravar: iCadastroSituacoesOrdem;
    function deletar: iCadastroSituacoesOrdem;
    function atualizar: iCadastroSituacoesOrdem;
    function editar: iCadastroSituacoesOrdem;
    function cancelar: iCadastroSituacoesOrdem;
    function fecharQuery: iCadastroSituacoesOrdem;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroSituacoesOrdem;
    function ordenarGrid(column: TColumn): iCadastroSituacoesOrdem;

    function getSITUACAO_ORDEM(value: string): iCadastroSituacoesOrdem;

  end;

  iCadastroClientes = interface
    ['{1396E17A-4FC2-4F81-8481-05304DC5F636}']

    function nomeTabela(value: string): iCadastroClientes;
    function getCampo(value: string): iCadastroClientes;
    function getValor(value: string): iCadastroClientes;
    function getDataInicial(value: TDate): iCadastroClientes;
    function getDataFinal(value: TDate): iCadastroClientes;
    function open(value: string): iCadastroClientes;
    function ExecSql: iCadastroClientes;
    function sqlPesquisa: iCadastroClientes;
    function sqlPesquisaData: iCadastroClientes;
    function sqlPesquisaEstatica: iCadastroClientes;

    function abrir: iCadastroClientes;
    function inserir: iCadastroClientes;
    function gravar: iCadastroClientes;
    function deletar: iCadastroClientes;
    function atualizar: iCadastroClientes;
    function editar: iCadastroClientes;
    function cancelar: iCadastroClientes;
    function fecharQuery: iCadastroClientes;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroClientes;
    function ordenarGrid(column: TColumn): iCadastroClientes;

    function getID(value: integer): iCadastroClientes;
    function getNome(value: string): iCadastroClientes;
    function getTIPO_CADASTRO(value: string): iCadastroClientes;
    function getDATA_NASCIMENTO(value: string): iCadastroClientes;
    function getDATA_CADASTRO(value: string): iCadastroClientes;
    function getCPF_CNPJ(value: string): iCadastroClientes;
    function getDocumento(value: string): iCadastroClientes;
    function getEndereco(value: string): iCadastroClientes;
    function getBairro(value: string): iCadastroClientes;
    function getNumero(value: integer): iCadastroClientes;
    function getComplemento(value: string): iCadastroClientes;
    function getCep(value: string): iCadastroClientes;
    function getCidade(value: string): iCadastroClientes;
    function getEstado(value: string): iCadastroClientes;
    function getTelefone(value: string): iCadastroClientes;
    function getCelular(value: string): iCadastroClientes;
    function getEmail(value: string): iCadastroClientes;
    function getFUNCIONARIO_CADASTRO(value: integer): iCadastroClientes;
    function getSITUACAO_CLIENTE(value: string): iCadastroClientes;
    function getFoto(value: TJPEGImage): iCadastroClientes;
    function getObservacao(value: string): iCadastroClientes;
    function exportar: iCadastroClientes;
    procedure validarData(componet: tmaskEdit);

  end;

  iEntradaProdutos = interface
    ['{ECA9313B-F138-48F5-9B8E-003D7F2A8E62}']
    function nomeTabela(value: string): iEntradaProdutos;
    function getCampo(value: string): iEntradaProdutos;
    function getValor(value: string): iEntradaProdutos;
    function getDataInicial(value: TDate): iEntradaProdutos;
    function getDataFinal(value: TDate): iEntradaProdutos;
    function open(value: string): iEntradaProdutos;
    function pesquisar: iEntradaProdutos;
    function ExecSql: iEntradaProdutos;
    function sqlPesquisa: iEntradaProdutos;
    function sqlPesquisaData: iEntradaProdutos;
    function sqlPesquisaEstatica: iEntradaProdutos;

    function abrir: iEntradaProdutos;
    function inserir: iEntradaProdutos;
    function gravar: iEntradaProdutos;
    function deletar: iEntradaProdutos;
    function atualizar: iEntradaProdutos;
    function editar: iEntradaProdutos;
    function cancelar: iEntradaProdutos;
    function fecharQuery: iEntradaProdutos;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iEntradaProdutos;
    function ordenarGrid(column: TColumn): iEntradaProdutos;

    function getID(value: integer): iEntradaProdutos;
    function getID_PRODUTO(value: integer): iEntradaProdutos;
    function getProduto(value: string): iEntradaProdutos;
    function getVALOR_POR_ITENS(value: Currency): iEntradaProdutos;
    function getQUANTIDADE(value: integer): iEntradaProdutos;
    function getTOTAL_DA_ENTRADA(value: Currency): iEntradaProdutos;
    function getNUMERO_NOTA(value: string): iEntradaProdutos;
    function getFuncionario(value: integer): iEntradaProdutos;
    function getDATA(value: string): iEntradaProdutos;
    function getHORA(value: string): iEntradaProdutos;
    function getObservacao(value: string): iEntradaProdutos;

    function exportar: iEntradaProdutos;
    function atualizarEstoque: iEntradaProdutos;
    function getCodigoProdutoAtualizar(value: integer): iEntradaProdutos;
    function getQuantidadeProdutoAtualizar(value: integer): iEntradaProdutos;
    function getvalorEntradaProdutoAtualizar(value: Currency): iEntradaProdutos;
    function getValorTotalEntradaProdutoAtualizar(value: Currency)
      : iEntradaProdutos;
    procedure validarData(componet: tmaskEdit);

  end;

  iSaidaDeProdutos = interface
    ['{D18DBDB1-ABB7-4CA4-B8A1-F1606E69D07E}']

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
    function gravar: iSaidaDeProdutos;
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
    function getDATA(value: string): iSaidaDeProdutos;
    function getHORA(value: string): iSaidaDeProdutos;
    function getMotivo(value: string): iSaidaDeProdutos;
    function getFuncionario(value: integer): iSaidaDeProdutos;
    function getObservacao(value: string): iSaidaDeProdutos;

    function exportar: iSaidaDeProdutos;
    function atualizarEstoque: iSaidaDeProdutos;
    function getCodigoProdutoAtualizar(value: integer): iSaidaDeProdutos;
    function getQuantidadeProdutoAtualizar(value: integer): iSaidaDeProdutos;

  end;

  iCadastroServico = interface
    ['{EEC5A558-B31A-45B6-A001-ACE569828ABE}']

    function nomeTabela(value: string): iCadastroServico;
    function getCampo(value: string): iCadastroServico;
    function getValor(value: string): iCadastroServico;
    function getDataInicial(value: TDate): iCadastroServico;
    function getDataFinal(value: TDate): iCadastroServico;
    function open(value: string): iCadastroServico;
    function pesquisar: iCadastroServico;
    function ExecSql: iCadastroServico;
    function sqlPesquisa: iCadastroServico;
    function sqlPesquisaData: iCadastroServico;
    function sqlPesquisaEstatica: iCadastroServico;

    function abrir: iCadastroServico;
    function inserir: iCadastroServico;
    function gravar: iCadastroServico;
    function deletar: iCadastroServico;
    function atualizar: iCadastroServico;
    function editar: iCadastroServico;
    function cancelar: iCadastroServico;
    function fecharQuery: iCadastroServico;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCadastroServico;
    function ordenarGrid(column: TColumn): iCadastroServico;

    function getID(value: integer): iCadastroServico;
    function getSERVICO(value: string): iCadastroServico;
    function getVALORSERVICO(value: string): iCadastroServico;
    function getDescricao(value: string): iCadastroServico;

    function exportar: iCadastroServico;

  end;

  iListarOrdensServico = interface
    ['{E125147B-1F82-4CC6-BC05-D02F57EE71CF}']

    function nomeTabela(value: string): iListarOrdensServico;
    function getCampo(value: string): iListarOrdensServico;
    function getValor(value: string): iListarOrdensServico;
    function getDataInicial(value: TDate): iListarOrdensServico;
    function getDataFinal(value: TDate): iListarOrdensServico;
    function open(value: string): iListarOrdensServico;
    function pesquisar: iListarOrdensServico;
    function ExecSql: iListarOrdensServico;
    function sqlPesquisa: iListarOrdensServico;
    function sqlPesquisaData: iListarOrdensServico;
    function sqlPesquisaEstatica: iListarOrdensServico;
    function listarGrid(value: TDataSource): iListarOrdensServico;
    function ordenarGrid(column: TColumn): iListarOrdensServico;
    function atualizar: iListarOrdensServico;
    function fecharQuery: iListarOrdensServico;

    function abrir: iListarOrdensServico;
    function exportar: iListarOrdensServico;

  end;

  iCriarOrdemServico = interface
    ['{AB2ECEA0-3FC5-418C-A90E-31C33629351C}']

    function nomeTabela(value: string): iCriarOrdemServico;
    function getCampo(value: string): iCriarOrdemServico;
    function getValor(value: string): iCriarOrdemServico;
    function getDataInicial(value: TDate): iCriarOrdemServico;
    function getDataFinal(value: TDate): iCriarOrdemServico;
    function open(value: string): iCriarOrdemServico;
    function pesquisar: iCriarOrdemServico;
    function ExecSql: iCriarOrdemServico;
    function sqlPesquisa: iCriarOrdemServico;
    function sqlPesquisaData: iCriarOrdemServico;
    function sqlPesquisaEstatica: iCriarOrdemServico;

    function abrir: iCriarOrdemServico;
    function inserir: iCriarOrdemServico;
    function gravar: iCriarOrdemServico;
    function deletar: iCriarOrdemServico;
    function atualizar: iCriarOrdemServico;
    function editar: iCriarOrdemServico;
    function cancelar: iCriarOrdemServico;
    function fecharQuery: iCriarOrdemServico;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iCriarOrdemServico;
    function ordenarGrid(column: TColumn): iCriarOrdemServico;
    function estornarOrdem(value: integer): iCriarOrdemServico;

    function getID(value: integer): iCriarOrdemServico;
    function getID_CLIENTE(value: string): iCriarOrdemServico;
    function getEQUIPAMENTO(value: string): iCriarOrdemServico;
    function getDEFEITO_RELATADO(value: string): iCriarOrdemServico;
    function getMarca(value: string): iCriarOrdemServico;
    function getModelo(value: string): iCriarOrdemServico;
    function getNUMERO_SERIE(value: string): iCriarOrdemServico;
    function getDATA_FABRICACAO(value: string): iCriarOrdemServico;
    function getLAUDO_DO_TECNICO(value: string): iCriarOrdemServico;
    function getSOLUCAO_DO_PROBLEMA(value: string): iCriarOrdemServico;
    function getVALOR_DA_ORDEM(value: string): iCriarOrdemServico;
    function getDesconto(value: string): iCriarOrdemServico;
    function getACRESCIMO(value: string): iCriarOrdemServico;
    function getTotalDoOrcamento(value: string): iCriarOrdemServico;
    function getID_FUNCIONARIO(value: integer): iCriarOrdemServico;
    function getNOME_FUNCIONARIO(value: string): iCriarOrdemServico;
    function getRETORNO(value: string): iCriarOrdemServico;
    function getDATA_RETORNO(value: string): iCriarOrdemServico;
    function getSITUACAO_DA_ORDEM(value: string): iCriarOrdemServico;
    function getTOTAL_PARCELAS(value: string): iCriarOrdemServico;
    function getVALOR_DA_PARCELA(value: string): iCriarOrdemServico;
    function getPRIORIDADE(value: string): iCriarOrdemServico;
    function getDataCadastro(value: string): iCriarOrdemServico;
    function getDataFinalizacao(value: string): iCriarOrdemServico;
    function getHoraFinalizacao(value: string): iCriarOrdemServico;
    function getDataBaseVencimento(value: string): iCriarOrdemServico;
    function getObservacao(value: string): iCriarOrdemServico;
    function getSTATUS(value: string): iCriarOrdemServico;
    function getIdTecnico(value: string): iCriarOrdemServico;
    function getTecnico(value: string): iCriarOrdemServico;
    function setId: integer;
    function setId_Cliente: integer;
    function setTotalDeParcelas: integer;
    function setValorDaParcelas: Currency;
    function setDataBaseVencimento: TDate;

    function calcularDesconto(valor, desconto: TCurrencyEdit): string;
    function calcularAcrescimo(valor, desconto,
      acrescimo: TCurrencyEdit): string;
    function calularTotalPorNumeroDeParcela(total: TCurrencyEdit;
      qtde: TcomboBox): string;

    function estadoDaTabela: string;

    function exportar: iCriarOrdemServico;

  end;

  iAdicionarServicosOrdem = interface
    ['{F1A112F9-8495-4C23-9104-2A77CE79BAFA}']

    function nomeTabela(value: string): iAdicionarServicosOrdem;
    function getCampo(value: string): iAdicionarServicosOrdem;
    function getValor(value: string): iAdicionarServicosOrdem;
    function getDataInicial(value: TDate): iAdicionarServicosOrdem;
    function getDataFinal(value: TDate): iAdicionarServicosOrdem;
    function open(value: string): iAdicionarServicosOrdem;
    function pesquisar: iAdicionarServicosOrdem;
    function ExecSql: iAdicionarServicosOrdem;
    function sqlPesquisa: iAdicionarServicosOrdem;
    function sqlPesquisaData: iAdicionarServicosOrdem;
    function sqlPesquisaEstatica: iAdicionarServicosOrdem;

    function abrir: iAdicionarServicosOrdem;
    function inserir: iAdicionarServicosOrdem;
    function gravar: iAdicionarServicosOrdem;
    function deletar: iAdicionarServicosOrdem;
    function atualizar: iAdicionarServicosOrdem;
    function editar: iAdicionarServicosOrdem;
    function cancelar: iAdicionarServicosOrdem;
    function fecharQuery: iAdicionarServicosOrdem;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iAdicionarServicosOrdem;
    function ordenarGrid(column: TColumn): iAdicionarServicosOrdem;

    function adicionarItemsTemporiamenteID(value: integer)
      : iAdicionarServicosOrdem;
    function adicionarItemsTemporariamenteServico(value: string)
      : iAdicionarServicosOrdem;
    function adicionarItemTemporariamenteValor(value: Currency)
      : iAdicionarServicosOrdem;
    function adicionarItemsTemporariamente(value: TDataSource)
      : iAdicionarServicosOrdem;

    function getID(value: integer): iAdicionarServicosOrdem;
    function getID_ORDEM(value: integer): iAdicionarServicosOrdem;
    function getID_SERVICO(value: integer): iAdicionarServicosOrdem;
    function getSERVICO(value: string): iAdicionarServicosOrdem;
    function getVALOR_ITEM(value: string): iAdicionarServicosOrdem;

    function gravarServicosAdicionadosInsert(value: TclientDataSet;
      codigoOrdem: integer): iAdicionarServicosOrdem;
    function gravarServicosAdicionadosEdit(value: TclientDataSet;
      codigoOrdem: integer): iAdicionarServicosOrdem;

    function listarItensDaOS(value: TclientDataSet): iAdicionarServicosOrdem;
    function excluiServicoDaOS(value: integer): iAdicionarServicosOrdem;

  end;

  iParcelaOrdem = interface
    ['{7B51AACF-1531-4749-B330-411CCEFD4CC6}']

    function nomeTabela(value: string): iParcelaOrdem;
    function getCampo(value: string): iParcelaOrdem;
    function getValor(value: string): iParcelaOrdem;
    function getDataInicial(value: TDate): iParcelaOrdem;
    function getDataFinal(value: TDate): iParcelaOrdem;
    function open(value: string): iParcelaOrdem;
    function pesquisar: iParcelaOrdem;
    function ExecSql: iParcelaOrdem;
    function sqlPesquisa: iParcelaOrdem;
    function sqlPesquisaData: iParcelaOrdem;
    function sqlPesquisaEstatica: iParcelaOrdem;

    function abrir: iParcelaOrdem;
    function inserir: iParcelaOrdem;
    function gravar: iParcelaOrdem;
    function deletar: iParcelaOrdem;
    function atualizar: iParcelaOrdem;
    function editar: iParcelaOrdem;
    function cancelar: iParcelaOrdem;
    function fecharQuery: iParcelaOrdem;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iParcelaOrdem;
    function ordenarGrid(column: TColumn): iParcelaOrdem;

    function getID(value: integer): iParcelaOrdem;
    function getID_ORDEM(value: integer): iParcelaOrdem;
    function getID_CLIENTE(value: integer): iParcelaOrdem;
    function getTOTAL_PARCELAS(value: integer): iParcelaOrdem;
    function getPARCELA(value: integer): iParcelaOrdem;
    function getVALOR_PARCELA(value: Currency): iParcelaOrdem;
    function getDATA_VENCIMENTO(value: string): iParcelaOrdem;
    function getDesconto(value: string): iParcelaOrdem;
    function getJuros(value: string): iParcelaOrdem;
    function getMulta(value: string): iParcelaOrdem;
    function getVALOR_TOTAL(value: string): iParcelaOrdem;
    function getDATA_PAGAMENTO(value: string): iParcelaOrdem;
    function getHORA_PAGAMENTO(value: string): iParcelaOrdem;
    function getFORMA_PAGAMENTO(value: string): iParcelaOrdem;
    function getPGTO(value: string): iParcelaOrdem;
    function getID_FUNCIONARIO(value: integer): iParcelaOrdem;
    function getNOME_FUNCIONARIO(value: string): iParcelaOrdem;
    function getObservacao(value: string): iParcelaOrdem;

    function exportar: iParcelaOrdem;
    function gerarParcelas: iParcelaOrdem;
    function calularJuros: string;
    function extornarParcelaSelecionada(value: integer): iParcelaOrdem;
    function adicionarParcela: iParcelaOrdem;
    function gravarEdicaoParcelas: iParcelaOrdem;
    function estadoDaTabela(value: string): iParcelaOrdem;

    function setJuros(value:TCurrencyEdit):iParcelaOrdem;
    function setMulta(value:TCurrencyEdit):iParcelaOrdem;
    function setDatapagamento(value:TDateTimePicker):iParcelaOrdem;
    function setHoraPagamento(value:TMaskEdit):iParcelaOrdem;

  end;

  iEstornarOS = interface
    ['{C4953B95-878E-4020-A2D1-5C811361D295}']

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
    function gravar: iEstornarOS;
    function atualizar: iEstornarOS;
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
    function getMotivo(value: string): iEstornarOS;
    function getFuncionario(value: integer): iEstornarOS;
    function getNOME_FUNCIONARIO(value: string): iEstornarOS;
    function getObservacao(value: string): iEstornarOS;

    function exportar: iEstornarOS;
    function validarData(componet: tmaskEdit): iEstornarOS;

    function getCodigo(value: integer): iEstornarOS;
    function getNome(value: string): iEstornarOS;

  end;

  iEstonarVenda = interface
    ['{864B5D1E-31B5-4F3B-8D05-679A40C95087}']

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

    function getID(value: integer): iEstonarVenda;
    function getID_VENDA(value: integer): iEstonarVenda;
    function getID_CLIENTE(value: integer): iEstonarVenda;
    function getVALOR_VENDA(value: Currency): iEstonarVenda;
    function getDATA(value: string): iEstonarVenda;
    function getHORA(value: string): iEstonarVenda;
    function getMotivo(value: string): iEstonarVenda;
    function getFuncionario(value: integer): iEstonarVenda;
    function getNOME_FUNCIONARIO(value: string): iEstonarVenda;
    function getObservacao(value: string): iEstonarVenda;

    function exportar: iEstonarVenda;
    function validarData(componet: tmaskEdit): iEstonarVenda;

    function getCodigo(value: integer): iEstonarVenda;
    function getNome(value: string): iEstonarVenda;

  end;

  iVisualizarOrdens = interface
    ['{9CADDFBD-CBF2-4294-8310-928571A77E6F}']

    function nomeTabela(value: string): iVisualizarOrdens;
    function getCampo(value: string): iVisualizarOrdens;
    function getValor(value: string): iVisualizarOrdens;
    function getDataInicial(value: TDate): iVisualizarOrdens;
    function getDataFinal(value: TDate): iVisualizarOrdens;
    function open(value: string): iVisualizarOrdens;
    function pesquisar: iVisualizarOrdens;
    function ExecSql: iVisualizarOrdens;
    function sqlPesquisa: iVisualizarOrdens;
    function sqlPesquisaData: iVisualizarOrdens;
    function sqlPesquisaEstatica: iVisualizarOrdens;

    function abrir: iVisualizarOrdens;
    function listarGrid(value: TDataSource): iVisualizarOrdens;
    function ordenarGrid(column: TColumn): iVisualizarOrdens;
    function atualizar: iVisualizarOrdens;
    function exportar: iVisualizarOrdens;

  end;

  iVisualizarServicosOrdem = interface
    ['{A8EF0695-9710-4E49-A8CA-13D0FE1E2C22}']

    function nomeTabela(value: string): iVisualizarServicosOrdem;
    function getCampo(value: string): iVisualizarServicosOrdem;
    function getValor(value: string): iVisualizarServicosOrdem;
    function getDataInicial(value: TDate): iVisualizarServicosOrdem;
    function getDataFinal(value: TDate): iVisualizarServicosOrdem;
    function open(value: string): iVisualizarServicosOrdem;
    function pesquisar: iVisualizarServicosOrdem;
    function ExecSql: iVisualizarServicosOrdem;
    function sqlPesquisa: iVisualizarServicosOrdem;
    function sqlPesquisaData: iVisualizarServicosOrdem;
    function sqlPesquisaEstatica: iVisualizarServicosOrdem;

    function abrir: iVisualizarServicosOrdem;
    function listarGrid(value: TDataSource): iVisualizarServicosOrdem;
    function ordenarGrid(column: TColumn): iVisualizarServicosOrdem;
    function atualizar: iVisualizarServicosOrdem;
    function exportar: iVisualizarServicosOrdem;

  end;

  iVisualizarParcelasOrdem = interface
    ['{95A568DB-04FF-491F-A5AC-D004EB9A1881}']

    function nomeTabela(value: string): iVisualizarParcelasOrdem;
    function getCampo(value: string): iVisualizarParcelasOrdem;
    function getValor(value: string): iVisualizarParcelasOrdem;
    function getDataInicial(value: TDate): iVisualizarParcelasOrdem;
    function getDataFinal(value: TDate): iVisualizarParcelasOrdem;
    function open(value: string): iVisualizarParcelasOrdem;
    function pesquisar: iVisualizarParcelasOrdem;
    function ExecSql: iVisualizarParcelasOrdem;
    function sqlPesquisa: iVisualizarParcelasOrdem;
    function sqlPesquisaData: iVisualizarParcelasOrdem;
    function sqlPesquisaEstatica: iVisualizarParcelasOrdem;

    function abrir: iVisualizarParcelasOrdem;
    function listarGrid(value: TDataSource): iVisualizarParcelasOrdem;
    function ordenarGrid(column: TColumn): iVisualizarParcelasOrdem;
    function atualizar: iVisualizarParcelasOrdem;
    function exportar: iVisualizarParcelasOrdem;

  end;

  iDadosEmpresa = interface
    ['{FD9AE2A8-18B6-4855-BBF7-3F8AA44CBEB1}']

    function nomeTabela(value: string): iDadosEmpresa;
    function getCampo(value: string): iDadosEmpresa;
    function getValor(value: string): iDadosEmpresa;
    function getDataInicial(value: TDate): iDadosEmpresa;
    function getDataFinal(value: TDate): iDadosEmpresa;
    function open(value: string): iDadosEmpresa;
    function pesquisar: iDadosEmpresa;
    function ExecSql: iDadosEmpresa;
    function sqlPesquisa: iDadosEmpresa;
    function sqlPesquisaData: iDadosEmpresa;
    function sqlPesquisaEstatica: iDadosEmpresa;

    function abrir: iDadosEmpresa;
    function inserir: iDadosEmpresa;
    function gravar: iDadosEmpresa;
    function deletar: iDadosEmpresa;
    function atualizar: iDadosEmpresa;
    function editar: iDadosEmpresa;
    function cancelar: iDadosEmpresa;
    function fecharQuery: iDadosEmpresa;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iDadosEmpresa;
    function ordenarGrid(column: TColumn): iDadosEmpresa;

    function getID(value: integer): iDadosEmpresa;
    function getNOME_FANTASIA(value: string): iDadosEmpresa;
    function getRAZAO_SOCIAL(value: string): iDadosEmpresa;
    function getCNPJ(value: string): iDadosEmpresa;
    function getINSCRICAO_ESTADUAL(value: string): iDadosEmpresa;
    function getEndereco(value: string): iDadosEmpresa;
    function getBairro(value: string): iDadosEmpresa;
    function getNumero(value: integer): iDadosEmpresa;
    function getComplemento(value: string): iDadosEmpresa;
    function getCep(value: string): iDadosEmpresa;
    function getCidade(value: string): iDadosEmpresa;
    function getEstado(value: string): iDadosEmpresa;
    function getTelefone(value: string): iDadosEmpresa;
    function getCelular(value: string): iDadosEmpresa;
    function getEmail(value: string): iDadosEmpresa;
    function getResponsavel(value: string): iDadosEmpresa;
    function getObservacao(value: string): iDadosEmpresa;

    function exportar: iDadosEmpresa;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iDadosEmpresa;
    function getNome(value: string): iDadosEmpresa;

  end;

  iPrepararRecibo = interface
    ['{95A568DB-04FF-491F-A5AC-D004EB9A1881}']

    function nomeTabela(value: string): iPrepararRecibo;
    function getCampo(value: string): iPrepararRecibo;
    function getValor(value: string): iPrepararRecibo;
    function getDataInicial(value: TDate): iPrepararRecibo;
    function getDataFinal(value: TDate): iPrepararRecibo;
    function open(value: string): iPrepararRecibo;
    function pesquisar: iPrepararRecibo;
    function ExecSql: iPrepararRecibo;
    function sqlPesquisa: iPrepararRecibo;
    function sqlPesquisaData: iPrepararRecibo;
    function sqlPesquisaEstatica: iPrepararRecibo;

    function abrir: iPrepararRecibo;
    function listarGrid(value: TDataSource): iPrepararRecibo;
    function ordenarGrid(column: TColumn): iPrepararRecibo;
    function atualizar: iPrepararRecibo;
    function exportar: iPrepararRecibo;
    function imprimirComprovante: iPrepararRecibo;

  end;

  iVenda = interface
    ['{B74B28A0-82AA-432A-A449-304A683425B2}']

    function nomeTabela(value: string): iVenda;
    function getCampo(value: string): iVenda;
    function getValor(value: string): iVenda;
    function getDataInicial(value: TDate): iVenda;
    function getDataFinal(value: TDate): iVenda;
    function open(value: string): iVenda;
    function pesquisar: iVenda;
    function ExecSql: iVenda;
    function sqlPesquisa: iVenda;
    function sqlPesquisaData: iVenda;
    function sqlPesquisaEstatica: iVenda;

    function abrir: iVenda;
    function inserir: iVenda;
    function gravar: iVenda;
    function deletar: iVenda;
    function atualizar: iVenda;
    function editar: iVenda;
    function cancelar: iVenda;
    function fecharQuery: iVenda;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iVenda;
    function ordenarGrid(column: TColumn): iVenda;

    function getID(value: integer): iVenda;
    function getID_CLIENTE(value: integer): iVenda;
    function getNOME_CLIENTE(value: string): iVenda;
    function getFuncionario(value: integer): iVenda;
    function getNOME_FUNCIONARIO(value: string): iVenda;
    function getDATA_VENDA(value: string): iVenda;
    function getHORA_VENDA(value: string): iVenda;
    function getSUBTOTAL(value: string): iVenda; overload;
    function getDesconto(value: string): iVenda; overload;
    function getACRESCIMO(value: string): iVenda; overload;
    function getTOTAL(value: string): iVenda; overload;
    function getQUANTIDADE_PARCELAS(value: integer): iVenda;
    function getVENCIMENTO(value: string): iVenda;
    function getFORMA_PAGAMENTO(value: string): iVenda;
    function getSTATUS(value: string): iVenda;
    function getOBSERACAO(value: string): iVenda;

    function getDesconto(value: TEdit): iVenda; overload;
    function getACRESCIMO(value: TEdit): iVenda; overload;
    function getSUBTOTAL(value: TEdit): iVenda; overload;
    function getTOTAL(value: TEdit): iVenda; overload;

    function EstornarVenda: iVenda;
    function calularDesconto: string;
    function calularAcrescimo: string;
    function contarTotalItens(value: TclientDataSet): integer;
    function somarItensDaVenda(value: TclientDataSet): Currency;
    function setNomeFuncionario: string;
    function setCodigoVenda: integer;

    function tipoDeVenda(value: string): iVenda;

    function exportar: iVenda;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iVenda;
    function getNome(value: string): iVenda;

  end;

  iItensVendas = interface
    ['{BC801838-71A5-404C-95C4-185E2BD5FEDD}']

    function nomeTabela(value: string): iItensVendas;
    function getCampo(value: string): iItensVendas;
    function getValor(value: string): iItensVendas;
    function getDataInicial(value: TDate): iItensVendas;
    function getDataFinal(value: TDate): iItensVendas;
    function open(value: string): iItensVendas;
    function pesquisar: iItensVendas;
    function ExecSql: iItensVendas;
    function sqlPesquisa: iItensVendas;
    function sqlPesquisaData: iItensVendas;
    function sqlPesquisaEstatica: iItensVendas;

    function abrir: iItensVendas;
    function inserir: iItensVendas;
    function gravar: iItensVendas;
    function deletar: iItensVendas;
    function atualizar: iItensVendas;
    function editar: iItensVendas;
    function cancelar: iItensVendas;
    function fecharQuery: iItensVendas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iItensVendas;
    function ordenarGrid(column: TColumn): iItensVendas;

    function getID(value: integer): iItensVendas;
    function getID_VENDA(value: integer): iItensVendas;
    function getID_CLIENTE(value: integer): iItensVendas;
    function getID_PRODUTO(value: integer): iItensVendas;
    function getProduto(value: string): iItensVendas;
    function getVALOR_UNITARIO(value: string): iItensVendas;
    function getQUANTIDADE(value: integer): iItensVendas;
    function getTOTAL(value: string): iItensVendas;

    function gravarItensDaVenda(value: TclientDataSet): iItensVendas;
    function decrementarEstoque(value: TclientDataSet): iItensVendas;

    function calularTotalXquantidade(qtdeProduto: TEdit;
      vlrProduto: TCurrencyEdit): Currency;

    function exportar: iItensVendas;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iItensVendas;
    function getNome(value: string): iItensVendas;

  end;

  iParcelasVendas = interface
    ['{CC1FC427-3E1C-41BF-B0C6-0AD372ABA68D}']

    function nomeTabela(value: string): iParcelasVendas;
    function getCampo(value: string): iParcelasVendas;
    function getValor(value: string): iParcelasVendas;
    function getDataInicial(value: TDate): iParcelasVendas;
    function getDataFinal(value: TDate): iParcelasVendas;
    function open(value: string): iParcelasVendas;
    function pesquisar: iParcelasVendas;
    function ExecSql: iParcelasVendas;
    function sqlPesquisa: iParcelasVendas;
    function sqlPesquisaData: iParcelasVendas;
    function sqlPesquisaEstatica: iParcelasVendas;

    function abrir: iParcelasVendas;
    function inserir: iParcelasVendas;
    function gravar: iParcelasVendas;
    function deletar: iParcelasVendas;
    function atualizar: iParcelasVendas;
    function editar: iParcelasVendas;
    function cancelar: iParcelasVendas;
    function fecharQuery: iParcelasVendas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iParcelasVendas;
    function ordenarGrid(column: TColumn): iParcelasVendas;

    function quitarParcelas: iParcelasVendas;
    function estornarParcela: iParcelasVendas;

    function getID(value: integer): iParcelasVendas;
    function getID_VENDA(value: integer): iParcelasVendas;
    function getID_CLIENTE(value: integer): iParcelasVendas;
    function getVALOR_VENDA(value: string): iParcelasVendas;
    function getQUANTIDADE_PARCELAS(value: integer): iParcelasVendas;
    function getPARCELA(value: integer): iParcelasVendas;
    function getVALOR_DA_PARCELA(value: string): iParcelasVendas;
    function getDATA_VENCIMENTO(value: string): iParcelasVendas;
    function getJuros(value: string): iParcelasVendas;
    function getMulta(value: string): iParcelasVendas;
    function getDesconto(value: string): iParcelasVendas; overload;
    function getTOTAL(value: string): iParcelasVendas;
    function getDATA_PAGAMENTO(value: string): iParcelasVendas;
    function getHORA_PAGAMENTO(value: string): iParcelasVendas;
    function getFUNCIONARIO_PGTO(value: integer): iParcelasVendas;
    function getFormaPagamento(value: string): iParcelasVendas;
    function getPAGO(value: string): iParcelasVendas;
    function getObservacao(value: string): iParcelasVendas;

    function getDesconto(value: TEdit): iParcelasVendas; overload;
    function getSUBTOTAL(value: TEdit): iParcelasVendas;
    function calcularTotal: string;
    function gerarParcelas: iParcelasVendas;
    function gerarParcelaAvista: iParcelasVendas;

    function exportar: iParcelasVendas;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iParcelasVendas;
    function getNome(value: string): iParcelasVendas;

  end;

  iLocalizarClienteVenda = interface
    ['{285B6157-B95E-46B4-9084-9D07D5F9BFC4}']

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

  end;

  iLocalizarProdutosVenda = interface
    ['{91274845-9750-427E-8569-194A19587DB8}']

    function nomeTabela(value: string): iLocalizarProdutosVenda;
    function getCampo(value: string): iLocalizarProdutosVenda;
    function getValor(value: string): iLocalizarProdutosVenda;
    function getDataInicial(value: TDate): iLocalizarProdutosVenda;
    function getDataFinal(value: TDate): iLocalizarProdutosVenda;
    function open(value: string): iLocalizarProdutosVenda;
    function pesquisar: iLocalizarProdutosVenda;
    function ExecSql: iLocalizarProdutosVenda;
    function sqlPesquisa: iLocalizarProdutosVenda;
    function sqlPesquisaData: iLocalizarProdutosVenda;
    function sqlPesquisaEstatica: iLocalizarProdutosVenda;
    function abrir: iLocalizarProdutosVenda;
    function listarGrid(value: TDataSource): iLocalizarProdutosVenda;
    function ordenarGrid(column: TColumn): iLocalizarProdutosVenda;

    function setCodigoDoProduto: integer;
    function setNomeDoProduto: string;
    function setQuantidade: integer;
    function setQuantidadeEmEstoque: integer;
    function setSituacaoDoEstoque: string;
    function setCodigoDeBarras: string;
    function setFotoProduto(value: TImage): iLocalizarProdutosVenda;
    function setValorUnitarioProduto: Currency;

  end;

  iNumeroParcelas = interface
    ['{CEA04445-CE41-4199-A3DA-214579087AB6}']

    function nomeTabela(value: string): iNumeroParcelas;
    function getCampo(value: string): iNumeroParcelas;
    function getValor(value: string): iNumeroParcelas;
    function getDataInicial(value: TDate): iNumeroParcelas;
    function getDataFinal(value: TDate): iNumeroParcelas;
    function open(value: string): iNumeroParcelas;
    function pesquisar: iNumeroParcelas;
    function ExecSql: iNumeroParcelas;
    function sqlPesquisa: iNumeroParcelas;
    function sqlPesquisaData: iNumeroParcelas;
    function sqlPesquisaEstatica: iNumeroParcelas;

    function abrir: iNumeroParcelas;
    function inserir: iNumeroParcelas;
    function gravar: iNumeroParcelas;
    function deletar: iNumeroParcelas;
    function atualizar: iNumeroParcelas;
    function editar: iNumeroParcelas;
    function cancelar: iNumeroParcelas;
    function fecharQuery: iNumeroParcelas;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iNumeroParcelas;
    function ordenarGrid(column: TColumn): iNumeroParcelas;

    function getID(value: integer): iNumeroParcelas;
    function getNUM_PARCELAS(value: integer): iNumeroParcelas;
    function getJuros(value: real): iNumeroParcelas;
    function getAPLICAR_NA_OS(value: string): iNumeroParcelas;

    function exportar: iNumeroParcelas;
    procedure validarData(componet: tmaskEdit);

    function getCodigo(value: integer): iNumeroParcelas;
    function getNome(value: string): iNumeroParcelas;

  end;

  iCalcularParcelas = interface
    ['{A036FFF1-4FC1-4314-935E-7FE13D5679C1}']

    function getValor(value: Currency): iCalcularParcelas;
    function getNumeroParcelas(value: integer): iCalcularParcelas;
    function valorDeCadaParcela: Currency;

  end;

  iImprimirRecibo = interface
    ['{509FF26E-6DFB-4777-94EA-692A31BFC7AB}']

    function selecionarVenda(value: integer): iImprimirRecibo;
    function selecionarItens(value: integer): iImprimirRecibo;
    function retornarDataSet(value: TDataSource): iImprimirRecibo;
    function retornarDataSetItens(value: TDataSource): iImprimirRecibo;

  end;

  iImprimirParcelasVendas = interface
    ['{EBFFAFC1-AF2A-434D-9924-87827781070B}']
    function selecionarParcelas(value: integer): iImprimirParcelasVendas;
    function retornarDataSet(value: TDataSource): iImprimirParcelasVendas;
    function retonarJurosMultaAtraso(value: TDataSource)
      : iImprimirParcelasVendas;
  end;

  iQuitarParcelasVenda = interface
    ['{5C28595F-A461-47C3-A232-2281DF846BE8}']

    function nomeTabela(value: string): iQuitarParcelasVenda;
    function getCampo(value: string): iQuitarParcelasVenda;
    function getValor(value: string): iQuitarParcelasVenda;
    function getDataInicial(value: TDate): iQuitarParcelasVenda;
    function getDataFinal(value: TDate): iQuitarParcelasVenda;
    function open(value: string): iQuitarParcelasVenda;
    function pesquisar: iQuitarParcelasVenda;
    function ExecSql: iQuitarParcelasVenda;
    function sqlPesquisa: iQuitarParcelasVenda;
    function sqlPesquisaData: iQuitarParcelasVenda;
    function sqlPesquisaEstatica: iQuitarParcelasVenda;

    function abrir: iQuitarParcelasVenda;
    function atualizar: iQuitarParcelasVenda;
    function fecharQuery: iQuitarParcelasVenda;
    function listarGrid(value: TDataSource): iQuitarParcelasVenda;
    function ordenarGrid(column: TColumn): iQuitarParcelasVenda;

    function selecionarParcelaQuitar(value: integer): iQuitarParcelasVenda;
    function getCodigoParcela(value: integer): iQuitarParcelasVenda;
    function getDesconto(value: string): iQuitarParcelasVenda;
    function getJuros(value: string): iQuitarParcelasVenda;
    function getDataPagamento(value: string): iQuitarParcelasVenda;
    function getTOTAL(value: string): iQuitarParcelasVenda;
    function getFormaPagamento(value: string): iQuitarParcelasVenda;
    function quitarParcela: iQuitarParcelasVenda;
    function estornarParcela(value: integer): iQuitarParcelasVenda;

    function prepararAdicionarParcela: iQuitarParcelasVenda;
    function getID_VENDA(value: integer): iQuitarParcelasVenda;
    function getID_CLIENTE(value: integer): iQuitarParcelasVenda;
    function getVALOR_VENDA(value: string): iQuitarParcelasVenda;
    function getQUANTIDADE_PARCELAS(value: integer): iQuitarParcelasVenda;
    function getPARCELA(value: integer): iQuitarParcelasVenda;
    function getVALOR_DA_PARCELA(value: string): iQuitarParcelasVenda;
    function getDATA_VENCIMENTO(value: string): iQuitarParcelasVenda;

    function excluirParcela(value: integer): iQuitarParcelasVenda;

    function tableQuery: TFDQuery;

    function CalcularJuros: string;
    function retornarTotalDeParcelas(value: integer): integer;

    function setJuros(value: TCurrencyEdit): iQuitarParcelasVenda;
    function setMulta(value: TCurrencyEdit): iQuitarParcelasVenda;

    function exportar: iQuitarParcelasVenda;
    procedure validarData(componet: tmaskEdit);

  end;

  iQuitarParcelaOS = interface
    ['{FF7DF130-C2CE-4859-B74D-39FE72FCC2D2}']

    function nomeTabela(value: string): iQuitarParcelaOS;
    function getCampo(value: string): iQuitarParcelaOS;
    function getValor(value: string): iQuitarParcelaOS;
    function getDataInicial(value: TDate): iQuitarParcelaOS;
    function getDataFinal(value: TDate): iQuitarParcelaOS;
    function open(value: string): iQuitarParcelaOS;
    function pesquisar: iQuitarParcelaOS;
    function ExecSql: iQuitarParcelaOS;
    function sqlPesquisa: iQuitarParcelaOS;
    function sqlPesquisaData: iQuitarParcelaOS;
    function sqlPesquisaEstatica: iQuitarParcelaOS;

    function abrir: iQuitarParcelaOS;
    function atualizar: iQuitarParcelaOS;
    function fecharQuery: iQuitarParcelaOS;
    function listarGrid(value: TDataSource): iQuitarParcelaOS;
    function ordenarGrid(column: TColumn): iQuitarParcelaOS;

    function CalularPagamento: iQuitarParcelaOS;
    function setTotalParcela(value: TCurrencyEdit): iQuitarParcelaOS;
    function setTotalJurosParcela(value: TCurrencyEdit): iQuitarParcelaOS;
    function setTotalMultaParcela(value: TCurrencyEdit): iQuitarParcelaOS;

    function getDesconto(value: string): iQuitarParcelaOS;
    function getJuros(value: string): iQuitarParcelaOS;
    function getMulta(value: string): iQuitarParcelaOS;
    function getVALOR_TOTAL(value: string): iQuitarParcelaOS;
    function getDATA_PAGAMENTO(value: string): iQuitarParcelaOS;
    function getHORA_PAGAMENTO(value: string): iQuitarParcelaOS;
    function getFORMA_PAGAMENTO(value: string): iQuitarParcelaOS;
    function getPGTO(value: string): iQuitarParcelaOS;

    function selecionarParcelaQuitar(value: integer): iQuitarParcelaOS;
    function estornarParcela(value: integer): iQuitarParcelaOS;

    function adicionarParcela: iQuitarParcelaOS;
    function getValorParcela(value: string): iQuitarParcelaOS;
    function getDataVencimento(value: string): iQuitarParcelaOS;

    function excluir(value: integer): iQuitarParcelaOS;

    function exportar: iQuitarParcelaOS;
    function validarData(componet: tmaskEdit): iQuitarParcelaOS;

  end;

  iVisualizarVenda = interface
    ['{CB3E53B7-428F-4694-BECE-BEBB8FA5A8C5}']

    function nomeTabela(value: string): iVisualizarVenda;
    function getCampo(value: string): iVisualizarVenda;
    function getValor(value: string): iVisualizarVenda;
    function getDataInicial(value: TDate): iVisualizarVenda;
    function getDataFinal(value: TDate): iVisualizarVenda;
    function open(value: string): iVisualizarVenda;
    function pesquisar: iVisualizarVenda;
    function ExecSql: iVisualizarVenda;
    function sqlPesquisa: iVisualizarVenda;
    function sqlPesquisaData: iVisualizarVenda;
    function sqlPesquisaEstatica: iVisualizarVenda;

    function abrir: iVisualizarVenda;
    function atualizar: iVisualizarVenda;
    function fecharQuery: iVisualizarVenda;
    function listarGrid(value: TDataSource): iVisualizarVenda;
    function listarGridItens(value: TDataSource): iVisualizarVenda;
    function EstornarVenda(value: integer): iVisualizarVenda;
    function selecionarItens(value: integer): iVisualizarVenda;
    function ordenarGrid(column: TColumn): iVisualizarVenda;

    function deletarVenda: iVisualizarVenda;
    function atualizarItens: iVisualizarVenda;

    function exportar: iVisualizarVenda;
    function exportarItens: iVisualizarVenda;

  end;

  iRelatorioClientes = interface
    ['{A677F144-88A5-4789-982E-01717DC43983}']

    function nomeTabela(value: string): iRelatorioClientes;
    function getCampo(value: string): iRelatorioClientes;
    function getValor(value: string): iRelatorioClientes;
    function getDataInicial(value: TDate): iRelatorioClientes;
    function getDataFinal(value: TDate): iRelatorioClientes;
    function open(value: string): iRelatorioClientes;
    function pesquisar: iRelatorioClientes;
    function ExecSql: iRelatorioClientes;
    function sqlPesquisa: iRelatorioClientes;
    function sqlPesquisaData: iRelatorioClientes;
    function sqlPesquisaEstatica: iRelatorioClientes;

    function abrir: iRelatorioClientes;
    function atualizar: iRelatorioClientes;
    function cancelar: iRelatorioClientes;
    function fecharQuery: iRelatorioClientes;
    function listarGrid(value: TDataSource): iRelatorioClientes;
    function ordenarGrid(column: TColumn): iRelatorioClientes;

    function exportar: iRelatorioClientes;
    procedure validarData(componet: tmaskEdit);

  end;

  iHistoricoOSClientes = interface
    ['{436B046C-8744-4C4F-9656-EF346D5A8326}']

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
    function exportarListaServicos: iHistoricoOSClientes;
    procedure validarData(componet: tmaskEdit);

  end;

  iRelatorioContasAReceber = interface
    ['{97696D2D-A3F5-45E6-93FF-AE871DE3DCAC}']

    function nomeTabela(value: string): iRelatorioContasAReceber;
    function getCampo(value: string): iRelatorioContasAReceber;
    function getValor(value: string): iRelatorioContasAReceber;
    function getDataInicial(value: TDate): iRelatorioContasAReceber;
    function getDataFinal(value: TDate): iRelatorioContasAReceber;
    function open(value: string): iRelatorioContasAReceber;
    function pesquisar: iRelatorioContasAReceber;
    function ExecSql: iRelatorioContasAReceber;
    function sqlPesquisa: iRelatorioContasAReceber;
    function sqlPesquisaData: iRelatorioContasAReceber;
    function sqlPesquisaEstatica: iRelatorioContasAReceber;
    function SelectSql(value: string): iRelatorioContasAReceber;

    function abrir: iRelatorioContasAReceber;
    function atualizar: iRelatorioContasAReceber;
    function cancelar: iRelatorioContasAReceber;
    function fecharQuery: iRelatorioContasAReceber;
    function listarGrid(value: TDataSource): iRelatorioContasAReceber;
    function ordenarGrid(column: TColumn): iRelatorioContasAReceber;

    function exportar: iRelatorioContasAReceber;
    procedure validarData(componet: tmaskEdit);

  end;

  iRelatorioContasAReceberVendas = interface
    ['{D300D30D-CE55-40F8-82ED-06461DD244CB}']

    function nomeTabela(value: string): iRelatorioContasAReceberVendas;
    function getCampo(value: string): iRelatorioContasAReceberVendas;
    function getValor(value: string): iRelatorioContasAReceberVendas;
    function getDataInicial(value: TDate): iRelatorioContasAReceberVendas;
    function getDataFinal(value: TDate): iRelatorioContasAReceberVendas;
    function open(value: string): iRelatorioContasAReceberVendas;
    function pesquisar: iRelatorioContasAReceberVendas;
    function ExecSql: iRelatorioContasAReceberVendas;
    function sqlPesquisa: iRelatorioContasAReceberVendas;
    function sqlPesquisaData: iRelatorioContasAReceberVendas;
    function sqlPesquisaEstatica: iRelatorioContasAReceberVendas;

    function abrir: iRelatorioContasAReceberVendas;
    function atualizar: iRelatorioContasAReceberVendas;
    function cancelar: iRelatorioContasAReceberVendas;
    function fecharQuery: iRelatorioContasAReceberVendas;
    function listarGrid(value: TDataSource): iRelatorioContasAReceberVendas;
    function ordenarGrid(column: TColumn): iRelatorioContasAReceberVendas;

    function exportar: iRelatorioContasAReceberVendas;
    function validarData(componet: tmaskEdit): iRelatorioContasAReceberVendas;

  end;

  iRelatorioParcelasPagasOS = interface
    ['{16F8F476-13E9-4BDB-BDB8-A600B0937C02}']

    function nomeTabela(value: string): iRelatorioParcelasPagasOS;
    function getCampo(value: string): iRelatorioParcelasPagasOS;
    function getValor(value: string): iRelatorioParcelasPagasOS;
    function getDataInicial(value: TDate): iRelatorioParcelasPagasOS;
    function getDataFinal(value: TDate): iRelatorioParcelasPagasOS;
    function open(value: string): iRelatorioParcelasPagasOS;
    function pesquisar: iRelatorioParcelasPagasOS;
    function ExecSql: iRelatorioParcelasPagasOS;
    function sqlPesquisa: iRelatorioParcelasPagasOS;
    function sqlPesquisaData: iRelatorioParcelasPagasOS;
    function sqlPesquisaEstatica: iRelatorioParcelasPagasOS;

    function abrir: iRelatorioParcelasPagasOS;
    function atualizar: iRelatorioParcelasPagasOS;
    function cancelar: iRelatorioParcelasPagasOS;
    function fecharQuery: iRelatorioParcelasPagasOS;
    function listarGrid(value: TDataSource): iRelatorioParcelasPagasOS;
    function ordenarGrid(column: TColumn): iRelatorioParcelasPagasOS;

    function exportar: iRelatorioParcelasPagasOS;
    function validarData(componet: tmaskEdit): iRelatorioParcelasPagasOS;

  end;

  iRelatorioParcelasPagasVendas = interface
    ['{E9B244F2-1181-4534-BAC0-DEF5F6369C8B}']

    function nomeTabela(value: string): iRelatorioParcelasPagasVendas;
    function getCampo(value: string): iRelatorioParcelasPagasVendas;
    function getValor(value: string): iRelatorioParcelasPagasVendas;
    function getDataInicial(value: TDate): iRelatorioParcelasPagasVendas;
    function getDataFinal(value: TDate): iRelatorioParcelasPagasVendas;
    function open(value: string): iRelatorioParcelasPagasVendas;
    function pesquisar: iRelatorioParcelasPagasVendas;
    function ExecSql: iRelatorioParcelasPagasVendas;
    function sqlPesquisa: iRelatorioParcelasPagasVendas;
    function sqlPesquisaData: iRelatorioParcelasPagasVendas;
    function sqlPesquisaEstatica: iRelatorioParcelasPagasVendas;

    function abrir: iRelatorioParcelasPagasVendas;
    function atualizar: iRelatorioParcelasPagasVendas;
    function cancelar: iRelatorioParcelasPagasVendas;
    function fecharQuery: iRelatorioParcelasPagasVendas;
    function listarGrid(value: TDataSource): iRelatorioParcelasPagasVendas;
    function ordenarGrid(column: TColumn): iRelatorioParcelasPagasVendas;

    function exportar: iRelatorioParcelasPagasVendas;
    function validarData(componet: tmaskEdit): iRelatorioParcelasPagasVendas;

  end;

  iRelatorioOSEstornadas = interface
    ['{22FF9BDB-3BF3-4251-AA24-8A0D439B4AA4}']

    function nomeTabela(value: string): iRelatorioOSEstornadas;
    function getCampo(value: string): iRelatorioOSEstornadas;
    function getValor(value: string): iRelatorioOSEstornadas;
    function getDataInicial(value: TDate): iRelatorioOSEstornadas;
    function getDataFinal(value: TDate): iRelatorioOSEstornadas;
    function open(value: string): iRelatorioOSEstornadas;
    function pesquisar: iRelatorioOSEstornadas;
    function ExecSql: iRelatorioOSEstornadas;
    function sqlPesquisa: iRelatorioOSEstornadas;
    function sqlPesquisaData: iRelatorioOSEstornadas;
    function sqlPesquisaEstatica: iRelatorioOSEstornadas;

    function abrir: iRelatorioOSEstornadas;
    function atualizar: iRelatorioOSEstornadas;
    function cancelar: iRelatorioOSEstornadas;
    function fecharQuery: iRelatorioOSEstornadas;
    function listarGrid(value: TDataSource): iRelatorioOSEstornadas;
    function ordenarGrid(column: TColumn): iRelatorioOSEstornadas;

    function exportar: iRelatorioOSEstornadas;
    function validarData(componet: tmaskEdit): iRelatorioOSEstornadas;

  end;

  iRelatorioVendasEstornadas = interface
    ['{F6065D90-5299-43D1-802A-D23162338457}']

    function nomeTabela(value: string): iRelatorioVendasEstornadas;
    function getCampo(value: string): iRelatorioVendasEstornadas;
    function getValor(value: string): iRelatorioVendasEstornadas;
    function getDataInicial(value: TDate): iRelatorioVendasEstornadas;
    function getDataFinal(value: TDate): iRelatorioVendasEstornadas;
    function open(value: string): iRelatorioVendasEstornadas;
    function pesquisar: iRelatorioVendasEstornadas;
    function ExecSql: iRelatorioVendasEstornadas;
    function sqlPesquisa: iRelatorioVendasEstornadas;
    function sqlPesquisaData: iRelatorioVendasEstornadas;
    function sqlPesquisaEstatica: iRelatorioVendasEstornadas;

    function abrir: iRelatorioVendasEstornadas;
    function atualizar: iRelatorioVendasEstornadas;
    function cancelar: iRelatorioVendasEstornadas;
    function fecharQuery: iRelatorioVendasEstornadas;
    function listarGrid(value: TDataSource): iRelatorioVendasEstornadas;
    function ordenarGrid(column: TColumn): iRelatorioVendasEstornadas;

    function exportar: iRelatorioVendasEstornadas;
    function validarData(componet: tmaskEdit): iRelatorioVendasEstornadas;

  end;

  iRelatorioContasAPagar = interface
    ['{FDF62F55-9C62-4FB7-8B91-2043AC166F66}']

    function nomeTabela(value: string): iRelatorioContasAPagar;
    function getCampo(value: string): iRelatorioContasAPagar;
    function getValor(value: string): iRelatorioContasAPagar;
    function getDataInicial(value: TDate): iRelatorioContasAPagar;
    function getDataFinal(value: TDate): iRelatorioContasAPagar;
    function open(value: string): iRelatorioContasAPagar;
    function pesquisar: iRelatorioContasAPagar;
    function ExecSql: iRelatorioContasAPagar;
    function sqlPesquisa: iRelatorioContasAPagar;
    function sqlPesquisaData: iRelatorioContasAPagar;
    function sqlPesquisaEstatica: iRelatorioContasAPagar;

    function abrir: iRelatorioContasAPagar;
    function atualizar: iRelatorioContasAPagar;
    function cancelar: iRelatorioContasAPagar;
    function fecharQuery: iRelatorioContasAPagar;
    function listarGrid(value: TDataSource): iRelatorioContasAPagar;
    function ordenarGrid(column: TColumn): iRelatorioContasAPagar;

    function selecionarContasPagas: iRelatorioContasAPagar;
    function selecionarContasAVencer: iRelatorioContasAPagar;
    function selecionarContasAtrasadas: iRelatorioContasAPagar;

    function exportar: iRelatorioContasAPagar;
    function validarData(componet: tmaskEdit): iRelatorioContasAPagar;

  end;

  iRelatorioReparosPorPeriodo = interface
    ['{3ABA49B3-AD28-48BA-B417-E2A75C03B0D2}']

    function nomeTabela(value: string): iRelatorioReparosPorPeriodo;
    function getCampo(value: string): iRelatorioReparosPorPeriodo;
    function getValor(value: string): iRelatorioReparosPorPeriodo;
    function getDataInicial(value: TDate): iRelatorioReparosPorPeriodo;
    function getDataFinal(value: TDate): iRelatorioReparosPorPeriodo;
    function open(value: string): iRelatorioReparosPorPeriodo;
    function pesquisar: iRelatorioReparosPorPeriodo;
    function ExecSql: iRelatorioReparosPorPeriodo;
    function sqlPesquisa: iRelatorioReparosPorPeriodo;
    function sqlPesquisaData: iRelatorioReparosPorPeriodo;
    function sqlPesquisaEstatica: iRelatorioReparosPorPeriodo;

    function abrir: iRelatorioReparosPorPeriodo;
    function atualizar: iRelatorioReparosPorPeriodo;
    function cancelar: iRelatorioReparosPorPeriodo;
    function fecharQuery: iRelatorioReparosPorPeriodo;
    function listarGrid(value: TDataSource): iRelatorioReparosPorPeriodo;
    function ordenarGrid(column: TColumn): iRelatorioReparosPorPeriodo;

    function exportar: iRelatorioReparosPorPeriodo;
    function validarData(componet: tmaskEdit): iRelatorioReparosPorPeriodo;

  end;

  iRelatorioOSPorTecnico = interface
    ['{F3736618-7312-4686-B69B-874835896A4B}']

    function nomeTabela(value: string): iRelatorioOSPorTecnico;
    function getCampo(value: string): iRelatorioOSPorTecnico;
    function getValor(value: string): iRelatorioOSPorTecnico;
    function getDataInicial(value: TDate): iRelatorioOSPorTecnico;
    function getDataFinal(value: TDate): iRelatorioOSPorTecnico;
    function open(value: string): iRelatorioOSPorTecnico;
    function pesquisar: iRelatorioOSPorTecnico;
    function ExecSql: iRelatorioOSPorTecnico;
    function sqlPesquisa: iRelatorioOSPorTecnico;
    function sqlPesquisaData: iRelatorioOSPorTecnico;
    function sqlPesquisaEstatica: iRelatorioOSPorTecnico;

    function abrir: iRelatorioOSPorTecnico;
    function atualizar: iRelatorioOSPorTecnico;
    function cancelar: iRelatorioOSPorTecnico;
    function fecharQuery: iRelatorioOSPorTecnico;
    function listarGrid(value: TDataSource): iRelatorioOSPorTecnico;
    function ordenarGrid(column: TColumn): iRelatorioOSPorTecnico;

    function exportar: iRelatorioOSPorTecnico;
    function validarData(componet: tmaskEdit): iRelatorioOSPorTecnico;

  end;

  iRelatorioOSPorSituacao = interface
    ['{EF3A639A-81E4-4509-971B-97E304327F82}']

    function nomeTabela(value: string): iRelatorioOSPorSituacao;
    function getCampo(value: string): iRelatorioOSPorSituacao;
    function getValor(value: string): iRelatorioOSPorSituacao;
    function getDataInicial(value: TDate): iRelatorioOSPorSituacao;
    function getDataFinal(value: TDate): iRelatorioOSPorSituacao;
    function open(value: string): iRelatorioOSPorSituacao;
    function pesquisar: iRelatorioOSPorSituacao;
    function ExecSql: iRelatorioOSPorSituacao;
    function sqlPesquisa: iRelatorioOSPorSituacao;
    function sqlPesquisaData: iRelatorioOSPorSituacao;
    function sqlPesquisaEstatica: iRelatorioOSPorSituacao;

    function abrir: iRelatorioOSPorSituacao;
    function atualizar: iRelatorioOSPorSituacao;
    function cancelar: iRelatorioOSPorSituacao;
    function fecharQuery: iRelatorioOSPorSituacao;
    function listarGrid(value: TDataSource): iRelatorioOSPorSituacao;
    function ordenarGrid(column: TColumn): iRelatorioOSPorSituacao;

    function getSituacao(value: string): iRelatorioOSPorSituacao;
    function selecionarOSPorSituacaoECampo: iRelatorioOSPorSituacao;

    function exportar: iRelatorioOSPorSituacao;
    function validarData(componet: tmaskEdit): iRelatorioOSPorSituacao;

  end;

  iRelatorioOS = interface
    ['{4D3BFC89-027B-4590-93A1-A3EFE19850BB}']

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

    function getSituacao(value: string): iRelatorioOS;
    function selecionarOSPorSituacaoECampo: iRelatorioOS;
    function exportarServicos: iRelatorioOS;

    function listarGridServicos(value: TDataSource): iRelatorioOS;
    function listarGridOcorrencia(value: TDataSource): iRelatorioOS;

    function limparGridServicos(value: TDataSource): iRelatorioOS;

    function exportar: iRelatorioOS;
    function validarData(componet: tmaskEdit): iRelatorioOS;

  end;

  iRelatoriOSServicosRealiados = interface
    ['{240AB3F8-4704-4DBF-B371-98C7DA44251B}']

    function nomeTabela(value: string): iRelatoriOSServicosRealiados;
    function getCampo(value: string): iRelatoriOSServicosRealiados;
    function getValor(value: string): iRelatoriOSServicosRealiados;
    function getDataInicial(value: TDate): iRelatoriOSServicosRealiados;
    function getDataFinal(value: TDate): iRelatoriOSServicosRealiados;
    function open(value: string): iRelatoriOSServicosRealiados;
    function pesquisar: iRelatoriOSServicosRealiados;
    function ExecSql: iRelatoriOSServicosRealiados;
    function sqlPesquisa: iRelatoriOSServicosRealiados;
    function sqlPesquisaData: iRelatoriOSServicosRealiados;
    function sqlPesquisaEstatica: iRelatoriOSServicosRealiados;

    function abrir: iRelatoriOSServicosRealiados;
    function atualizar: iRelatoriOSServicosRealiados;
    function cancelar: iRelatoriOSServicosRealiados;
    function fecharQuery: iRelatoriOSServicosRealiados;
    function listarGrid(value: TDataSource): iRelatoriOSServicosRealiados;
    function ordenarGrid(column: TColumn): iRelatoriOSServicosRealiados;

    function exportar: iRelatoriOSServicosRealiados;
    function validarData(componet: tmaskEdit): iRelatoriOSServicosRealiados;

  end;

  iRelatorioOSOcorrencias = interface
    ['{000F9F39-29E0-437B-9330-7E643CE63C60}']
  end;

  iRelatorioFornecedores = interface
    ['{0058CC2E-BF3D-4E9A-9920-80E80B477465}']

    function nomeTabela(value: string): iRelatorioFornecedores;
    function getCampo(value: string): iRelatorioFornecedores;
    function getValor(value: string): iRelatorioFornecedores;
    function getDataInicial(value: TDate): iRelatorioFornecedores;
    function getDataFinal(value: TDate): iRelatorioFornecedores;
    function open(value: string): iRelatorioFornecedores;
    function pesquisar: iRelatorioFornecedores;
    function ExecSql: iRelatorioFornecedores;
    function sqlPesquisa: iRelatorioFornecedores;
    function sqlPesquisaData: iRelatorioFornecedores;
    function sqlPesquisaEstatica: iRelatorioFornecedores;

    function abrir: iRelatorioFornecedores;
    function atualizar: iRelatorioFornecedores;
    function cancelar: iRelatorioFornecedores;
    function fecharQuery: iRelatorioFornecedores;
    function listarGrid(value: TDataSource): iRelatorioFornecedores;
    function ordenarGrid(column: TColumn): iRelatorioFornecedores;

    function exportar: iRelatorioFornecedores;
    function validarData(componet: tmaskEdit): iRelatorioFornecedores;

  end;

  iRelatorioOSInadimpelentes = interface
    ['{075ECF30-3150-4B39-BC0A-B062F3197F33}']

    function nomeTabela(value: string): iRelatorioOSInadimpelentes;
    function getCampo(value: string): iRelatorioOSInadimpelentes;
    function getValor(value: string): iRelatorioOSInadimpelentes;
    function getDataInicial(value: TDate): iRelatorioOSInadimpelentes;
    function getDataFinal(value: TDate): iRelatorioOSInadimpelentes;
    function open(value: string): iRelatorioOSInadimpelentes;
    function pesquisar: iRelatorioOSInadimpelentes;
    function ExecSql: iRelatorioOSInadimpelentes;
    function sqlPesquisa: iRelatorioOSInadimpelentes;
    function sqlPesquisaData: iRelatorioOSInadimpelentes;
    function sqlPesquisaEstatica: iRelatorioOSInadimpelentes;

    function abrir: iRelatorioOSInadimpelentes;
    function atualizar: iRelatorioOSInadimpelentes;
    function cancelar: iRelatorioOSInadimpelentes;
    function fecharQuery: iRelatorioOSInadimpelentes;
    function listarGrid(value: TDataSource): iRelatorioOSInadimpelentes;
    function ordenarGrid(column: TColumn): iRelatorioOSInadimpelentes;

    function retornarPesquisaInadimplentes(value: string)
      : iRelatorioOSInadimpelentes; overload;
    function retornarPesquisaInadimplentes(data1, data2: string)
      : iRelatorioOSInadimpelentes; overload;

    function exportar: iRelatorioOSInadimpelentes;
    function validarData(componet: tmaskEdit): iRelatorioOSInadimpelentes;

  end;

  iRelatorioDeProdutos = interface
    ['{1C3DCF97-03AC-472B-945B-590B0561C6D7}']

    function nomeTabela(value: string): iRelatorioDeProdutos;
    function getCampo(value: string): iRelatorioDeProdutos;
    function getValor(value: string): iRelatorioDeProdutos;
    function getDataInicial(value: TDate): iRelatorioDeProdutos;
    function getDataFinal(value: TDate): iRelatorioDeProdutos;
    function open(value: string): iRelatorioDeProdutos;
    function pesquisar: iRelatorioDeProdutos;
    function ExecSql: iRelatorioDeProdutos;
    function sqlPesquisa: iRelatorioDeProdutos;
    function sqlPesquisaData: iRelatorioDeProdutos;
    function sqlPesquisaEstatica: iRelatorioDeProdutos;

    function abrir: iRelatorioDeProdutos;
    function atualizar: iRelatorioDeProdutos;
    function cancelar: iRelatorioDeProdutos;
    function fecharQuery: iRelatorioDeProdutos;
    function listarGrid(value: TDataSource): iRelatorioDeProdutos;
    function ordenarGrid(column: TColumn): iRelatorioDeProdutos;

    function exportar: iRelatorioDeProdutos;
    function validarData(componet: tmaskEdit): iRelatorioDeProdutos;

  end;

  iRelatorioSituacaoEstoque = interface
    ['{E2092ACC-CBCB-4E53-9D41-03DE090D071E}']

    function nomeTabela(value: string): iRelatorioSituacaoEstoque;
    function getCampo(value: string): iRelatorioSituacaoEstoque;
    function getValor(value: string): iRelatorioSituacaoEstoque;
    function getDataInicial(value: TDate): iRelatorioSituacaoEstoque;
    function getDataFinal(value: TDate): iRelatorioSituacaoEstoque;
    function open(value: string): iRelatorioSituacaoEstoque;
    function pesquisar: iRelatorioSituacaoEstoque;
    function ExecSql: iRelatorioSituacaoEstoque;
    function sqlPesquisa: iRelatorioSituacaoEstoque;
    function sqlPesquisaData: iRelatorioSituacaoEstoque;
    function sqlPesquisaEstatica: iRelatorioSituacaoEstoque;

    function abrir: iRelatorioSituacaoEstoque;
    function atualizar: iRelatorioSituacaoEstoque;
    function cancelar: iRelatorioSituacaoEstoque;
    function fecharQuery: iRelatorioSituacaoEstoque;
    function listarGrid(value: TDataSource): iRelatorioSituacaoEstoque;
    function ordenarGrid(column: TColumn): iRelatorioSituacaoEstoque;

    function selecionarEStoqueAtencao: iRelatorioSituacaoEstoque;
    function selecionarEStoqueBaixo: iRelatorioSituacaoEstoque;
    function selecionarEStoqueNorma: iRelatorioSituacaoEstoque;
    function selecionarEStoqueTodos: iRelatorioSituacaoEstoque;

    function exportar: iRelatorioSituacaoEstoque;
    function validarData(componet: tmaskEdit): iRelatorioSituacaoEstoque;

  end;

  iRealatorioProdutosMaisVendidos = interface
    ['{9C7E1813-0430-4D24-B010-27E1B767FE3C}']

    function nomeTabela(value: string): iRealatorioProdutosMaisVendidos;
    function getCampo(value: string): iRealatorioProdutosMaisVendidos;
    function getValor(value: string): iRealatorioProdutosMaisVendidos;
    function getDataInicial(value: TDate): iRealatorioProdutosMaisVendidos;
    function getDataFinal(value: TDate): iRealatorioProdutosMaisVendidos;
    function open(value: string): iRealatorioProdutosMaisVendidos;
    function pesquisar: iRealatorioProdutosMaisVendidos;
    function ExecSql: iRealatorioProdutosMaisVendidos;
    function sqlPesquisa: iRealatorioProdutosMaisVendidos;
    function sqlPesquisaData: iRealatorioProdutosMaisVendidos;
    function sqlPesquisaEstatica: iRealatorioProdutosMaisVendidos;

    function abrir: iRealatorioProdutosMaisVendidos;
    function atualizar: iRealatorioProdutosMaisVendidos;
    function cancelar: iRealatorioProdutosMaisVendidos;
    function fecharQuery: iRealatorioProdutosMaisVendidos;
    function listarGrid(value: TDataSource): iRealatorioProdutosMaisVendidos;
    function ordenarGrid(column: TColumn): iRealatorioProdutosMaisVendidos;

    function produtosMaisVendidos: iRealatorioProdutosMaisVendidos;
    function produtosMenosVendidos: iRealatorioProdutosMaisVendidos;

    function exportar: iRealatorioProdutosMaisVendidos;
    function validarData(componet: tmaskEdit): iRealatorioProdutosMaisVendidos;

  end;

  iRelatorioVendas = interface
    ['{1DF1BE36-1138-4F2B-8244-74EAC6DDE96B}']

    function nomeTabela(value: string): iRelatorioVendas;
    function getCampo(value: string): iRelatorioVendas;
    function getValor(value: string): iRelatorioVendas;
    function getDataInicial(value: TDate): iRelatorioVendas;
    function getDataFinal(value: TDate): iRelatorioVendas;
    function open(value: string): iRelatorioVendas;
    function pesquisar: iRelatorioVendas;
    function ExecSql: iRelatorioVendas;
    function sqlPesquisa: iRelatorioVendas;
    function sqlPesquisaData: iRelatorioVendas;
    function sqlPesquisaEstatica: iRelatorioVendas;

    function abrir: iRelatorioVendas;
    function atualizar: iRelatorioVendas;
    function cancelar: iRelatorioVendas;
    function fecharQuery: iRelatorioVendas;
    function listarGrid(value: TDataSource): iRelatorioVendas;
    function ordenarGrid(column: TColumn): iRelatorioVendas;

    function selecionarItensVenda(value: integer): iRelatorioVendas;
    function listarItens(value: TDataSource): iRelatorioVendas;
    function exportarItens: iRelatorioVendas;

    function exportar: iRelatorioVendas;
    function validarData(componet: tmaskEdit): iRelatorioVendas;

  end;

  iRelatorioVendaInadimplentes = interface
    ['{F517DC9B-C860-4148-9DBD-BE1A215B17DB}']

    function nomeTabela(value: string): iRelatorioVendaInadimplentes;
    function getCampo(value: string): iRelatorioVendaInadimplentes;
    function getValor(value: string): iRelatorioVendaInadimplentes;
    function getDataInicial(value: TDate): iRelatorioVendaInadimplentes;
    function getDataFinal(value: TDate): iRelatorioVendaInadimplentes;
    function open(value: string): iRelatorioVendaInadimplentes;
    function pesquisar: iRelatorioVendaInadimplentes;
    function ExecSql: iRelatorioVendaInadimplentes;
    function sqlPesquisa: iRelatorioVendaInadimplentes;
    function sqlPesquisaData: iRelatorioVendaInadimplentes;
    function sqlPesquisaEstatica: iRelatorioVendaInadimplentes;

    function abrir: iRelatorioVendaInadimplentes;
    function atualizar: iRelatorioVendaInadimplentes;
    function cancelar: iRelatorioVendaInadimplentes;
    function fecharQuery: iRelatorioVendaInadimplentes;
    function listarGrid(value: TDataSource): iRelatorioVendaInadimplentes;
    function ordenarGrid(column: TColumn): iRelatorioVendaInadimplentes;

    function selecionarVendas: iRelatorioVendaInadimplentes;
    function selecionarVendaData: iRelatorioVendaInadimplentes;

    function exportar: iRelatorioVendaInadimplentes;
    function validarData(componet: tmaskEdit): iRelatorioVendaInadimplentes;

  end;

  iRelatorioServicosMaisRealizados = interface
    ['{007F6180-56B8-4054-B9B8-09C953456CA9}']

    function nomeTabela(value: string): iRelatorioServicosMaisRealizados;
    function getCampo(value: string): iRelatorioServicosMaisRealizados;
    function getValor(value: string): iRelatorioServicosMaisRealizados;
    function getDataInicial(value: TDate): iRelatorioServicosMaisRealizados;
    function getDataFinal(value: TDate): iRelatorioServicosMaisRealizados;
    function open(value: string): iRelatorioServicosMaisRealizados;
    function pesquisar: iRelatorioServicosMaisRealizados;
    function ExecSql: iRelatorioServicosMaisRealizados;
    function sqlPesquisa: iRelatorioServicosMaisRealizados;
    function sqlPesquisaData: iRelatorioServicosMaisRealizados;
    function sqlPesquisaEstatica: iRelatorioServicosMaisRealizados;

    function abrir: iRelatorioServicosMaisRealizados;
    function atualizar: iRelatorioServicosMaisRealizados;
    function cancelar: iRelatorioServicosMaisRealizados;
    function fecharQuery: iRelatorioServicosMaisRealizados;
    function listarGrid(value: TDataSource): iRelatorioServicosMaisRealizados;
    function ordenarGrid(column: TColumn): iRelatorioServicosMaisRealizados;

    function servicosMaisRealizados: iRelatorioServicosMaisRealizados;
    function servicosMenosRealizados: iRelatorioServicosMaisRealizados;

    function exportar: iRelatorioServicosMaisRealizados;
    function validarData(componet: tmaskEdit): iRelatorioServicosMaisRealizados;

  end;

  iRelatorioSaidaDeProdutos = interface
    ['{009CC28A-BFCB-42EC-AE6D-79E43A0E3B2B}']

    function nomeTabela(value: string): iRelatorioSaidaDeProdutos;
    function getCampo(value: string): iRelatorioSaidaDeProdutos;
    function getValor(value: string): iRelatorioSaidaDeProdutos;
    function getDataInicial(value: TDate): iRelatorioSaidaDeProdutos;
    function getDataFinal(value: TDate): iRelatorioSaidaDeProdutos;
    function open(value: string): iRelatorioSaidaDeProdutos;
    function pesquisar: iRelatorioSaidaDeProdutos;
    function ExecSql: iRelatorioSaidaDeProdutos;
    function sqlPesquisa: iRelatorioSaidaDeProdutos;
    function sqlPesquisaData: iRelatorioSaidaDeProdutos;
    function sqlPesquisaEstatica: iRelatorioSaidaDeProdutos;

    function abrir: iRelatorioSaidaDeProdutos;
    function atualizar: iRelatorioSaidaDeProdutos;
    function cancelar: iRelatorioSaidaDeProdutos;
    function fecharQuery: iRelatorioSaidaDeProdutos;
    function listarGrid(value: TDataSource): iRelatorioSaidaDeProdutos;
    function ordenarGrid(column: TColumn): iRelatorioSaidaDeProdutos;

    function exportar: iRelatorioSaidaDeProdutos;
    function validarData(componet: tmaskEdit): iRelatorioSaidaDeProdutos;

  end;

  iRelatorioEntradaDeProdutos = interface
    ['{81600E0F-648C-4905-8A7F-5AC48DF3DB48}']

    function nomeTabela(value: string): iRelatorioEntradaDeProdutos;
    function getCampo(value: string): iRelatorioEntradaDeProdutos;
    function getValor(value: string): iRelatorioEntradaDeProdutos;
    function getDataInicial(value: TDate): iRelatorioEntradaDeProdutos;
    function getDataFinal(value: TDate): iRelatorioEntradaDeProdutos;
    function open(value: string): iRelatorioEntradaDeProdutos;
    function pesquisar: iRelatorioEntradaDeProdutos;
    function ExecSql: iRelatorioEntradaDeProdutos;
    function sqlPesquisa: iRelatorioEntradaDeProdutos;
    function sqlPesquisaData: iRelatorioEntradaDeProdutos;
    function sqlPesquisaEstatica: iRelatorioEntradaDeProdutos;

    function abrir: iRelatorioEntradaDeProdutos;
    function atualizar: iRelatorioEntradaDeProdutos;
    function cancelar: iRelatorioEntradaDeProdutos;
    function fecharQuery: iRelatorioEntradaDeProdutos;
    function listarGrid(value: TDataSource): iRelatorioEntradaDeProdutos;
    function ordenarGrid(column: TColumn): iRelatorioEntradaDeProdutos;

    function exportar: iRelatorioEntradaDeProdutos;
    function validarData(componet: tmaskEdit): iRelatorioEntradaDeProdutos;

  end;

  iRelatorioVendasPorFucnionario = interface
    ['{E356D919-862C-4586-9145-CF2F258243FB}']

    function nomeTabela(value: string): iRelatorioVendasPorFucnionario;
    function getCampo(value: string): iRelatorioVendasPorFucnionario;
    function getValor(value: string): iRelatorioVendasPorFucnionario;
    function getDataInicial(value: TDate): iRelatorioVendasPorFucnionario;
    function getDataFinal(value: TDate): iRelatorioVendasPorFucnionario;
    function open(value: string): iRelatorioVendasPorFucnionario;
    function pesquisar: iRelatorioVendasPorFucnionario;
    function ExecSql: iRelatorioVendasPorFucnionario;
    function sqlPesquisa: iRelatorioVendasPorFucnionario;
    function sqlPesquisaData: iRelatorioVendasPorFucnionario;
    function sqlPesquisaEstatica: iRelatorioVendasPorFucnionario;

    function abrir: iRelatorioVendasPorFucnionario;
    function atualizar: iRelatorioVendasPorFucnionario;
    function cancelar: iRelatorioVendasPorFucnionario;
    function fecharQuery: iRelatorioVendasPorFucnionario;
    function listarGrid(value: TDataSource): iRelatorioVendasPorFucnionario;
    function ordenarGrid(column: TColumn): iRelatorioVendasPorFucnionario;

    function maiorNumeroDeVendas: iRelatorioVendasPorFucnionario;
    function menorNumeroDeVendas: iRelatorioVendasPorFucnionario;

    function exportar: iRelatorioVendasPorFucnionario;
    function validarData(componet: tmaskEdit): iRelatorioVendasPorFucnionario;

  end;

  iRelatorioTransportadores = interface
    ['{FC59240A-5FB1-4BB3-8781-BBAD28E382D1}']

    function nomeTabela(value: string): iRelatorioTransportadores;
    function getCampo(value: string): iRelatorioTransportadores;
    function getValor(value: string): iRelatorioTransportadores;
    function getDataInicial(value: TDate): iRelatorioTransportadores;
    function getDataFinal(value: TDate): iRelatorioTransportadores;
    function open(value: string): iRelatorioTransportadores;
    function pesquisar: iRelatorioTransportadores;
    function ExecSql: iRelatorioTransportadores;
    function sqlPesquisa: iRelatorioTransportadores;
    function sqlPesquisaData: iRelatorioTransportadores;
    function sqlPesquisaEstatica: iRelatorioTransportadores;

    function abrir: iRelatorioTransportadores;
    function atualizar: iRelatorioTransportadores;
    function cancelar: iRelatorioTransportadores;
    function fecharQuery: iRelatorioTransportadores;
    function listarGrid(value: TDataSource): iRelatorioTransportadores;
    function ordenarGrid(column: TColumn): iRelatorioTransportadores;

    function exportar: iRelatorioTransportadores;
    function validarData(componet: tmaskEdit): iRelatorioTransportadores;

  end;

  iFactory = interface
    ['{05E76D27-7C57-4506-880D-F3720CC622E8}']
    function obertValorPorExtenso: iObterValorPorExtenso;
    function oberterDataHoraPorExtenso: iObterDataHoraPorExtenso;
    function CalcularJuros: iCalcularJuros;
    function criarJanela: iCriarJanelas;
    function validarDocumento: iValidarDocumento;
    function gerarCodigoEan13: iGerarCodigoBarras;
    function criptPass: iCriptPasss;
    function ftTable: iFDTable;
    function FClassQuery: iConexaoQuery;
    function localizarRegistroEspecifico: iLocalizarRegistroEspecifico;
    function calcularParcela: iCalcularParcelas;
  end;

  iRetiradaDeValores = interface
    ['{2BF31435-86AA-4D17-9964-6138A05234C4}']

    function nomeTabela(value: string): iRetiradaDeValores;
    function getCampo(value: string): iRetiradaDeValores;
    function getValor(value: string): iRetiradaDeValores;
    function getDataInicial(value: TDate): iRetiradaDeValores;
    function getDataFinal(value: TDate): iRetiradaDeValores;
    function open(value: string): iRetiradaDeValores;
    function pesquisar: iRetiradaDeValores;
    function ExecSql: iRetiradaDeValores;
    function sqlPesquisa: iRetiradaDeValores;
    function sqlPesquisaData: iRetiradaDeValores;
    function sqlPesquisaEstatica: iRetiradaDeValores;

    function abrir: iRetiradaDeValores;
    function inserir: iRetiradaDeValores;
    function gravar: iRetiradaDeValores;
    function deletar: iRetiradaDeValores;
    function atualizar: iRetiradaDeValores;
    function editar: iRetiradaDeValores;
    function cancelar: iRetiradaDeValores;
    function fecharQuery: iRetiradaDeValores;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iRetiradaDeValores;
    function ordenarGrid(column: TColumn): iRetiradaDeValores;

    function getID_MOTIVO(value: string): iRetiradaDeValores;
    function getMotivo(value: String): iRetiradaDeValores;
    function getVALOR_RETIRADA(value: string): iRetiradaDeValores;
    function getDATA(value: string): iRetiradaDeValores;
    function getHORA(value: string): iRetiradaDeValores;
    function getFuncionario(value: integer): iRetiradaDeValores;
    function getObservacao(value: string): iRetiradaDeValores;

    function exportar: iRetiradaDeValores;
    function validarData(componet: tmaskEdit): iRetiradaDeValores;

    function getCodigo(value: integer): iRetiradaDeValores;
    function getNome(value: string): iRetiradaDeValores;

  end;

  iRelatorioRetiradaDeValores = interface
    ['{300E6874-500D-41DC-B315-27983A4C5731}']

    function nomeTabela(value: string): iRelatorioRetiradaDeValores;
    function getCampo(value: string): iRelatorioRetiradaDeValores;
    function getValor(value: string): iRelatorioRetiradaDeValores;
    function getDataInicial(value: TDate): iRelatorioRetiradaDeValores;
    function getDataFinal(value: TDate): iRelatorioRetiradaDeValores;
    function open(value: string): iRelatorioRetiradaDeValores;
    function pesquisar: iRelatorioRetiradaDeValores;
    function ExecSql: iRelatorioRetiradaDeValores;
    function sqlPesquisa: iRelatorioRetiradaDeValores;
    function sqlPesquisaData: iRelatorioRetiradaDeValores;
    function sqlPesquisaEstatica: iRelatorioRetiradaDeValores;

    function abrir: iRelatorioRetiradaDeValores;
    function atualizar: iRelatorioRetiradaDeValores;
    function cancelar: iRelatorioRetiradaDeValores;
    function fecharQuery: iRelatorioRetiradaDeValores;
    function listarGrid(value: TDataSource): iRelatorioRetiradaDeValores;
    function ordenarGrid(column: TColumn): iRelatorioRetiradaDeValores;

    function exportar: iRelatorioRetiradaDeValores;
    function validarData(componet: tmaskEdit): iRelatorioRetiradaDeValores;

  end;

  iLogin = interface
    ['{29F71EA2-066A-4873-94D2-7BD9EF43B992}']

    function verificarUsuario(value: TEdit): iLogin;
    function verificarSenha(value: TEdit): iLogin;

    function realizarLogin: boolean;

  end;

  iRelatorioComissoesTecnico = interface
    ['{C8A10395-4C27-4FAA-8168-CA2E6AF68DD5}']

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

    function obterValorComissao: Currency;

    function exportar: iRelatorioComissoesTecnico;
    function validarData(componet: tmaskEdit): iRelatorioComissoesTecnico;

  end;

  iRelatorioProblemasFrequentes = interface
    ['{689693E8-94B3-45EF-819F-7732D18204F0}']

    function nomeTabela(value: string): iRelatorioProblemasFrequentes;
    function getCampo(value: string): iRelatorioProblemasFrequentes;
    function getValor(value: string): iRelatorioProblemasFrequentes;
    function getDataInicial(value: TDate): iRelatorioProblemasFrequentes;
    function getDataFinal(value: TDate): iRelatorioProblemasFrequentes;
    function open(value: string): iRelatorioProblemasFrequentes;
    function pesquisar: iRelatorioProblemasFrequentes;
    function ExecSql: iRelatorioProblemasFrequentes;
    function sqlPesquisa: iRelatorioProblemasFrequentes;
    function sqlPesquisaData: iRelatorioProblemasFrequentes;
    function sqlPesquisaEstatica: iRelatorioProblemasFrequentes;

    function abrir: iRelatorioProblemasFrequentes;
    function atualizar: iRelatorioProblemasFrequentes;
    function cancelar: iRelatorioProblemasFrequentes;
    function fecharQuery: iRelatorioProblemasFrequentes;
    function listarGrid(value: TDataSource): iRelatorioProblemasFrequentes;
    function ordenarGrid(column: TColumn): iRelatorioProblemasFrequentes;

    function exportar: iRelatorioProblemasFrequentes;
    function validarData(componet: tmaskEdit): iRelatorioProblemasFrequentes;

  end;

  iRelatorioHistoricoCaixa = interface
    ['{F6BCDBE0-B889-4B5E-9AE7-15EA4B953049}']

    function nomeTabela(value: string): iRelatorioHistoricoCaixa;
    function getCampo(value: string): iRelatorioHistoricoCaixa;
    function getValor(value: string): iRelatorioHistoricoCaixa;
    function getDataInicial(value: TDate): iRelatorioHistoricoCaixa;
    function getDataFinal(value: TDate): iRelatorioHistoricoCaixa;
    function open(value: string): iRelatorioHistoricoCaixa;
    function pesquisar: iRelatorioHistoricoCaixa;
    function ExecSql: iRelatorioHistoricoCaixa;
    function sqlPesquisa: iRelatorioHistoricoCaixa;
    function sqlPesquisaData: iRelatorioHistoricoCaixa;
    function sqlPesquisaEstatica: iRelatorioHistoricoCaixa;

    function abrir: iRelatorioHistoricoCaixa;
    function atualizar: iRelatorioHistoricoCaixa;
    function cancelar: iRelatorioHistoricoCaixa;
    function fecharQuery: iRelatorioHistoricoCaixa;
    function listarGrid(value: TDataSource): iRelatorioHistoricoCaixa;
    function ordenarGrid(column: TColumn): iRelatorioHistoricoCaixa;

    function exportar: iRelatorioHistoricoCaixa;
    function validarData(componet: tmaskEdit): iRelatorioHistoricoCaixa;

  end;

  iImprimirReciboPgtoParcelas = interface
    ['{6944295A-A881-4ADD-A3C8-E837D9498DA3}']

    function nomeTabela(value: string): iImprimirReciboPgtoParcelas;
    function getCampo(value: string): iImprimirReciboPgtoParcelas;
    function getValor(value: string): iImprimirReciboPgtoParcelas;
    function getDataInicial(value: TDate): iImprimirReciboPgtoParcelas;
    function getDataFinal(value: TDate): iImprimirReciboPgtoParcelas;
    function open(value: string): iImprimirReciboPgtoParcelas;
    function pesquisar: iImprimirReciboPgtoParcelas;
    function ExecSql: iImprimirReciboPgtoParcelas;
    function sqlPesquisa: iImprimirReciboPgtoParcelas;
    function sqlPesquisaData: iImprimirReciboPgtoParcelas;
    function sqlPesquisaEstatica: iImprimirReciboPgtoParcelas;
    function SelectSql(value: string): iImprimirReciboPgtoParcelas;

    function abrir: iImprimirReciboPgtoParcelas;
    function atualizar: iImprimirReciboPgtoParcelas;
    function cancelar: iImprimirReciboPgtoParcelas;
    function fecharQuery: iImprimirReciboPgtoParcelas;
    function listarGrid(value: TDataSource): iImprimirReciboPgtoParcelas;
    function ordenarGrid(column: TColumn): iImprimirReciboPgtoParcelas;

    function selecionarParcela(value: integer): iImprimirReciboPgtoParcelas;
    function selecionarEmpresa(value: TDataSource): iImprimirReciboPgtoParcelas;

    function exportar: iImprimirReciboPgtoParcelas;
    procedure validarData(componet: tmaskEdit);

  end;

  iImprimirParcelasOS = interface
    ['{E6BDD340-8AD5-4644-AAE2-883305B10A47}']

    function nomeTabela(value: string): iImprimirParcelasOS;
    function getCampo(value: string): iImprimirParcelasOS;
    function getValor(value: string): iImprimirParcelasOS;
    function getDataInicial(value: TDate): iImprimirParcelasOS;
    function getDataFinal(value: TDate): iImprimirParcelasOS;
    function open(value: string): iImprimirParcelasOS;
    function pesquisar: iImprimirParcelasOS;
    function ExecSql: iImprimirParcelasOS;
    function sqlPesquisa: iImprimirParcelasOS;
    function sqlPesquisaData: iImprimirParcelasOS;
    function sqlPesquisaEstatica: iImprimirParcelasOS;
    function SelectSql(value: string): iImprimirParcelasOS;

    function abrir: iImprimirParcelasOS;
    function atualizar: iImprimirParcelasOS;
    function cancelar: iImprimirParcelasOS;
    function fecharQuery: iImprimirParcelasOS;
    function listarGrid(value: TDataSource): iImprimirParcelasOS;
    function ordenarGrid(column: TColumn): iImprimirParcelasOS;

    function selecionarParcela(value: integer): iImprimirParcelasOS;
    function selecionarEmpresa(value: TDataSource): iImprimirParcelasOS;

    function exportar: iImprimirParcelasOS;
    procedure validarData(componet: tmaskEdit);

  end;

  iRelatorioMovimentacaoOS = interface
    ['{7BC9824C-5C77-4717-B3B0-059B53746DFF}']

    function nomeTabela(value: string): iRelatorioMovimentacaoOS;
    function getCampo(value: string): iRelatorioMovimentacaoOS;
    function getValor(value: string): iRelatorioMovimentacaoOS;
    function getDataInicial(value: TDate): iRelatorioMovimentacaoOS;
    function getDataFinal(value: TDate): iRelatorioMovimentacaoOS;
    function open(value: string): iRelatorioMovimentacaoOS;
    function pesquisar: iRelatorioMovimentacaoOS;
    function ExecSql: iRelatorioMovimentacaoOS;
    function sqlPesquisa: iRelatorioMovimentacaoOS;
    function sqlPesquisaData: iRelatorioMovimentacaoOS;
    function sqlPesquisaEstatica: iRelatorioMovimentacaoOS;
    function SelectSql(value: string): iRelatorioMovimentacaoOS;

    function abrir: iRelatorioMovimentacaoOS;
    function atualizar: iRelatorioMovimentacaoOS;
    function cancelar: iRelatorioMovimentacaoOS;
    function fecharQuery: iRelatorioMovimentacaoOS;
    function listarGrid(value: TDataSource): iRelatorioMovimentacaoOS;
    function ordenarGrid(column: TColumn): iRelatorioMovimentacaoOS;

    function exportar: iRelatorioMovimentacaoOS;
    function validarData(componet: tmaskEdit): iRelatorioMovimentacaoOS;

    function selecionarParcelasOrdemData(data1, data2: TDate)
      : iRelatorioMovimentacaoOS;
    function retornarTotal: Currency;

  end;

  iRelatorioMovimentacaoVenda = interface
    ['{4FA7855D-D837-4CF6-A3A3-A95193E636D5}']

    function nomeTabela(value: string): iRelatorioMovimentacaoVenda;
    function getCampo(value: string): iRelatorioMovimentacaoVenda;
    function getValor(value: string): iRelatorioMovimentacaoVenda;
    function getDataInicial(value: TDate): iRelatorioMovimentacaoVenda;
    function getDataFinal(value: TDate): iRelatorioMovimentacaoVenda;
    function open(value: string): iRelatorioMovimentacaoVenda;
    function pesquisar: iRelatorioMovimentacaoVenda;
    function ExecSql: iRelatorioMovimentacaoVenda;
    function sqlPesquisa: iRelatorioMovimentacaoVenda;
    function sqlPesquisaData: iRelatorioMovimentacaoVenda;
    function sqlPesquisaEstatica: iRelatorioMovimentacaoVenda;
    function SelectSql(value: string): iRelatorioMovimentacaoVenda;

    function abrir: iRelatorioMovimentacaoVenda;
    function atualizar: iRelatorioMovimentacaoVenda;
    function cancelar: iRelatorioMovimentacaoVenda;
    function fecharQuery: iRelatorioMovimentacaoVenda;
    function listarGrid(value: TDataSource): iRelatorioMovimentacaoVenda;
    function ordenarGrid(column: TColumn): iRelatorioMovimentacaoVenda;

    function exportar: iRelatorioMovimentacaoVenda;
    function validarData(componet: tmaskEdit): iRelatorioMovimentacaoVenda;

    function selecionarParcelasOrdemData(data1, data2: TDate)
      : iRelatorioMovimentacaoVenda;
    function retornarTotal: Currency;

  end;

  iRelatorioMovimentacaoRetiradas = interface
    ['{0EE3053E-4681-4053-BD0D-2253A5D57084}']

    function nomeTabela(value: string): iRelatorioMovimentacaoRetiradas;
    function getCampo(value: string): iRelatorioMovimentacaoRetiradas;
    function getValor(value: string): iRelatorioMovimentacaoRetiradas;
    function getDataInicial(value: TDate): iRelatorioMovimentacaoRetiradas;
    function getDataFinal(value: TDate): iRelatorioMovimentacaoRetiradas;
    function open(value: string): iRelatorioMovimentacaoRetiradas;
    function pesquisar: iRelatorioMovimentacaoRetiradas;
    function ExecSql: iRelatorioMovimentacaoRetiradas;
    function sqlPesquisa: iRelatorioMovimentacaoRetiradas;
    function sqlPesquisaData: iRelatorioMovimentacaoRetiradas;
    function sqlPesquisaEstatica: iRelatorioMovimentacaoRetiradas;
    function SelectSql(value: string): iRelatorioMovimentacaoRetiradas;

    function abrir: iRelatorioMovimentacaoRetiradas;
    function atualizar: iRelatorioMovimentacaoRetiradas;
    function cancelar: iRelatorioMovimentacaoRetiradas;
    function fecharQuery: iRelatorioMovimentacaoRetiradas;
    function listarGrid(value: TDataSource): iRelatorioMovimentacaoRetiradas;
    function ordenarGrid(column: TColumn): iRelatorioMovimentacaoRetiradas;

    function exportar: iRelatorioMovimentacaoRetiradas;
    function validarData(componet: tmaskEdit): iRelatorioMovimentacaoRetiradas;

    function selecionarParcelasOrdemData(data1, data2: TDate)
      : iRelatorioMovimentacaoRetiradas;
    function retornarTotal: Currency;

  end;

  iRelatorioMovimentacaoContas = interface
    ['{BA98DB5C-8CB8-455B-8AFD-AE5674366C8D}']

    function nomeTabela(value: string): iRelatorioMovimentacaoContas;
    function getCampo(value: string): iRelatorioMovimentacaoContas;
    function getValor(value: string): iRelatorioMovimentacaoContas;
    function getDataInicial(value: TDate): iRelatorioMovimentacaoContas;
    function getDataFinal(value: TDate): iRelatorioMovimentacaoContas;
    function open(value: string): iRelatorioMovimentacaoContas;
    function pesquisar: iRelatorioMovimentacaoContas;
    function ExecSql: iRelatorioMovimentacaoContas;
    function sqlPesquisa: iRelatorioMovimentacaoContas;
    function sqlPesquisaData: iRelatorioMovimentacaoContas;
    function sqlPesquisaEstatica: iRelatorioMovimentacaoContas;
    function SelectSql(value: string): iRelatorioMovimentacaoContas;

    function abrir: iRelatorioMovimentacaoContas;
    function atualizar: iRelatorioMovimentacaoContas;
    function cancelar: iRelatorioMovimentacaoContas;
    function fecharQuery: iRelatorioMovimentacaoContas;
    function listarGrid(value: TDataSource): iRelatorioMovimentacaoContas;
    function ordenarGrid(column: TColumn): iRelatorioMovimentacaoContas;

    function exportar: iRelatorioMovimentacaoContas;
    function validarData(componet: tmaskEdit): iRelatorioMovimentacaoContas;

    function selecionarParcelasOrdemData(data1, data2: TDate)
      : iRelatorioMovimentacaoContas;
    function retornarTotal: Currency;

  end;

  iRelatorioMovimentacaoCaixa = interface
    ['{3E783769-7137-4086-9A14-33ACD7C8FB73}']

    function nomeTabela(value: string): iRelatorioMovimentacaoCaixa;
    function getCampo(value: string): iRelatorioMovimentacaoCaixa;
    function getValor(value: string): iRelatorioMovimentacaoCaixa;
    function getDataInicial(value: TDate): iRelatorioMovimentacaoCaixa;
    function getDataFinal(value: TDate): iRelatorioMovimentacaoCaixa;
    function open(value: string): iRelatorioMovimentacaoCaixa;
    function pesquisar: iRelatorioMovimentacaoCaixa;
    function ExecSql: iRelatorioMovimentacaoCaixa;
    function sqlPesquisa: iRelatorioMovimentacaoCaixa;
    function sqlPesquisaData: iRelatorioMovimentacaoCaixa;
    function sqlPesquisaEstatica: iRelatorioMovimentacaoCaixa;
    function SelectSql(value: string): iRelatorioMovimentacaoCaixa;

    function abrir: iRelatorioMovimentacaoCaixa;
    function atualizar: iRelatorioMovimentacaoCaixa;
    function cancelar: iRelatorioMovimentacaoCaixa;
    function fecharQuery: iRelatorioMovimentacaoCaixa;
    function listarGrid(value: TDataSource): iRelatorioMovimentacaoCaixa;
    function ordenarGrid(column: TColumn): iRelatorioMovimentacaoCaixa;

    function exportar: iRelatorioMovimentacaoCaixa;
    function validarData(componet: tmaskEdit): iRelatorioMovimentacaoCaixa;

    function selecionarParcelasOrdemData(data1, data2: TDate)
      : iRelatorioMovimentacaoCaixa;
    function retornarTotal: Currency;

  end;

  iRelatorioLogEventos = interface
    ['{CF77244A-7B99-4A75-A7D4-8532CE59998F}']

    function nomeTabela(value: string): iRelatorioLogEventos;
    function getCampo(value: string): iRelatorioLogEventos;
    function getValor(value: string): iRelatorioLogEventos;
    function getDataInicial(value: TDate): iRelatorioLogEventos;
    function getDataFinal(value: TDate): iRelatorioLogEventos;
    function open(value: string): iRelatorioLogEventos;
    function pesquisar: iRelatorioLogEventos;
    function ExecSql: iRelatorioLogEventos;
    function sqlPesquisa: iRelatorioLogEventos;
    function sqlPesquisaData: iRelatorioLogEventos;
    function sqlPesquisaEstatica: iRelatorioLogEventos;

    function abrir: iRelatorioLogEventos;
    function atualizar: iRelatorioLogEventos;
    function cancelar: iRelatorioLogEventos;
    function fecharQuery: iRelatorioLogEventos;
    function listarGrid(value: TDataSource): iRelatorioLogEventos;
    function ordenarGrid(column: TColumn): iRelatorioLogEventos;

    function exportar: iRelatorioLogEventos;
    function validarData(componet: tmaskEdit): iRelatorioLogEventos;

  end;

  iRelatorioAniversariantes = interface
    ['{D6C00CF3-0549-48C5-ACFF-14C5D715AB7D}']
    function nomeTabela(value: string): iRelatorioAniversariantes;
    function getCampo(value: string): iRelatorioAniversariantes;
    function getValor(value: string): iRelatorioAniversariantes;
    function getDataInicial(value: TDate): iRelatorioAniversariantes;
    function getDataFinal(value: TDate): iRelatorioAniversariantes;
    function open(value: string): iRelatorioAniversariantes;
    function pesquisar: iRelatorioAniversariantes;
    function ExecSql: iRelatorioAniversariantes;
    function sqlPesquisa: iRelatorioAniversariantes;
    function sqlPesquisaData: iRelatorioAniversariantes;
    function sqlPesquisaEstatica: iRelatorioAniversariantes;

    function abrir: iRelatorioAniversariantes;
    function atualizar: iRelatorioAniversariantes;
    function cancelar: iRelatorioAniversariantes;
    function fecharQuery: iRelatorioAniversariantes;
    function listarGrid(value: TDataSource): iRelatorioAniversariantes;
    function ordenarGrid(column: TColumn): iRelatorioAniversariantes;

    function retornarAniversariantes(value:TDate): iRelatorioAniversariantes;

    function exportar: iRelatorioAniversariantes;
    function validarData(componet: tmaskEdit): iRelatorioAniversariantes;
  end;

  iTrocarDeUsuario = interface
    ['{BC52F62A-A38D-42D9-923D-ED54BC9F26F2}']

    function resetar: iTrocarDeUsuario;
    function relogar: iTrocarDeUsuario;

  end;

  iFactoryMovimentacao = interface
    ['{1116AD9D-EE16-4F5F-90BA-42BD1F41F2E6}']

    function movimentacaoOS: iRelatorioMovimentacaoOS;
    function movimentacaoVenda: iRelatorioMovimentacaoVenda;
    function movimentacaoRetiradas: iRelatorioMovimentacaoRetiradas;
    function movimentacaoContas: iRelatorioMovimentacaoContas;
    function movimentacaoCaixa: iRelatorioMovimentacaoCaixa;

  end;

  // ****************************************************

  iNivelAcessoFuncionario = interface
    ['{265CAA95-A5CA-4855-BD83-EEFF7129ED3B}']

    function nomeTabela(value: string): iNivelAcessoFuncionario;
    function getCampo(value: string): iNivelAcessoFuncionario;
    function getValor(value: string): iNivelAcessoFuncionario;
    function getDataInicial(value: TDate): iNivelAcessoFuncionario;
    function getDataFinal(value: TDate): iNivelAcessoFuncionario;
    function open(value: string): iNivelAcessoFuncionario;
    function pesquisar: iNivelAcessoFuncionario;
    function ExecSql: iNivelAcessoFuncionario;
    function sqlPesquisa: iNivelAcessoFuncionario;
    function sqlPesquisaData: iNivelAcessoFuncionario;
    function sqlPesquisaEstatica: iNivelAcessoFuncionario;
    function SelectSql(value: string): iNivelAcessoFuncionario;

    function abrir: iNivelAcessoFuncionario;
    function inserir: iNivelAcessoFuncionario;
    function gravar: iNivelAcessoFuncionario;
    function deletar: iNivelAcessoFuncionario;
    function atualizar: iNivelAcessoFuncionario;
    function editar: iNivelAcessoFuncionario;
    function cancelar: iNivelAcessoFuncionario;
    function fecharQuery: iNivelAcessoFuncionario;
    function codigoCadastro(sp: string): integer;
    function listarGrid(value: TDataSource): iNivelAcessoFuncionario;
    function ordenarGrid(column: TColumn): iNivelAcessoFuncionario;

    function getID(value: integer): iNivelAcessoFuncionario;
    function getID_FUNCIONARIO(value: integer): iNivelAcessoFuncionario;
    function getFuncionario(value: string): iNivelAcessoFuncionario;
    function getFORMCADASTROMARCAS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADASTROGRUPOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMFORMAPAGAMENTO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMTIPORETIRADAS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCONFIGPARCELAS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMATFUNCIONARIO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADCONTASAPAGAR(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADPROBLEMASFREQUENTES(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADFORNECEDORES(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADTRANSPORTADORA(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADPRODUTOS(value: string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCOMFUNCIONARIOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADDEFUNCIONARIO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADSITUACOESORDEM(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADDECLIENTES(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMENTDEPRODUTOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMSAIDADEPRODUTOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMORDEMSERVICO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCCONSORDEMSERVICO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADDESERVICOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCADEMPRESA(value: string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMVENDAS(value: string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMNUMPARCELAS(value: string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMQUITARPARCVENDAS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMVISUALIZARVENDAS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELCLIENTES(value: string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELHISTORICOOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELCONTASARECEBEROS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELCONTASARECEBERVENDA(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELPARCELASPAGASOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMOSESTORNADAS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELVENDASESTORNADAS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELCONTASAPAGAR(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELREPAROSPORPERIODO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATOSPORTECNICO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATOSPORSTATUS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATORDEMDESERVICO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATFORNECEDORES(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATOSINADIMPLENTES(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATDEPRODUTOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATSITUACAODOESTOQUE(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATPRODVENDIDOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATVENDAS(value: string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATVENDASINADIMP(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATSERVICOSMAISREALIZ(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATSAIDADEPRODUTOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATENTRDEPRODUTOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATVENDASFUNCIONARIO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATTRANSPORTADORA(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMINICIARCAIXA(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMENCERRAMENTOCAIXA(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMREABERTURADECAIXA(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRETIRADADEVALORES(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATRETIRDEVALORES(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCOMISSOESTECNICOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCONFIGCONEXAOBANCO(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMCONFIGBACKUP(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMBACKUPMANUAL(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATPROBLFREQUENTES(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMRELATHISTORICOCAIXA(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMQUITARPARCELAOS(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getFORMMOVIMENTACAOCAIXA(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getESTORNAR(value: string = 'Nao'): iNivelAcessoFuncionario;
    function getADICIONARPARCELA(value: string = 'Nao')
      : iNivelAcessoFuncionario;
    function getEXCLUIRPARCELA(value: string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATORIOPARCELASPAGASVENDA(value: string = 'Nao')
      : iNivelAcessoFuncionario;

  end;

  iFactoryEntity = interface
    ['{3DFCA13B-EC0F-4597-B527-D42F90034001}']
    function entityTable: iFDTable;
  end;

  iFactoryQuery<T> = interface
    ['{6A9FF249-F3A8-4660-BCFB-F227FCD3B86D}']
    function queryTable: iConexaoQuery;
  end;

implementation

end.
