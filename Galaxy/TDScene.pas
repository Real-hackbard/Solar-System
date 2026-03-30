unit TDScene;

interface

uses
  Graphics, Windows, Vector3D, Matrix, TDObject, TDCamera, Classes,
  TDLight;

type
  TTDScene=class(TTDObject)
    Polygons: TPolygons;
    AmbientLight: TIllumination;
    Lights: TList;
    constructor Create;
    destructor Destroy; override;
    function GetIllumination(const PlaneNormal, Position: TVector3D): TIllumination;
    function GetLight(const Color: TColor; const Illumination: TIllumination): TColor;
    procedure PolygonSort(iLo, iHi: Integer);
    procedure Render(const Canvas: TCanvas; const Camera: TTDCamera); reintroduce;
  end;

implementation

constructor TTDScene.Create;
begin
  inherited Create(nil);
  Lights:=TList.Create;
  AmbientLight.Red:=10;
  AmbientLight.Green:=10;
  AmbientLight.Blue:=10;
end;

destructor TTDScene.Destroy;
begin
  Lights.Free;
  inherited;
end;

function TTDScene.GetIllumination(const PlaneNormal, Position: TVector3D): TIllumination;
var
  Illumination: TIllumination;
  z, Red, Blue, Green: Integer;
  Light: TVector3D;
begin
  Result:=AmbientLight;
  for z:=0 to Lights.Count-1 do
  begin
    Light:=Vector3DNormalize(Vector3DAdd(Position,TTDLight(Lights[z]).Light.World));
    Blue:=(TTDLight(Lights[z]).Color shr 16) and 255;
    Green:=(TTDLight(Lights[z]).Color shr 8) and 255;
    Red:=(TTDLight(Lights[z]).Color) and 255;
    Illumination.Red:=Round((1+Vector3DDotMultiply(PlaneNormal,Light))*50*Red/255);
    Illumination.Green:=Round((1+Vector3DDotMultiply(PlaneNormal,Light))*50*Green/255);
    Illumination.Blue:=Round((1+Vector3DDotMultiply(PlaneNormal,Light))*50*Blue/255);
    if Result.Red<Illumination.Red then Result.Red:=Illumination.Red;
    if Result.Green<Illumination.Green then Result.Green:=Illumination.Green;
    if Result.Blue<Illumination.Blue then Result.Blue:=Illumination.Blue;
  end;
end;

function TTDScene.GetLight(const Color: TColor; const Illumination: TIllumination): TColor;
var
  Red, Green, Blue: Integer;
begin
  Blue:=((Color shr 16) and 255)*Illumination.Blue div 100;
  Green:=((Color shr 8) and 255)*Illumination.Green div 100;
  Red:=(Color and 255)*Illumination.Red div 100;
  Result:=(Color and $7f000000) or (Blue shl 16) or (Green shl 8) or Red;
end;

procedure TTDScene.PolygonSort(iLo, iHi: Integer);
var
  Lo, Hi: Integer;
  Mid: Extended;
  Polygon: TPolygon;
begin
  Lo := iLo;
  Hi := iHi;
  Mid := Polygons[(Lo + Hi) div 2].Zorder;
  repeat
    while Polygons[Lo].ZOrder>Mid do Inc(Lo);
    while Polygons[Hi].Zorder<Mid do Dec(Hi);
    if Lo<=Hi then
    begin
      Polygon:=Polygons[Lo];
      Polygons[Lo]:=Polygons[Hi];
      Polygons[Hi]:=Polygon;
      Inc(Lo);
      Dec(Hi);
    end;
  until Lo > Hi;
  if Hi > iLo then PolygonSort(iLo, Hi);
  if Lo < iHi then PolygonSort(Lo, iHi);
end;

procedure TTDScene.Render(const Canvas: TCanvas; const Camera: TTDCamera);
var
  z, p: Integer;
  Illumination: TIllumination;
begin
  SetLength(Polygons,0);
  for z:=0 to TDObjects.Count-1 do
    TTDObject(TDObjects[z]).Render(Canvas,Polygons,Camera.Camera);
  if Length(Polygons)>0 then
  begin
    PolygonSort(0,Length(Polygons)-1);
    for z:=0 to Length(Polygons)-1 do
    begin
      if Polygons[z].ZOrder>0 then
      case Camera.RenderMode of
        rmPlanes:
        begin
          Illumination:=GetIllumination(Polygons[z].PlaneNormal,Polygons[z].Position);
          Canvas.Pen.Color:=GetLight(Polygons[z].BorderColor,Illumination);
          Canvas.Brush.Color:=GetLight(Polygons[z].PlaneColor,Illumination);
          Canvas.Polygon(Polygons[z].Points);
        end;
        rmVertexes:
        begin
          for p:=0 to Length(Polygons[z].Points)-1 do
          begin
            Canvas.Pixels[Polygons[z].Points[p].x,Polygons[z].Points[p].y]:=
              Polygons[z].BorderColor;;
          end;
        end;
        rmLines:
        begin
          SetLength(Polygons[z].Points,Length(Polygons[z].Points)+1);
          Polygons[z].Points[Length(Polygons[z].Points)-1]:=Polygons[z].Points[0];
          Canvas.Pen.Color:=Polygons[z].BorderColor;
          Canvas.PolyLine(Polygons[z].Points);
        end;
      end
    end;
  end;
end;

end.
