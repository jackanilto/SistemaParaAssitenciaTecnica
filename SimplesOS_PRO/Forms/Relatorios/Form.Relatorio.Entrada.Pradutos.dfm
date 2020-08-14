inherited formRelatorioEntradasDeProdutos: TformRelatorioEntradasDeProdutos
  Caption = 'Relat'#243'rio - Entrada de produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    inherited Label4: TLabel
      Left = 687
      ExplicitLeft = 687
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
