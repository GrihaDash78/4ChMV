object F1_2: TF1_2
  Left = 200
  Top = 146
  Caption = #1057#1095#1105#1090' '#1087#1086' '#1092#1086#1088#1084#1091#1083#1077
  ClientHeight = 360
  ClientWidth = 600
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
  object Formula: TImage
    Left = 179
    Top = 25
    Width = 105
    Height = 105
    Align = alCustom
    Picture.Data = {
      0954474946496D6167654749463839613300310077003121FE1C536F66747761
      72653A204D6963726F736F6674204F66666963650D0A0021F90401000000002C
      030003002C002B00848181810000000102030102030102030102030102030102
      0301020301020301020301020301020301020301020301020301020301020301
      0203010203010203010203010203010203010203010203010203010203010203
      01020301020301020305CD20100064698A677A8E6AC9B22D1AA770FBCE32EEE2
      F75CEB3F1A29B8D29988C721CFB8F329878151F4C97CC1A6B21F966ABC5E9FDA
      22344A0E37BF396E1A98CCF59435A42D19A7BED74B97D90A6D56DB6D726A7978
      59845D527385808872772A82424E8B7E5D7991916231994C9D9E9F9D65A2A3A4
      A5A6A2A0A9AAABAC8796AD948A8C7F9E715BA19F418EB2B4B3BE83AE94485652
      C57A78BB9047B63BBA2BA58CCE869A92D5C860D6D480897495C0DF3D5A75CBC3
      7358B766AD82D2EACA449C6C34E5B0F0DEAAF5DFB9FA0021003B}
    Stretch = True
  end
  object L1: TLabel
    Left = 336
    Top = 25
    Width = 34
    Height = 13
    Align = alCustom
    Caption = #1042#1074#1086#1076' X'
  end
  object L2: TLabel
    Left = 336
    Top = 90
    Width = 34
    Height = 13
    Caption = #1042#1074#1086#1076' Y'
  end
  object B1: TButton
    Left = 179
    Top = 155
    Width = 243
    Height = 70
    Caption = #1042#1067#1055#1054#1051#1053#1048#1058#1068
    TabOrder = 0
    OnClick = B1Click
  end
  object MeOut: TMemo
    Left = 8
    Top = 247
    Width = 585
    Height = 105
    Align = alCustom
    Lines.Strings = (
      #1054#1078#1080#1076#1072#1085#1080#1077' '#1074#1074#1086#1076#1072'...')
    TabOrder = 1
  end
  object E1: TEdit
    Left = 290
    Top = 44
    Width = 129
    Height = 21
    Alignment = taCenter
    TabOrder = 2
    Text = '0'
  end
  object E2: TEdit
    Left = 290
    Top = 109
    Width = 129
    Height = 21
    Alignment = taCenter
    TabOrder = 3
    Text = '0'
  end
  object MMenu: TMainMenu
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
    Left = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 48
  end
end
