object FrmCadastroPadrao: TFrmCadastroPadrao
  Left = 0
  Top = 0
  Caption = 'Cadastro Padr'#227'o'
  ClientHeight = 302
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesktopCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 246
    Height = 252
    ActivePage = tbPrincipal
    Align = alClient
    TabOrder = 0
    object tbPrincipal: TTabSheet
      Caption = 'Pricipal'
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 252
    Width = 246
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 4
    Padding.Top = 4
    Padding.Right = 4
    Padding.Bottom = 4
    TabOrder = 1
    DesignSize = (
      246
      50)
    object btnCancelar: TBitBtn
      Left = 186
      Top = 2
      Width = 55
      Height = 45
      Hint = 'Clique para cancelar a opera'#231#227'o'
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      Layout = blGlyphTop
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      Spacing = -1
      TabOrder = 0
    end
    object btnConfirmar: TBitBtn
      Left = 131
      Top = 2
      Width = 55
      Height = 45
      Hint = 'Clique para Salvar'
      Anchors = [akTop, akRight]
      Caption = 'Confirmar'
      Layout = blGlyphTop
      TabOrder = 1
    end
  end
end
