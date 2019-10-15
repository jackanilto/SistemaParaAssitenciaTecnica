unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.CategoryButtons, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Menus, UFactory,
  Form.Cadastro.Forma.Pagamento;

type
  TformPrincipal = class(TForm)
    Panel1: TPanel;
    SplitView1: TSplitView;
    sbMenu: TSpeedButton;
    CategoryButtons1: TCategoryButtons;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    CategoryButtons2: TCategoryButtons;
    actionPrincipal: TActionList;
    acSair: TAction;
    acConfiguracoes: TAction;
    acSobre: TAction;
    acExtras: TAction;
    acRelatorios: TAction;
    acMovimentacao: TAction;
    acCadastros: TAction;
    Panel2: TPanel;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image3: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    spvCadastros: TSplitView;
    spvMovimentacao: TSplitView;
    spvRelatorio: TSplitView;
    spvExtras: TSplitView;
    spvSobre: TSplitView;
    spvConfiguracoes: TSplitView;
    imgLogo: TImage;
    CategoryButtons3: TCategoryButtons;
    Button1: TButton;
    PopupMenuFuncionario: TPopupMenu;
    Sair1: TMenuItem;
    Alterarsenha1: TMenuItem;
    acCadastroMarcas: TAction;
    acCadastroGrupos: TAction;
    acFormaPagamento: TAction;
    acTipoRetiradas: TAction;
    acConfigurarParcela: TAction;
    acAtividadeFuncionarios: TAction;
    acContasAPagar: TAction;
    acProblemasFrequentes: TAction;
    acCadastroFornecedores: TAction;
    procedure acSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbMenuClick(Sender: TObject);
    procedure acCadastrosExecute(Sender: TObject);
    procedure acMovimentacaoExecute(Sender: TObject);
    procedure acRelatoriosExecute(Sender: TObject);
    procedure acExtrasExecute(Sender: TObject);
    procedure acSobreExecute(Sender: TObject);
    procedure acConfiguracoesExecute(Sender: TObject);
    procedure acCadastroMarcasExecute(Sender: TObject);
    procedure acCadastroGruposExecute(Sender: TObject);
    procedure acFormaPagamentoExecute(Sender: TObject);
    procedure acTipoRetiradasExecute(Sender: TObject);
    procedure acConfigurarParcelaExecute(Sender: TObject);
    procedure acAtividadeFuncionariosExecute(Sender: TObject);
    procedure acContasAPagarExecute(Sender: TObject);
    procedure acProblemasFrequentesExecute(Sender: TObject);
    procedure acCadastroFornecedoresExecute(Sender: TObject);
  private
    { Private declarations }
  var
    F_SplitView: TSplitView;
    procedure closeSplit;
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses UForm.Exemplo.Embeded, Form.Cadastro.Marcas, Form.Cadastro.Grupos,
  Form.Cadastro.Tipo.Retiradas, Form.Cadastro.Configurar.Parcelas,
  Form.Cadastro.Atividade.Funcionario, Form.Cadastro.Contas.APagar,
  Form.Cadastro.Problemas.Frequentes, Form.Cadastro.Forncedores;

procedure TformPrincipal.acAtividadeFuncionariosExecute(Sender: TObject);
begin
  formAtividadeFuncionario := TformAtividadeFuncionario.Create(self);
  TFactory.new.criarJanela.formShow(formAtividadeFuncionario, '');
end;

procedure TformPrincipal.acCadastroFornecedoresExecute(Sender: TObject);
begin
formCadastroFornecedores := TformCadastroFornecedores.Create(self);
TFactory.new.criarJanela.formShow(formCadastroFornecedores, '');
end;

procedure TformPrincipal.acCadastroGruposExecute(Sender: TObject);
begin
  formCadastroGrupos := TformCadastroGrupos.Create(self);
  TFactory.new.criarJanela.formShow(formCadastroGrupos, '')
end;

procedure TformPrincipal.acCadastroMarcasExecute(Sender: TObject);
begin
  formCadastroMarcas := TformCadastroMarcas.Create(self);
  TFactory.new.criarJanela.formShow(formCadastroMarcas, '')
end;

