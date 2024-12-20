unit Form.Cadastro.Configurar.Parcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UInterfaces,
  UClasse.Entity.Configurar.Parcelas, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TformConfigurarParcelas = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtJuros: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtMulta: TCurrencyEdit;
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
    FEntityConfigurarParcelas: iConfigurarParcelas;
  public
    { Public declarations }
  end;

var
  formConfigurarParcelas: TformConfigurarParcelas;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformConfigurarParcelas.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  edtCodigo.Text := IntToStr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  edtJuros.Text := FloatToStr(DataSource1.DataSet.FieldByName('JUROS').AsFloat);
  edtMulta.Text := FloatToStr(DataSource1.DataSet.FieldByName('MULTA')
    .AsCurrency);
end;

procedure TformConfigurarParcelas.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;
  end
  else
  begin
    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;
  end;
end;

procedure TformConfigurarParcelas.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityConfigurarParcelas.ordenarGrid(Column);
end;

procedure TformConfigurarParcelas.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityConfigurarParcelas := TEntityConfigurarParcelas.new;
  dllSoftMeter.sendEvent('confiurar parcelas', 'confir parcelas', 0);
end;

procedure TformConfigurarParcelas.FormShow(Sender: TObject);
begin
  inherited;
  FEntityConfigurarParcelas.abrir.listarGrid(DataSource1);
end;

procedure TformConfigurarParcelas.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityConfigurarParcelas.cancelar;
end;

procedure TformConfigurarParcelas.sbEditarClick(Sender: TObject);
begin
  FEntityConfigurarParcelas.editar;
  inherited;
  edtJuros.SetFocus;
end;

procedure TformConfigurarParcelas.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityConfigurarParcelas.deletar;
end;

procedure TformConfigurarParcelas.sbNovoClick(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount = 0 then
  begin
    inherited;
    FEntityConfigurarParcelas.inserir;
    edtJuros.SetFocus;
  end
  else
  begin
    raise Exception.Create
      ('N�o � poss�vel inserir mais de um registro neste tabela.');
  end;
end;

procedure TformConfigurarParcelas.sbSalvarClick(Sender: TObject);
begin

  if edtMulta.Text = EmptyStr then
    edtMulta.Text := '0';

  FEntityConfigurarParcelas
                        .getConfigurarParcelaJuros(edtJuros.Text)
                        .getConfigurarParcelaMulta(edtMulta.Text)
                        .gravar;

  inherited;

end;

end.
