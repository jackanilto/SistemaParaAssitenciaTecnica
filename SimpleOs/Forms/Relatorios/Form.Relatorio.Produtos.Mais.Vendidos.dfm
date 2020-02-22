inherited formRelatorioProdutosMaisVendidos: TformRelatorioProdutosMaisVendidos
  Caption = 'Produtos mais vendidos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    inherited sbImprimir: TSpeedButton
      OnClick = sbImprimirClick
    end
    inherited sbExportar: TSpeedButton
      OnClick = sbExportarClick
    end
    inherited Label4: TLabel
      Visible = False
    end
    inherited Label5: TLabel
      Visible = False
    end
    object SpeedButton1: TSpeedButton [4]
      Left = 297
      Top = 17
      Width = 161
      Height = 35
      Hint = 'Exportar dados da tabela'
      Caption = 'Mais Vendidos'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361A99361AA64F37C18675DDBDB4EFDFDBF9F2F1F8F1
        F0F1E3DFE1C3BBC58C7CA7523A99361A99361A99361A99361A99361A99361A99
        361A99361A2099361A99361A99361A99361A99361AA34A31D5ADA2F8F1EFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F1F0D9B4AAA6513899
        361A99361A99361A99361A99361A99361A3E99361A99361A99361A99361AB66F
        5BF2E6E3FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFE
        FEFEFFFFFFFEFEFEF6EEEBBD7D6B99361A99361A99361A99361A99361A209936
        1A99361A99361ABF806EFCF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFDFCFBC7908099361A
        99361A99361A99361A2099361A99361AB56D59FBF8F7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFCFBBD7E6C99361A99361A99361A6E99361AA2472EF1E4E0FE
        FEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFF
        FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEF6EEECA7523A99361A9936
        1A2099361AD2A69AFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFF
        FFFEFEFEDDBBB29A381C99361A20A34A31F6EEEBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6F4AA574099361A37BF806EFEFEFE
        FEFEFEFEFEFEFFFFFFF9F5F3D6AEA3FCFBFAFEFEFEFEFEFEFFFFFFFEFEFEFEFE
        FEFFFFFFFEFEFEFEFEFEFEFDFDD8B3A8F5EDEAFFFFFFFEFEFEFEFEFEFFFFFFC8
        938499361A37DAB6ACFFFFFFFFFFFFFEFEFEF7EFEDB2685399361AC79080FCF9
        F9FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFDFCFCCFA0939A381CAC5C45F3
        E7E4FFFFFFFEFEFEFFFFFFE4C9C299361A3AEBD8D2FFFFFFFFFFFFFFFFFFD5AC
        A19A381C99361A9B391EC68F80FDFCFBFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDCE
        A0939B3B1F99361A9A381CCC9B8DFFFFFFFFFFFFFFFFFFF4EAE799361A3EF3E7
        E4FFFFFFFEFEFEFEFEFEFCF9F9C68E7F99361A99361A99361AC99586FCFBFAFE
        FEFEFEFEFEFEFDFDD2A69A9A381C99361A99361ABD7E6CFBF7F6FEFEFEFEFEFE
        FFFFFFF9F5F399361A22F3E7E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC68E7F9A
        381C99361A99361AC68F80FDFAFAFDFCFCCFA0939A381C99361A9A381CBD7E6C
        FCFBFAFFFFFFFFFFFFFEFEFEFFFFFFFAF6F499361A69EAD6D0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFCF9F9C68F809A381C99361A9B391EC68F80CFA0939B3B1F
        99361A9A381CBF806EFBF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EBE89936
        1A3AD9B5ABFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFCF9F9C68E7F99361A
        99361A99361A9A381C99361A99361ABE7F6DFAF6F5FEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEE3C9C199361A20BF806EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFEFFFFFFFFFFFFC68E7F9A381C99361A99361A9A381CBD7E6CFCFBFAFFFF
        FFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFC8938499361A72A34A31F6EEEB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9F9C68F809A381C9A38
        1CBF806EFBF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F4F2A9
        563E99361A3A99361AD3A89CFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
        FEFEFEFEFCF9F9C68E7FBE7F6DFAF6F5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEDCBAB099361A99361A2099361AA34930F1E3E0FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCFFFFFFFEFEFEFE
        FEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEF5EDEAA7523A99361A99361A3E9936
        1A99361AB36A55FBF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBBD7D6B
        99361A99361A99361A6599361A99361A99361ABE7F6DFBF8F7FEFEFEFEFEFEFF
        FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        FEFEFEFDFAFAC7908099361A99361A99361A99361A2F99361A99361A99361A99
        361AB56D59F1E5E1FEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF4EBE9BC7B6999361A99361A99361A99361A9936
        1A6499361A99361A99361A99361A99361AA34930D4AB9FF7EFEDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F2F1D9B5ABA64F3799361A9936
        1A99361A99361A99361A99361A6E99361A99361A99361A99361A99361A99361A
        99361AA54E35C18574DDBDB4EFDFDBF7F0EEF9F2F1F1E3DFE0C2B9C48B7BA752
        3A99361A99361A99361A99361A99361A99361A99361A99361A3299361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A64}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton [5]
      Left = 446
      Top = 17
      Width = 179
      Height = 35
      Hint = 'Exportar dados da tabela'
      Caption = 'Menos vendidos'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000120B0000120B0000000000000000000099361A99361A
        99361A99361A99361A99361A99361AA64F37C18675DDBDB4EFDFDBF9F2F1F8F1
        F0F1E3DFE1C3BBC58C7CA7523A99361A99361A99361A99361A99361A99361A99
        361A99361A0099361A99361A99361A99361A99361AA34A31D5ADA2F8F1EFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F1F0D9B4AAA6513899
        361A99361A99361A99361A99361A99361A8099361A99361A99361A99361AB66F
        5BF2E6E3FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFE
        FEFEFFFFFFFEFEFEF6EEEBBD7D6B99361A99361A99361A99361A99361A4B9936
        1A99361A99361ABF806EFCF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFDFCFBC7908099361A
        99361A99361A99361A7799361A99361AB56D59FBF8F7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFCFBBD7E6C99361A99361A99361A0099361AA2472EF1E4E0FE
        FEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFCFBFAFFFFFF
        FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEF6EEECA7523A99361A9936
        1A0E99361AD2A69AFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDFAFAC58D7DBD7D6BFBF7F6FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFF
        FFFEFEFEDDBBB29A381C99361A00A34A31F6EEEBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFDFAFAC68E7F9A381C9A381CBE7F6DFBF7F6FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6F4AA574099361A80BF806EFEFEFE
        FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEC58C7C9A381C99361A9936
        1A9A381CBD7D6BFCFBFAFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFC8
        938499361A4BDAB6ACFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFAFAC58D
        7D99361A99361A99361A9A381C99361A99361ABD7D6BFBF7F6FFFFFFFEFEFEFF
        FFFFFFFFFFFEFEFEFFFFFFE4C9C299361A77EBD8D2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFDFAFAC68E7F9A381C99361A9B391EC79182CFA1949B3B1F99361A9A
        381CBE7F6DFBF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EAE799361A00F3E7
        E4FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEC58C7C9A381C99361A99361AC79182FC
        FBFAFDFCFCD0A2959A381C99361A9A381CBD7D6BFCFBFAFFFFFFFEFEFEFEFEFE
        FFFFFFF9F5F399361A00F3E7E4FFFFFFFFFFFFFFFFFFFDFAFAC58D7D99361A99
        361A99361AC99687FDFCFBFFFFFFFEFEFEFEFDFDD2A69A9A381C99361A99361A
        BD7D6AFBF7F6FFFFFFFEFEFEFFFFFFFAF6F499361A00EAD6D0FFFFFFFFFFFFFF
        FFFFD5ADA29A381C99361A9B391EC79182FCFBFAFFFFFFFFFFFFFFFFFFFFFFFF
        FEFDFDCFA1949B3B1F99361A9A381CCB998BFFFFFFFFFFFFFFFFFFF5EBE89936
        1A80D9B5ABFFFFFFFEFEFEFEFEFEF6EEECB3685399361AC79182FCFBFAFEFEFE
        FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFCFCCFA1949A381CAC5C45F3E7E4FEFE
        FEFEFEFEFEFEFEE3C9C199361A4BBF806EFFFFFFFFFFFFFFFFFFFFFFFFFAF6F4
        D6B0A5FDFCFBFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFEFD
        FDD9B4AAF5EDEAFFFFFFFFFFFFFEFEFEFFFFFFC8938499361A77A34A31F6EEEB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F4F2A9
        563E99361A0099361AD3A89CFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
        FEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEDCBAB099361A99361A0E99361AA34930F1E3E0FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFE
        FEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEF5EDEAA7523A99361A99361A0E9936
        1A99361AB36A55FBF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBBD7D6B
        99361A99361A99361A8099361A99361A99361ABE7F6DFBF8F7FEFEFEFEFEFEFF
        FFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFE
        FEFEFEFDFAFAC7908099361A99361A99361A99361A4B99361A99361A99361A99
        361AB56D59F1E5E1FEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF4EBE9BC7B6999361A99361A99361A99361A9936
        1A7799361A99361A99361A99361A99361AA34930D4AB9FF7EFEDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F2F1D9B5ABA64F3799361A9936
        1A99361A99361A99361A99361A0099361A99361A99361A99361A99361A99361A
        99361AA54E35C18574DDBDB4EFDFDBF7F0EEF9F2F1F1E3DFE0C2B9C48B7BA752
        3A99361A99361A99361A99361A99361A99361A99361A99361A0E99361A99361A
        99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A9936
        1A99361A99361A99361A99361A99361A99361A99361A99361A99361A99361A99
        361A99361A0E}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    inherited cbPesquisar: TComboBox
      Visible = False
    end
    inherited edtPesquisar: TEdit
      Visible = False
    end
  end
  inherited DBGrid1: TDBGrid
    Font.Height = -13
    Font.Name = 'Segoe UI'
    ParentFont = False
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
  end
  inherited frxDBDataset1: TfrxDBDataset
    DataSource = DataSource1
  end
  inherited frxReport1: TfrxReport
    ReportOptions.CreateDate = 43883.473608344910000000
    ReportOptions.LastChange = 43883.478218738430000000
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
        Height = 241.889920000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
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
            'Relat'#243'rio Produtos Mais / Menos Vendidos')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 22.779530000000000000
          Top = 64.472480000000000000
          Width = 665.197280000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 68.252010000000000000
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
          Top = 211.653680000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 219.212740000000000000
          Width = 109.606370000000000000
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
          Left = 125.724490000000000000
          Top = 219.212740000000000000
          Width = 476.220780000000000000
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
          Left = 616.063390000000000000
          Top = 219.212740000000000000
          Width = 87.929190000000000000
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
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Top = 211.653680000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 608.504330000000000000
          Top = 211.653680000000000000
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
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Frame.Typ = []
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ID_PRODUTO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 7.559060000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."PRODUTO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 616.063390000000000000
          Top = 7.559060000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."QTDE"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 608.504330000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 120.944960000000000000
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
        Top = 411.968770000000000000
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
