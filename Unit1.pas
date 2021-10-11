unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MyDeque, MyParser, Buttons, ToolWin, ComCtrls,
  ExtCtrls, Menus, XPMan;

type
  TfrmMakarovCalc = class(TForm)
    Label2: TLabel;
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    rgRad: TRadioButton;
    rbDeg: TRadioButton;
    Panel2: TPanel;
    Panel3: TPanel;
    btnPI: TSpeedButton;
    btnE: TSpeedButton;
    Panel4: TPanel;
    btnExp: TSpeedButton;
    btnLn: TSpeedButton;
    btnLog: TSpeedButton;
    btnSqrt: TSpeedButton;
    btnAbs: TSpeedButton;
    btnCeil: TSpeedButton;
    btnFloor: TSpeedButton;
    btnNeg: TSpeedButton;
    txtInput: TRichEdit;
    btnRound: TSpeedButton;
    btnDegToRad: TSpeedButton;
    btnRadToDeg: TSpeedButton;
    Panel5: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    txtConst: TRichEdit;
    txtResult: TRichEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    btnSinH: TSpeedButton;
    btnCosH: TSpeedButton;
    btnTgH: TSpeedButton;
    btnCtgH: TSpeedButton;
    btnArcSinH: TSpeedButton;
    btnArcCosH: TSpeedButton;
    btnArcTgH: TSpeedButton;
    btnArcCtgH: TSpeedButton;
    btnSecH: TSpeedButton;
    btnCosecH: TSpeedButton;
    btnArcSecH: TSpeedButton;
    btnArcCosecH: TSpeedButton;
    Panel6: TPanel;
    btnSin: TSpeedButton;
    btnCos: TSpeedButton;
    btnTg: TSpeedButton;
    btnCtg: TSpeedButton;
    btnArcSin: TSpeedButton;
    btnArcCos: TSpeedButton;
    btnArcTg: TSpeedButton;
    btnArcCtg: TSpeedButton;
    btnSec: TSpeedButton;
    btnCosec: TSpeedButton;
    btnArcSec: TSpeedButton;
    btnArcCosec: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Panel7: TPanel;
    btn7: TSpeedButton;
    btn8: TSpeedButton;
    btn9: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn0: TSpeedButton;
    btnunminus: TSpeedButton;
    btndot: TSpeedButton;
    btnplus: TSpeedButton;
    btnminus: TSpeedButton;
    btnmul: TSpeedButton;
    btndiv: TSpeedButton;
    btnxpower2: TSpeedButton;
    btnxpowery: TSpeedButton;
    btnbrackr: TSpeedButton;
    btnbrackl: TSpeedButton;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    XPManifest1: TXPManifest;
    btnCalc: TSpeedButton;
    btnClear: TSpeedButton;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N3: TMenuItem;
    RadToDeg1: TMenuItem;
    DegToRad1: TMenuItem;
    Round1: TMenuItem;
    Neg1: TMenuItem;
    Floor1: TMenuItem;
    Ceil1: TMenuItem;
    Abs1: TMenuItem;
    Sqrt1: TMenuItem;
    Log1: TMenuItem;
    Ln1: TMenuItem;
    Exp1: TMenuItem;
    N5: TMenuItem;
    ArcCosec1: TMenuItem;
    ArcSec1: TMenuItem;
    Cosec1: TMenuItem;
    Sec1: TMenuItem;
    ArcCtg1: TMenuItem;
    ArcTg1: TMenuItem;
    ArcCos1: TMenuItem;
    ArcSin1: TMenuItem;
    Ctg1: TMenuItem;
    g1: TMenuItem;
    Cos1: TMenuItem;
    Sin1: TMenuItem;
    N6: TMenuItem;
    ArcCosecH1: TMenuItem;
    ArcSecH1: TMenuItem;
    CosecH1: TMenuItem;
    SecH1: TMenuItem;
    ArcCtgH1: TMenuItem;
    ArcTgH1: TMenuItem;
    ArcCosH1: TMenuItem;
    ArcSinH1: TMenuItem;
    CtgH1: TMenuItem;
    gH1: TMenuItem;
    CosH1: TMenuItem;
    SinH1: TMenuItem;
    N7: TMenuItem;
    e27182818284590451: TMenuItem;
    pi31415926535897931: TMenuItem;
    mnuReg: TMenuItem;
    procedure nagTimerTimer(Sender: TObject);
    procedure mnuRegClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure txtInputChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExpClick(Sender: TObject);
    procedure btnPIClick(Sender: TObject);
    procedure exp1Click(Sender: TObject);
    procedure txtInputKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtInputMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    parser: TMyParser;
    deque: TMyDeque;
    b: Boolean;
    MyBuff: String;
    CurrResult: Extended;
    Memory: Extended;
    nag: Integer;
    procedure AddFunc(const s: String);
  end;

