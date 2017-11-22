inherited frmCadCondicaoPagamentoPorCliente: TfrmCadCondicaoPagamentoPorCliente
  Caption = 'frmCadCondicaoPagamentoPorCliente'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    ExplicitWidth = 640
    inherited lblLetreiro: TLabel
      Width = 381
      Caption = 'Cadastro de CondicaoPagamentoPorCliente'
      ExplicitWidth = 381
    end
  end
  inherited pgcComponentes: TPageControl
    inherited tbPrincipal: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 620
      ExplicitHeight = 255
      object lblFilial: TLabel
        Left = 12
        Top = 16
        Width = 20
        Height = 13
        Caption = 'Filial'
      end
      object lblCodigoCliente: TLabel
        Left = 12
        Top = 56
        Width = 66
        Height = 13
        Caption = 'CodigoCliente'
      end
      object lblCodigoCondicaoPagamaneto: TLabel
        Left = 12
        Top = 96
        Width = 137
        Height = 13
        Caption = 'CodigoCondicaoPagamaneto'
      end
      object lblBloqueado: TLabel
        Left = 12
        Top = 136
        Width = 50
        Height = 13
        Caption = 'Bloqueado'
      end
      object lblDelete: TLabel
        Left = 12
        Top = 176
        Width = 31
        Height = 13
        Caption = 'Delete'
      end
      object lblRecno: TLabel
        Left = 12
        Top = 216
        Width = 30
        Height = 13
        Caption = 'Recno'
      end
      object edFilial: TREdit
        Left = 12
        Top = 32
        Width = 52
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 52
        TabOrder = 0
        Text = ''
        FieldName = 'Filial'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edCodigoCliente: TREdit
        Left = 12
        Top = 72
        Width = 56
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 56
        TabOrder = 1
        Text = ''
        FieldName = 'CodigoCliente'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edCodigoCondicaoPagamaneto: TREdit
        Left = 12
        Top = 112
        Width = 53
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 53
        TabOrder = 2
        Text = ''
        FieldName = 'CodigoCondicaoPagamaneto'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edBloqueado: TREdit
        Left = 12
        Top = 152
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 51
        TabOrder = 3
        Text = ''
        FieldName = 'Bloqueado'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edDelete: TREdit
        Left = 12
        Top = 192
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 51
        TabOrder = 4
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
        Top = 232
        Width = 50
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 5
        Text = ''
        FieldName = 'Recno'
        MaskType = mtInteger
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
    end
  end
end
