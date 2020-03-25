unit Form.Acesso.Recursos.Fucnionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Configurar.Acesso.Funcionario;

type
  TformConfigurarAcessoFuncionario = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    var
      FEntityAcesso:iNivelAcessoFuncionario;
  public
    { Public declarations }
  end;

var
  formConfigurarAcessoFuncionario: TformConfigurarAcessoFuncionario;

implementation

{$R *.dfm}

procedure TformConfigurarAcessoFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityAcesso := TEntityConfigAcessoFuncionario.new;
end;

procedure TformConfigurarAcessoFuncionario.FormShow(Sender: TObject);
begin
  inherited;

  lblCaption.Caption := self.Caption;
  FEntityAcesso.abrir.listarGrid(DataSource1);

end;

end.
