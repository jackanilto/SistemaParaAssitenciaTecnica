inherited formRelatorioVendasInadimplentes: TformRelatorioVendasInadimplentes
  Caption = 'Relat'#243'rio de Vendas dos clientes inadimplentes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    OnTitleClick = DBGrid1TitleClick
  end
  inherited frxReport1: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
