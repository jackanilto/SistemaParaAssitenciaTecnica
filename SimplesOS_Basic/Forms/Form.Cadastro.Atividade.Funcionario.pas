unit Form.Cadastro.Atividade.Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UInterfaces,
  UClasse.Entity.Atividade.Funcionario;

type
  TformAtividadeFuncionario = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtAtividade: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    FEntityAtivade: iAtividadeFuncionarios;
  public
    { Public declarations }
  end;

var
  formAtividadeFuncionario: TformAtividadeFuncionario;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformAtividadeFuncionario.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  edtCodigo.Text := inttostr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  edtAtividade.Text := DataSource1.DataSet.FieldByName('ATIVIDADE').AsString;
end;

procedure TformAtividadeFuncionario.DBGrid1CellClick(Column: TColumn);
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

procedure TformAtividadeFuncionario.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityAtivade.ordenarGrid(Column);
end;

procedure TformAtividadeFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityAtivade := TEntityAtividadeFuncionario.new;
  dllSoftMeter.sendEvent('cadastros ativiades funcionarios', 'cadastro atividades', 0);
end;

procedure TformAtividadeFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  FEntityAtivade.abrir.listarGrid(DataSource1);
end;

procedure TformAtividadeFuncionario.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityAtivade
//            .cancelar
            .abrir
            .listarGrid(DataSource1);
end;

procedure TformAtividadeFuncionario.sbEditarClick(Sender: TObject);
begin
  FEntityAtivade.editar;
  inherited;
  edtAtividade.SetFocus;
end;

procedure TformAtividadeFuncionario.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityAtivade.deletar;
end;

procedure TformAtividadeFuncionario.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityAtivade.inserir;
  edtAtividade.SetFocus;
end;

procedure TformAtividadeFuncionario.sbSalvarClick(Sender: TObject);
begin
  FEntityAtivade
              .getAtividadeFuncionario(edtAtividade.Text)
              .gravar
              .abrir
              .listarGrid(DataSource1);
  inherited;
end;

end.
