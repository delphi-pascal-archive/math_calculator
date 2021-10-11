unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmReg = class(TForm)
    Button1: TButton;
    txtReg: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReg: TfrmReg;

implementation

{$R *.dfm}

procedure TfrmReg.Button1Click(Sender: TObject);
var
  f: TextFile;
begin
  if txtReg.Text = 'TADNXZBEEPGSOHJVVSFK' then
  begin
    AssignFile(f, 'C:\mclc18reg.txt');
    ReWrite(f);
    WriteLn(f, 'REGISTERED');
    CloseFile(f);
  end else
    MessageBox(Handle, '¬ведЄн неправильный код', 'ќшибка', MB_OK or MB_ICONERROR);
  Close;
end;

end.
