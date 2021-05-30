program game;

{$APPTYPE CONSOLE}

uses
//  SysUtils,
  Crt32,
  Objects in 'Objects.pas',
  Utils in 'Utils.pas',
  Field in 'Field.pas';

var
  GameField : TField;

  FLAG_GAMEEXIT : boolean = false;
  FLAG_NOERRORS : boolean = false;

  pressedKey : Char;

  i:byte;
begin
  GameField := TField.Create;

  // onLoad default parametrs

  // first screen

  // main circle
  repeat

     // G U I
     GameField.Draw;


     // K e y b o a r d

     GotoXY(60,22);
     pressedKey := ReadKey;

     FLAG_NOERRORS := false;
     case pressedKey of
      #27 : FLAG_GAMEEXIT := true;
      'w' : FLAG_NOERRORS := GameField.setRabbitDirection(DirectionUp) ;//up
      's' : FLAG_NOERRORS := GameField.setRabbitDirection(DirectionDown);//down
      'a' : FLAG_NOERRORS := GameField.setRabbitDirection(DirectionLeft);//left
      'd' : FLAG_NOERRORS := GameField.setRabbitDirection(DirectionRight);//right
     end;

     if FLAG_NOERRORS
      then GameField.Update;

     {  debug
     TextColor(15);
     GotoXY(49,19);
     write('pressedKey = ' + inttostr(ord(pressedKey)) );
     GotoXY(49,20);
     write('FLAG_NOERRORS = ' + booltostr(FLAG_NOERRORS) );
     }
  until FLAG_GAMEEXIT;

  // finish

  GameField.Free;

  ClrScr;
  WriteStrXY(3,4,Pchar('Good bye!'),9);

  GotoXY(1,10);

  for i:=0 to 255 do begin
    TextColor(i);
    Write('.');
  end;

  Readln;
end.



