object frmPesquisaVendedor: TfrmPesquisaVendedor
  Left = 0
  Top = 0
  Width = 444
  Height = 41
  TabOrder = 0
  object Label3: TLabel
    Left = 4
    Top = 2
    Width = 91
    Height = 13
    Caption = 'Pesquisa Vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edCodigoVendedor: TREdit
    Left = 4
    Top = 17
    Width = 75
    Height = 21
    Ctl3D = True
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    Text = ''
    MaskType = mtNone
    MandatoryField = False
    PersistentField = False
    SaveLiteralCharacters = False
    DecimalPlaces = 2
  end
  object edNomeVendedor: TREdit
    Left = 80
    Top = 17
    Width = 331
    Height = 21
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    Text = ''
    MaskType = mtNone
    MandatoryField = False
    PersistentField = False
    SaveLiteralCharacters = False
    DecimalPlaces = 2
  end
  object btnConsultaVendedor: TBitBtn
    Left = 411
    Top = 16
    Width = 26
    Height = 22
    Caption = '...'
    TabOrder = 2
    OnClick = btnConsultaVendedorClick
  end
end
