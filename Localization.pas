unit Localization;

{$mode objfpc}{$H+}

interface

uses
  LCLTranslator;

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

implementation

initialization
  SetDefaultLang('', '', false);

end.

