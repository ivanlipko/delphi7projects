unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ComCtrls, ToolWin, StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Close1: TMenuItem;
    Edit1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Help1: TMenuItem;
    PageControl1: TPageControl;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ImageList1: TImageList;
    ToolButton9: TToolButton;
    FontDialog1: TFontDialog;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ToolButton10: TToolButton;
    Undo1: TMenuItem;
    Font1: TMenuItem;
    procedure New1Click(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
   M = 10;
var
  Form1: TForm1;
   TabSheets: array [0..M] of TTabSheet;
   RichEdits: array [0..M] of TRichEdit;
  TabsCount : Byte = 0;

implementation

{$R *.dfm}

procedure TForm1.New1Click(Sender: TObject);
begin
   TabSheets[TabsCount] := TTabSheet.Create(PageControl1); // владельцем TabSheets[TabsCount] €вл€тс€ PageControl1
   TabSheets[TabsCount].Caption := 'New Tab Sheet';
   TabSheets[TabsCount].PageControl := PageControl1; // «акладка находитс€ на PageControl1

   // владельцем RichEdits[TabsCount] €вл€тс€ TabSheets[TabsCount]
   RichEdits[TabsCount] := TRichEdit.Create(TabSheets[TabsCount]);  // Create(Form1)
   with RichEdits[TabsCount] do begin
       Visible := true;
       Align := alClient;             // размещаем по всему размеру родительского окна
       Name := 'RichEdit'+IntToStr(PageControl1.PageCount);
       ScrollBars := ssVertical;
       Text:='';
       Parent := TabSheets[TabsCount];  // RichEdits[TabsCount] находитс€ на TabSheets[TabsCount]
    end;
    PageControl1.ActivePageIndex := PageControl1.PageCount - 1;
   TabsCount := TabsCount + 1;
end;

procedure TForm1.Undo1Click(Sender: TObject);
begin
  RichEdits[PageControl1.ActivePageIndex].Undo;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex < 0 then exit;
  if SaveDialog1.Execute
    then RichEdits[ PageControl1.ActivePageIndex ].Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    New1Click(Sender);
    RichEdits[ PageControl1.ActivePageIndex ].Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex < 0 then exit;
  PageControl1.Pages[ PageControl1.ActivePageIndex ].Free
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
  if FontDialog1.Execute then
    with RichEdits[ PageControl1.ActivePageIndex ].SelAttributes do begin
      Color := FontDialog1.Font.Color;
      Name := FontDialog1.Font.Name;
      Size := FontDialog1.Font.Size;
      Style := FontDialog1.Font.Style;    
    end;
  RichEdits[PageControl1.ActivePageIndex ].SetFocus;
end;

procedure TForm1.Help1Click(Sender: TObject);
begin
  case MessageDlg('Hi! My name is Ivan' + #13 + 'Sevastopol, scrimers@mail.ru' + #13 + 'Do you want to mail me?', mtInformation, [mbYes, mbNo], 0) of
    mrYes : ShowMessage('Good friend!') ;
    mrNo : ShowMessage('Bye!') ;
  end;
end;

end.


