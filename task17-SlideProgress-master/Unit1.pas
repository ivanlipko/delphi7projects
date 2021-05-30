unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Gauges, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Gauge1: TGauge;
    TrackBar1: TTrackBar;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Gauge2: TGauge;
    LabelLevel: TLabel;
    procedure TrackBar1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  AllStep = 50;  
var
  Form1: TForm1;
  StepAim : Word = 0;
  StepSpeed : Smallint = 1;
  StepDim : byte = 10;

implementation

{$R *.dfm}

procedure TForm1.TrackBar1Change(Sender: TObject);
begin

  Timer1.Enabled := true;
  StepAim := TrackBar1.Position;
  Gauge2.Progress := TrackBar1.Position;
  StepDim := 10;
//  LabelLevel.Caption := inttostr(StepAim);

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

  Gauge1.Progress :=  Gauge1.Progress + StepSpeed;

  StepSpeed := (StepAim - Gauge1.Progress) div StepDim;
  if (StepSpeed = 0)and(StepDim > 1) then
    StepDim := StepDim - 1;
{    if StepAim > Gauge1.Progress
      then StepSpeed := 1
        else StepSpeed := -1;  }

  if abs(StepAim - Gauge1.Progress) < 1 then begin
    StepSpeed := 1;
    Timer1.Enabled := false;
    Gauge1.Progress := StepAim;
  end;
end;

end.
