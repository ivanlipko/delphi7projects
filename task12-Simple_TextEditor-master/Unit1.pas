unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

const
  EXE_TITLE = 'Simple TextEditor';

type
  TForm1 = class(TForm)
    MemoText: TMemo;
    ImageSave: TImage;
    ImageOpen: TImage;
    LabelMemoPosLine: TLabel;
    LabelMemoPosCol: TLabel;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ImageNew: TImage;
    procedure MemoTextMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MemoTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ImageSaveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageOpenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ImageNewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageOpenMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageSaveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageNewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  // для защиты от лишних перегрузок изображений
  imgStateNew : Boolean = False;
  imgStateOpen : Boolean = False;
  imgStateSave : Boolean = False;

implementation

{$R *.dfm}

procedure TForm1.MemoTextMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  LabelMemoPosLine.Caption := IntToStr( MemoText.CaretPos.Y );
  LabelMemoPosCol.Caption := IntToStr( MemoText.CaretPos.X );
end;

procedure TForm1.MemoTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  LabelMemoPosLine.Caption := IntToStr( MemoText.CaretPos.Y );
  LabelMemoPosCol.Caption := IntToStr( MemoText.CaretPos.X );
end;

procedure TForm1.ImageSaveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if SaveDialog1.Execute
    then MemoText.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.ImageOpenMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if OpenDialog1.Execute
    then begin
      MemoText.Lines.LoadFromFile(OpenDialog1.FileName);
      Caption := EXE_TITLE + ' - ' + OpenDialog1.FileName;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := EXE_TITLE;
end;

procedure TForm1.ImageNewMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if not imgStateNew then begin
    ImageNew.Picture.LoadFromFile('ico_new_move.jpg');
      imgStateNew := True;
  end;
  imgStateOpen := False;
  imgStateSave := False;
  ImageOpen.Picture.LoadFromFile('ico_open.jpg');
  ImageSave.Picture.LoadFromFile('ico_save.jpg');
end;

procedure TForm1.ImageOpenMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if not imgStateOpen then begin
    ImageOpen.Picture.LoadFromFile('ico_open_move.jpg');
      imgStateOpen := True;
  end;
  imgStateNew := False;
  imgStateSave := False;
  ImageNew.Picture.LoadFromFile('ico_new.jpg');
  ImageSave.Picture.LoadFromFile('ico_save.jpg');
end;

procedure TForm1.ImageSaveMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if not imgStateSave then begin
      ImageSave.Picture.LoadFromFile('ico_save_move.jpg');
      imgStateSave := True;
  end;
  imgStateNew := False;
  imgStateOpen := False;
  ImageNew.Picture.LoadFromFile('ico_new.jpg');
  ImageOpen.Picture.LoadFromFile('ico_open.jpg');
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgStateNew := False;
  imgStateOpen := False;
  imgStateSave := False;
  ImageNew.Picture.LoadFromFile('ico_new.jpg');
  ImageOpen.Picture.LoadFromFile('ico_open.jpg');
  ImageSave.Picture.LoadFromFile('ico_save.jpg');
end;

procedure TForm1.ImageNewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MemoText.Lines.Text := '';
end;

end.
