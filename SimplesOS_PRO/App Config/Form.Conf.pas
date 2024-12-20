unit Form.Conf;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB;

type
  TformAppConfigMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    FDConnection1: TFDConnection;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAppConfigMenu: TformAppConfigMenu;

implementation

{$R *.dfm}

uses Form.Configurar.Conexcao.Banco, Form.Configuracoes.Backup;

procedure TformAppConfigMenu.Button1Click(Sender: TObject);
begin
  formConfigurarConexaoBanco := TformConfigurarConexaoBanco.Create(self);
  try
    formConfigurarConexaoBanco.ShowModal;
  finally
    formConfigurarConexaoBanco.Free;
  end;
end;

procedure TformAppConfigMenu.Button2Click(Sender: TObject);
begin
 formConfiguracoesBackUp := TformConfiguracoesBackUp.Create(self);
 try
   formConfiguracoesBackUp.ShowModal;
 finally
    formConfiguracoesBackUp.Free;
 end;
end;

end.
