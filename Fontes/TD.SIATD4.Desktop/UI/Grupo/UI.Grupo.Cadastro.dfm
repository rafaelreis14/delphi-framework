inherited frmCadGrupo: TfrmCadGrupo
  Caption = 'frmCadGrupo'
  ClientHeight = 221
  ClientWidth = 505
  ExplicitWidth = 511
  ExplicitHeight = 250
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 505
    ExplicitWidth = 505
    inherited lblLetreiro: TLabel
      Width = 163
      Caption = 'Cadastro de Grupo'
      ExplicitWidth = 163
    end
  end
  inherited Panel3: TPanel
    Top = 181
    Width = 505
    ExplicitTop = 181
    ExplicitWidth = 505
    inherited pnlBotoes: TPanel
      Left = 306
      ExplicitLeft = 306
    end
  end
  inherited pgcComponentes: TPageControl
    Width = 505
    Height = 144
    ExplicitWidth = 505
    ExplicitHeight = 144
    inherited tbPrincipal: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 497
      ExplicitHeight = 116
      object lblGrupo: TLabel
        Left = 12
        Top = 16
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object lblDescricao: TLabel
        Left = 215
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object edGrupo: TREdit
        Left = 12
        Top = 32
        Width = 200
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 70
        TabOrder = 0
        Text = ''
        FieldName = 'Grupo'
        MaskType = mtString
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edDescricao: TREdit
        Left = 215
        Top = 32
        Width = 200
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
