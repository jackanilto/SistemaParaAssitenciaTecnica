unit Form.Cadastro.Tipo.Retiradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UInterfaces,
  UClasse.Entity.Tipo.Retiradas;

type
  TformTipoRetiradas = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtTipoRetirada: TEdit;
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
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    FEntityTipoRetiradas: iTipoRetirada;
  public
    { Public declarations }
  end;

var
  formTipoRetiradas: TformTipoRetiradas;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformTipoRetiradas.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  edtCodigo.Text := inttostr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  edtTipoRetirada.Text := DataSource1.DataSet.FieldByName('TIPO_SAIDA')
    .AsString;
end;

procedure TformTipoRetiradas.DBGrid1CellClick(Column: TColumn);
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

procedure TformTipoRetiradas.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityTipoRetiradas.ordenarGrid(Column);
end;

procedure TformTipoRetiradas.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  campo: string;
begin
  inherited;

  if cbPesquisar.Text = 'Código' then
    campo := 'ID'
  else if cbPesquisar.Text = 'Tipo retirada' then
    campo := 'TIPO_SAIDA';

  FEntityTipoRetiradas.getCampo(campo).getValor(edtPesquisar.Text)
    .sqlPesquisa.listarGrid(DataSource1);
end;

procedure TformTipoRetiradas.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityTipoRetiradas := TEntityTipoPagamento.new;
  dllSoftMeter.sendEvent('cadastros de tipos de retiradas', 'tipo retiradas', 0);
end;

procedure TformTipoRetiradas.FormShow(Sender: TObject);
begin
  inherited;
  FEntityTipoRetiradas.abrir.listarGrid(DataSource1);
end;

procedure TformTipoRetiradas.sbCancelarClick(Sender: TObject);
begin
  inherited;

  FEntityTipoRetiradas
                      .abrir
                      .listarGrid(DataSource1);
//  .cancelar;

end;

procedure TformTipoRetiradas.sbEditarClick(Sender: TObject);
begin
  FEntityTipoRetiradas.editar;
  inherited;
  edtTipoRetirada.SetFocus;
end;

procedure TformTipoRetiradas.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityTipoRetiradas.deletar;
end;

procedure TformTipoRetiradas.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityTipoRetiradas.inserir;
  edtTipoRetirada.SetFocus;
end;

procedure TformTipoRetiradas.sbSalvarClick(Sender: TObject);
begin
  FEntityTipoRetiradas
                    .getTipoRetirada(edtTipoRetirada.Text)
                    .gravar
                    .abrir
                    .listarGrid(DataSource1);
  inherited;

end;

end.
