unit Vector2D;

interface

type
  TVector2D=record
    x, y: Extended;
  end;

  function Vector2DLength(const Vector: TVector2D): Extended; overload;
  function Vector2DLength(const x, y: Extended): Extended; overload;
  function Vector2DAdd(const Vector1, Vector2: TVector2D): TVector2D; overload;
  function Vector2DAdd(const Vector: TVector2D; const x, y: Extended): TVector2D; overload;
  function Vector2DAdd(const x1, y1, x2, y2: Extended): TVector2D; overload;
  function Vector2DSubtract(const Vector1, Vector2: TVector2D): TVector2D; overload;
  function Vector2DSubtract(const Vector: TVector2D; const x, y: Extended): TVector2D; overload;
  function Vector2DSubtract(const x1, y1, x2, y2: Extended): TVector2D; overload;
  function Vector2DMultiply(const Vector1, Vector2: TVector2D): TVector2D; overload;
  function Vector2DMultiply(const Vector: TVector2D; const s: Extended): TVector2D; overload;
  function Vector2DMultiply(const x, y, s: Extended): TVector2D; overload;
  function Vector2DMultiply(const Vector: TVector2D; const sx, sy: Extended): TVector2D; overload;
  function Vector2DMultiply(const x, y, sx, sy: Extended): TVector2D; overload;
  function Vector2DDivide(const Vector1, Vector2: TVector2D): TVector2D; overload;
  function Vector2DDivide(const Vector: TVector2D; const s: Extended): TVector2D; overload;
  function Vector2DDivide(const x, y, s: Extended): TVector2D; overload;
  function Vector2DDivide(const Vector: TVector2D; const sx, sy: Extended): TVector2D; overload;
  function Vector2DDivide(const x, y, sx, sy: Extended): TVector2D; overload;
  function Vector2DNormalize(const Vector: TVector2D): TVector2D; overload;
  function Vector2DNormalize(const x, y: Extended): TVector2D; overload;

implementation

uses
  Matrix;

function Vector2DLength(const Vector: TVector2D): Extended;
begin
  Result:=Sqrt(Vector.x*Vector.x+Vector.y*Vector.y);
end;

function Vector2DLength(const x, y: Extended): Extended;
begin
  Result:=Sqrt(x*x+y*y);
end;

function Vector2DAdd(const Vector1, Vector2: TVector2D): TVector2D;
begin
  Result.x:=Vector1.x+Vector2.x;
  Result.y:=Vector1.y+Vector2.y;
end;

function Vector2DAdd(const Vector: TVector2D; const x, y: Extended): TVector2D; overload;
begin
  Result.x:=Vector.x+x;
  Result.y:=Vector.y+y;
end;

function Vector2DAdd(const x1, y1, x2, y2: Extended): TVector2D; overload;
begin
  Result.x:=x1+x2;
  Result.y:=y1+y2;
end;

function Vector2DSubtract(const Vector1, Vector2: TVector2D): TVector2D;
begin
  Result.x:=Vector1.x-Vector2.x;
  Result.y:=Vector1.y-Vector2.y;
end;

function Vector2DSubtract(const Vector: TVector2D; const x, y: Extended): TVector2D; overload;
begin
  Result.x:=Vector.x-x;
  Result.y:=Vector.y-y;
end;

function Vector2DSubtract(const x1, y1, x2, y2: Extended): TVector2D; overload;
begin
  Result.x:=x1-x2;
  Result.y:=y1-y2;
end;

function Vector2DMultiply(const Vector1, Vector2: TVector2D): TVector2D;
begin
  Result.x:=Vector1.x*Vector1.x;
  Result.y:=Vector1.y*Vector1.y;
end;

function Vector2DMultiply(const Vector: TVector2D; const s: Extended): TVector2D;
begin
  Result.x:=Vector.x*s;
  Result.y:=Vector.y*s;
end;

function Vector2DMultiply(const x, y, s: Extended): TVector2D;
begin
  Result.x:=x*s;
  Result.y:=y*s;
end;

function Vector2DMultiply(const Vector: TVector2D; const sx, sy: Extended): TVector2D;
begin
  Result.x:=Vector.x*sx;
  Result.y:=Vector.y*sy;
end;

function Vector2DMultiply(const x, y, sx, sy: Extended): TVector2D;
begin
  Result.x:=x*sx;
  Result.y:=y*sy;
end;

function Vector2DDivide(const Vector1, Vector2: TVector2D): TVector2D;
begin
  Result.x:=Vector1.x/Vector1.x;
  Result.y:=Vector1.y/Vector1.y;
end;

function Vector2DDivide(const Vector: TVector2D; const s: Extended): TVector2D;
begin
  Result.x:=Vector.x/s;
  Result.y:=Vector.y/s;
end;

function Vector2DDivide(const x, y, s: Extended): TVector2D;
begin
  Result.x:=x/s;
  Result.y:=y/s;
end;

function Vector2DDivide(const Vector: TVector2D; const sx, sy: Extended): TVector2D;
begin
  Result.x:=Vector.x/sx;
  Result.y:=Vector.y/sy;
end;

function Vector2DDivide(const x, y, sx, sy: Extended): TVector2D;
begin
  Result.x:=x/sx;
  Result.y:=y/sy;
end;

function Vector2DNormalize(const Vector: TVector2D): TVector2D;
begin
  Result:=Vector2DDivide(Vector,Vector2DLength(Vector));
end;

function Vector2DNormalize(const x, y: Extended): TVector2D;
begin
  Result:=Vector2DDivide(x,y,Vector2DLength(x,y));
end;

end.

