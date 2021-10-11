unit MyDeque;
////////////////////////////////////////////////////////////////////////////////
//Дек                                                                         //
//Разработчик: Макаров М.М.                                                   //
//Дата создания: 11 февраля 2006 года                                         //
//Delphi 7                                                                    //
////////////////////////////////////////////////////////////////////////////////
interface

type
  TElement = class
  public
    s: String;
    prev, next: TElement;
    constructor Create;
  end;

  TStringProc = procedure (const s: String);

  TMyDeque = class
  private
    listsize: Word;
    left, right: TElement;
  public
    constructor Create;
    destructor Destroy;override;
    procedure Clear;

    procedure Push_Left(const s: String);
    procedure Push_Right(const s: String);
    function Pop_Left: String;
    function Pop_Right: String;
    function RightValue: String;
    function LeftValue: String;

    procedure ForEach(proc: TStringProc);
    procedure ForEachBack(proc: TStringProc);

    property Size: Word read listsize;
  end;

implementation

constructor TElement.Create;
begin
  s := '';
  next := nil;
  prev := nil;
end;

////////////////////////////////////////////////////////////////////////////////

constructor TMyDeque.Create;
begin
  listsize := 0;
  Clear;
end;

procedure TMyDeque.Clear;
begin
  while size > 0 do
    Pop_Right;
  left := nil;
  right := nil;
end;

destructor TMyDeque.Destroy;
begin
  Clear;
  Inherited;
end;

procedure TMyDeque.Push_Left(const s: String);
var
  tmp: TElement;
begin
  if size = 0 then
  begin
    left := TElement.Create;
    right := left;
    left.s := s;
  end else begin
    tmp := left;
    left := TElement.Create;
    left.s := s;
    left.next := tmp;
    tmp.prev := left;
  end;
  inc(listsize);
end;

procedure TMyDeque.Push_Right(const s: String);
var
  tmp: TElement;
begin
  if size = 0 then
  begin
    left := TElement.Create;
    right := left;
    left.s := s;
  end else begin
    tmp := right;
    right := TElement.Create;
    right.s := s;
    right.prev := tmp;
    tmp.next := right;
  end;
  inc(listsize);
end;

function TMyDeque.Pop_Left: String;
var
  tmp: TElement;
begin
  Result := '';
  if size > 0 then
  begin
    Result := left.s;
    if left.next <> nil then
      left.next.prev := nil;
    tmp := left.next;
    left.Free;
    left := tmp;
    dec(listsize);
  end;
end;

function TMyDeque.Pop_Right: String;
var
  tmp: TElement;
begin
  Result := '';
  if size > 0 then
  begin
    Result := right.s;
    if right.prev <> nil then
      right.prev.next := nil;
    tmp := right.prev;
    right.Free;
    right := tmp;
    dec(listsize);
  end;
end;

procedure TMyDeque.ForEach(proc: TStringProc);
var
  curr: TElement;
begin
  if Assigned(proc) then
  begin
    curr := left;
    if size > 0 then
      repeat
        proc(curr.s);
        curr := curr.next;
      until curr = nil;
  end;
end;

procedure TMyDeque.ForEachBack(proc: TStringProc);
var
  curr: TElement;
begin
  if Assigned(proc) then
  begin
    curr := right;
    if size > 0 then
      repeat
        proc(curr.s);
        curr := curr.prev;
      until curr = nil;
  end;
end;

function TMyDeque.RightValue: String;
begin
  if right <> nil then
    Result := right.s
  else
    Result := '';
end;

function TMyDeque.LeftValue: String;
begin
  if left <> nil then
    Result := left.s
  else
    Result := '';
end;

end.
