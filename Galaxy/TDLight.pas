unit TDLight;

interface

uses
  TDObject, Matrix, Graphics;

type
  TIllumination=record
    Red, Green, Blue: Integer;
  end;
  
  TTDLight=class(TTDObject)
    Light: TVertex;
    Color: TColor;
    constructor Create(Parent: TTDObject);
    destructor Destroy; override;
    procedure Render(const Canvas: TCanvas; var Polygons: TPolygons; const Camera: TMatrix); override;
    procedure SetColor(const Color: TColor);
  end;


implementation

uses
  TDScene, Vector3D, TDComplex;

constructor TTDLight.Create(Parent: TTDObject);
var
  Scene: TTDObject;
begin
  inherited;
  Scene:=Parent;
  while not (Scene is TTDScene) do Scene:=Scene.Parent;
  TTDScene(Scene).Lights.Add(Self);
  Light.Local.x:=0;
  Light.Local.y:=0;
  Light.Local.z:=0;
  Position:=IdentityMatrix;
  Color:=clWhite;
end;

destructor TTDLight.Destroy;
var
  Scene: TTDObject;
begin
  Scene:=Parent;
  while not (Scene is TTDScene) do Scene:=Scene.Parent;
  TTDScene(Scene).Lights.Remove(Self);
  inherited;
end;

procedure TTDLight.Render(const Canvas: TCanvas; var Polygons: TPolygons;
  const Camera: TMatrix);
var
  CurParent: TTDObject;
begin
  Light.World:=VectorMatrixMultiply(Light.Local,Position);
  CurParent:=Parent;
  while (CurParent<>nil) and (CurParent is TTDObject) do
  begin
    Light.World:=VectorMatrixMultiply(Light.World,TTDComplex(CurParent).Position);
    CurParent:=CurParent.Parent;
  end;
  Light.Aligned:=VectorMatrixMultiply(Light.World,MatrixInvert(Camera));
end;

procedure TTDLight.SetColor(const Color: TColor);
begin
  Self.Color:=Color;
  Update;
end;

end.
