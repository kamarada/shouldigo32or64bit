unit Memory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TMemory = class
    private
      FRam: QWord;
    public
      constructor Create();
      property Ram: QWord read FRam;
  end;

implementation

{$IFDEF WINDOWS}
uses
  uWin32_ComputerSystem;
{$ENDIF}

constructor TMemory.Create();
{$IFDEF LINUX}
var
  Field, Line: String;
  LineNumber: Integer;
  MemInfo: TStringList;
  UnitOfMeasurement, Value: String;
begin
  FRam := 0;
  MemInfo := TStringList.Create();
  MemInfo.LoadFromFile('/proc/meminfo');
  LineNumber := MemInfo.Count;
  for LineNumber := 0 to (MemInfo.Count - 1) do
  begin
    Line := MemInfo.Strings[LineNumber];
    if (Pos(':', Line) > 0) then
      Field := Trim(Copy(Line, 1, Pos(':', Line) - 1));
    if (Field = 'MemTotal') then
    begin
      Value := Trim(Copy(Line, Pos(':', Line) + 1,
        Length(Line) - Pos(':', Line)));
      FRam := StrToQWord(Copy(Value, 1, Pos(' ', Value) - 1));
      UnitOfMeasurement := Trim(Copy(Value, Pos(' ', Value) + 1,
        Length(Value) - Pos(' ', Value)));
      if (UpperCase(UnitOfMeasurement) = 'KB') then
        FRam := FRam * 1024;
      break;
    end;
  end;
end;
{$ENDIF}
{$IFDEF WINDOWS}
var
  Win32_ComputerSystem: TWin32_ComputerSystem;
begin
  Win32_ComputerSystem:= TWin32_ComputerSystem.Create;
  FRam := Win32_ComputerSystem.TotalPhysicalMemory;
end;
{$ENDIF}

end.

