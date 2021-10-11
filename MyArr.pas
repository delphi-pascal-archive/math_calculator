unit MyArr;
////////////////////////////////////////////////////////////////////////////////
//Ассоциативный массив                                                        //
//Разработчик: Макаров М.М.                                                   //
//Дата создания: 12 февраля 2006 года                                         //
//Delphi 7                                                                    //
////////////////////////////////////////////////////////////////////////////////
interface

uses
  MyDeque, SysUtils;

type
  TMyArr = class
  private
    a, b: TMyDeque;
  public
    constructor Create;
    destructor Destroy;override;

    function IsExists(const s: String): Boolean;
    function GetValue(const s: String): Extended;
    procedure Add(const s: String; value: Extended);
  end;

implementation

constructor TMyArr.Create;
begin
  a := TMyDeque.Create;
  b := TMyDeque.Create;
end;

destructor TMyArr.Destroy;
begin
  a.Free;
  b.Free;
  Inherited;
end;

function TMyArr.IsExists(const s: String): Boolean;
var
  tmp: TMyDeque;
  ts: String;
begin
  Result := False;
  if a.Size > 0 then
  begin
    tmp := TMyDeque.Create;
    while a.Size > 0 do
    begin
      ts := a.Pop_Left;
      tmp.Push_Right(ts);
      if ts = s then
        Result := True;
    end;
    a.Free;
    a := tmp;
  end;
end;

function TMyArr.GetValue(const s: String): Extended;
var
  tmpa, tmpb: TMyDeque;
  tsa, tsb: String;
begin
  Result := 0;
  if a.Size > 0 then
  begin
    tmpa := TMyDeque.Create;
    tmpb := TMyDeque.Create;
    while a.Size > 0 do
    begin
      tsa := a.Pop_Left;
      tmpa.Push_Right(tsa);

      tsb := b.Pop_Left;
      tmpb.Push_Right(tsb);

      if s = tsa then
        Result := StrToFloat(tsb);
    end;
    a.Free;
    b.Free;
    a := tmpa;
    b := tmpb;
  end;
end;

procedure TMyArr.Add(const s: String; value: Extended);
begin
  if not IsExists(s) then
  begin
    a.Push_Right(s);
    b.Push_Right(FloatToStr(value));  
  end;
end;

end.
