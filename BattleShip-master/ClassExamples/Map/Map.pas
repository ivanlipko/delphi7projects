unit Map;

interface
Type
  TCoord = record
   x : integer;
   y : integer;
  end;
  TSArr = array[1..40] of byte;


  TMap = class
   private
    pole:array[0..11, 0..11]of integer;
    Ships:array[1..4]of string;
    function PlaceCheck(pos1 : TCoord; pos2 : TCoord):Boolean;
    procedure PlaceDead(pos1 : TCoord; pos2 : TCoord);
   public
    constructor Create;
    destructor Destroy; override;
    function PlaceShip(pos1 : TCoord; pos2 : TCoord):Boolean;
    procedure PlaceMiss(pos: TCoord);
    function Draw(pos : TCoord):integer;
    procedure PlaceHit(pos : TCoord);
    function CountShips(pos, pos1 : TCoord):Boolean;
    function GetAllCoord: TBuf;
    procedure AllArrangement;
  End;

var
  Cship:array[1..4, 0..1]of integer;

implementation

uses SysUtils;

//5 - �������
//3 - ������
//4 - �����
//2 - ������ ���������

constructor TMap.Create;
var i, j:integer;
begin
  for i:=1 to 10 do begin
    for j:=1 to 10 do begin
      pole[i,j]:=0;
    end;
  end;

  for i:=1 to 4 do begin
    for j:=0 to 1 do begin
      Cship[i,j]:=0;
    end;
  end;

//  writeln('my address'+ inttostr(integer(Self)) );

end;

destructor TMap.Destroy;
begin

  inherited;
end;

procedure TMap.PlaceMiss(pos : TCoord);
begin
  pole[pos.x, pos.y]:=3;
end;

function TMap.Draw(pos : TCoord):integer;
begin
  if (pos.x = 0) and (pos.y = 0) then begin
    pole[pos.x, pos.y]:=0;
  end;
  Result:=pole[pos.x, pos.y];
end;

procedure TMap.PlaceHit(pos: TCoord);
begin
  pole[pos.x, pos.y]:=4;
end;

function TMap.PlaceShip(pos1, pos2: TCoord):Boolean;
var diff:integer;
begin
{������������ ��������, ����� ���� ������ �������(� ���� ����� 5)
� ������ pole}

  Result:=PlaceCheck(pos1,pos2);
  if Result then
    Result:=CountShips(pos1, pos2);

  if Result then begin

  PlaceDead(pos1, pos2);
  pole[pos1.x, pos1.y]:=5;
  pole[pos2.x, pos2.y]:=5;
  if pos1.x = pos2.x then begin
    diff:=pos1.y-pos2.y;
    case diff of
      -3:begin
           pole[pos1.x, pos1.y+1]:=5;
           pole[pos1.x, pos1.y+2]:=5;
           ships[4]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x)+IntToStr(pos1.y+1)+'$'
           +IntToStr(pos1.x)+IntToStr(pos1.y+2)+'$'
           +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
         end;
      -2:begin
           pole[pos1.x, pos1.y+1]:=5;
           ships[3]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x)+IntToStr(pos1.y+1)+'$'
           +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
         end;
      -1:ships[2]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
         +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
       0:ships[1]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$';
       1:ships[2]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
         +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
       2:begin
           pole[pos1.x, pos1.y-1]:=5;
           ships[3]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x)+IntToStr(pos1.y-1)+'$'
           +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
         end;
       3:begin
           pole[pos1.x, pos1.y-1]:=5;
           pole[pos1.x, pos1.y-2]:=5;
           ships[4]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x)+IntToStr(pos1.y-1)+'$'
           +IntToStr(pos1.x)+IntToStr(pos1.y-2)+'$'
           +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
         end;
    end;
  end else begin
    diff:=pos1.x-pos2.x;
    case diff of
      -3:begin
           pole[pos1.x+1, pos1.y]:=5;
           pole[pos1.x+2, pos1.y]:=5;
           ships[4]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x+1)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x+2)+IntToStr(pos1.y)+'$'
           +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
         end;
      -2:begin
           pole[pos1.x+1, pos1.y]:=5;
           ships[3]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x+1)+IntToStr(pos1.y)+'$'
           +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
         end;
      -1:ships[2]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
         +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
       0:ships[1]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$';
       1:ships[2]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
         +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
       2:begin
           pole[pos1.x-1, pos1.y]:=5;
           ships[3]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x-1)+IntToStr(pos1.y)+'$'
           +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
         end;
       3:begin
           pole[pos1.x-1, pos1.y]:=5;
           pole[pos1.x-2, pos1.y]:=5;
           ships[4]:=IntToStr(pos1.x)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x-1)+IntToStr(pos1.y)+'$'
           +IntToStr(pos1.x-2)+IntToStr(pos1.y)+'$'
           +IntToStr(pos2.x)+IntToStr(pos2.y)+'$';
         end;
    end;

  end;
  end;

