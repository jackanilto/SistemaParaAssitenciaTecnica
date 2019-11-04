unit Form.Cadastro.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Cadastro.Clientes;

type
  TformCadastroDeClientes = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FEntityClientes: iCadastroClientes;
  public
    { Public declarations }
  end;

var
  formCadastroDeClientes: TformCadastroDeClientes;

implementation

{$R *.dfm}

procedure TformCadastroDeClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityClientes := TEntityCadastroClientes.new;
end;

procedure TformCadastroDeClientes.FormShow(Sender: TObject);
begin
  inherited;
  FEntityClientes.abrir.listarGrid(DataSource1);
end;

end.
