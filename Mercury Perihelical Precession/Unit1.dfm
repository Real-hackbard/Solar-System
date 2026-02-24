object Form1: TForm1
  Left = 252
  Top = 156
  Width = 943
  Height = 645
  HelpContext = 108
  Caption = 'Mercury perihelical precession'
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 927
    Height = 606
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 927
      Height = 606
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 0
      object perihel: TPanel
        Left = 0
        Top = 0
        Width = 927
        Height = 606
        Align = alClient
        BevelOuter = bvNone
        Color = clBlack
        TabOrder = 0
        object Paintbox1: TPaintBox
          Left = 217
          Top = 0
          Width = 710
          Height = 606
          Align = alClient
          OnPaint = Paintbox1Paint
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 217
          Height = 606
          Align = alLeft
          BevelOuter = bvNone
          Color = 15790320
          TabOrder = 0
          object Label7: TLabel
            Left = 16
            Top = 24
            Width = 140
            Height = 32
            Caption = 'Value of relativistic'#13#10'perihelical precession'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 16
            Top = 112
            Width = 104
            Height = 14
            BiDiMode = bdLeftToRight
            Caption = 'Semimajor axis :'
            ParentBiDiMode = False
          end
          object Label5: TLabel
            Left = 42
            Top = 144
            Width = 79
            Height = 14
            BiDiMode = bdLeftToRight
            Caption = 'Eccentricity :'
            ParentBiDiMode = False
          end
          object Label4: TLabel
            Left = 41
            Top = 176
            Width = 78
            Height = 14
            BiDiMode = bdLeftToRight
            Caption = 'Time factor :'
            ParentBiDiMode = False
          end
          object Label3: TLabel
            Left = 78
            Top = 212
            Width = 41
            Height = 14
            Alignment = taRightJustify
            Caption = 'scale :'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Speed2: TSpeedButton
            Left = 128
            Top = 208
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFF0000F0000FFFFFFFFFF0000F0000F00FFFFFFFFFFFFFF00F0000F0F0
              FFFFFFFFFFFF0F0F0000F0FF0FFFFFFFFFF0FF0F0000FFFFF0FFFFFFFF0FFFFF
              0000FFFFFF0FFFFFF0FFFFFF0000FFFFFFF0FFFF0FFFFFFF0000FFFFFFFF0FF0
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFF0FF0FFFFFFFF0000FFFFFFF0FFFF0FFFFFFF0000FFFFFF0FFFFFF0FFFFFF
              0000FFFFF0FFFFFFFF0FFFFF0000F0FF0FFFFFFFFFF0FF0F0000F0F0FFFFFFFF
              FFFF0F0F0000F00FFFFFFFFFFFFFF00F0000F0000FFFFFFFFF00000F0000FFFF
              FFFFFFFFFFFFFFFF0000}
            OnClick = Speed2Click
          end
          object Speed3: TSpeedButton
            Left = 152
            Top = 208
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              7777777777777778477777444447777748777744447777777477774447777777
              7477774474777777747777477744777748777777777744448777777777777777
              7777777777777777777777777777777777777777777777777777}
            OnClick = Speed3Click
          end
          object Speed1: TSpeedButton
            Left = 176
            Top = 208
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFF0000F0FFFFFFFFFFFFFFFF0F0000FF0FFFFFFFFFFFFFF0FF0000FFF0
              FFFFFFFFFFFF0FFF0000FFFF0FF0FFFF0FF0FFFF0000FFFFF0F0FFFF0F0FFFFF
              0000FFFFFF00FFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFF00FFFF00FFFFFF
              0000FFFFF0F0FFFF0F0FFFFF0000FFFF0FF0FFFF0FF0FFFF0000FFF0FFFFFFFF
              FFFF0FFF0000FF0FFFFFFFFFFFFFF0FF0000F0FFFFFFFFFFFFFFFF0F0000FFFF
              FFFFFFFFFFFFFFFF0000}
            OnClick = Speed1Click
          end
          object Label1: TLabel
            Left = 40
            Top = 72
            Width = 4
            Height = 14
          end
          object Label2: TLabel
            Left = 16
            Top = 320
            Width = 162
            Height = 169
            Caption = 
              'Perihelion precession '#13#10'of an elliptical '#13#10'planet'#39's orbit refers' +
              ' to '#13#10'a rotation of '#13#10'the orbit in the orbital '#13#10'plane. The  mai' +
              'n causes '#13#10'are gravitational '#13#10'influences from other '#13#10'planets, ' +
              'the Sun'#39's deviation '#13#10'from a perfect sphere, '#13#10'and the relativis' +
              'tic, '#13#10'gravitational curvature '#13#10'of spacetime.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Button1: TButton
            Left = 24
            Top = 280
            Width = 161
            Height = 25
            Caption = 'Simulation'
            TabOrder = 2
            TabStop = False
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 24
            Top = 248
            Width = 161
            Height = 25
            Caption = 'Calculate'
            TabOrder = 3
            TabStop = False
            OnClick = Button2Click
          end
          object Edit1: TEdit
            Left = 128
            Top = 108
            Width = 76
            Height = 22
            TabStop = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = '0,387'
          end
          object Edit2: TEdit
            Left = 128
            Top = 140
            Width = 76
            Height = 22
            TabStop = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '0,206'
          end
          object Spin1: TSpinEdit
            Left = 128
            Top = 172
            Width = 57
            Height = 23
            TabStop = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            MaxValue = 50
            MinValue = 1
            ParentFont = False
            TabOrder = 4
            Value = 10
          end
        end
      end
    end
  end
end
