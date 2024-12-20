unit Form.Localizar.Clientes.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, UInterfaces,
  UClasse.Entity.Localizar.Cliente.Venda,
  UClasse.Chamar.Cadastro.Clientes.Ordens;

type
  TEnumCliente = (codigo, nome, cpf_cnpj);

type
  TformLocalizarClientesVenda = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    sbCadastrarClientes: TSpeedButton;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbCadastrarClientesClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure cbPesquisarChange(Sender: TObject);
  private
    { Private declarations }
    FEntityLocalizarClienteVenda: iLocalizarClienteVenda;
    FChamarCadastroClientes: TclasseCadastroClientesOrdem;
    FCampo: string;
  public
    { Public declarations }
  end;

var
  formLocalizarClientesVenda: TformLocalizarClientesVenda;

implementation

uses Form.Venda;

{$R *.dfm}

procedure TformLocalizarClientesVenda.cbPesquisarChange(Sender: TObject);
begin
  edtPesquisar.SetFocus;
end;

procedure TformLocalizarClientesVenda.DBGrid1DblClick(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    CodigoCliente := DataSource1.DataSet.FieldByName('ID').AsInteger;
    NomeCliente := DataSource1.DataSet.FieldByName('NOME').AsString;
    CPF_CNPJ_Cliente := DataSource1.DataSet.FieldByName('CPF_CNPJ').AsString;
    close;
  end;
end;

procedure TformLocalizarClientesVenda.DBGrid1TitleClick(Column: TColumn);
begin
  FEntityLocalizarClienteVenda.ordenarGrid(Column);
end;

procedure TformLocalizarClientesVenda.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if cbPesquisar.Text = EmptyStr then
    raise Exception.Create
      ('Informe por qual campo deseja realizar a pesquisa.');

  case TEnumCliente(cbPesquisar.ItemIndex) of
    codigo:
      begin
        FCampo := 'ID';
      end;
    nome:
      begin
        FCampo := 'NOME';
      end;
    cpf_cnpj:
      begin
        FCampo := 'CPF_CNPJ';
      end;

  end;

  if edtPesquisar.Text <> EmptyStr then
    FEntityLocalizarClienteVenda.getCampo(FCampo)
      .getValor(UpperCase(edtPesquisar.Text)).sqlPesquisa.listarGrid
      (DataSource1);

end;

procedure TformLocalizarClientesVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FChamarCadastroClientes.Free;
end;

procedure TformLocalizarClientesVenda.FormCreate(Sender: TObject);
begin
  FEntityLocalizarClienteVenda := TEntityPesquisarCliente.new;
  FChamarCadastroClientes := TclasseCadastroClientesOrdem.Create;
end;

procedure TformLocalizarClientesVenda.FormShow(Sender: TObject);
begin
  FEntityLocalizarClienteVenda.abrir.getCampo('ID').getValor('0')
    .sqlPesquisa.listarGrid(DataSource1);

  edtPesquisar.SetFocus;

end;

procedure TformLocalizarClientesVenda.Panel1MouseDown(Sender: TObject;
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

procedure TformLocalizarClientesVenda.sbCadastrarClientesClick(Sender: TObject);
begin
  FChamarCadastroClientes.chamarCadastroClientes;
end;

procedure TformLocalizarClientesVenda.sbFecharClick(Sender: TObject);
begin
  close;
end;

end.
