unit Form.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Form.Localizar.Clientes.Venda, UClasse.Entity.Localizar.Cliente.Venda,
  UInterfaces, Form.Localizar.Produtos.Venda, Datasnap.DBClient,
  UClasse.Entity.Itens.Venda, UClasse.Entity.Localizar.Produto.Venda,
  UClasse.Venda, Form.Venda.Confirmar.Pagamento, UClasse.Venda.Parcelas,
  Vcl.Imaging.pngimage, MidasLib, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TformVendas = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    sbNovo: TSpeedButton;
    sbCancelar: TSpeedButton;
    lblVenda: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    edtLocalizarCPF: TEdit;
    Label3: TLabel;
    lblNomeDoCliente: TLabel;
    sbLocalizarCliente: TSpeedButton;
    Panel5: TPanel;
    edtLocalizarProduto: TEdit;
    sbLocalizarProduto: TSpeedButton;
    lblProduto: TLabel;
    Image1: TImage;
    Label6: TLabel;
    edtQuantidade: TEdit;
    Label7: TLabel;
    sbAdicionarProduto: TSpeedButton;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    sbExcluirItem: TSpeedButton;
    sbFinalizarVenda: TSpeedButton;
    Label8: TLabel;
    lblTotalItens: TLabel;
    lblTotalDaVenda: TLabel;
    Label11: TLabel;
    cds_tem_produtos: TClientDataSet;
    cds_tem_produtoscodigo_produto: TIntegerField;
    cds_tem_produtosProduto: TStringField;
    cds_tem_produtosValor_unitario: TCurrencyField;
    cds_tem_produtosQuantidade: TIntegerField;
    cds_tem_produtosTotal_do_produto: TCurrencyField;
    S_temp_produtos: TDataSource;
    Label4: TLabel;
    lblOperador: TLabel;
    Label9: TLabel;
    edtValorUnitario: TCurrencyEdit;
    edtTotalDoProduto: TCurrencyEdit;
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbFecharClick(Sender: TObject);
    procedure sbLocalizarClienteClick(Sender: TObject);
    procedure edtLocalizarCPFKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure sbLocalizarProdutoClick(Sender: TObject);
    procedure sbAdicionarProdutoClick(Sender: TObject);
    procedure edtQuantidadeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtLocalizarProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbExcluirItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbFinalizarVendaClick(Sender: TObject);

    procedure limparDados;
    procedure sbCancelarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocalizarCPFExit(Sender: TObject);

  private
    { Private declarations }
    FLocalizarClienteVenda: iLocalizarClienteVenda;
    FLocalizarProdutoVenda: iLocalizarProdutosVenda;
    procedure calcularTotalPorQuantidade;
  public
    { Public declarations }
  end;

var
  formVendas: TformVendas;

  FEntityVenda: iVenda;
  FEntityItensVenda: iItensVendas;
  FentityParcelas: iParcelasVendas;

  CodigoCliente: Integer;
  NomeCliente: string;
  CPF_CNPJ_Cliente: string;

  CodigoDoProduto: Integer;
  NomeDoProduto: string;
  CodigoDeBarras: string;
  QuantidadeDeProdutos: Integer;
  QuantidadeEmEstoque: Integer;
  SituacaoDoEstoque: string;
  valorUnitario: Currency;
  valorTotalDoProduto: Currency;
  TotalDeItens: Integer;
  TotalDaVenda: Currency;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformVendas.edtLocalizarCPFExit(Sender: TObject);
begin

  // if CodigoCliente = 0 then
  // edtLocalizarProduto.Enabled := false
  // else
  // edtLocalizarProduto.Enabled := true;

end;

procedure TformVendas.edtLocalizarCPFKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = 13 then
  begin

    if UpperCase(edtLocalizarCPF.Text) = 'AA' then
    begin
      lblNomeDoCliente.Caption := 'Cliente n�o informado';
      edtLocalizarCPF.Text := '000.000.000-00';
      edtLocalizarProduto.SetFocus;
      CodigoCliente := 0;
      NomeCliente := 'Cliente n�o informado';
      lblVenda.Caption := 'Venda em andamento';

      sbNovo.Enabled := false;
      sbLocalizarCliente.Enabled := false;
      edtLocalizarCPF.Enabled := false;
    end
    else
    begin

      FLocalizarClienteVenda.getCampo('CPF_CNPJ').getValor(edtLocalizarCPF.Text)
        .sqlPesquisa;

      edtLocalizarCPF.Text := FLocalizarClienteVenda.setCpf_CnpjDoCliente;
      lblNomeDoCliente.Caption := FLocalizarClienteVenda.setNomeDoCliente;

      CodigoCliente := StrToInt(FLocalizarClienteVenda.setCodigoDoCliente);

      if CodigoCliente <> 0 then
      begin

        NomeCliente := FLocalizarClienteVenda.setNomeDoCliente;
        CPF_CNPJ_Cliente := FLocalizarClienteVenda.setCpf_CnpjDoCliente;
        edtLocalizarProduto.SetFocus;
        lblVenda.Caption := 'Venda em andamento';

        sbLocalizarCliente.Enabled := false;
        sbNovo.Enabled := false;
        sbLocalizarCliente.Enabled := false;
        edtLocalizarCPF.Enabled := false;

      end
      else
      begin
        sbNovo.Enabled := true;
        sbLocalizarCliente.Enabled := true;
        edtLocalizarCPF.Enabled := true;
      end;

    end;
  end;
