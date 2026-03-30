unit Matrix;

interface

uses
  Vector3D;

type
  TMatrix=array [0..3,0..3] of Extended;

const
  IdentityMatrix: TMatrix=((1,0,0,0),(0,1,0,0),(0,0,1,0),(0,0,0,1));

function VectorMatrixMultiply(const Vector: TVector3D; const Matrix: TMatrix): TVector3D;
function MatrixMultiply(const Matrix1, Matrix2: TMatrix): TMatrix;
function MatrixTranslate(const Matrix: TMatrix; tx, ty, tz: Extended): TMatrix;
function MatrixScale(const Matrix: TMatrix; sx, sy, sz: Extended): TMatrix;
function MatrixRotate(const Matrix: TMatrix; const ax, ay, az: Extended): TMatrix;
function Adjoint(const Matrix: TMatrix): TMatrix;
function MatrixInvert(const Matrix: TMatrix): TMatrix;

implementation

function VectorMatrixMultiply(const Vector: TVector3D; const Matrix: TMatrix): TVector3D;
begin
  Result.x:=Matrix[3,0]+
    Vector.x*Matrix[0,0]+
    Vector.y*Matrix[1,0]+
    Vector.z*Matrix[2,0];
  Result.y:=Matrix[3,1]+
    Vector.x*Matrix[0,1]+
    Vector.y*Matrix[1,1]+
    Vector.z*Matrix[2,1];
  Result.z:=Matrix[3,2]+
    Vector.x*Matrix[0,2]+
    Vector.y*Matrix[1,2]+
    Vector.z*Matrix[2,2];
end;

function MatrixMultiply(const Matrix1, Matrix2: TMatrix): TMatrix;
var
  i, j: Integer;
begin
  for i:=0 to 3 do
  begin
    for j:=0 to 3 do
    begin
      Result[i,j]:=
        Matrix1[i,0]*Matrix2[0,j]+
        Matrix1[i,1]*Matrix2[1,j]+
        Matrix1[i,2]*Matrix2[2,j]+
        Matrix1[i,3]*Matrix2[3,j];
    end;
  end;
end;

function MatrixTranslate(const Matrix: TMatrix; tx, ty, tz: Extended): TMatrix;
var
  Matrix2: TMatrix;
begin
  Matrix2[0,0]:=1; Matrix2[0,1]:=0; Matrix2[0,2]:=0; Matrix2[0,3]:=0;
  Matrix2[1,0]:=0; Matrix2[1,1]:=1; Matrix2[1,2]:=0; Matrix2[1,3]:=0;
  Matrix2[2,0]:=0; Matrix2[2,1]:=0; Matrix2[2,2]:=1; Matrix2[2,3]:=0;
  Matrix2[3,0]:=tx; Matrix2[3,1]:=ty; Matrix2[3,2]:=tz; Matrix2[3,3]:=1;
  Result:=MatrixMultiply(Matrix,Matrix2);
end;

function MatrixScale(const Matrix: TMatrix; sx, sy, sz: Extended): TMatrix;
var
  Matrix2: TMatrix;
begin
  Matrix2[0,0]:=sx; Matrix2[0,1]:=0; Matrix2[0,2]:=0; Matrix2[0,3]:=0;
  Matrix2[1,0]:=0; Matrix2[1,1]:=sy; Matrix2[1,2]:=0; Matrix2[1,3]:=0;
  Matrix2[2,0]:=0; Matrix2[2,1]:=0; Matrix2[2,2]:=sz; Matrix2[2,3]:=0;
  Matrix2[3,0]:=0; Matrix2[3,1]:=0; Matrix2[3,2]:=0; Matrix2[3,3]:=1;
  Result:=MatrixMultiply(Matrix,Matrix2);
end;

function MatrixRotate(const Matrix: TMatrix; const ax, ay, az: Extended): TMatrix;
var
  Matrix2: TMatrix;
begin
  Matrix2[0,0]:=cos(ay); Matrix2[0,1]:=0; Matrix2[0,2]:=-sin(ay); Matrix2[0,3]:=0;
  Matrix2[1,0]:=0;       Matrix2[1,1]:=1; Matrix2[1,2]:=0;        Matrix2[1,3]:=0;
  Matrix2[2,0]:=sin(ay); Matrix2[2,1]:=0; Matrix2[2,2]:=cos(ay);  Matrix2[2,3]:=0;
  Matrix2[3,0]:=0;       Matrix2[3,1]:=0; Matrix2[3,2]:=0;        Matrix2[3,3]:=1;
  Result:=MatrixMultiply(Matrix,Matrix2);
  Matrix2[0,0]:=1; Matrix2[0,1]:=0;        Matrix2[0,2]:=0;       Matrix2[0,3]:=0;
  Matrix2[1,0]:=0; Matrix2[1,1]:=cos(ax);  Matrix2[1,2]:=sin(ax); Matrix2[1,3]:=0;
  Matrix2[2,0]:=0; Matrix2[2,1]:=-sin(ax); Matrix2[2,2]:=cos(ax); Matrix2[2,3]:=0;
  Matrix2[3,0]:=0; Matrix2[3,1]:=0;        Matrix2[3,2]:=0;       Matrix2[3,3]:=1;
  Result:=MatrixMultiply(Result,Matrix2);
  Matrix2[0,0]:=cos(az);  Matrix2[0,1]:=sin(az); Matrix2[0,2]:=0; Matrix2[0,3]:=0;
  Matrix2[1,0]:=-sin(az); Matrix2[1,1]:=cos(az); Matrix2[1,2]:=0; Matrix2[1,3]:=0;
  Matrix2[2,0]:=0;        Matrix2[2,1]:=0;       Matrix2[2,2]:=1; Matrix2[2,3]:=0;
  Matrix2[3,0]:=0;        Matrix2[3,1]:=0;       Matrix2[3,2]:=0; Matrix2[3,3]:=1;
  Result:=MatrixMultiply(Result,Matrix2);
