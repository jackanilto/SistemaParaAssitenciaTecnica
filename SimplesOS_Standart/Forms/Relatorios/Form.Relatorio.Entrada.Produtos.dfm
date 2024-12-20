inherited formRelatorioEntradasDeProdutos: TformRelatorioEntradasDeProdutos
  Caption = 'Relat'#243'rio - Entrada de produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    inherited sbImprimir: TSpeedButton
      Left = 30
      OnClick = sbImprimirClick
      ExplicitLeft = 30
    end
    inherited sbExportar: TSpeedButton
      OnClick = sbExportarClick
    end
    inherited Label4: TLabel
      Left = 687
      ExplicitLeft = 687
    end
    object Label1: TLabel [4]
      Left = 357
      Top = 8
      Width = 185
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'Pesquisa entre datas de entrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object sbPesquisarData: TSpeedButton [5]
      Left = 545
      Top = 22
      Width = 42
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
    object Bevel1: TBevel [6]
      Left = 594
      Top = 9
      Width = 1
      Height = 50
    end
    object Bevel2: TBevel [7]
      Left = 330
      Top = 9
      Width = 1
      Height = 50
    end
    inherited cbPesquisar: TComboBox
      Items.Strings = (
        'C'#243'digo da entrada'
        'C'#243'digo do produto'
        'Produto'
        'N'#250'mero da entrada')
    end
    inherited edtPesquisar: TEdit
      OnKeyUp = edtPesquisarKeyUp
    end
    object edtData1: TMaskEdit
      Left = 357
      Top = 29
      Width = 88
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
      Left = 451
      Top = 29
      Width = 93
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
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnTitleClick = DBGrid1TitleClick
  end
  inherited frxDBDataset1: TfrxDBDataset
    DataSource = DataSource1
  end
  inherited frxReport1: TfrxReport
    ReportOptions.CreateDate = 43885.645193877320000000
    ReportOptions.LastChange = 43885.656786180550000000
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Datasets = <
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 279.685220000000000000
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
            'Relat'#243'rio Entrada de Produtos')
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
          Left = -1.000000000000000000
          Top = 245.669450000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          Frame.Typ = []
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 253.228510000000000000
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
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 253.228510000000000000
          Width = 173.858380000000000000
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
          Left = 307.141930000000000000
          Top = 253.228510000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'QTDE')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 374.393940000000000000
          Top = 253.228510000000000000
          Width = 94.488250000000000000
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
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 482.441250000000000000
          Top = 253.228510000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero da nota')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 641.181510000000000000
          Top = 253.228510000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 245.669450000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 245.669450000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Top = 245.669450000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 245.669450000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Top = 245.669450000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 49.133890000000000000
          Frame.Typ = []
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 5.779530000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ID_PRODUTO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 2.779530000000000000
          Width = 173.858380000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."PRODUTO"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 305.362400000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."QUANTIDADE"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 375.393940000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 41.574830000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."TOTAL_DA_ENTRADA"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 483.338900000000000000
          Top = 2.559060000000000000
          Width = 143.622140000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NUMERO_NOTA"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 641.520100000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATA"]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 468.661720000000000000
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
