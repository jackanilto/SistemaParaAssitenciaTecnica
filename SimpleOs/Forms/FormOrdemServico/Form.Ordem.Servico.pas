unit Form.Ordem.Servico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UInterfaces,
  UClasse.Entity.Ordem.Servico, UClasse.Entity.Cadastro.Clientes;

type
  TformOrdemDeServico = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    sbNovo: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbEditar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    PageControl1: TPageControl;
    tbConsulta: TTabSheet;
    tbCadastroOrdens: TTabSheet;
    tbItensOrdem: TTabSheet;
    tbPedidoDeCompra: TTabSheet;
    tbParcelas: TTabSheet;
    Panel4: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ds_DadosClientes: TDataSource;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    ds_OrdensDoClientes: TDataSource;
    Image1: TImage;
    Panel8: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label11: TLabel;
    Edit7: TEdit;
    Label12: TLabel;
    Edit8: TEdit;
    Label13: TLabel;
    Edit9: TEdit;
    Label14: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Edit10: TEdit;
    Label15: TLabel;
    Edit11: TEdit;
    Label16: TLabel;
    Edit12: TEdit;
    Label17: TLabel;
    Edit13: TEdit;
    Label18: TLabel;
    Edit14: TEdit;
    Label19: TLabel;
    Edit15: TEdit;
    Label20: TLabel;
    Edit16: TEdit;
    Label21: TLabel;
    Edit17: TEdit;
    Label22: TLabel;
    Edit18: TEdit;
    Label23: TLabel;
    Edit19: TEdit;
    Label24: TLabel;
    Edit20: TEdit;
    Label25: TLabel;
    Edit21: TEdit;
    Label26: TLabel;
    Edit22: TEdit;
    Label27: TLabel;
    Edit23: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Edit24: TEdit;
    Edit25: TEdit;
    Label30: TLabel;
    Edit26: TEdit;
    Label31: TLabel;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ds_DadosClientesDataChange(Sender: TObject; Field: TField);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure sbNovoClick(Sender: TObject);
  private
    { Private declarations }
    FEntityOrdem: iOrdemServico;
    FEntityClientes: iCadastroClientes;
    FCodigoClienteSelecionado: Integer;
    FNomeClienteSelecionado: string;
  public
    { Public declarations }
  end;

var
  formOrdemDeServico: TformOrdemDeServico;

implementation

{$R *.dfm}

procedure TformOrdemDeServico.DBGrid2CellClick(Column: TColumn);
begin
  if ds_DadosClientes.DataSet.RecordCount >= 1 then
  begin
    FCodigoClienteSelecionado := ds_DadosClientes.DataSet.FieldByName('ID')
      .AsInteger;
    FNomeClienteSelecionado := ds_DadosClientes.DataSet.FieldByName
      ('NOME').AsString;
    FEntityOrdem.getCampo('ID_CLIENTE')
      .getValor(FCodigoClienteSelecionado.ToString).sqlPesquisa.listarGrid
      (ds_OrdensDoClientes);
  end
  else
  begin
    FCodigoClienteSelecionado := null;
    FNomeClienteSelecionado := '';
  end;
end;

procedure TformOrdemDeServico.ds_DadosClientesDataChange(Sender: TObject;
  Field: TField);
begin
  ds_DadosClientes.DataSet.FieldByName('DATA_NASCIMENTO').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('DATA_CADASTRO').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('ENDERECO').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('BAIRRO').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('NUMERO').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('COMPLEMENTO').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('CEP').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('CIDADE').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('ESTADO').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('TELEFONE').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('CELULAR').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('EMAIL').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('FUNCIONARIO_CADASTRO').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('SITUACAO_CLIENTE').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('FOTO').Visible := false;
  ds_DadosClientes.DataSet.FieldByName('OBSERVACAO').Visible := false;

  Image1.Picture.Assign(ds_DadosClientes.DataSet.FieldByName('foto'));

  if Image1.Picture.Graphic.Empty then
    Image1.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +
      '/No_User.png');

end;

procedure TformOrdemDeServico.FormCreate(Sender: TObject);
begin
  FEntityOrdem := TEntityOrdemServico.new;
  FEntityClientes := TEntityCadastroClientes.new;
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformOrdemDeServico.FormShow(Sender: TObject);
begin
  FEntityClientes.abrir.listarGrid(ds_DadosClientes);
  FEntityOrdem.abrir.listarGrid(ds_OrdensDoClientes);
end;

procedure TformOrdemDeServico.Panel1MouseDown(Sender: TObject;
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

procedure TformOrdemDeServico.sbFecharClick(Sender: TObject);
begin
  close;
end;

procedure TformOrdemDeServico.sbNovoClick(Sender: TObject);
begin
  if FCodigoClienteSelecionado = null then
  begin
    lblCaption.Caption := self.Caption +
      ' > Inserindo uma nova ordem de servi�o.';
  end
  else
  begin
    raise Exception.Create
      ('Escolha um cliente para inicar a nova ordem de servi�o.');
  end;
end;

end.