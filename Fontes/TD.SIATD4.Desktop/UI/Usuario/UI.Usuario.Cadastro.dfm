inherited FrmCadUsuario: TFrmCadUsuario
  Caption = 'FrmCadUsuario'
  ClientHeight = 445
  ClientWidth = 472
  ExplicitWidth = 478
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 472
    ExplicitWidth = 472
    inherited lblLetreiro: TLabel
      Width = 177
      Caption = 'Cadastro de Usu'#225'rio'
      ExplicitWidth = 177
    end
  end
  inherited Panel3: TPanel
    Top = 405
    Width = 472
    ExplicitTop = 405
    ExplicitWidth = 472
    inherited pnlBotoes: TPanel
      Left = 273
      ExplicitLeft = 273
      inherited btnConfirmar: TBitBtn
        Left = 17
        Top = 6
        ExplicitLeft = 17
        ExplicitTop = 6
      end
    end
  end
  inherited pgcComponentes: TPageControl
    Width = 472
    Height = 368
    ExplicitWidth = 472
    ExplicitHeight = 368
    inherited tbPrincipal: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 464
      ExplicitHeight = 340
      object Label3: TLabel
        Left = 9
        Top = 104
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label13: TLabel
        Left = 348
        Top = 107
        Width = 34
        Height = 13
        Caption = 'Cracha'
      end
      object edNome: TREdit
        Left = 9
        Top = 123
        Width = 333
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        Text = ''
        FieldName = 'Nome'
        MaskType = mtNone
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
      object GroupBox1: TGroupBox
        Left = 11
        Top = 153
        Width = 442
        Height = 83
        Caption = 'Dados para Autentica'#231#227'o'
        TabOrder = 3
        object Label4: TLabel
          Left = 148
          Top = 27
          Width = 30
          Height = 13
          Caption = 'Senha'
        end
        object Label5: TLabel
          Left = 274
          Top = 27
          Width = 67
          Height = 13
          Caption = 'Contra-Senha'
        end
        object Label2: TLabel
          Left = 9
          Top = 27
          Width = 25
          Height = 13
          Caption = 'Login'
        end
        object Label14: TLabel
          Left = 400
          Top = 27
          Width = 30
          Height = 13
          Caption = 'Expira'
        end
        object edSenha: TREdit
          Left = 148
          Top = 46
          Width = 122
          Height = 21
          PasswordChar = '*'
          TabOrder = 1
          Text = ''
          OnExit = edSenhaExit
          FieldName = 'Senha'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object edContraSenha: TREdit
          Left = 273
          Top = 46
          Width = 123
          Height = 21
          PasswordChar = '*'
          TabOrder = 2
          Text = ''
          MaskType = mtNone
          MandatoryField = True
          PersistentField = False
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object edLogin: TREdit
          Left = 9
          Top = 46
          Width = 136
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          Text = ''
          FieldName = 'Login'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object REdit5: TREdit
          Left = 400
          Top = 46
          Width = 34
          Height = 21
          Enabled = False
          TabOrder = 3
          Text = '45'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = False
          SaveLiteralCharacters = False
          Value = '45'
          DecimalPlaces = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 9
        Top = 242
        Width = 442
        Height = 81
        Caption = 'Op'#231#245'es do Usu'#225'rio'
        TabOrder = 4
        object RCheckBox1: TRCheckBox
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Bloqueado'
          TabOrder = 0
          FieldName = 'Bloqueado'
          MandatoryField = False
          PersistentField = True
          CheckedValue = 'S'
          UncheckedValue = 'N'
        end
        object RCheckBox3: TRCheckBox
          Left = 306
          Top = 24
          Width = 123
          Height = 17
          Caption = 'Permite Alterar Senha'
          TabOrder = 1
          FieldName = 'AlteraSenha'
          MandatoryField = False
          PersistentField = True
          CheckedValue = 'S'
          UncheckedValue = 'N'
        end
        object RCheckBox5: TRCheckBox
          Left = 134
          Top = 25
          Width = 144
          Height = 17
          Caption = 'Obriga Troca de Senha'
          TabOrder = 2
          FieldName = 'ObrigaTrocaSenha'
          MandatoryField = False
          PersistentField = True
          CheckedValue = 'S'
          UncheckedValue = 'N'
        end
        object ckExterno: TRCheckBox
          Left = 16
          Top = 47
          Width = 97
          Height = 17
          Caption = 'Usu'#225'rio Externo'
          TabOrder = 3
          OnClick = ckExternoClick
          FieldName = 'Externo'
          MandatoryField = False
          PersistentField = True
          CheckedValue = 'S'
          UncheckedValue = 'N'
        end
      end
      object GrpBxSRA: TGroupBox
        Left = 3
        Top = 12
        Width = 458
        Height = 73
        Caption = 'Dados SRA'
        TabOrder = 0
        object Label8: TLabel
          Left = 282
          Top = 20
          Width = 43
          Height = 13
          Caption = 'Matricula'
        end
        object Label9: TLabel
          Left = 208
          Top = 20
          Width = 20
          Height = 13
          Caption = 'Filial'
        end
        object Label10: TLabel
          Left = 134
          Top = 20
          Width = 41
          Height = 13
          Caption = 'Empresa'
        end
        object edMatricula: TREdit
          Left = 282
          Top = 36
          Width = 151
          Height = 21
          Color = 16250871
          ReadOnly = True
          TabOrder = 3
          Text = ''
          FieldName = 'SRAMat'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object edFilial: TREdit
          Left = 208
          Top = 36
          Width = 70
          Height = 21
          Color = 16250871
          ReadOnly = True
          TabOrder = 2
          Text = ''
          FieldName = 'SRAFilial'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object edEmpresa: TREdit
          Left = 134
          Top = 36
          Width = 70
          Height = 21
          Color = 16250871
          ReadOnly = True
          TabOrder = 1
          Text = ''
          FieldName = 'SRAEmpresa'
          MaskType = mtNone
          MandatoryField = True
          PersistentField = True
          SaveLiteralCharacters = False
          DecimalPlaces = 2
        end
        object btnPesquisarSRA: TBitBtn
          Left = 6
          Top = 31
          Width = 119
          Height = 26
          Caption = 'Pesquisar SRA'
          TabOrder = 0
          WordWrap = True
          OnClick = btnPesquisarSRAClick
        end
      end
      object edCracha: TREdit
        Left = 348
        Top = 123
        Width = 103
        Height = 21
        TabOrder = 2
        Text = ''
        FieldName = 'Cracha'
        MaskType = mtNone
        MandatoryField = True
        PersistentField = True
        SaveLiteralCharacters = False
        DecimalPlaces = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Grupo de Usuario'
      ImageIndex = 1
      object cklGrupoUsuario: TRCheckListBox
        Left = 0
        Top = 0
        Width = 464
        Height = 340
        Align = alClient
        Columns = 2
        ItemHeight = 13
        TabOrder = 0
        MandatoryField = False
        PersistentField = False
        IDFieldName = 'Grupo'
        DescriptionFieldName = 'Grupo'
        ReadOnly = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Filiais do Usu'#225'rio'
      ImageIndex = 2
      object cklFiliaisUsuario: TRCheckListBox
        Left = 0
        Top = 57
        Width = 464
        Height = 283
        Align = alClient
        Columns = 2
        ItemHeight = 13
        TabOrder = 0
        FieldName = '22'
        MandatoryField = False
        PersistentField = False
        IDFieldName = 'Filial'
        DescriptionFieldName = 'Descricao'
        ReadOnly = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 464
        Height = 57
        Align = alTop
        TabOrder = 1
        object Label6: TLabel
          Left = 3
          Top = 7
          Width = 41
          Height = 13
          Caption = 'Empresa'
        end
        object cbEmpresa: TRComboBox
          Left = 3
          Top = 23
          Width = 230
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnChange = cbEmpresaChange
          MandatoryField = False
          PersistentField = False
          BlankField = False
          IDFieldName = 'Empresa'
          DescriptionFieldName = 'Nome'
        end
      end
    end
  end
  inherited ErrorProvider1: TErrorProvider
    Left = 376
    Top = 8
  end
end
