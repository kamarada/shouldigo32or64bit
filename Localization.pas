unit Localization;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TLocale = class
    protected
      FAdviceSystem32Processor32: string;
      FAdviceProcessor64RamEnough: string;
      FAdviceProcessor64RamEnoughSystem64: string;
      FAdviceProcessor64RamLittleSystem32: string;
      FAdviceProcessor64RamLittleSystem64: string;
      FAdviceDefault: string;
      FBbClose: string;
      FFmMainScreen: string;
      FGbAdvice: string;
      FGbMemory: string;
      FGbOperatingSystem: string;
      FGbProcessor: string;
      FLeOperatingSystemArchitecture: string;
      FLeOperatingSystemProductName: string;
      FLeProcessorArchitecture: string;
      FLeProcessorModel: string;
      FLeRam: string;
      FMeAdvice: string;
      FOperatingSystemArchitecture32bit: string;
      FOperatingSystemArchitecture64bit: string;
      FOperatingSystemArchitectureUnknown: string;
      FOperatingSystemArchitectureBit: string;
      FProcessorArchitecture32bit: string;
      FProcessorArchitecture64bit: string;
      FProcessorArchitectureUnknown: string;
      FProcessorArchitectureBit: string;
    public
      constructor Create();
      property AdviceSystem32Processor32: string read FAdviceSystem32Processor32;
      property AdviceProcessor64RamEnough: string read FAdviceProcessor64RamEnough;
      property AdviceProcessor64RamEnoughSystem64: string read FAdviceProcessor64RamEnoughSystem64;
      property AdviceProcessor64RamLittleSystem32: string read FAdviceProcessor64RamLittleSystem32;
      property AdviceProcessor64RamLittleSystem64: string read FAdviceProcessor64RamLittleSystem64;
      property AdviceDefault: string read FAdviceDefault;
      property BbClose: string read FBbClose;
      property FmMainScreen: string read FFmMainScreen;
      property GbAdvice: string read FGbAdvice;
      property GbMemory: string read FGbMemory;
      property GbOperatingSystem: string read FGbOperatingSystem;
      property GbProcessor: string read FGbProcessor;
      property LeOperatingSystemArchitecture: string read FLeOperatingSystemArchitecture;
      property LeOperatingSystemProductName: string read FLeOperatingSystemProductName;
      property LeProcessorArchitecture: string read FLeProcessorArchitecture;
      property LeProcessorModel: string read FLeProcessorModel;
      property LeRam: string read FLeRam;
      property MeAdvice: string read FMeAdvice;
      property OperatingSystemArchitecture32bit: string read FOperatingSystemArchitecture32bit;
      property OperatingSystemArchitecture64bit: string read FOperatingSystemArchitecture64bit;
      property OperatingSystemArchitectureUnknown: string read FOperatingSystemArchitectureUnknown;
      property OperatingSystemArchitectureBit: string read FOperatingSystemArchitectureBit;
      property ProcessorArchitecture32bit: string read FProcessorArchitecture32bit;
      property ProcessorArchitecture64bit: string read FProcessorArchitecture64bit;
      property ProcessorArchitectureUnknown: string read FProcessorArchitectureUnknown;
      property ProcessorArchitectureBit: string read FProcessorArchitectureBit;
  end;

  TPortugueseBrazilianLocale = class(TLocale)
    public
      constructor Create();
  end;

var
   Locale: TLocale;

function GetSystemLanguage(): string;

implementation

uses
  GetText;

function GetSystemLanguage(): string;
var
  Lang, FallbackLang: string;
begin
  GetLanguageIDs(Lang, FallbackLang);
  Result := FallbackLang;
end;

