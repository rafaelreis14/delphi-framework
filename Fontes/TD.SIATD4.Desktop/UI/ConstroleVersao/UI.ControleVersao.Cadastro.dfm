inherited frmCadControleVersao: TfrmCadControleVersao
  Caption = 'frmCadControleVersao'
  ClientHeight = 300
  ClientWidth = 636
  ExplicitWidth = 642
  ExplicitHeight = 329
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 636
    inherited lblLetreiro: TLabel
      Width = 246
      Caption = 'Cadastro de ControleVersao'
      ExplicitWidth = 246
    end
  end
  inherited Panel3: TPanel
    Top = 260
    Width = 636
    inherited pnlBotoes: TPanel
      Left = 437
    end
  end
  inherited pgcComponentes: TPageControl
    Width = 636
    Height = 223
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
      object lblVersao: TLabel
        Left = 12
        Top = 56
        Width = 33
        Height = 13
        Caption = 'Versao'
      end
      object lblTipo: TLabel
        Left = 12
        Top = 96
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object lblStatus: TLabel
        Left = 12
        Top = 136
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object edVersao: TREdit
        Left = 12
        Top = 72
        Width = 189
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 0
        Text = ''
        FieldName = 'Versao'
        MaskType = mtString
        MandatoryField = False
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object cbFilial: TRComboBox
        Left = 12
        Top = 32
        Width = 189
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 1
        FieldName = 'CodigoFilial'
        MandatoryField = False
        PersistentField = True
        BlankField = True
        IDFieldName = 'Filial'
        DescriptionFieldName = 'Descricao'
      end
      object cbTipo: TRComboBox
        Left = 11
        Top = 110
        Width = 190
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 2
        FieldName = 'Tipo'
        MandatoryField = True
        PersistentField = True
        BlankField = False
        ListValue.Strings = (
          'CAIXA=C'
          'CADASTRO=A'
          'LOJA=L')
      end
      object cbStatus: TRComboBox
        Left = 11
        Top = 150
        Width = 190
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 3
        FieldName = 'Status'
        MandatoryField = True
        PersistentField = True
        BlankField = False
        ListValue.Strings = (
          'ATIVO=A'
          'INATIVO=I')
      end
    end
  end
end
