object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  ActiveControl = btnEnviar
  ClientHeight = 297
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 247
    Width = 242
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 4
    Padding.Top = 4
    Padding.Right = 4
    Padding.Bottom = 4
    TabOrder = 0
    DesignSize = (
      242
      50)
    object btnEnviar: TBitBtn
      Left = 184
      Top = 2
      Width = 55
      Height = 45
      Hint = 'Fecha a Janela'
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ModalResult = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      TabOrder = 0
      OnClick = btnEnviarClick
    end
  end
  object cpgMenus: TCategoryPanelGroup
    Left = 0
    Top = 0
    Width = 242
    Height = 247
    VertScrollBar.Tracking = True
    VertScrollBar.Visible = False
    Align = alClient
    Color = clWhite
    GradientBaseColor = 16250871
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 1
    object cpConsulta: TCategoryPanel
      Top = 215
      Height = 30
      Caption = 'Consulta'
      Collapsed = True
      TabOrder = 0
      OnExpand = cpCadastroExpand
      ExpandedHeight = 188
    end
    object cpProcesso: TCategoryPanel
      Top = 185
      Height = 30
      Caption = 'Processo'
      Collapsed = True
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      OnExpand = cpCadastroExpand
      ExpandedHeight = 188
    end
    object cpCadastro: TCategoryPanel
      Top = 0
      Height = 185
      Caption = 'Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExpand = cpCadastroExpand
    end
  end
end
