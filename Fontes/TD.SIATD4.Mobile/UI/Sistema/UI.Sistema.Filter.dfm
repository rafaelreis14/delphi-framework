inherited FrmFilter: TFrmFilter
  Caption = 'FrmFilter'
  ClientHeight = 301
  ClientWidth = 242
  Font.Style = [fsBold]
  ExplicitWidth = 258
  ExplicitHeight = 340
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel [0]
    Left = 0
    Top = 249
    Width = 242
    Height = 52
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 249
    ExplicitWidth = 242
    ExplicitHeight = 52
    object Bevel3: TBevel [1]
      Left = 4
      Top = 2
      Width = 237
      Height = 2
      Shape = bsFrame
    end
    inherited btnCancelar: TBitBtn
      Left = 122
      Top = 6
      Width = 60
      Height = 41
      Caption = '&Canc.'
      ExplicitLeft = 122
      ExplicitTop = 6
      ExplicitWidth = 60
      ExplicitHeight = 41
    end
    inherited btnFiltrar: TBitBtn
      Left = 2
      Top = 6
      Width = 60
      Height = 41
      ExplicitLeft = 2
      ExplicitTop = 6
      ExplicitWidth = 60
      ExplicitHeight = 41
    end
    inherited btnSelecionar: TBitBtn
      Left = 62
      Top = 6
      Width = 60
      Height = 41
      Caption = '&Selec.'
      ExplicitLeft = 62
      ExplicitTop = 6
      ExplicitWidth = 60
      ExplicitHeight = 41
    end
    inherited btnImprimir: TBitBtn
      Left = 182
      Top = 6
      Width = 60
      Height = 41
      Caption = '&Imp.'
      ExplicitLeft = 182
      ExplicitTop = 6
      ExplicitWidth = 60
      ExplicitHeight = 41
    end
  end
  inherited Panel1: TPanel [1]
    Width = 242
    Height = 24
    Color = clNavy
    TabOrder = 2
    ExplicitWidth = 242
    ExplicitHeight = 24
    inherited lblLetreiro: TLabel
      Width = 235
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ExplicitWidth = 235
      ExplicitHeight = 16
    end
  end
  inherited pnInformacoes: TPanel [2]
    Top = 24
    Width = 242
    Height = 225
    BevelWidth = 3
    ExplicitTop = 24
    ExplicitWidth = 242
    ExplicitHeight = 225
    object Bevel2: TBevel [0]
      Left = 4
      Top = 2
      Width = 233
      Height = 196
      Shape = bsFrame
    end
    inherited lbl1: TLabel
      Left = 14
      Top = 13
      Width = 59
      ExplicitLeft = 14
      ExplicitTop = 13
      ExplicitWidth = 59
    end
    object btnPesquisar: TSpeedButton [2]
      Left = 5
      Top = 200
      Width = 73
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Down = True
      Caption = 'Pesquisa'
      OnClick = btnPesquisarClick
    end
    object btnDados: TSpeedButton [3]
      Left = 79
      Top = 200
      Width = 73
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Dados'
      OnClick = btnDadosClick
    end
    inherited cbComponents: TScrollBox
      Left = 10
      Top = 30
      Width = 220
      Height = 160
      ExplicitLeft = 10
      ExplicitTop = 30
      ExplicitWidth = 220
      ExplicitHeight = 160
    end
    inherited cbIndexes: TRComboBox
      Left = 75
      Top = 6
      Width = 152
      ExplicitLeft = 75
      ExplicitTop = 6
      ExplicitWidth = 152
    end
    object btnInformacaoCadastro: TBitBtn
      Left = 11
      Top = 169
      Width = 218
      Height = 25
      Caption = 'Visualizar Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnClick = btnInformacaoCadastroClick
    end
  end
  inherited grdSearch: TRGrid [3]
    Left = 10
    Top = 32
    Width = 220
    Height = 157
    Align = alNone
    TabOrder = 3
    ExplicitLeft = 10
    ExplicitTop = 32
    ExplicitWidth = 220
    ExplicitHeight = 157
  end
  inherited ErrorProvider1: TErrorProvider
    Top = 392
  end
end
