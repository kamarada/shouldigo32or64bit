/// <summary>
/// Unit generated using the Delphi Wmi class generator tool, Copyright Rodrigo Ruz V. 2010-2012
/// Application version 1.0.4674.62299
/// WMI version 7601.17514
/// Creation Date 17-10-2012 18:18:32
/// Namespace root\CIMV2 Class Win32_OperatingSystem
/// MSDN info about this class http://msdn2.microsoft.com/library/default.asp?url=/library/en-us/wmisdk/wmi/Win32_OperatingSystem.asp
/// </summary>


unit uWin32_OperatingSystem;

interface

uses
 Classes,
 Activex,
 Variants,
 ComObj,
 uWmiDelphiClass;

type
  {$REGION 'Documentation'}
  /// <summary>
  /// The Win32_OperatingSystem class represents an operating system installed on a Win32 computer system. Any operating system that can be installed on a Win32 system is a descendent (or member) of this class.
  /// Example: Microsoft Windows 95.
  /// </summary>
  {$ENDREGION}
  TWin32_OperatingSystem=class(TWmiClass)
  private
    FCaption                            : String;
    FOSArchitecture                     : String;
    FVersion                            : String;
  public
   constructor Create(LoadWmiData : boolean=True); overload;
   destructor Destroy;Override;
   {$REGION 'Documentation'}
   /// <summary>
   /// The Caption property is a short textual description (one-line string) of the
   /// object.
   /// </summary>
   {$ENDREGION}
   property Caption : String read FCaption;
   {$REGION 'Documentation'}
   /// <summary>
   /// The OSArchitecture property indicates the Architecture of the operating 
   /// system.Example: 32-bit, 64-bit Intel, 64-bit AMD 
   /// </summary>
   {$ENDREGION}
   property OSArchitecture : String read FOSArchitecture;
   {$REGION 'Documentation'}
   /// <summary>
   /// The Version property indicates the version number of the operating system.
   /// Example: 4.0
   /// </summary>
   {$ENDREGION}
   property Version : String read FVersion;
   procedure SetCollectionIndex(Index : Integer); override;
  end;

implementation

{TWin32_OperatingSystem}

constructor TWin32_OperatingSystem.Create(LoadWmiData : boolean=True);
begin
  inherited Create(LoadWmiData,'root\CIMV2','Win32_OperatingSystem');
end;

destructor TWin32_OperatingSystem.Destroy;
begin
  inherited;
end;

procedure TWin32_OperatingSystem.SetCollectionIndex(Index : Integer);
begin
  if (Index>=0) and (Index<=FWmiCollection.Count-1) and (FWmiCollectionIndex<>Index) then
  begin
    FWmiCollectionIndex:=Index;
    FCaption                                        := VarStrNull(inherited Value['Caption']);
    FOSArchitecture                                 := VarStrNull(inherited Value['OSArchitecture']);
    FVersion                                        := VarStrNull(inherited Value['Version']);
  end;
end;

end.

