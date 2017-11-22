inherited frmFilter: TfrmFilter
  BorderIcons = [biSystemMenu]
  Caption = 'frmFilter'
  ClientHeight = 411
  ClientWidth = 762
  Color = 14609391
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  Position = poOwnerFormCenter
  ExplicitWidth = 778
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdSearch: TRGrid
    Top = 230
    Width = 762
    Height = 181
    ExplicitTop = 230
    ExplicitWidth = 762
    ExplicitHeight = 181
  end
  inherited pnInformacoes: TPanel
    Width = 617
    Height = 193
    ExplicitLeft = 0
    ExplicitTop = 37
    ExplicitHeight = 290
    inherited lbl1: TLabel
      Width = 47
      ExplicitWidth = 47
    end
    inherited cbComponents: TScrollBox
      Width = 602
      ExplicitWidth = 602
    end
    inherited cbIndexes: TRComboBox
      Top = 24
      Width = 603
      ExplicitTop = 24
      ExplicitWidth = 603
    end
  end
  inherited pnBotoes: TPanel
    Left = 617
    Height = 193
    ExplicitLeft = 617
    ExplicitTop = 37
    ExplicitHeight = 290
  end
  inherited Panel1: TPanel
    Width = 762
    ExplicitTop = 0
    ExplicitWidth = 762
  end
end
