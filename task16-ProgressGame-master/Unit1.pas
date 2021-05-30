unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    LabelLevel: TLabel;
    Label2: TLabel;
    LabelExpirience: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  Level : word;
  Expirience, MAXExpirience, SpeedExpirience : word;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Level := 0;
 Expirience := 0;
 SpeedExpirience := 5;
 MAXExpirience := trunc( exp(Level + 2) ) ;
 LabelExpirience.Caption := IntToStr(Expirience) + '/' + IntToStr(MAXExpirience);
 ProgressBar1.Max := MAXExpirience;
 Randomize;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Expirience := Expirience + random(SpeedExpirience);
 if Expirience >= MAXExpirience then begin
  Level := Level + 1;
  Expirience := 0;
  SpeedExpirience := SpeedExpirience + Level ;
  MAXExpirience := trunc( exp(Level + 2) );
  ProgressBar1.Max := MAXExpirience;
 end;

 LabelLevel.Caption := IntToStr(Level);
 LabelExpirience.Caption := IntToStr(Expirience) + '/' + IntToStr(MAXExpirience);
 ProgressBar1.Position := Expirience;
end;

end.
