unit ComputerInfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Memory, Processor, OperatingSystem;

type
  TComputerInfo = class
    private
      FAdvice: String;
      FMemory: TMemory;
      FOperatingSystem: TOperatingSystem;
      FProcessor: TProcessor;
      function GetOperatingSystemArchitecture(): String;
      function GetOperatingSystemProductName(): String;
      function GetProcessorArchitecture(): String;
      function GetProcessorModel(): String;
      function GetRam(): String;
    public
      constructor Create();
      property Advice: String read FAdvice;
      property OperatingSystemArchitecture: String
        read GetOperatingSystemArchitecture;
      property OperatingSystemProductName: String
        read GetOperatingSystemProductName;
      property ProcessorArchitecture: String
        read GetProcessorArchitecture;
      property ProcessorModel: String read GetProcessorModel;
      property Ram: String read GetRam;
  end;

implementation

resourcestring
  AdviceSystem32Processor32 = 'Your computer supports 32-bit operating ' +
    'systems only.';
  AdviceProcessor64RamEnough = 'Since your computer supports 64-bit ' +
    'operating systems and it has enough RAM (>= 2GB), you should use a ' +
    '64-bit system.';
  AdviceProcessor64RamEnoughSystem64 = 'At the moment, you are using a ' +
    '64-bit system.';
  AdviceProcessor64RamLittleSystem32 = 'Your computer supports 64-bit ' +
    'operating systems, but it does not have much RAM (< 2GB). At the ' +
    'moment, you are using a 32-bit system. If its performance is good, you ' +
    'should use a 32-bit system.';
  AdviceProcessor64RamLittleSystem64 = 'Your computer supports 64-bit ' +
    'operating systems, but it does not have much RAM (< 2GB). At the ' +
    'moment, you are using a 64-bit system. If its performance is not ' +
    'satisfying, you should consider using a 32-bit system.';
  AdviceDefault = 'You should use a system that matches your processor''s ' +
      'architecture.';
  OperatingSystemArchitecture32bit = '32-bit';
  OperatingSystemArchitecture64bit = '64-bit';
  OperatingSystemArchitectureUnknown = 'Unknown';
  OperatingSystemArchitectureBit = '-bit';
  ProcessorArchitecture32bit = 'Legacy 32-bit PC';
  ProcessorArchitecture64bit = '64-bit PC';
  ProcessorArchitectureUnknown = 'Unknown';
  ProcessorArchitectureBit = '-bit';

constructor TComputerInfo.Create();
begin
  FAdvice := '';
  FMemory := TMemory.Create();
  FOperatingSystem := TOperatingSystem.Create();
  FProcessor := TProcessor.Create();
  if (
    (FOperatingSystem.Architecture = 32) and
    (FProcessor.Architecture = 32)
  ) then
    FAdvice := AdviceSystem32Processor32
  else
    if (FProcessor.Architecture = 64) then
      if (FMemory.Ram >= 2147483648) then
      begin
        FAdvice := AdviceProcessor64RamEnough;
        if (FOperatingSystem.Architecture = 64) then
          FAdvice := FAdvice + ' ' + AdviceProcessor64RamEnoughSystem64
      end
      else
        if (FOperatingSystem.Architecture = 32) then
          FAdvice := AdviceProcessor64RamLittleSystem32
        else
          if (FOperatingSystem.Architecture = 64) then
            FAdvice := AdviceProcessor64RamLittleSystem64;
  if (FAdvice = '') then
    FAdvice := AdviceDefault;
end;

function TComputerInfo.GetOperatingSystemArchitecture(): String;
begin
  case FOperatingSystem.Architecture of
    32:
      Result := OperatingSystemArchitecture32bit;
    64:
      Result := OperatingSystemArchitecture64bit;
    else
      Result := OperatingSystemArchitectureUnknown + ' (' +
        IntToStr(FOperatingSystem.Architecture) + OperatingSystemArchitectureBit
        + ')';
  end;
end;

function TComputerInfo.GetOperatingSystemProductName(): String;
begin
  Result := FOperatingSystem.ProductName;
end;

function TComputerInfo.GetProcessorArchitecture(): String;
begin
  case FProcessor.Architecture of
    32:
      Result := ProcessorArchitecture32bit;
    64:
      Result := ProcessorArchitecture64bit;
    else
      Result := ProcessorArchitectureUnknown + ' (' +
        IntToStr(FProcessor.Architecture) + ProcessorArchitectureBit + ')';
  end;
end;

function TComputerInfo.GetProcessorModel(): String;
begin
  Result := FProcessor.Model;
end;

function TComputerInfo.GetRam(): String;
type
  TUnitsOfMeasurement = array[0..6] of String;
var
  ChosenUnit: Integer;
  SmallerNumber: Double;
  UnitsOfMeasurement: TUnitsOfMeasurement;
begin
  SmallerNumber := FMemory.Ram;
  UnitsOfMeasurement[0] := 'B';
  UnitsOfMeasurement[1] := 'kB';
  UnitsOfMeasurement[2] := 'MB';
  UnitsOfMeasurement[3] := 'GB';
  UnitsOfMeasurement[4] := 'TB';
  UnitsOfMeasurement[5] := 'PB';
  UnitsOfMeasurement[6] := 'EB';
  ChosenUnit := 0;
  while (SmallerNumber >= 1024) do
  begin
    SmallerNumber := SmallerNumber / 1024;
    ChosenUnit := ChosenUnit + 1;
  end;
  Result := FloatToStrF(SmallerNumber, ffGeneral, 3, 0) + ' ' +
    UnitsOfMeasurement[ChosenUnit];
end;

end.

