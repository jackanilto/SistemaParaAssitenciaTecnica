unit Form.Retirada.De.Valores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Retirada.Valores, Vcl.Mask, UFactory,
  frxClass, frxDBSet, UClasse.Entity.Caixa;

type
  TEnumPesquisar = (codigo, codigo_motivo, motivo);

type
  TformRetiradaDeValores = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtCodRetirada: TEdit;
    cbMotivoRetirada: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtValor: TEdit;
    Label6: TLabel;
    edtData: TMaskEdit;
    edtHorario: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigoFuncionario: TEdit;
    Label9: TLabel;
    edtObservacao: TEdit;
    Label10: TLabel;
    frxDB_Retirada: TfrxDBDataset;
    frx_Retirada: TfrxReport;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure cbMotivoRetiradaChange(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbPesquisarChange(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);  private
    { Private declarations }
    var
      FEntityRetirada:iRetiradaDeValores;
      FCaixa: TEntityCaixa;

      FParcelasOS : Currency;
      FParcelasVendas : Currency;
      FEstornosOS : Currency;
      FEstornosVendas : Currency;
      FRetiradas  : Currency;
      FTotalDeAbertura  : Currency;
      FTotalCaixa:Currency;

  public
    { Public declarations }
  end;

var
  formRetiradaDeValores: TformRetiradaDeValores;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformRetiradaDeValores.cbMotivoRetiradaChange(Sender: TObject);
begin
  inherited;

  edtCodRetirada.Text := TFactory
                                .new
                                .localizarRegistroEspecifico
                                .getTabela('TIPO_RETIRADAS')
                                .getCampoRetorno('ID')
                                .localizarRegistro('TIPO_SAIDA', cbMotivoRetirada.Text);


end;

procedure TformRetiradaDeValores.cbPesquisarChange(Sender: TObject);
begin
  inherited;
  edtPesquisar.SetFocus;
end;

procedure TformRetiradaDeValores.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  with DataSource1.DataSet do
  begin
    edtCodigo.Text := FieldByName('ID').AsInteger.ToString;
    edtCodRetirada.Text := FieldByName('ID_MOTIVO').AsInteger.ToString;
    cbMotivoRetirada.Text := FieldByName('MOTIVO').AsString;
    edtValor.Text := FormatFloat('R$ #,##0.00', FieldByName('VALOR').AsCurrency);
    edtData.Text :=  DateToStr(FieldByName('DATA').AsDateTime);
    edtHorario.Text := TimeToStr(FieldByName('HORA').AsDateTime);
    edtCodigoFuncionario.Text := FieldByName('FUNCIONARIO').AsInteger.ToString;
    edtObservacao.Text := FieldByName('OBSERVACAO').AsString;
  end;

end;

procedure TformRetiradaDeValores.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    sbExcluir.Enabled := true;
  end
  else
  begin
    sbExcluir.Enabled := false;
  end;
end;

procedure TformRetiradaDeValores.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    codigo:
    begin
      FCampo := 'ID';
    end;
    codigo_motivo:
    begin
      FCampo := 'ID_MOTIVO';
    end;
    motivo:
    begin
      FCampo := 'MOTIVO';
    end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FEntityRetirada
                  .getCampo(FCampo)
                  .getValor(edtPesquisar.Text)
                  .sqlPesquisa
                  .listarGrid(DataSource1);

end;

procedure TformRetiradaDeValores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 FreeAndNil(FCaixa);
end;

procedure TformRetiradaDeValores.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityRetirada := TEntityRetiradaValores.new;
  FCaixa := TEntityCaixa.create;
  dllSoftMeter.sendEvent('retiradas de valores do caixa', 'retirada valores', 0);
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformRetiradaDeValores.FormShow(Sender: TObject);
var
  FTotal: Currency;
begin
  inherited;

  FEntityRetirada
                .abrir
                .getCampo('ID')
                .getValor('0')
                .sqlPesquisa
                .listarGrid(DataSource1);

  TFactory.new
            .ftTable
            .FD_Table('TIPO_RETIRADAS')
            .getCampoTabela('TIPO_SAIDA')
            .popularComponenteComboBox(cbMotivoRetirada);

  FCaixa.infomarUltimaData(date);

  FParcelasOS := FCaixa.calcularParcelasOS;
  FParcelasVendas := FCaixa.calcularParcelasVendas;
  FEstornosOS := FCaixa.calcularEstornosOS;
  FEstornosVendas := FCaixa.calcularEstornoVendas;
  FRetiradas := FCaixa.calcularRetiradas;
  FTotalDeAbertura := FCaixa.valorCaixaEmAberto;

  FTotal := (FParcelasOS + FParcelasVendas);
  FTotal := (FTotal + FTotalDeAbertura) - FRetiradas;

  FTotalCaixa := FTotal;

  label11.Caption := FormatFloat('R$ #,##0.00', FTotal);

end;

procedure TformRetiradaDeValores.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityRetirada.cancelar;
end;

procedure TformRetiradaDeValores.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityRetirada.deletar;
end;

procedure TformRetiradaDeValores.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntityRetirada.exportar;
end;

procedure TformRetiradaDeValores.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frx_Retirada.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relatórios/relatorio_retirada_valores.fr3');
  frx_Retirada.ShowReport();
end;

procedure TformRetiradaDeValores.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityRetirada.inserir;
  cbMotivoRetirada.SetFocus;
  edtData.Text := DateToStr(Date);
  edtHorario.Text := TimeToStr(Time);
end;

procedure TformRetiradaDeValores.sbSalvarClick(Sender: TObject);
var
  valor:string;
  vlrRetirada:Currency;
begin

  valor := TFactory.new.validarDocumento.limparValorRS(edtValor.Text);

  vlrRetirada := StrToCurr(valor);

  if vlrRetirada > FTotalCaixa then
    raise Exception.Create('ERRO! A valor da retirada e superior ao valor em caixa no momento');

  FEntityRetirada
                .getID_MOTIVO(edtCodRetirada.Text)
                .getMOTIVO(cbMotivoRetirada.Text)
                .getVALOR_RETIRADA(valor)
                .getDATA(edtData.Text)
                .getHORA(edtHorario.Text)
                .getOBSERVACAO(edtObservacao.Text)
                .gravar;

   inherited;

end;

end.
