unit Form.Saidas.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Saidas.Produtos, Vcl.Mask,
  Form.Localizar.Produtos.Saidas, UFactory, frxClass, frxDBSet, RxToolEdit,
  RxCurrEdit;

type
  TformSaidaDeProdutos = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtCodigoProduto: TEdit;
    edtProduto: TEdit;
    edtQuantidade: TEdit;
    edtFuncionario: TEdit;
    edtObservacao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    sbPesquisarProduto: TSpeedButton;
    edtData: TMaskEdit;
    Label11: TLabel;
    edtHora: TMaskEdit;
    Label12: TLabel;
    edtMotivo: TEdit;
    Label13: TLabel;
    frxDB_SaidasProdutos: TfrxDBDataset;
    frx_SaidasProdutos: TfrxReport;
    edtValorProduto: TCurrencyEdit;
    edtTotal: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbPesquisarProdutoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FEntitySaida: iSaidaDeProdutos;
  public
    { Public declarations }
  end;

var
  formSaidaDeProdutos: TformSaidaDeProdutos;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformSaidaDeProdutos.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin
    edtCodigo.Text := inttostr(FieldByName('ID').AsInteger);
    edtCodigoProduto.Text := inttostr(FieldByName('ID_PRODUTO').AsInteger);
    edtProduto.Text := FieldByName('PRODUTOS').AsString;
    edtValorProduto.Text := CurrToStr(FieldByName('VALOR').AsCurrency);
    edtQuantidade.Text := inttostr(FieldByName('QUANTIDADE').AsInteger);
    edtTotal.Text := CurrToStr(FieldByName('TOTAL').AsCurrency);
    edtMotivo.Text := FieldByName('MOTIVO').AsString;
    edtFuncionario.Text := inttostr(FieldByName('FUNCIONARIO').AsInteger);
    edtObservacao.Text := FieldByName('OBSERVACAO').AsString;

    if FieldByName('DATA').AsDateTime <> StrToDate('30/12/1899') then
    begin
      edtData.Text := DateToStr(FieldByName('DATA').AsDateTime);
      edtHora.Text := TimeToStr(FieldByName('HORA').AsDateTime);
    end;
  end;

end;

procedure TformSaidaDeProdutos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
    sbExcluir.Enabled := true
  else
    sbExcluir.Enabled := false;
end;

procedure TformSaidaDeProdutos.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntitySaida.ordenarGrid(Column);
end;

procedure TformSaidaDeProdutos.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  campo: string;
begin
  inherited;

  if cbPesquisar.Text = 'C�digo' then
    campo := 'ID'
  else if cbPesquisar.Text = 'C�digo do produto' then
    campo := 'ID_PRODUTO'
  else if cbPesquisar.Text = 'Produto' then
    campo := 'PRODUTOS';

  if edtPesquisar.Text <> EmptyStr then
    FEntitySaida.getCampo(campo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1);

  { C�digo
    C�digo do produto
    Produto }
end;

procedure TformSaidaDeProdutos.edtQuantidadeExit(Sender: TObject);
var
  valorEntrada: currency;
  quantidade: integer;
begin
  inherited;

  try
    valorEntrada := StrToCurr(edtValorProduto.Text);
  except
    on e: exception do
      raise exception.Create('Informe um valor v�lido para da entrada.');
  end;

  try
    quantidade := StrToInt(edtQuantidade.Text);
  except
    on e: exception do
      raise exception.Create('Informe um valor v�lido para a quantidade.');
  end;

  edtTotal.Text := CurrToStr(valorEntrada * quantidade);

end;

procedure TformSaidaDeProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FEntitySaida := TEntitySaidasProdutos.new;
  dllSoftMeter.sendEvent('saidas de produtos', 'saidas produtos', 0);
end;

procedure TformSaidaDeProdutos.FormShow(Sender: TObject);
begin
  inherited;
  FEntitySaida.abrir.getCampo('ID').getValor('0').sqlPesquisa.listarGrid
    (DataSource1);
end;

procedure TformSaidaDeProdutos.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntitySaida.cancelar;
end;

procedure TformSaidaDeProdutos.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntitySaida.deletar;
end;

procedure TformSaidaDeProdutos.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntitySaida.exportar;
end;

procedure TformSaidaDeProdutos.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frx_SaidasProdutos.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/relatorio_saidas_produtos.fr3');
  frx_SaidasProdutos.ShowReport();
end;

procedure TformSaidaDeProdutos.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntitySaida.inserir;
  edtData.Text := DateToStr(date);
  edtHora.Text := TimeToStr(time);
end;

procedure TformSaidaDeProdutos.sbPesquisarProdutoClick(Sender: TObject);
begin
  inherited;
  if sbNovo.Enabled = false then
  begin
    FormLocalizarProdutosSaida := TFormLocalizarProdutosSaida.Create(self);
    try
      FormLocalizarProdutosSaida.ShowModal;
    finally
      FormLocalizarProdutosSaida.Free;
    end;
  end;
end;

procedure TformSaidaDeProdutos.sbSalvarClick(Sender: TObject);
begin

  FEntitySaida
    .getID_PRODUTO(StrToInt(edtCodigoProduto.Text))
    .getPRODUTOS(edtProduto.Text)
    .getVALORPRODUTO(StrToCurr(edtValorProduto.Text))
    .getQUANTIDADE(StrToInt(edtQuantidade.Text))
    .getTOTAL(StrToCurr(edtTotal.Text))
    .getDATA(edtData.Text)
    .getHORA(edtHora.Text).getObservacao(edtObservacao.Text)
    .getCodigoProdutoAtualizar(StrToInt(edtCodigoProduto.Text))
    .getQuantidadeProdutoAtualizar(StrToInt(edtQuantidade.Text))
    .getMotivo(edtMotivo.Text).gravar.atualizarEstoque;
  inherited;

end;

end.
