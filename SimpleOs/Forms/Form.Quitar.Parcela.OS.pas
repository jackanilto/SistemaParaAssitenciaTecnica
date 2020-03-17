unit Form.Quitar.Parcela.OS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  UInterfaces, UClasse.Entity.Quitar.Parcela.OS, UFactory;

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
    edtValorDaParcela: TEdit;
    edtJuros: TEdit;
    edtMulta: TEdit;
    edtDesconto: TEdit;
    edtPago: TEdit;
    edtDataDeVencimento: TMaskEdit;
    edtFormaDePagamento: TComboBox;
    edtTotalAPagar: TEdit;
    edtDataDePagamento: TDateTimePicker;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure e(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sbQuitarParelaClick(Sender: TObject);
  private
    { Private declarations }
    var
      FEntityQuitar: iQuitarParcelaOS;
    procedure ativarBotoes;
    procedure desativarBotoes;
  public
    { Public declarations }
  end;

var
  formQuitarParcelaOS: TformQuitarParcelaOS;

implementation

{$R *.dfm}

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
      end;


    end;
  end
  else
  begin
    desativarBotoes;
  end;

end;

procedure TformQuitarParcelaOS.ativarBotoes;
begin
  sbAdicionarParcela.Enabled := true;
  sbCancelar.Enabled := true;
  sbExcluir.Enabled := true;
  sbImprimirParcelas.Enabled := true;
  sbExportar.Enabled := true;
  sbImprimir.Enabled := true;
end;

procedure TformQuitarParcelaOS.desativarBotoes;
begin
  sbQuitarParela.Enabled := false;
  sbAdicionarParcela.Enabled := false;
  sbCancelar.Enabled := false;
  sbExcluir.Enabled := false;
  sbImprimirParcelas.Enabled := false;
  sbExportar.Enabled := false;
  sbImprimir.Enabled := false;
end;

procedure TformQuitarParcelaOS.e(Column: TColumn);
begin
  FEntityQuitar.ordenarGrid(Column);
  DataSource1.DataSet.First;
end;

procedure TformQuitarParcelaOS.FormCreate(Sender: TObject);
begin
  FEntityQuitar := TEntityQuitarParcelaOS.new;
end;

procedure TformQuitarParcelaOS.FormShow(Sender: TObject);
begin
  FEntityQuitar.abrir.listarGrid(DataSource1);

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

procedure TformQuitarParcelaOS.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformQuitarParcelaOS.sbQuitarParelaClick(Sender: TObject);
begin

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


end;

end.
