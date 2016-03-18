object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Search Replace'
  ClientHeight = 594
  ClientWidth = 1297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 76
    Width = 95
    Height = 13
    Caption = 'File name extension'
  end
  object Label2: TLabel
    Left = 8
    Top = 24
    Width = 109
    Height = 13
    Caption = 'Select Location Folder:'
  end
  object btnSearch: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 0
    OnClick = btnSearchClick
  end
  object ListFiles: TListView
    Left = 368
    Top = 24
    Width = 921
    Height = 561
    Columns = <
      item
        Caption = 'Files'
        Width = 500
      end
      item
        Caption = 'Log'
        Width = 400
      end>
    TabOrder = 1
    ViewStyle = vsReport
  end
  object edtExtension: TEdit
    Left = 107
    Top = 73
    Width = 54
    Height = 21
    TabOrder = 2
    Text = '*.*'
  end
  object edtLocation: TEdit
    Left = 8
    Top = 43
    Width = 321
    Height = 21
    TabOrder = 3
  end
  object btnLocation: TButton
    Left = 329
    Top = 43
    Width = 23
    Height = 21
    Caption = '...'
    TabOrder = 4
    OnClick = btnLocationClick
  end
end
