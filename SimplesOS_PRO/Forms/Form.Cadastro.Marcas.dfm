inherited formCadastroMarcas: TformCadastroMarcas
  Caption = 'Cadastro de marcas'
  ClientHeight = 407
  ClientWidth = 875
  ExplicitWidth = 875
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 875
    ExplicitWidth = 875
    inherited sbFechar: TSpeedButton
      Left = 823
      ExplicitLeft = 823
    end
    inherited lblCaption: TLabel
      Left = 153
      Width = 144
      Caption = 'Cadastro de marcas'
      ExplicitLeft = 195
      ExplicitWidth = 144
    end
  end
  inherited Panel2: TPanel
    Width = 875
    ExplicitWidth = 875
  end
  inherited Panel3: TPanel
    Top = 332
    Width = 875
    ExplicitTop = 332
    ExplicitWidth = 875
    inherited sbEditar: TSpeedButton
      Left = 205
      ExplicitLeft = 205
    end
    inherited Label4: TLabel
      Left = 541
      ExplicitLeft = 541
    end
    inherited Label5: TLabel
      Left = 676
      ExplicitLeft = 676
    end
    inherited cbPesquisar: TComboBox
      Left = 541
      Items.Strings = (
        'C'#243'digo'
        'Marca')
      ExplicitLeft = 541
    end
    inherited edtPesquisar: TEdit
      Left = 676
      OnKeyUp = edtPesquisarKeyUp
      ExplicitLeft = 676
    end
  end
  inherited CardPanel1: TCardPanel
    Width = 875
    Height = 251
    ActiveCard = cardPanelCadatro
    ExplicitWidth = 875
    ExplicitHeight = 251
    inherited cardPanelCadatro: TCard
      Width = 875
      Height = 251
      ExplicitWidth = 875
      ExplicitHeight = 251
      object Label1: TLabel
        Left = 60
        Top = 21
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
        Left = 60
        Top = 83
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
      object edtCodigo: TEdit
        Left = 60
        Top = 40
        Width = 133
        Height = 25
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtMarca: TEdit
        Left = 60
        Top = 103
        Width = 277
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
      Width = 875
      Height = 251
      ExplicitWidth = 875
      ExplicitHeight = 251
      inherited Panel4: TPanel
        Top = 206
        Width = 875
        ExplicitTop = 206
        ExplicitWidth = 875
        inherited sbImprimir: TSpeedButton
          Left = 600
          Visible = False
          ExplicitLeft = 600
        end
        inherited sbExportar: TSpeedButton
          Left = 711
          Visible = False
          ExplicitLeft = 711
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 875
        Height = 206
        DataSource = DataSource1
        OnCellClick = DBGrid1CellClick
        OnTitleClick = DBGrid1TitleClick
      end
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 472
    Top = 153
  end
end