end;


function TMap.PlaceCheck(pos1, pos2: TCoord):Boolean;
var d:integer;
begin

{��������� ��������
����� �� ��������� ������� ��� ���
�.�. �� ������ �� �������� �����-���� ������}

  Result:=true;
  if pos1.x = pos2.x then begin
    if pos1.y < pos2.y then begin
      d:=pos2.y-pos1.y;
      if d < 4 then begin
        while pos1.y < pos2.y+1 do begin
          if pole[pos1.x, pos1.y] <> 0 then begin
            Result:=false;
          end;
          pos1.y:=pos1.y+1;
        end;
      end else begin
        Result:=false;
      end;

    end else begin

      d:=pos1.y-pos2.y;
      if d < 4 then begin
        while pos1.y > pos2.y-1 do begin
          if pole[pos1.x, pos1.y] <> 0 then begin
            Result:=false;
          end;
          pos1.y:=pos1.y-1;
        end;
      end else begin
        Result:=false;
      end;

    end;
  end else begin
    if pos1.x < pos2.x then begin

      d:=pos2.x-pos1.x;
      if d < 4 then begin
        while pos1.x < pos2.x+1 do begin
          if pole[pos1.x, pos1.y] > 0 then begin
            Result:=false;
          end;
          pos1.x:=pos1.x+1;
        end;
      end else begin
        Result:=false;
      end;

    end else begin

      d:=pos1.x-pos2.x;
      if d < 4 then begin
        while pos1.x > pos2.x-1 do begin
          if pole[pos1.x, pos1.y] <> 0 then begin
            Result:=false;
          end;
          pos1.x:=pos1.x-1;
        end;
      end else begin
        Result:=false;
      end;

    end;
  end;
  if pos1.x <> pos2.x then begin
    if pos1.y <> pos2.y then begin
      Result:=false;
    end;
  end;
end;

