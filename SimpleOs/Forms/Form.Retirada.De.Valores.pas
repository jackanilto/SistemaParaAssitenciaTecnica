unit Form.Retirada.De.Valores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UForm.Exemplo.Embeded, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UInterfaces, UClasse.Entity.Retirada.Valores, Vcl.Mask, UFactory;

type
  TformRetiradaDeValores = class(TformExemploEmbeded)
    DataSource1: TDataSource;
    edtCodigo: TEdit;
    Label1: TLabel;
    edtCodRetirada: TEdit;
    cbMotivoRetirada: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtValor: TEdit;
    Label6: TLabel;
    edtData: TMaskEdit;
    edtHorario: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigoFuncionario: TEdit;
    Label9: TLabel;
    edtObservacao: TEdit;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure cbMotivoRetiradaChange(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
  private
    { Private declarations }
    var
      FEntityRetirada:iRetiradaDeValores;
  public
    { Public declarations }
  end;

var
  formRetiradaDeValores: TformRetiradaDeValores;

implementation

{$R *.dfm}

procedure TformRetiradaDeValores.cbMotivoRetiradaChange(Sender: TObject);
begin
  inherited;

  edtCodRetirada.Text := TFactory
                                .new
                                .localizarRegistroEspecifico
                                .getTabela('TIPO_RETIRADAS')
                                .getCampoRetorno('ID')
                                .localizarRegistro('TIPO_SAIDA', cbMotivoRetirada.Text);


end;

procedure TformRetiradaDeValores.FormCreate(Sender: TObject);
begin
  inherited;
  FEntityRetirada := TEntityRetiradaValores.new;
end;

procedure TformRetiradaDeValores.FormShow(Sender: TObject);
begin
  inherited;

  FEntityRetirada
                .abrir
                .listarGrid(DataSource1);

  TFactory.new
            .ftTable
            .FD_Table('TIPO_RETIRADAS')
            .getCampoTabela('TIPO_SAIDA')
            .popularComponenteComboBox(cbMotivoRetirada)

end;

procedure TformRetiradaDeValores.sbNovoClick(Sender: TObject);
begin
  inherited;
  FEntityRetirada.inserir;
  cbMotivoRetirada.SetFocus;
  edtData.Text := DateToStr(Date);
  edtHorario.Text := TimeToStr(Time);
end;

procedure TformRetiradaDeValores.sbSalvarClick(Sender: TObject);
begin

  FEntityRetirada
                .getID_MOTIVO(edtCodRetirada.Text)
                .getMOTIVO(cbMotivoRetirada.Text)
                .getVALOR_RETIRADA(edtValor.Text)
                .getDATA(edtData.Text)
                .getHORA(edtHorario.Text)
                .getOBSERVACAO(edtObservacao.Text)
                .gravar;

   inherited;

end;

end.
