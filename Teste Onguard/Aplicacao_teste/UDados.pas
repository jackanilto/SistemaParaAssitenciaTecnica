unit UDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, Data.DB, Vcl.Forms, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider, Datasnap.DBClient,
  FireDAC.Comp.DataSet;

type
  Ttabela = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDPhysFBDriverLink2: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery1ID: TIntegerField;
    FDQuery1CC1: TStringField;
    FDQuery1CC2: TStringField;
    FDQuery1CC3: TStringField;
    FDQuery1CC4: TStringField;
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tabela: Ttabela;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Ttabela.FDConnection1BeforeConnect(Sender: TObject);
begin
  FDPhysFBDriverLink2.VendorLib := ExtractFilePath(application.exename) +
    'fbclient.dll';
end;

end.