end;

procedure TformVendas.edtLocalizarProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if lblVenda.Caption <> 'Nova venda' then
  begin

    CodigoDoProduto := 0;

    if Key = 13 then
    begin
      FLocalizarProdutoVenda.getCampo('CODIGO_BARRAS')
        .getValor(edtLocalizarProduto.Text).sqlPesquisa;

      SituacaoDoEstoque := FLocalizarProdutoVenda.setSituacaoDoEstoque;
      CodigoDoProduto := FLocalizarProdutoVenda.setCodigoDoProduto;
      NomeDoProduto := FLocalizarProdutoVenda.setNomeDoProduto;
      CodigoDeBarras := FLocalizarProdutoVenda.setCodigoDeBarras;
      QuantidadeDeProdutos := FLocalizarProdutoVenda.setQuantidade;
      QuantidadeEmEstoque := FLocalizarProdutoVenda.setQuantidadeEmEstoque;
      FLocalizarProdutoVenda.setFotoProduto(formVendas.Image1);
      valorUnitario := FLocalizarProdutoVenda.setValorUnitarioProduto;
      valorTotalDoProduto := FLocalizarProdutoVenda.setValorUnitarioProduto;

      edtLocalizarProduto.Text := CodigoDeBarras;
      edtQuantidade.Text := inttostr(QuantidadeDeProdutos);
      edtValorUnitario.Text := CurrToStr(valorUnitario);
      edtTotalDoProduto.Text := CurrToStr(valorTotalDoProduto);
      lblProduto.Caption := NomeDoProduto;
      edtQuantidade.SetFocus;

    end;
  end;
end;

procedure TformVendas.calcularTotalPorQuantidade;
var
  total: Currency;
  qtdeNalista: Integer;
  qtdeInformada: Integer;
begin

  qtdeInformada := StrToInt(edtQuantidade.Text);

  qtdeNalista := 0;

  cds_tem_produtos.Open;
  cds_tem_produtos.First;
  cds_tem_produtos.DisableControls;
  cds_tem_produtos.Locate('codigo_produto', CodigoDoProduto, []);
  qtdeNalista := cds_tem_produtos.FieldByName('Quantidade').AsInteger;
  cds_tem_produtos.EnableControls;

  if cds_tem_produtos.FieldByName('codigo_produto').AsInteger = CodigoDoProduto then
    qtdeInformada := qtdeInformada + qtdeNalista;

  if qtdeInformada > QuantidadeEmEstoque then
  begin
    edtQuantidade.SetFocus;
    raise Exception.Create
      ('ERRO! N�o h� produtos no estoque suficiente para esta venda. Escolha uma quantidade menor.');
  end;

  total := FEntityItensVenda.calularTotalXquantidade(edtQuantidade, edtValorUnitario);
  valorTotalDoProduto := total;
  edtTotalDoProduto.Text := CurrToStr(total);
  QuantidadeDeProdutos := StrToInt(edtQuantidade.Text);
end;

procedure TformVendas.edtQuantidadeExit(Sender: TObject);
begin

  // calcularTotalPorQuantidade;

end;

procedure TformVendas.edtQuantidadeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin

    calcularTotalPorQuantidade;

  end;
end;

procedure TformVendas.FormCreate(Sender: TObject);
begin

  FLocalizarClienteVenda := TEntityPesquisarCliente.new;
  FLocalizarProdutoVenda := TEntityLocalizarProdutoVenda.new;
  FEntityVenda := TEntityVenda.new;
  FEntityItensVenda := TEntityItensVenda.new;
  FentityParcelas := TEntityVendasParcelas.new;

  CodigoCliente := 0;
  NomeCliente := 'Cliente n�o informado';

  dllSoftMeter.sendEvent('vendas de produtos', 'venda', 0);

end;

