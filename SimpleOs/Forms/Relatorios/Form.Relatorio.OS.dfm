inherited formRelatorioOrdemDeServico: TformRelatorioOrdemDeServico
  Caption = 'Relat'#243'rio Ordem de Servi'#231'o'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    Height = 210
    Align = alTop
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnCellClick = DBGrid1CellClick
  end
  object GroupBox1: TGroupBox [3]
    Left = 0
    Top = 255
    Width = 449
    Height = 227
    Anchors = [akRight, akBottom]
    Caption = 'Servi'#231'os Realizados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object DBGrid2: TDBGrid
      Left = 2
      Top = 19
      Width = 445
      Height = 206
      Align = alClient
      DataSource = s_ServicosRealizados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = popM_ServicosRealiados
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
    end
  end
  object GroupBox2: TGroupBox [4]
    Left = 496
    Top = 255
    Width = 515
    Height = 227
    Anchors = [akRight, akBottom]
    Caption = 'Ocorr'#234'ncias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object DBGrid3: TDBGrid
      Left = 2
      Top = 15
      Width = 511
      Height = 210
      Align = alClient
      DataSource = s_Ocorrencias
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = popM_Ocorrencias
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  inherited frxReport1: TfrxReport
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object popM_ServicosRealiados: TPopupMenu
    Left = 256
    Top = 311
    object Exportar1: TMenuItem
      Caption = 'Exportar'
    end
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
    end
  end
  object popM_Ocorrencias: TPopupMenu
    Left = 696
    Top = 303
    object I1: TMenuItem
      Caption = 'Exportar'
    end
    object Imprimir2: TMenuItem
      Caption = 'Imprimir'
    end
  end
  object s_ServicosRealizados: TDataSource
    Left = 120
    Top = 303
  end
  object s_Ocorrencias: TDataSource
    Left = 856
    Top = 311
  end
end
