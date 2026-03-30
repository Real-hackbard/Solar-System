unit TDCamera;

interface

uses
  Graphics, Matrix, TDObject;

type
  TRenderMode=(rmVertexes,rmLines,rmPlanes);

  TTDCamera=class(TTDObject)
    Camera: TMatrix;
    RenderMode: TRenderMode;
    constructor Create(Parent: TTDObject);
    destructor Destroy; override;
    procedure Move(const tx, ty, tz: Extended); override;
    procedure Rotate(const rx, ry, rz: Extended); override;
    procedure MoveRelative(const tx, ty, tz: Extended); override;
    procedure RotateRelative(const rx, ry, rz: Extended); override;
  end;

implementation

constructor TTDCamera.Create(Parent: TTDObject);
begin
  inherited;
  RenderMode:=rmPlanes;
end;

destructor TTDCamera.Destroy;
begin
  inherited;
end;

procedure TTDCamera.Move(const tx, ty, tz: Extended);
begin
  inherited;
  Camera:=MatrixInvert(Position);
end;

procedure TTDCamera.MoveRelative(const tx, ty, tz: Extended);
begin
  inherited;
  Camera:=MatrixInvert(Position);
end;

procedure TTDCamera.Rotate(const rx, ry, rz: Extended);
begin
  inherited;
  Camera:=MatrixInvert(Position);
end;

procedure TTDCamera.RotateRelative(const rx, ry, rz: Extended);
begin
  inherited;
  Camera:=MatrixInvert(Position);
end;

end.
