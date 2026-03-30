unit TDStarField;

interface

uses
  TDObject, Graphics, TDCamera, Matrix;

type
  TTDStarField=class(TTDObject)
  protected
    Stars: array of TVertex;
    procedure Project(var Vertex: TVertex);
  public
    constructor Create(Parent: TTDObject);
    destructor Destroy; override;
    procedure Init(MaxStars: Integer);
    procedure Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix); override;
  end;


implementation

constructor TTDStarField.Create(Parent: TTDObject);
begin
  inherited;
  SetLength(Stars,0);
end;

destructor TTDStarField.Destroy;
begin
  inherited;
end;

procedure TTDStarField.Init(MaxStars: Integer);
const
  MinLight=32;
  MaxLight=255;
var
  z, Light: Integer;
  Matrix: TMatrix;
begin
  Matrix:=IdentityMatrix;
  SetLength(Stars,MaxStars);
  for z:=0 to MaxStars-1 do
  begin
    Stars[z].Local.x:=0;
    Stars[z].Local.y:=0;
    Stars[z].Local.z:=255;
    Light:=MinLight+Random(MaxLight-MinLight);
    Stars[z].Color:=Light shl 8+Light shl 16+Light;
    Matrix:=MatrixRotate(Matrix,Random,Random,Random);
    Stars[z].Local:=VectorMatrixMultiply(Stars[z].Local,Matrix);
  end;
  Update;
end;

procedure TTDStarField.Project(var Vertex: TVertex);
const
  FocalDist=512;
begin
  if Vertex.Aligned.z=0 then Vertex.Aligned.z:=1;
  Vertex.x:=Round(FocalDist*Vertex.Aligned.x/Vertex.Aligned.z);
  Vertex.y:=Round(FocalDist*Vertex.Aligned.y/Vertex.Aligned.z);
end;

procedure TTDStarField.Render(const Canvas: TCanvas;
  var Polygons: TPolygons; const Camera: TMatrix);
var
  mx, my, z: Integer;
  View: TMatrix;
begin
  mx:=(Canvas.ClipRect.Right-Canvas.ClipRect.Left) div 2;
  my:=(Canvas.ClipRect.Bottom-Canvas.ClipRect.Top) div 2;
  View:=Camera;
  View[3,0]:=0;
  View[3,1]:=0;
  View[3,2]:=0;
  for z:=0 to Length(Stars)-1 do
  begin
    Stars[z].Aligned:=VectorMatrixMultiply(Stars[z].Local,View);
    if Stars[z].Aligned.z>0 then
    begin
      Project(Stars[z]);
      Canvas.Pixels[mx+Stars[z].x,my-Stars[z].y]:=Stars[z].Color;
    end;
  end;
end;

end.
