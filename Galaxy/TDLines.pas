unit TDLines;

interface

uses
  TDObject, Matrix, Graphics, Windows, Vector3D, TDScene, TDCamera;

type
  TTDLines=class(TTDObject)
    VertexCount, LineCount: Integer;
    Vertexes: array of TVertex;
    Lines: array of TLine;
    constructor Create(Parent: TTDObject);
    destructor Destroy; override;
    procedure Project(var Vertex: TVertex);
    procedure ClearVertexes; virtual;
    procedure ClearLines; virtual;
    function AddVertex(const x, y, z: Extended): Integer; overload; virtual;
    function AddVertex(const Vector: TVector3D): Integer; overload; virtual;
    function AddLine(const v1, v2: Integer; const Color: TColor): Integer; overload; virtual;
//    function ZClip(var Vector1, Vector2: TVector3D): Boolean;
    procedure Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix); override;
  end;

implementation

constructor TTDLines.Create(Parent: TTDObject);
begin
  inherited;
  ClearVertexes;
  ClearLines;
end;

destructor TTDLines.Destroy;
begin
  ClearVertexes;
  ClearLines;
  inherited;
end;

procedure TTDLines.ClearVertexes;
begin
  VertexCount:=0;
  SetLength(Vertexes,VertexCount);
end;

procedure TTDLines.ClearLines;
begin
  LineCount:=0;
  SetLength(Lines,LineCount);
end;

function TTDLines.AddVertex(const x, y, z: Extended): Integer;
begin
  SetLength(Vertexes,VertexCount+1);
  Vertexes[VertexCount].Local.x:=x;
  Vertexes[VertexCount].Local.y:=y;
  Vertexes[VertexCount].Local.z:=z;
  Vertexes[VertexCount].Color:=clWhite;
  Result:=VertexCount;
  Inc(VertexCount);
end;

function TTDLines.AddVertex(const Vector: TVector3D): Integer;
begin
  SetLength(Vertexes,VertexCount+1);
  Vertexes[VertexCount].Local:=Vector;
  Vertexes[VertexCount].Color:=clWhite;
  Result:=VertexCount;
  Inc(VertexCount);
end;

function TTDLines.AddLine(const v1, v2: Integer; const Color: TColor): Integer;
begin
  SetLength(Lines,LineCount+1);
  Lines[LineCount].Vertexes[0]:=v1;
  Lines[LineCount].Vertexes[1]:=v2;
  Lines[LineCount].Color:=Color;
  Result:=LineCount;
  Inc(LineCount);
end;

procedure TTDLines.Project(var Vertex: TVertex);
const
  FocalDist=512;
var
  x, y: Extended;
begin
  if Vertex.Aligned.z=0 then Vertex.Aligned.z:=1;
  x:=FocalDist*Vertex.Aligned.x/Vertex.Aligned.z;
  y:=FocalDist*Vertex.Aligned.y/Vertex.Aligned.z;
  if x<-32767 then
    Vertex.x:=-32767
  else if x>32767 then
    Vertex.x:=32767
  else
    Vertex.x:=Round(x);
  if y<-32767 then
    Vertex.y:=-32767
  else if y>32767 then
    Vertex.y:=32767
  else
    Vertex.y:=Round(y);
end;

procedure TTDLines.Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix);
var
  z, mx, my: Integer;
  CurParent: TTDObject;
  v1, v2: TVertex;
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
      Vertexes[z].World:=VectorMatrixMultiply(Vertexes[z].World,TTDObject(CurParent).Position);
      CurParent:=CurParent.Parent;
    end;
    Vertexes[z].Aligned:=VectorMatrixMultiply(Vertexes[z].World,Camera);
  end;
  for z:=0 to LineCount-1 do
  begin
    v1:=Vertexes[Lines[z].Vertexes[0]];
    v2:=Vertexes[Lines[z].Vertexes[1]];
    if ZClip(v1.Aligned,v2.Aligned) then
    begin
      Project(v1);
      Project(v2);
      Canvas.Pen.Color:=Lines[z].Color;
      Canvas.MoveTo(mx+v1.x,my-v1.y);
      Canvas.LineTo(mx+v2.x,my-v2.y);
    end;
  end;
end;

end.
