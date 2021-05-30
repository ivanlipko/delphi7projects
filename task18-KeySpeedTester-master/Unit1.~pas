unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    MemoText: TMemo;
    MemoEnter: TMemo;
    Timer1: TTimer;
    LabelSymperSec: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelSymperMin: TLabel;
    Timer2: TTimer;
    Label1: TLabel;
    LabelErrorsCount: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel2: TPanel;
    procedure MemoEnterKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  KeyPerSec : Word = 0;
  KeyPerMin : Word = 0;
  KeyNowPos : Word = 1;
  KeyErrorsCount : Word = 0;
  KeyText  : String;

implementation

uses StrUtils;

{$R *.dfm}

procedure TForm1.MemoEnterKeyPress(Sender: TObject; var Key: Char);
var
  tempCaretPos : TPoint;
begin
  if Key = KeyText[KeyNowPos] then begin
    KeyNowPos := KeyNowPos + 1;
    KeyPerSec := KeyPerSec + 1;
    KeyPerMin := KeyPerMin + 1;

    MemoText.SelStart := KeyNowPos;
    MemoText.SelLength := 46; //выделяем ровно столько, сколько может поместиться
                              // символов в строке. Либо другое количество, чтобы
                              // было удобно перелистывать текст

  end else begin
    Key := #0;
    KeyErrorsCount := KeyErrorsCount + 1;
    LabelErrorsCount.Caption := inttostr(KeyErrorsCount);
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  LabelSymperSec.Caption := inttostr(KeyPerSec);
  KeyPerSec := 0;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  LabelSymperMin.Caption := inttostr(KeyPerMin);
  KeyPerMin := 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  KeyText := AnsiReplaceStr( MemoText.Lines.DelimitedText , '#13#10', '');
  KeyText := AnsiReplaceStr( KeyText , '","', '');
  KeyText := Copy(KeyText, 2, length(KeyText)-1);  
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MemoEnter.Enabled := True;
  MemoEnter.SetFocus;
  Timer1.Enabled := True;
  Timer2.Enabled := True;
end;

end.
