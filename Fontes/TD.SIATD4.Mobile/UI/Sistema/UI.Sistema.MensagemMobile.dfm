inherited FrmMensagem: TFrmMensagem
  Caption = 'FrmMensagem'
  ClientHeight = 335
  ClientWidth = 256
  ExplicitWidth = 272
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 62
    Height = 13
    Caption = 'Mensagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtBtnSim: TBitBtn [1]
    Left = 88
    Top = 285
    Width = 55
    Height = 45
    Anchors = [akRight, akBottom]
    Caption = 'Sim'
    TabOrder = 0
    Visible = False
    OnClick = BtBtnSimClick
    ExplicitTop = 290
  end
  object BtBtnNao: TBitBtn [2]
    Left = 143
    Top = 285
    Width = 55
    Height = 45
    Anchors = [akRight, akBottom]
    Caption = 'N'#227'o'
    TabOrder = 1
    Visible = False
    OnClick = BtBtnNaoClick
    ExplicitTop = 290
  end
  object BtBtnOK: TBitBtn [3]
    Left = 198
    Top = 285
    Width = 55
    Height = 45
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    Visible = False
    OnClick = BtBtnOKClick
    ExplicitTop = 290
  end
  object Panel1: TPanel [4]
    Left = 4
    Top = 22
    Width = 248
    Height = 260
    Anchors = [akLeft, akTop, akBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitHeight = 265
    object lblDescricao: TLabel
      Left = 0
      Top = 0
      Width = 244
      Height = 227
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ExplicitWidth = 4
      ExplicitHeight = 16
    end
    object pnMensagemErro: TPanel
      Left = 0
      Top = 227
      Width = 244
      Height = 29
      Align = alBottom
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
      ExplicitTop = 232
      object mmErro: TMemo
        Left = 0
        Top = 25
        Width = 240
        Height = 0
        BevelInner = bvNone
        BevelOuter = bvNone
        BiDiMode = bdRightToLeftReadingOnly
        ParentBiDiMode = False
        TabOrder = 0
      end
      object btnErro: TButton
        Left = 0
        Top = 0
        Width = 240
        Height = 25
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = '>> ERRO'
        ParentBiDiMode = False
        TabOrder = 1
        OnClick = btnErroClick
      end
    end
  end
end
