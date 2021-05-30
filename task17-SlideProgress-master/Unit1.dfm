object Form1: TForm1
  Left = 254
  Top = 124
  Width = 417
  Height = 185
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 8
    Top = 64
    Width = 385
    Height = 25
    Progress = 0
  end
  object Gauge2: TGauge
    Left = 8
    Top = 32
    Width = 385
    Height = 25
    Progress = 0
  end
  object LabelLevel: TLabel
    Left = 144
    Top = 8
    Width = 132
    Height = 13
    Caption = #1055#1077#1088#1077#1090#1072#1097#1080' '#1074' '#1076#1088#1091#1075#1086#1077' '#1084#1077#1089#1090#1086
  end
  object TrackBar1: TTrackBar
    Left = 72
    Top = 96
    Width = 257
    Height = 45
    Max = 100
    Frequency = 5
    TabOrder = 0
    OnChange = TrackBar1Change
  end
  object Edit1: TEdit
    Left = 344
    Top = 96
    Width = 41
    Height = 21
    TabOrder = 1
    Text = '100'
  end
  object Edit2: TEdit
    Left = 8
    Top = 96
    Width = 41
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object Button1: TButton
    Left = 312
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 200
    Top = 112
  end
end