var
  frmMakarovCalc: TfrmMakarovCalc;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TfrmMakarovCalc.btnCalcClick(Sender: TObject);
var
  x: Extended;
begin
  txtResult.Text := '';
  parser := TMyParser.Create(txtInput.Text, txtConst.Text);
  if parser.Parse(deque) then
  begin
    if parser.Calc(x, rbDeg.Checked) then
    begin
      txtResult.Text := FloatToStr(x);
      CurrResult := x;
    end else
      txtResult.Text := parser.Errors;
  end else
    txtResult.Text := parser.Errors;
end;

procedure TfrmMakarovCalc.N9Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMakarovCalc.nagTimerTimer(Sender: TObject);
begin
  inc(nag);

  if nag >= 60 then
  begin
    nag := 0;
    WinExec('explorer.exe http://systemhalt.org/mcalc18.php', SW_SHOW);
  end;
end;

procedure TfrmMakarovCalc.N4Click(Sender: TObject);
begin
  frmAboutMakarovCalc.Left := (Screen.Width - frmAboutMakarovCalc.Width) div 2;
  frmAboutMakarovCalc.Top := (Screen.Height - frmAboutMakarovCalc.Height) div 2;
  Beep;
  frmAboutMakarovCalc.ShowModal;
end;

procedure TfrmMakarovCalc.AddFunc(const s: String);
var
  tmp: String;
  i: Word;
  pos: Word;
begin
  pos := txtInput.SelStart;
  for i := 1 to txtInput.SelStart do
    tmp := tmp + txtInput.Text[i];
  tmp := tmp + ' ' + s + '(';

  if txtInput.SelLength > 0 then
    for i := txtInput.SelStart+1 to txtInput.SelStart + txtInput.SelLength do
      tmp := tmp + txtInput.Text[i];

  tmp := tmp + ') ';

  if txtInput.SelStart < Length(txtInput.Text) then
    for i := txtInput.SelStart + txtInput.SelLength + 1 to Length(txtInput.Text) do
      tmp := tmp + txtInput.Text[i];
  txtInput.Text := tmp;
  txtInput.SelStart := pos + Length(s) + 2;
end;

procedure TfrmMakarovCalc.txtInputChange(Sender: TObject);
var
  tmp: TRichEdit;
  i: Word;
  s: String;
  pos: Word;
begin
  if b then
  begin
    b := False;
    tmp := Sender as TRichEdit;
    pos := tmp.SelStart;
    s := tmp.Text;

    tmp.Lines.BeginUpdate;
    for i := 1 to Length(s) do
    begin
      tmp.SelStart := i-1;
      tmp.SelLength := 1;
      if (s[i] = '(') or (s[i] = ')') or (s[i] = '[') or (s[i] = ']') then
        tmp.SelAttributes.Color := clTeal
      else if (s[i] >= '0') and (s[i] <= '9') then
        tmp.SelAttributes.Color := clMaroon
      else if ((s[i] >= 'a') and (s[i] <= 'z')) or ((s[i] >= 'A') and (s[i] <= 'Z')) or (s[i] = '_') then
        tmp.SelAttributes.Color := clBlack
      else if (s[i] = '+') or (s[i] = '-') or (s[i] = '*') or (s[i] = '/') or (s[i] = '^') or (s[i] = '=') then
        tmp.SelAttributes.Color := clBlue
      else tmp.SelAttributes.Color := clRed;
    end;
    tmp.Lines.EndUpdate;

    tmp.SelStart := pos;
    b := True;
  end;
end;

procedure TfrmMakarovCalc.FormCreate(Sender: TObject);
begin
  b := True;
  MyBuff := '';
  CurrResult := 0;
  Memory := 0;
end;

