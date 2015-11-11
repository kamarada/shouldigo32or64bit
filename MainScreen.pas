unit MainScreen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

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
    procedure LoadComputerInfo();
    procedure TranslateInterface();
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FmMainScreen: TFmMainScreen;

implementation

{$R *.lfm}

uses
  Localization, ComputerInfo;

{ TFmMainScreen }

procedure TFmMainScreen.BbCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TFmMainScreen.FormCreate(Sender: TObject);
begin
  TranslateInterface();
  LoadComputerInfo();
end;

procedure TFmMainScreen.LoadComputerInfo();
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

procedure TFmMainScreen.TranslateInterface();
begin
  Application.Title := Locale.FmMainScreen;
  Caption := Locale.FmMainScreen;
  GbProcessor.Caption := Locale.GbProcessor;
  LeProcessorModel.EditLabel.Caption := Locale.LeProcessorModel;
  LeProcessorArchitecture.EditLabel.Caption := Locale.LeProcessorArchitecture;
  GbMemory.Caption := Locale.GbMemory;
  LeRam.EditLabel.Caption := Locale.LeRam;
  GbOperatingSystem.Caption := Locale.GbOperatingSystem;
  LeOperatingSystemArchitecture.EditLabel.Caption := Locale.LeOperatingSystemArchitecture;
  LeOperatingSystemProductName.EditLabel.Caption := Locale.LeOperatingSystemProductName;
  GbAdvice.Caption := Locale.GbAdvice;
  BbClose.Caption := Locale.BbClose;
end;

end.