procedure TformPrincipal.acCadastrosExecute(Sender: TObject);
begin
  if spvCadastros.Opened = true then
    spvCadastros.Opened := false
  else
  begin
    closeSplit;
    spvCadastros.Opened := true;
    F_SplitView := spvCadastros;
  end;

end;

procedure TformPrincipal.acConfiguracoesExecute(Sender: TObject);
begin
  if spvConfiguracoes.Opened = true then
    spvConfiguracoes.Opened := false
  else
  begin
    closeSplit;
    spvConfiguracoes.Opened := true;
    F_SplitView := spvConfiguracoes;
  end;
end;

procedure TformPrincipal.acConfigurarParcelaExecute(Sender: TObject);
begin
  formConfigurarParcelas := TformConfigurarParcelas.Create(self);
  TFactory.new.criarJanela.formShow(formConfigurarParcelas, '');
end;

procedure TformPrincipal.acContasAPagarExecute(Sender: TObject);
begin
  formCadastroContasAPagar := TformCadastroContasAPagar.Create(self);
  TFactory.new.criarJanela.formShow(formCadastroContasAPagar, '');
end;

procedure TformPrincipal.acExtrasExecute(Sender: TObject);
begin
  if spvExtras.Opened = true then
    spvExtras.Opened := false
  else
  begin
    closeSplit;
    spvExtras.Opened := true;
    F_SplitView := spvExtras;
  end;
end;

procedure TformPrincipal.acFormaPagamentoExecute(Sender: TObject);
begin
  formFormaPagamento := TformFormaPagamento.Create(self);
  TFactory.new.criarJanela.formShow(formFormaPagamento, '');
end;

procedure TformPrincipal.acMovimentacaoExecute(Sender: TObject);
begin
  if spvMovimentacao.Opened = true then
    spvMovimentacao.Opened := false
  else
  begin
    closeSplit;
    spvMovimentacao.Opened := true;
    F_SplitView := spvMovimentacao;
  end;
end;

procedure TformPrincipal.acProblemasFrequentesExecute(Sender: TObject);
begin
  formCadastroProblemasFrequentes :=
    TformCadastroProblemasFrequentes.Create(self);
  TFactory.new.criarJanela.formShow(formCadastroProblemasFrequentes, '');
end;

procedure TformPrincipal.acRelatoriosExecute(Sender: TObject);
begin
  if spvRelatorio.Opened = true then
    spvRelatorio.Opened := false
  else
  begin
    closeSplit;
    spvRelatorio.Opened := true;
    F_SplitView := spvRelatorio;
  end;
end;

procedure TformPrincipal.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TformPrincipal.acSobreExecute(Sender: TObject);
begin
  if spvSobre.Opened = true then
    spvSobre.Opened := false
  else
  begin
    closeSplit;
    spvSobre.Opened := true;
    F_SplitView := spvSobre;
  end;
end;

procedure TformPrincipal.acTipoRetiradasExecute(Sender: TObject);
begin
  formTipoRetiradas := TformTipoRetiradas.Create(self);
  TFactory.new.criarJanela.formShow(formTipoRetiradas, '');
end;

procedure TformPrincipal.Button1Click(Sender: TObject);
begin

  formExemploEmbeded := TformExemploEmbeded.Create(self);
  // formExemploEmbeded.Parent := pnlform;
  // formExemploEmbeded.Show;

  try
    formExemploEmbeded.ShowModal;
  finally
    formExemploEmbeded.Free;
  end;

end;

procedure TformPrincipal.FormCreate(Sender: TObject);
begin
  { Centraliza a imagem da LOGO }
  imgLogo.Left := (formPrincipal.Width - Image2.Width) div 2;
  imgLogo.Top := (formPrincipal.Height - Image2.Height) div 2;

  ReportMemoryLeaksOnShutdown := true;

end;

procedure TformPrincipal.closeSplit;
begin
  if Assigned(F_SplitView) then
    F_SplitView.Opened := false;
end;

procedure TformPrincipal.sbMenuClick(Sender: TObject);
begin
  if SplitView1.Opened = true then
    SplitView1.Close
  else
    SplitView1.Open;
end;

end.
