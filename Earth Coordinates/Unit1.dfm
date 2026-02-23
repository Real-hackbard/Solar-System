object Form1: TForm1
  Left = 493
  Top = 233
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Earth Coordinates'
  ClientHeight = 445
  ClientWidth = 671
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 25
    Top = 24
    Width = 128
    Height = 13
    Caption = 'geographical longitude :'
  end
  object Label2: TLabel
    Left = 35
    Top = 56
    Width = 117
    Height = 13
    Caption = 'geographical latitude :'
  end
  object Label3: TLabel
    Left = 113
    Top = 128
    Width = 51
    Height = 13
    Caption = 'Date day :'
  end
  object Label4: TLabel
    Left = 132
    Top = 160
    Width = 41
    Height = 13
    Caption = 'Month :'
  end
  object Label5: TLabel
    Left = 144
    Top = 192
    Width = 26
    Height = 13
    Caption = 'Year :'
  end
  object Label6: TLabel
    Left = 67
    Top = 231
    Width = 53
    Height = 13
    Caption = 'UT hours :'
  end
  object Label7: TLabel
    Left = 75
    Top = 263
    Width = 47
    Height = 13
    Caption = 'minutes :'
  end
  object Label8: TLabel
    Left = 72
    Top = 296
    Width = 48
    Height = 13
    Caption = 'seconds :'
  end
  object Label9: TLabel
    Left = 24
    Top = 88
    Width = 121
    Height = 13
    Caption = 'Height above sea level :'
  end
  object Edit1: TEdit
    Left = 192
    Top = 20
    Width = 73
    Height = 21
    TabStop = False
    TabOrder = 0
    Text = '12,97'
  end
  object Edit2: TEdit
    Left = 192
    Top = 52
    Width = 73
    Height = 21
    TabStop = False
    TabOrder = 1
    Text = '50,98'
  end
  object Edit3: TEdit
    Left = 192
    Top = 124
    Width = 73
    Height = 21
    TabStop = False
    TabOrder = 2
    Text = '20'
  end
  object Edit4: TEdit
    Left = 192
    Top = 156
    Width = 73
    Height = 21
    TabStop = False
    TabOrder = 3
    Text = '20'
  end
  object Edit5: TEdit
    Left = 192
    Top = 188
    Width = 73
    Height = 21
    TabStop = False
    TabOrder = 4
    Text = '20'
  end
  object Edit6: TEdit
    Left = 144
    Top = 228
    Width = 121
    Height = 21
    TabStop = False
    TabOrder = 5
    Text = '20'
  end
  object Edit7: TEdit
    Left = 144
    Top = 260
    Width = 121
    Height = 21
    TabStop = False
    TabOrder = 6
    Text = '20'
  end
  object Edit8: TEdit
    Left = 144
    Top = 292
    Width = 121
    Height = 21
    TabStop = False
    TabOrder = 7
    Text = '20'
  end
  object Button1: TButton
    Left = 128
    Top = 400
    Width = 121
    Height = 25
    Caption = 'Calculate'
    TabOrder = 8
    TabStop = False
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 272
    Top = 20
    Width = 385
    Height = 405
    TabStop = False
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object CheckBox1: TCheckBox
    Left = 128
    Top = 336
    Width = 121
    Height = 17
    TabStop = False
    Caption = 'Aktualisieren'
    TabOrder = 10
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 128
    Top = 360
    Width = 97
    Height = 17
    TabStop = False
    Caption = 'Kronos'
    TabOrder = 11
  end
  object Edit9: TEdit
    Left = 192
    Top = 84
    Width = 73
    Height = 21
    TabStop = False
    TabOrder = 12
    Text = '290'
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 288
    Top = 32
  end
end
