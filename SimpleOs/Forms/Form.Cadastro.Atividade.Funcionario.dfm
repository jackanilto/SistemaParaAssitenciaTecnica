inherited formAtividadeFuncionario: TformAtividadeFuncionario
  Caption = 'Atividades dos funcion'#225'rios'
  ClientHeight = 382
  ClientWidth = 864
  ExplicitWidth = 864
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 864
    ExplicitWidth = 864
    inherited sbFechar: TSpeedButton
      Left = 812
      ExplicitLeft = 812
    end
    inherited lblCaption: TLabel
      Left = 142
      Width = 197
      Caption = 'Atividades dos funcion'#225'rios'
      ExplicitLeft = 195
      ExplicitWidth = 197
    end
  end
  inherited Panel2: TPanel
    Width = 864
    ExplicitWidth = 864
  end
  inherited Panel3: TPanel
    Top = 307
    Width = 864
    ExplicitTop = 307
    ExplicitWidth = 864
    inherited sbEditar: TSpeedButton
      Left = 205
      ExplicitLeft = 205
    end
    inherited Label4: TLabel
      Left = 530
      Visible = False
      ExplicitLeft = 530
    end
    inherited Label5: TLabel
      Left = 665
      Visible = False
      ExplicitLeft = 665
    end
    inherited cbPesquisar: TComboBox
      Left = 530
      Visible = False
      ExplicitLeft = 530
    end
    inherited edtPesquisar: TEdit
      Left = 665
      Visible = False
      ExplicitLeft = 665
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 864
    Height = 226
    ExplicitWidth = 864
    ExplicitHeight = 226
    inherited cardPanelCadatro: TCard
      Width = 864
      Height = 226
      ExplicitWidth = 864
      ExplicitHeight = 226
      object Label1: TLabel
        Left = 48
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
        Left = 48
        Top = 85
        Width = 54
        Height = 17
        Caption = 'Atividade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 48
        Top = 43
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
      object edtAtividade: TEdit
        Left = 48
        Top = 104
        Width = 273
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
      Width = 864
      Height = 226
      ExplicitWidth = 864
      ExplicitHeight = 226
      inherited Panel4: TPanel
        Top = 181
        Width = 864
        Visible = False
        ExplicitTop = 181
        ExplicitWidth = 864
        inherited sbImprimir: TSpeedButton
          Left = 589
          ExplicitLeft = 589
        end
        inherited sbExportar: TSpeedButton
          Left = 700
          ExplicitLeft = 700
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 864
        Height = 181
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 496
    Top = 217
  end
end
