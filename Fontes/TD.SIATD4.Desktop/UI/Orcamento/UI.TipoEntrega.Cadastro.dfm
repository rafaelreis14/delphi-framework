inherited frmCadTipoEntrega: TfrmCadTipoEntrega
  Caption = 'frmCadTipoEntrega'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited lblLetreiro: TLabel
      Width = 214
      Caption = 'Cadastro de TipoEntrega'
      ExplicitWidth = 214
    end
  end
  inherited pgcComponentes: TPageControl
    inherited tbPrincipal: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 620
      ExplicitHeight = 255
      object lblCodigoFilial: TLabel
        Left = 12
        Top = 16
        Width = 53
        Height = 13
        Caption = 'CodigoFilial'
      end
      object lblTipoEntrega: TLabel
        Left = 12
        Top = 56
        Width = 58
        Height = 13
        Caption = 'TipoEntrega'
      end
      object lblDescricao: TLabel
        Left = 12
        Top = 96
        Width = 46
        Height = 13
        Caption = 'Descricao'
      end
      object lblCor: TLabel
        Left = 12
        Top = 136
        Width = 17
        Height = 13
        Caption = 'Cor'
      end
      object lblMarcaOrcamento: TLabel
        Left = 12
        Top = 176
        Width = 82
        Height = 13
        Caption = 'MarcaOrcamento'
      end
      object lblDelete: TLabel
        Left = 12
        Top = 216
        Width = 31
        Height = 13
        Caption = 'Delete'
      end
      object lblRecno: TLabel
        Left = 12
        Top = 256
        Width = 30
        Height = 13
        Caption = 'Recno'
      end
      object lblCodigoFilialReserva: TLabel
        Left = 12
        Top = 296
        Width = 93
        Height = 13
        Caption = 'CodigoFilialReserva'
      end
      object edCodigoFilial: TREdit
        Left = 12
        Top = 32
        Width = 52
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 52
        TabOrder = 0
        Text = ''
        FieldName = 'CodigoFilial'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edTipoEntrega: TREdit
        Left = 12
        Top = 72
        Width = 53
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 53
        TabOrder = 1
        Text = ''
        FieldName = 'TipoEntrega'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edDescricao: TREdit
        Left = 12
        Top = 112
        Width = 120
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 120
        TabOrder = 2
        Text = ''
        FieldName = 'Descricao'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edCor: TREdit
        Left = 12
        Top = 152
        Width = 70
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 70
        TabOrder = 3
        Text = ''
        FieldName = 'Cor'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edMarcaOrcamento: TREdit
        Left = 12
        Top = 192
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 51
        TabOrder = 4
        Text = ''
        FieldName = 'MarcaOrcamento'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edDelete: TREdit
        Left = 12
        Top = 232
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 51
        TabOrder = 5
        Text = ''
        FieldName = 'Delete'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edRecno: TREdit
        Left = 12
        Top = 272
        Width = 50
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 6
        Text = ''
        FieldName = 'Recno'
        MaskType = mtInteger
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edCodigoFilialReserva: TREdit
        Left = 12
        Top = 312
        Width = 52
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 52
        TabOrder = 7
        Text = ''
        FieldName = 'CodigoFilialReserva'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
    end
  end
end
