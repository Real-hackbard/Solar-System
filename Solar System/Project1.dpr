program Project1;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  XAstro in 'XAstro.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
