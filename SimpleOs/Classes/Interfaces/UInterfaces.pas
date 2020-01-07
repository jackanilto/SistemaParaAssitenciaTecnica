unit UInterfaces;

interface

uses
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.DBGrids,
  Vcl.Forms, Vcl.StdCtrls, jpeg, Vcl.Graphics, Vcl.Mask, Datasnap.DBClient,
  Vcl.ExtCtrls;

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
    function validarSenha(value1, value2: string): iCadastroFuncionario;

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
    function getVALOR_POR_ITENS(value: currency): iEntradaProdutos;
    function getQUANTIDADE(value: integer): iEntradaProdutos;
    function getTOTAL_DA_ENTRADA(value: currency): iEntradaProdutos;
    function getNUMERO_NOTA(value: string): iEntradaProdutos;
    function getFuncionario(value: integer): iEntradaProdutos;
    function getDATA(value: string): iEntradaProdutos;
    function getHORA(value: string): iEntradaProdutos;
    function getObservacao(value: string): iEntradaProdutos;

    function exportar: iEntradaProdutos;
    function atualizarEstoque: iEntradaProdutos;
    function getCodigoProdutoAtualizar(value: integer): iEntradaProdutos;
    function getQuantidadeProdutoAtualizar(value: integer): iEntradaProdutos;
    function getvalorEntradaProdutoAtualizar(value: currency): iEntradaProdutos;
    function getValorTotalEntradaProdutoAtualizar(value: currency)
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
    function getVALORPRODUTO(value: currency): iSaidaDeProdutos;
    function getQUANTIDADE(value: integer): iSaidaDeProdutos;
    function getTOTAL(value: currency): iSaidaDeProdutos;
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
    function setValorDaParcelas: currency;
    function setDataBaseVencimento: TDate;

    function calcularDesconto(valor, desconto: TEdit): string;
    function calcularAcrescimo(valor, desconto, acrescimo: TEdit): string;
    function calularTotalPorNumeroDeParcela(total, qtde: TEdit): string;

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
    function adicionarItemTemporariamenteValor(value: currency)
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
    function getVALOR_PARCELA(value: currency): iParcelaOrdem;
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
    function estadoDaTabela(value: string): iParcelaOrdem;

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
    function somarItensDaVenda(value: TclientDataSet): currency;
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

    function calularTotalXquantidade(vlrProduto, qtdeProduto: TEdit): currency;

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
    function setValorUnitarioProduto: currency;

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

    function getValor(value: currency): iCalcularParcelas;
    function getNumeroParcelas(value: integer): iCalcularParcelas;
    function valorDeCadaParcela: currency;

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

  iNivelAcessoFuncionario = interface
    ['{265CAA95-A5CA-4855-BD83-EEFF7129ED3B}']
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
