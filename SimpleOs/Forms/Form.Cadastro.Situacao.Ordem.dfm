inherited formCadastroSituacoesOrdem: TformCadastroSituacoesOrdem
  Caption = 'Cadastro de situa'#231#245'es da ordem'
  ClientHeight = 408
  ClientWidth = 837
  ExplicitWidth = 837
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 837
    inherited sbFechar: TSpeedButton
      Left = 785
    end
    inherited lblCaption: TLabel
      Left = 115
      Width = 230
      Caption = 'Cadastro de situa'#231#245'es da ordem'
      ExplicitLeft = 195
      ExplicitWidth = 230
    end
  end
  inherited Panel2: TPanel
    Width = 837
  end
  inherited Panel3: TPanel
    Top = 333
    Width = 837
    inherited Label4: TLabel
      Left = 503
      Visible = False
    end
    inherited Label5: TLabel
      Left = 638
      Visible = False
    end
    inherited cbPesquisar: TComboBox
      Left = 503
      Visible = False
    end
    inherited edtPesquisar: TEdit
      Left = 638
      Visible = False
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 837
    Height = 252
    inherited cardPanelCadatro: TCard
      Width = 837
      Height = 252
      ExplicitLeft = 11
      ExplicitTop = 5
      ExplicitWidth = 837
      ExplicitHeight = 252
      object Label1: TLabel
        Left = 32
        Top = 24
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
        Top = 96
        Width = 111
        Height = 17
        Caption = 'Situa'#231#227'o da ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 32
        Top = 47
        Width = 257
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
      object edtSituacaoOrdem: TEdit
        Left = 32
        Top = 119
        Width = 329
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
    end
    inherited cardPanelConsulta: TCard
      Width = 837
      Height = 252
      inherited Panel4: TPanel
        Top = 207
        Width = 837
        inherited sbImprimir: TSpeedButton
          Left = 562
          Visible = False
        end
        inherited sbExportar: TSpeedButton
          Left = 673
          Visible = False
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 837
        Height = 207
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 480
    Top = 41
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 392
    Top = 41
  end
end