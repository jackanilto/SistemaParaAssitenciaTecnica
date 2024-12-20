unit Form.Adicionar.Itens.Ordem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, UDados.Conexao,
  Form.Ordem.Servico, FireDAC.Comp.Client, UFactory;

type
  TEnumPesquisa = (Codigo, Cod_barras, Produto);

type
  TformAdicionarItensOrdem = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    sbAdicionarItem: TSpeedButton;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbAdicionarItemClick(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure localizar;
    procedure informarQuantidade;
    procedure calcularTotal;

  var
    FQuery: TFDQuery;
    FCampo: string;
    FValor: string;
    FQuantidadeInformada: Integer;
    FValorTotal: currency;

  public
    { Public declarations }
  end;

var
  formAdicionarItensOrdem: TformAdicionarItensOrdem;

implementation

{$R *.dfm}

procedure TformAdicionarItensOrdem.DBGrid1DblClick(Sender: TObject);
begin

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    informarQuantidade;
    calcularTotal;
  end;

end;

procedure TformAdicionarItensOrdem.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  try
    case TEnumPesquisa(cbPesquisar.ItemIndex) of
      Codigo:
        begin
          FCampo := 'ID';
        end;
      Cod_barras:
        begin
          FCampo := 'CODIGO_BARRAS';
        end;
      Produto:
        begin
          FCampo := 'SERVICO_PRODUTO';
        end;
    end;
  except
    on e: exception do
      raise exception.Create('Ocorreu um erro. ' + e.message);

  end;

  if edtPesquisar.Text <> EmptyStr then
  begin
    FValor := edtPesquisar.Text;
    localizar;
  end;

end;

procedure TformAdicionarItensOrdem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FQuery.Free;
end;

procedure TformAdicionarItensOrdem.FormCreate(Sender: TObject);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DataModule1.Conexao;
end;

procedure TformAdicionarItensOrdem.FormShow(Sender: TObject);
begin
  FCampo := 'ID';
  FValor := '0';
  localizar;
end;

procedure TformAdicionarItensOrdem.localizar;
begin
  FQuery.Active := false;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from PRODUTOS where ' + FCampo + ' like :v');
  FQuery.ParamByName('v').AsString := FValor + '%';
  FQuery.Active := true;

  // showmessage(inttostr(FQuery.RecordCount));

  FQuery.FieldByName('ID').DisplayLabel := 'C�digo';
  FQuery.FieldByName('TIPO_CADASTROS').DisplayLabel := 'Tipo de cadastro';
  FQuery.FieldByName('SERVICO_PRODUTO').DisplayLabel := 'Produto/Servi�o';
  FQuery.FieldByName('CODIGO_BARRAS').DisplayLabel := 'C�d. de barras';
  FQuery.FieldByName('DESCRICAO').Visible := false;
  FQuery.FieldByName('VALOR_CUSTO').Visible := false;
  FQuery.FieldByName('MARGEM_LUCRO').Visible := false;
  FQuery.FieldByName('VALOR_VENDA').DisplayLabel := 'Valor de venda';
  FQuery.FieldByName('QUANTIDADE_MINIMA').DisplayLabel := 'QTDE m�nima';
  FQuery.FieldByName('QUANTIDADE_ATUAL').DisplayLabel := 'QTDE atual';
  FQuery.FieldByName('DATA_VALIDADE').DisplayLabel := 'Validade';
  FQuery.FieldByName('DATA_ALTERACAO').Visible := false;
  FQuery.FieldByName('ID_GRUPO').Visible := false;
  FQuery.FieldByName('GRUPO').Visible := false;
  FQuery.FieldByName('ID_MARCA').Visible := false;
  FQuery.FieldByName('MARCA').DisplayLabel := 'Marca';
  FQuery.FieldByName('MODELO').DisplayLabel := 'Modelo';
  FQuery.FieldByName('NUMERO_SERIE').DisplayLabel := 'N�mero de serie';
  FQuery.FieldByName('DATA_FABRICACAO').DisplayLabel := 'Fabrica��o';
  FQuery.FieldByName('FUNCIONARIO').Visible := false;
  FQuery.FieldByName('FOTO').Visible := false;
  FQuery.FieldByName('OBSERVACAO').Visible := false;

  FQuery.FieldByName('SERVICO_PRODUTO').DisplayWidth := 30;
  FQuery.FieldByName('TIPO_CADASTROS').DisplayWidth := 18;
  FQuery.FieldByName('CODIGO_BARRAS').DisplayWidth := 25;
  FQuery.FieldByName('DESCRICAO').DisplayWidth := 20;
  FQuery.FieldByName('GRUPO').DisplayWidth := 30;
  FQuery.FieldByName('MARCA').DisplayWidth := 30;
  FQuery.FieldByName('MODELO').DisplayWidth := 30;
  FQuery.FieldByName('NUMERO_SERIE').DisplayWidth := 30;
  FQuery.FieldByName('OBSERVACAO').DisplayWidth := 30;

  DataSource1.DataSet := FQuery;
end;

procedure TformAdicionarItensOrdem.informarQuantidade;
begin
  try
    FQuantidadeInformada := strtoint(InputBox('Informe a quantidade produtos.',
      'Digite a quantidade de produtos que voc� est� inserindo.', '1'));
  except
    on e: exception do
    begin
      Application.MessageBox('Infome um n�mero v�lido', 'Alerta de erro ',
        MB_OK + MB_ICONWARNING);
      FQuantidadeInformada :=
        strtoint(InputBox('Informe a quantidade produtos.',
        'Digite a quantidade de produtos que voc� est� inserindo.', '0'));
    end;
  end;
end;

procedure TformAdicionarItensOrdem.calcularTotal;
begin
  if FQuantidadeInformada > 0 then
  begin
    FValorTotal := FQuantidadeInformada * DataSource1.DataSet.FieldByName
      ('VALOR_VENDA').AsCurrency;

//      with formOrdemDeServico.ds_itensOrdem.DataSet do
//      begin
//       FieldByName('id').AsInteger := TFactory.new.FClassQuery.codigoCadastro('SP_GEN_ITENS_UTILIZADOS_ORDEM_I');
//       FieldByName('ID_ORDEM').AsInteger := formOrdemDeServico.ds_Ordens.DataSet.FieldByName('ID').AsInteger;
//       FieldByName('ID_PRODUTO').AsInteger := DataSource1.DataSet.FieldByName('ID').AsInteger;
//
//
//      end;
  end;
end;

procedure TformAdicionarItensOrdem.Panel1MouseDown(Sender: TObject;
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

procedure TformAdicionarItensOrdem.sbAdicionarItemClick(Sender: TObject);
begin

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    informarQuantidade;
    calcularTotal;
  end;

end;

procedure TformAdicionarItensOrdem.sbFecharClick(Sender: TObject);
begin
  Close;
end;

end.
