inherited formFormaPagamento: TformFormaPagamento
  Caption = 'Formas de pagamento'
  ClientHeight = 408
  ClientWidth = 872
  ExplicitWidth = 872
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 872
    ExplicitWidth = 872
    inherited sbFechar: TSpeedButton
      Left = 820
      ExplicitLeft = 820
    end
    inherited lblCaption: TLabel
      Left = 150
      Width = 161
      Caption = 'Formas de pagamento'
      ExplicitLeft = 150
      ExplicitWidth = 161
    end
  end
  inherited Panel2: TPanel
    Width = 872
    ExplicitWidth = 872
  end
  inherited Panel3: TPanel
    Top = 333
    Width = 872
    ExplicitTop = 333
    ExplicitWidth = 872
    inherited Label4: TLabel
      Left = 538
      ExplicitLeft = 538
    end
    inherited Label5: TLabel
      Left = 673
      ExplicitLeft = 673
    end
    inherited cbPesquisar: TComboBox
      Left = 538
      Items.Strings = (
        'C'#243'digo'
        'Forma pagamento')
      ExplicitLeft = 538
    end
    inherited edtPesquisar: TEdit
      Left = 673
      OnKeyUp = edtPesquisarKeyUp
      ExplicitLeft = 673
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 872
    Height = 252
    ExplicitWidth = 872
    ExplicitHeight = 252
    inherited cardPanelCadatro: TCard
      Width = 872
      Height = 252
      ExplicitTop = 1
      ExplicitWidth = 872
      ExplicitHeight = 252
      object Label1: TLabel
        Left = 40
        Top = 28
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
        Left = 40
        Top = 88
        Width = 127
        Height = 17
        Caption = 'Forma de pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 40
        Top = 51
        Width = 121
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
      object edtFormaPagamento: TEdit
        Left = 40
        Top = 111
        Width = 345
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
      Width = 872
      Height = 252
      ExplicitWidth = 872
      ExplicitHeight = 252
      inherited Panel4: TPanel
        Top = 207
        Width = 872
        ExplicitTop = 207
        ExplicitWidth = 872
        inherited sbImprimir: TSpeedButton
          Left = 597
          Visible = False
          ExplicitLeft = 597
        end
        inherited sbExportar: TSpeedButton
          Left = 708
          Visible = False
          ExplicitLeft = 708
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 872
        Height = 207
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 400
    Top = 217
  end
end
