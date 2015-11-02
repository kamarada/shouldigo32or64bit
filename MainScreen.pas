unit MainScreen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, ComputerInfo;

type

  { TFmMainScreen }

  TFmMainScreen = class(TForm)
    BbClose: TBitBtn;
    GbAdvice: TGroupBox;
    GbMemory: TGroupBox;
    GbOperatingSystem: TGroupBox;
    GbProcessor: TGroupBox;
    ImAdvice: TImage;
    ImMemory: TImage;
    ImOperatingSystem: TImage;
    ImProcessor: TImage;
    LeOperatingSystemArchitecture: TLabeledEdit;
    LeOperatingSystemProductName: TLabeledEdit;
    LeProcessorArchitecture: TLabeledEdit;
    LeProcessorModel: TLabeledEdit;
    LeRam: TLabeledEdit;
    MeAdvice: TMemo;
    procedure BbCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FmMainScreen: TFmMainScreen;

implementation

{$R *.lfm}

{ TFmMainScreen }

procedure TFmMainScreen.FormCreate(Sender: TObject);
var
  ComputerInfo: TComputerInfo;
begin
  ComputerInfo := TComputerInfo.Create();
  LeProcessorModel.Text := ComputerInfo.ProcessorModel;
  LeProcessorArchitecture.Text := ComputerInfo.ProcessorArchitecture;
  LeRam.Text := ComputerInfo.Ram;
  LeOperatingSystemProductName.Text := ComputerInfo.OperatingSystemProductName;
  LeOperatingSystemArchitecture.Text :=
    ComputerInfo.OperatingSystemArchitecture;
  MeAdvice.Lines.Clear;
  MeAdvice.Lines.Add(ComputerInfo.Advice);
end;

procedure TFmMainScreen.BbCloseClick(Sender: TObject);
begin
  Close();
end;

end.

