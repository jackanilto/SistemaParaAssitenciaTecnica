unit Form.Localizar.Clientes.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, UInterfaces,
  UClasse.Entity.Localizar.Cliente.Venda;

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
  private
    { Private declarations }
    FLocalizarCliente: iLocalizarClienteVenda;
  public
    { Public declarations }
  end;

var
  formLocalizarClientesVenda: TformLocalizarClientesVenda;

implementation

{$R *.dfm}

procedure TformLocalizarClientesVenda.FormCreate(Sender: TObject);
begin
  FLocalizarCliente := TEntityPesquisarCliente.new;
end;

procedure TformLocalizarClientesVenda.FormShow(Sender: TObject);
begin
  FLocalizarCliente.abrir.listarGrid(DataSource1);
end;

procedure TformLocalizarClientesVenda.sbFecharClick(Sender: TObject);
begin
  Close;
end;

end.
