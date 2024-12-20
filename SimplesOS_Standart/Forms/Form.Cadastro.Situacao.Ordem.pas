unit Form.Cadastro.Situacao.Ordem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Cadastro.Situacoes.Ordem;

type
  TformCadastroSituacoesOrdem = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtSituacaoOrdem: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    FEntityCadastroSituacaoOrdem: iCadastroSituacoesOrdem;
  public
    { Public declarations }
  end;

var
  formCadastroSituacoesOrdem: TformCadastroSituacoesOrdem;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformCadastroSituacoesOrdem.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  edtCodigo.Text := Inttostr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  edtSituacaoOrdem.Text := DataSource1.DataSet.FieldByName
    ('SITUACAO_ORDEM').AsString;
end;

procedure TformCadastroSituacoesOrdem.DBGrid1CellClick(Column: TColumn);
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

procedure TformCadastroSituacoesOrdem.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityCadastroSituacaoOrdem.ordenarGrid(Column);
end;

procedure TformCadastroSituacoesOrdem.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityCadastroSituacaoOrdem := TEntityCadastroSituacoesOrdem.new;
  dllSoftMeter.sendEvent('cadastros de Situacao OS', 'cadastro sistuacao OS', 0);
end;

procedure TformCadastroSituacoesOrdem.FormShow(Sender: TObject);
begin
  inherited;
  FEntityCadastroSituacaoOrdem.abrir.listarGrid(DataSource1);
end;

procedure TformCadastroSituacoesOrdem.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityCadastroSituacaoOrdem
                            .abrir
                            .listarGrid(DataSource1);
end;

procedure TformCadastroSituacoesOrdem.sbEditarClick(Sender: TObject);
begin
  FEntityCadastroSituacaoOrdem.editar;
  inherited;
  edtSituacaoOrdem.SetFocus;

end;

procedure TformCadastroSituacoesOrdem.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityCadastroSituacaoOrdem.deletar;
end;

procedure TformCadastroSituacoesOrdem.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityCadastroSituacaoOrdem.inserir;
  edtSituacaoOrdem.SetFocus;
end;

procedure TformCadastroSituacoesOrdem.sbSalvarClick(Sender: TObject);
begin

  FEntityCadastroSituacaoOrdem
                          .getSITUACAO_ORDEM(edtSituacaoOrdem.Text)
                          .gravar
                          .abrir
                          .listarGrid(DataSource1);

  inherited;

end;

end.
