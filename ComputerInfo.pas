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

uses
  Localization;

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
    FAdvice := Locale.AdviceSystem32Processor32
  else
    if (FProcessor.Architecture = 64) then
      if (FMemory.Ram >= 2147483648) then
      begin
        FAdvice := Locale.AdviceProcessor64RamEnough;
        if (FOperatingSystem.Architecture = 64) then
          FAdvice := FAdvice + ' ' + Locale.AdviceProcessor64RamEnoughSystem64
      end
      else
        if (FOperatingSystem.Architecture = 32) then
          FAdvice := Locale.AdviceProcessor64RamLittleSystem32
        else
          if (FOperatingSystem.Architecture = 64) then
            FAdvice := Locale.AdviceProcessor64RamLittleSystem64;
  if (FAdvice = '') then
    FAdvice := Locale.AdviceDefault;
end;

function TComputerInfo.GetOperatingSystemArchitecture(): String;
begin
  case FOperatingSystem.Architecture of
    32:
      Result := Locale.OperatingSystemArchitecture32bit;
    64:
      Result := Locale.OperatingSystemArchitecture64bit;
    else
      Result := Locale.OperatingSystemArchitectureUnknown + ' (' +
        IntToStr(FOperatingSystem.Architecture) +
        Locale.OperatingSystemArchitectureBit + ')';
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
      Result := Locale.ProcessorArchitecture32bit;
    64:
      Result := Locale.ProcessorArchitecture64bit;
    else
      Result := Locale.ProcessorArchitectureUnknown + ' (' +
        IntToStr(FProcessor.Architecture) + Locale.ProcessorArchitectureBit +
        ')';
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

