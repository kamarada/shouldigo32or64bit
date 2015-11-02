unit OperatingSystem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils{$IFDEF LINUX}, BaseUnix{$ENDIF};

type
  TOperatingSystem = class
    private
      FArchitecture: Integer;
      FProductName: String;
    public
      constructor Create();
      property Architecture: Integer read FArchitecture;
      property ProductName: String read FProductName;
  end;

implementation

{$IFDEF WINDOWS}
uses
  uWin32_ComputerSystem, uWin32_OperatingSystem;
{$ENDIF}

constructor TOperatingSystem.Create();
{$IFDEF LINUX}
var
  LinuxKernelInfo: UtsName;
begin
  FpUname(LinuxKernelInfo);
  if (
    (LinuxKernelInfo.Machine = 'amd64') or
    (LinuxKernelInfo.Machine = 'x86_64')
  ) then
    FArchitecture := 64
  else if (
    (LinuxKernelInfo.Machine = 'i386') or
    (LinuxKernelInfo.Machine = 'i486') or
    (LinuxKernelInfo.Machine = 'i586') or
    (LinuxKernelInfo.Machine = 'i686')
  ) then
    FArchitecture := 32
  else
    FArchitecture := 0;
  FProductName := LinuxKernelInfo.Sysname + ' ' + LinuxKernelInfo.Release;
end;
{$ENDIF}
{$IFDEF WINDOWS}
var
  Arch: String;
  Version: TStringList;
  Win32_ComputerSystem: TWin32_ComputerSystem;
  Win32_OperatingSystem: TWin32_OperatingSystem;
begin
  FArchitecture := 0;
  Win32_OperatingSystem:= TWin32_OperatingSystem.Create;
  Version := TStringList.Create;
  Version.Delimiter := '.';
  Version.DelimitedText := Win32_OperatingSystem.Version;
  if (StrToInt(Version.Strings[0]) >= 6) then
  begin
    // Windows Vista and newer
    Arch := Win32_OperatingSystem.OSArchitecture;
    if (Pos('64', Arch) > 0) then
      FArchitecture := 64
    else // TODO Review
      FArchitecture := 32;
  end
  else
  begin
    // Windows XP and earlier
    Win32_ComputerSystem := TWin32_ComputerSystem.Create;
    if (Pos('64', Win32_ComputerSystem.SystemType) > 0) then
      FArchitecture := 64
    else // TODO Review
      FArchitecture := 32;
  end;
  FProductName := Win32_OperatingSystem.Caption;
end;
{$ENDIF}

end.

