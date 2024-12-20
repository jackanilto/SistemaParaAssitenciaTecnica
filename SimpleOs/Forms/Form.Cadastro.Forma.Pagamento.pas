unit Form.Cadastro.Forma.Pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UInterfaces,
  UClasse.Entity.Forma.Pagamento;

type
  TformFormaPagamento = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtFormaPagamento: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    FEntityFormaPagamento: iFormaPagamento;
  public
    { Public declarations }
  end;

var
  formFormaPagamento: TformFormaPagamento;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformFormaPagamento.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  edtCodigo.Text := inttostr(DataSource1.DataSet.FieldByName('ID').AsInteger);
  edtFormaPagamento.Text := DataSource1.DataSet.FieldByName
    ('FORMA_PAGAMENTO').AsString;

end;

procedure TformFormaPagamento.DBGrid1CellClick(Column: TColumn);
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

procedure TformFormaPagamento.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FEntityFormaPagamento.ordenarGrid(Column);
end;

procedure TformFormaPagamento.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  campo: string;
begin
  inherited;

  if cbPesquisar.Text = 'C�digo' then
    campo := 'ID'
  else if cbPesquisar.Text = 'Forma pagamento' then
    campo := 'FORMA_PAGAMENTO';

  FEntityFormaPagamento.getCampo(campo).getValor(edtPesquisar.Text)
    .sqlPesquisa.listarGrid(DataSource1);

  { C�digo
    Forma pagamento }
end;

procedure TformFormaPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityFormaPagamento := TEntityFormaPagamento.new;
  dllSoftMeter.sendEvent('cadastros formas de pagamento', 'formas de pagamento', 0);
end;

procedure TformFormaPagamento.FormShow(Sender: TObject);
begin
  inherited;
  FEntityFormaPagamento.abrir.listarGrid(DataSource1);
end;

procedure TformFormaPagamento.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityFormaPagamento.cancelar;

end;

procedure TformFormaPagamento.sbEditarClick(Sender: TObject);
begin
  FEntityFormaPagamento.editar;
  inherited;
  edtFormaPagamento.SetFocus;

end;

procedure TformFormaPagamento.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityFormaPagamento.deletar;
end;

procedure TformFormaPagamento.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityFormaPagamento.inserir;
  edtFormaPagamento.SetFocus;
end;

procedure TformFormaPagamento.sbSalvarClick(Sender: TObject);
begin
  FEntityFormaPagamento.getFormaPagamento(edtFormaPagamento.Text).gravar;
  inherited;
end;

end.
