unit UMultFilm;

interface

uses Graphics, Windows, SysUtils;


procedure UMInit(incanvas : TCanvas; timer : Cardinal);
procedure UMBackground;
procedure UMHeroFront(x, y : Word);
procedure UMHeroMove1(x, y : Word; back : boolean);
procedure UMHeroMove2(x, y : Word; back : boolean);
procedure UMCarrot(x, y : Word; size : integer = 0);
procedure UMCarrotHided(x, y : Word);

procedure UMHeroMoveAnimate(x, y : Word; timer : cardinal; back : boolean);
function UMFrame(timer : Cardinal) : boolean;

var
  TimeHeroAnimate : cardinal = 0;

implementation

var
  Canvas : TCanvas;
  TimeNow : Cardinal = 0;
  TimeStart : Cardinal = 0;


procedure UMInit(incanvas : TCanvas; timer : Cardinal);
begin
  Canvas := incanvas;
  TimeStart := timer;
end;

procedure UMLine(x1, y1, x2, y2 : Word);
begin
  with Canvas do begin
    MoveTo(x1, y1);
    LineTo(x2, y2);
  end;
end;

procedure UMBackground;
const
  arrTop : array [0..3] of TPoint = ( (x:100; y:132), (x:230;y:35), (x:365;y:132), (x:100; y:132) );
begin
  with Canvas do begin
    Pen.Color := RGB(225, 225, 225);
    Brush.Color := RGB(125, 225, 225);
    Rectangle(0,0,640,480);
  // grass
    Pen.Width := 1;
    Pen.Color := RGB(185, 185, 35);
    Brush.Color := RGB(185, 185, 35);
    Rectangle(0,315,640,335);

    Pen.Color := RGB(135, 145, 35);
    Brush.Color := RGB(135, 145, 35);
    Rectangle(0,325,640,480);

  // home
    Pen.Width := 4;
    Pen.Color := RGB(225, 75, 35);
    Brush.Color := RGB(215, 105, 35);
    Rectangle(140,135,330,317);
    //window
    Brush.Color := RGB(15, 105, 235);
    Rectangle(160,180,250,250);
    //door
    Brush.Color := RGB(205, 105, 55);
    Rectangle(270,200,320,315);
    //top
    Pen.Color := RGB(225, 75, 35);
    Polyline(arrTop);
    Brush.Color := RGB(255, 105, 35);
    FloodFill(200, 100, Pen.Color, fsBorder);

  end;
end;

procedure UMHeroFront(x, y : Word);
begin
  with Canvas do begin
    Pen.Width := 1 ;
    Pen.Color := RGB(185, 180, 185);
    Brush.Color := RGB(245, 245, 235);

    //ear left
    Ellipse(x+12, y-85, x+20, y-60);
    //ear right
    Ellipse(x+24, y-85, x+33, y-60);
    //body
    Ellipse(x+5, y-45, x+40, y);
    //leg left
    Ellipse(x, y-15, x+15, y);
    //leg right
    Ellipse(x+30, y-15, x+45, y);
    //head
    Ellipse(x+10, y-65, x+35, y-40);
    //eyes
    Pen.Width := 2 ;
    UMLine(x+20, y-58, x+16, y-59);
    UMLine(x+25, y-58, x+29, y-59);
  end;
end;

procedure UMHeroMove1(x, y : Word; back : boolean);
begin
  with Canvas do begin
    Pen.Width := 1 ;
    Pen.Color := RGB(185, 180, 185);
    Brush.Color := RGB(245, 245, 235);

    if back then begin
      //hv
      Ellipse(x+22, y-25, x+35, y-15);
      //ear left
      Ellipse(x+15, y-85, x+21, y-60);
    end else begin
      //hv
      Ellipse(x-2, y-25, x+5, y-15);
      //ear left
      Ellipse(x+5, y-85, x+12, y-60);
    end;
    //leg left
    Ellipse(x, y-15, x+15, y);
    //body
    Ellipse(x+3, y-45, x+25, y-5);
    //leg right
    Ellipse(x+15, y-15, x+30, y);
    //head
    Ellipse(x+5, y-65, x+25, y-40);
    //eyes
    Pen.Width := 2 ;
    if back
      then UMLine(x+11, y-58, x+14, y-57)
        else UMLine(x+20, y-58, x+16, y-59);
  end;
end;

procedure UMHeroMove2(x, y : Word; back : boolean);
begin
  with Canvas do begin
    Pen.Width := 1 ;
    Pen.Color := RGB(185, 180, 185);
    Brush.Color := RGB(245, 245, 235);

    if back then begin
      //hv
      Ellipse(x+21, y-23, x+34, y-15);
      //ear left
      Ellipse(x+15, y-82, x+21, y-60);
    end else begin
      //hv
      Ellipse(x-2, y-23, x+5, y-15);
      //ear left
      Ellipse(x+5, y-82, x+12, y-60);
    end;
    //leg right
    Ellipse(x+15, y-15, x+30, y);
    //body
    Ellipse(x+3, y-45, x+25, y-5);
    //leg left
    Ellipse(x, y-15, x+15, y);
    //head
    Ellipse(x+5, y-65, x+25, y-40);

    Pen.Width := 2 ;
    //eyes
    if back
      then UMLine(x+10, y-58, x+14, y-57)
        else UMLine(x+21, y-58, x+16, y-57);
  end;
