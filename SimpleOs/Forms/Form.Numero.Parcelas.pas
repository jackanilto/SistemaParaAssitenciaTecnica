unit Form.Numero.Parcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Numero.Parcelas;

type
  tEnumPesquisar = (codigo, nParcela);

type
  TformNumeroParcelas = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtNumeroDaParcela: TEdit;
    edtJuros: TEdit;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure sbFecharClick(Sender: TObject);
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
    FEntityNumeroParcelas: iNumeroParcelas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNumeroParcelas: TformNumeroParcelas;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformNumeroParcelas.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  edtCodigo.Text := IntToStr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  edtNumeroDaParcela.Text :=
    IntToStr(DataSource1.DataSet.FieldByName('NUM_PARCELAS').AsInteger);
  edtJuros.Text := CurrToStr(DataSource1.DataSet.FieldByName('JUROS').AsFloat);

  DataSource1.DataSet.FieldByName('APLICAR_NA_OS').Visible := false;

//  if DataSource1.DataSet.FieldByName('APLICAR_NA_OS').AsString = 's' then
//    CheckBox1.Checked := true
//  else
//    CheckBox1.Checked := false;

end;

procedure TformNumeroParcelas.DBGrid1CellClick(Column: TColumn);
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

procedure TformNumeroParcelas.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityNumeroParcelas.ordenarGrid(Column);
end;

procedure TformNumeroParcelas.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityNumeroParcelas := TEntityNumeroParcelas.new;
  dllSoftMeter.sendEvent('configurar o numero de parcelas', 'numero de parcelas', 0);
end;

procedure TformNumeroParcelas.FormShow(Sender: TObject);
begin
  inherited;
  FEntityNumeroParcelas.abrir.listarGrid(DataSource1);
end;

procedure TformNumeroParcelas.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityNumeroParcelas.abrir.listarGrid(DataSource1);
end;

procedure TformNumeroParcelas.sbEditarClick(Sender: TObject);
begin
  FEntityNumeroParcelas.editar;
  inherited;
  edtNumeroDaParcela.SetFocus;
end;

procedure TformNumeroParcelas.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityNumeroParcelas.deletar;
end;

procedure TformNumeroParcelas.sbFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TformNumeroParcelas.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityNumeroParcelas.inserir;
  edtNumeroDaParcela.SetFocus;
end;

procedure TformNumeroParcelas.sbSalvarClick(Sender: TObject);
var
  estadoCheckBox: string;
begin

  if CheckBox1.Checked = true then
    estadoCheckBox := 's'
  else
    estadoCheckBox := 'n';

  FEntityNumeroParcelas.getNUM_PARCELAS(StrToInt(edtNumeroDaParcela.Text))
    .getJUROS(StrToFloat(edtJuros.Text)).getAPLICAR_NA_OS
    (estadoCheckBox).gravar;

  FEntityNumeroParcelas.abrir.listarGrid(DataSource1);

  inherited;
end;

end.
