unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Galaxy, StdCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    Oldx, Oldy: Integer;
    Rotate, Zoom: Boolean;
    Galaxy: TGalaxy;
    { Private-Deklarationen}
  public
    { Public-Deklarationen}
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  PaintBox1.Canvas.Brush.Color:=clBlack;
  PaintBox1.Canvas.FillRect(PaintBox1.Canvas.ClipRect);
  Galaxy.Render(PaintBox1.Canvas);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Rotate:=False;
  Zoom:=False;
  Galaxy:=TGalaxy.Create;
  Galaxy.Init(1);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Galaxy.Free;
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  OldX:=x;
  OldY:=y;
  if Button=mbLeft then Rotate:=True;
  if Button=mbRight then Zoom:=True;
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Rotate then
    Galaxy.Rotate((Y-OldY)*Pi/180,(OldX-x)*Pi/180);
  if Zoom then
    Galaxy.Zoom((Y-OldY));
  if Rotate or Zoom then
  begin
    PaintBox1Paint(nil);
    OldX:=x;
    OldY:=y;
  end;
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then Rotate:=False;
  if Button=mbRight then Zoom:=False;
end;

end.
