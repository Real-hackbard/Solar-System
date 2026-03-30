unit TDComplex;

interface

uses
  TDObject, Matrix, Graphics, Windows, Vector3D, TDScene, TDCamera;

type
  TTDComplex=class(TTDObject)
    VertexCount, PlaneCount: Integer;
    Vertexes: array of TVertex;
    Planes: array of TPlane;
    constructor Create(Parent: TTDObject);
    destructor Destroy; override;
    procedure Project(var Vertex: TVertex);
    function IsVisible(Plane: Integer): Boolean;
    procedure ClearVertexes; virtual;
    procedure ClearPlanes; virtual;
    function AddVertex(const x, y, z: Extended): Integer; overload; virtual;
    function AddVertex(const Vector: TVector3D): Integer; overload; virtual;
    function AddPlane(const Vertexes: array of Integer;
      const PlaneColor, BorderColor: TColor): Integer; virtual;
    procedure Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix); override;
    procedure Copy(var TDComplex: TTDComplex); reintroduce;
    procedure LoadObject(const Filename, ObjectName: string);
  end;

implementation

uses
  IniFiles, Classes, SysUtils;

constructor TTDComplex.Create(Parent: TTDObject);
begin
  inherited;
  ClearVertexes;
  ClearPlanes;
end;

destructor TTDComplex.Destroy;
begin
  inherited;
end;

procedure TTDComplex.ClearPlanes;
begin
  PlaneCount:=0;
  SetLength(Planes,PlaneCount);
  Update;
end;

procedure TTDComplex.ClearVertexes;
begin
  VertexCount:=0;
  SetLength(Vertexes,VertexCount);
  Update;
end;

function TTDComplex.AddVertex(const x, y, z: Extended): Integer;
begin
  SetLength(Vertexes,VertexCount+1);
  Vertexes[VertexCount].Local.x:=x;
  Vertexes[VertexCount].Local.y:=y;
  Vertexes[VertexCount].Local.z:=z;
  Vertexes[VertexCount].Color:=clWhite;
  Result:=VertexCount;
  Inc(VertexCount);
  Update;
end;

function TTDComplex.AddVertex(const Vector: TVector3D): Integer;
begin
  SetLength(Vertexes,VertexCount+1);
  Vertexes[VertexCount].Local:=Vector;
  Vertexes[VertexCount].Color:=clWhite;
  Result:=VertexCount;
  Inc(VertexCount);
  Update;
end;

function TTDComplex.AddPlane(const Vertexes: array of Integer;
  const PlaneColor, BorderColor: TColor): Integer;
var
  z: Integer;
begin
  SetLength(Planes,PlaneCount+1);
  SetLength(Planes[PlaneCount].Vertexes,High(Vertexes)+1);
  for z:=0 to High(Vertexes) do
    Planes[PlaneCount].Vertexes[z]:=Vertexes[z];
  Planes[PlaneCount].PlaneColor:=PlaneColor;
  Planes[PlaneCount].BorderColor:=BorderColor;
  Result:=PlaneCount;
  Inc(PlaneCount);
  Update;
end;

procedure TTDComplex.Project(var Vertex: TVertex);
const
  FocalDist=512;
begin
  if Vertex.Aligned.z=0 then Vertex.Aligned.z:=1;
  Vertex.x:=Round(FocalDist*Vertex.Aligned.x/Vertex.Aligned.z);
  Vertex.y:=Round(FocalDist*Vertex.Aligned.y/Vertex.Aligned.z);
end;

function TTDComplex.IsVisible(Plane: Integer): Boolean;
var
  d, x1, x2, x3, y1, y2, y3, z1, z2, z3: Extended;
begin
  x1:=Vertexes[Planes[Plane].Vertexes[0]].Aligned.x;
  x2:=Vertexes[Planes[Plane].Vertexes[1]].Aligned.x;
  x3:=Vertexes[Planes[Plane].Vertexes[2]].Aligned.x;
  y1:=Vertexes[Planes[Plane].Vertexes[0]].Aligned.y;
  y2:=Vertexes[Planes[Plane].Vertexes[1]].Aligned.y;
  y3:=Vertexes[Planes[Plane].Vertexes[2]].Aligned.y;
  z1:=Vertexes[Planes[Plane].Vertexes[0]].Aligned.z;
  z2:=Vertexes[Planes[Plane].Vertexes[1]].Aligned.z;
  z3:=Vertexes[Planes[Plane].Vertexes[2]].Aligned.z;
  d:=-x1*(y2*z3-y3*z2)-x2*(y3*z1-y1*z3)-x3*(y1*z2-y2*z1);
  Result:=d>0;
end;

procedure TTDComplex.Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix);
var
  z, x, mx, my: Integer;
  CurParent: TTDObject;
  Polygon: Integer;
