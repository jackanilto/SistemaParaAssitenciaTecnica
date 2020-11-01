unit Form.Localizar.Servicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Mask, RxToolEdit, RxCurrEdit, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXCtrls, UInterfaces, UClasse.Entity.Cadastro.Servicos;

type
  TFormLocalizarServicos = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cbPesquisar: TComboBox;
    DBGrid1: TDBGrid;
    edtServico: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtValor: TCurrencyEdit;
    sbAdicionar: TSpeedButton;
    sbCancelar: TSpeedButton;
    DataSource1: TDataSource;
    edtPesquisar: TEdit;
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

    function retornarCodigo:integer;
    function retornarServico:string;
    function retornarValor:Currency;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure sbAdicionarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
    var
      FEntity: iCadastroServico;

      FCodigo:integer;
      FServico:string;
      FValor:Currency;

  public
    { Public declarations }
  end;

var
  FormLocalizarServicos: TFormLocalizarServicos;

implementation

{$R *.dfm}

procedure TFormLocalizarServicos.DBGrid1DblClick(Sender: TObject);
begin

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    FCodigo := DataSource1.DataSet.FieldByName('ID').AsInteger;
    FServico := DataSource1.DataSet.FieldByName('SERVICO').AsString;
    FValor := DataSource1.DataSet.FieldByName('VALOR').AsCurrency;
    close;
  end;

end;

procedure TFormLocalizarServicos.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  FCampo:string;
begin

  if cbPesquisar.Text = 'Código' then
  begin
    FCampo := 'ID';
  end
  else if cbPesquisar.Text = 'Serviço' then
  begin
    FCampo := 'SERVICO';
  end;

  if edtPesquisar.Text <> EmptyStr then
  begin
    FEntity
          .getCampo(FCampo)
          .getValor(edtPesquisar.Text)
          .sqlPesquisa
          .listarGrid(DataSource1);
  end
  else
  begin
    FEntity
          .getCampo('ID')
          .getValor('%')
          .sqlPesquisa
          .listarGrid(DataSource1);
  end;
end;

procedure TFormLocalizarServicos.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = 13 then
  begin
    sbAdicionar.Click;
  end;

end;

procedure TFormLocalizarServicos.FormCreate(Sender: TObject);
begin
  FEntity := TEntityCadastroServicos.new;
end;

procedure TFormLocalizarServicos.FormShow(Sender: TObject);
begin
  FEntity.listarGrid(DataSource1);
end;

procedure TFormLocalizarServicos.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

function TFormLocalizarServicos.retornarCodigo: integer;
begin
  result := FCodigo;
end;

function TFormLocalizarServicos.retornarServico: string;
begin
  result := FServico;
end;

function TFormLocalizarServicos.retornarValor: Currency;
begin
  result := FValor;
end;

procedure TFormLocalizarServicos.sbAdicionarClick(Sender: TObject);
begin

  if edtServico.Text <> EmptyStr then
  begin

    FCodigo := 0;
    FServico := edtServico.Text;
    FValor := StrToCurr(edtValor.Text);

    Close;

  end
  else
  begin
    edtServico.SetFocus;
    MessageDlg('ERRO! Informe o serciço que esta incluindo', mtError, [mbOK], 0, mbOK);
    Abort;
  end;

end;

procedure TFormLocalizarServicos.sbCancelarClick(Sender: TObject);
begin

    FCodigo := 0;
    FServico := '';
    FValor := 0;

    Close;

end;

procedure TFormLocalizarServicos.sbFecharClick(Sender: TObject);
begin
  Close;
end;

end.
