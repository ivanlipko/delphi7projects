unit Field;

interface

uses
  Objects,
  Utils,
  CRT32;

type
  TField = class
    private
      Objects : array[0..9, 0..9] of TCell;
      Rabbit : TRabbit;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Generate;
      procedure Draw;
      procedure Update;
      function setRabbitDirection(direct : TDirection) : Boolean;

  end;

implementation

uses Classes, SysUtils;

{ TField }

constructor TField.Create;
begin
  inherited;

  Randomize;

  Generate;
end;

destructor TField.Destroy;
var
  i, j : Byte;
begin

  for i:=0 to 9 do     //x
    for j:=0 to 9 do   //y
      Objects[i,j].Free;
  Rabbit.Free;

  inherited;
end;

procedure TField.Draw;
var
  i, j : Byte;
begin
  for i:=0 to 9 do     //x
    for j:=0 to 9 do begin   //y
      GotoXY(i+1,j+1);
      Objects[i,j].draw;
    end;
  GotoXY(Rabbit.getPosition.x+1,Rabbit.getPosition.y+1);
  Rabbit.draw;
end;

procedure TField.Generate;
var
  i, j : Byte;
  objtype : Byte;
begin

  for i:=0 to 9 do     //x
    for j:=0 to 9 do   //y
      Objects[i,j].Free;
  Rabbit.Free;

  for i:=0 to 9 do          //x
    for j:=0 to 9 do begin  //y
      objtype:=Random(10);
      case objtype of
         0    : Objects[i,j]:= TWall.Create(XYtoPosition(i,j)) ;
         1..7 : Objects[i,j]:= TFreeCell.Create(XYtoPosition(i,j)) ;
         8,9  : Objects[i,j]:= TCarrot.Create(XYtoPosition(i,j)) ;
      end;
    end;
  Rabbit := TRabbit.Create( XYtoPosition(Random(10), Random(10)) );
end;

function TField.setRabbitDirection(direct : TDirection): Boolean;
var
  pos : TPosition;
begin
  pos := Rabbit.getPosition;
  case direct of
    DirectionUp:    pos.y := pos.y - 1 ;
    DirectionLeft:  pos.x := pos.x - 1 ;
    DirectionDown:  pos.y := pos.y + 1 ;
    DirectionRight: pos.x := pos.x + 1 ;
  end;
  if Objects[pos.x, pos.y] is TWall
    then Result := False
      else begin
        Rabbit.setPosition(pos);
        Result := True;
      end;
end;

procedure TField.Update;
begin
  if Objects[Rabbit.getPosition.x, Rabbit.getPosition.y] is TCarrot then begin
    Objects[Rabbit.getPosition.x, Rabbit.getPosition.y].Free;
    Objects[Rabbit.getPosition.x, Rabbit.getPosition.y] := TFreeCell.Create(Rabbit.getPosition);

    //Rabbit.graduateUp;
  end;

end;

end.
 