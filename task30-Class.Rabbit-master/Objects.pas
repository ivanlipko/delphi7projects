unit Objects;

interface

uses Utils,
  CRT32;

type
  TCell = class
//    private
//      FPosition : TPosition;
    public
      constructor Create(pos : TPosition); virtual; abstract;
      procedure draw; virtual; abstract;
      procedure setPosition(pos : TPosition); virtual; abstract;
      function getPosition : TPosition; virtual; abstract;
  end;

  TRabbit = class(TCell)
    private
      FPosition : TPosition;
      FaimPosition : TPosition;
      FcarrotsCount : TCarrotsCount;
      FName : String;
    public
      constructor Create(pos : TPosition); override;
      procedure draw; override;
      procedure setPosition(pos : TPosition); override;
      function getPosition : TPosition; override;
      procedure setAimPosition(pos : TPosition);
      function getAimPosition : TPosition;
      procedure setCarrotsCount(count : TCarrotsCount);
      function getCarrotsCount : TCarrotsCount;
      procedure setName(name : String);
      function getName : String;
  end;

  TWall = class(TCell)
    private
      FPosition : TPosition;
    public
      constructor Create(pos : TPosition); override;
      procedure draw; override;
      procedure setPosition(pos : TPosition); override;
      function getPosition : TPosition; override;
  end;

  TFreeCell = class(TCell)
    private
      FPosition : TPosition;
    public
      constructor Create(pos : TPosition); override;
      procedure draw; override;
      procedure setPosition(pos : TPosition); override;
      function getPosition : TPosition; override;
  end;

  TCarrot = class(TCell)
    private
      FPosition : TPosition;
    public
      constructor Create(pos : TPosition); override;
      procedure draw; override;
      procedure setPosition(pos : TPosition); override;
      function getPosition : TPosition; override;  
  end;

implementation


{ TRabbit }

constructor TRabbit.Create(pos: TPosition);
begin
  FPosition := pos;
end;

procedure TRabbit.draw;
begin
  inherited;
  TextColor(14);
  Write('R');
end;

function TRabbit.getAimPosition: TPosition;
begin
  Result := FaimPosition;
end;

function TRabbit.getCarrotsCount: TCarrotsCount;
begin
  Result := FcarrotsCount;
end;

function TRabbit.getName: String;
begin
  Result := FName;
end;

function TRabbit.getPosition: TPosition;
begin
  Result := FPosition;
end;

procedure TRabbit.setAimPosition(pos: TPosition);
begin
  FaimPosition := pos;
end;

procedure TRabbit.setCarrotsCount(count: TCarrotsCount);
begin
  FcarrotsCount := count;
end;

procedure TRabbit.setName(name: String);
begin
  FName := name;
end;

procedure TRabbit.setPosition(pos: TPosition);
begin
  inherited;
  FPosition := pos;
end;

{ TWall }

constructor TWall.Create(pos: TPosition);
begin
  inherited;
  FPosition := pos;
end;

procedure TWall.draw;
begin
  inherited;
  TextColor(10);
  Write('W');
end;

function TWall.getPosition: TPosition;
begin
  Result := FPosition;
end;

procedure TWall.setPosition(pos: TPosition);
begin
  inherited;
  FPosition := pos;
end;

{ TCarrot }

constructor TCarrot.Create(pos: TPosition);
begin
  inherited;
  FPosition := pos;
end;

procedure TCarrot.draw;
begin
  inherited;
  TextColor(13);
  Write('C');
end;

function TCarrot.getPosition: TPosition;
begin
  Result := FPosition;
end;

procedure TCarrot.setPosition(pos: TPosition);
begin
  inherited;
  FPosition := pos;
end;

{ TFreeCell }

constructor TFreeCell.Create(pos: TPosition);
begin
  inherited;
  FPosition := pos;
end;

procedure TFreeCell.draw;
begin
  inherited;
  TextColor(9);
  Write('.');
end;

function TFreeCell.getPosition: TPosition;
begin
  Result := FPosition;
end;

procedure TFreeCell.setPosition(pos: TPosition);
begin
  inherited;
  FPosition := pos;
end;

end.
