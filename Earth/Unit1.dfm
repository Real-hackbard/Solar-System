object Form1: TForm1
  Left = 251
  Top = 115
  Width = 912
  Height = 659
  Caption = 'Erdkugel'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 185
    Top = 0
    Width = 711
    Height = 620
    Align = alClient
    OnPaint = PaintBox1Paint
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 620
    Align = alLeft
    Color = 15790320
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 20
      Width = 87
      Height = 14
      Caption = 'Latitude in '#176' :'
    end
    object Label2: TLabel
      Left = 26
      Top = 44
      Width = 79
      Height = 14
      Caption = 'Length in '#176' :'
    end
    object Label3: TLabel
      Left = 24
      Top = 496
      Width = 90
      Height = 14
      Caption = 'Earth Details :'
    end
    object Label4: TLabel
      Left = 56
      Top = 68
      Width = 49
      Height = 14
      Caption = 'Speed :'
    end
    object Label5: TLabel
      Left = 16
      Top = 320
      Width = 49
      Height = 14
      Caption = 'Colors :'
    end
    object Shape1: TShape
      Left = 112
      Top = 336
      Width = 33
      Height = 25
      Cursor = crHandPoint
      Brush.Color = clLime
      OnMouseDown = Shape1MouseDown
    end
    object Shape2: TShape
      Left = 112
      Top = 368
      Width = 33
      Height = 25
      Cursor = crHandPoint
      Brush.Color = clNavy
      OnMouseDown = Shape2MouseDown
    end
    object Label6: TLabel
      Left = 32
      Top = 344
      Width = 73
      Height = 14
      Caption = 'Horizontal :'
    end
    object Label7: TLabel
      Left = 51
      Top = 376
      Width = 54
      Height = 14
      Caption = 'Vertical :'
    end
    object Shape3: TShape
      Left = 112
      Top = 400
      Width = 33
      Height = 25
      Cursor = crHandPoint
      Brush.Color = clOlive
      OnMouseDown = Shape3MouseDown
    end
    object Shape4: TShape
      Left = 112
      Top = 432
      Width = 33
      Height = 25
      Cursor = crHandPoint
      Brush.Color = clOlive
      OnMouseDown = Shape4MouseDown
    end
    object Label8: TLabel
      Left = 16
      Top = 408
      Width = 90
      Height = 14
      Caption = 'Earth Details :'
    end
    object Label9: TLabel
      Left = 43
      Top = 440
      Width = 62
      Height = 14
      Caption = 'Horizont :'
    end
    object BDrehung: TButton
      Left = 16
      Top = 576
      Width = 73
      Height = 25
      Caption = 'Rotation'
      TabOrder = 0
      TabStop = False
      OnClick = BDrehungClick
    end
    object CheckHori: TCheckBox
      Left = 16
      Top = 104
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Horizontal rotation'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckVert: TCheckBox
      Left = 16
      Top = 128
      Width = 145
      Height = 17
      TabStop = False
      Caption = 'Vertical rotation'
      TabOrder = 2
    end
    object Spinhori: TSpinEdit
      Left = 113
      Top = 16
      Width = 62
      Height = 23
      TabStop = False
      EditorEnabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      MaxValue = 180
      MinValue = -180
      ParentFont = False
      TabOrder = 3
      Value = 15
      OnChange = ThoriChange
    end
    object SpinVert: TSpinEdit
      Left = 112
      Top = 40
      Width = 62
      Height = 23
      TabStop = False
      EditorEnabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      MaxValue = 360
      MinValue = 0
      ParentFont = False
      TabOrder = 4
      Value = 180
      OnChange = ThoriChange
    end
    object CheckTran: TCheckBox
      Left = 16
      Top = 152
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Transparent earth'
      TabOrder = 5
      OnClick = PaintBox1Paint
    end
    object CheckEqua: TCheckBox
      Left = 16
      Top = 176
      Width = 97
      Height = 17
      TabStop = False
      Caption = #196'quator'
      TabOrder = 6
      OnClick = PaintBox1Paint
    end
    object CheckNull: TCheckBox
      Left = 16
      Top = 200
      Width = 121
      Height = 17
      TabStop = False
      Caption = 'Prime meridian'
      TabOrder = 7
      OnClick = PaintBox1Paint
    end
    object CheckBkreis: TCheckBox
      Left = 16
      Top = 224
      Width = 121
      Height = 17
      TabStop = False
      Caption = 'Circles of latitude'
      TabOrder = 8
      OnClick = PaintBox1Paint
    end
    object CheckLKreis: TCheckBox
      Left = 16
      Top = 248
      Width = 129
      Height = 17
      TabStop = False
      Caption = 'Longitudinal circles'
      TabOrder = 9
      OnClick = PaintBox1Paint
    end
    object CheckAchse: TCheckBox
      Left = 16
      Top = 272
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Axis tilt'
      TabOrder = 10
      OnClick = PaintBox1Paint
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 520
      Width = 145
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      ItemIndex = 1
      TabOrder = 11
      TabStop = False
      Text = 'Detailed'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Simple'
        'Detailed')
    end
    object SpinEdit1: TSpinEdit
      Left = 112
      Top = 64
      Width = 62
      Height = 23
      TabStop = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 4
      MaxValue = 1000
      MinValue = 1
      ParentFont = False
      TabOrder = 12
      Value = 10
    end
    object Button1: TButton
      Left = 96
      Top = 576
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 13
      TabStop = False
      OnClick = Button1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 216
    Top = 40
  end
  object ColorDialog1: TColorDialog
    Left = 256
    Top = 40
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Bitmap (*.bmp)|*.bmp'
    Left = 296
    Top = 40
  end
end
