object F3_19: TF3_19
  Left = 200
  Top = 146
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1076#1083#1103' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103' '#1074#1088#1077#1084#1077#1085#1080' '#1074#1089#1090#1088#1077#1095#1080' 2-'#1093' '#1090#1077#1083' '#1089' '#1091#1089#1082#1086#1088#1077#1085#1080#1077#1084
  ClientHeight = 400
  ClientWidth = 650
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object L1V: TLabel
    Left = 80
    Top = 33
    Width = 121
    Height = 13
    Alignment = taCenter
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1074' '#171#1084'/'#1089#187
    Color = clMenuHighlight
    ParentColor = False
  end
  object L1A: TLabel
    Left = 80
    Top = 87
    Width = 121
    Height = 13
    Alignment = taCenter
    Caption = #1059#1089#1082#1086#1088#1077#1085#1080#1077' '#1074' '#171#1084'/'#1089'^2'#187
  end
  object L2A: TLabel
    Left = 449
    Top = 87
    Width = 121
    Height = 13
    Alignment = taCenter
    Caption = #1059#1089#1082#1086#1088#1077#1085#1080#1077' '#1074' '#171#1084'/'#1089'^2'#187
  end
  object L2V: TLabel
    Left = 449
    Top = 33
    Width = 121
    Height = 13
    Alignment = taCenter
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1074' '#171#1084'/'#1089#187
  end
  object L1: TLabel
    Left = 80
    Top = 149
    Width = 121
    Height = 21
    Alignment = taCenter
    Caption = #1051#1077#1074#1086#1077' '#1090#1077#1083#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object L2: TLabel
    Left = 460
    Top = 149
    Width = 96
    Height = 21
    Alignment = taCenter
    Caption = #1055#1088#1072#1074#1086#1077' '#1090#1077#1083#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LS: TLabel
    Left = 264
    Top = 66
    Width = 121
    Height = 13
    Alignment = taCenter
    Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077
  end
  object B1: TButton
    Left = 235
    Top = 176
    Width = 180
    Height = 49
    Align = alCustom
    Caption = #1042#1067#1055#1054#1051#1053#1048#1058#1068
    TabOrder = 0
    OnClick = B1Click
  end
  object MeOut: TMemo
    Left = 8
    Top = 256
    Width = 637
    Height = 136
    Align = alCustom
    Lines.Strings = (
      #1054#1078#1080#1076#1072#1085#1080#1077' '#1074#1074#1086#1076#1072'...')
    TabOrder = 1
  end
  object E1V: TEdit
    Left = 80
    Top = 52
    Width = 121
    Height = 21
    Alignment = taCenter
    Color = 13751807
    TabOrder = 2
    Text = '0'
  end
  object E2V: TEdit
    Left = 449
    Top = 52
    Width = 121
    Height = 21
    Alignment = taCenter
    Color = 16699333
    TabOrder = 3
    Text = '0'
  end
  object ES: TEdit
    Left = 264
    Top = 79
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 4
    Text = '0'
  end
  object E1A: TEdit
    Left = 80
    Top = 106
    Width = 121
    Height = 21
    Alignment = taCenter
    Color = 13751807
    TabOrder = 5
    Text = '0'
  end
  object E2A: TEdit
    Left = 449
    Top = 106
    Width = 121
    Height = 21
    Alignment = taCenter
    Color = 16699333
    TabOrder = 6
    Text = '0'
  end
  object MMenu: TMainMenu
    Left = 264
    object NOpen: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = NOpenClick
    end
    object NSave: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
      object NSaveInput: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1074#1086#1076
        OnClick = NSaveInputClick
      end
      object NSaveMemo: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1090#1095#1105#1090
        OnClick = NSaveMemoClick
      end
    end
    object NInfo: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      OnClick = NInfoClick
    end
    object NExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = NExitClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 288
  end
  object SaveDialog1: TSaveDialog
    Left = 320
  end
end
