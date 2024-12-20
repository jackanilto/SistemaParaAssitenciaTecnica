unit Form.Entradas.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Entradas.Produtos, Vcl.Mask,
  UFactory, frxClass, frxDBSet, RxToolEdit, RxCurrEdit;

type
  TEnumPesquisar = (cod_entrada, cod_produto, produto);

type
  TformEntradaDeProdutos = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtCodigoDoProduto: TEdit;
    edtProduto: TEdit;
    edtQuantidade: TEdit;
    edtNumeroNota: TEdit;
    edtFuncionario: TEdit;
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
    edtObsrvacao: TEdit;
    Label13: TLabel;
    sbPesquisarProduto: TSpeedButton;
    edtData: TMaskEdit;
    edtHora: TMaskEdit;
    frxDB_EntradasProdutos: TfrxDBDataset;
    frx_EntradasProdutos: TfrxReport;
    edtValorPorItens: TCurrencyEdit;
    edtTotalDaEntrada: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbNovoClick(Sender: TObject);
    procedure sbPesquisarProdutoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sbExportarClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
  private
    { Private declarations }
    FEntityEntradas: iEntradaProdutos;
  public
    { Public declarations }
  end;

var
  formEntradaDeProdutos: TformEntradaDeProdutos;

implementation

{$R *.dfm}

uses Form.Localizar.Produtos.Entrada, softMeter_globalVar;

procedure TformEntradaDeProdutos.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin
    edtCodigo.Text := inttostr(FieldByName('ID').AsInteger);
    edtCodigoDoProduto.Text := inttostr(FieldByName('ID_PRODUTO').AsInteger);
    edtProduto.Text := FieldByName('PRODUTO').AsString;
    edtValorPorItens.Text := CurrToStr(FieldByName('VALOR_POR_ITENS')
      .AsCurrency);
    edtQuantidade.Text := inttostr(FieldByName('QUANTIDADE').AsInteger);
    edtTotalDaEntrada.Text := CurrToStr(FieldByName('TOTAL_DA_ENTRADA')
      .AsCurrency);
    edtNumeroNota.Text := FieldByName('NUMERO_NOTA').AsString;
    edtFuncionario.Text := inttostr(FieldByName('FUNCIONARIO').AsInteger);

    edtObsrvacao.Text := FieldByName('OBSERVACAO').AsString;

    if FieldByName('DATA').AsDateTime <> StrToDate('30/12/1899') then
    begin
      edtData.Text := DateToStr(FieldByName('DATA').AsDateTime);
      edtHora.Text := TimeToStr(FieldByName('HORA').AsDateTime);
    end
    else
    begin
      edtData.Clear;
      edtHora.Clear;
    end;

  end;
end;

procedure TformEntradaDeProdutos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;
  end
  else
  begin
    sbEditar.Enabled := false;
    sbExcluir.Enabled := false;
  end;
end;

procedure TformEntradaDeProdutos.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityEntradas.ordenarGrid(Column);
end;

procedure TformEntradaDeProdutos.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FCampo: string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  cod_entrada:
  begin
    FCampo := 'ID';
  end;
  cod_produto:
  begin
    FCampo := 'ID_PRODUTO';
  end;
  produto:
  begin
    FCampo := 'PRODUTO';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FEntityEntradas
                  .getCampo(FCampo)
                  .getValor(edtPesquisar.Text)
                  .sqlPesquisa
                  .listarGrid(DataSource1);

end;

procedure TformEntradaDeProdutos.edtQuantidadeExit(Sender: TObject);
var
  valorEntrada: currency;
  quantidade: integer;
begin
  inherited;

  try
    valorEntrada := StrToCurr(edtValorPorItens.Text);
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

  edtTotalDaEntrada.Text := CurrToStr(valorEntrada * quantidade);

end;

procedure TformEntradaDeProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityEntradas := TEntityEntradasProdutos.new;
  dllSoftMeter.sendEvent('entradas de produtos', 'entrada', 0);
end;

procedure TformEntradaDeProdutos.FormShow(Sender: TObject);
begin
  inherited;

  FEntityEntradas
              .abrir
              .getCampo('ID')
              .getValor('0')
              .sqlPesquisa
              .listarGrid(DataSource1);
end;

procedure TformEntradaDeProdutos.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityEntradas.cancelar;
end;

procedure TformEntradaDeProdutos.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityEntradas.deletar;
end;

procedure TformEntradaDeProdutos.sbExportarClick(Sender: TObject);
begin
  inherited;
  FEntityEntradas.exportar;
end;

procedure TformEntradaDeProdutos.sbImprimirClick(Sender: TObject);
begin
  inherited;
  frx_EntradasProdutos.LoadFromFile(ExtractFilePath(application.ExeName) +
    'relat�rios/relatorio_entradas_produtos.fr3');
  frx_EntradasProdutos.ShowReport();
end;

procedure TformEntradaDeProdutos.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityEntradas.inserir;
  edtData.Text := DateToStr(date);
  edtHora.Text := TimeToStr(time);
end;

procedure TformEntradaDeProdutos.sbPesquisarProdutoClick(Sender: TObject);
begin
  inherited;
  if sbNovo.Enabled = false then
  begin
    formLocalizarProdutosEntradas := TformLocalizarProdutosEntradas.Create(self);
    try
      formLocalizarProdutosEntradas.ShowModal;
    finally
      formLocalizarProdutosEntradas.Free;
    end;
  end;
end;

procedure TformEntradaDeProdutos.sbSalvarClick(Sender: TObject);
begin

  FEntityEntradas.getID_PRODUTO(StrToInt(edtCodigoDoProduto.Text))
    .getProduto(edtProduto.Text).getVALOR_POR_ITENS
    (StrToCurr(edtValorPorItens.Text))
    .getQUANTIDADE(StrToInt(edtQuantidade.Text)).getTOTAL_DA_ENTRADA
    (StrToCurr(edtTotalDaEntrada.Text)).getNUMERO_NOTA(edtNumeroNota.Text)
    .getDATA(edtData.Text).getHORA(edtHora.Text).getCodigoProdutoAtualizar
    (StrToInt(edtCodigoDoProduto.Text)).getQuantidadeProdutoAtualizar
    (StrToInt(edtQuantidade.Text)).getObservacao(edtObsrvacao.Text)
    .gravar.atualizarEstoque;

  inherited;

end;

end.
