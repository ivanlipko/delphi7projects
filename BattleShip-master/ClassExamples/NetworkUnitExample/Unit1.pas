unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NetworkUnit;

type
  TForm2 = class(TForm)
    StartServerSocket: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Edit2: TEdit;
    Button1: TButton;
    Button3: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Button4: TButton;
    Edit5: TEdit;
    Button5: TButton;
    Edit6: TEdit;
    Edit7: TEdit;
    Button6: TButton;
    Edit8: TEdit;
    Button7: TButton;
    Edit9: TEdit;
    Edit10: TEdit;
    Button8: TButton;
    Button9: TButton;
    Edit11: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure StartServerSocketClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Net : TNet;

implementation

uses Math;

{$R *.dfm}


procedure TForm2.FormCreate(Sender: TObject);
begin
  Net := TNet.Create; 
end;

procedure TForm2.StartServerSocketClick(Sender: TObject);
begin
  Net.startServerSocket(StrToInt(Edit1.Text));
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Net.sendStartShipSettings(StrToInt(Edit2.Text));
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Net.sendHit(StrToInt(Edit3.Text));
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Net.sendMiss(StrToInt(Edit4.Text));
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Net.sendYouWin(StrToInt(Edit5.Text));
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Net.startClientSocket(StrToInt(Edit6.Text), Edit7.Text);
end;

procedure TForm2.Button6Click(Sender: TObject);
var Arr : TSArr;
    i, j : integer;
begin
  for i := 1 to 2 do
   begin
    for j := 1 to 20 do
     begin
      Arr[i, j] := StrToInt(Edit8.Text);
     end;
   end;
  Net.sendShipLocations(Arr);
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  Net.sendShotLocation(StrToInt(Edit9.Text), StrToInt(Edit10.Text));
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  Net.sendGo(StrToInt(Edit11.Text));
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  Net.sendStartGame;
end;

end.
