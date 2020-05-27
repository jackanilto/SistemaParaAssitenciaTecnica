unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TformLocalizarProdutoVenda = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    sbCadastrarClientes: TSpeedButton;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLocalizarProdutoVenda: TformLocalizarProdutoVenda;

implementation

{$R *.dfm}

end.
