object MainForm: TMainForm
  Left = 473
  Top = 204
  Width = 656
  Height = 544
  Caption = 'TPS Football Manager Editor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    640
    486)
  PixelsPerInch = 96
  TextHeight = 13
  object Sheets: TPageControl
    Left = 8
    Top = 8
    Width = 625
    Height = 452
    ActivePage = Sheet_World
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object Sheet_Game: TTabSheet
      Caption = 'Sheet_Game'
      object DatabaseGB: TGroupBox
        Left = 8
        Top = 312
        Width = 601
        Height = 105
        Caption = 'Datab'#225'ze'
        TabOrder = 0
      end
    end
    object Sheet_World: TTabSheet
      Caption = 'Sheet_World'
      ImageIndex = 1
      object ListBox1: TListBox
        Left = 8
        Top = 8
        Width = 217
        Height = 97
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object Sheet_Continent: TTabSheet
      Caption = 'Sheet_Continent'
      ImageIndex = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 467
    Width = 640
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object MainMenu: TMainMenu
    Left = 608
    object Program1: TMenuItem
      Caption = 'Program'
      object Konec1: TMenuItem
        Caption = 'Konec'
        OnClick = Konec1Click
      end
    end
    object Databze1: TMenuItem
      Caption = 'Datab'#225'ze'
      object Uloit1: TMenuItem
        Caption = 'Ulo'#382'it'
        OnClick = Uloit1Click
      end
      object Nast1: TMenuItem
        Caption = 'Na'#269#237'st'
        OnClick = Nast1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Database files|*.db'
    Left = 576
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Database files|*.db'
    Left = 548
  end
end
