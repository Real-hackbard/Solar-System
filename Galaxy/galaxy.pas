unit Galaxy;

interface

uses
  TDScene, TDPoints, TDCamera, Vector3D, Matrix, Graphics, TDObject,
  TDLight;

type
  TStars=class(TTDPoints)
    Home: Integer;
    Selected: Integer;
    procedure Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix); override;
  end;

  TGalaxy=class
    Distance: Extended;
    Scene: TTDScene;
    Stars: TStars;
    Camera: TTDCamera;
    constructor Create;
    destructor Destroy; override;
    procedure Init(const Seed: Longint);
    procedure Render(const Canvas: TCanvas);
    procedure Rotate(const x, y: Extended);
    procedure Zoom(const z: Extended);
  end;

implementation

constructor TGalaxy.Create;
begin
  Scene:=TTDScene.Create;
  Stars:=TStars.Create(Scene);
  Stars.Home:=0;
  Stars.Selected:=1;
  Camera:=TTDCamera.Create(Scene);
  Distance:=5000000000;
  Camera.Move(0,0,-Distance);
end;

destructor TGalaxy.Destroy;
begin
  Camera.Free;
  Stars.Free;
  Scene.Free;
end;

procedure TGalaxy.Init(const Seed: Integer);
var
  z: Integer;
  Vector: TVector3D;
  Matrix: TMatrix;
  MaxStars: Integer;
begin
  RandSeed:=Seed;
  MaxStars:=5000+Random(10000);
  Stars.ClearVertexes;
  Matrix:=IdentityMatrix;
  for z:=0 to MaxStars-1 do
  begin
    Vector.x:=0;
    vector.y:=0;
    Vector.z:=Sqr(Random(32767));
    Matrix:=MatrixRotate(Matrix,Random,Random,Random);
    Vector:=VectorMatrixMultiply(Vector,Matrix);
    Stars.AddVertex(Vector);
  end;
end;

procedure TGalaxy.Render(const Canvas: TCanvas);
begin
  Scene.Render(Canvas,Camera);
end;

procedure Rotate(const x, y: Extended);
begin
end;

procedure TGalaxy.Rotate(const x, y: Extended);
begin
  Stars.Rotate(x,y,0);
end;

procedure TGalaxy.Zoom(const z: Extended);
begin
  Camera.Move(0,0,Distance);
  if z>0 then
    Distance:=Distance*1.1
  else if z<0 then
    if Distance>1 then
    Distance:=Distance/1.1;
  Camera.Move(0,0,-Distance);
end;

function GetLight(const Color: TColor; const Illumination: TIllumination): TColor;
var
  Red, Green, Blue: Integer;
begin
  Blue:=((Color shr 16) and 255)*Illumination.Blue div 100;
  Green:=((Color shr 8) and 255)*Illumination.Green div 100;
  Red:=(Color and 255)*Illumination.Red div 100;
  Result:=(Color and $7f000000) or (Blue shl 16) or (Green shl 8) or Red;
end;

procedure DrawSelectionBox(Canvas: TCanvas; x, y: Integer; Color: TColor);
begin
  Canvas.Pen.Color:=Color;
  Canvas.MoveTo(x-2,y-2);
  Canvas.LineTo(x-3,y-2);
  Canvas.LineTo(x-3,y+2);
  Canvas.LineTo(x-1,y+2);
  Canvas.MoveTo(x+2,y-2);
  Canvas.LineTo(x+3,y-2);
  Canvas.LineTo(x+3,y+2);
  Canvas.LineTo(x+1,y+2);
end;

procedure TStars.Render(const Canvas: TCanvas; var Polygons: TPolygons;
  const Camera: TMatrix);
var
  z, mx, my: Integer;
  CurParent: TTDObject;
  Nearest, Farest, Range: Extended;
  Illumination: TIllumination;
begin
  mx:=(Canvas.ClipRect.Right-Canvas.ClipRect.Left) div 2;
  my:=(Canvas.ClipRect.Bottom-Canvas.ClipRect.Top) div 2;
  Nearest:=-1;
  Farest:=-1;
  for z:=0 to VertexCount-1 do
  begin
    Vertexes[z].World:=VectorMatrixMultiply(Vertexes[z].Local,Position);
    CurParent:=Parent;
    while (CurParent<>nil) and (CurParent is TTDObject) do
    begin
      Vertexes[z].World:=VectorMatrixMultiply(Vertexes[z].World,TTDObject(CurParent).Position);
      CurParent:=CurParent.Parent;
    end;
    Vertexes[z].Aligned:=VectorMatrixMultiply(Vertexes[z].World,Camera);
    Project(Vertexes[z]);
    if Vertexes[z].Aligned.z>0 then
    begin
      if (Vertexes[z].Aligned.z<Nearest) or (Nearest=-1) then
        Nearest:=Vertexes[z].Aligned.z;
      if (Vertexes[z].Aligned.z>Farest) or (Farest=-1) then
        Farest:=Vertexes[z].Aligned.z;
    end;
  end;
  Range:=Farest-Nearest;
  for z:=0 to VertexCount-1 do
  begin
    if Vertexes[z].Aligned.z>0 then
    begin
      Illumination.Red:=100-Round((Vertexes[z].Aligned.z-Nearest)*100/Range);
      Illumination.Green:=Illumination.Red;
      Illumination.Blue:=Illumination.Red;
      Canvas.Pixels[mx+Vertexes[z].x,my-Vertexes[z].y]:=GetLight(Vertexes[z].Color,Illumination);
    end;
  end;
  if Vertexes[Home].Aligned.z>0 then
    DrawSelectionBox(Canvas,mx+Vertexes[Home].x,my-Vertexes[Home].y,clGreen);
  if Vertexes[Selected].Aligned.z>0 then
    DrawSelectionBox(Canvas,mx+Vertexes[Selected].x,my-Vertexes[Selected].y,clRed);
  if (Vertexes[Home].Aligned.z>0) and (Vertexes[Selected].Aligned.z>0) then
  begin
    Canvas.Pen.Color:=clRed;
    Canvas.MoveTo(mx+Vertexes[Home].x,my-Vertexes[Home].y);
    Canvas.LineTo(mx+Vertexes[Selected].x,my-Vertexes[Selected].y);
  end;
end;

end.
