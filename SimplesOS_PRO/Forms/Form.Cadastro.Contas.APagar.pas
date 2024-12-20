unit Form.Cadastro.Contas.APagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UInterfaces, UClasse.Entity.Contas.APagar,
  Vcl.Mask, frxClass, frxDBSet, RxToolEdit, RxCurrEdit;

type
  TformCadastroContasAPagar = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtConta: TEdit;
    Label2: TLabel;
    edtDataVencimento: TMaskEdit;
    Label3: TLabel;
    Label6: TLabel;
    edtJuros: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtDataPagamento: TMaskEdit;
    Label12: TLabel;
    edtFuncionario: TEdit;
    Label13: TLabel;
    edtObservacao: TEdit;
    Label14: TLabel;
    edtPgto: TComboBox;
    edtData1: TMaskEdit;
    Label15: TLabel;
    edtData2: TMaskEdit;
    sbPesquisarDatas: TSpeedButton;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    edtValorConta: TCurrencyEdit;
    edtMulta: TCurrencyEdit;
    edtDesconto: TCurrencyEdit;
    edtValorTotal: TCurrencyEdit;
    sbQuitarConta: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbNovoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbPesquisarDatasClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure edtDataVencimentoExit(Sender: TObject);
    procedure edtDataPagamentoExit(Sender: TObject);
    procedure edtValorContaExit(Sender: TObject);
    procedure sbQuitarContaClick(Sender: TObject);
  private
    { Private declarations }
    FEntityContaPagar: iCadastroContasAPagar;
  public
    { Public declarations }
  end;

var
  formCadastroContasAPagar: TformCadastroContasAPagar;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformCadastroContasAPagar.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  edtCodigo.Text := inttostr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  edtConta.Text := DataSource1.DataSet.FieldByName('CONTA').AsString;
  edtValorConta.Text := Floattostr(DataSource1.DataSet.FieldByName('VALOR')
    .AsCurrency);
  edtJuros.Text := Floattostr(DataSource1.DataSet.FieldByName('JUROS').AsFloat);
  edtMulta.Text := CurrToStr(DataSource1.DataSet.FieldByName('MULTA')
    .AsCurrency);
  edtDesconto.Text := CurrToStr(DataSource1.DataSet.FieldByName('DESCONTO')
    .AsCurrency);
  edtValorTotal.Text := CurrToStr(DataSource1.DataSet.FieldByName('VALOR_TOTAL')
    .AsCurrency);
  edtPgto.Text := DataSource1.DataSet.FieldByName('PAGO').AsString;
  edtFuncionario.Text :=
    inttostr(DataSource1.DataSet.FieldByName('FUNCIONARIO_CADASTRO').AsInteger);
  edtObservacao.Text := DataSource1.DataSet.FieldByName('OBSERVACAO').AsString;

  if DataSource1.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime <>
    StrToDate('30/12/1899') then
    edtDataVencimento.Text :=
      datetostr(DataSource1.DataSet.FieldByName('DATA_VENCIMENTO').AsDateTime);

  if DataSource1.DataSet.FieldByName('PAGO').AsString = 'Sim' then
    edtDataPagamento.Text :=
      datetostr(DataSource1.DataSet.FieldByName('DATA_PAGAMENTO').AsDateTime)
  else
    edtDataPagamento.Clear;

end;

procedure TformCadastroContasAPagar.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;

    if DataSource1.DataSet.FieldByName('PAGO').AsString <> 'Sim' then
    begin
      sbQuitarConta.Enabled := true;
      sbEditar.Enabled := true;
    end
    else
    begin
      sbQuitarConta.Enabled := false;
      sbEditar.Enabled := false;
    end;
  end
  else
  begin
    sbEditar.Enabled := false;
    sbExcluir.Enabled := false;
    sbQuitarConta.Enabled := false;
  end;

end;

procedure TformCadastroContasAPagar.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityContaPagar.ordenarGrid(Column);
end;

procedure TformCadastroContasAPagar.edtDataPagamentoExit(Sender: TObject);
begin
  inherited;
  validarData(edtDataPagamento);
end;

procedure TformCadastroContasAPagar.edtDataVencimentoExit(Sender: TObject);
begin
  inherited;
  validarData(edtDataVencimento);
