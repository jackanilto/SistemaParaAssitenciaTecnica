unit UForm.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, UInterfaces,
  UClasse.Query, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Button2: TButton;
    FDStoredProc1: TFDStoredProc;
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
    FQuerycon: iConexaoQuery;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FQuerycon.Query('grupos').DataSet(DataSource1)
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FQuerycon.getCampo('GRUPO').getValor(Edit1.Text).sqlPesquisa('GRUPOS')
    .DataSet(DataSource1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  showmessage(inttostr(FQuerycon.codigoCadastro('SP_GEN_GRUPOS_ID')));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
//  FQuerycon.inserir;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
//  FQuerycon.getValor(Edit3.Text).gravar;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
//  FQuerycon.getValor(Edit3.Text).editar;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
//  FQuerycon.deletar;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
//  FQuerycon.atualizar;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Edit1.Text := DataSource1.DataSet.FieldByName('grupo').Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FQuerycon := TConexaoQuery.new;
  FQuerycon.Query('grupos').getCampo('id').getValor('0').sqlPesquisa('grupos')
    .DataSet(DataSource1);
  ReportMemoryLeaksOnShutdown := True;
end;

end.
