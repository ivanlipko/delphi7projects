unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button2: TButton;
    Timer1: TTimer;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses UMultFilm;

{$R *.dfm}

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Caption := IntToStr(x) + '=' + IntToStr(y);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  UMInit(Image1.Canvas, GetTickCount);
  Timer1.Enabled := True;
  
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if UMFrame(GetTickCount)
    then Timer1.Enabled := false;
end;

end.