end;

procedure TformCadastroContasAPagar.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  campo: string;
begin
  inherited;

  if cbPesquisar.Text = 'C�digo' then
    campo := 'ID'
  else if cbPesquisar.Text = 'Conta' then
    campo := 'CONTA';

  FEntityContaPagar.getCampo(campo).getValor(edtPesquisar.Text)
    .sqlPesquisa.listarGrid(DataSource1);

  { C�digo
    Conta }
end;

procedure TformCadastroContasAPagar.edtValorContaExit(Sender: TObject);
begin
  inherited;
  edtValorTotal.Text := edtValorConta.Text;
end;

procedure TformCadastroContasAPagar.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityContaPagar := TEntityContasAPagar.new;
  dllSoftMeter.sendEvent('cadastro de contas a pagar', 'contas a pagar', 0);
end;

procedure TformCadastroContasAPagar.FormShow(Sender: TObject);
begin
  inherited;
  FEntityContaPagar.abrir.getCampo('ID').getValor('0').sqlPesquisa.listarGrid
    (DataSource1);
end;

procedure TformCadastroContasAPagar.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityContaPagar.cancelar;
  sbQuitarConta.Enabled := false;
end;

procedure TformCadastroContasAPagar.sbEditarClick(Sender: TObject);
begin

  FEntityContaPagar.editar;
  inherited;
  edtConta.SetFocus;

end;

procedure TformCadastroContasAPagar.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityContaPagar.deletar;
end;

procedure TformCadastroContasAPagar.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntityContaPagar.exportar;
end;

procedure TformCadastroContasAPagar.sbImprimirClick(Sender: TObject);
begin
  inherited;

  frxReport1.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/relatorio_contas_pagar_simples.fr3');
  frxReport1.ShowReport();

  { relatorio_contas_pagar_simples }
end;

procedure TformCadastroContasAPagar.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityContaPagar.inserir;
  edtConta.SetFocus;
  edtDataVencimento.Clear;
  edtDataPagamento.Clear;
end;

procedure TformCadastroContasAPagar.sbPesquisarDatasClick(Sender: TObject);
begin
  inherited;
  FEntityContaPagar.getDataInicial(StrToDate(edtData1.Text))
    .getDataFinal(StrToDate(edtData2.Text)).getCampo('DATA_VENCIMENTO')
    .sqlPesquisaData.listarGrid(DataSource1);
end;

procedure TformCadastroContasAPagar.sbQuitarContaClick(Sender: TObject);
begin
  inherited;

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    if DataSource1.DataSet.FieldByName('PAGO').AsString = 'Nao' then
     begin
      FEntityContaPagar
                      .getJurosConta(edtJuros.Text)
                      .getMulta(edtMulta.Text)
                      .getDesconto(edtDesconto.Text)
                      .getValorTotalConta(edtValorTotal.Text)
                      .getDataPagamento(edtDataPagamento.Text)
                      .getObservacao(edtObservacao.Text)
                      .quitarParcela;

        sbNovo.Enabled := true;
        sbSalvar.Enabled := false;
        sbEditar.Enabled := false;
        sbCancelar.Enabled := false;
        sbQuitarConta.Enabled := false;

        CardPanel1.ActiveCard := cardPanelConsulta;
        pnlFocoCadastro.Visible := true;
        pnlFocoConsulta.Visible := true;
        lblCadastro.Enabled := true;
        lblConsulta.Enabled := true;

  end;
  end;


end;

procedure TformCadastroContasAPagar.sbSalvarClick(Sender: TObject);
begin
  FEntityContaPagar
                .getConta(edtConta.Text)
                .getDataVencimento(edtDataVencimento.Text)
                .getValorConta(edtValorConta.Text)
                .getJurosConta(edtJuros.Text)
                .getMulta(edtMulta.Text)
                .getDesconto(edtDesconto.Text)
                .getValorTotalConta(edtValorTotal.Text)
                .getDataPagamento(edtDataPagamento.Text)
                .getPGTO(edtPgto.Text)
                .getObservacao(edtObservacao.Text)
                .gravar;
  inherited;
end;

end.
