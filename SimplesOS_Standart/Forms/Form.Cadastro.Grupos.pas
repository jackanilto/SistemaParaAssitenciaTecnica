unit Form.Cadastro.Grupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UInterfaces, UClasse.Entity.Grupos;

type
  TformCadastroGrupos = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtGrupo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    FEntityGrupos: iCadastroGrupos;
  public
    { Public declarations }
  end;

var
  formCadastroGrupos: TformCadastroGrupos;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformCadastroGrupos.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  edtCodigo.Text := inttostr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  edtGrupo.Text := DataSource1.DataSet.FieldByName('GRUPO').AsString;
end;

procedure TformCadastroGrupos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;
  end
  else
  begin
    sbEditar.Enabled := false;
    sbExcluir.Enabled := false;
  end;
end;

procedure TformCadastroGrupos.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityGrupos.ordenarGrid(Column);
end;

procedure TformCadastroGrupos.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  campo: string;
begin
  inherited;

  if cbPesquisar.Text = 'C�digo' then
    campo := 'ID'
  else if cbPesquisar.Text = 'Grupo' then
    campo := 'GRUPO';

  FEntityGrupos.getCampo(campo).getValor(edtPesquisar.Text)
    .sqlPesquisa.listarGrid(DataSource1);

end;

procedure TformCadastroGrupos.FormCreate(Sender: TObject);
begin
  inherited;

  FEntityGrupos := TEntityGrupos.new;
  dllSoftMeter.sendEvent('cadastros de grupos', 'grupos', 0);

end;

procedure TformCadastroGrupos.FormShow(Sender: TObject);
begin
  inherited;
  FEntityGrupos.abrir.listarGrid(DataSource1);
end;

procedure TformCadastroGrupos.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityGrupos
//              .cancelar
              .abrir
              .listarGrid(DataSource1);
end;

procedure TformCadastroGrupos.sbEditarClick(Sender: TObject);
begin

  FEntityGrupos.editar;
  inherited;
  edtGrupo.SetFocus;

end;

procedure TformCadastroGrupos.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityGrupos.deletar;
end;

procedure TformCadastroGrupos.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityGrupos.inserir;
  edtGrupo.SetFocus;
end;

procedure TformCadastroGrupos.sbSalvarClick(Sender: TObject);
begin
  FEntityGrupos
              .getGrupo(edtGrupo.Text)
              .gravar
              .abrir
              .listarGrid(DataSource1);
  inherited;
end;

end.
