program Makarov;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmMakarovCalc},
  MyParser in 'MyParser.pas',
  MyArr in 'MyArr.pas',
  Unit2 in 'Unit2.pas' {frmAboutMakarovCalc},
  Unit3 in 'Unit3.pas' {frmReg};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Makarov::Calculator 1.9';
  Application.CreateForm(TfrmMakarovCalc, frmMakarovCalc);
  Application.CreateForm(TfrmAboutMakarovCalc, frmAboutMakarovCalc);
  Application.CreateForm(TfrmReg, frmReg);
  Application.Run;
end.
