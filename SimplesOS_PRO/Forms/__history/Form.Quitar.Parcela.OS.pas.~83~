unit Form.Quitar.Parcela.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  UInterfaces, UClasse.Entity.Quitar.Parcela.OS, UFactory, frxClass, frxDBSet,
  UClasse.Preparar.Imprimir.Recibo, UClasse.Imprimir.Recibo.OS,
  UClasse.Imprimir.Parcelas.OS, UClasse.Entity.Criar.Ordem.Servico,
  UClasse.Entity.Ordem.Adicionar.Servico, UClasse.Entity.Criar.Ordem.Parcelas,
  UClasse.Entity.Table, UClasse.Visualizar.Ordens.Servico,
  UClasse.Visualizar.Ordens.Servicos.Incluidos,
  UClasse.Visualizar.Ordens.Servico.Parcelas, UClasse.Entity.Dados.Empresa,
  UClasse.Entity.Configurar.Parcelas, RxToolEdit, RxCurrEdit;

type
  TEnumPesquisar = (parcela, os, cod_cliente, cliente);

type
  TformQuitarParcelaOS = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    sbQuitarParela: TSpeedButton;
    sbEstornar: TSpeedButton;
    sbAdicionarParcela: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbExcluir: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    sbCancelar: TSpeedButton;
    sbImprimirParcelas: TSpeedButton;
    sbExportar: TSpeedButton;
    sbImprimir: TSpeedButton;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtTotalDeParcelas: TEdit;
    edtParcelaSelecionada: TEdit;
    edtPago: TEdit;
    edtDataDeVencimento: TMaskEdit;
    edtFormaDePagamento: TComboBox;
    edtDataDePagamento: TDateTimePicker;
    DataSource1: TDataSource;
    s_ImprirmirRecibo: TDataSource;
    frxDB_Imprimirrecibo: TfrxDBDataset;
    frx_ImprimirRecibo: TfrxReport;
    s_imprimirOS: TDataSource;
    s_imprimirServicosOS: TDataSource;
    s_imprimirparcelasOS: TDataSource;
    s_Empresa: TDataSource;
    frxDB_Empresa: TfrxDBDataset;
    frxDB_ListaParcelasOS: TfrxDBDataset;
    frx_ListaParcelasOS: TfrxReport;
    frxDB_ImprimirParcelasOS: TfrxDBDataset;
    frx_ImprimirParcelas: TfrxReport;
    DataSource2: TDataSource;
    s_ImprimirInfoJuros: TDataSource;
    frxDB_ImprimirInfoJuros: TfrxDBDataset;
    frxDB_ImprimirServicosOS: TfrxDBDataset;
    frxDB_ImprimirDadosEmpresa: TfrxDBDataset;
    s_ImprimirEmpresa: TDataSource;
    edtValorDaParcela: TCurrencyEdit;
    edtJuros: TCurrencyEdit;
    edtMulta: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    edtTotalAPagar: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure e(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sbQuitarParelaClick(Sender: TObject);
    procedure sbEstornarClick(Sender: TObject);
    procedure sbAdicionarParcelaClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbImprimirParcelasClick(Sender: TObject);
    procedure cbPesquisarChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    var
      FEntityQuitar: iQuitarParcelaOS;
      FEntityImprimirRecibo:iImprimirReciboPgtoParcelas;
      FEntityImprimirParcelas:iImprimirParcelasOS;

    FEntityCriarOrdem: iCriarOrdemServico;
    FEntityServicosOrdem: iAdicionarServicosOrdem;
    FEntityParcelasOrdem: iParcelaOrdem;
    FEntityTableServicos: iFDTable;

    FEntityVisualizarOS: iVisualizarOrdens;
    FEntityVisualizasOSServicos: iVisualizarServicosOrdem;
    FEntityVisualizarOSParcelas: iVisualizarParcelasOrdem;
    FEntityVisualizarEmpresa: iDadosEmpresa;
    FEntityVisualizarJuros: iConfigurarParcelas;

    procedure ativarBotoes;
    procedure desativarBotoes;
    procedure limparEditsAdicionar;
    procedure prepararParaImprimir(value: Integer);
  public
    { Public declarations }
  end;

var
  formQuitarParcelaOS: TformQuitarParcelaOS;

implementation

{$R *.dfm}

procedure TformQuitarParcelaOS.cbPesquisarChange(Sender: TObject);
begin
  edtPesquisar.SetFocus;
end;

procedure TformQuitarParcelaOS.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin

  edtTotalDeParcelas.Text := DataSource1.DataSet.FieldByName('TOTAL_PARCELAS').AsInteger.ToString;
  edtParcelaSelecionada.Text := DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger.ToString;
  edtValorDaParcela.Text := CurrToStr(DataSource1.DataSet.FieldByName('VALOR_PARCELA').AsCurrency);
  edtDataDeVencimento.Text := DateToStr(DataSource1.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime);
  edtJuros.Text := CurrToStr(DataSource1.DataSet.FieldByName('JUROS').AsCurrency);
  edtMulta.Text := CurrToStr(DataSource1.DataSet.FieldByName('MULTA').AsCurrency);
  edtDesconto.Text := CurrToStr(DataSource1.DataSet.FieldByName('DESCONTO').AsCurrency);
  edtTotalAPagar.Text := CurrToStr(DataSource1.DataSet.FieldByName('VALOR_TOTAL').AsCurrency);
  edtFormaDePagamento.Text := DataSource1.DataSet.FieldByName('FORMA_PAGAMENTO').AsString;
  edtPago.Text := DataSource1.DataSet.FieldByName('PGTO').AsString;

    if DataSource1.DataSet.FieldByName('DATA_PAGAMENTO').AsDateTime <>
      StrToDate('30/12/1899') then
      edtDataDePagamento.date := DataSource1.DataSet.FieldByName('DATA_PAGAMENTO').AsDateTime;

end;

procedure TformQuitarParcelaOS.DBGrid1CellClick(Column: TColumn);
begin

  if DataSource1.DataSet.RecordCount >= 1 then
  begin

    if DataSource1.DataSet.FieldByName('PGTO').AsString = 'Nao' then
    begin

      sbQuitarParela.Enabled := true;

      FEntityQuitar
                  .CalularPagamento
                  .setTotalParcela(edtTotalAPagar)
                  .setTotalJurosParcela(edtJuros)
                  .setTotalMultaParcela(edtMulta);

      ativarBotoes;
      sbImprimirParcelas.Enabled := true;

    end
    else
    begin

      desativarBotoes;

      if DataSource1.DataSet.FieldByName('PGTO').AsString = 'Sim' then
      begin
        sbEstornar.Enabled := true;
        sbAdicionarParcela.Enabled := true;
        sbExcluir.Enabled := true;
        sbCancelar.Enabled := true;
        sbImprimirParcelas.Enabled := true;
      end;


    end;
  end
  else
  begin
    desativarBotoes;
  end;

end;

procedure TformQuitarParcelaOS.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DataSource1.DataSet.FieldByName('PGTO').AsString = 'Sim'
  then
  begin
    DBGrid1.Canvas.Brush.Color := $00BD9111;
    DBGrid1.Canvas.Font.Color := clwhite;
  end

  else if ((DataSource1.DataSet.FieldByName('PGTO')
    .AsString = 'Nao') and (DataSource1.DataSet.FieldByName
    ('DATA_VENCIMENTO').AsDateTime >= date)) then
  begin
    DBGrid1.Canvas.Brush.Color := $0068BD05;
    DBGrid1.Canvas.Font.Color := clwhite;
  end

  else if DataSource1.DataSet.FieldByName('PGTO')
    .AsString = 'Estornada' then
  begin
    DBGrid1.Canvas.Brush.Color := $00C4C4C4;
    DBGrid1.Canvas.Font.Color := clwhite
  end

  else if ((DataSource1.DataSet.FieldByName('PGTO')
    .AsString = 'Nao') and (DataSource1.DataSet.FieldByName
    ('DATA_VENCIMENTO').AsDateTime < date)) then
  begin
    DBGrid1.Canvas.Brush.Color := $003444D1;
    DBGrid1.Canvas.Font.Color := clwhite
  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TformQuitarParcelaOS.ativarBotoes;
begin
  sbAdicionarParcela.Enabled := true;
  sbCancelar.Enabled := true;
  sbExcluir.Enabled := true;
  sbImprimirParcelas.Enabled := true;
  sbExportar.Enabled := true;
  sbImprimir.Enabled := true;
  sbSalvar.Enabled := false;
end;

procedure TformQuitarParcelaOS.desativarBotoes;
begin
  sbQuitarParela.Enabled := false;
  sbAdicionarParcela.Enabled := false;
  sbCancelar.Enabled := false;
  sbExcluir.Enabled := false;
  sbImprimirParcelas.Enabled := true;
  sbExportar.Enabled := true;
  sbImprimir.Enabled := true;
  sbSalvar.Enabled := false;
end;

procedure TformQuitarParcelaOS.limparEditsAdicionar;
begin
  edtTotalDeParcelas.Clear;
  edtParcelaSelecionada.Clear;
  edtJuros.Clear;
  edtMulta.Clear;
  edtDesconto.Clear;
  edtTotalAPagar.Clear;
  edtFormaDePagamento.Clear;
  edtPago.Clear;
  edtValorDaParcela.SetFocus;
  lblCaption.Caption := self.Caption + ' - adicionando uma parcela';

   sbAdicionarParcela.Enabled := false;
   sbEstornar.Enabled := false;
   sbSalvar.Enabled := true;
   sbExcluir.Enabled := false;
   sbCancelar.Enabled := true;
   sbImprimirParcelas.Enabled := false;
   sbExportar.Enabled := false;

end;

procedure TformQuitarParcelaOS.e(Column: TColumn);
begin
  FEntityQuitar.ordenarGrid(Column);
  DataSource1.DataSet.First;
end;

procedure TformQuitarParcelaOS.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    FCampo:string;
begin

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  parcela:
  begin
    FCampo := 'ID_PARCELA';
  end;
  os:
  begin
    FCampo := 'ID_ORDEM';
  end;
  cod_cliente:
  begin
    FCampo := 'ID_CLIENTE';
  end;
  cliente:
  begin
    FCampo := 'CLIENTE';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FEntityQuitar
                .getCampo(FCampo)
                .getValor(edtPesquisar.Text)
                .sqlPesquisa
                .listarGrid(DataSource1);

end;

procedure TformQuitarParcelaOS.FormCreate(Sender: TObject);
begin
  FEntityQuitar := TEntityQuitarParcelaOS.new;
  FEntityImprimirRecibo := TEntityImprimirReciboPgtoOS.new;
  FEntityImprimirParcelas := TEntityImprimirParcelas.new;

  FEntityCriarOrdem       := TEntityCriarOrdemServico.new;
  FEntityServicosOrdem    := TEntityAdicionarItemsOrdem.new;
  FEntityParcelasOrdem    := TEntityGerarParcelas.new;
  FEntityTableServicos    := TEntityTable.new;

  FEntityVisualizarOS     := TEntityVisualizarOrdem.new;
  FEntityVisualizasOSServicos  := TEntityVisualizarOrdemServicosIncluidos.new;
  FEntityVisualizarOSParcelas   := TEntityVisualizarOrdemServicoParcelas.new;
  FEntityVisualizarEmpresa := TEntityCadastroDadosEmpresa.new;
  FEntityVisualizarJuros := TEntityConfigurarParcelas.new;
//  FEntityImprimirRecibo := TEntityPrepararRecibo.new;

end;

procedure TformQuitarParcelaOS.FormShow(Sender: TObject);
begin

  FEntityQuitar
            .abrir
            .getCampo('ID_PARCELA')
            .getValor('0')
            .sqlPesquisa
            .listarGrid(DataSource1);

  FEntityImprimirRecibo
                    .abrir
                    .getCampo('ID_PARCELA')
                    .getValor('0')
                    .sqlPesquisa
                    .listarGrid(s_ImprirmirRecibo)
                    .selecionarEmpresa(s_Empresa);

  TFactory.new
            .ftTable.FD_Table('FORMAS_PAGAMENTO')
            .getCampoTabela('FORMA_PAGAMENTO')
            .popularComponenteComboBox(edtFormaDePagamento);

  lblCaption.Caption := self.Caption;

  edtDataDePagamento.Date := date;

end;

procedure TformQuitarParcelaOS.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TformQuitarParcelaOS.prepararParaImprimir(value: Integer);
begin

 FEntityVisualizarOS.getCampo('ID_ORDEM').getValor(value.ToString)
    .sqlPesquisaEstatica.listarGrid(s_imprimirOS);

  FEntityVisualizasOSServicos.getCampo('ID_ORDEM').getValor(value.ToString)
    .sqlPesquisaEstatica.listarGrid(s_imprimirServicosOS);

  FEntityVisualizarOSParcelas.getCampo('ID_ORDEM').getValor(value.ToString)
    .sqlPesquisaEstatica.listarGrid(s_imprimirparcelasOS);

  FEntityVisualizarEmpresa.abrir.listarGrid(s_ImprimirEmpresa);

  FEntityVisualizarJuros.abrir.listarGrid(s_ImprimirInfoJuros);

end;

procedure TformQuitarParcelaOS.sbAdicionarParcelaClick(Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('ADICIONARPARCELA');

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
   limparEditsAdicionar;
   sbSalvar.Enabled := true;
  end
  else
  raise Exception.Create('ERRO!, Não há nenhum registro selecionado.'+
                        ' Selecione um cliente antes de inserir uma parcela');

end;

procedure TformQuitarParcelaOS.sbCancelarClick(Sender: TObject);
begin
  edtTotalDeParcelas.Clear;
  edtTotalDeParcelas.Clear;
  edtParcelaSelecionada.Clear;
  edtValorDaParcela.Clear;
  edtJuros.Clear;
  edtMulta.Clear;
  edtDesconto.Clear;
  edtPago.Clear;
  edtFormaDePagamento.Clear;
  edtDataDeVencimento.Clear;
  desativarBotoes;
  sbSalvar.Enabled := false;
end;

procedure TformQuitarParcelaOS.sbEstornarClick(Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('ESTORNAR');

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    FEntityQuitar
                .estornarParcela(DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger)
                .atualizar;
  end;

end;

procedure TformQuitarParcelaOS.sbExcluirClick(Sender: TObject);
begin

  TFactory.new.criarJanela.verificarPermisao('EXCLUIRPARCELA');

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    FEntityQuitar.excluir(DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger).atualizar;
  end;

end;

procedure TformQuitarParcelaOS.sbExportarClick(Sender: TObject);
begin
  FEntityQuitar.exportar;
end;

procedure TformQuitarParcelaOS.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformQuitarParcelaOS.sbImprimirParcelasClick(Sender: TObject);
begin

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
   prepararParaImprimir(DataSource1.DataSet.FieldByName('ID_ORDEM').AsInteger);

   frx_ImprimirParcelas.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/parcelas_os.fr3');
   frx_ImprimirParcelas.ShowReport();
  end;

end;

procedure TformQuitarParcelaOS.sbQuitarParelaClick(Sender: TObject);
 var
  _cod_parcela:integer;
begin

  _cod_parcela := DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger;

  FEntityQuitar
              .getDESCONTO(edtDesconto.Text)
              .getJUROS(edtJuros.Text)
              .getMULTA(edtMulta.Text)
              .getVALOR_TOTAL(edtTotalAPagar.Text)
              .getDATA_PAGAMENTO(DateToStr(edtDataDePagamento.Date))
              .getHORA_PAGAMENTO(TimeToStr(Time))
              .getFORMA_PAGAMENTO(edtFormaDePagamento.Text)
              .getPGTO(edtPago.Text)
              .selecionarParcelaQuitar(DataSource1.DataSet.FieldByName('ID_PARCELA').AsInteger)
              .atualizar;

  if application.MessageBox('Deseja imprimir o recibo do pagamento?',
     'Pergunta do sistema!', MB_YESNO+MB_ICONQUESTION)=mryes then
     begin

      FEntityImprimirRecibo.selecionarParcela(_cod_parcela).selecionarEmpresa(s_Empresa);

        frx_ImprimirRecibo.LoadFromFile(ExtractFilePath(application.ExeName) +
            'relatórios/recibo_parcelas_os.fr3');
        frx_ImprimirRecibo.ShowReport;

     end;



end;

procedure TformQuitarParcelaOS.sbSalvarClick(Sender: TObject);
begin

  FEntityQuitar
              .getValorParcela(edtValorDaParcela.Text)
              .getDataVencimento(edtDataDeVencimento.Text)
              .adicionarParcela
              .atualizar;

   sbSalvar.Enabled := false;

  lblCaption.Caption := self.caption;

end;

end.
