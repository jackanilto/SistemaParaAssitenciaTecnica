unit Form.Cadastro.Marcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UInterfaces, UClasse.Entity.Marcas;

type
  TformCadastroMarcas = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtMarca: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FEntityMarcas: iCadastroMarcas;
  public
    { Public declarations }
  end;

var
  formCadastroMarcas: TformCadastroMarcas;

implementation

{$R *.dfm}

procedure TformCadastroMarcas.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  edtCodigo.Text := inttostr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  edtMarca.Text := DataSource1.DataSet.FieldByName('MARCA').AsString;
end;

procedure TformCadastroMarcas.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityMarcas.ordenarGrid(Column);
end;

procedure TformCadastroMarcas.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityMarcas := TEntityMarcas.new;
end;

procedure TformCadastroMarcas.FormShow(Sender: TObject);
begin
  inherited;
  FEntityMarcas.abrir.listarGrid(DataSource1);
end;

procedure TformCadastroMarcas.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityMarcas.cancelar;
end;

procedure TformCadastroMarcas.sbEditarClick(Sender: TObject);
begin
  FEntityMarcas.editar;
  edtMarca.SetFocus;
  inherited;
end;

procedure TformCadastroMarcas.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityMarcas.deletar;
end;

procedure TformCadastroMarcas.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityMarcas.inserir;
  edtMarca.SetFocus;
end;

procedure TformCadastroMarcas.sbSalvarClick(Sender: TObject);
begin
  FEntityMarcas.getMarca(edtMarca.Text).gravar;
  inherited;
end;

end.