constructor TLocale.Create();
begin
  FAdviceSystem32Processor32 := 'Your computer supports 32-bit operating ' +
    'systems only.';
  FAdviceProcessor64RamEnough := 'Since your computer supports 64-bit ' +
    'operating systems and it has enough RAM (>= 2GB), you should use a ' +
    '64-bit system.';
  FAdviceProcessor64RamEnoughSystem64 := 'At the moment, you are using a ' +
    '64-bit system.';
  FAdviceProcessor64RamLittleSystem32 := 'Your computer supports 64-bit ' +
    'operating systems, but it does not have much RAM (< 2GB). At the ' +
    'moment, you are using a 32-bit system. If its performance is good, you ' +
    'should use a 32-bit system.';
  FAdviceProcessor64RamLittleSystem64 := 'Your computer supports 64-bit ' +
    'operating systems, but it does not have much RAM (< 2GB). At the ' +
    'moment, you are using a 64-bit system. If its performance is not ' +
    'satisfying, you should consider using a 32-bit system.';
  FAdviceDefault := 'You should use a system that matches your processor''s ' +
      'architecture.';
  FBbClose := '&Close';
  FFmMainScreen := 'Should I go 32 or 64-bit?';
  FGbAdvice := 'Advice';
  FGbMemory := 'Memory';
  FGbOperatingSystem := 'Operating system';
  FGbProcessor := 'Processor';
  FLeOperatingSystemArchitecture := 'System architecture';
  FLeOperatingSystemProductName := 'Product name';
  FLeProcessorArchitecture := 'Processor architecture';
  FLeProcessorModel := 'Processor model';
  FLeRam := 'RAM';
  FOperatingSystemArchitecture32bit := '32-bit';
  FOperatingSystemArchitecture64bit := '64-bit';
  FOperatingSystemArchitectureUnknown := 'Unknown';
  FOperatingSystemArchitectureBit := '-bit';
  FProcessorArchitecture32bit := 'Legacy 32-bit PC';
  FProcessorArchitecture64bit := '64-bit PC';
  FProcessorArchitectureUnknown := 'Unknown';
  FProcessorArchitectureBit := '-bit';
end;

constructor TPortugueseBrazilianLocale.Create();
begin
  FAdviceSystem32Processor32 := 'Seu computador suporta apenas sistemas ' +
    'operacionais de 32 bits.';
  FAdviceProcessor64RamEnough := 'Como seu computador suporta sistemas ' +
    'operacionais de 64 bits e dispõe de memória RAM suficiente (>= 2GB), ' +
    'você deve usar um sistema de 64 bits.';
  FAdviceProcessor64RamEnoughSystem64 := 'No momento, você está usando um ' +
    'sistema de 64 bits.';
  FAdviceProcessor64RamLittleSystem32 := 'Seu computador suporta sistemas ' +
    'operacionais de 64 bits, mas ele não dispõe de memória RAM suficiente ' +
    '(< 2 GB). No momento, você está usando um sistema de 32 bits. Se o ' +
    'desempenho dele é bom, você deve usar um sistema de 32 bits.';
  FAdviceProcessor64RamLittleSystem64 := 'Seu computador suporta sistemas ' +
    'operacionais de 64 bits, mas ele não dispõe de memória RAM suficiente ' +
    '(< 2 GB). No momento, você está usando um sistema de 64 bits. Se o ' +
    'desempenho dele não é satisfatório, considere usar um sistema de 32 bits.';
  FAdviceDefault := 'Você deve usar um sistema operacional com a mesma ' +
    'arquitetura do seu processador.';
  FBbClose := '&Fechar';
  FFmMainScreen := 'Qual devo usar: 32 ou 64 bits?';
  FGbAdvice := 'Conselho';
  FGbMemory := 'Memória';
  FGbOperatingSystem := 'Sistema operacional';
  FGbProcessor := 'Processador';
  FLeOperatingSystemArchitecture := 'Arquitetura do sistema';
  FLeOperatingSystemProductName := 'Nome do produto';
  FLeProcessorArchitecture := 'Arquitetura do processador';
  FLeProcessorModel := 'Modelo do processador';
  FLeRam := 'RAM';
  FOperatingSystemArchitecture32bit := '32 bits';
  FOperatingSystemArchitecture64bit := '64 bits';
  FOperatingSystemArchitectureUnknown := 'Não identificada';
  FOperatingSystemArchitectureBit := ' bits';
  FProcessorArchitecture32bit := 'PC de 32 bits (antigo)';
  FProcessorArchitecture64bit := 'PC de 64 bits';
  FProcessorArchitectureUnknown := 'Não identificada';
  FProcessorArchitectureBit := ' bits';
end;

initialization
  if (UpperCase(GetSystemLanguage()) = 'PT') then
    Locale := TPortugueseBrazilianLocale.Create()
  else
    Locale := TLocale.Create();

end.

