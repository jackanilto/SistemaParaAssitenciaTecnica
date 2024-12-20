inherited formRelatorioVendas: TformRelatorioVendas
  Caption = 'Relatorio de vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    inherited sbImprimir: TSpeedButton
      Left = 6
      OnClick = sbImprimirClick
      ExplicitLeft = 6
    end
    inherited sbExportar: TSpeedButton
      Left = 142
      OnClick = sbExportarClick
      ExplicitLeft = 142
    end
    object Label1: TLabel [4]
      Left = 349
      Top = 8
      Width = 178
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'Pesquisa entre data de compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel [5]
      Left = 592
      Top = 8
      Width = 1
      Height = 50
      Anchors = [akRight, akBottom]
    end
    object Bevel2: TBevel [6]
      Left = 312
      Top = 8
      Width = 1
      Height = 50
      Anchors = [akRight, akBottom]
    end
    object sbPesquisarData: TSpeedButton [7]
      Left = 533
      Top = 22
      Width = 36
      Height = 33
      Anchors = [akRight, akBottom]
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C30E0000C30E0000000000000000000099361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361AA34A31DDBDB4F9F2F1E4CAC3A9
        563E99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361AA34A31E9D3CDFFFF
        FFFFFFFFFFFFFFE4CAC399361A99361A99361A99361A99361A99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361AA0442A
        EAD6D0FFFFFFFEFEFEFEFEFEFFFFFFF9F2F199361A99361A99361A99361A9936
        1A99361AA0442AB97562D1A497DEBEB5E2C6BEDCBAB0CB9889B165509C3C2199
        361AA34A31EAD6D0FEFEFEFFFFFFFFFFFFFEFEFEFFFFFFDDBDB499361A99361A
        99361A99361AA0442ACB9889F5EBE8FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFCF9F9EBD8D3BF8270E8D2CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D2CCA3
        4A3199361A99361A99361AAB5942ECD9D4FEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
        FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
        FEEAD6D0A34A3199361A99361A99361AAD5D47F7F0EEFFFFFFFFFFFFFFFFFFF9
        F4F2E2C7BFCFA093CA9688D3A89CE9D3CDFDFAFAFFFFFFFEFEFEFFFFFFFFFFFF
        FEFEFEFFFFFFEAD6D0A0442A99361A99361A99361AA34A31F0E1DDFFFFFFFFFF
        FFFDFCFBD8B2A7A7523A9A381C99361A99361A99361A9B3B1FAF624CE5CDC6FF
        FFFFFFFFFFFFFFFFFFFFFFE8D2CCA34A3199361A99361A99361A99361AD5ADA2
        FEFEFEFEFEFEFDFCFBC790809A381C99361A99361A99361A99361A99361A9936
        1A99361A9C3C21DAB6ACFEFEFEFEFEFEFEFEFEBF817099361A99361A99361A99
        361AA9563EFAF6F4FFFFFFFEFEFED1A49799361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A9C3C21E5CDC6FFFFFFFEFEFEEBD8D39C3C
        2199361A99361A99361AC99586FFFFFFFFFFFFF2E6E2A2472E99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361AAF624CFDFAFA
        FFFFFFFDFAFAB1655099361A99361A99361AE4C9C2FFFFFFFEFEFED2A89C9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A9B3B1FE9D3CDFEFEFEFFFFFFCB988999361A99361A99361AF5EBE8FFFFFF
        FFFFFFBA776499361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361AD3A89CFEFEFEFFFFFFDCBAB099361A99361A99
        361AFAF6F4FFFFFFFFFFFFB2675299361A99361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A99361A99361AC99687FFFFFFFFFFFFE2C6
        BE99361A99361A99361AF6EEECFFFFFFFEFEFEB7705C99361A99361A99361A99
        361A99361A99361A99361A99361A99361A99361A99361A99361A99361ACFA093
        FEFEFEFEFEFEDEBEB599361A99361A99361AE9D3CDFFFFFFFFFFFFCB998B9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A9A381CE2C7BFFEFEFEFFFFFFD1A49799361A99361A99361AD1A497FFFFFF
        FFFFFFECD9D49D3E2399361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361AA7523AF9F4F2FFFFFFFEFDFDB9756299361A99361A99
        361AB16550FDFAFAFEFEFEFDFCFCC0837299361A99361A99361A99361A99361A
        99361A99361A99361A99361A99361A9A381CD8B2A7FEFEFEFEFEFEF4EAE7A044
        2A99361A99361A99361A9A381CE2C6BEFEFEFEFEFEFEF9F2F1B3685399361A99
        361A99361A99361A99361A99361A99361A99361A99361AC68F80FDFCFBFEFEFE
        FEFEFECA978999361A99361A99361A99361A99361AAC5C45F8F1EFFFFFFFFFFF
        FFF9F2F1C083729D3E2399361A99361A99361A99361A99361AA2472ED1A497FD
        FCFBFFFFFFFFFFFFECD9D4A0442A99361A99361A99361A99361A99361A99361A
        BC7B69FDFCFCFFFFFFFEFEFEFDFCFCECD9D4CB998BB7705CB26752BA7764D2A8
        9CF2E6E2FEFEFEFEFEFEFFFFFFF7F0EEAB594299361A99361A99361A99361A99
        361A99361A99361A99361ABC7B69F7F0EEFFFFFFFEFEFEFFFFFFFFFFFFFEFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E1DDAD5D4799361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361AAC5C45E2C6BEFDFAFAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6F4D5ADA2A34A3199361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A9A381CB16550D1A599E9D3CDF6EEECFAF6F4F4EAE7E4C9C2C99586A9563E99
        361A99361A99361A99361A99361A99361A99361A99361A99361A}
      OnClick = sbPesquisarDataClick
    end
    inherited cbPesquisar: TComboBox
      Items.Strings = (
        'Venda'
        'C'#243'd. Cliente'
        'Cliente')
    end
    inherited edtPesquisar: TEdit
      OnKeyUp = edtPesquisarKeyUp
    end
    object edtData1: TMaskEdit
      Left = 349
      Top = 29
      Width = 86
      Height = 23
      Anchors = [akRight, akBottom]
      EditMask = '00/00/0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
    end
    object edtData2: TMaskEdit
      Left = 440
      Top = 29
      Width = 87
      Height = 23
      Anchors = [akRight, akBottom]
      EditMask = '00/00/0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  /  /    '
    end
  end
  inherited DBGrid1: TDBGrid
    Height = 232
    Align = alTop
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnCellClick = DBGrid1CellClick
    OnTitleClick = DBGrid1TitleClick
  end
  object GroupBox1: TGroupBox [3]
    Left = 0
    Top = 296
    Width = 1019
    Height = 192
    Align = alBottom
    Caption = 'Lista de produtos'
    TabOrder = 3
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 1015
      Height = 175
      Align = alClient
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
    end
  end
  inherited frxDBDataset1: TfrxDBDataset
    DataSource = DataSource1
  end
  inherited frxReport1: TfrxReport
    ReportOptions.CreateDate = 43884.443755879630000000
    ReportOptions.LastChange = 43884.469125729160000000
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Datasets = <
      item
        DataSet = frxDB_ItensVenda
        DataSetName = 'frxDB_ItensVenda'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      VGuides.Strings = (
        '105,82684'
        '385,51206'
        '502,67749'
        '593,38621')
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 544.252320000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'roboto'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dados da Venda')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 22.779530000000000000
          Top = 60.692950000000000000
          Width = 665.197280000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 64.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Top = 188.976500000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Top = 219.212740000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Top = 249.448980000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 198.535560000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Venda:')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 198.315090000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ID"]')
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 228.771800000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'd. Cliente:')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 230.551330000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ID_CLIENTE"]')
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 222.771800000000000000
          Top = 219.212740000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 230.551330000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente:')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 283.464750000000000000
          Top = 230.551330000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOME_CLIENTE"]')
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Top = 279.685220000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Top = 309.921460000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Shape6: TfrxShapeView
          AllowVectorExport = True
          Top = 340.157700000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 260.787570000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Funcion'#225'rio:')
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 260.787570000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."FUNCIONARIO"]')
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 192.756030000000000000
          Top = 249.448980000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 260.787570000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome funcion'#225'rio:')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 260.787570000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOME_FUNCIONARIO"]')
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 291.023810000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Data da venda:')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 291.023810000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATA_VENDA"]')
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 279.685220000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 291.023810000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Hor'#225'rio da venda:')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 291.023810000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."HORA_VENDA"]')
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 442.205010000000000000
          Top = 279.685220000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984540000000000000
          Top = 291.023810000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Subtotal:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 506.457020000000000000
          Top = 291.023810000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."SUBTOTAL"]')
          ParentFont = False
        end
        object Shape7: TfrxShapeView
          AllowVectorExport = True
          Top = 370.393940000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 320.480520000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Desconto:')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 321.260050000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DESCONTO"]')
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 309.921460000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 321.260050000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Acr'#233'scimo:')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 321.260050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ACRESCIMO"]')
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Top = 309.921460000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 321.260050000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984540000000000000
          Top = 321.260050000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."TOTAL"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 351.275820000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QTDE. Parcelas:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 351.496290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."QUANTIDADE_PARCELAS"]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 219.212740000000000000
          Top = 340.157700000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 351.496290000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 351.496290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."STATUS"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 381.732530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Observa'#231#227'o:')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 95.267780000000000000
          Top = 381.732530000000000000
          Width = 612.283860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."OBSERACAO"]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 434.645950000000000000
          Width = 672.756340000000000000
          Color = clBlack
          Frame.Typ = []
          Frame.Width = 2.000000000000000000
          Diagonal = True
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = -1.779530000000000000
          Top = 453.543600000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Itens da venda')
          ParentFont = False
        end
        object Shape8: TfrxShapeView
          AllowVectorExport = True
          Top = 514.016080000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 521.575140000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'd. Produto')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 521.575140000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 389.291590000000000000
          Top = 521.575140000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor unit'#225'rio')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 506.457020000000000000
          Top = 521.575140000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 521.575140000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 514.016080000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 514.016080000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Top = 514.016080000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 514.016080000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 623.622450000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_ItensVenda
        DataSetName = 'frxDB_ItensVenda'
        RowCount = 0
        object Shape9: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 5.338590000000000000
          Top = 1.559060000000000000
          Width = 90.708720000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."ID_PRODUTO"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 112.385900000000000000
          Top = 2.779530000000000000
          Width = 268.346630000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."PRODUTO"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Top = 2.779530000000000000
          Width = 102.047310000000000000
          Height = 26.456710000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."VALOR_UNITARIO"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 508.236550000000000000
          Top = 1.779530000000000000
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."QUANTIDADE"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 599.386210000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."TOTAL"]')
          ParentFont = False
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line16: TfrxLineView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line17: TfrxLineView
          AllowVectorExport = True
          Left = 105.826840000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 714.331170000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
    end
  end
  object DataSource2: TDataSource
    Left = 512
    Top = 392
  end
  object PopupMenu1: TPopupMenu
    Left = 400
    Top = 120
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
      OnClick = Imprimir1Click
    end
    object Exportar1: TMenuItem
      Caption = 'Exportar'
      OnClick = Exportar1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 320
    Top = 376
    object Imprimir2: TMenuItem
      Caption = 'Imprimir'
      OnClick = Imprimir2Click
    end
    object Exportar2: TMenuItem
      Caption = 'Exportar'
      OnClick = Exportar2Click
    end
  end
  object frxDB_ItensVenda: TfrxDBDataset
    UserName = 'frxDB_ItensVenda'
    CloseDataSource = False
    DataSource = DataSource2
    BCDToCurrency = False
    Left = 696
    Top = 331
  end
  object frx_ItensVenda: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43884.471038333340000000
    ReportOptions.LastChange = 43884.478047256950000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 568
    Top = 331
    Datasets = <
      item
        DataSet = frxDB_ItensVenda
        DataSetName = 'frxDB_ItensVenda'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 211.653680000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -24
          Font.Name = 'roboto'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dados da Venda (Lista de Produtos)')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 22.779530000000000000
          Top = 53.133890000000000000
          Width = 665.197280000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 56.913420000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Top = 181.417440000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 188.976500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Venda')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 188.976500000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 411.968770000000000000
          Top = 188.976500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor unit'#225'rio')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 515.236550000000000000
          Top = 188.976500000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 603.945270000000000000
          Top = 189.196970000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 181.417440000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 408.189240000000000000
          Top = 181.417440000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 181.417440000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 181.417440000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_ItensVenda
        DataSetName = 'frxDB_ItensVenda'
        RowCount = 0
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 2.559060000000000000
          Width = 94.488250000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."ID_VENDA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 1.779530000000000000
          Width = 283.464750000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."PRODUTO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 413.748300000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."VALOR_UNITARIO"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 515.575140000000000000
          Top = 2.779530000000000000
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."QUANTIDADE"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 607.504330000000000000
          Top = 2.779530000000000000
          Width = 102.047310000000000000
          Height = 26.456710000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ItensVenda."TOTAL"]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 408.189240000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 105.826840000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
    end
  end
end