procedure TfrmMakarovCalc.btnExpClick(Sender: TObject);
begin
  AddFunc(LowerCase((Sender as TSpeedButton).Caption));
end;

procedure TfrmMakarovCalc.btnPIClick(Sender: TObject);
var
  tmp: String;
  i: Word;
  pos: Word;
begin
  pos := txtInput.SelStart;
  for i := 1 to txtInput.SelStart do
    tmp := tmp + txtInput.Text[i];
  tmp := tmp + (Sender as TSpeedButton).Caption;
  if txtInput.SelStart < Length(txtInput.Text) then
    for i := txtInput.SelStart + 1 to Length(txtInput.Text) do
      tmp := tmp + txtInput.Text[i];
  txtInput.Text := tmp;
  txtInput.SelStart := pos + Length((Sender as TSpeedButton).Caption);
end;

procedure TfrmMakarovCalc.exp1Click(Sender: TObject);
var
  s, tmp: String;
  i: Word;
begin
  s := '';
  i := 2;
  tmp := (Sender as TMenuItem).Caption;
  repeat
    s := s + tmp[i];
    inc(i);
  until tmp[i] = ' ';
  AddFunc(LowerCase(s));
end;

procedure TfrmMakarovCalc.txtInputKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 120 then
    btnCalc.Click;
end;

procedure TfrmMakarovCalc.txtInputMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y); 
end;

procedure TfrmMakarovCalc.N10Click(Sender: TObject);
var
  i: Word;
begin
  MyBuff := '';
  for i := txtInput.SelStart + 1 to txtInput.SelStart + txtInput.SelLength do
    MyBuff := MyBuff + txtInput.Text[i];
end;

procedure TfrmMakarovCalc.N12Click(Sender: TObject);
var
  i: Word;
  tmp: String;
  pos: Word;
begin
  if Length(MyBuff) > 0 then
  begin
    pos := txtInput.SelStart;
    tmp := '';
    for i := 1 to txtInput.SelStart do
      tmp := tmp + txtInput.Text[i];
    tmp := tmp + MyBuff;
    for i := txtInput.SelStart + 1 to Length(txtInput.Text) do
      tmp := tmp + txtInput.Text[i];
    txtInput.Text := tmp;
    txtInput.SelStart := pos + Length(MyBuff);
  end;
end;

procedure TfrmMakarovCalc.mnuRegClick(Sender: TObject);
begin
  frmReg.ShowModal;
end;

procedure TfrmMakarovCalc.N14Click(Sender: TObject);
begin
  btnCalc.Click;
end;

procedure TfrmMakarovCalc.N15Click(Sender: TObject);
begin
  btnClear.Click;
end;

procedure TfrmMakarovCalc.N11Click(Sender: TObject);
var
  i: Word;
  tmp: String;
  pos: Word;
begin
  MyBuff := '';
  if txtInput.SelLength > 0 then
  begin
    tmp := '';
    pos := txtInput.SelStart;
    for i := 1 to txtInput.SelStart do
      tmp := tmp + txtInput.Text[i];
    for i := txtInput.SelStart + 1 to txtInput.SelStart + txtInput.SelLength do
      MyBuff := MyBuff + txtInput.Text[i];
    for i := txtInput.SelStart + txtInput.SelLength + 1 to Length(txtInput.Text) do
      tmp := tmp + txtInput.Text[i];
    txtInput.Text := tmp;
    txtInput.SelStart := pos;
  end;
end;

procedure TfrmMakarovCalc.btnClearClick(Sender: TObject);
begin
  CurrResult := 0;
  txtInput.Text := '';
  txtConst.Text := '';
  txtResult.Text := '';
end;

procedure TfrmMakarovCalc.SpeedButton5Click(Sender: TObject);
begin
  Memory := 0;
end;

procedure TfrmMakarovCalc.SpeedButton4Click(Sender: TObject);
begin
  CurrResult := Memory;
  txtResult.Text := 'Результат:  ' + FloatToStr(CurrResult);
end;

procedure TfrmMakarovCalc.SpeedButton3Click(Sender: TObject);
begin
  Memory := Memory - CurrResult;
end;

procedure TfrmMakarovCalc.SpeedButton2Click(Sender: TObject);
begin
  Memory := Memory + CurrResult;
end;

end.
