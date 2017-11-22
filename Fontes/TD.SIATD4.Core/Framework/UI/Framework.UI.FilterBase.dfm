inherited FrmFilterBase: TFrmFilterBase
  Caption = 'frmFilterBase'
  ClientHeight = 316
  ClientWidth = 309
  OnShow = FormShow
  ExplicitWidth = 325
  ExplicitHeight = 355
  PixelsPerInch = 96
  TextHeight = 13
  object grdSearch: TRGrid [0]
    Left = 0
    Top = 232
    Width = 309
    Height = 84
    Align = alBottom
    ColCount = 2
    DefaultRowHeight = 18
    DrawingStyle = gdsClassic
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goRowSelect]
    PopupMenu = ppVisualizar
    TabOrder = 0
    OnExit = grdSearchExit
    MultiSelect = False
    MasterDetailType = mdMaster
    ColWidths = (
      11
      64)
    RowHeights = (
      18
      18)
  end
  object pnInformacoes: TPanel [1]
    Left = 0
    Top = 37
    Width = 164
    Height = 195
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      164
      195)
    object lbl1: TLabel
      Left = 8
      Top = 7
      Width = 51
      Height = 13
      Caption = 'Filtrar Por:'
    end
    object Panel4: TPanel
      Left = -488
      Top = 40
      Width = 185
      Height = 41
      Caption = 'Panel2'
      TabOrder = 0
    end
    object cbComponents: TScrollBox
      Left = 8
      Top = 49
      Width = 140
      Height = 138
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnExit = cbComponentsExit
    end
    object cbIndexes: TRComboBox
      Left = 8
      Top = 23
      Width = 140
      Height = 22
      AutoComplete = False
      AutoCloseUp = True
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnClick = cbIndexesClick
      OnExit = cbIndexesExit
      MandatoryField = False
      PersistentField = False
      BlankField = False
    end
  end
  object pnBotoes: TPanel [2]
    Left = 164
    Top = 37
    Width = 145
    Height = 195
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object Bevel1: TBevel
      Left = 10
      Top = 144
      Width = 123
      Height = 3
    end
    object btnCancelar: TBitBtn
      Left = 12
      Top = 71
      Width = 117
      Height = 30
      Hint = 'Cancelar'
      Caption = '&Cancelar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFF7F6FBC8C7E6918ECE7570C5716BC26E6AC28481C8BAB7DEF2F2F9FEFE
        FFFF00FFFF00FFFF00FFFF00FFFEFEFFE3E2F3837FC55752BA5D5AC85D57C85F
        5AC6635FCA615CC95753BB6D68BCCBC9E7FDFDFEFF00FFFF00FFFF00FFE4E4F3
        736EC05F59C55F5ACD6761C68782CBA6A3D79B99D57975CC615CCB5D57C25752
        B1CBC9E6FF00FFFF00FFF7F7FB8A86CD615CCA5F5ACD7B77C9D1CFEAFFFFFFFF
        FFFFFFFFFFADAADB5A55C3605CCE5E59C46661B7E9E8F4FF00FFC3C1E6615CC7
        605BCE7672C8E4E3F3FFFFFFFFFFFFFDFDFEB8B5DC6E6AC96A65D55C57C55E5B
        C95D58BFA5A2D5FF00FF8883D16661CF645FC4C4C2E5FFFFFFFFFFFFFFFFFFB4
        B1DA5E58BB7773E07D78DCACA9DC746FC8625DCB7772C4F2F2F97672CC645FCD
        7975C7F7F7FCFFFFFFFFFFFFB5B4DB5A56B86A65D37F79DAB7B5E4FFFFFFA29E
        D75D58C76D69C4D7D5ED7A76D26560D08380CBFFFFFFFFFFFFB1AFD75B57B863
        5DCB7D78D3B8B5E2FBFBFDFFFFFFB1AEDD5952C26D69C3D1CFEA8480DB736EE1
        7A75C9FAFAFDB9B7DC5C57BA625DCC7671CEB9B7E2F8F8FCFFFFFFFFFFFF9995
        D35B57C76C67C3D4D2EB9C98E4948FF86E68D18681C66661C35B57CC7E79D4C8
        C6E9F8F8FCFFFFFFFFFFFFECEBF6635FBF5E59CA7773C3F1F1F9D7D5F4AFA9F7
        9892F1534EC45D58C88582D6D8D5F0FCFBFEFFFFFFFFFFFFF7F7FB7974C35D58
        C8615CC8AEABDAFEFEFFFCFBFEA29CDDDED8FA8984EB615CC7B3AFDCFAFAFDFD
        FDFEF9F9FCDBDAEE7772C15A56C4635ECE7672C6F0EFF8FF00FFFF00FFD6D3EE
        B3ACE5D5CFFA8781EA6560C2716CBD8682C47873C15953BB5D5AC96460CE6B65
        C5D7D6EDFF00FFFF00FFFF00FFFF00FFE2DFF5AEA8E8A8A3F4847FEF6B66D662
        5CCA615AC96761D06A66CD807BCAD9D7EEFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFF8F8FCC7C4EDA3A0E38783D67A75CF7A76CE8E8AD1B5B2E1F9F9FCFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFAF9FEDFDEF3BDBBE4AD
        ABDFB3B1E1D2D1ECF2F1F9FF00FFFF00FFFF00FFFF00FFFF00FF}
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = -1
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnFiltrar: TBitBtn
      Left = 12
      Top = 35
      Width = 117
      Height = 30
      Hint = 'Filtrar'
      Caption = '&Filtrar'
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000230B0000230B00000001000000010000424242005A5A
        5A00BD7B5A00A5636B00A5736B00BD846B00D6946B0073737300848484008C8C
        8C009C9C9C00ADADAD00BDBDBD00C6C6C600C6C6CE00CECED600EFEFEF00FF00
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
        1111030311111111111111111111111111030803111111111111111111111111
        030F080311111111111111111111111103100803111111111111111111111111
        0310080311111111111111111111111104100803111111111111111111111111
        0510080311111111111111111111111106100803111111111111111111111102
        100F08000311111111111111111102100F0C0901000311111111111111021010
        0D0B090701000311111111110210100F0C0A0808070100031111110210100F0D
        0D08080808070100031106060606060606060606060606060606111111111111
        1111111111111111111111111111111111111111111111111111}
      ParentShowHint = False
      ShowHint = True
      Spacing = -1
      TabOrder = 1
      OnClick = btnFiltrarClick
    end
    object btnSelecionar: TBitBtn
      Left = 12
      Top = 106
      Width = 117
      Height = 30
      Hint = 'Clique para selecionar'
      Caption = '&Selecionar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFBDA08F9F755D8F5F42916246A0795FAF8C77FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77F688F5F43B39888CEC6C2DC
        DDDDDAD9DAD0CBC7B19C8F8F6044BC9F8DFF00FFFF00FFFF00FFFF00FFFF00FF
        AA856EAD8E7CE6E9EBEDF4F7ECF0F3EDF2F6ECEFF3E7EAEBE4E7E8D7D6D49C7B
        65BB9D8BFF00FFFF00FFFF00FFC2A493B59581FBFDFDF5FAFCF9F9F9FDD3BDFD
        FDFDF9FAFAF7F8F8EFEFF0E6E5E6CFC8C3976F59CDB7AAFF00FFFF00FFB0856C
        F6F3F0FFFFFFFEFEFEEF9E76DB7949F8B391FCFDFDFAFAFBF7F8F8F1F1F1E2E2
        E2CBC5C096694DFF00FFBD9781CAAF9EFFFFFFFFFFFFF7AB86DB7949FB905BDB
        7949F6B18FFDFDFEFAFBFBF6F7F7EAEBECE0E3E6A58573B89986A16F50E8DBD4
        FFFFFFFCCEB8DB7949FB905B9E512CFB905BDB7949F7B290FDFDFDF9F9F9ECEE
        EEE2E4E6BFB1A89D725AB7896EFCFAF9FFFFFFFB905BFB905B9E512CE5B9A39E
        512CFB905BDB7949F7B290FDFDFEF3F4F4E6EBEDCEC7C3996D52BA8E74FEFEFE
        FFFFFFF8B5949E512CFCE5D9FFFFFFE3CABD9E512CFB905BDB7949F5B797F6F7
        F8E9ECEECEC5C19C7158C09B84FDFDFCFFFFFFFFFFFFFCE0D2FFFFFFFFFFFFFF
        FFFFE3C7BA9E512CFB905BFB905BFCC3A7E9EBECBDA99DA37C64CFAC96F0E4DC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4CABD9E512CF68B56FEE9
        DEEDF3F5A88672BFA393FF00FFD6B599FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE0C3B5FEE9DEF1DBD0DCD6D1906043FF00FFFF00FFDFB69A
        F2E2CCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEF0F1
        F1966A4FD9C9BFFF00FFFF00FFFF00FFDFB292F2E4D5FEFDFBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFDFCFBF0E8E4A88169C8AEA0FF00FFFF00FFFF00FFFF00FF
        FF00FFE1B99EE8C4A6F8E4D0FBF5EDFCF4EFFAF2EDF0E3DAD2B6A4BD9A85E5D8
        D0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8CDBCDCB398E3B497E6
        B295D8A587CEA58DDAC4B7FF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      Spacing = -1
      TabOrder = 2
      OnClick = btnSelecionarClick
      OnExit = btnSelecionarExit
    end
    object btnImprimir: TBitBtn
      Left = 14
      Top = 153
      Width = 117
      Height = 30
      Hint = 'Clique para selecionar'
      Caption = '&Imprimir'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
        BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDFF00FFFF00FF545454
        F1F1F1FFFFFFFEFEFEFCFCFCF9F9F9F5F5F5F0F0F0EAEAEAE5E5E5E5E5E5EDED
        EDC6C6C6323133FF00FF94908F403835838180FFFFFFFFFFFFFFFFFFFFFFFFFE
        FEFEFBFBFBF7F7F7F3F3F3F4F4F4F5F5F55A585839322F94908F94908FB1A19A
        6F66625D5F5F7273737071717071717071717071717071717071717374745456
        574F4946B3A39C94908F94908FAFA09A7A6E6A0F0A0B150F10150F10150F1015
        0F10150F10150F10160F10160F100E0809655B58B0A19B94908F94908FB3A5A0
        83767341343646393B46393B46393B46393B46393B46393B46393B46393B4033
        357D6F6DB3A6A094908F94908FC0B3AE6D6461171113201A1B201A1B201A1B20
        1A1B201A1B201A1B201A1B201A1B171112675E5CC0B3AD94908F94908FD1C6C0
        5C5452161011201A1A201A1A201A1A201A1A201A1A201A1A201A1A201A1A1711
        11574E4DCFC4BF94908FFF00FF94908F94908F695E64615C5B625E5D635E5E63
        5E5E635E5E635E5E625E5D625D5D685E6394908F94908FFF00FFFF00FFFF00FF
        FF00FFFF00FF37333A2E2B2D2C28292C28282C28282C28292F2B2D383338FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF433D4E3E37463B34413A
        323E39313D38313C3A323E3C343FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF423B4C413A4A4039483F38463E37443D35433B34403B343EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF423B4C443D4C3F39473E
        37453D36433C35423E36423B343EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF423B4C413A494139474038463F37433E3642FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF423B4C42
        3B4C423B4C423B4CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      Spacing = -1
      TabOrder = 3
      OnClick = btnImprimirClick
    end
    object Panel2: TPanel
      Left = -488
      Top = 40
      Width = 185
      Height = 41
      Caption = 'Panel2'
      TabOrder = 4
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 0
    Width = 309
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    Color = 14540253
    ParentBackground = False
    TabOrder = 3
    object lblLetreiro: TLabel
      Left = 6
      Top = 5
      Width = 120
      Height = 28
      Caption = 'Filtro Padr'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
  end
  inherited ErrorProvider1: TErrorProvider
    Left = 40
    Top = 216
  end
  object ppVisualizar: TPopupMenu
    Left = 225
    Top = 248
    object VisualizarCadastro1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7727474C6C7C7FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C7
        C64D504F328DB3436674FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC6C7C64D504F2B97C687D8EF6493A5FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C7C64D504F2B97
        C687D8EF6493A5FF00FFFF00FFFF00FFFF00FFE8E2DECDBAAD937C6B77584477
        58439C7D6BABADAC2D34422B97C687D8EF6493A5FF00FFFF00FFFF00FFFF00FF
        DED6D08668549D8165BFA27ED0AD87B495739375596E54404F809187D8EF6493
        A5FF00FFFF00FFFF00FFFF00FFF7F5F3896E5CC1AB8BECD1AAEED2AEECCFA7E7
        C79ED8B28AA181627256426493A5FF00FFFF00FFFF00FFFF00FFFF00FFC5B7AE
        B09981F2DFBAF3E1C1F2E1C1F0DEBBEDD8B2E7CBA3D3AD879273576D665DFF00
        FFFF00FFFF00FFFF00FFFF00FFB19E91CDBCA4F4E8CCF6EED7F7EFDAF4EAD2F2
        E2C5ECD5B3E3C39DB59472886E5EFF00FFFF00FFFF00FFFF00FFFF00FF978171
        E3DAC4F7F1DEFAF6EBFBF8EEF9F3E6F4E9D3EFDCBEE7CAA5CCA68272543FFF00
        FFFF00FFFF00FFFF00FFFF00FFBFB0A6CFC4B6F9F5EAFCFAF3FCFBF4FBF6EEF6
        EDDAF0DEC1ECCFA9C0A27D795C48FF00FFFF00FFFF00FFFF00FFFF00FFE1DAD6
        C1B4A8F0EBE3FBFAF4FBF9F1FAF5EAF5EDD7F1DFBFE6CBA49E8568B6A79CFF00
        FFFF00FFFF00FFFF00FFFF00FFF3F0EEC1B3A9D1C6BEF6F4EAF9F6E6F6F2DEF4
        EACEE5D4B2B59E807A5E4AEBE7E5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        E7E0DCC0B2A9CABFB3D6CBBBDED4BBC3B298A590768D735FD4CAC2FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7F5F4E0D9D3C7B9AFB7A69AA4
        9182BAAA9DF2E7E2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = 'Visualizar Cadastro'
      OnClick = VisualizarCadastro1Click
    end
  end
end