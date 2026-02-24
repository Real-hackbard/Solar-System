object Form1: TForm1
  Left = 297
  Top = 155
  Width = 665
  Height = 570
  Caption = 'Cluster Calculator'
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Paintbox1: TPaintBox
    Left = 0
    Top = 0
    Width = 649
    Height = 490
    Align = alClient
  end
  object Panel1: TPanel
    Left = 0
    Top = 490
    Width = 649
    Height = 41
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      649
      41)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 38
      Height = 13
      Caption = 'Width :'
    end
    object Label2: TLabel
      Left = 112
      Top = 13
      Width = 50
      Height = 13
      Caption = 'Intensity :'
    end
    object SpinEdit1: TSpinEdit
      Left = 168
      Top = 10
      Width = 57
      Height = 22
      TabStop = False
      MaxValue = 10
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object Button1: TButton
      Left = 472
      Top = 9
      Width = 81
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Generate'
      TabOrder = 1
      TabStop = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 560
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Save'
      TabOrder = 2
      TabStop = False
      OnClick = Button2Click
    end
    object SpinEdit2: TSpinEdit
      Left = 56
      Top = 8
      Width = 41
      Height = 22
      TabStop = False
      MaxValue = 10
      MinValue = 1
      TabOrder = 3
      Value = 1
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Bitmap (*.bmp)|*.bmp'
    Left = 32
    Top = 24
  end
end
