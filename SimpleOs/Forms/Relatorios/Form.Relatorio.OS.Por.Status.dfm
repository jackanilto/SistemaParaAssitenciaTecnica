inherited formRelatorioOSPorStatus: TformRelatorioOSPorStatus
  Caption = 'Relat'#243'rio de OS por Situa'#231#227'o'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    inherited sbImprimir: TSpeedButton
      Left = 7
      Width = 114
      ExplicitLeft = 7
      ExplicitWidth = 114
    end
    inherited sbExportar: TSpeedButton
      Left = 127
      ExplicitLeft = 127
    end
    inherited Label4: TLabel
      Left = 941
      Top = -32
      Visible = False
      ExplicitLeft = 941
      ExplicitTop = -32
    end
    inherited Label5: TLabel
      Left = 1076
      Top = -32
      Visible = False
      ExplicitLeft = 1076
      ExplicitTop = -32
    end
    object Bevel2: TBevel [4]
      Left = 247
      Top = 9
      Width = 1
      Height = 50
    end
    object Label1: TLabel [5]
      Left = 266
      Top = 10
      Width = 136
      Height = 15
      Caption = 'Selecionar por Situa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    inherited cbPesquisar: TComboBox
      Left = 967
      Top = -11
      Visible = False
      ExplicitLeft = 967
      ExplicitTop = -11
    end
    inherited edtPesquisar: TEdit
      Left = 1076
      Top = -11
      Visible = False
      ExplicitLeft = 1076
      ExplicitTop = -11
    end
    object TComboBox
      Left = 266
      Top = 29
      Width = 145
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 440
      Top = 2
      Width = 579
      Height = 62
      TabOrder = 3
      DesignSize = (
        579
        62)
      object sbPesquisarDatas: TSpeedButton
        Left = 448
        Top = 18
        Width = 25
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
        ExplicitLeft = 429
      end
      object Label2: TLabel
        Left = 15
        Top = 8
        Width = 87
        Height = 15
        Caption = 'Situa'#231#227'o da OS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 164
        Top = 8
        Width = 40
        Height = 15
        Caption = 'Campo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 263
        Top = 8
        Width = 160
        Height = 15
        Caption = 'Informe o intervalo de datas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object ComboBox1: TComboBox
        Left = 15
        Top = 27
        Width = 143
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object MaskEdit1: TMaskEdit
        Left = 352
        Top = 27
        Width = 71
        Height = 23
        EditMask = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
      end
      object MaskEdit2: TMaskEdit
        Left = 263
        Top = 27
        Width = 83
        Height = 23
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
      object ComboBox2: TComboBox
        Left = 161
        Top = 27
        Width = 98
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
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
  end
  inherited frxReport1: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
