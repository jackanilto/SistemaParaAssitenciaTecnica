unit Form.Acesso.Recursos.Fucnionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Configurar.Acesso.Funcionario,
  Vcl.ComCtrls;

type
  TformConfigurarAcessoFuncionario = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    tsCadastros: TTabSheet;
    tsMovimentacao: TTabSheet;
    tsRelatorios: TTabSheet;
    tsCaixa: TTabSheet;
    tsExtras: TTabSheet;
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

uses Form.Cadastro.Funcionarios;

procedure TformConfigurarAcessoFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityAcesso := TEntityConfigAcessoFuncionario.new;
end;

procedure TformConfigurarAcessoFuncionario.FormShow(Sender: TObject);
begin
  inherited;

  lblCaption.Caption := self.Caption;
  FEntityAcesso
              .abrir
              .getCampo('id_funcionario')
              .getValor(formCadastroDeFuncionarios.DataSource1.DataSet.FieldByName('id').AsInteger.ToString)
              .sqlPesquisa
              .listarGrid(DataSource1);

  if DataSource1.DataSet.RecordCount = 0 then
  begin
    sbNovo.Click;
    DataSource1.DataSet.FieldByName('ID_FUNCIONARIO').AsInteger := formCadastroDeFuncionarios.DataSource1.DataSet.FieldByName('ID').AsInteger;
    DataSource1.DataSet.FieldByName('FUNCIONARIO').AsInteger := formCadastroDeFuncionarios.DataSource1.DataSet.FieldByName('NOME').AsInteger;
  end;

end;

end.
