unit MCalc;

interface

uses
  SysUtils;

type
  TCalculator = class
    private
      Fresult : Real;

    public
      constructor Create;
      destructor Destroy; override;

      property valueResult : real read Fresult;

      function SumValues(Fa, Fb : Real) : Real;
      function SubValues(Fa, Fb : Real) : Real;
      function MultValues(Fa, Fb : Real) : Real;
      function DivideValues(Fa, Fb : Real) : Real;
  end;

var
  Calculator : TCalculator;

implementation

uses Math;

constructor TCalculator.Create;
begin
  Writeln('> TCalculator.Create method used. Class adress is ' + inttostr(Integer(Self)) );
  Fresult := 1;
end;

destructor TCalculator.Destroy;
begin
  inherited;
  Writeln('> TCalculator.Destroy method used. Class adress is ' + inttostr(Integer(Self)) );
end;

function TCalculator.SumValues(Fa, Fb : Real) : Real;
begin
  Fresult := Fa + Fb;
  Result := Fresult;
end;

function TCalculator.SubValues(Fa, Fb : Real) : Real;
begin
  Fresult := Fa - Fb;
  Result := Fresult;
end;

function TCalculator.MultValues(Fa, Fb : Real) : Real;
begin
  Fresult := Fa * Fb;
  Result := Fresult;
end;

function TCalculator.DivideValues(Fa, Fb : Real) : Real;
begin
  if Fb = 0 then begin
    Fresult := MaxDouble;
    Result := Fresult;
  end;
  Fresult := Fa / Fb;
  Result := Fresult;
end;


initialization

  Calculator := TCalculator.Create;

end.

git clone 
