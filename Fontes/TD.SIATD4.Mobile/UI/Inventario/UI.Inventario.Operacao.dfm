inherited frmInventario: TfrmInventario
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'frmInventario'
  ClientHeight = 300
  ClientWidth = 242
  OnShow = FormShow
  ExplicitWidth = 258
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  object pnLetreiro: TPanel [0]
    Left = 0
    Top = 0
    Width = 242
    Height = 24
    Align = alTop
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object lblLetreiro: TLabel
      Left = 6
      Top = 5
      Width = 151
      Height = 13
      Alignment = taCenter
      Caption = 'SIATD MOBILE - Invent'#225'rio'
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 24
    Width = 242
    Height = 226
    Align = alClient
    Caption = 'Panel1'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object pgPrincipal: TPageControl
      Left = 1
      Top = 1
      Width = 240
      Height = 224
      ActivePage = tbsContagem
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpBottom
      OnChange = pgPrincipalChange
      object tbsContagem: TTabSheet
        Caption = 'Contagem'
        object Label1: TLabel
          Left = 3
          Top = -1
          Width = 74
          Height = 13
          Caption = 'Usu'#225'rio Logado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNumeroOperacao: TLabel
          Left = 164
          Top = 10
          Width = 60
          Height = 19
          Caption = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblNumeroOperacaoClick
        end
        object Label2: TLabel
          Left = 169
          Top = -1
          Width = 47
          Height = 13
          Caption = 'Opera'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edUsuario: TREdit
          Left = 3
          Top = 12
          Width = 156
          Height = 19
          Color = clWhite
          Enabled = False
          TabOrder = 0
          Text = ''
          MaskType = mtNone
          MandatoryField = False
          PersistentField = False
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object pnContagem: TPanel
          Left = 3
          Top = 34
          Width = 225
          Height = 125
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 1
          object lblObservacao: TLabel
            Left = 5
            Top = 81
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblQuantidade: TLabel
            Left = 160
            Top = 40
            Width = 56
            Height = 13
            Caption = 'Quantidade'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblProduto: TLabel
            Left = 5
            Top = 40
            Width = 151
            Height = 13
            AutoSize = False
            Caption = 'C'#243'digo'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLocalizacao: TLabel
            Left = 3
            Top = 2
            Width = 151
            Height = 13
            AutoSize = False
            Caption = 'Localiza'#231#227'o'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edProduto: TREdit
            Left = 3
            Top = 56
            Width = 151
            Height = 19
            AutoSelect = False
            CharCase = ecUpperCase
            TabOrder = 0
            Text = ''
            OnExit = edProdutoExit
            MaskType = mtNone
            MandatoryField = False
            PersistentField = False
            SaveLiteralCharacters = False
            DecimalPlaces = 2
          end
          object edQuantidade: TREdit
            Left = 160
            Top = 55
            Width = 55
            Height = 19
            TabOrder = 1
            Text = '0,00'
            OnExit = edQuantidadeExit
            MaskType = mtDouble
            MandatoryField = False
            PersistentField = False
            SaveLiteralCharacters = True
            Value = '0,00'
            DecimalPlaces = 2
          end
          object edObservacao: TREdit
            Left = 5
            Top = 96
            Width = 210
            Height = 19
            TabOrder = 2
            Text = ''
            MaskType = mtNone
            MandatoryField = False
            PersistentField = False
            SaveLiteralCharacters = False
            DecimalPlaces = 2
          end
          object edLocalizacao: TREdit
            Left = 3
            Top = 17
            Width = 212
            Height = 19
            AutoSelect = False
            CharCase = ecUpperCase
            TabOrder = 3
            Text = ''
            OnExit = edLocalizacaoExit
            MaskType = mtNone
            MandatoryField = False
            PersistentField = False
            SaveLiteralCharacters = False
            DecimalPlaces = 2
          end
        end
        object btnEnviar: TBitBtn
          Left = 3
          Top = 160
          Width = 83
          Height = 35
          Caption = 'Enviar   Informa'#231#245'es '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          WordWrap = True
          OnClick = btnEnviarClick
        end
        object btnFinalizar: TBitBtn
          Left = 156
          Top = 161
          Width = 74
          Height = 35
          Caption = 'Finalizar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnFinalizarClick
        end
        object btnAbandonar: TBitBtn
          Left = 84
          Top = 161
          Width = 72
          Height = 35
          Caption = 'Abandonar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnAbandonarClick
        end
      end
      object tbListaEnderecos: TTabSheet
        Caption = 'Lista de Produtos'
        ImageIndex = 1
        object Label3: TLabel
          Left = 1
          Top = 3
          Width = 84
          Height = 13
          Caption = 'Conferir Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object gdTarefa: TRGrid
          Left = 0
          Top = 26
          Width = 230
          Height = 144
          ColCount = 2
          DefaultRowHeight = 18
          DrawingStyle = gdsClassic
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          TabOrder = 0
          OnClick = gdTarefaClick
          OnKeyUp = gdTarefaKeyUp
          MultiSelect = False
          MasterDetailType = mdMaster
          ColWidths = (
            11
            64)
          RowHeights = (
            18
            18)
        end
        object btnInformacaoProduto: TBitBtn
          Left = 0
          Top = 171
          Width = 100
          Height = 25
          Caption = 'Inf. do Produto'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnInformacaoProdutoClick
        end
        object btnZerarContador: TBitBtn
          Left = 101
          Top = 171
          Width = 100
          Height = 25
          Caption = 'Zerar Contador'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnZerarContadorClick
        end
        object edConferirProduto: TREdit
          Left = 91
          Top = 1
          Width = 143
          Height = 19
          Color = clWhite
          TabOrder = 3
          Text = ''
          OnExit = edConferirProdutoExit
          MaskType = mtNone
          MandatoryField = False
          PersistentField = False
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object Panel5: TPanel
          Left = 202
          Top = 172
          Width = 27
          Height = 23
          BevelKind = bkSoft
          BevelOuter = bvNone
          BevelWidth = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object Label17: TLabel
            Left = 566
            Top = 90
            Width = 16
            Height = 13
            Caption = '****'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label18: TLabel
            Left = 579
            Top = 70
            Width = 36
            Height = 13
            Caption = '000000'
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object lblCont: TLabel
            Left = 1
            Top = 3
            Width = 21
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '000'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = cl3DDkShadow
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  object pnlBotoes: TPanel [2]
    Left = 0
    Top = 250
    Width = 242
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = True
    Padding.Left = 4
    Padding.Top = 4
    Padding.Right = 4
    Padding.Bottom = 4
    ParentCtl3D = False
    TabOrder = 2
    object btnFechar: TBitBtn
      Left = 185
      Top = 3
      Width = 55
      Height = 45
      Hint = 'Fecha a Janela'
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
      OnClick = btnFecharClick
    end
  end
  inherited ErrorProvider1: TErrorProvider
    Left = 0
    Top = 256
  end
  object tpVerificaTarefa: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tpVerificaTarefaTimer
    Left = 88
    Top = 254
  end
  object tpLetreiro: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tpLetreiroTimer
    Left = 144
    Top = 254
  end
end
