unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

const
  DLL_NAME = 'dll.dll';

type
  TForm1 = class(TForm)
    EditAStatic: TEdit;
    EditBStatic: TEdit;
    EditStaticResult: TEdit;
    GroupBox1: TGroupBox;
    ButtonSumStatic: TButton;
    ButtonSubStaticInt: TButton;
    ButtonSubStaticFloat: TButton;
    GroupBox2: TGroupBox;
    ButtonLoadDLL: TButton;
    ButtonSumDynamic: TButton;
    ButtonSubDynamicInt: TButton;
    ButtonSubDynamicFloat: TButton;
    procedure ButtonSumStaticClick(Sender: TObject);
    procedure ButtonSubStaticIntClick(Sender: TObject);
    procedure ButtonSubStaticFloatClick(Sender: TObject);
    procedure ButtonLoadDLLClick(Sender: TObject);
    procedure ButtonSumDynamicClick(Sender: TObject);
    procedure ButtonSubDynamicIntClick(Sender: TObject);
    procedure ButtonSubDynamicFloatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TSum = function (a,b : integer) : integer; stdcall;
  TSubInteger = function (a,b : integer) : integer; stdcall;
  TSubFloat = function (a,b : real) : real; stdcall;
  // если не будет stdcall, то параметры будут проблемы
  //с передачей параметров и результаты работы будут не предсказуемыми


var
  Form1: TForm1;

  SumDynamic : TSum;
  SubDynamicInteger : TSubInteger;
  SubDynamicFloat : TSubFloat;

  // статическа€ загрузка функци€ из DLL:

  // функци€ называетс€ SumStatic, но в dll не такой, поэтому добавл€ю директиву name с параметром 'Sum',
  // что значит что он будет искать по имени 'Sum'.
  function SumStatic(a,b : integer) : integer; stdcall; external DLL_NAME name 'Sum';
  // функци€ называетс€ Sum, в dll така€ есть, поэтому добавл€ть директиву name не надо
  // эта процедура в программе не используетс€, но показана ради примера
  function Sum(a,b : integer) : integer; stdcall; external DLL_NAME;

  function SubStaticInteger(a,b : integer) : integer; stdcall; external DLL_NAME name 'SumIntegers';
  function SubStaticFloat(a,b : real) : real; stdcall; external DLL_NAME name 'SumFloats';

implementation

{$R *.dfm}

procedure TForm1.ButtonSumStaticClick(Sender: TObject);
var
  a, b: integer;
begin
  a := StrToInt(EditAStatic.Text);
  b := StrToInt(EditBStatic.Text);
  EditStaticResult.Text := IntToStr( SumStatic( a, b ) );
end;

procedure TForm1.ButtonSubStaticIntClick(Sender: TObject);
var
  a, b: integer;
begin
  a := StrToInt(EditAStatic.Text);
  b := StrToInt(EditBStatic.Text);
  EditStaticResult.Text := IntToStr( SubStaticInteger( a, b ) );
end;

procedure TForm1.ButtonSubStaticFloatClick(Sender: TObject);
var
  a, b: real;
begin
  a := StrToFloat(EditAStatic.Text);
  b := StrToFloat(EditBStatic.Text);
  EditStaticResult.Text := FloatToStr( SubStaticFloat( a, b ) );
end;

procedure TForm1.ButtonLoadDLLClick(Sender: TObject);
var
  LibHandle: HModule;
begin
  LibHandle := LoadLibrary(DLL_NAME);
  if LibHandle <> 0 then begin
    @SumDynamic := GetProcAddress(LibHandle, 'Sum');
    @SubDynamicInteger := GetProcAddress(LibHandle, 'SumIntegers');
    @SubDynamicFloat := GetProcAddress(LibHandle, 'SumFloats');
    if (@SumDynamic = nil)and(@SubDynamicInteger = nil)and(@SubDynamicFloat = nil)
      then ShowMessage('ќшибка загрузки dll');
  end;

  FreeLibrary(LibHandle);
end;

procedure TForm1.ButtonSumDynamicClick(Sender: TObject);
var
  a, b: integer;
begin
  a := StrToInt(EditAStatic.Text);
  b := StrToInt(EditBStatic.Text);
  EditStaticResult.Text := IntToStr( SumDynamic( a, b ) );
end;

procedure TForm1.ButtonSubDynamicIntClick(Sender: TObject);
var
  a, b: integer;
begin
  a := StrToInt(EditAStatic.Text);
  b := StrToInt(EditBStatic.Text);
  EditStaticResult.Text := IntToStr( SubDynamicInteger( a, b ) );
end;

procedure TForm1.ButtonSubDynamicFloatClick(Sender: TObject);
var
  a, b: real;
begin
  a := StrToFloat(EditAStatic.Text);
  b := StrToFloat(EditBStatic.Text);
  EditStaticResult.Text := FloatToStr( SubDynamicFloat( a, b ) );
end;

end.
