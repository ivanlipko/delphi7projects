program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  MCalc in 'MCalc.pas';

var
  DynamicCalculator : TCalculator;

begin
  { TODO -oUser -cConsole Main : Insert code here }

  Writeln;
  Writeln('===============================================================*');
  Writeln(' Calculator. 2014.01.01. Lipko Ivan. Class TCalculator example |');
  Writeln;

  Writeln('Sum 4,3 via Calculator.SumValues = ' + Floattostr(Calculator.SumValues(4,3)) );
  Writeln('Result via Calculator.valueResult = ' + Floattostr(Calculator.valueResult) );
  Writeln;

  DynamicCalculator := TCalculator.Create;

  Writeln('Sum 4,3 via DynamicCalculator.SumValues = ' + Floattostr(DynamicCalculator.SumValues(4,3)) );
  Writeln('Result via DynamicCalculator.valueResult = ' + Floattostr(DynamicCalculator.valueResult) );
  Writeln;
  
  DynamicCalculator.Free;

  Writeln('                                                               |');
  Writeln('===============================================================*');

  readln;
end.
