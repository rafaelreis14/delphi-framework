inherited frmCadFilial: TfrmCadFilial
  Caption = 'frmCadFilial'
  ClientHeight = 300
  ClientWidth = 640
  ExplicitWidth = 646
  ExplicitHeight = 329
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 640
    ExplicitWidth = 640
    inherited lblLetreiro: TLabel
      Width = 149
      Caption = 'Cadastro de Filial'
      ExplicitWidth = 149
    end
  end
  inherited Panel3: TPanel
    Top = 260
    Width = 640
    ExplicitTop = 260
    ExplicitWidth = 640
    inherited pnlBotoes: TPanel
      Left = 441
      ExplicitLeft = 441
    end
  end
  inherited pgcComponentes: TPageControl
    Width = 640
    Height = 223
    ExplicitWidth = 640
    ExplicitHeight = 223
    inherited tbPrincipal: TTabSheet
      ExplicitWidth = 632
      ExplicitHeight = 195
      object Label2: TLabel
        Left = 10
        Top = 10
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object Label3: TLabel
        Left = 134
        Top = 9
        Width = 20
        Height = 13
        Caption = 'Filial'
      end
      object Label4: TLabel
        Left = 337
        Top = 9
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label7: TLabel
        Left = 10
        Top = 57
        Width = 60
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label6: TLabel
        Left = 10
        Top = 99
        Width = 25
        Height = 13
        Caption = 'CNPJ'
      end
      object Label8: TLabel
        Left = 136
        Top = 99
        Width = 10
        Height = 13
        Caption = 'IE'
      end
      object Label15: TLabel
        Left = 522
        Top = 57
        Width = 84
        Height = 13
        Caption = 'Data de Abertura'
      end
      object Label17: TLabel
        Left = 261
        Top = 9
        Width = 14
        Height = 13
        Caption = 'CD'
      end
      object REdit2: TREdit
        Left = 134
        Top = 25
        Width = 121
        Height = 21
        TabOrder = 1
        Text = ''
        FieldName = 'Filial'
        MaskType = mtNone
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object REdit3: TREdit
        Left = 337
        Top = 25
        Width = 273
        Height = 21
        TabOrder = 3
        Text = ''
        FieldName = 'Descricao'
        MaskType = mtNone
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object REdit6: TREdit
        Left = 10
        Top = 26
        Width = 118
        Height = 21
        TabOrder = 0
        Text = ''
        FieldName = 'Empresa'
        MaskType = mtNone
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object REdit1: TREdit
        Left = 10
        Top = 73
        Width = 506
        Height = 21
        TabOrder = 4
        Text = ''
        FieldName = 'RazaoSocial'
        MaskType = mtNone
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object REdit5: TREdit
        Left = 10
        Top = 115
        Width = 118
        Height = 21
        EditMask = '!00.000.000/0000-00;1;_'
        MaxLength = 18
        TabOrder = 6
        Text = '  .   .   /    -  '
        FieldName = 'CNPJ'
        MaskType = mtCNPJ
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object REdit7: TREdit
        Left = 134
        Top = 115
        Width = 138
        Height = 21
        TabOrder = 7
        Text = ''
        FieldName = 'InscricaoEstadual'
        MaskType = mtNone
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object REdit14: TREdit
        Left = 522
        Top = 73
        Width = 87
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 5
        Text = '  /  /    '
        FieldName = 'DataAbertura'
        MaskType = mtDate
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object REdit16: TREdit
        Left = 261
        Top = 25
        Width = 70
        Height = 21
        TabOrder = 2
        Text = ''
        FieldName = 'CD'
        MaskType = mtNone
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        Left = 3
        Top = 0
        Width = 624
        Height = 105
        Caption = 'Endere'#231'o'
        TabOrder = 0
        object Label9: TLabel
          Left = 11
          Top = 18
          Width = 81
          Height = 13
          Caption = 'Rua, Logradouro'
        end
        object Label10: TLabel
          Left = 314
          Top = 18
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object Label11: TLabel
          Left = 11
          Top = 57
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label12: TLabel
          Left = 314
          Top = 57
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object Label13: TLabel
          Left = 447
          Top = 57
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object REdit8: TREdit
          Left = 11
          Top = 34
          Width = 297
          Height = 21
          TabOrder = 0
          Text = ''
          FieldName = 'Endereco'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object REdit9: TREdit
          Left = 314
          Top = 34
          Width = 297
          Height = 21
          TabOrder = 1
          Text = ''
          FieldName = 'Bairro'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object REdit10: TREdit
          Left = 11
          Top = 73
          Width = 297
          Height = 21
          TabOrder = 2
          Text = ''
          FieldName = 'Cidade'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object REdit11: TREdit
          Left = 314
          Top = 73
          Width = 127
          Height = 21
          TabOrder = 3
          Text = ''
          FieldName = 'Uf'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object REdit12: TREdit
          Left = 447
          Top = 73
          Width = 127
          Height = 21
          TabOrder = 4
          Text = ''
          FieldName = 'Cep'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 111
        Width = 625
        Height = 74
        Caption = 'Contato'
        TabOrder = 1
        object Label5: TLabel
          Left = 12
          Top = 21
          Width = 42
          Height = 13
          Caption = 'Telefone'
        end
        object Label14: TLabel
          Left = 119
          Top = 21
          Width = 18
          Height = 13
          Caption = 'Fax'
        end
        object Label16: TLabel
          Left = 226
          Top = 21
          Width = 24
          Height = 13
          Caption = 'Email'
        end
        object REdit4: TREdit
          Left = 12
          Top = 40
          Width = 101
          Height = 21
          TabOrder = 0
          Text = ''
          FieldName = 'Fone'
          MaskType = mtNone
          MandatoryField = False
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object REdit13: TREdit
          Left = 119
          Top = 40
          Width = 101
          Height = 21
          TabOrder = 1
          Text = ''
          FieldName = 'Fax'
          MaskType = mtNone
          MandatoryField = False
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object REdit15: TREdit
          Left = 226
          Top = 40
          Width = 386
          Height = 21
          TabOrder = 2
          Text = ''
          FieldName = 'Email'
          MaskType = mtNone
          MandatoryField = False
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
      end
    end
  end
  inherited ErrorProvider1: TErrorProvider
    Left = 280
    Top = 256
  end
end
