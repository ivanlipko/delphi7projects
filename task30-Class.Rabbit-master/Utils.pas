unit Utils;

interface

type

  TCarrotsCount = byte;
  TPositionCoordinate = byte;

  TPosition = record
    x, y : TPositionCoordinate;
  end;

  TDirection =(DirectionUp, DirectionLeft, DirectionDown, DirectionRight);

const
  MAX_CARROTSCOUNT = High(TCarrotsCount);
  MAX_COORDINATE = High(TPositionCoordinate);


  function XYtoPosition(x, y : TPositionCoordinate): TPosition;

implementation

uses Math;

function XYtoPosition(x, y : TPositionCoordinate): TPosition;
begin
  Result.x := x;
  Result.y := y;
end;

end.
