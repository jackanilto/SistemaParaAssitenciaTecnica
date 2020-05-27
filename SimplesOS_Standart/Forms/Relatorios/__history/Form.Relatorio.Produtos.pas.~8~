unit Form.Relatorio.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Produtos;

type
  TEnumPesquisar = (codigo, produto, codigo_barras);

type
  TformRelatorioDeProdutos = class(TformModeloRelatorio)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbExportarClick(Sender: TObject);
  private
    { Private declarations }
    var
      FRelatorioProdutos:iRelatorioDeProdutos;
  public
    { Public declarations }
  end;

var
  formRelatorioDeProdutos: TformRelatorioDeProdutos;

implementation

{$R *.dfm}

procedure TformRelatorioDeProdutos.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FRelatorioProdutos.ordenarGrid(Column);
end;

procedure TformRelatorioDeProdutos.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  codigo:
  begin
    FCampo := 'ID';
  end;
  produto:
  begin
    FCampo := 'PRODUTO';
  end;
  codigo_barras:
  begin
    FCampo := 'CODIGO_BARRAS';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioProdutos
                      .getCampo(FCampo)
                      .getValor(edtPesquisar.Text)
                      .sqlPesquisa
                      .listarGrid(DataSource1);

end;

procedure TformRelatorioDeProdutos.FormCreate(Sender: TObject);
begin
  inherited;
   FRelatorioProdutos := TRelatorioProdutos.new;
end;

procedure TformRelatorioDeProdutos.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioProdutos
                    .abrir
                    .listarGrid(DataSource1);
end;

procedure TformRelatorioDeProdutos.sbExportarClick(Sender: TObject);
begin
  inherited;
  FRelatorioProdutos.exportar;
end;

end.
