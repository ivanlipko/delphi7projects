object Form1: TForm1
  Left = 254
  Top = 124
  Width = 425
  Height = 257
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
  object EditAStatic: TEdit
    Left = 32
    Top = 16
    Width = 89
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object EditBStatic: TEdit
    Left = 144
    Top = 16
    Width = 89
    Height = 21
    TabOrder = 1
    Text = '32'
  end
  object EditStaticResult: TEdit
    Left = 248
    Top = 16
    Width = 89
    Height = 21
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 56
    Width = 193
    Height = 121
    Caption = #1057#1090#1072#1090#1080#1095#1077#1089#1082#1080#1077' '#1092#1091#1085#1082#1094#1080#1080
    TabOrder = 3
    object ButtonSumStatic: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = #1057#1091#1084#1084#1072
      TabOrder = 0
      OnClick = ButtonSumStaticClick
    end
    object ButtonSubStaticInt: TButton
      Left = 16
      Top = 56
      Width = 97
      Height = 25
      Caption = #1056#1072#1079#1085#1086#1089#1090#1100' '#1094#1077#1083#1099#1093
      TabOrder = 1
      OnClick = ButtonSubStaticIntClick
    end
    object ButtonSubStaticFloat: TButton
      Left = 16
      Top = 88
      Width = 137
      Height = 25
      Caption = #1056#1072#1079#1085#1086#1089#1090#1100' '#1074#1077#1097#1077#1089#1090#1074#1077#1085#1085#1099#1093
      TabOrder = 2
      OnClick = ButtonSubStaticFloatClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 216
    Top = 56
    Width = 185
    Height = 153
    Caption = #1044#1080#1085#1072#1084#1080#1095#1077#1089#1082#1080#1077' '#1092#1091#1082#1085#1094#1080#1080
    TabOrder = 4
    object ButtonLoadDLL: TButton
      Left = 8
      Top = 24
      Width = 67
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonLoadDLLClick
    end
    object ButtonSumDynamic: TButton
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Caption = #1057#1091#1084#1084#1072
      TabOrder = 1
      OnClick = ButtonSumDynamicClick
    end
    object ButtonSubDynamicInt: TButton
      Left = 8
      Top = 88
      Width = 97
      Height = 25
      Caption = #1056#1072#1079#1085#1086#1089#1090#1100' '#1094#1077#1083#1099#1093
      TabOrder = 2
      OnClick = ButtonSubDynamicIntClick
    end
    object ButtonSubDynamicFloat: TButton
      Left = 8
      Top = 120
      Width = 137
      Height = 25
      Caption = #1056#1072#1079#1085#1086#1089#1090#1100' '#1074#1077#1097#1077#1089#1090#1074#1077#1085#1085#1099#1093
      TabOrder = 3
      OnClick = ButtonSubDynamicFloatClick
    end
  end
end
