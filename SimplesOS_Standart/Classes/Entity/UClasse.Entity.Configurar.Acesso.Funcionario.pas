unit UClasse.Entity.Configurar.Acesso.Funcionario;

interface

uses UClasse.Query, UInterfaces, UDados.Conexao, Data.DB, Vcl.Dialogs,
  System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Controls,
  UClasse.Gravar.Log.Sistema, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Mask;

type

  TEntityConfigAcessoFuncionario = class(TInterfacedObject, iNivelAcessoFuncionario)
  private

    FQuery: iConexaoQuery;
    FGravarLog: iGravarLogOperacoes;
    FTabela: string;
    FCampo: string;
    FValor: string;
    FDataInicial: TDate;
    FDataFinal: TDate;

    FCodigo: integer;
    FNome: string;

    FID: Integer;
    FID_FUNCIONARIO: Integer;
    FFUNCIONARIO: String;
    FFORMCADASTROMARCAS: String;
    FFORMCADASTROGRUPOS: String;
    FFORMFORMAPAGAMENTO: String;
    FFORMTIPORETIRADAS: String;
    FFORMCONFIGPARCELAS: String;
    FFORMATFUNCIONARIO: String;
    FFORMCADCONTASAPAGAR: String;
    FFORMCADPROBLEMASFREQUENTES: String;
    FFORMCADFORNECEDORES: String;
    FFORMCADTRANSPORTADORA: String;
    FFORMCADPRODUTOS: String;
    FFORMCOMFUNCIONARIOS: String;
    FFORMCADDEFUNCIONARIOS: String;
    FFORMCADSITUACOESORDEM: String;
    FFORMCADDECLIENTES: String;
    FFORMENTDEPRODUTOS: String;
    FFORMSAIDADEPRODUTOS: String;
    FFORMORDEMSERVICO: String;
    FFORMCCONSORDEMSERVICO: String;
    FFORMCADDESERVICOS: String;
    FFORMCADEMPRESA: String;
    FFORMVENDAS: String;
    FFORMNUMPARCELAS: String;
    FFORMQUITARPARCVENDAS: String;
    FFORMVISUALIZARVENDAS: String;
    FFORMRELCLIENTES: String;
    FFORMRELHISTORICOOS: String;
    FFORMRELCONTASARECEBEROS: String;
    FFORMRELCONTASARECEBERVENDA: String;
    FFORMRELPARCELASPAGASOS: String;
    FFORMOSESTORNADAS: String;
    FFORMRELVENDASESTORNADAS: String;
    FFORMRELCONTASAPAGAR: String;
    FFORMRELREPAROSPORPERIODO: String;
    FFORMRELATOSPORTECNICO: String;
    FFORMRELATOSPORSTATUS: String;
    FFORMRELATORDEMDESERVICO: String;
    FFORMRELATFORNECEDORES: String;
    FFORMRELATOSINADIMPLENTES: String;
    FFORMRELATDEPRODUTOS: String;
    FFORMRELATSITUACAODOESTOQUE: String;
    FFORMRELATPRODVENDIDOS: String;
    FFORMRELATVENDAS: String;
    FFORMRELATVENDASINADIMP: String;
    FFORMRELATSERVICOSMAISREALIZ: String;
    FFORMRELATSAIDADEPRODUTOS: String;
    FFORMRELATENTRDEPRODUTOS: String;
    FFORMRELATVENDASFUNCIONARIO: String;
    FFORMRELATTRANSPORTADORA: String;
    FFORMINICIARCAIXA: String;
    FFORMENCERRAMENTOCAIXA: String;
    FFORMREABERTURADECAIXA: String;
    FFORMRETIRADADEVALORES: String;
    FFORMRELATRETIRDEVALORES: String;
    FFORMCOMISSOESTECNICOS: String;
    FFORMCONFIGCONEXAOBANCO: String;
    FFORMCONFIGBACKUP: String;
    FFORMBACKUPMANUAL: String;
    FFORMRELATPROBLFREQUENTES: String;
    FFORMRELATHISTORICOCAIXA: String;
    FFORMQUITARPARCELAOS: String;
    FFORMMOVIMENTACAOCAIXA: String;
    FESTORNAR: String;
    FADICIONARPARCELA: String;
    FEXCLUIRPARCELA: String;
    FFORMRELATORIOPARCELASPAGASVENDA:String;

  public

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

    function getID(value:integer): iNivelAcessoFuncionario;
    function getID_FUNCIONARIO(value:integer): iNivelAcessoFuncionario;
    function getFUNCIONARIO(value:string): iNivelAcessoFuncionario;
    function getFORMCADASTROMARCAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADASTROGRUPOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMFORMAPAGAMENTO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMTIPORETIRADAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCONFIGPARCELAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMATFUNCIONARIO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADCONTASAPAGAR(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADPROBLEMASFREQUENTES(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADFORNECEDORES(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADTRANSPORTADORA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADPRODUTOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCOMFUNCIONARIOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADDEFUNCIONARIO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADSITUACOESORDEM(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADDECLIENTES(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMENTDEPRODUTOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMSAIDADEPRODUTOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMORDEMSERVICO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCCONSORDEMSERVICO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADDESERVICOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCADEMPRESA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMVENDAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMNUMPARCELAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMQUITARPARCVENDAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMVISUALIZARVENDAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELCLIENTES(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELHISTORICOOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELCONTASARECEBEROS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELCONTASARECEBERVENDA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELPARCELASPAGASOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMOSESTORNADAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELVENDASESTORNADAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELCONTASAPAGAR(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELREPAROSPORPERIODO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATOSPORTECNICO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATOSPORSTATUS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATORDEMDESERVICO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATFORNECEDORES(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATOSINADIMPLENTES(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATDEPRODUTOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATSITUACAODOESTOQUE(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATPRODVENDIDOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATVENDAS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATVENDASINADIMP(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATSERVICOSMAISREALIZ(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATSAIDADEPRODUTOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATENTRDEPRODUTOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATVENDASFUNCIONARIO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATTRANSPORTADORA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMINICIARCAIXA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMENCERRAMENTOCAIXA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMREABERTURADECAIXA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRETIRADADEVALORES(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATRETIRDEVALORES(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCOMISSOESTECNICOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCONFIGCONEXAOBANCO(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMCONFIGBACKUP(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMBACKUPMANUAL(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATPROBLFREQUENTES(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATHISTORICOCAIXA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMQUITARPARCELAOS(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMMOVIMENTACAOCAIXA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getESTORNAR(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getADICIONARPARCELA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getEXCLUIRPARCELA(value:string = 'Nao'): iNivelAcessoFuncionario;
    function getFORMRELATORIOPARCELASPAGASVENDA(value:string = 'Nao'): iNivelAcessoFuncionario;

    constructor create;
    destructor destroy; override;
    class function new: iNivelAcessoFuncionario;
  end;

implementation

{ TEntityConfigAcessoFuncionario }

function TEntityConfigAcessoFuncionario.abrir: iNivelAcessoFuncionario;
begin

  result := self;
  FQuery.Query(FTabela);

end;

function TEntityConfigAcessoFuncionario.atualizar: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.TQuery.Refresh;
end;

function TEntityConfigAcessoFuncionario.cancelar: iNivelAcessoFuncionario;
begin
  FQuery.TQuery.Cancel;
  // FQuery.TQuery.close;
end;

function TEntityConfigAcessoFuncionario.codigoCadastro(sp: string): integer;
begin
  result := FQuery.codigoCadastro('');
end;

constructor TEntityConfigAcessoFuncionario.create;
begin
  FTabela := 'RECURSOS';
  FQuery := TConexaoQuery.new.Query(FTabela);

  FGravarLog := TGravarLogSistema.new;
  FGravarLog.getJanela('Configurar acesso recursos funcion�rios').getCodigoFuncionario
    (funcionarioLogado);

end;

function TEntityConfigAcessoFuncionario.deletar: iNivelAcessoFuncionario;
begin
  result := self;

  if FQuery.TQuery.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este registro?',
      'Pergunta do sistema!', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin

      FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('FUNCIONARIO')
        .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
        .gravarLog;

      FQuery.TQuery.Delete;
    end;
  end;

end;

destructor TEntityConfigAcessoFuncionario.destroy;
begin

  inherited;
end;

function TEntityConfigAcessoFuncionario.editar: iNivelAcessoFuncionario;
begin
  result := self;
  if FQuery.TQuery.RecordCount >= 1 then
  begin

    FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('FUNCIONARIO')
      .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
      .gravarLog;

    FQuery.TQuery.Edit;

  end;
end;

function TEntityConfigAcessoFuncionario.ExecSql: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.ExecSql(FTabela);
end;

function TEntityConfigAcessoFuncionario.fecharQuery: iNivelAcessoFuncionario;
begin
  FQuery.TQuery.close;
end;

function TEntityConfigAcessoFuncionario.getADICIONARPARCELA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FADICIONARPARCELA := value;
end;

function TEntityConfigAcessoFuncionario.getCampo(value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FCampo := value;
end;

function TEntityConfigAcessoFuncionario.getDataFinal(value: TDate): iNivelAcessoFuncionario;
begin
  result := self;
  FDataFinal := value;
  // FQuery.getDataFinal(value);
end;

function TEntityConfigAcessoFuncionario.getDataInicial(value: TDate): iNivelAcessoFuncionario;
begin
  result := self;
  FDataInicial := value;
  // FQuery.getDataInicial(value);
end;


function TEntityConfigAcessoFuncionario.getESTORNAR(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FESTORNAR := value;
end;

function TEntityConfigAcessoFuncionario.getEXCLUIRPARCELA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FEXCLUIRPARCELA := value;
end;

function TEntityConfigAcessoFuncionario.getFORMATFUNCIONARIO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMATFUNCIONARIO := value;
end;

function TEntityConfigAcessoFuncionario.getFORMBACKUPMANUAL(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMBACKUPMANUAL := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADASTROGRUPOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADASTROGRUPOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADASTROMARCAS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADASTROMARCAS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADCONTASAPAGAR(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADCONTASAPAGAR := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADDECLIENTES(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADDECLIENTES := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADDEFUNCIONARIO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADDEFUNCIONARIOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADDESERVICOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADDESERVICOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADEMPRESA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADEMPRESA := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADFORNECEDORES(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADFORNECEDORES := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADPROBLEMASFREQUENTES(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADPROBLEMASFREQUENTES := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADPRODUTOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADPRODUTOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADSITUACOESORDEM(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADSITUACOESORDEM := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCADTRANSPORTADORA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCADTRANSPORTADORA := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCCONSORDEMSERVICO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCCONSORDEMSERVICO := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCOMFUNCIONARIOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCOMFUNCIONARIOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCOMISSOESTECNICOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCOMISSOESTECNICOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCONFIGBACKUP(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCONFIGBACKUP := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCONFIGCONEXAOBANCO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCONFIGCONEXAOBANCO := value;
end;

function TEntityConfigAcessoFuncionario.getFORMCONFIGPARCELAS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMCONFIGPARCELAS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMENCERRAMENTOCAIXA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMENCERRAMENTOCAIXA := value;
end;

function TEntityConfigAcessoFuncionario.getFORMENTDEPRODUTOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMENTDEPRODUTOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMFORMAPAGAMENTO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMFORMAPAGAMENTO := value;
end;

function TEntityConfigAcessoFuncionario.getFORMINICIARCAIXA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMINICIARCAIXA := value;
end;

function TEntityConfigAcessoFuncionario.getFORMMOVIMENTACAOCAIXA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMMOVIMENTACAOCAIXA := value;
end;

function TEntityConfigAcessoFuncionario.getFORMNUMPARCELAS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMNUMPARCELAS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMORDEMSERVICO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMORDEMSERVICO := value;
end;

function TEntityConfigAcessoFuncionario.getFORMOSESTORNADAS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMOSESTORNADAS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMQUITARPARCELAOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMQUITARPARCELAOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMQUITARPARCVENDAS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMQUITARPARCVENDAS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMREABERTURADECAIXA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMREABERTURADECAIXA := value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELATDEPRODUTOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATDEPRODUTOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELATENTRDEPRODUTOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATENTRDEPRODUTOS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELATFORNECEDORES(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATFORNECEDORES := value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELATHISTORICOCAIXA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATHISTORICOCAIXA := value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELATORDEMDESERVICO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATORDEMDESERVICO := value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELATORIOPARCELASPAGASVENDA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATORIOPARCELASPAGASVENDA := value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELATOSINADIMPLENTES(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATOSINADIMPLENTES := value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELATOSPORSTATUS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATOSPORSTATUS := value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELATOSPORTECNICO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATOSPORTECNICO := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATPROBLFREQUENTES(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATPROBLFREQUENTES := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATPRODVENDIDOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATPRODVENDIDOS := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATRETIRDEVALORES(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATRETIRDEVALORES := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATSAIDADEPRODUTOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATSAIDADEPRODUTOS := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATSERVICOSMAISREALIZ(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATSERVICOSMAISREALIZ := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATSITUACAODOESTOQUE(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATSITUACAODOESTOQUE := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATTRANSPORTADORA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATTRANSPORTADORA := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATVENDAS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATVENDAS := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATVENDASFUNCIONARIO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATVENDASFUNCIONARIO := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELATVENDASINADIMP(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELATVENDASINADIMP := value
end;

function TEntityConfigAcessoFuncionario.getFORMRELCLIENTES(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELCLIENTES:= value
end;

function TEntityConfigAcessoFuncionario.getFORMRELCONTASAPAGAR(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELCONTASAPAGAR:= value
end;

function TEntityConfigAcessoFuncionario.getFORMRELCONTASARECEBEROS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELCONTASARECEBEROS:= value
end;

function TEntityConfigAcessoFuncionario.getFORMRELCONTASARECEBERVENDA(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELCONTASARECEBERVENDA:= value
end;

function TEntityConfigAcessoFuncionario.getFORMRELHISTORICOOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELHISTORICOOS:= value
end;

function TEntityConfigAcessoFuncionario.getFORMRELPARCELASPAGASOS(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELPARCELASPAGASOS:= value
end;

function TEntityConfigAcessoFuncionario.getFORMRELREPAROSPORPERIODO(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FFORMRELREPAROSPORPERIODO:= value;
end;

function TEntityConfigAcessoFuncionario.getFORMRELVENDASESTORNADAS(
  value: string): iNivelAcessoFuncionario;
begin
   result := self;
  FFORMRELVENDASESTORNADAS:= value;
end;

function TEntityConfigAcessoFuncionario.getFORMRETIRADADEVALORES(
  value: string): iNivelAcessoFuncionario;
begin
   result := self;
  FFORMRETIRADADEVALORES:= value;
end;

function TEntityConfigAcessoFuncionario.getFORMSAIDADEPRODUTOS(
  value: string): iNivelAcessoFuncionario;
begin
   result := self;
  FFORMSAIDADEPRODUTOS:= value;
end;

function TEntityConfigAcessoFuncionario.getFORMTIPORETIRADAS(
  value: string): iNivelAcessoFuncionario;
begin
   result := self;
  FFORMTIPORETIRADAS:= value;
end;

function TEntityConfigAcessoFuncionario.getFORMVENDAS(
  value: string): iNivelAcessoFuncionario;
begin
   result := self;
  FFORMVENDAS:= value;
end;

function TEntityConfigAcessoFuncionario.getFORMVISUALIZARVENDAS(
  value: string): iNivelAcessoFuncionario;
begin
   result := self;
  FFORMVISUALIZARVENDAS:= value;
end;

function TEntityConfigAcessoFuncionario.getFUNCIONARIO(
  value: string): iNivelAcessoFuncionario;
begin

   result := self;

   if value = EmptyStr then
    raise Exception.Create('ERRO! Informe o nome do funcion�rio');

  FFUNCIONARIO:= value;

end;

function TEntityConfigAcessoFuncionario.getID(
  value: integer): iNivelAcessoFuncionario;
begin
   result := self;
  FID:= value
end;

function TEntityConfigAcessoFuncionario.getID_FUNCIONARIO(
  value: integer): iNivelAcessoFuncionario;
begin

   result := self;

   if value = 0 then
    raise Exception.Create('ERRO! Informe c�digo funcion�rio');

  FID_FUNCIONARIO:= value

end;

function TEntityConfigAcessoFuncionario.getValor(value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FValor := UpperCase(value);
end;

function TEntityConfigAcessoFuncionario.Gravar: iNivelAcessoFuncionario;
begin

  result := self;

  if FQuery.TQuery.State in [dsInsert] then
    FQuery.TQuery.FieldByName('id').AsInteger :=
      FQuery.codigoCadastro('SP_GEN_RECURSOS_ID');

    with FQuery.TQuery do
    begin

      FieldByName('ID_FUNCIONARIO').AsInteger := FID_FUNCIONARIO;
      FieldByName('FUNCIONARIO').AsString := FFUNCIONARIO;
      FieldByName('FORMCADASTROMARCAS').AsString := FFORMCADASTROMARCAS;
      FieldByName('FORMCADASTROGRUPOS').AsString := FFORMCADASTROGRUPOS;
      FieldByName('FORMFORMAPAGAMENTO').AsString := FFORMFORMAPAGAMENTO;
      FieldByName('FORMTIPORETIRADAS').AsString := FFORMTIPORETIRADAS;
      FieldByName('FORMCONFIGPARCELAS').AsString := FFORMCONFIGPARCELAS;
      FieldByName('FORMATFUNCIONARIO').AsString :=  FFORMATFUNCIONARIO;
      FieldByName('FORMCADCONTASAPAGAR').AsString := FFORMCADCONTASAPAGAR;
      FieldByName('FORMCADPROBLEMASFREQUENTES').AsString := FFORMCADPROBLEMASFREQUENTES;
      FieldByName('FORMCADFORNECEDORES').AsString := FFORMCADFORNECEDORES;
      FieldByName('FORMCADTRANSPORTADORA').AsString := FFORMCADTRANSPORTADORA;
      FieldByName('FORMCADPRODUTOS').AsString := FFORMCADPRODUTOS;
      FieldByName('FORMCOMFUNCIONARIOS').AsString := FFORMCOMFUNCIONARIOS;
      FieldByName('FORMCADDEFUNCIONARIOS').AsString := FFORMCADDEFUNCIONARIOS;
      FieldByName('FORMCADSITUACOESORDEM').AsString := FFORMCADSITUACOESORDEM;
      FieldByName('FORMCADDECLIENTES').AsString := FFORMCADDECLIENTES;
      FieldByName('FORMENTDEPRODUTOS').AsString := FFORMENTDEPRODUTOS;
      FieldByName('FORMSAIDADEPRODUTOS').AsString := FFORMSAIDADEPRODUTOS;
      FieldByName('FORMORDEMSERVICO').AsString := FFORMORDEMSERVICO;
      FieldByName('FORMCCONSORDEMSERVICO').AsString := FFORMCCONSORDEMSERVICO;
      FieldByName('FORMCADDESERVICOS').AsString := FFORMCADDESERVICOS;
      FieldByName('FORMCADEMPRESA').AsString := FFORMCADEMPRESA;
      FieldByName('FORMVENDAS').AsString := FFORMVENDAS;
      FieldByName('FORMNUMPARCELAS').AsString := FFORMNUMPARCELAS;
      FieldByName('FORMQUITARPARCVENDAS').AsString := FFORMQUITARPARCVENDAS;
      FieldByName('FORMVISUALIZARVENDAS').AsString := FFORMVISUALIZARVENDAS;
      FieldByName('FORMRELCLIENTES').AsString := FFORMRELCLIENTES;
      FieldByName('FORMRELHISTORICOOS').AsString := FFORMRELHISTORICOOS;
      FieldByName('FORMRELCONTASARECEBEROS').AsString := FFORMRELCONTASARECEBEROS;
      FieldByName('FORMRELCONTASARECEBERVENDA').AsString := FFORMRELCONTASARECEBERVENDA;
      FieldByName('FORMRELPARCELASPAGASOS').AsString := FFORMRELPARCELASPAGASOS;
      FieldByName('FORMOSESTORNADAS').AsString := FFORMOSESTORNADAS;
      FieldByName('FORMRELVENDASESTORNADAS').AsString := FFORMRELVENDASESTORNADAS;
      FieldByName('FORMRELCONTASAPAGAR').AsString := FFORMRELCONTASAPAGAR;
      FieldByName('FORMRELREPAROSPORPERIODO').AsString := FFORMRELREPAROSPORPERIODO;
      FieldByName('FORMRELATOSPORTECNICO').AsString := FFORMRELATOSPORTECNICO;
      FieldByName('FORMRELATOSPORSTATUS').AsString := FFORMRELATOSPORSTATUS;
      FieldByName('FORMRELATORDEMDESERVICO').AsString := FFORMRELATORDEMDESERVICO;
      FieldByName('FORMRELATFORNECEDORES').AsString := FFORMRELATFORNECEDORES;
      FieldByName('FORMRELATOSINADIMPLENTES').AsString := FFORMRELATOSINADIMPLENTES;
      FieldByName('FORMRELATDEPRODUTOS').AsString := FFORMRELATDEPRODUTOS;
      FieldByName('FORMRELATSITUACAODOESTOQUE').AsString := FFORMRELATSITUACAODOESTOQUE;
      FieldByName('FORMRELATPRODVENDIDOS').AsString := FFORMRELATPRODVENDIDOS;
      FieldByName('FORMRELATVENDAS').AsString := FFORMRELATVENDAS;
      FieldByName('FORMRELATVENDASINADIMP').AsString := FFORMRELATVENDASINADIMP;
      FieldByName('FORMRELATSERVICOSMAISREALIZ').AsString := FFORMRELATSERVICOSMAISREALIZ;
      FieldByName('FORMRELATSAIDADEPRODUTOS').AsString := FFORMRELATSAIDADEPRODUTOS;
      FieldByName('FORMRELATENTRDEPRODUTOS').AsString := FFORMRELATENTRDEPRODUTOS;
      FieldByName('FORMRELATVENDASFUNCIONARIO').AsString := FFORMRELATVENDASFUNCIONARIO;
      FieldByName('FORMRELATTRANSPORTADORA').AsString := FFORMRELATTRANSPORTADORA;
      FieldByName('FORMINICIARCAIXA').AsString := FFORMINICIARCAIXA;
      FieldByName('FORMENCERRAMENTOCAIXA').AsString := FFORMENCERRAMENTOCAIXA;
      FieldByName('FORMREABERTURADECAIXA').AsString := FFORMREABERTURADECAIXA;
      FieldByName('FORMRETIRADADEVALORES').AsString := FFORMRETIRADADEVALORES;
      FieldByName('FORMRELATRETIRDEVALORES').AsString := FFORMRELATRETIRDEVALORES;
      FieldByName('FORMCOMISSOESTECNICOS').AsString := FFORMCOMISSOESTECNICOS;
      FieldByName('FORMCONFIGCONEXAOBANCO').AsString := FFORMCONFIGCONEXAOBANCO;
      FieldByName('FORMCONFIGBACKUP').AsString := FFORMCONFIGBACKUP;
      FieldByName('FORMBACKUPMANUAL').AsString := FFORMBACKUPMANUAL;
      FieldByName('FORMRELATPROBLFREQUENTES').AsString := FFORMRELATPROBLFREQUENTES;
      FieldByName('FORMRELATHISTORICOCAIXA').AsString := FFORMRELATHISTORICOCAIXA;
      FieldByName('FORMQUITARPARCELAOS').AsString := FFORMQUITARPARCELAOS;
      FieldByName('FORMMOVIMENTACAOCAIXA').AsString := FFORMMOVIMENTACAOCAIXA;
      FieldByName('ESTORNAR').AsString := FESTORNAR;
      FieldByName('ADICIONARPARCELA').AsString := FADICIONARPARCELA;
      FieldByName('EXCLUIRPARCELA').AsString := FEXCLUIRPARCELA;
      FieldByName('FORMRELATORIOPARCELASPAGASVENDA').AsString := FFORMRELATORIOPARCELASPAGASVENDA

    end;

  FGravarLog.getNomeRegistro(FQuery.TQuery.FieldByName('FUNCIONARIO')
    .AsString).getCodigoRegistro(FQuery.TQuery.FieldByName('id').AsInteger)
    .gravarLog;

  try
    FQuery.TQuery.Post;
  except
    on e: exception do
    begin
      raise exception.create('Erro ao tentar gravar os dados. ' + e.Message);
    end;

  end;

end;

function TEntityConfigAcessoFuncionario.inserir: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.TQuery.EmptyDataSet;
  FQuery.TQuery.Append;
end;

function TEntityConfigAcessoFuncionario.listarGrid(value: TDataSource): iNivelAcessoFuncionario;
begin

  result := self;

  with FQuery.TQuery do
  begin

    FieldByName('ID').Visible := false;
    FieldByName('ID_FUNCIONARIO').DisplayLabel := 'C�d. Funcion�rio';
    FieldByName('FUNCIONARIO').DisplayLabel := 'Funcion�rio';
    FieldByName('FORMCADASTROMARCAS').DisplayLabel := 'Cadastro de marcas';
    FieldByName('FORMCADASTROGRUPOS').DisplayLabel := 'Cadastro de grupos';
    FieldByName('FORMFORMAPAGAMENTO').DisplayLabel := 'Formas de pagamento';
    FieldByName('FORMTIPORETIRADAS').DisplayLabel := 'Tipo de retirada';
    FieldByName('FORMCONFIGPARCELAS').DisplayLabel := 'Configurar parcelas';
    FieldByName('FORMATFUNCIONARIO').DisplayLabel := 'Atividade funcion�rio';
    FieldByName('FORMCADCONTASAPAGAR').DisplayLabel := 'Contas a pagar';
    FieldByName('FORMCADPROBLEMASFREQUENTES').DisplayLabel := 'Cadastro de problemas';
    FieldByName('FORMCADFORNECEDORES').DisplayLabel := 'Cadastro de fornecedores';
    FieldByName('FORMCADTRANSPORTADORA').DisplayLabel := 'Cadastro de transportadora';
    FieldByName('FORMCADPRODUTOS').DisplayLabel := 'Cadastro de produtos';
    FieldByName('FORMCOMFUNCIONARIOS').DisplayLabel := 'Comiss�es funcion�rios';
    FieldByName('FORMCADDEFUNCIONARIOS').DisplayLabel := 'Cadastro de funcion�rios';
    FieldByName('FORMCADSITUACOESORDEM').DisplayLabel := 'Situa��es da ordem';
    FieldByName('FORMCADDECLIENTES').DisplayLabel := 'Cadastro de clientes';
    FieldByName('FORMENTDEPRODUTOS').DisplayLabel := 'Cadastro de produtos';
    FieldByName('FORMSAIDADEPRODUTOS').DisplayLabel := 'Sa�da de produtos';
    FieldByName('FORMORDEMSERVICO').DisplayLabel := 'Ordem de servi�o';
    FieldByName('FORMCCONSORDEMSERVICO').DisplayLabel := 'Criar OS';
    FieldByName('FORMCADDESERVICOS').DisplayLabel := 'Cadastro de servi�os';
    FieldByName('FORMCADEMPRESA').DisplayLabel := 'Cadastro de empresa';
    FieldByName('FORMVENDAS').DisplayLabel := 'Vendas';
    FieldByName('FORMNUMPARCELAS').DisplayLabel := 'N�mero de parcelas';
    FieldByName('FORMQUITARPARCVENDAS').DisplayLabel := 'Quitar parcela venda';
    FieldByName('FORMVISUALIZARVENDAS').DisplayLabel := 'Visualizar venda';
    FieldByName('FORMRELCLIENTES').DisplayLabel := 'Relat�rio de clientes';
    FieldByName('FORMRELHISTORICOOS').DisplayLabel := 'Historico OS';
    FieldByName('FORMRELCONTASARECEBEROS').DisplayLabel := 'Contas a receber OS';
    FieldByName('FORMRELCONTASARECEBERVENDA').DisplayLabel := 'Contas a receber Venda';
    FieldByName('FORMRELPARCELASPAGASOS').DisplayLabel := 'Parcelas pagas OS';
    FieldByName('FORMOSESTORNADAS').DisplayLabel := 'OS estornadas';
    FieldByName('FORMRELVENDASESTORNADAS').DisplayLabel := 'Vendas estornadas';
    FieldByName('FORMRELCONTASAPAGAR').DisplayLabel := 'Relat�rio contas a pagar';
    FieldByName('FORMRELREPAROSPORPERIODO').DisplayLabel := 'Rel. Reparos por per�odo';
    FieldByName('FORMRELATOSPORTECNICO').DisplayLabel := 'OS por t�cnicos';
    FieldByName('FORMRELATOSPORSTATUS').DisplayLabel := 'OS por status';
    FieldByName('FORMRELATORDEMDESERVICO').DisplayLabel := 'Relatorio OS';
    FieldByName('FORMRELATFORNECEDORES').DisplayLabel := 'Rel. Fornecedores';
    FieldByName('FORMRELATOSINADIMPLENTES').DisplayLabel := 'Rel. OS inadimplentes';
    FieldByName('FORMRELATDEPRODUTOS').DisplayLabel := 'Relat�rio produtos';
    FieldByName('FORMRELATSITUACAODOESTOQUE').DisplayLabel := 'Situa��o do estoque';
    FieldByName('FORMRELATPRODVENDIDOS').DisplayLabel := 'Produtos vendidos';
    FieldByName('FORMRELATVENDAS').DisplayLabel := 'Relat�rio vendas';
    FieldByName('FORMRELATVENDASINADIMP').DisplayLabel := 'Vendas inadimplentes';
    FieldByName('FORMRELATSERVICOSMAISREALIZ').DisplayLabel := 'Servi�os realizados';
    FieldByName('FORMRELATSAIDADEPRODUTOS').DisplayLabel := 'Rel. Sa�da de produtos';
    FieldByName('FORMRELATENTRDEPRODUTOS').DisplayLabel := 'Rel. Entrada de produtos';
    FieldByName('FORMRELATVENDASFUNCIONARIO').DisplayLabel := 'Rel. Vendas por funcion�rio';
    FieldByName('FORMRELATTRANSPORTADORA').DisplayLabel := 'Relat�rio transportadora';
    FieldByName('FORMINICIARCAIXA').DisplayLabel := 'Iniciar caixa';
    FieldByName('FORMENCERRAMENTOCAIXA').DisplayLabel := 'Encerramento de caixa';
    FieldByName('FORMREABERTURADECAIXA').DisplayLabel := 'Abertura de caixa';
    FieldByName('FORMRETIRADADEVALORES').DisplayLabel := 'Retirada de valores';
    FieldByName('FORMRELATRETIRDEVALORES').DisplayLabel := 'Rel. Retirada valores';
    FieldByName('FORMCOMISSOESTECNICOS').DisplayLabel := 'Comiss�es t�cnicos';
    FieldByName('FORMCONFIGCONEXAOBANCO').DisplayLabel := 'Configurar conex�o';
    FieldByName('FORMCONFIGBACKUP').DisplayLabel := 'Configurar backup';
    FieldByName('FORMBACKUPMANUAL').DisplayLabel := 'BackUp manual';
    FieldByName('FORMRELATPROBLFREQUENTES').DisplayLabel := 'Rel. Problemas frequentes';
    FieldByName('FORMRELATHISTORICOCAIXA').DisplayLabel := 'Rel. Historio caixa';
    FieldByName('FORMQUITARPARCELAOS').DisplayLabel := 'Quitar Parcelas OS';
    FieldByName('FORMMOVIMENTACAOCAIXA').DisplayLabel := 'Movimneta��o do caixa';
    FieldByName('ESTORNAR').DisplayLabel := 'Estornar';
    FieldByName('ADICIONARPARCELA').DisplayLabel := 'Adiconar parcela';
    FieldByName('EXCLUIRPARCELA').DisplayLabel := 'Excluir parcela';
    FieldByName('FORMRELATORIOPARCELASPAGASVENDA').DisplayLabel := 'Rel. Parcelas pagas vendas';

    FieldByName('FUNCIONARIO').DisplayWidth := 40;

  end;

  value.DataSet := FQuery.TQuery;

end;

class function TEntityConfigAcessoFuncionario.new: iNivelAcessoFuncionario;
begin
  result := self.create;
end;

function TEntityConfigAcessoFuncionario.nomeTabela(value: string): iNivelAcessoFuncionario;
begin
  result := self;
  FTabela := value;
end;

function TEntityConfigAcessoFuncionario.open(value: string): iNivelAcessoFuncionario;
begin
  FQuery.Query(FTabela);
end;

function TEntityConfigAcessoFuncionario.ordenarGrid(column: TColumn): iNivelAcessoFuncionario;
begin

  if FQuery.TQuery.IndexFieldNames = column.FieldName then
    FQuery.TQuery.IndexFieldNames := column.FieldName + ':D'
  else
    FQuery.TQuery.IndexFieldNames := column.FieldName;

end;

function TEntityConfigAcessoFuncionario.pesquisar: iNivelAcessoFuncionario;
begin
  result := self;
end;

function TEntityConfigAcessoFuncionario.SelectSql(
  value: string): iNivelAcessoFuncionario;
begin
  result := self;
end;

function TEntityConfigAcessoFuncionario.sqlPesquisa: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).sqlPesquisa(FTabela);
end;

function TEntityConfigAcessoFuncionario.sqlPesquisaData: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaData(FTabela);
end;

function TEntityConfigAcessoFuncionario.sqlPesquisaEstatica: iNivelAcessoFuncionario;
begin
  result := self;
  FQuery.getCampo(FCampo).getValor(FValor).getDataInicial(FDataInicial)
    .getDataFinal(FDataFinal).sqlPesquisaEstatica(FTabela);
end;

end.