end;

procedure UMHeroMoveAnimate(x, y : Word; timer : cardinal; back : boolean);
begin
  if timer-TimeHeroAnimate < 150 then begin
    UMHeroMove1(x,y, back);
  end else begin
    UMHeroMove2(x,y, back);
    if timer-TimeHeroAnimate >= 300 then
      TimeHeroAnimate := timer;
  end;
end;

procedure UMCarrot(x, y : Word; size : integer = 0);
var
 arrTop : array [0..2] of TPoint;
begin
  with Canvas do begin
    Pen.Width := 1 ;
    Pen.Color := RGB(205, 40, 55);
    Brush.Color := RGB(205, 50, 55);

    //body
    arrTop[0].X := x;
    arrTop[0].Y := y;
    arrTop[1].X := x+20;
    arrTop[1].Y := y;
    arrTop[2].X := x+10;
    arrTop[2].Y := y-30+size;
    Polygon(arrTop);

    //hv
    Pen.Color := RGB(80, 190, 75);
    UMLine(x+10,y, x,y+5);
    UMLine(x+10,y, x+3,y+10);
    UMLine(x+10,y, x+7,y+15);
    UMLine(x+10,y, x+10,y+10);
    UMLine(x+10,y, x+14,y+13);
    UMLine(x+10,y, x+17,y+22);
  end;
end;

procedure UMCarrotHided(x, y : Word);
var
 arrTop : array [0..2] of TPoint;
begin
  with Canvas do begin
    Pen.Width := 1 ;
    Pen.Color := RGB(205, 40, 55);
    Brush.Color := RGB(205, 50, 55);

    //body
    arrTop[0].X := x;
    arrTop[0].Y := y-5;
    arrTop[1].X := x+20;
    arrTop[1].Y := y-5;
    arrTop[2].X := x+10;
    arrTop[2].Y := y;
    Polygon(arrTop);

    //hv
    Pen.Color := RGB(80, 190, 75);
    UMLine(x+10,y-5, x,y-35);
    UMLine(x+10,y-5, x+3,y-40);
    UMLine(x+10,y-5, x+7,y-45);
    UMLine(x+10,y-5, x+10,y-50);
    UMLine(x+10,y-5, x+14,y-47);
    UMLine(x+10,y-5, x+17,y-38);
  end;
end;

function UMFrame(timer : Cardinal) : boolean;
var
  heroposition : TPoint;
  timeshift : Cardinal;

begin
  timeshift := timer - TimeStart ;
  UMBackground;

  if timeshift < 2000 then begin
    UMCarrotHided(560, 323);
  end else begin
    if timeshift < 4000 then begin
      UMHeroFront(275, 320);
      UMCarrotHided(560, 323);
      TimeHeroAnimate := timer;
    end else begin
      if timeshift < 8000 then begin
        heroposition.x := trunc (275 + (550 - 275) * (timeshift - 4000)/ 4000);
        heroposition.y := 320;
        UMHeroMoveAnimate(heroposition.x, heroposition.y, timeshift, false);
        UMCarrotHided(560, 323);
      end else begin
        if timeshift < 10000 then begin
          UMHeroFront(550, 320);
          UMCarrotHided(560, 323);
        end else begin
          if timeshift < 10500 then begin
            UMHeroFront(550, 320);
            UMCarrotHided(560, 320);
          end else begin
            if timeshift < 11000 then begin
              UMHeroFront(550, 320);
              UMCarrotHided(560, 317);
            end else begin
              if timeshift < 11500 then begin
                UMHeroFront(550, 320);
                UMCarrotHided(560, 320);
              end else begin
                if timeshift < 12000 then begin
                  UMHeroFront(550, 320);
                  UMCarrotHided(560, 317);
                end else begin
                  if timeshift < 12500 then begin
                    UMHeroFront(550, 320);
                    UMCarrotHided(560, 317);
                  end else begin
                    if timeshift < 14000 then begin
                      UMHeroFront(550, 320);
                      heroposition.y := trunc (310 + (290 - 310) * (timeshift - 12500)/ 1000);
                      UMCarrot(565, heroposition.y, trunc(310-heroposition.y) );
                    end else begin
                      if timeshift < 18000 then begin
                        heroposition.x := trunc (550 + (275 - 550) * (timeshift - 14000)/ 4000);
                        heroposition.y := 320;
                        UMHeroMoveAnimate(heroposition.x, heroposition.y, timeshift, true);
                      end else begin
                        if timeshift < 20000
                          then UMHeroFront(275, 320)
                            else begin
                              Result := true;
                              exit;
                            end;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  // statistic
  //Canvas.TextOut(10, 5, inttostr(timeshift));

  Result := false;
end;

end.



position = star_point + (end_point - start_point) * ( (t - t_start)/ t_length )