procedure TMap.PlaceDead(pos1 : TCoord; pos2 : TCoord);
var a, b:integer;
n:boolean;
begin
{����������� ����, ���� ������ ������� �������
� ���������� �� ��������}

  n:=true;
  if pos1.x = pos2.x then begin
    if pos1.y = pos2.y then begin
      n:=false;
      pole[pos1.x, pos1.y-1]:=2;
      pole[pos1.x, pos1.y+1]:=2;
      pole[pos1.x+1, pos1.y+1]:=2;
      pole[pos1.x-1, pos1.y+1]:=2;
      pole[pos1.x+1, pos1.y-1]:=2;
      pole[pos1.x-1, pos2.y-1]:=2;
      pole[pos1.x+1, pos1.y]:=2;
      pole[pos1.x-1, pos2.y]:=2;

    end;
      {pos1.y
      .
      .
      pos2.y}
    if n then begin
      if pos1.y < pos2.y then begin
        pole[pos1.x, pos1.y-1]:=2;
        pole[pos1.x, pos2.y+1]:=2;
        a:=pos1.x-1;
        b:=pos1.y-1;
        while b <> pos2.y+2 do begin
          pole[a, b]:=2;
          b:=b+1;
        end;
        a:=pos1.x+1;
        b:=pos1.y-1;
        while b <> pos2.y+2 do begin
          pole[a, b]:=2;
          b:=b+1;
        end;

      end else begin
         {pos1.y
         .
         .
         pos2.y}
        pole[pos1.x, pos1.y+1]:=2;
        pole[pos1.x, pos2.y-1]:=2;
        a:=pos1.x-1;
        b:=pos1.y+1;
        while b <> pos2.y-2 do begin
          pole[a, b]:=2;
          b:=b-1;
        end;
        a:=pos1.x+1;
        b:=pos1.y-1;
        while b <> pos2.y-2 do begin
          pole[a, b]:=2;
          b:=b-1;
        end;

      end;
    end;
  end else begin
    //pos1.x  ..  pos2.x
    if pos1.x < pos2.x then begin
      pole[pos1.x-1, pos1.y]:=2;
      pole[pos2.x+1, pos2.y]:=2;
      a:=pos1.x-1;
      b:=pos1.y-1;
      while a <> pos2.x+2 do begin
        pole[a, b]:=2;
        a:=a+1;
      end;
      a:=pos1.x-1;
      b:=pos1.y+1;
      while a <> pos2.x+2 do begin
        pole[a, b]:=2;
        a:=a+1;
      end;

    end else begin
    //pos2.x  ..  pos1.x
      pole[pos1.x+1, pos1.y+1]:=2;
      pole[pos1.x-1, pos2.y-1]:=2;
      a:=pos1.x+1;
      b:=pos1.y-1;
      while a <> pos2.x-2 do begin
        pole[a, b]:=2;
        a:=a-1;
      end;
      a:=pos1.x+1;
      b:=pos1.y+1;
      while b <> pos2.x-2 do begin
        pole[a, b]:=2;
        a:=a-1;
      end;

    end;
  end;
end;

function TMap.CountShips(pos, pos1: TCoord): Boolean;
var d:integer;
begin
{���� ����� ��������� ����������� ��������}

  Result:=True;

  if pos.x = pos1.x then begin

    if pos.y = pos1.y then begin
      if Cship[1, 1] = 5 then begin
        Result:=False;
      end else begin
        Cship[1, 0]:=Cship[1, 0]+1;
        if Cship[1, 0] = 4 then
          Cship[1, 1]:=5;
      end;
    end else begin

      if pos.y > pos1.y then begin
        d:=pos.y-pos1.y+1;
        if Cship[d, 1] = 5 then begin
          Result:=False;
        end else begin
          Cship[d, 0]:=Cship[d, 0]+1;
          if Cship[d, 0] = 5-d then
            Cship[d, 1]:=5;
        end;
      end else begin

        d:=pos1.y-pos.y+1;
        if Cship[d, 1] = 5 then begin
          Result:=False;
        end else begin
          Cship[d, 0]:=Cship[d, 0]+1;
          if Cship[d, 0] = 5-d then
            Cship[d, 1]:=5;
        end;
      end;
    end;

  end else begin

    if pos.x > pos1.x then begin
      d:=pos.x-pos1.x+1;
      if Cship[d, 1] = 5 then begin
        Result:=False;
      end else begin
        Cship[d, 0]:=Cship[d, 0]+1;
        if Cship[d, 0] = 5-d then
          Cship[d, 1]:=5;
      end;
    end else begin
      d:=pos1.x-pos.x+1;
      if Cship[d, 1] = 5 then begin
        Result:=False;
      end else begin
        Cship[d, 0]:=Cship[d, 0]+1;
        if Cship[d, 0] = 5-d then
          Cship[d, 1]:=5;
      end;
    end;
  end;
end;

function TMap.GetAllCoord: TSArr;
var i, n:integer;
res:string;
begin
  n:=1;
  Res:=ships[1]+ships[2]+ships[3]+ships[4];
  i:=pos('$',res);
  GetAllCoord[1]:=strtoint(copy(res, 1, i-1));
  delete(res, 1, i);
  n:=n+1;
  while res <> '' do begin
    i:=pos('$',res);
    GetAllCoord[n]:=strtoint(copy(res, 1, i-1));
    delete(res, 1, i);
    n:=n+1;
  end;
end;

procedure TMap.AllArrangement;
var i, j:integer;
begin
  for i:=0 to 11 do begin
    for j:=0 to 11 do begin
      if pole[i, j] = 2 then pole[i,j]:=0;
    end;
  end;
end;

end.

