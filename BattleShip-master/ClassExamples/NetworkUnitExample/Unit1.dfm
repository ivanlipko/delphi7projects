object Form2: TForm2
  Left = 294
  Top = 191
  Width = 625
  Height = 444
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StartServerSocket: TButton
    Left = 0
    Top = 0
    Width = 129
    Height = 25
    Caption = 'StartServerSocket'
    TabOrder = 0
    OnClick = StartServerSocketClick
  end
  object Edit1: TEdit
    Left = 152
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button2: TButton
    Left = 0
    Top = 24
    Width = 129
    Height = 25
    Caption = 'sendStartShipSetting'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 152
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 0
    Top = 48
    Width = 129
    Height = 25
    Caption = 'sendHit'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 0
    Top = 72
    Width = 129
    Height = 25
    Caption = 'sendMiss'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit3: TEdit
    Left = 152
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 152
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Button4: TButton
    Left = 0
    Top = 96
    Width = 129
    Height = 25
    Caption = 'sendYouWin'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Edit5: TEdit
    Left = 152
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object Button5: TButton
    Left = 304
    Top = 0
    Width = 121
    Height = 25
    Caption = 'StartClientSocket'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Edit6: TEdit
    Left = 432
    Top = 0
    Width = 81
    Height = 21
    TabOrder = 11
  end
  object Edit7: TEdit
    Left = 520
    Top = 0
    Width = 65
    Height = 21
    TabOrder = 12
  end
  object Button6: TButton
    Left = 304
    Top = 24
    Width = 121
    Height = 25
    Caption = 'sendShipLocations'
    TabOrder = 13
    OnClick = Button6Click
  end
  object Edit8: TEdit
    Left = 432
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 14
  end
  object Button7: TButton
    Left = 304
    Top = 48
    Width = 121
    Height = 25
    Caption = 'sendShotLocation'
    TabOrder = 15
    OnClick = Button7Click
  end
  object Edit9: TEdit
    Left = 432
    Top = 48
    Width = 81
    Height = 21
    TabOrder = 16
  end
  object Edit10: TEdit
    Left = 520
    Top = 48
    Width = 65
    Height = 21
    TabOrder = 17
  end
  object Button8: TButton
    Left = 304
    Top = 72
    Width = 121
    Height = 25
    Caption = 'sendStartGame'
    TabOrder = 18
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 0
    Top = 120
    Width = 129
    Height = 25
    Caption = 'sendGo'
    TabOrder = 19
    OnClick = Button9Click
  end
  object Edit11: TEdit
    Left = 152
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 20
  end
end
