unit modulo.conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tmodulo_conexao = class(TDataModule)
    conexao: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure conexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modulo_conexao: Tmodulo_conexao;
  funcionarioLogado: Integer;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure Tmodulo_conexao.conexaoBeforeConnect(Sender: TObject);
begin
  FDPhysFBDriverLink1.VendorLib := ExtractFiledir(GetCurrentDir)+
    '\fbclient.dll';
  funcionarioLogado := 1;
end;

end.
