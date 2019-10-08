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
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
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

procedure TformFormaPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityFormaPagamento := TEntityFormaPagamento.new;
end;

procedure TformFormaPagamento.FormShow(Sender: TObject);
begin
  inherited;
  FEntityFormaPagamento.abrir.listarGrid(DataSource1);
end;

procedure TformFormaPagamento.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityFormaPagamento.inserir;
end;

end.
