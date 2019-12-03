unit Form.Criar.Ordem.Servico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, UInterfaces, UClasse.Entity.Criar.Ordem.Servico, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TformCriarConsultarOrdemServico = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    PageControl1: TPageControl;
    tbOrdemServiço: TTabSheet;
    tbServicosEFaturamento: TTabSheet;
    tbParcelas: TTabSheet;
    Panel3: TPanel;
    sbNovo: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbEditar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    sbPesquisarCep: TSpeedButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Memo1: TMemo;
    Label9: TLabel;
    Memo2: TMemo;
    Label10: TLabel;
    Memo3: TMemo;
    Label11: TLabel;
    ComboBox1: TComboBox;
    Label12: TLabel;
    ComboBox2: TComboBox;
    Label13: TLabel;
    MaskEdit2: TMaskEdit;
    Label14: TLabel;
    MaskEdit3: TMaskEdit;
    Label15: TLabel;
    MaskEdit4: TMaskEdit;
    Label16: TLabel;
    Edit8: TEdit;
    Label17: TLabel;
    Edit9: TEdit;
    Label18: TLabel;
    MaskEdit5: TMaskEdit;
    Label19: TLabel;
    Label20: TLabel;
    Edit10: TEdit;
    SpeedButton3: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit11: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    Label23: TLabel;
    ComboBox3: TComboBox;
    Label24: TLabel;
    Label25: TLabel;
    ComboBox4: TComboBox;
    Label26: TLabel;
    Edit14: TEdit;
    Label27: TLabel;
    ComboBox5: TComboBox;
    MaskEdit6: TMaskEdit;
    Label28: TLabel;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FEntityCriarOrdem: iCriarOrdemServico;
  public
    { Public declarations }
  end;

var
  formCriarConsultarOrdemServico: TformCriarConsultarOrdemServico;

implementation

{$R *.dfm}

procedure TformCriarConsultarOrdemServico.FormCreate(Sender: TObject);
begin
  FEntityCriarOrdem := TEntityCriarOrdemServico.new;
end;

procedure TformCriarConsultarOrdemServico.FormShow(Sender: TObject);
begin
 FEntityCriarOrdem.abrir.listarGrid(DataSource1);
end;

procedure TformCriarConsultarOrdemServico.Panel1MouseDown(Sender: TObject;
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

procedure TformCriarConsultarOrdemServico.sbFecharClick(Sender: TObject);
begin
  Close;
end;

end.
