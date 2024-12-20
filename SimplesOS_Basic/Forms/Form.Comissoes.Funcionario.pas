unit Form.Comissoes.Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UClasse.Entity.Comissoes.Funcionario, UInterfaces;

type
  TformComissoesFuncionarios = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    edtCodigoFuncionario: TEdit;
    edtValorComissao: TEdit;
    edtObservacao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtAplicarComissao: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure sbNovoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    FEntityComissoes: iComissoesFuncionario;
  public
    { Public declarations }
  end;

var
  formComissoesFuncionarios: TformComissoesFuncionarios;

implementation

{$R *.dfm}

uses Form.Cadastro.Funcionarios, softMeter_globalVar;

procedure TformComissoesFuncionarios.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DataSource1.DataSet do
  begin
    edtCodigo.Text := inttostr(FieldByName('ID').AsInteger);
    edtCodigoFuncionario.Text :=
      inttostr(FieldByName('ID_FUNCIONARIO').AsInteger);
    edtAplicarComissao.Text := FieldByName('APLICAR_COMISSAO').AsString;
    edtValorComissao.Text := CurrToStr(FieldByName('VALOR_POR_ATENDIMENTO')
      .AsCurrency);
    edtObservacao.Text := FieldByName('OBSERVACAO').AsString;
  end;
end;

procedure TformComissoesFuncionarios.DBGrid1CellClick(Column: TColumn);
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

procedure TformComissoesFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityComissoes := TEntityComissoesFuncionarios.new;
  dllSoftMeter.sendEvent('config comissoes funcionarios', 'comissoes', 0);
end;

procedure TformComissoesFuncionarios.FormShow(Sender: TObject);
begin
  inherited;

  FEntityComissoes.abrir.listarGrid(DataSource1);

  FEntityComissoes.getCampo('ID_FUNCIONARIO').sqlPesquisaEstatica
    (codigoFuncionario).listarGrid(DataSource1);

end;

procedure TformComissoesFuncionarios.sbCancelarClick(Sender: TObject);
begin
  inherited;
  FEntityComissoes.cancelar;
end;

procedure TformComissoesFuncionarios.sbEditarClick(Sender: TObject);
begin
  if codigoFuncionario <> 0 then
  begin
    FEntityComissoes.editar;
    inherited;
    edtValorComissao.SetFocus;
  end;

end;

procedure TformComissoesFuncionarios.sbExcluirClick(Sender: TObject);
begin
  inherited;
  FEntityComissoes.deletar;
end;

procedure TformComissoesFuncionarios.sbNovoClick(Sender: TObject);
begin

  if codigoFuncionario <> 0 then
  begin

    FEntityComissoes.getCampo('ID_FUNCIONARIO')
      .getValor(codigoFuncionario.ToString).sqlPesquisaEstatica.listarGrid
      (DataSource1);

    inherited;

    FEntityComissoes.inserir;
    edtCodigoFuncionario.Text := codigoFuncionario.ToString;
    edtAplicarComissao.SetFocus;

  end;
end;

procedure TformComissoesFuncionarios.sbSalvarClick(Sender: TObject);
begin

  FEntityComissoes.getID_FUNCIONARIO(strtoint(edtCodigoFuncionario.Text))
    .getAPLICAR_COMISSAO(edtAplicarComissao.Text).getVALOR_POR_ATENDIMENTO
    (edtValorComissao.Text).getObservacao(edtObservacao.Text).gravar;

  inherited;

end;

end.
