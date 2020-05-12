inherited formCadastroProblemasFrequentes: TformCadastroProblemasFrequentes
  Caption = 'Problemas frequentes'
  ClientHeight = 596
  ClientWidth = 980
  ExplicitWidth = 980
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 980
    ExplicitWidth = 980
    inherited sbFechar: TSpeedButton
      Left = 928
      ExplicitLeft = 928
    end
    inherited lblCaption: TLabel
      Left = 258
      Width = 156
      Caption = 'Problemas frequentes'
      ExplicitLeft = 195
      ExplicitWidth = 156
    end
  end
  inherited Panel2: TPanel
    Width = 980
    ExplicitWidth = 980
  end
  inherited Panel3: TPanel
    Top = 521
    Width = 980
    ExplicitTop = 521
    ExplicitWidth = 980
    inherited Label4: TLabel
      Left = 646
      ExplicitLeft = 646
    end
    inherited Label5: TLabel
      Left = 781
      ExplicitLeft = 781
    end
    inherited cbPesquisar: TComboBox
      Left = 646
      Items.Strings = (
        'C'#243'digo'
        'Equiamento/Pe'#231'a'
        'N'#250'mero de serie'
        'Marca')
      ExplicitLeft = 646
    end
    inherited edtPesquisar: TEdit
      Left = 781
      OnKeyUp = edtPesquisarKeyUp
      ExplicitLeft = 781
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 980
    Height = 440
    ActiveCard = cardPanelCadatro
    ExplicitWidth = 980
    ExplicitHeight = 440
    inherited cardPanelCadatro: TCard
      Width = 980
      Height = 440
      ExplicitWidth = 980
      ExplicitHeight = 440
      object Label1: TLabel
        Left = 32
        Top = 17
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
        Left = 32
        Top = 73
        Width = 117
        Height = 17
        Caption = 'Equipamento / Pe'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 32
        Top = 130
        Width = 99
        Height = 17
        Caption = 'N'#250'mero de serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 32
        Top = 184
        Width = 37
        Height = 17
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 456
        Top = 7
        Width = 42
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Defeito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 456
        Top = 180
        Width = 111
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Solu'#231#227'o do defeito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 31
        Top = 241
        Width = 101
        Height = 17
        Caption = 'Data de cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 143
        Top = 241
        Width = 111
        Height = 17
        Caption = 'Data de fabrica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 259
        Top = 245
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
      object Label12: TLabel
        Left = 301
        Top = 446
        Width = 45
        Height = 17
        Caption = 'Label12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 32
        Top = 299
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
      object edtCodigo: TEdit
        Left = 32
        Top = 40
        Width = 337
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
      object edtEquipamento: TEdit
        Left = 32
        Top = 96
        Width = 337
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
      object edtNumeroSerie: TEdit
        Left = 32
        Top = 153
        Width = 337
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
      object edtMarca: TEdit
        Left = 32
        Top = 205
        Width = 337
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtFuncionario: TEdit
        Left = 260
        Top = 264
        Width = 109
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
      object edtObservacao: TEdit
        Left = 32
        Top = 322
        Width = 337
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
      object memoDefeito: TMemo
        Left = 456
        Top = 30
        Width = 401
        Height = 139
        Anchors = [akRight, akBottom]
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 8
      end
      object memoSolucao: TMemo
        Left = 456
        Top = 203
        Width = 401
        Height = 139
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Lines.Strings = (
          '')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 9
      end
      object edtDataCadastro: TMaskEdit
        Left = 32
        Top = 264
        Width = 99
        Height = 25
        EditMask = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        Text = '  /  /    '
      end
      object edtDataFabricacao: TMaskEdit
        Left = 138
        Top = 264
        Width = 116
        Height = 25
        EditMask = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 5
        Text = '  /  /    '
      end
    end
    inherited cardPanelConsulta: TCard
      Width = 980
      Height = 440
      ExplicitWidth = 980
      ExplicitHeight = 440
      inherited Panel4: TPanel
        Top = 395
        Width = 980
        ExplicitTop = 395
        ExplicitWidth = 980
        inherited sbImprimir: TSpeedButton
          Left = 705
          OnClick = sbImprimirClick
          ExplicitLeft = 705
        end
        inherited sbExportar: TSpeedButton
          Left = 816
          OnClick = sbExportarClick
          ExplicitLeft = 816
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 980
        Height = 395
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 720
    Top = 41
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 568
    Top = 41
  end
  object frxDB_ProblemasFrequentes: TfrxDBDataset
    UserName = 'frxDB_ProblemasFrequentes'
    CloseDataSource = False
    DataSource = DataSource1
    BCDToCurrency = False
    Left = 832
    Top = 137
  end
  object frx_ProblemasFrequentes: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43753.512531018520000000
    ReportOptions.LastChange = 43753.559881990740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 720
    Top = 137
    Datasets = <
      item
        DataSet = frxDB_ProblemasFrequentes
        DataSetName = 'frxDB_ProblemasFrequentes'
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
        Height = 124.724490000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 15.559060000000000000
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
            'Relat'#243'rio Simples - Contas a pagar')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 19.559060000000000000
          Top = 45.795300000000000000
          Width = 672.756340000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 49.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATE]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 325.039580000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_ProblemasFrequentes
        DataSetName = 'frxDB_ProblemasFrequentes'
        RowCount = 0
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 721.890230000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 721.890230000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Top = 52.913420000000000000
          Width = 721.890230000000000000
          Height = 109.606370000000000000
          Frame.Typ = []
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo:')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 53.692950000000000000
          Top = 6.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."ID"]')
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 143.960730000000000000
          Top = 1.779530000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 147.740260000000000000
          Top = 7.559060000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Equipamento:')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 238.448980000000000000
          Top = 7.559060000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."nome_peca"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 492.677490000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 497.236550000000000000
          Top = 9.559060000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' De serie:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 568.047620000000000000
          Top = 9.559060000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."numero_serie"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 36.236240000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Marca:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 48.913420000000000000
          Top = 36.015770000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."marca"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 26.456710000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 294.803340000000000000
          Top = 36.015770000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Fabrica'#231#227'o:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 366.953000000000000000
          Top = 35.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."data_fabricacao"]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 26.456710000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 36.015770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data de cadastro:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 578.827150000000000000
          Top = 34.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."data_cadastro"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Defeito:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 86.929190000000000000
          Width = 702.992580000000000000
          Height = 68.031540000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."defeito"]')
          ParentFont = False
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Top = 162.519790000000000000
          Width = 721.890230000000000000
          Height = 109.606370000000000000
          Frame.Typ = []
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 170.078850000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Solu'#231#227'o:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 192.756030000000000000
          Width = 706.772110000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."solucao_defeito"]')
          ParentFont = False
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Top = 272.126160000000000000
          Width = 721.890230000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 281.685220000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Funcion'#225'rio:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 77.149660000000000000
          Top = 280.464750000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."funcionario"]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 272.126160000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 160.519790000000000000
          Top = 279.685220000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Observa'#231#227'o:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 279.685220000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDB_ProblemasFrequentes."observacao"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 589.606680000000000000
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
