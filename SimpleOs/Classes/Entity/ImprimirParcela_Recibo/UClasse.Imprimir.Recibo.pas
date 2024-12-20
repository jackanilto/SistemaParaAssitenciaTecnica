unit UClasse.Imprimir.Recibo;

interface

uses UInterfaces, Data.DB, FireDAC.Comp.Client, UDados.Conexao,
  System.SysUtils;

type
  TImprimirRecibo = class(TInterfacedObject, iImprimirRecibo)
  private
    FQueryVenda: TFDQuery;
    FQueryItensVenda: TFDQuery;
  public
    function selecionarVenda(value: integer): iImprimirRecibo;
    function selecionarItens(value: integer): iImprimirRecibo;
    function retornarDataSet(value: TDataSource): iImprimirRecibo;
    function retornarDataSetItens(value: TDataSource): iImprimirRecibo;
    constructor create;
    destructor destroy; override;
    class function new: iImprimirRecibo;
  end;

implementation

{ TImprimirRecibo }

constructor TImprimirRecibo.create;
begin

  FQueryVenda := TFDQuery.create(nil);
  FQueryVenda.Connection := DataModule1.Conexao;

  FQueryItensVenda := TFDQuery.create(nil);
  FQueryItensVenda.Connection := DataModule1.Conexao;

end;

destructor TImprimirRecibo.destroy;
begin
  FreeAndNil(FQueryVenda);
  FreeAndNil(FQueryItensVenda);
  inherited;
end;

class function TImprimirRecibo.new: iImprimirRecibo;
begin
  result := self.create;
end;

function TImprimirRecibo.retornarDataSet(value: TDataSource): iImprimirRecibo;
begin
  result := self;
  value.DataSet := FQueryVenda;
end;

function TImprimirRecibo.retornarDataSetItens(value: TDataSource)
  : iImprimirRecibo;
begin
  result := self;
  value.DataSet := FQueryItensVenda;
end;

function TImprimirRecibo.selecionarItens(value: integer): iImprimirRecibo;
begin

  result := self;

  FQueryItensVenda.Active := false;
  FQueryItensVenda.SQL.Clear;
  FQueryItensVenda.SQL.Add('select * from ITENS_VENDA where ID_VENDA =:i');
  FQueryItensVenda.ParamByName('i').AsInteger := value;
  FQueryItensVenda.Active := true;

end;

function TImprimirRecibo.selecionarVenda(value: integer): iImprimirRecibo;
begin

  result := self;

  FQueryVenda.Active := false;
  FQueryVenda.SQL.Clear;
  FQueryVenda.SQL.Add('select * from VENDA where id =:i');
  FQueryVenda.ParamByName('i').AsInteger := value;
  FQueryVenda.Active := true;

end;

end.