end;

function Determinate2(const a, b, c, d: Extended): Extended;
begin
  Result:=a*d-b*c;
end;

function Determinate3(const a1, a2, a3, b1, b2, b3, c1, c2, c3: Extended): Extended;
begin
  Result:=a1*Determinate2(b2,b3,c2,c3)
    -b1*Determinate2(a2,a3,c2,c3)
    +c1*Determinate2(a2,a3,b2,b3);
end;

function Determinate(const Matrix: TMatrix) : Extended;
var
  a1, b1, c1, d1: Extended;
  a2, b2, c2, d2: Extended;
  a3, b3, c3, d3: Extended;
  a4, b4, c4, d4: Extended;
begin
  a1:=Matrix[0,0]; a2:=Matrix[1,0]; a3:=Matrix[2,0]; a4:=Matrix[3,0];
  b1:=Matrix[0,1]; b2:=Matrix[1,1]; b3:=Matrix[2,1]; b4:=Matrix[3,1];
  c1:=Matrix[0,2]; c2:=Matrix[1,2]; c3:=Matrix[2,2]; c4:=Matrix[3,2];
  d1:=Matrix[0,3]; d2:=Matrix[1,3]; d3:=Matrix[2,3]; d4:=Matrix[3,3];
  Result:=a1*Determinate3(b2,b3,b4,c2,c3,c4,d2,d3,d4)
    -b1*Determinate3(a2,a3,a4,c2,c3,c4,d2,d3,d4)
    +c1*Determinate3(a2,a3,a4,b2,b3,b4,d2,d3,d4)
    -d1*Determinate3(a2,a3,a4,b2,b3,b4,c2,c3,c4);
end;

function Adjoint(const Matrix: TMatrix): TMatrix;
var
  a1, b1, c1, d1: Extended;
  a2, b2, c2, d2: Extended;
  a3, b3, c3, d3: Extended;
  a4, b4, c4, d4: Extended;
begin
  a1:=Matrix[0,0]; a2:=Matrix[0,1]; a3:=Matrix[0,2]; a4:=Matrix[0,3];
  b1:=Matrix[1,0]; b2:=Matrix[1,1]; b3:=Matrix[1,2]; b4:=Matrix[1,3];
  c1:=Matrix[2,0]; c2:=Matrix[2,1]; c3:=Matrix[2,2]; c4:=Matrix[2,3];
  d1:=Matrix[3,0]; d2:=Matrix[3,1]; d3:=Matrix[3,2]; d4:=Matrix[3,3];
  Result[0,0]:=Determinate3(b2,b3,b4,c2,c3,c4,d2,d3,d4);
  Result[0,1]:=-Determinate3(a2,a3,a4,c2,c3,c4,d2,d3,d4);
  Result[0,2]:=Determinate3(a2,a3,a4,b2,b3,b4,d2,d3,d4);
  Result[0,3]:=-Determinate3(a2,a3,a4,b2,b3,b4,c2,c3,c4);

  Result[1,0]:=-Determinate3(b1,b3,b4,c1,c3,c4,d1,d3,d4);
  Result[1,1]:=Determinate3(a1,a3,a4,c1,c3,c4,d1,d3,d4);
  Result[1,2]:=-Determinate3(a1,a3,a4,b1,b3,b4,d1,d3,d4);
  Result[1,3]:=Determinate3(a1,a3,a4,b1,b3,b4,c1,c3,c4);

  Result[2,0]:=Determinate3(b1,b2,b4,c1,c2,c4,d1,d2,d4);
  Result[2,1]:=-Determinate3(a1,a2,a4,c1,c2,c4,d1,d2,d4);
  Result[2,2]:=Determinate3(a1,a2,a4,b1,b2,b4,d1,d2,d4);
  Result[2,3]:=-Determinate3(a1,a2,a4,b1,b2,b4,c1,c2,c4);

  Result[3,0]:=-Determinate3(b1,b2,b3,c1,c2,c3,d1,d2,d3);
  Result[3,1]:=Determinate3(a1,a2,a3,c1,c2,c3,d1,d2,d3);
  Result[3,2]:=-Determinate3(a1,a2,a3,b1,b2,b3,d1,d2,d3);
  Result[3,3]:=Determinate3(a1,a2,a3,b1,b2,b3,c1,c2,c3);
end;

function MatrixInvert(const Matrix: TMatrix): TMatrix;
var
  Determinant: Extended;
  x, y: Integer;
begin
  Result:=Adjoint(Matrix);
  Determinant:=Determinate(Matrix);
  if Determinant=0 then Determinant:=1;
  for x:=0 to 3 do
  begin
    for y:=0 to 3 do
    begin
      Result[x,y]:=Result[x,y]/Determinant;
    end;
  end;
end;

end.
