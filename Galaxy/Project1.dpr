program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  galaxy in 'galaxy.pas',
  TDPoints in 'TDPoints.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
