unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, XPMan;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    Paintbox1: TPaintBox;
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    SpinEdit2: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j,z,ss,xm,ym,x,y,distanz,dx,dy:integer;
  radius,alpha,p:double;
  cabbruch:boolean;
  teilchen,farben : integer;
  breite,hoehe:integer;
  farbfeld : array of array of byte;
  tempbitmap:tbitmap;
  ziel:tcanvas;
  Time1, Time2, abbruchtime, frequenz: Int64;
  abbruch:boolean;
  w, h : integer;

  function getpix(a,b:integer):integer;
  begin
    if (a>=0) and (a<=breite) and (b>=0) and (b<=hoehe) then getpix:=farbfeld[a,b]
                                                        else getpix:=0;
  end;
begin
  Screen.Cursor := crHourGlass;
  p:=0.0001;
  for i:=1 to spinedit1.Value do
    p:=2.0*p;
  QueryPerformanceFrequency (frequenz);
  abbruchtime:=frequenz div 2;
  abbruch:=false;
  breite:=paintbox1.Width;
  hoehe:=paintbox1.height;
  tempbitmap:=tbitmap.create;
  tempbitmap.width:=breite;
  tempbitmap.height:=hoehe;
  tempbitmap.PixelFormat:=pf32bit;
  ziel:=tempbitmap.canvas;
  setlength(farbfeld,breite+1,hoehe+1);

  for i:=0 to breite do
    for j:=0 to hoehe do farbfeld[i,j]:=0;
  distanz:=0;
  z:=0;
  teilchen:=0;
  xm:=paintbox1.width div 2;
  ym:=paintbox1.height div 2;
  ziel.pixels[xm,ym]:= clBlue;
  farbfeld[xm,ym]:=1;

  QueryPerformanceCounter(Time1);

  w := SpinEdit2.Value;
  //h := SpinEdit3.Value;

  repeat
    z:=z+1;
    radius:=distanz*(1+random*p);
    alpha:=2.0*pi*random;
    x:=xm+round(radius*cos(alpha));
    y:=ym+round(radius*sin(alpha));

    cabbruch:=false;
    repeat
      case random(4) of
        0 : begin
              x:=x-w;
              if x<=1 then abbruch:=true;
            end;
        1 : begin
              x:=x+w;
              if x>=breite-1 then abbruch:=true;
            end;
        2 : begin
              y:=y-1;
              if y<=1 then abbruch:=true;
            end;
        3 : begin
              y:=y+1;
              if y>=hoehe-1 then abbruch:=true;
            end;
      end;
      ss:=  getpix(x-1,y)+getpix(x+1,y)+getpix(x,y-1)+
            getpix(x+1,y+1)+getpix(x-1,y-1)+
            getpix(x-1,y+1)+getpix(x+1,y-1)+getpix(x,y+1);


      if ss>0 then begin
        farben:=z mod 128;
        ziel.pixels[x,y]:= RGB(farben,farben,255);
        farbfeld[x,y]:=1;
        inc(teilchen);
        dx:=abs(x-xm);
        dy:=abs(y-ym);
        if distanz<dx then distanz:=dx;
        if distanz<dy then distanz:=dy;
        cabbruch:=true;
      end;
      if (abs(x-xm)>distanz+4) or (abs(y-ym)>distanz+4) then cabbruch:=true;
    until cabbruch;

    QueryPerformanceCounter(Time2);
    if time2-time1>abbruchtime then begin
      application.processmessages;
      paintbox1.canvas.draw(0,0,tempbitmap);
      time1:=time2;
    end;
  until abbruch or (2*distanz>hoehe);

  ziel.Font.name:='Verdana';
  ziel.textout(breite-100,20,format('Distanz %d  ',[distanz]));
  ziel.textout(breite-100,36,format('Cluster %d  ',[teilchen]));

  paintbox1.canvas.draw(0,0,tempbitmap);
  setlength(farbfeld,0,0);
  tempbitmap.Free;
  Screen.Cursor := crDefault;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Bitmap: TBitmap;
begin
  if SaveDialog1.Execute then
  begin
    try
      Bitmap:=TBitmap.Create;
      Bitmap.PixelFormat := pf24bit;
      Bitmap.Width:=PaintBox1.Width;
      Bitmap.Height:=PaintBox1.Height;
      Bitmap.Canvas.CopyRect(Bounds(0,0,bitmap.Width, Bitmap.Height),
        PaintBox1.Canvas, PaintBox1.ClientRect);

      Bitmap.SaveToFile(SaveDialog1.FileName + '.bmp');
    finally
      Bitmap.Free;
    end;
  end;
end;

end.
