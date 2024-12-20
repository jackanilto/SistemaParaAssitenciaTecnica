unit Form.Relatorio.Entrada.Pradutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Modelo.Relatorio, Data.DB,
  frxClass, frxDBSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Relatorio.Entrada.Produtos;

type
  TEnumPesquisar = (cod_entrada, cod_produto, produto, numero_nota);

type
  TformRelatorioEntradasDeProdutos = class(TformModeloRelatorio)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);  private
    { Private declarations }
    var
      FRelatorioEntradaProdutos : iRelatorioEntradaDeProdutos;
  public
    { Public declarations }
  end;

var
  formRelatorioEntradasDeProdutos: TformRelatorioEntradasDeProdutos;

implementation

{$R *.dfm}

procedure TformRelatorioEntradasDeProdutos.edtPesquisarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    FCampo:string;
begin
  inherited;

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
  cod_entrada:
  begin
    FCampo := 'ID';
  end;
  cod_produto:
  begin
    FCampo := 'ID_PRODUTO';
  end;
  produto:
  begin
    FCampo := 'PRODUTO';
  end;
  numero_nota:
  begin
    FCampo := 'NUMERO_NOTA';
  end;
  end;

  if edtPesquisar.Text <> EmptyStr then
    FRelatorioEntradaProdutos
                            .getCampo(FCampo)
                            .getValor(edtPesquisar.Text)
                            .sqlPesquisa
                            .listarGrid(DataSource1);

end;

procedure TformRelatorioEntradasDeProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FRelatorioEntradaProdutos := TRelatorioEntradaprodutos.new;
end;

procedure TformRelatorioEntradasDeProdutos.FormShow(Sender: TObject);
begin
  inherited;
  FRelatorioEntradaProdutos
                          .abrir
                          .listarGrid(DataSource1);
end;

end.