procedure TformVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 113 then // F2
    if sbLocalizarCliente.Enabled = true then
    begin
      sbLocalizarCliente.Click;
    end;

  if Key = 114 then // F3
    if sbLocalizarProduto.Enabled = true then
    begin
      sbLocalizarProduto.Click;
    end;

  if Key = 115 then // F4
    if sbAdicionarProduto.Enabled = true then
    begin
      sbAdicionarProduto.Click;
    end;

  if Key = 116 then // F5
    if sbFinalizarVenda.Enabled = true then
    begin
      sbFinalizarVenda.Click;
    end;

  if Key = 117 then // F6
    if sbExcluirItem.Enabled = true then
    begin
      sbExcluirItem.Click;
    end;

  if Key = 118 then // F7
    if sbCancelar.Enabled = true then
    begin
      sbCancelar.Click;
    end;

end;

procedure TformVendas.FormShow(Sender: TObject);
begin
  lblOperador.Caption := FEntityVenda.setNomeFuncionario;
end;

procedure TformVendas.limparDados;
begin

  CodigoCliente := 0;
  NomeCliente := 'Cliente n�o informado';
  CPF_CNPJ_Cliente := '';

  CodigoDoProduto := 0;
  NomeDoProduto := '';
  CodigoDeBarras := '';
  QuantidadeDeProdutos := 0;
  QuantidadeEmEstoque := 0;
  SituacaoDoEstoque := '';
  valorUnitario := 0;
  valorTotalDoProduto := 0;
  TotalDeItens := 0;
  TotalDaVenda := 0;

  cds_tem_produtos.Open;
  cds_tem_produtos.EmptyDataSet;
  cds_tem_produtos.Close;
  cds_tem_produtos.Open;

  lblVenda.Caption := 'Nova venda';
  lblNomeDoCliente.Caption := '';
  lblProduto.Caption := '';
  lblTotalItens.Caption := '0';
  lblTotalDaVenda.Caption := 'R$ 0,00';

  edtLocalizarCPF.Enabled := true;
  edtLocalizarCPF.Clear;
  edtLocalizarProduto.Clear;
  edtValorUnitario.Clear;
  edtQuantidade.Clear;
  edtTotalDoProduto.Clear;

  sbLocalizarCliente.Enabled := true;
  sbNovo.Enabled := true;

end;

