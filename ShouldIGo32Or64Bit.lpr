program ShouldIGo32Or64Bit;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MainScreen, ComputerInfo, Memory, OperatingSystem, Processor
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Should I go 32 or 64-bit?';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TFmMainScreen, FmMainScreen);
  Application.Run;
end.

