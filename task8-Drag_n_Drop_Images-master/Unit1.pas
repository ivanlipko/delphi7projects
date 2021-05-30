unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image9: TImage;
    Image8: TImage;
    Image7: TImage;
    Image12: TImage;
    Image11: TImage;
    Image10: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  down : boolean = False;
  img_x, img_y : word;
  CountClicks : Byte = 0;
  TimerNow, TimerStart : Cardinal;

implementation

{$R *.dfm}

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  down := true;
  img_x := X;
  img_y := Y;
  (Sender as TImage).BringToFront;
  if CountClicks = 0 then begin
    Timer1.Enabled := true;
    TimerStart := GetTickCount();
  end;
  CountClicks := CountClicks + 1;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  down := false;

  case (Sender as TImage).Tag of
    1: if ( abs((Sender as TImage).Top -  6) < 36 ) and
        ( abs((Sender as TImage).Left -  443) < 36 )
          then begin
            (Sender as TImage).Top := 6;
            (Sender as TImage).Left := 443;
          end;
    2: if ( abs((Sender as TImage).Top -  6) < 36 ) and
        ( abs((Sender as TImage).Left -  584) < 36 )
          then begin
            (Sender as TImage).Top := 6;
            (Sender as TImage).Left := 584;
          end;
    3: if ( abs((Sender as TImage).Top -  6) < 36 ) and
        ( abs((Sender as TImage).Left -  726) < 36 )
          then begin
            (Sender as TImage).Top := 6;
            (Sender as TImage).Left := 726;
          end;
    4: if ( abs((Sender as TImage).Top -  192) < 36 ) and
        ( abs((Sender as TImage).Left -  443) < 36 )
          then begin
            (Sender as TImage).Top := 192;
            (Sender as TImage).Left := 443;
          end;
    5: if ( abs((Sender as TImage).Top -  192) < 36 ) and
        ( abs((Sender as TImage).Left -  584) < 36 )
          then begin
            (Sender as TImage).Top := 192;
            (Sender as TImage).Left := 584;
          end;
    6: if ( abs((Sender as TImage).Top -  192) < 36 ) and
        ( abs((Sender as TImage).Left -  726) < 36 )
          then begin
            (Sender as TImage).Top := 192;
            (Sender as TImage).Left := 726;
          end;
  end;

  if ( abs(Image1.Top -  6) < 36 ) and
     ( abs(Image1.Left -  443) < 36 ) and
     ( abs(Image2.Top -  6) < 36 ) and
     ( abs(Image2.Left -  584) < 36 ) and
     ( abs(Image3.Top -  6) < 36 ) and
     ( abs(Image3.Left -  726) < 36 ) and
     ( abs(Image4.Top -  192) < 36 ) and
     ( abs(Image4.Left -  443) < 36 ) and
     ( abs(Image5.Top -  192) < 36 ) and
     ( abs(Image5.Left -  584) < 36 ) and
     ( abs(Image6.Top -  192) < 36 ) and
     ( abs(Image6.Left -  726) < 36 ) 
     then begin
       Timer1.Enabled := false;
       ShowMessage('Кликов ' + IntToStr( CountClicks ) + #13 + 'Время: ' + FloatToStr( (TimerNow - TimerStart) / 1000 ));
     end;

end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if down then
  with (Sender as TImage) do begin
    Left := Left + X - img_x;
    Top := Top + Y - img_y;
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  TimerNow := GetTickCount();
  Label2.Caption := FloatToStr( (TimerNow - TimerStart) / 1000 );
  Label1.Caption := IntToStr( CountClicks );
end;

end.

new code from me
