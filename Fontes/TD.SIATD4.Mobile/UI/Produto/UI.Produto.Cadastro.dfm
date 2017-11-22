inherited frmCadProdutoMobile: TfrmCadProdutoMobile
  Caption = ''
  ClientHeight = 300
  ClientWidth = 242
  OnCreate = FormCreate
  ExplicitWidth = 258
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 242
    Height = 250
    ExplicitWidth = 242
    ExplicitHeight = 250
    inherited tbPrincipal: TTabSheet
      ExplicitWidth = 234
      ExplicitHeight = 222
      object Label1: TLabel
        Left = 5
        Top = 6
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 5
        Top = 47
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label3: TLabel
        Left = 4
        Top = 90
        Width = 86
        Height = 13
        Caption = 'C'#243'digo de Barra 1'
      end
      object Label4: TLabel
        Left = 4
        Top = 129
        Width = 86
        Height = 13
        Caption = 'C'#243'digo de Barra 2'
      end
      object Label5: TLabel
        Left = 116
        Top = 129
        Width = 86
        Height = 13
        Caption = 'C'#243'digo de Barra 3'
      end
      object Label6: TLabel
        Left = 4
        Top = 171
        Width = 60
        Height = 13
        Caption = 'C'#243'digo Palet'
      end
      object Label7: TLabel
        Left = 116
        Top = 171
        Width = 90
        Height = 13
        Caption = 'C'#243'digo Embalagem'
      end
      object edCodigo: TREdit
        Left = 5
        Top = 20
        Width = 228
        Height = 21
        TabOrder = 0
        Text = ''
        FieldName = 'Codigo'
        MaskType = mtNone
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edDescricao: TREdit
        Left = 3
        Top = 61
        Width = 228
        Height = 21
        TabOrder = 1
        Text = ''
        FieldName = 'Descricao'
        MaskType = mtNone
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edCodigoBarra1: TREdit
        Left = 3
        Top = 104
        Width = 228
        Height = 21
        TabOrder = 2
        Text = ''
        FieldName = 'CodigoBarra1'
        MaskType = mtNone
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edCodigoBarra2: TREdit
        Left = 3
        Top = 143
        Width = 105
        Height = 21
        TabOrder = 3
        Text = ''
        FieldName = 'codigoBarra2'
        MaskType = mtNone
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edCodigoBarra3: TREdit
        Left = 115
        Top = 143
        Width = 116
        Height = 21
        TabOrder = 4
        Text = ''
        FieldName = 'CodigoBarra3'
        MaskType = mtNone
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object REdit1: TREdit
        Left = 115
        Top = 185
        Width = 116
        Height = 21
        TabOrder = 5
        Text = ''
        FieldName = 'CodigoBarraEmbalagem'
        MaskType = mtNone
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object REdit2: TREdit
        Left = 3
        Top = 185
        Width = 107
        Height = 21
        TabOrder = 6
        Text = ''
        FieldName = 'CodigoBarraTransp'
        MaskType = mtNone
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
    end
  end
  inherited pnlBotoes: TPanel
    Top = 250
    Width = 242
    ExplicitTop = 250
    ExplicitWidth = 242
    inherited btnCancelar: TBitBtn
      Left = 182
      ExplicitLeft = 182
    end
    inherited btnConfirmar: TBitBtn
      Left = 127
      ExplicitLeft = 127
    end
  end
end
