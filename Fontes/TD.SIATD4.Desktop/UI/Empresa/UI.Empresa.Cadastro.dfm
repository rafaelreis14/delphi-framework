inherited frmCadEmpresa: TfrmCadEmpresa
  Caption = 'frmCadEmpresa'
  ClientHeight = 249
  ClientWidth = 436
  ExplicitWidth = 442
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 436
    ExplicitWidth = 436
    inherited lblLetreiro: TLabel
      Width = 185
      Caption = 'Cadastro de Empresa'
      ExplicitWidth = 185
    end
  end
  inherited Panel3: TPanel
    Top = 209
    Width = 436
    ExplicitTop = 155
    ExplicitWidth = 436
    inherited pnlBotoes: TPanel
      Left = 237
      ExplicitLeft = 237
    end
  end
  inherited pgcComponentes: TPageControl
    Width = 436
    Height = 172
    ExplicitWidth = 436
    ExplicitHeight = 118
    inherited tbPrincipal: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 428
      ExplicitHeight = 90
      object lblEmpresa: TLabel
        Left = 12
        Top = 24
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object lblNome: TLabel
        Left = 12
        Top = 72
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object edEmpresa: TREdit
        Left = 12
        Top = 37
        Width = 85
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 52
        TabOrder = 0
        Text = ''
        FieldName = 'Empresa'
        MaskType = mtString
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object edNome: TREdit
        Left = 12
        Top = 85
        Width = 309
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 110
        TabOrder = 1
        Text = ''
        FieldName = 'Nome'
        MaskType = mtString
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
    end
  end
end
