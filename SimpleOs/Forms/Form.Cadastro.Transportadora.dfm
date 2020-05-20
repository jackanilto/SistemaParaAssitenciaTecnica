inherited formCadastroTransportadora: TformCadastroTransportadora
  Caption = 'Cadastro de transportadora'
  ClientHeight = 579
  ClientWidth = 1057
  ExplicitWidth = 1057
  ExplicitHeight = 579
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1057
    ExplicitWidth = 1057
    inherited sbFechar: TSpeedButton
      Left = 1005
      ExplicitLeft = 1005
    end
    inherited lblCaption: TLabel
      Left = 324
      Width = 198
      Caption = 'Cadastro de transportadora'
      ExplicitLeft = 184
      ExplicitWidth = 198
    end
  end
  inherited Panel2: TPanel
    Width = 1057
    ExplicitWidth = 1057
  end
  inherited Panel3: TPanel
    Top = 504
    Width = 1057
    ExplicitTop = 504
    ExplicitWidth = 1057
    inherited sbEditar: TSpeedButton
      Left = 205
      ExplicitLeft = 205
    end
    inherited Label4: TLabel
      Left = 723
      ExplicitLeft = 723
    end
    inherited Label5: TLabel
      Left = 858
      ExplicitLeft = 858
    end
    inherited cbPesquisar: TComboBox
      Left = 723
      Items.Strings = (
        'C'#243'digo'
        'Nome fantasia'
        'Raz'#227'o social'
        'CPF ou CNPJ')
      ExplicitLeft = 723
    end
    inherited edtPesquisar: TEdit
      Left = 858
      OnKeyUp = edtPesquisarKeyUp
      ExplicitLeft = 858
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 1057
    Height = 423
    ActiveCard = cardPanelCadatro
    ExplicitWidth = 1057
    ExplicitHeight = 423
    inherited cardPanelCadatro: TCard
      Width = 1057
      Height = 423
      ExplicitWidth = 1057
      ExplicitHeight = 423
      object Label1: TLabel
        Left = 24
        Top = 12
        Width = 43
        Height = 17
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 24
        Top = 67
        Width = 85
        Height = 17
        Caption = 'Nome fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 24
        Top = 125
        Width = 73
        Height = 17
        Caption = 'Raz'#227'o social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCPFCNPJ: TLabel
        Left = 24
        Top = 187
        Width = 73
        Height = 17
        Caption = 'CPF ou CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 24
        Top = 306
        Width = 55
        Height = 17
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 24
        Top = 363
        Width = 35
        Height = 17
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 24
        Top = 249
        Width = 22
        Height = 17
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 751
        Top = 10
        Width = 48
        Height = 17
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 468
        Top = 10
        Width = 82
        Height = 17
        Caption = 'Complemento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 468
        Top = 65
        Width = 41
        Height = 17
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 751
        Top = 65
        Width = 40
        Height = 17
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 468
        Top = 125
        Width = 49
        Height = 17
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 655
        Top = 125
        Width = 40
        Height = 17
        Caption = 'Celular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 468
        Top = 191
        Width = 37
        Height = 17
        Caption = 'E-Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 468
        Top = 249
        Width = 67
        Height = 17
        Caption = 'Funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 567
        Top = 249
        Width = 73
        Height = 17
        Caption = 'Respons'#225'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 468
        Top = 306
        Width = 70
        Height = 17
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 235
        Top = 191
        Width = 104
        Height = 17
        Caption = 'Inscri'#231#227'o estadual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object sbPesquisarCep: TSpeedButton
        Left = 392
        Top = 268
        Width = 25
        Height = 25
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000C30E0000C30E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E5E5AA5454881010A14242EB
          D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E5E59C38388000
          00800000800000A14242FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EDED
          9A3434800000800000800000800000881010FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF6EDEDD7AFAFBA7474A95252A44848AC5858C18383E1C3C3FBF7F7FF
          FFFFF2E5E59A3434800000800000800000800000800000AA5454FFFFFFFFFFFF
          FFFFFFFFFFFFF6EDEDC183838D1A1A8102028000008000008000008000008000
          00830606983030CF9F9F9C38388000008000008000008000008000009C3838F2
          E5E5FFFFFFFFFFFFFFFFFFE9D3D3983030800000800000800000800000800000
          8000008000008000008000008000008000008000008000008000008000008000
          009A3434F2E5E5FFFFFFFFFFFFFFFFFFE6CDCD89121280000080000080000087
          0E0EA34646BC7878C28585B76E6E9C3838830606800000800000800000800000
          8000008000009A3434F6EDEDFFFFFFFFFFFFFFFFFFF2E5E59326268000008000
          00820404B16262EDDBDBFEFDFDFFFFFFFFFFFFFFFFFFFCF9F9E3C7C7A0404080
          00008000008000008000009C3838F2E5E5FFFFFFFFFFFFFFFFFFFFFFFFB46868
          800000800000820404C68D8DFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFBF7F7AE5C5C800000800000800000CF9F9FFFFFFFFFFFFFFFFFFFFF
          FFFFEBD7D7860C0C800000800000BA7474FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F7A04040800000800000983030FBF7
          F7FFFFFFFFFFFFFFFFFFC38787800000800000902020F4E9E9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3C7C7830606
          800000830606E1C3C3FFFFFFFFFFFFFFFFFFA24444800000800000B76E6EFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCF9F99C3838800000800000C18383FFFFFFFFFFFFFFFFFF8D1A1A800000
          800000D6ADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB76E6E800000800000AC5858FFFFFFFFFFFFFF
          FFFF860C0C800000800000E0C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC28585800000800000A448
          48FFFFFFFFFFFFFFFFFF8A1414800000800000DAB5B5FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC7878
          800000800000A95252FFFFFFFFFFFFFFFFFF9C3838800000800000C08181FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFDA34646800000800000BA7474FFFFFFFFFFFFFFFFFFBA7474800000
          800000983030FAF5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEDDBDB870E0E800000810202D7AFAFFFFFFFFFFFFFFF
          FFFFE1C3C3830606800000810202CE9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDB162628000008000008D1A1AF6ED
          EDFFFFFFFFFFFFFFFFFFFEFDFDA44848800000800000881010DFBFBFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC68D8D820404800000
          800000C18383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7CFCF8912128000008000
          00881010CE9D9DFAF5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E9E9BA747482
          0404800000800000983030F6EDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D3A7A7810202800000800000810202983030C08181DAB5B5E0C1C1D6ADADB76E
          6E902020800000800000800000891212E9D3D3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD3A7A7891212800000800000800000800000800000
          800000800000800000800000800000800000932626E6CDCDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7CFCFA4484883060680
          0000800000800000800000800000800000800000860C0CB46868F2E5E5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFDFDE1C3C3B972729C38388A1414860C0C8D1A1AA24444C38787EBD7D7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = sbPesquisarCepClick
      end
      object edtCodigo: TEdit
        Left = 24
        Top = 31
        Width = 241
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtNomeFantasia: TEdit
        Left = 24
        Top = 88
        Width = 393
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtRazaoSocial: TEdit
        Left = 24
        Top = 148
        Width = 393
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edtCPFCNPJ: TEdit
        Left = 24
        Top = 210
        Width = 205
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnExit = edtCPFCNPJExit
      end
      object edtEndereco: TEdit
        Left = 24
        Top = 328
        Width = 393
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object edtBairro: TEdit
        Left = 24
        Top = 386
        Width = 393
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object edtCep: TEdit
        Left = 24
        Top = 268
        Width = 362
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edtNumero: TEdit
        Left = 751
        Top = 33
        Width = 110
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object edtComplemento: TEdit
        Left = 468
        Top = 31
        Width = 277
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object edtCidade: TEdit
        Left = 468
        Top = 88
        Width = 277
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object edtEmail: TEdit
        Left = 468
        Top = 210
        Width = 393
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object edtFuncionario: TEdit
        Left = 468
        Top = 272
        Width = 93
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object edtObservacao: TEdit
        Left = 468
        Top = 328
        Width = 393
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
      end
      object edtResponsavel: TEdit
        Left = 567
        Top = 272
        Width = 294
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object edtInscricaoEstadual: TEdit
        Left = 235
        Top = 210
        Width = 182
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edtEstado: TComboBox
        Left = 751
        Top = 88
        Width = 110
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object edtTelefone: TMaskEdit
        Left = 468
        Top = 148
        Width = 172
        Height = 25
        EditMask = '(00)0000-0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 12
        Text = '(  )    -    '
      end
      object edtCelular: TMaskEdit
        Left = 655
        Top = 148
        Width = 202
        Height = 25
        EditMask = '(00)00000-0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 13
        Text = '(  )     -    '
      end
    end
    inherited cardPanelConsulta: TCard
      Width = 1057
      Height = 423
      ExplicitWidth = 1057
      ExplicitHeight = 423
      inherited Panel4: TPanel
        Top = 378
        Width = 1057
        ExplicitTop = 378
        ExplicitWidth = 1057
        inherited sbImprimir: TSpeedButton
          Left = 782
          OnClick = sbImprimirClick
          ExplicitLeft = 782
        end
        inherited sbExportar: TSpeedButton
          Left = 893
          OnClick = sbExportarClick
          ExplicitLeft = 893
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 1057
        Height = 378
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 760
    Top = 17
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 664
    Top = 17
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    WebService = wsRepublicaVirtual
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 384
    Top = 121
  end
  object frxDB_Transportadora: TfrxDBDataset
    UserName = 'frxDB_Transportadora'
    CloseDataSource = False
    DataSource = DataSource1
    BCDToCurrency = False
    Left = 768
    Top = 193
  end
  object frx_Transportadora: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43765.557343252320000000
    ReportOptions.LastChange = 43765.589253159720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 632
    Top = 193
    Datasets = <
      item
        DataSet = frxDB_Transportadora
        DataSetName = 'frxDB_Transportadora'
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
        Height = 188.976500000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 34.015770000000000000
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
            'Relat'#243'rio Transportadora')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 22.779530000000000000
          Top = 68.252010000000000000
          Width = 665.197280000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 72.031540000000000000
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
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 362.834880000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_Transportadora
        DataSetName = 'frxDB_Transportadora'
        RowCount = 0
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo:')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."ID"]')
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 162.519790000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome fantasia:')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 7.559060000000000000
          Width = 404.409710000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."NOME_FANTASIA"]')
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 34.015770000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Raz'#227'o social:')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 34.015770000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."RAZAO_SOCIAL"]')
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 294.803340000000000000
          Top = 52.913420000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Top = 52.913420000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF ou CNPJ:')
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 60.472480000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."CPF_CNPJ"]')
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 298.582870000000000000
          Top = 60.472480000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Inscri'#231#227'o estadual:')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 60.472480000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."INSCRICAO_ESTADUAL"]')
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Top = 79.370130000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Top = 105.826840000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Shape6: TfrxShapeView
          AllowVectorExport = True
          Top = 132.283550000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Shape7: TfrxShapeView
          AllowVectorExport = True
          Top = 158.740260000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Shape8: TfrxShapeView
          AllowVectorExport = True
          Top = 185.196970000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Shape9: TfrxShapeView
          AllowVectorExport = True
          Top = 211.653680000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 88.929190000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o:')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 86.929190000000000000
          Width = 616.063390000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."ENDERECO"]')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 114.385900000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Bairro:')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 50.913420000000000000
          Top = 114.165430000000000000
          Width = 646.299630000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."BAIRRO"]')
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 132.283550000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 139.842610000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Complemento:')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 139.842610000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."COMPLEMENTO"]')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 139.842610000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero:')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 408.189240000000000000
          Top = 139.842610000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."NUMERO"]')
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 139.842610000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP:')
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 132.283550000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 139.842610000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."CEP"]')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 166.299320000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade:')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 166.299320000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."CIDADE"]')
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 351.496290000000000000
          Top = 158.740260000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 166.299320000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Estado:')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 415.748300000000000000
          Top = 166.299320000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."ESTADO"]')
        end
        object Shape10: TfrxShapeView
          AllowVectorExport = True
          Top = 238.110390000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Shape11: TfrxShapeView
          AllowVectorExport = True
          Top = 264.567100000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 193.756030000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefone:')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 192.756030000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."TELEFONE"]')
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 185.196970000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 192.756030000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Celular:')
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 294.803340000000000000
          Top = 192.756030000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."CELULAR"]')
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 8.779530000000000000
          Top = 219.992270000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'E-Mail:')
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 219.212740000000000000
          Width = 619.842920000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."EMAIL"]')
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 245.669450000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Funcion'#225'rio:')
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 245.669450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."FUNCIONARIO_CADASTRO"]')
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 192.756030000000000000
          Top = 238.110390000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 245.669450000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Respons'#225'vel:')
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 245.669450000000000000
          Width = 419.527830000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."RESPONSAVEL"]')
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 272.126160000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Observa'#231#227'o:')
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 272.126160000000000000
          Width = 612.283860000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_Transportadora."OBSERVACAO"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 691.653990000000000000
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
