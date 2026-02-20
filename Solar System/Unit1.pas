unit Unit1;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFnDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType, LMessages,
{$ENDIF}
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Shell.ShellCtrls, CheckLst,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Math;

type
  tBahnDat = record
    bdkn,
    bda,
    bdex,
    bdlpe,
    bdum: double;
    col: tColor;
  end;

  { Tform1 }

  TForm1 = class(TForm)
    P2: TPanel;
    P3: TPanel;
    pbahn: TPanel;
    PB1: TPaintBox;
    P6: TPanel;
    L24: TLabel;
    L25: TLabel;
    L26: TLabel;
    L27: TLabel;
    L28: TLabel;
    S1: TSpeedButton;
    S3: TSpeedButton;
    S2: TSpeedButton;
    Button2: TButton;
    Button1: TButton;
    CL1: TCheckListBox;
    E1: TEdit;
    E3: TEdit;
    L20: TLabel;
    L19: TLabel;
    L1: TLabel;
    L29: TLabel;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    liste: TListBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    E2: TEdit;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Close1: TMenuItem;
    Save1: TMenuItem;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    SolarSystem1: TMenuItem;
    Options1: TMenuItem;
    View1: TMenuItem;
    N1: TMenuItem;
    Simulation1: TMenuItem;
    Mercury1: TMenuItem;
    N2: TMenuItem;
    Scale1: TMenuItem;
    Scale2: TMenuItem;
    Undo1: TMenuItem;
    N3: TMenuItem;
    PlanetoidandKuiperBelts1: TMenuItem;
    Venus1: TMenuItem;
    Panel1: TMenuItem;
    Earth1: TMenuItem;
    Mars1: TMenuItem;
    Jupiter1: TMenuItem;
    Saturn1: TMenuItem;
    N4: TMenuItem;
    MinorPlanet1: TMenuItem;
    Ceres1: TMenuItem;
    Uranus1: TMenuItem;
    Neptun1: TMenuItem;
    Eris1: TMenuItem;
    Haumea1: TMenuItem;
    Pluto1: TMenuItem;
    Sedna1: TMenuItem;
    Comet1: TMenuItem;
    Biela1: TMenuItem;
    BrorsenMetcalf1: TMenuItem;
    Brorsen21: TMenuItem;
    Encke1: TMenuItem;
    GiacobiniZinner1: TMenuItem;
    Halley1: TMenuItem;
    HerschelRigollet1: TMenuItem;
    Kohoutek1: TMenuItem;
    SchwassmannWachmann11: TMenuItem;
    empel21: TMenuItem;
    schurjumov1: TMenuItem;
    Planetoid1: TMenuItem;
    Apollo1: TMenuItem;
    Aten1: TMenuItem;
    Eros1: TMenuItem;
    Davida1: TMenuItem;
    Hathor1: TMenuItem;
    Icarus1: TMenuItem;
    Juno1: TMenuItem;
    Kepler1: TMenuItem;
    Kerstin1: TMenuItem;
    Pallas1: TMenuItem;
    Vesta1: TMenuItem;
    N2001FR851: TMenuItem;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    StatusBar2: TMenuItem;
    CheckBox2: TCheckBox;
    procedure DateChange(Sender: TObject);
    procedure NewOrbitals(Sender: TObject);
    procedure PB1Paint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure S8C(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Simulation1Click(Sender: TObject);
    procedure Mercury1Click(Sender: TObject);
    procedure Scale1Click(Sender: TObject);
    procedure Scale2Click(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure PlanetoidandKuiperBelts1Click(Sender: TObject);
    procedure Venus1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Earth1Click(Sender: TObject);
    procedure Mars1Click(Sender: TObject);
    procedure Jupiter1Click(Sender: TObject);
    procedure Saturn1Click(Sender: TObject);
    procedure Uranus1Click(Sender: TObject);
    procedure Neptun1Click(Sender: TObject);
    procedure Ceres1Click(Sender: TObject);
    procedure Eris1Click(Sender: TObject);
    procedure Haumea1Click(Sender: TObject);
    procedure Pluto1Click(Sender: TObject);
    procedure Sedna1Click(Sender: TObject);
    procedure Biela1Click(Sender: TObject);
    procedure BrorsenMetcalf1Click(Sender: TObject);
    procedure Brorsen21Click(Sender: TObject);
    procedure Encke1Click(Sender: TObject);
    procedure GiacobiniZinner1Click(Sender: TObject);
    procedure Halley1Click(Sender: TObject);
    procedure HerschelRigollet1Click(Sender: TObject);
    procedure Kohoutek1Click(Sender: TObject);
    procedure SchwassmannWachmann11Click(Sender: TObject);
    procedure empel21Click(Sender: TObject);
    procedure schurjumov1Click(Sender: TObject);
    procedure Apollo1Click(Sender: TObject);
    procedure Aten1Click(Sender: TObject);
    procedure Eros1Click(Sender: TObject);
    procedure Davida1Click(Sender: TObject);
    procedure Hathor1Click(Sender: TObject);
    procedure Icarus1Click(Sender: TObject);
    procedure Juno1Click(Sender: TObject);
    procedure Kepler1Click(Sender: TObject);
    procedure Kerstin1Click(Sender: TObject);
    procedure Pallas1Click(Sender: TObject);
    procedure Vesta1Click(Sender: TObject);
    procedure N2001FR851Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure StatusBar2Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private-Deklarationen }
    Fbitmap: tbitmap;
    FBmpOrbital: tbitmap;
    Fziel: tcanvas;
    Fbirect, Fmyrect: trect;
    FarrChecked: array of integer;
    FarrBahnDat: array of tBahnDat;
    Fbx, Fhx : integer;
    FDatum : TDateTime;
    FJuldat: double;
    FsYear, FsMonth, FsDay: string;
    Fyear, Fmonth, Fday: word;
  public
    { Public-Deklarationen }
  end;

  const farb: array[0..14] of longint =
           ($00f0f0f0, $0000ff00, $00ff0000, $000000ff, $00ffff00, $00ff00ff,
            $0000ffff, $00ff7fff, $007fffff, $00ffff7f, $00ff7f00, $00ff007f,
            $00ff7f7f, $0000ff7f, $07f7fff);

var
  Form1: TForm1;

implementation

uses XAstro;

{$R *.dfm}

var
  wert: double;

const
  pino = pi / 180;

procedure kalende1(var ta,mo,ja:longint);
var sc:boolean;
begin
    if ((ta=32) and (mo in [1,3,5,7,8,10,12])) or
       ((ta=31) and (mo in [4,6,9,11])) then
    begin
      inc(mo);
      ta:=1;
    end;
    if mo=2 then
    begin
      sc:=(ja mod 4=0);
      if (ja mod 100=0) and not(ja mod 400=0) then sc:=not sc;
      if sc and (ta=30) then
      begin
        inc(mo);
        ta:=1;
      end;
      if not sc and (ta=29) then
      begin
        inc(mo);
        ta:=1;
      end;
    end;
    if mo=13 then
    begin
      inc(ja);
      mo:=1
    end;

    if ((ta=0) and (mo in [2,4,6,8,9,11,1])) then
    begin
      dec(mo);
      ta:=31;
    end;
    if ((ta=0) and (mo in [5,7,10,12])) then
    begin
      dec(mo);
      ta:=30;
    end;
    if mo=3 then
    begin
      sc:=(ja mod 4=0);
      if (ja mod 100=0) and not(ja mod 400=0) then sc:=not sc;
      if sc and (ta=0) then
      begin
        dec(mo);
        ta:=29;
      end;
      if not sc and (ta=0) then
      begin
        dec(mo);
        ta:=28;
      end;
    end;
    if mo=0 then
    begin
      dec(ja);
      mo:=12;
      ta:=31;
    end;
end;

function juldat(const jahr, mon, tag: integer): real;
var
  y, m, k: longint;
  a, b: real;
begin
  k := 10000 * jahr + 100 * mon + tag;
  b := -63.5;
  y := jahr + 4712;
  m := mon + 1;
  if mon <= 2 then
  begin
    Dec(y);
    Inc(m, 12);
  end;
  if k >= 15821015 then
  begin
    A := int((y + 88) / 100);
    b := b + 38 - A + int(0.25 * A);
  end;
  juldat := int(365.25 * y) + int(30.6001 * m) + tag + b - 1 / 24;
end;

procedure TForm1.Pallas1Click(Sender: TObject);
begin
  if CL1.Checked[33] = true then
  begin
    CL1.Checked[33] := false;
  end else begin
    CL1.Checked[33] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
  if P6.Visible = true then
  begin
    P6.Visible := false;
  end else begin
    P6.Visible := true;
  end;
  Form1.OnResize(sender);
  Application.ProcessMessages;
end;

procedure TForm1.PB1paint(Sender: TObject);
var
  kp: string;
  um, kn, ex, r, a, e, p, po, lpe: real;
  x, y, xp, yp, xa, ya: integer;
  i, j: integer;

  sini, cosi: extended;
begin
  Fziel.CopyRect(fbirect,FBmpOrbital.Canvas,fbirect);
  for i := 1 to FarrChecked[0] do
  begin
    j := FarrChecked[i];
    kp := cl1.items.strings[j];
    with FarrBahnDat[j] do
    begin
      kn := bdkn;
      a := bda;
      ex := bdex;
      lpe := bdlpe;
      um := bdum;
      fziel.brush.color := col;
    end;
    e := a * ex;
    p := a-sqr(e)/ a;

    po := FJuldat;
    if (kp[1] <> 'K') and (kp[1] <> 'A') and (kp[1] <> 'P') then
    begin
      po := helio(FJuldat, kp);
      r := wert * p / (1 + ex * cos(pino * (po - kn)));
      sincos(pino * po, sini, cosi);
      x := Fbx + round(r * cosi);
      y := Fhx - round(r * sini);
      fziel.ellipse(x - 3, y - 3, x + 4, y + 4);
      fziel.brush.style := bsclear;
      fziel.textout(x - 6, y + 4, kp);
    end
    Else
      if (pos('Pluto', kp) <> 0) then
      begin
        po := po - juldat(trunc(lpe), round(365.25 * frac(lpe)), 1);
        po := kn + 360.0 * po / 365.25 / um;
        while po > 360 do
          po := po - 360;
        r := wert * p / (1 + ex * cos(pino * (po - kn)));
        sincos(pino * po, sini, cosi);
        x := Fbx + round(r * cosi);
        y := Fhx - round(r * sini);
        fziel.brush.style := bssolid;
        fziel.ellipse(x - 4, y - 4, x + 4, y + 4);
        fziel.brush.style := bsclear;
        fziel.textout(x - 6, y + 4, 'Pluto');
      end
      else
      begin
      r := wert * p / (1 + ex);
      sincos(pino * kn, sini, cosi);
      xp := Fbx + round(r * cosi);
      yp := Fhx - round(r * sini);

      r := wert * p / (1 + ex * cos(pi));
      sincos(pino * (180 + kn), sini, cosi);
      xa := Fbx + round(r * cosi);
      ya := Fhx - round(r * sini);
      xp := (xp + xa) div 2;
      yp := (yp + ya) div 2;

      po := FJuldat;
      po := po - juldat(trunc(lpe), round(365.25 * frac(lpe) / 30),
        round(30.0 * frac(365.25 * frac(lpe) / 30)));

      po := kn + 180.0 + 360.0 * po / 365.25 / um;
      while po > 360 do
        po := po - 360;
      r := wert * p / (1 + ex * cos(pino * (po - kn)));
      sincos(pino * po, sini, cosi);
      x := Fbx + round(r * cosi);
      y := Fhx - round(r * sini);
      x := 2 * xp - x;
      y := 2 * yp - y;
      fziel.brush.style := bssolid;
      fziel.ellipse(x - 4, y - 4, x + 4, y + 4);
      if pos(' ', kp) > 0 then
        kp := copy(kp, pos(' ', kp) + 1, 255);
      fziel.brush.style := bsclear;
      fziel.textout(x - 6, y + 4, kp);
    end;
  end;
  PB1.Canvas.copyrect(fbirect, fziel, fmyrect);
end;

procedure TForm1.PlanetoidandKuiperBelts1Click(Sender: TObject);
begin
  CheckBox1.Checked := not CheckBox1.Checked;
end;

procedure TForm1.Pluto1Click(Sender: TObject);
begin
  if CL1.Checked[11] = true then
  begin
    CL1.Checked[11] := false;
  end else begin
    CL1.Checked[11] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.S8C(Sender: TObject);
begin
  if Sender = s1 then
    wert := wert * sqrt(2);
  if Sender = s3 then
    wert := wert / sqrt(2);
  if Sender = s2 then
    wert := 60;
  if wert > 500 then
    wert := 500;
  NewOrbitals(Sender);
  StatusBar1.Panels[5].Text := FloatToStr(wert);
end;

procedure TForm1.Saturn1Click(Sender: TObject);
begin
  if CL1.Checked[5] = true then
  begin
    CL1.Checked[5] := false;
  end else begin
    CL1.Checked[5] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Save1Click(Sender: TObject);
var
  Bitmap: TBitmap;
begin
  if SaveDialog1.Execute then
  begin
    try
      Bitmap:=TBitmap.Create;
      Bitmap.PixelFormat := pf24bit;
      Bitmap.Width:= PB1.Width;
      Bitmap.Height:= PB1.Height;
      Bitmap.Canvas.CopyRect(Bounds(0,0,bitmap.Width, Bitmap.Height),
      PB1.Canvas, PB1.ClientRect);
      Bitmap.SaveToFile(SaveDialog1.FileName + '.bmp');
    finally
      Bitmap.Free;
    end;
  end;
end;

procedure TForm1.Scale1Click(Sender: TObject);
begin
  S1.Click;
end;

procedure TForm1.Scale2Click(Sender: TObject);
begin
  S3.Click;
end;

procedure TForm1.schurjumov1Click(Sender: TObject);
begin
  if CL1.Checked[23] = true then
  begin
    CL1.Checked[23] := false;
  end else begin
    CL1.Checked[23] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.SchwassmannWachmann11Click(Sender: TObject);
begin
  if CL1.Checked[21] = true then
  begin
    CL1.Checked[21] := false;
  end else begin
    CL1.Checked[21] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Timer1.Interval := ScrollBar1.Position;
  Label1.Caption := 'Speed : ' + IntToStr(Timer1.Interval) + ' (ms)';
end;

procedure TForm1.Sedna1Click(Sender: TObject);
begin
  if CL1.Checked[12] = true then
  begin
    CL1.Checked[12] := false;
  end else begin
    CL1.Checked[12] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Simulation1Click(Sender: TObject);
begin
  Button2.Click;
end;

procedure TForm1.StatusBar2Click(Sender: TObject);
begin
  if StatusBar2.Checked = true then
  begin
    StatusBar1.Visible := true;
  end else begin
    StatusBar1.Visible := false;
  end;
  Form1.OnShow(sender);
end;

procedure TForm1.Apollo1Click(Sender: TObject);
begin
  if CL1.Checked[24] = true then
  begin
    CL1.Checked[24] := false;
  end else begin
    CL1.Checked[24] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Aten1Click(Sender: TObject);
begin
  if CL1.Checked[25] = true then
  begin
    CL1.Checked[25] := false;
  end else begin
    CL1.Checked[25] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Biela1Click(Sender: TObject);
begin
  if CL1.Checked[13] = true then
  begin
    CL1.Checked[13] := false;
  end else begin
    CL1.Checked[13] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Brorsen21Click(Sender: TObject);
begin
  if CL1.Checked[15] = true then
  begin
    CL1.Checked[15] := false;
  end else begin
    CL1.Checked[15] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.BrorsenMetcalf1Click(Sender: TObject);
begin
  if CL1.Checked[14] = true then
  begin
    CL1.Checked[14] := false;
  end else begin
    CL1.Checked[14] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
  Save1.Enabled := not Timer1.Enabled;

  if not Timer1.Enabled then
    button2.Caption := 'Simulation'
  else
  begin
    DateChange(sender);
    button2.Caption := 'Stop';
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var _year,_month,_day,i,diff:integer;
begin
    FDatum := Fdatum+updown1.position;
    _year:=strtoint(e3.text);
    _month:=strtoint(e2.text);
    _day:=strtoint(e1.text);
    diff:=updown1.position;
    if diff>0 then
      for i:=1 to diff do
      begin
        inc(_day);
        kalende1(_day,_month,_year);
      end;
    if diff<0 then
      for i:=diff to -1 do
      begin
        dec(_day);
        kalende1(_day,_month,_year);
      end;
    e1.text:=inttostr(_day);
    e2.text:=inttostr(_month);
    e3.text:=inttostr(_year);
    FJuldat := JulDat(_Year, _Month, _Day);
    PB1paint(sender);
end;
procedure TForm1.Undo1Click(Sender: TObject);
begin
  S2.Click;
end;

procedure TForm1.Uranus1Click(Sender: TObject);
begin
  if CL1.Checked[6] = true then
  begin
    CL1.Checked[6] := false;
  end else begin
    CL1.Checked[6] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Venus1Click(Sender: TObject);
begin
  if CL1.Checked[1] = true then
  begin
    CL1.Checked[1] := false;
  end else begin
    CL1.Checked[1] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Vesta1Click(Sender: TObject);
begin
  if CL1.Checked[34] = true then
  begin
    CL1.Checked[34] := false;
  end else begin
    CL1.Checked[34] := true;
  end;
  CL1.OnClick(sender);
end;

{  DecodeDate(FDatum,Fyear ,Fmonth,Fday);
  FsYear  := IntToStr(Fyear);
  FsMonth := IntToStr(Fmonth);
  FsDay   := IntToStr(Fday);
  FJuldat := JulDat(FYear, FMonth, FDay);
  e1.Text := FsDay;
  e2.Text := FsMonth;
  e3.Text := FsYear;
  PB1paint(Sender);
end; }

procedure TForm1.N2001FR851Click(Sender: TObject);
begin
  if CL1.Checked[35] = true then
  begin
    CL1.Checked[35] := false;
  end else begin
    CL1.Checked[35] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Neptun1Click(Sender: TObject);
begin
  if CL1.Checked[7] = true then
  begin
    CL1.Checked[7] := false;
  end else begin
    CL1.Checked[7] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.NewOrbitals(Sender: TObject);
var
 sini, cosi :extended;
  p, e, kn, a, ex, r: double;
  i, j,x, y: integer;
  cnv: tCanvas;
begin
  DateChange(Sender);
  cnv := FBmpOrbital.canvas;
  with cnv do
  begin
    Brush.Style:= bsSolid;
    Brush.color := 0;
    FillRect(fmyrect);
  end;
  i := 1;
  for j := 0 to cl1.items.Count - 1 do
    if cl1.Checked[j] then
    begin
      FarrChecked[i] := j;
      Inc(i);
    end;
  FarrChecked[0] := i - 1;

  for i := 1 to FarrChecked[0] do
  begin
    j:=FarrChecked[i];
    cnv.pen.color   := farb[j mod 15];
    cnv.brush.color := farb[j mod 15];
    with FarrBahnDat[j] do
    begin
      col :=farb[j mod 15];
      kn := bdkn;
      a := bda;
      ex := bdex;
      {
      lpe := bdlpe;
      um := bdum;
      }
    end;
    e := a * ex;
//    b := sqrt(sqr(a) - sqr(e));
    p := a-sqr(e) / a;
    r := wert * p / (1 + ex * cos(0));
    sincos(pino * kn, sini, cosi);
    x := Fbx + round(r * cosi);
    y := Fhx - round(r * sini);

    cnv.moveto(x, y);
    for j := 1 to 360 do
    begin
      r := wert * p / (1 + ex * cos(pino * j));
      sincos(pino * (j + kn), sini, cosi);
      x := Fbx + round(r * cosi);
      y := Fhx - round(r * sini);
      cnv.lineto(x, y);
    end;
  end;

  if checkbox1.Checked then
  begin
    cnv.Brush.style := bsclear;
    cnv.pen.color := clred;
    cnv.pen.style := psdot;
    cnv.ellipse(round(Fbx - wert * 3.4), round(Fhx - wert * 3.4),
      round(fbx + wert * 3.4 + 1), round(Fhx + wert * 3.4 + 1));
    cnv.ellipse(round(Fbx - wert * 2), round(Fhx - wert * 2),
      round(Fbx + wert * 2 + 1), round(Fhx + wert * 2 + 1));
    cnv.ellipse(round(Fbx - wert * 30), round(Fhx - wert * 30),
      round(Fbx + wert * 30 + 1), round(Fhx + wert * 30 + 1));
    cnv.ellipse(round(Fbx - wert * 50), round(Fhx - wert * 50),
      round(Fbx + wert * 50 + 1), round(Fhx + wert * 50 + 1));
    cnv.pen.style := pssolid;
  end;

//  x :=round(50/wert);
{  if x<4 then
    a:=50/wert
  else
    a := x;    }

  cnv.pen.color := $00ffffff;
  cnv.moveto(10, 10);
  cnv.brush.style := bsclear;
{  cnv.font.color := clwhite;
  cnv.font.size := 8;
  cnv.textout(15, 6, Format('  %7.4f AE', [a])); }
  cnv.brush.color := clyellow;
  cnv.ellipse(Fbx - 4, Fhx - 4, Fbx + 5, Fhx + 5);


  if CL1.Checked[0] = true then
    begin
      Mercury1.Checked := true; end else begin Mercury1.Checked := false;
    end;

  if CL1.Checked[1] = true then
    begin
     Venus1.Checked := true; end else begin Venus1.Checked := false;
    end;

  if CL1.Checked[2] = true then
    begin
     Earth1.Checked := true; end else begin Earth1.Checked := false;
    end;

  if CL1.Checked[3] = true then
    begin
     Mars1.Checked := true; end else begin Mars1.Checked := false;
    end;

  if CL1.Checked[4] = true then
    begin
     Jupiter1.Checked := true; end else begin Jupiter1.Checked := false;
    end;

  if CL1.Checked[5] = true then
    begin
     Saturn1.Checked := true; end else begin Saturn1.Checked := false;
    end;

  if CL1.Checked[6] = true then
    begin
     Uranus1.Checked := true; end else begin Uranus1.Checked := false;
    end;

  if CL1.Checked[7] = true then
    begin
     Neptun1.Checked := true; end else begin Neptun1.Checked := false;
    end;

  if CL1.Checked[8] = true then
    begin
     Ceres1.Checked := true; end else begin Ceres1.Checked := false;
    end;

  if CL1.Checked[9] = true then
    begin
     Eris1.Checked := true; end else begin Eris1.Checked := false;
    end;

  if CL1.Checked[10] = true then
    begin
     Haumea1.Checked := true; end else begin Haumea1.Checked := false;
    end;

  if CL1.Checked[11] = true then
    begin
     Pluto1.Checked := true; end else begin Pluto1.Checked := false;
    end;

  if CL1.Checked[12] = true then
    begin
     Sedna1.Checked := true; end else begin Sedna1.Checked := false;
    end;

  if CL1.Checked[13] = true then
    begin
     Biela1.Checked := true; end else begin Biela1.Checked := false;
    end;

  if CL1.Checked[14] = true then
    begin
     BrorsenMetcalf1.Checked := true; end else begin BrorsenMetcalf1.Checked := false;
    end;

  if CL1.Checked[15] = true then
    begin
     Brorsen21.Checked := true; end else begin Brorsen21.Checked := false;
    end;

  if CL1.Checked[16] = true then
    begin
     Encke1.Checked := true; end else begin Encke1.Checked := false;
    end;

  if CL1.Checked[17] = true then
    begin
     GiacobiniZinner1.Checked := true; end else begin GiacobiniZinner1.Checked := false;
    end;

  if CL1.Checked[18] = true then
    begin
     Halley1.Checked := true; end else begin Halley1.Checked := false;
    end;

  if CL1.Checked[19] = true then
    begin
     HerschelRigollet1.Checked := true; end else begin HerschelRigollet1.Checked := false;
    end;

  if CL1.Checked[20] = true then
    begin
     Kohoutek1.Checked := true; end else begin Kohoutek1.Checked := false;
    end;

  if CL1.Checked[21] = true then
    begin
     SchwassmannWachmann11.Checked := true; end else begin SchwassmannWachmann11.Checked := false;
    end;

  if CL1.Checked[22] = true then
    begin
     empel21.Checked := true; end else begin empel21.Checked := false;
    end;

  if CL1.Checked[23] = true then
    begin
     schurjumov1.Checked := true; end else begin schurjumov1.Checked := false;
    end;

  if CL1.Checked[24] = true then
    begin
     Apollo1.Checked := true; end else begin Apollo1.Checked := false;
    end;

  if CL1.Checked[25] = true then
    begin
     Aten1.Checked := true; end else begin Aten1.Checked := false;
    end;

  if CL1.Checked[26] = true then
    begin
     Eros1.Checked := true; end else begin Eros1.Checked := false;
    end;

  if CL1.Checked[27] = true then
    begin
     Davida1.Checked := true; end else begin Davida1.Checked := false;
    end;

  if CL1.Checked[28] = true then
    begin
     Hathor1.Checked := true; end else begin Hathor1.Checked := false;
    end;

  if CL1.Checked[29] = true then
    begin
     Icarus1.Checked := true; end else begin Icarus1.Checked := false;
    end;

  if CL1.Checked[30] = true then
    begin
     Juno1.Checked := true; end else begin Juno1.Checked := false;
    end;

  if CL1.Checked[31] = true then
    begin
     Kepler1.Checked := true; end else begin Kepler1.Checked := false;
    end;

  if CL1.Checked[32] = true then
    begin
     Kerstin1.Checked := true; end else begin Kerstin1.Checked := false;
    end;

  if CL1.Checked[33] = true then
    begin
     Pallas1.Checked := true; end else begin Pallas1.Checked := false;
    end;

  if CL1.Checked[34] = true then
    begin
     Vesta1.Checked := true; end else begin Vesta1.Checked := false;
    end;

  if CL1.Checked[35] = true then
    begin
     N2001FR851.Checked := true; end else begin N2001FR851.Checked := false;
    end;


  PB1paint(self);
end;

procedure TForm1.Ceres1Click(Sender: TObject);
begin
  if CL1.Checked[8] = true then
  begin
    CL1.Checked[8] := false;
  end else begin
    CL1.Checked[8] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
var
  i : Integer;
begin
 for i := 0 to CL1.Items.Count-1 do
 begin
  if CheckBox2.Checked = true then
  begin
    CL1.Checked[i] := true;
  end else begin
    CL1.Checked[i] := false;
  end;

 end;
 CL1.OnClick(sender);
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
  //FBitmap.Free;
  //FBmpOrbital.free;
  Close;
end;

procedure TForm1.DateChange(Sender: TObject);
var _year,_month,_day : word;
    _juldat:real;
begin
  Fsday   := E1.text;
  Fsmonth := E2.text;
  FsYear  := E3.text;
  Fday    := StrToInt(Fsday);
  Fmonth  := StrToInt(FsMonth);
  FYear   := StrToInt(FsYear);
  FJuldat := JulDat(FYear, FMonth, FDay);

  decodedate(now,_year,_month,_day);
  _Juldat := JulDat(_Year, _Month, _Day);
  FDatum  := now+FJuldat-_Juldat;
end;


procedure TForm1.Davida1Click(Sender: TObject);
begin
  if CL1.Checked[27] = true then
  begin
    CL1.Checked[27] := false;
  end else begin
    CL1.Checked[27] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Earth1Click(Sender: TObject);
begin
  if CL1.Checked[2] = true then
  begin
    CL1.Checked[2] := false;
  end else begin
    CL1.Checked[2] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.empel21Click(Sender: TObject);
begin
  if CL1.Checked[22] = true then
  begin
    CL1.Checked[22] := false;
  end else begin
    CL1.Checked[22] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Encke1Click(Sender: TObject);
begin
  if CL1.Checked[16] = true then
  begin
    CL1.Checked[16] := false;
  end else begin
    CL1.Checked[16] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Eris1Click(Sender: TObject);
begin
  if CL1.Checked[9] = true then
  begin
    CL1.Checked[9] := false;
  end else begin
    CL1.Checked[9] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Eros1Click(Sender: TObject);
begin
  if CL1.Checked[26] = true then
  begin
    CL1.Checked[26] := false;
  end else begin
    CL1.Checked[26] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  kk: string;
  i, lnr: integer;
  oldDecSep : char;
begin
  Timer1.Enabled := False;

  if fbitmap<>nil then fbitmap.free;
  Fbitmap := tbitmap.Create;
  Fbitmap.Width := PB1.Width;
  Fbitmap.Height := PB1.Height;

  if fbmporbital<>nil then fbmporbital.free;
  FBmpOrbital := tbitmap.Create;
  FBmpOrbital.Width := PB1.Width;
  FBmpOrbital.Height := PB1.Height;

  Fbx := PB1.Width div 2;
  Fhx := PB1.Height div 2;

  fZiel   := Fbitmap.Canvas;
  fmyrect := PB1.clientrect;
  fbirect := fmyrect;
  fziel.font.color := clwhite;
  fziel.font.Name := 'Verdana';
  fziel.font.size := 8;

  cl1.Clear;
  lnr := 0;
  i := 0;
  repeat
    kk := liste.items[lnr];
    Inc(lnr);
    if kk[1] <> '[' then
    begin
      cl1.items.add(kk);
      if (i<8) or (i=23) then cl1.Checked[i]:= true;
      inc(i);
      Inc(lnr, 5);
    end;
  until (lnr > liste.items.Count - 1) or (kk[1] = '[');
  oldDecSep := FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator := '.';
  Setlength(FarrBahnDat, i);
  for i := 0 to cl1.items.Count - 1 do
  begin
    lnr := i * 6 + 1;
    with  FarrBahnDat[i] do
    begin
      bdkn:= strtofloat(liste.items[lnr]);
      bda :=strtofloat(liste.items[lnr+1]);
      bdex :=strtofloat(liste.items[lnr+2]);
      bdlpe :=strtofloat(liste.items[lnr+3]);
      bdUm  :=strtofloat(liste.items[lnr+4]);
    end;
  end;
  setlength(FarrChecked, length(FarrBahnDat) + 1);
  FormatSettings.DecimalSeparator := oldDecSep;
  NewOrbitals(self);

  StatusBar1.Panels[1].Text := 'X-' + IntToStr(PB1.Width) + ' x ' + 'Y-' + IntToStr(PB1.Height);
  StatusBar1.Panels[5].Text := FloatToStr(wert);
end;

procedure TForm1.GiacobiniZinner1Click(Sender: TObject);
begin
  if CL1.Checked[17] = true then
  begin
    CL1.Checked[17] := false;
  end else begin
    CL1.Checked[17] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Halley1Click(Sender: TObject);
begin
  if CL1.Checked[18] = true then
  begin
    CL1.Checked[18] := false;
  end else begin
    CL1.Checked[18] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Hathor1Click(Sender: TObject);
begin
  if CL1.Checked[28] = true then
  begin
    CL1.Checked[28] := false;
  end else begin
    CL1.Checked[28] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Haumea1Click(Sender: TObject);
begin
  if CL1.Checked[10] = true then
  begin
    CL1.Checked[10] := false;
  end else begin
    CL1.Checked[10] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.HerschelRigollet1Click(Sender: TObject);
begin
  if CL1.Checked[19] = true then
  begin
    CL1.Checked[19] := false;
  end else begin
    CL1.Checked[19] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Icarus1Click(Sender: TObject);
begin
  if CL1.Checked[29] = true then
  begin
    CL1.Checked[29] := false;
  end else begin
    CL1.Checked[29] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Juno1Click(Sender: TObject);
begin
  if CL1.Checked[30] = true then
  begin
    CL1.Checked[30] := false;
  end else begin
    CL1.Checked[30] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Jupiter1Click(Sender: TObject);
begin
  if CL1.Checked[4] = true then
  begin
    CL1.Checked[4] := false;
  end else begin
    CL1.Checked[4] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Kepler1Click(Sender: TObject);
begin
  if CL1.Checked[31] = true then
  begin
    CL1.Checked[31] := false;
  end else begin
    CL1.Checked[31] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Kerstin1Click(Sender: TObject);
begin
  if CL1.Checked[32] = true then
  begin
    CL1.Checked[32] := false;
  end else begin
    CL1.Checked[32] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Kohoutek1Click(Sender: TObject);
begin
  if CL1.Checked[20] = true then
  begin
    CL1.Checked[20] := false;
  end else begin
    CL1.Checked[20] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Mars1Click(Sender: TObject);
begin
  if CL1.Checked[3] = true then
  begin
    CL1.Checked[3] := false;
  end else begin
    CL1.Checked[3] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.Mercury1Click(Sender: TObject);
begin
  if CL1.Checked[0] = true then
  begin
    CL1.Checked[0] := false;
  end else begin
    CL1.Checked[0] := true;
  end;
  CL1.OnClick(sender);
end;

procedure TForm1.FormActivate(Sender: TObject);
var year,month,day:word;
begin
  FDatum := date;
  decodedate(date, year, month, day);
  Fday := day;
  Fmonth := month;
  FYear := year;
  FJuldat := JulDat(FYear, FMonth, FDay);

  FsYear := IntToStr(Fyear);
  FsMonth := IntToStr(Fmonth);
  FsDay := IntToStr(Fday);
  e1.Text := Fsday;
  e2.Text := Fsmonth;
  e3.Text := FsYear;

  wert := 60;
end;

end.