begin
  inherited;
  mx:=(Canvas.ClipRect.Right-Canvas.ClipRect.Left) div 2;
  my:=(Canvas.ClipRect.Bottom-Canvas.ClipRect.Top) div 2;
  for z:=0 to VertexCount-1 do
  begin
    Vertexes[z].World:=VectorMatrixMultiply(Vertexes[z].Local,Position);
    CurParent:=Parent;
    while (CurParent<>nil) and (CurParent is TTDObject) do
    begin
      Vertexes[z].World:=VectorMatrixMultiply(Vertexes[z].World,TTDComplex(CurParent).Position);
      CurParent:=CurParent.Parent;
    end;
    Vertexes[z].Aligned:=VectorMatrixMultiply(Vertexes[z].World,Camera);
    Project(Vertexes[z]);
  end;
  for z:=0 to PlaneCount-1 do
  begin
    if IsVisible(z) then
    begin
      Polygon:=Length(Polygons);
      SetLength(Polygons,Polygon+1);
      SetLength(Polygons[Polygon].Points,Length(Planes[z].Vertexes));
      Polygons[Polygon].BorderColor:=Planes[z].BorderColor;
      Polygons[Polygon].PlaneColor:=Planes[z].PlaneColor;
      Polygons[Polygon].Position.x:=0;
      Polygons[Polygon].Position.y:=0;
      Polygons[Polygon].Position.z:=0;
      Polygons[Polygon].ZOrder:=0;
      for x:=0 to Length(Planes[z].Vertexes)-1 do
      begin
        Polygons[Polygon].Points[x].x:=mx+Vertexes[Planes[z].Vertexes[x]].x;
        Polygons[Polygon].Points[x].y:=my-Vertexes[Planes[z].Vertexes[x]].y;
        Polygons[Polygon].Position.x:=Polygons[Polygon].Position.x
          +Vertexes[Planes[z].Vertexes[x]].World.x;
        Polygons[Polygon].Position.y:=Polygons[Polygon].Position.y
          +Vertexes[Planes[z].Vertexes[x]].World.y;
        Polygons[Polygon].Position.z:=Polygons[Polygon].Position.z
          +Vertexes[Planes[z].Vertexes[x]].World.z;
        Polygons[Polygon].ZOrder:=Polygons[Polygon].ZOrder
          +Vertexes[Planes[z].Vertexes[x]].Aligned.z;
      end;
      Polygons[Polygon].Position.x:=Polygons[Polygon].Position.x
        /Length(Planes[z].Vertexes);
      Polygons[Polygon].Position.y:=Polygons[Polygon].Position.y
        /Length(Planes[z].Vertexes);
      Polygons[Polygon].Position.z:=Polygons[Polygon].Position.z
        /Length(Planes[z].Vertexes);
      Polygons[Polygon].ZOrder:=Polygons[Polygon].ZOrder
        /Length(Planes[z].Vertexes);
      Polygons[Polygon].PlaneNormal:=Vector3DNormalize(Vector3DCrossMultiply(
        Vector3DSubtract(Vertexes[Planes[z].Vertexes[1]].World,Vertexes[Planes[z].Vertexes[0]].World),
        Vector3DSubtract(Vertexes[Planes[z].Vertexes[2]].World,Vertexes[Planes[z].Vertexes[0]].World)));
    end;
  end;
end;

procedure TTDComplex.Copy(var TDComplex: TTDComplex);
var
  z: Integer;
begin
  TDComplex.Position:=Position;
  TDComplex.VertexCount:=VertexCount;
  TDComplex.PlaneCount:=PlaneCount;
  SetLength(TDComplex.Vertexes,VertexCount);
  for z:=0 to VertexCount-1 do
    TDComplex.Vertexes[z]:=Vertexes[z];
  SetLength(TDComplex.Planes,PlaneCount);
  for z:=0 to PlaneCount-1 do
    TDComplex.Planes[z]:=Planes[z];
end;

procedure Implode(const Line, Separator: string; Strings: TStrings);
var
  p: Integer;
  Temp: string;
begin
  Temp:=Line;
  Strings.Clear;
  p:=Pos(Separator,Temp);
  while p>0 do
  begin
    Strings.Add(Copy(Temp,1,p-1));
    Delete(Temp,1,p);
    p:=Pos(Separator,Temp);
  end;
  Strings.Add(Temp);
end;

procedure TTDComplex.LoadObject(const Filename, ObjectName: string);
var
  TDO: TIniFile;
  VertexSection, PlaneSection: string;
  Vertexes, Planes: TStringList;
  z, y: Integer;
  Line: string;
  Fields: TStringList;
  Plane: array of Integer;
begin
  TDO:=TIniFile.Create(Filename);
  Vertexes:=TStringList.Create;
  Planes:=TStringList.Create;
  Fields:=TStringList.Create;
  try
    VertexSection:=TDO.ReadString('ObjectName','Vertexes','Vertexes');
    PlaneSection:=TDO.ReadString('ObjectName','Planes','Planes');
    TDO.ReadSection(VertexSection,Vertexes);
    for z:=0 to Vertexes.Count-1 do
    begin
      Line:=TDO.ReadString(VertexSection,Vertexes[z],'0,0,0');
      Implode(Line,' ',Fields);
      AddVertex(StrToFloat(Fields[0]),StrToFloat(Fields[1]),
        StrToFloat(Fields[2]));
    end;
    TDO.ReadSection(PlaneSection,Planes);
    for z:=0 to Planes.Count-1 do
    begin
      Line:=TDO.ReadString(PlaneSection,Planes[z],'');
      Implode(Line,' ',Fields);
      SetLength(Plane,Fields.Count-1);
      for y:=0 to Fields.Count-2 do
        Plane[y]:=Vertexes.IndexOf(Fields[y]);
      AddPlane(Plane,StrToInt(Fields[Fields.Count-1]),StrToInt(Fields[Fields.Count-1]));
    end;
  finally
    Vertexes.Free;
    Planes.Free;
    Fields.Free;
    TDO.Free;
  end;
end;

end.
