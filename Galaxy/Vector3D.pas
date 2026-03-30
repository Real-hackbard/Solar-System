unit Vector3D;

interface

type
  TVector3D=record
    x, y, z: Extended;
  end;

  function Vector3DLength(const Vector: TVector3D): Extended; overload;
  function Vector3DLength(const x, y, z: Extended): Extended; overload;
  function Vector3DAdd(const Vector1, Vector2: TVector3D): TVector3D; overload;
  function Vector3DAdd(const Vector: TVector3D; const x, y, z: Extended): TVector3D; overload;
  function Vector3DAdd(const x1, y1, z1, x2, y2, z2: Extended): TVector3D; overload;
  function Vector3DSubtract(const Vector1, Vector2: TVector3D): TVector3D; overload;
  function Vector3DSubtract(const Vector: TVector3D; const x, y, z: Extended): TVector3D; overload;
  function Vector3DSubtract(const x1, y1, z1, x2, y2, z2: Extended): TVector3D; overload;
  function Vector3DScalarMultiply(const Vector1, Vector2: TVector3D): TVector3D; overload;
  function Vector3DScalarMultiply(const Vector: TVector3D; const s: Extended): TVector3D; overload;
  function Vector3DScalarMultiply(const x, y, z, s: Extended): TVector3D; overload;
  function Vector3DScalarMultiply(const Vector: TVector3D; const sx, sy, sz: Extended): TVector3D; overload;
  function Vector3DScalarMultiply(const x, y, z, sx, sy, sz: Extended): TVector3D; overload;
  function Vector3DScalarDivide(const Vector1, Vector2: TVector3D): TVector3D; overload;
  function Vector3DScalarDivide(const Vector: TVector3D; const s: Extended): TVector3D; overload;
  function Vector3DScalarDivide(const x, y, z, s: Extended): TVector3D; overload;
  function Vector3DScalarDivide(const Vector: TVector3D; const sx, sy, sz: Extended): TVector3D; overload;
  function Vector3DScalarDivide(const x, y, z, sx, sy, sz: Extended): TVector3D; overload;
  function Vector3DDotMultiply(const Vector1, Vector2: TVector3D): Extended; overload;
  function Vector3DDotMultiply(const Vector: TVector3D; const x, y, z: Extended): Extended; overload;
  function Vector3DDotMultiply(const x1, y1, z1, x2, y2, z2: Extended): Extended; overload;
  function Vector3DCrossMultiply(const Vector1, Vector2: TVector3D): TVector3D; overload;
  function Vector3DCrossMultiply(const Vector: TVector3D; const x, y, z: Extended): TVector3D; overload;
  function Vector3DCrossMultiply(const x, y, z: Extended; const Vector: TVector3D): TVector3D; overload;
  function Vector3DCrossMultiply(const x1, y1, z1, x2, y2, z2: Extended): TVector3D; overload;
  function Vector3DNormalize(const Vector: TVector3D): TVector3D; overload;
  function Vector3DNormalize(const x, y, z: Extended): TVector3D; overload;

implementation

uses
  Matrix;

function Vector3DLength(const Vector: TVector3D): Extended;
begin
  Result:=Sqrt(Vector.x*Vector.x+Vector.y*Vector.y+Vector.z*Vector.z);
end;

function Vector3DLength(const x, y, z: Extended): Extended;
begin
  Result:=Sqrt(x*x+y*y+z*z);
end;

function Vector3DAdd(const Vector1, Vector2: TVector3D): TVector3D;
begin
  Result.x:=Vector1.x+Vector2.x;
  Result.y:=Vector1.y+Vector2.y;
  Result.z:=Vector1.z+Vector2.z;
end;

function Vector3DAdd(const Vector: TVector3D; const x, y, z: Extended): TVector3D; overload;
begin
  Result.x:=Vector.x+x;
  Result.y:=Vector.y+y;
  Result.z:=Vector.z+z;
end;

function Vector3DAdd(const x1, y1, z1, x2, y2, z2: Extended): TVector3D; overload;
begin
  Result.x:=x1+x2;
  Result.y:=y1+y2;
  Result.z:=z1+z2;
end;

function Vector3DSubtract(const Vector1, Vector2: TVector3D): TVector3D;
begin
  Result.x:=Vector1.x-Vector2.x;
  Result.y:=Vector1.y-Vector2.y;
  Result.z:=Vector1.z-Vector2.z;
end;

function Vector3DSubtract(const Vector: TVector3D; const x, y, z: Extended): TVector3D; overload;
begin
  Result.x:=Vector.x-x;
  Result.y:=Vector.y-y;
  Result.z:=Vector.z-z;
end;

function Vector3DSubtract(const x1, y1, z1, x2, y2, z2: Extended): TVector3D; overload;
begin
  Result.x:=x1-x2;
  Result.y:=y1-y2;
  Result.z:=z1-z2;
end;

function Vector3DScalarMultiply(const Vector1, Vector2: TVector3D): TVector3D;
begin
  Result.x:=Vector1.x*Vector1.x;
  Result.y:=Vector1.y*Vector1.y;
  Result.z:=Vector1.z*Vector1.z;
