object Form1: TForm1
  Left = 254
  Top = 124
  Width = 749
  Height = 520
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    OnMouseMove = Image1MouseMove
  end
  object Button2: TButton
    Left = 648
    Top = 16
    Width = 75
    Height = 25
    Caption = #1057#1084#1086#1090#1088#1077#1090#1100
    TabOrder = 0
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 664
    Top = 88
  end
end
