unit UClasse.Imprimir.Parcelas;

interface

uses UInterfaces, Data.DB, FireDAC.Comp.Client, UDados.Conexao,
  System.SysUtils;

type
  TImprimirParcelasVenda = class(TInterfacedObject, iImprimirParcelasVendas)
  private
    FQueryParcelas: TFDQuery;
    FQueryConfigParcelas: TFDQuery;
  public
    function selecionarParcelas(value: integer): iImprimirParcelasVendas;
    function retornarDataSet(value: TDataSource): iImprimirParcelasVendas;
    function retonarJurosMultaAtraso(value: TDataSource)
      : iImprimirParcelasVendas;
    constructor create;
    destructor destroy; override;
    class function new: iImprimirParcelasVendas;
  end;

implementation

{ TImprimirParcelasVenda }

constructor TImprimirParcelasVenda.create;
begin

  FQueryParcelas := TFDQuery.create(nil);
  FQueryParcelas.Connection := DataModule1.Conexao;

  FQueryConfigParcelas := TFDQuery.create(nil);
  FQueryConfigParcelas.Connection := DataModule1.Conexao;

end;

destructor TImprimirParcelasVenda.destroy;
begin
  FreeAndNil(FQueryParcelas);
  FreeAndNil(FQueryConfigParcelas);
  inherited;
end;

class function TImprimirParcelasVenda.new: iImprimirParcelasVendas;
begin
  result := self.create;
end;

function TImprimirParcelasVenda.retonarJurosMultaAtraso(value: TDataSource)
  : iImprimirParcelasVendas;
begin

  result := self;

  FQueryConfigParcelas.Active := false;
  FQueryConfigParcelas.SQL.Clear;
  FQueryConfigParcelas.SQL.Add('select * from CONFIGURAR_PARCELA');
  FQueryConfigParcelas.Active := true;

  value.DataSet := FQueryConfigParcelas;

end;

function TImprimirParcelasVenda.retornarDataSet(value: TDataSource)
  : iImprimirParcelasVendas;
begin
  result := self;
  value.DataSet := FQueryParcelas;
end;

function TImprimirParcelasVenda.selecionarParcelas(value: integer)
  : iImprimirParcelasVendas;
begin

  result := self;

  FQueryParcelas.Active := false;
  FQueryParcelas.SQL.Clear;
  FQueryParcelas.SQL.Add('select * from PARCELAS_VENDAS where id_venda =:i');
  FQueryParcelas.ParamByName('i').AsInteger := value;
  FQueryParcelas.Active := true;

end;

end.