end;

function Vector3DScalarMultiply(const Vector: TVector3D; const s: Extended): TVector3D;
begin
  Result.x:=Vector.x*s;
  Result.y:=Vector.y*s;
  Result.z:=Vector.z*s;
end;

function Vector3DScalarMultiply(const x, y, z, s: Extended): TVector3D;
begin
  Result.x:=x*s;
  Result.y:=y*s;
  Result.z:=z*s;
end;

function Vector3DScalarMultiply(const Vector: TVector3D; const sx, sy, sz: Extended): TVector3D;
begin
  Result.x:=Vector.x*sx;
  Result.y:=Vector.y*sy;
  Result.z:=Vector.z*sz;
end;

function Vector3DScalarMultiply(const x, y, z, sx, sy, sz: Extended): TVector3D;
begin
  Result.x:=x*sx;
  Result.y:=y*sy;
  Result.z:=z*sz;
end;

function Vector3DScalarDivide(const Vector1, Vector2: TVector3D): TVector3D;
begin
  if Vector2.x<>0 then
    Result.x:=Vector1.x/Vector2.x
  else
    Result.x:=Vector1.x;
  if Vector2.x<>0 then
    Result.y:=Vector1.y/Vector2.y
  else
    Result.y:=Vector1.y;
  if Vector2.x<>0 then
    Result.z:=Vector1.z/Vector2.z
  else
    Result.z:=Vector1.z;
end;

function Vector3DScalarDivide(const Vector: TVector3D; const s: Extended): TVector3D;
begin
  if s<>0 then
  begin
    Result.x:=Vector.x/s;
    Result.y:=Vector.y/s;
    Result.z:=Vector.z/s;
  end
  else
    Result:=Vector;
end;

function Vector3DScalarDivide(const x, y, z, s: Extended): TVector3D;
begin
  if s<>0 then
  begin
    Result.x:=x/s;
    Result.y:=y/s;
    Result.z:=z/s;
  end
  else
  begin
    Result.x:=x;
    Result.y:=y;
    Result.z:=z;
  end;
end;

function Vector3DScalarDivide(const Vector: TVector3D; const sx, sy, sz: Extended): TVector3D;
begin
  if sx<>0 then
    Result.x:=Vector.x/sx
  else
    Result.x:=Vector.x;
  if sy<>0 then
    Result.y:=Vector.y/sy
  else
    Result.y:=Vector.y;
  if sz<>0 then
    Result.z:=Vector.z/sz
  else
    Result.z:=Vector.z;
end;

function Vector3DScalarDivide(const x, y, z, sx, sy, sz: Extended): TVector3D;
begin
  if sx<>0 then
    Result.x:=x/sx
  else
    Result.x:=x;
  if sy<>0 then
    Result.y:=y/sy
  else
    Result.y:=y;
  if sz<>0 then
    Result.z:=z/sz
  else
    Result.z:=z;
end;

function Vector3DDotMultiply(const Vector1, Vector2: TVector3D): Extended;
begin
  Result:=Vector1.x*Vector2.x+Vector1.y*Vector2.y+Vector1.z*Vector2.z;
end;

function Vector3DDotMultiply(const Vector: TVector3D; const x, y, z: Extended): Extended;
begin
  Result:=Vector.x*x+Vector.y*y+Vector.z*z;
end;

function Vector3DDotMultiply(const x1, y1, z1, x2, y2, z2: Extended): Extended;
begin
  Result:=x1*x2+y1*y2+z1*z2;
end;

function Vector3DCrossMultiply(const Vector1, Vector2: TVector3D): TVector3D;
begin
  Result.x:=Vector1.y*Vector2.z-Vector1.z*Vector2.y;
  Result.y:=Vector1.z*Vector2.x-Vector1.x*Vector2.z;
  Result.z:=Vector1.x*Vector2.y-Vector1.y*Vector2.x;
end;

function Vector3DCrossMultiply(const Vector: TVector3D; const x, y, z: Extended): TVector3D;
begin
  Result.x:=Vector.y*z-Vector.z*y;
  Result.y:=Vector.z*x-Vector.x*z;
  Result.z:=Vector.x*y-Vector.y*x;
end;

function Vector3DCrossMultiply(const x, y, z: Extended; const Vector: TVector3D): TVector3D;
begin
  Result.x:=y*Vector.z-z*Vector.y;
  Result.y:=z*Vector.x-x*Vector.z;
  Result.z:=x*Vector.y-y*Vector.x;
end;

function Vector3DCrossMultiply(const x1, y1, z1, x2, y2, z2: Extended): TVector3D;
begin
  Result.x:=y1*z2-z1*y2;
  Result.y:=z1*x2-x1*z2;
  Result.z:=x1*y2-y1*x2;
end;

function Vector3DNormalize(const Vector: TVector3D): TVector3D;
begin
  Result:=Vector3DScalarDivide(Vector,Vector3DLength(Vector));
end;

function Vector3DNormalize(const x, y, z: Extended): TVector3D;
begin
  Result:=Vector3DScalarDivide(x,y,z,Vector3DLength(x,y,z));
end;

end.


