inherited formRelatorioHistoricoOS: TformRelatorioHistoricoOS
  Caption = 'Historico de OS do cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited frxReport1: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
  end
  inherited frx_RelatorioClientes: TfrxReport
    Datasets = <
      item
        DataSet = frxDB_RelatorioClientes
        DataSetName = 'frxDB_RelatorioClientes'
      end>
    Variables = <>
    Style = <>
  end
end
