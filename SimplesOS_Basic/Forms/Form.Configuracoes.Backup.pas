unit Form.Configuracoes.Backup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, UClasse.Config.Backup;

type
  TformConfiguracoesBackUp = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    lblCaption: TLabel;
    Panel2: TPanel;
    sbNovo: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbEditar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    DBGrid1: TDBGrid;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbNovoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  var
    FConfigBackup: TClasseConfigBackUp;
  public
    { Public declarations }
  end;

var
  formConfiguracoesBackUp: TformConfiguracoesBackUp;

implementation

{$R *.dfm}

uses softMeter_globalVar;

procedure TformConfiguracoesBackUp.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  MaskEdit1.Text := TimeToStr(DataSource1.DataSet.FieldByName('horario')
    .AsDateTime);
end;

procedure TformConfiguracoesBackUp.DBGrid1CellClick(Column: TColumn);
begin

  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    sbNovo.Enabled := true;
    sbSalvar.Enabled := false;
    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;
    sbCancelar.Enabled := true;
  end
  else
  begin
    sbNovo.Enabled := true;
    sbSalvar.Enabled := false;
    sbEditar.Enabled := false;
    sbExcluir.Enabled := false;
    sbCancelar.Enabled := false;
  end;

end;

procedure TformConfiguracoesBackUp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FConfigBackup);
end;

procedure TformConfiguracoesBackUp.FormCreate(Sender: TObject);
begin
  FConfigBackup := TClasseConfigBackUp.create;
  dllSoftMeter.sendEvent('configuracoes de backup', 'config backup', 0);
end;

procedure TformConfiguracoesBackUp.FormShow(Sender: TObject);
begin

  FConfigBackup.retornarDados(DataSource1);
  lblCaption.Caption := formConfiguracoesBackUp.Caption;

  sbNovo.Enabled := true;
  sbSalvar.Enabled := false;
  sbEditar.Enabled := false;
  sbExcluir.Enabled := false;
  sbCancelar.Enabled := false;

end;

procedure TformConfiguracoesBackUp.Panel1MouseDown(Sender: TObject;
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

procedure TformConfiguracoesBackUp.sbCancelarClick(Sender: TObject);
begin

  FConfigBackup.cancelar;

  sbNovo.Enabled := true;
  sbSalvar.Enabled := false;
  sbEditar.Enabled := false;
  sbExcluir.Enabled := false;
  sbCancelar.Enabled := false;

end;

procedure TformConfiguracoesBackUp.sbEditarClick(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    FConfigBackup.editar;

    sbNovo.Enabled := false;
    sbSalvar.Enabled := true;
    sbEditar.Enabled := false;
    sbExcluir.Enabled := false;
    sbCancelar.Enabled := true;

  end;
end;

procedure TformConfiguracoesBackUp.sbExcluirClick(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount >= 1 then
  begin
    if application.MessageBox('Deseja realmente excluir este reglistro?',
      'Pergunta do sistema', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin
      FConfigBackup.excluir;

      sbNovo.Enabled := true;
      sbSalvar.Enabled := false;
      sbEditar.Enabled := false;
      sbExcluir.Enabled := true;
      sbCancelar.Enabled := false;

    end;

  end;
end;

procedure TformConfiguracoesBackUp.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TformConfiguracoesBackUp.sbNovoClick(Sender: TObject);
begin
  MaskEdit1.SetFocus;
  FConfigBackup.inserir;

  sbNovo.Enabled := false;
  sbSalvar.Enabled := true;
  sbEditar.Enabled := false;
  sbExcluir.Enabled := false;
  sbCancelar.Enabled := true;


end;

procedure TformConfiguracoesBackUp.sbSalvarClick(Sender: TObject);
begin

  if MaskEdit1.Text <> '00:00:00' then
  begin
    FConfigBackup.gravar(MaskEdit1.Text);

    sbNovo.Enabled := true;
    sbSalvar.Enabled := false;
    sbEditar.Enabled := true;
    sbExcluir.Enabled := true;
    sbCancelar.Enabled := false;

  end
  else
  begin
    MessageDlg('ERRO. Digite um hor�rio v�lido. ', mtError, [mbOk], 0, mbOk);
  end;

end;

end.
