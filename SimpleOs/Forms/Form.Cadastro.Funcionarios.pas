unit Form.Cadastro.Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Cadastro.Funcionario;

type
  TformCadastroDeFuncionarios = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    TEntityFuncionario: iCadastroFuncionario;
  public
    { Public declarations }
  end;

var
  formCadastroDeFuncionarios: TformCadastroDeFuncionarios;

implementation

{$R *.dfm}

procedure TformCadastroDeFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
  TEntityFuncionario := TEntityCadastroFuncionario.new;
end;

procedure TformCadastroDeFuncionarios.FormShow(Sender: TObject);
begin
  inherited;
  TEntityFuncionario.abrir.listarGrid(DataSource1);
end;

end.