procedure TformVendas.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TformVendas.sbCancelarClick(Sender: TObject);
begin
  if application.MessageBox('Deseja realemente cancelar esta Venda?',
    'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = mryes then
  begin
    limparDados;
  end;
end;

procedure TformVendas.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformVendas.sbLocalizarClienteClick(Sender: TObject);
begin
  formLocalizarClientesVenda := TformLocalizarClientesVenda.Create(self);
  try
    formLocalizarClientesVenda.ShowModal;
  finally
    formLocalizarClientesVenda.Free;

    if CodigoCliente <> 0 then
    begin

      edtLocalizarCPF.Text := CPF_CNPJ_Cliente;
      lblNomeDoCliente.Caption := NomeCliente;
      edtLocalizarProduto.SetFocus;
      lblVenda.Caption := 'Venda em andamento';

      sbLocalizarCliente.Enabled := false;
      sbNovo.Enabled := false;
      sbLocalizarCliente.Enabled := false;
      edtLocalizarCPF.Enabled := false;

    end
    else
    begin

      sbLocalizarCliente.Enabled := true;
      sbNovo.Enabled := true;
      sbLocalizarCliente.Enabled := true;
      edtLocalizarCPF.Enabled := true;

    end;

  end;
end;

procedure TformVendas.sbNovoClick(Sender: TObject);
begin
  edtLocalizarCPF.Enabled := true;
  sbLocalizarCliente.Enabled := true;
  edtLocalizarCPF.SetFocus;
end;

procedure TformVendas.sbLocalizarProdutoClick(Sender: TObject);
begin
  if lblVenda.Caption <> 'Nova venda' then
  begin

    formLocalizarProdutoVenda := TformLocalizarProdutoVenda.Create(self);
    try
      formLocalizarProdutoVenda.ShowModal;
    finally
      formLocalizarProdutoVenda.Free;

      edtLocalizarProduto.Text := CodigoDeBarras;
      edtQuantidade.Text := inttostr(QuantidadeDeProdutos);
      edtValorUnitario.Text := CurrToStr(valorUnitario);
      edtTotalDoProduto.Text := CurrToStr(valorTotalDoProduto);
      lblProduto.Caption := NomeDoProduto;
      edtQuantidade.SetFocus;

    end;
  end;
end;

procedure TformVendas.sbAdicionarProdutoClick(Sender: TObject);
var
  qtdeNalista: Integer;
  vlrNaLista: Currency;
  codProdutoSelecionado:integer;
begin
  if CodigoDoProduto <> 0 then
  begin

    calcularTotalPorQuantidade;

    cds_tem_produtos.Open;
    cds_tem_produtos.First;
    cds_tem_produtos.DisableControls;
    cds_tem_produtos.Locate('codigo_produto', CodigoDoProduto, []);
    qtdeNalista := cds_tem_produtos.FieldByName('Quantidade').AsInteger;
    vlrNaLista := cds_tem_produtos.FieldByName('Total_do_produto').AsCurrency;
    codProdutoSelecionado := cds_tem_produtos.FieldByName('codigo_produto').AsInteger;
    cds_tem_produtos.EnableControls;

    if ((codProdutoSelecionado <> 0) and (codProdutoSelecionado = CodigoDoProduto)) then
    begin
      try
        cds_tem_produtos.Open;
        cds_tem_produtos.Edit;

        cds_tem_produtosQuantidade.AsInteger := QuantidadeDeProdutos + qtdeNalista;
        cds_tem_produtosTotal_do_produto.AsCurrency := valorTotalDoProduto + vlrNaLista;

        cds_tem_produtos.Post;

        lblTotalDaVenda.Caption := formatFloat('R$ ###,##0.00',
          FEntityVenda.somarItensDaVenda(cds_tem_produtos));

        lblTotalItens.Caption :=
          inttostr(FEntityVenda.contarTotalItens(cds_tem_produtos));

          showmessage('Produto adicionado aos itens da venda com sucesso!!!');

      except
        on e: Exception do
        begin
          raise Exception.Create('ERRO! Erro ao tentar adicionar o produto na lista.'
            + e.Message);
        end;
      end;
    end
  else
  begin
    try
      cds_tem_produtos.Open;
      cds_tem_produtos.Append;

      cds_tem_produtoscodigo_produto.AsInteger := CodigoDoProduto;
      cds_tem_produtosProduto.AsString := NomeDoProduto;
      cds_tem_produtosValor_unitario.AsCurrency := valorUnitario;
      cds_tem_produtosQuantidade.AsInteger := QuantidadeDeProdutos;
      cds_tem_produtosTotal_do_produto.AsCurrency := valorTotalDoProduto;

      cds_tem_produtos.Post;

      lblTotalDaVenda.Caption := formatFloat('R$ ###,##0.00',
        FEntityVenda.somarItensDaVenda(cds_tem_produtos));

      lblTotalItens.Caption :=
        inttostr(FEntityVenda.contarTotalItens(cds_tem_produtos));

      showmessage('Produto adicionado aos itens da venda com sucesso!!!');

    except
      on e: Exception do
      begin
        raise Exception.Create('ERRO! Erro ao tentar adicionar o produto na lista.' +
          e.Message);
      end;

    end;
  end;
  end;

  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\No_Protuct.png');

end;

procedure TformVendas.sbExcluirItemClick(Sender: TObject);
begin

  if cds_tem_produtos.RecordCount >= 1 then
  begin

    if cds_tem_produtosQuantidade.AsInteger = 1 then
    begin

      cds_tem_produtos.Delete;

      lblTotalDaVenda.Caption := formatFloat('R$ ###,##0.00',
        FEntityVenda.somarItensDaVenda(cds_tem_produtos));

      lblTotalItens.Caption :=
        inttostr(FEntityVenda.contarTotalItens(cds_tem_produtos));

    end
    else if cds_tem_produtosQuantidade.AsInteger > 1 then
    begin

      cds_tem_produtos.Edit;
      cds_tem_produtosQuantidade.AsInteger := cds_tem_produtosQuantidade.AsInteger -1;
      cds_tem_produtos.Post;

      lblTotalDaVenda.Caption := formatFloat('R$ ###,##0.00',
        FEntityVenda.somarItensDaVenda(cds_tem_produtos));

      lblTotalItens.Caption :=
        inttostr(FEntityVenda.contarTotalItens(cds_tem_produtos));

    end;

  end;

end;

procedure TformVendas.sbFinalizarVendaClick(Sender: TObject);
begin

  if cds_tem_produtos.RecordCount >= 1 then
  begin

    TotalDaVenda := FEntityVenda.somarItensDaVenda(cds_tem_produtos);

    TotalDeItens := FEntityVenda.contarTotalItens(cds_tem_produtos);

    FormVendaConfirmarPagamento := TFormVendaConfirmarPagamento.Create(self);
    try
      FormVendaConfirmarPagamento.ShowModal;
    finally
      FormVendaConfirmarPagamento.Free;
    end;
  end;

end;

end.
