object Form1: TForm1
  Left = 171
  Top = 147
  HelpContext = 22001
  Caption = 'Solar System'
  ClientHeight = 708
  ClientWidth = 969
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnResize = FormShow
  OnShow = FormShow
  TextHeight = 14
  object L20: TLabel
    Left = 16
    Top = 40
    Width = 22
    Height = 14
    Caption = 'Tag'
    Color = clBtnFace
    ParentColor = False
  end
  object L19: TLabel
    Left = 24
    Top = 264
    Width = 50
    Height = 14
    Caption = 'Label85'
    Color = clBtnFace
    ParentColor = False
  end
  object L1: TLabel
    Left = 128
    Top = 264
    Width = 50
    Height = 14
    Caption = 'Label86'
    Color = clBtnFace
    ParentColor = False
  end
  object P2: TPanel
    Left = 0
    Top = 0
    Width = 969
    Height = 689
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    ExplicitWidth = 965
    ExplicitHeight = 688
    object P3: TPanel
      Left = 0
      Top = 0
      Width = 969
      Height = 689
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 965
      ExplicitHeight = 688
      object pbahn: TPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 689
        Align = alClient
        BevelOuter = bvNone
        Color = clBlack
        TabOrder = 0
        ExplicitWidth = 965
        ExplicitHeight = 688
        object PB1: TPaintBox
          Left = 0
          Top = 0
          Width = 760
          Height = 689
          Align = alClient
          OnPaint = NewOrbitals
          ExplicitWidth = 495
          ExplicitHeight = 393
        end
        object P6: TPanel
          Left = 760
          Top = 0
          Width = 209
          Height = 689
          Align = alRight
          BevelOuter = bvNone
          Color = 15790320
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 756
          ExplicitHeight = 688
          object L24: TLabel
            Left = 16
            Top = 0
            Width = 51
            Height = 14
            Caption = 'Objects'
            Color = 15790320
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object L25: TLabel
            Left = 65
            Top = 324
            Width = 25
            Height = 13
            Caption = 'Day :'
            Color = 15790320
            ParentColor = False
          end
          object L26: TLabel
            Left = 42
            Top = 349
            Width = 48
            Height = 13
            Caption = 'Mounth :'
            Color = 15790320
            ParentColor = False
          end
          object L27: TLabel
            Left = 64
            Top = 375
            Width = 26
            Height = 13
            Caption = 'Year :'
            Color = 15790320
            ParentColor = False
          end
          object L28: TLabel
            Left = 96
            Top = 536
            Width = 26
            Height = 13
            Caption = 'Scale'
            Color = 15790320
            ParentColor = False
          end
          object S1: TSpeedButton
            Left = 16
            Top = 532
            Width = 23
            Height = 22
            Hint = 'Zoom in'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = S8C
          end
          object S3: TSpeedButton
            Left = 64
            Top = 532
            Width = 23
            Height = 22
            Hint = 'Zoom out'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = S8C
          end
          object S2: TSpeedButton
            Left = 40
            Top = 532
            Width = 23
            Height = 22
            Hint = 'Reset'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = S8C
          end
          object L29: TLabel
            Left = 80
            Top = 396
            Width = 10
            Height = 20
            Caption = 'D'
            Color = 15790320
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Symbol'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label1: TLabel
            Left = 16
            Top = 472
            Width = 76
            Height = 13
            Caption = 'Speed : 10 (ms)'
          end
          object Button2: TButton
            Left = 106
            Top = 435
            Width = 88
            Height = 25
            Caption = 'Simulation'
            TabOrder = 3
            TabStop = False
            OnClick = Button2Click
          end
          object Button1: TButton
            Left = 12
            Top = 435
            Width = 88
            Height = 25
            Caption = 'Depiction'
            TabOrder = 4
            TabStop = False
            OnClick = NewOrbitals
          end
          object CL1: TCheckListBox
            Left = 6
            Top = 20
            Width = 193
            Height = 251
            TabStop = False
            Color = 15790320
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            IntegralHeight = True
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            OnClick = NewOrbitals
          end
          object E1: TEdit
            Left = 96
            Top = 321
            Width = 57
            Height = 21
            TabStop = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '11'
          end
          object E3: TEdit
            Left = 96
            Top = 372
            Width = 57
            Height = 21
            TabStop = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = '2001'
          end
          object CheckBox1: TCheckBox
            Left = 16
            Top = 568
            Width = 176
            Height = 19
            TabStop = False
            Caption = 'Planetoid and Kuiper Belts'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            State = cbChecked
            TabOrder = 5
            OnClick = NewOrbitals
          end
          object liste: TListBox
            Left = 16
            Top = 600
            Width = 188
            Height = 136
            ItemHeight = 13
            Items.Strings = (
              'Merkur'
              '77'
              '0.387'
              '0.2056'
              '0'
              '0'
              'Venus'
              '131'
              '0.7233'
              '0.0068'
              '0'
              '0'
              'Erde'
              '103'
              '1'
              '0.016719'
              '0'
              '0'
              'Mars'
              '336'
              '1.52369'
              '0.0934'
              '0'
              '0'
              'Jupiter'
              '14'
              '5.2032'
              '0.0482'
              '0'
              '0'
              'Saturn'
              '93'
              '9.5210'
              '0.0550'
              '0'
              '0'
              'Uranus'
              '170'
              '19.162'
              '0.0472'
              '0'
              '0'
              'Neptun'
              '44'
              '30.029'
              '0.010'
              '0'
              '0'
              'Kleinplanet Ceres'
              '72.416'
              '2.76996'
              '0.07608'
              '1999.9954'
              '5.0856'
              'Kleinplanet Eris'
              '150.97661'
              '67.7808'
              '0.44068'
              '1698.5'
              '558.04'
              'Kleinplanet Haumea'
              '240.20011'
              '43.2176'
              '0.19126'
              '1849.9348'
              '284.12'
              'Kleinplanet Pluto'
              '223'
              '39.354'
              '0.246'
              '1981.4125'
              '251.370'
              'Kleinplanet Sedna'
              '311.28785'
              '524.3892'
              '0.85489'
              '-9932'
              '12008.5'
              'Komet Biela'
              '221.6588'
              '3.53466'
              '0.7513'
              '1832.73'
              '6.65'
              'Komet Brorsen-Metcalf'
              '80.8'
              '17.286'
              '0.972'
              '1919.79'
              '72.0'
              'Komet Brorsen2'
              '117.2'
              '3.105'
              '0.810'
              '1879.24'
              '5.46'
              'Komet Encke'
              '186.5403'
              '2.215'
              '0.8483'
              '2013.8904'
              '3.30'
              'Komet Giacobini-Zinner'
              '7.1'
              '3.495'
              '0.715'
              '1979.12'
              '6.52'
              'Komet Halley'
              '111.3325'
              '17.8341'
              '0.96714'
              '1986.0986'
              '75.32'
              'Komet Herschel-Rigollet'
              '24.6'
              '28.769'
              '0.974'
              '1939.60'
              '155'
              'Komet Kohoutek'
              '83.0'
              '3.393'
              '0.537'
              '1981.29'
              '6.24'
              'Komet Schwassmann-Wachmann'
              '334.1'
              '6.087'
              '0.105'
              '1974.13'
              '15.0'
              'Komet Tempel 2'
              '310.1'
              '3.035'
              '0.545'
              '1983.42'
              '5.29'
              'Komet Tschurjumow'
              '12.78561'
              '3.4628'
              '0.640974'
              '2002.630137'
              '6.44'
              'Planetoid Apollo'
              '285.7'
              '1.471'
              '0.3807'
              '2002.345205'
              '1.7841'
              'Planetoid Aten'
              '147.9'
              '0.967'
              '0.1892'
              '2002.345205'
              '0.9509'
              'Planetoid Eros'
              '178.581472'
              '1.4584'
              '0.22292239'
              '1997.9614'
              '1.76123'
              'Planetoid Davida'
              '339.207'
              '3.1728'
              '0.1783'
              '1990.3589'
              '5.689'
              'Planetoid Hathor'
              '356.0'
              '0.832'
              '0.5252'
              '2002.345205'
              '0.7589'
              'Planetoid Icarus'
              '31.3'
              '1.078'
              '0.7672'
              '2002.345205'
              '1.1193'
              'Planetoid Juno'
              '248.41'
              '2.6707'
              '0.2554'
              '2014.52559'
              '4.36'
              'Planetoid Kepler'
              '332.2957'
              '2.68749'
              '0.46559'
              '2013.2055'
              '4.41'
              'Planetoid Kerstin'
              '351.5539'
              '3.23412'
              '0.12200'
              '2014.73151'
              '5.82'
              'Planetoid Pallas'
              '309.724'
              '2.77111'
              '0.23359'
              '2000.1656'
              '4.613'
              'Planetoid Vesta'
              '149.986'
              '2.3607'
              '0.0906'
              '1990.3589'
              '3.63'
              'Planetoid 2001 FR85'
              '232.5'
              '0.984'
              '0.0285'
              '2002.345205'
              '0.9761')
            TabOrder = 6
            Visible = False
          end
          object Edit1: TEdit
            Left = 96
            Top = 398
            Width = 57
            Height = 21
            TabStop = False
            TabOrder = 7
            Text = '1'
          end
          object UpDown1: TUpDown
            Left = 153
            Top = 398
            Width = 16
            Height = 21
            Associate = Edit1
            Min = -1461
            Max = 1461
            Position = 1
            TabOrder = 8
            Thousands = False
          end
          object E2: TEdit
            Left = 96
            Top = 346
            Width = 57
            Height = 21
            TabStop = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            Text = '9'
          end
          object ScrollBar1: TScrollBar
            Left = 16
            Top = 496
            Width = 177
            Height = 17
            Max = 1000
            Min = 1
            PageSize = 0
            Position = 10
            TabOrder = 10
            OnChange = ScrollBar1Change
          end
          object CheckBox2: TCheckBox
            Left = 32
            Top = 291
            Width = 69
            Height = 17
            Caption = 'Show all'
            TabOrder = 11
            OnClick = CheckBox2Click
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 689
    Width = 969
    Height = 19
    Panels = <
      item
        Text = 'Dimension :'
        Width = 75
      end
      item
        Width = 150
      end
      item
        Text = 'Bit :'
        Width = 35
      end
      item
        Text = '24'
        Width = 50
      end
      item
        Text = 'Scale :'
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitTop = 688
    ExplicitWidth = 965
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 128
    Top = 40
  end
  object MainMenu1: TMainMenu
    Left = 208
    Top = 40
    object File1: TMenuItem
      Caption = 'File'
      object Save1: TMenuItem
        Caption = 'Save'
        OnClick = Save1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Close1: TMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
    object SolarSystem1: TMenuItem
      Caption = 'Solar System'
      object Simulation1: TMenuItem
        AutoCheck = True
        Caption = 'Simulation'
        OnClick = Simulation1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Scale1: TMenuItem
        Caption = 'Scale +'
        OnClick = Scale1Click
      end
      object Scale2: TMenuItem
        Caption = 'Scale -'
        OnClick = Scale2Click
      end
      object Undo1: TMenuItem
        Caption = 'Undo'
        OnClick = Undo1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object PlanetoidandKuiperBelts1: TMenuItem
        AutoCheck = True
        Caption = 'Planetoid and Kuiper Belts'
        Checked = True
        OnClick = PlanetoidandKuiperBelts1Click
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object Mercury1: TMenuItem
        AutoCheck = True
        Caption = 'Mercury'
        Checked = True
        OnClick = Mercury1Click
      end
      object Venus1: TMenuItem
        Caption = 'Venus'
        Checked = True
        OnClick = Venus1Click
      end
      object Earth1: TMenuItem
        Caption = 'Earth'
        Checked = True
        OnClick = Earth1Click
      end
      object Mars1: TMenuItem
        Caption = 'Mars'
        Checked = True
        OnClick = Mars1Click
      end
      object Jupiter1: TMenuItem
        Caption = 'Jupiter'
        Checked = True
        OnClick = Jupiter1Click
      end
      object Saturn1: TMenuItem
        Caption = 'Saturn'
        Checked = True
        OnClick = Saturn1Click
      end
      object Uranus1: TMenuItem
        Caption = 'Uranus'
        Checked = True
        OnClick = Uranus1Click
      end
      object Neptun1: TMenuItem
        Caption = 'Neptun'
        Checked = True
        OnClick = Neptun1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object MinorPlanet1: TMenuItem
        Caption = 'Minor Planet'
        object Ceres1: TMenuItem
          Caption = 'Ceres'
          OnClick = Ceres1Click
        end
        object Eris1: TMenuItem
          Caption = 'Eris'
          OnClick = Eris1Click
        end
        object Haumea1: TMenuItem
          Caption = 'Haumea'
          OnClick = Haumea1Click
        end
        object Pluto1: TMenuItem
          Caption = 'Pluto'
          OnClick = Pluto1Click
        end
        object Sedna1: TMenuItem
          Caption = 'Sedna'
          OnClick = Sedna1Click
        end
      end
      object Comet1: TMenuItem
        Caption = 'Comet'
        object Biela1: TMenuItem
          Caption = 'Biela'
          OnClick = Biela1Click
        end
        object BrorsenMetcalf1: TMenuItem
          Caption = 'Brorsen-Metcalf'
          OnClick = BrorsenMetcalf1Click
        end
        object Brorsen21: TMenuItem
          Caption = 'Brorsen 2'
          OnClick = Brorsen21Click
        end
        object Encke1: TMenuItem
          Caption = 'Encke'
          OnClick = Encke1Click
        end
        object GiacobiniZinner1: TMenuItem
          Caption = 'Giacobini-Zinner'
          OnClick = GiacobiniZinner1Click
        end
        object Halley1: TMenuItem
          Caption = 'Halley'
          OnClick = Halley1Click
        end
        object HerschelRigollet1: TMenuItem
          Caption = 'Herschel-Rigollet'
          OnClick = HerschelRigollet1Click
        end
        object Kohoutek1: TMenuItem
          Caption = 'Kohoutek'
          OnClick = Kohoutek1Click
        end
        object SchwassmannWachmann11: TMenuItem
          Caption = 'Schwassmann-Wachmann 1'
          OnClick = SchwassmannWachmann11Click
        end
        object empel21: TMenuItem
          Caption = 'Tempel 2'
          OnClick = empel21Click
        end
        object schurjumov1: TMenuItem
          Caption = 'Tschurjumov'
          OnClick = schurjumov1Click
        end
      end
      object Planetoid1: TMenuItem
        Caption = 'Planetoid'
        object Apollo1: TMenuItem
          Caption = 'Apollo'
          OnClick = Apollo1Click
        end
        object Aten1: TMenuItem
          Caption = 'Aten'
          OnClick = Aten1Click
        end
        object Eros1: TMenuItem
          Caption = 'Eros'
          OnClick = Eros1Click
        end
        object Davida1: TMenuItem
          Caption = 'Davida'
          OnClick = Davida1Click
        end
        object Hathor1: TMenuItem
          Caption = 'Hathor'
          OnClick = Hathor1Click
        end
        object Icarus1: TMenuItem
          Caption = 'Icarus'
          OnClick = Icarus1Click
        end
        object Juno1: TMenuItem
          Caption = 'Juno'
          OnClick = Juno1Click
        end
        object Kepler1: TMenuItem
          Caption = 'Kepler'
          OnClick = Kepler1Click
        end
        object Kerstin1: TMenuItem
          Caption = 'Kerstin'
          OnClick = Kerstin1Click
        end
        object Pallas1: TMenuItem
          Caption = 'Pallas'
          OnClick = Pallas1Click
        end
        object Vesta1: TMenuItem
          Caption = 'Vesta'
          OnClick = Vesta1Click
        end
        object N2001FR851: TMenuItem
          Caption = '2001 FR85'
          OnClick = N2001FR851Click
        end
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object Panel1: TMenuItem
        AutoCheck = True
        Caption = 'Panel'
        Checked = True
        OnClick = Panel1Click
      end
      object StatusBar2: TMenuItem
        AutoCheck = True
        Caption = 'Status Bar'
        Checked = True
        OnClick = StatusBar2Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Bitmap (*.bmp)|*.bmp'
    Left = 288
    Top = 40
  end
end
