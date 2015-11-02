unit Processor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TProcessor = class
    private
      FArchitecture: Integer;
      FModel: String;
    public
      constructor Create();
      property Architecture: Integer read FArchitecture;
      property Model: String read FModel;
  end;

implementation

{$IFDEF WINDOWS}
uses
  uWin32_Processor;
{$ENDIF}

constructor TProcessor.Create();
{$IFDEF LINUX}
var
  CpuInfo: TStringList;
  Field, Line: String;
  LineNumber: Integer;
begin
  FArchitecture := 0;
  FModel := '';
  CpuInfo := TStringList.Create();
  CpuInfo.LoadFromFile('/proc/cpuinfo');
  LineNumber := CpuInfo.Count;
  for LineNumber := 0 to (CpuInfo.Count - 1) do
  begin
    Line := CpuInfo.Strings[LineNumber];
    if (Pos(':', Line) > 0) then
      Field := Trim(Copy(Line, 1, Pos(':', Line) - 1));
    if (Field = 'model name') then
      FModel := Trim(Copy(Line, Pos(':', Line) + 1,
        Length(Line) - Pos(':', Line)));
    if (Field = 'flags') then
    begin
      if ((Pos(' lm ', Line) > 0) and (FArchitecture < 64)) then
        FArchitecture := 64;
      if ((Pos(' tm ', Line) > 0) and (FArchitecture < 32)) then
        FArchitecture := 32;
      if ((Pos(' rm ', Line) > 0) and (FArchitecture < 16)) then
        FArchitecture := 16;
    end;
    if (
      (FArchitecture > 0) and
      (Length(FModel) > 0) and
      (Field <> 'flags')
    ) then
      break;
  end;
end;
{$ENDIF}
{$IFDEF WINDOWS}
var
  Win32_Processor: TWin32_Processor;
begin
  Win32_Processor:= TWin32_Processor.Create;
  FArchitecture := Win32_Processor.DataWidth;
  FModel := Win32_Processor.Name;
end;
{$ENDIF}

end.

