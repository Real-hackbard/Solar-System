unit TDObject;

interface

uses
  Graphics, Classes, Vector3D, Matrix, Windows;

const
  ZClipLine=1;

type
  TVertex=record
    Local, World, Aligned: TVector3D;
    x, y: Integer;
    Color: TColor;
  end;

  TLine=record
    Vertexes: array [0..1] of Integer;
    Color: TColor;
  end;

  TPlane=record
    Vertexes: array of Integer;
    PlaneColor, BorderColor: TColor;
  end;

  TPolygon=record
    Points: array of TPoint;
    BorderColor, PlaneColor: TColor;
    PlaneNormal, Position: TVector3D;
    ZOrder: Extended;
  end;

  TPolygons=array of TPolygon;

  TTDObject=class(TObject)
    Changed: Boolean;
    TDObjects: TList;
    Parent: TTDObject;
    Position: TMatrix;
    procedure Update;
    procedure Add(TDObject: TTDObject);
    procedure Delete(TDObject: TTDObject);
    constructor Create(Parent: TTDObject);
    destructor Destroy; override;
    function ZClip(var Vector1, Vector2: TVector3D): Boolean;
    procedure Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix); virtual;
    procedure Copy(var TDObject: TTDObject); virtual; abstract;
    procedure Move(const tx, ty, tz: Extended); virtual;
    procedure Rotate(const rx, ry, rz: Extended); virtual;
    procedure MoveRelative(const tx, ty, tz: Extended); virtual;
    procedure RotateRelative(const rx, ry, rz: Extended); virtual;
  end;

implementation

uses
  TDScene;

constructor TTDObject.Create(Parent: TTDObject);
begin
  inherited Create;
  Changed:=False;
  Self.Parent:=Parent;
  TDObjects:=TList.Create;
  Position:=IdentityMatrix;
  if Parent<>nil then Parent.Add(Self);
end;

destructor TTDObject.Destroy;
begin
  if Parent<>nil then Parent.Delete(Self);
  TDObjects.Free;
  Parent:=nil;
  inherited;
end;

procedure TTDObject.Add(TDObject: TTDObject);
begin
  TDObjects.Add(TDObject);
  Update;
end;

procedure TTDObject.Delete(TDObject: TTDObject);
begin
  TDObjects.Remove(TDObject);
  Update;
end;

procedure TTDObject.Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix);
var
  z: Integer;
begin
  for z:=0 to TDObjects.Count-1 do
    TTDObject(TDObjects[z]).Render(Canvas,Polygons,Camera);
end;

procedure TTDObject.Move(const tx, ty, tz: Extended);
begin
  Position:=MatrixTranslate(Position,tx,ty,tz);
  Update;
end;

procedure TTDObject.Rotate(const rx, ry, rz: Extended);
var
  tx, ty, tz: Extended;
begin
  tx:=Position[3,0];
  ty:=Position[3,1];
  tz:=Position[3,2];
  Position[3,0]:=0;
  Position[3,1]:=0;
  Position[3,2]:=0;
  Position:=MatrixRotate(Position,rx,ry,rz);
  Position:=MatrixTranslate(Position,tx,ty,tz);
  Update;
end;

procedure TTDObject.MoveRelative(const tx, ty, tz: Extended);
var
  Vector: TVector3D;
  Matrix: TMatrix;
begin
  Vector.x:=tx;
  Vector.y:=ty;
  Vector.z:=tz;
  Matrix:=Position;
  Matrix[3,0]:=0;
  Matrix[3,1]:=0;
  Matrix[3,2]:=0;
  Vector:=VectorMatrixMultiply(Vector,Matrix);
  Position:=MatrixTranslate(Position,Vector.x,Vector.y,Vector.z);
  Update;
end;

procedure TTDObject.RotateRelative(const rx, ry, rz: Extended);
var
  tx, ty, tz: Extended;
  Matrix, OldPosition: TMatrix;
begin
  tx:=Position[3,0];
  ty:=Position[3,1];
  tz:=Position[3,2];
  Position[3,0]:=0;
  Position[3,1]:=0;
  Position[3,2]:=0;
  OldPosition:=Position;
  Matrix:=IdentityMatrix;
  Position:=MatrixRotate(Matrix,rx,ry,rz);
  Position:=MatrixMultiply(Position,OldPosition);
  Position:=MatrixTranslate(Position,tx,ty,tz);
  Update;
end;

procedure TTDObject.Update;
begin
  Changed:=True;
  if Assigned(Parent) then Parent.Changed:=True;
end;

function TTDObject.ZClip(var Vector1, Vector2: TVector3D): Boolean;
var
  NewVector: TVector3D;
begin
  if (Vector1.z>=ZClipLine) or (Vector2.z>=ZClipLine) then
  begin
    if Vector2.z<ZClipLine then
    begin
      NewVector.x:=Vector1.x-(Vector1.z-ZClipLine)/(Vector1.z-Vector2.z)*(Vector1.x-Vector2.x);
      NewVector.y:=Vector1.y-(Vector1.z-ZClipLine)/(Vector1.z-Vector2.z)*(Vector1.y-Vector2.y);
      NewVector.z:=ZClipLine;
      Vector2:=NewVector;
      Result:=True;
    end
    else if Vector1.z<ZClipLine then
    begin
      NewVector.x:=Vector2.x-(Vector2.z-ZClipLine)/(Vector2.z-Vector1.z)*(Vector2.x-Vector1.x);
      NewVector.y:=Vector2.y-(Vector2.z-ZClipLine)/(Vector2.z-Vector1.z)*(Vector2.y-Vector1.y);
      NewVector.z:=ZClipLine;
      Vector1:=NewVector;
      Result:=True;
    end
    else
      Result:=True;
  end
  else
    Result:=False;
end;

end.
