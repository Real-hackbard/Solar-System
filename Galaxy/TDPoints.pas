unit TDPoints;

interface

uses
  TDObject, Matrix, Graphics, Windows, Vector3D, TDScene, TDCamera;

type
  TTDPoints=class(TTDObject)
    VertexCount: Integer;
    Vertexes: array of TVertex;
    constructor Create(Parent: TTDObject);
    destructor Destroy; override;
    procedure Project(var Vertex: TVertex);
    procedure ClearVertexes; virtual;
    function AddVertex(const x, y, z: Extended): Integer; overload; virtual;
    function AddVertex(const Vector: TVector3D): Integer; overload; virtual;
    procedure Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix); override;
  end;

implementation

constructor TTDPoints.Create(Parent: TTDObject);
begin
  inherited;
  ClearVertexes;
end;

destructor TTDPoints.Destroy;
begin
  ClearVertexes;
  inherited;
end;

procedure TTDPoints.ClearVertexes;
begin
  VertexCount:=0;
  SetLength(Vertexes,VertexCount);
end;

function TTDPoints.AddVertex(const x, y, z: Extended): Integer;
begin
  SetLength(Vertexes,VertexCount+1);
  Vertexes[VertexCount].Local.x:=x;
  Vertexes[VertexCount].Local.y:=y;
  Vertexes[VertexCount].Local.z:=z;
  Vertexes[VertexCount].Color:=clWhite;
  Result:=VertexCount;
  Inc(VertexCount);
end;

function TTDPoints.AddVertex(const Vector: TVector3D): Integer;
begin
  SetLength(Vertexes,VertexCount+1);
  Vertexes[VertexCount].Local:=Vector;
  Vertexes[VertexCount].Color:=clWhite;
  Result:=VertexCount;
  Inc(VertexCount);
end;

procedure TTDPoints.Project(var Vertex: TVertex);
const
  FocalDist=512;
begin
  if Vertex.Aligned.z=0 then Vertex.Aligned.z:=1;
  Vertex.x:=Round(FocalDist*Vertex.Aligned.x/Vertex.Aligned.z);
  Vertex.y:=Round(FocalDist*Vertex.Aligned.y/Vertex.Aligned.z);
end;

procedure TTDPoints.Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix);
var
  z, mx, my: Integer;
  CurParent: TTDObject;
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
    Project(Vertexes[z]);
    if Vertexes[z].Aligned.z>0 then
      Canvas.Pixels[mx+Vertexes[z].x,my+Vertexes[z].y]:=Vertexes[z].Color;
  end;
end;

end.
