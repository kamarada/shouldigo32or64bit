/// <summary>
/// Unit generated using the Delphi Wmi class generator tool, Copyright Rodrigo Ruz V. 2010-2012
/// Application version 1.0.4674.62299
/// WMI version 7601.17514
/// Creation Date 17-10-2012 18:18:17
/// Namespace root\CIMV2 Class Win32_ComputerSystem
/// MSDN info about this class http://msdn2.microsoft.com/library/default.asp?url=/library/en-us/wmisdk/wmi/Win32_ComputerSystem.asp
/// </summary>


unit uWin32_ComputerSystem;

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
  /// The Win32_ComputerSystem class represents a computer system operating in a 
  /// Win32 environment.
  /// </summary>
  {$ENDREGION}
  TWin32_ComputerSystem=class(TWmiClass)
  private
    FSystemType                         : String;
    FTotalPhysicalMemory                : Int64;
  public
   constructor Create(LoadWmiData : boolean=True); overload;
   destructor Destroy;Override;
   {$REGION 'Documentation'}
   /// <summary>
   /// The SystemType property indicates the type of system running on the Win32 computer.
   /// Constraints: Must have a value
   /// </summary>
   {$ENDREGION}
   property SystemType : String read FSystemType;
   {$REGION 'Documentation'}
   /// <summary>
   /// The TotalPhysicalMemory property indicates the total size of physical memory.
   /// Example: 67108864
   /// </summary>
   {$ENDREGION}
   property TotalPhysicalMemory : Int64 read FTotalPhysicalMemory;
   procedure SetCollectionIndex(Index : Integer); override;
  end;

implementation

{TWin32_ComputerSystem}

constructor TWin32_ComputerSystem.Create(LoadWmiData : boolean=True);
begin
  inherited Create(LoadWmiData,'root\CIMV2','Win32_ComputerSystem');
end;

destructor TWin32_ComputerSystem.Destroy;
begin
  inherited;
end;

procedure TWin32_ComputerSystem.SetCollectionIndex(Index : Integer);
begin
  if (Index>=0) and (Index<=FWmiCollection.Count-1) and (FWmiCollectionIndex<>Index) then
  begin
    FWmiCollectionIndex:=Index;
    FSystemType                       := VarStrNull(inherited Value['SystemType']);
    FTotalPhysicalMemory              := VarInt64Null(inherited Value['TotalPhysicalMemory']);
  end;
end;

end.

