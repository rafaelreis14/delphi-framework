inherited frmCadPermissao: TfrmCadPermissao
  Caption = 'frmCadPermissao'
  ClientHeight = 217
  ClientWidth = 426
  ExplicitWidth = 432
  ExplicitHeight = 246
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 426
    inherited lblLetreiro: TLabel
      Width = 202
      Caption = 'Cadastro de Permissao'
      ExplicitWidth = 202
    end
  end
  inherited Panel3: TPanel
    Top = 177
    Width = 426
    inherited pnlBotoes: TPanel
      Left = 227
    end
  end
  inherited pgcComponentes: TPageControl
    Width = 426
    Height = 140
    inherited tbPrincipal: TTabSheet
      ExplicitLeft = -12
      ExplicitTop = 6
      ExplicitWidth = 620
      ExplicitHeight = 255
      object lblPermissao: TLabel
        Left = 12
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Permissao'
      end
      object lblDescricao: TLabel
        Left = 12
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Descricao'
      end
      object edPermissao: TREdit
        Left = 12
        Top = 32
        Width = 110
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 0
        Text = ''
        FieldName = 'Permissao'
        MaskType = mtString
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edDescricao: TREdit
        Left = 12
        Top = 72
        Width = 277
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 110
        TabOrder = 1
        Text = ''
        FieldName = 'Descricao'
        MaskType = mtString
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
    end
  end
end
