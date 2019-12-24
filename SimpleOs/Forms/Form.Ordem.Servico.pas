unit Form.Ordem.Servico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, UInterfaces,
  UClasse.Listar.Ordens.Servico, Vcl.Menus, UFactory, Form.Principal, Vcl.Mask,
  frxClass, frxDBSet;

type
  TEnumPesquisar = (codigo_ordem, codigo_cliente, nome_cliente, CPF);

type
  TformOrdemServico = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    cbPesquisar: TComboBox;
    edtPesquisar: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    VerCadastro1: TMenuItem;
    VerOrdemdeServio1: TMenuItem;
    sbImprimir: TSpeedButton;
    sbExportar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    frxDB_ListaOrdemServico: TfrxDBDataset;
    frx_ListaOrdemServico: TfrxReport;
    procedure sbFecharClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure VerCadastro1Click(Sender: TObject);
    procedure VerOrdemdeServio1Click(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    FEntityOrdensServico: iListarOrdensServico;
    FCampo: string;
    FValor: string;
  public
    { Public declarations }
  end;

var
  formOrdemServico: TformOrdemServico;

implementation

{$R *.dfm}

uses Form.Cadastro.Clientes, Form.Criar.Ordem.Servico;

procedure TformOrdemServico.DBGrid1DblClick(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount >= 1 then
  begin

    codigoDaOs := DataSource1.DataSet.FieldByName('ID_ORDEM').AsInteger;

    try
      formCriarConsultarOrdemServico :=
        TformCriarConsultarOrdemServico.Create(self);
      TFactory.new.criarJanela.FormShow(formCriarConsultarOrdemServico, '');
    finally
      FEntityOrdensServico.atualizar;
    end;

  end;
end;

procedure TformOrdemServico.DBGrid1TitleClick(Column: TColumn);
begin
  FEntityOrdensServico.ordenarGrid(Column);
end;

procedure TformOrdemServico.edtPesquisarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case TEnumPesquisar(cbPesquisar.ItemIndex) of
    codigo_ordem:
      begin
        FCampo := 'ID_ORDEM';
      end;
    codigo_cliente:
      begin
        FCampo := 'ID_CLIENTE';
      end;
    nome_cliente:
      begin
        FCampo := 'NOME_CLIENTE';
      end;
    CPF:
      begin
        FCampo := 'CPF_CNPJ';
      end;

  end;

  if edtPesquisar.Text <> EmptyStr then
    FEntityOrdensServico.getCampo(FCampo).getValor(edtPesquisar.Text)
      .sqlPesquisa.listarGrid(DataSource1);

end;

procedure TformOrdemServico.FormCreate(Sender: TObject);
begin
  FEntityOrdensServico := TEntityListarOrdensServico.new;
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TformOrdemServico.FormShow(Sender: TObject);
begin
  FEntityOrdensServico.abrir.listarGrid(DataSource1);
end;

procedure TformOrdemServico.Panel1MouseDown(Sender: TObject;
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

procedure TformOrdemServico.sbExportarClick(Sender: TObject);
begin
  FEntityOrdensServico.exportar;
end;

procedure TformOrdemServico.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformOrdemServico.sbImprimirClick(Sender: TObject);
begin
  { C�DIFICAR ESTA PARTE PARA A IMPESS�O DA ORDEM DE SERVI�O SELECIONADA }
end;

procedure TformOrdemServico.SpeedButton1Click(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount >= 1 then
  begin

    codigoDaOs := DataSource1.DataSet.FieldByName('ID_ORDEM').AsInteger;

    try
      formCriarConsultarOrdemServico :=
        TformCriarConsultarOrdemServico.Create(self);
      TFactory.new.criarJanela.FormShow(formCriarConsultarOrdemServico, '');
    finally
      FEntityOrdensServico.atualizar;
    end;

  end;
end;

procedure TformOrdemServico.SpeedButton2Click(Sender: TObject);
begin
FEntityOrdensServico
                    .getDataInicial(StrToDate(edtData1.Text))
                    .getDataFinal(StrToDate(edtData2.Text))
                    .getCampo('DATA_DE_ENTRADA')
                    .sqlPesquisaData
                    .listarGrid(DataSource1);
end;

procedure TformOrdemServico.VerCadastro1Click(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    formCadastroDeClientes := TformCadastroDeClientes.Create(self);
    TFactory.new.criarJanela.FormShow(formCadastroDeClientes, '');
  end;
end;

procedure TformOrdemServico.VerOrdemdeServio1Click(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount >= 1 then
  begin

    codigoDaOs := DataSource1.DataSet.FieldByName('ID_ORDEM').AsInteger;

    try
      formCriarConsultarOrdemServico :=
        TformCriarConsultarOrdemServico.Create(self);
      TFactory.new.criarJanela.FormShow(formCriarConsultarOrdemServico, '');
    finally
      FEntityOrdensServico.atualizar;
    end;

  end;
end;

end.
