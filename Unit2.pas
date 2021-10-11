unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmAboutMakarovCalc = class(TForm)
    Label1: TLabel;
    imgME: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Timer1: TTimer;
    lblLink: TLabel;
    procedure lblLinkClick(Sender: TObject);
    procedure lblLinkMouseLeave(Sender: TObject);
    procedure lblLinkMouseEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure imgMEClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    clicks: Word;
    currs: String;
  end;

var
  frmAboutMakarovCalc: TfrmAboutMakarovCalc;

implementation

{$R *.dfm}

procedure TfrmAboutMakarovCalc.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  clicks := 0;
  Caption := 'О программе';
  Close;
end;

procedure TfrmAboutMakarovCalc.imgMEClick(Sender: TObject);
var
  i: Word;
begin
  for i := 1 to 3 do
  begin
    Sleep(100);
    Beep;
  end;
  inc(clicks);
  if clicks = 3 then
  begin
    currs := '   Анализатор математических выражений. Разработчик: Макаров М.М. Дата создания: 13 февраля 2006 года.';
    Timer1.Enabled := True;
  end;
end;

procedure TfrmAboutMakarovCalc.lblLinkClick(Sender: TObject);
begin
  WinExec('explorer.exe http://SystemHalt.org', SW_SHOW);
end;

procedure TfrmAboutMakarovCalc.lblLinkMouseEnter(Sender: TObject);
begin
  lblLink.Font.Style := [fsBold];
  lblLink.Font.Color := clRed;
  Cursor := crHandpoint;
end;

procedure TfrmAboutMakarovCalc.lblLinkMouseLeave(Sender: TObject);
begin
  lblLink.Font.Style := [fsBold, fsUnderline];
  lblLink.Font.Color := clBlue;
  Cursor := crDefault;
end;

procedure TfrmAboutMakarovCalc.FormCreate(Sender: TObject);
begin
  clicks := 0;
  currs := ' ';
end;

procedure TfrmAboutMakarovCalc.Timer1Timer(Sender: TObject);
var
  i: Word;
  tmp: String;
begin
  if Length(currs) > 0 then
  begin
    for i := 2 to Length(currs) do
      tmp := tmp + currs[i];
    tmp := tmp + currs[1];
    currs := tmp;
    Caption := tmp;
  end;
end;

end.
