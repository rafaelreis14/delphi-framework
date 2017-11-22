unit UI.Base.CadastroPadrao;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
    Vcl.Buttons,
    Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls,
    Vcl.CheckLst, UntErrorProvider, Vcl.ComCtrls, FrameWork.UI.FormBase;

type

    TFrmCadastroPadrao = class(TFrmBase)
        PageControl1: TPageControl;
        pnlBotoes: TPanel;
        btnCancelar: TBitBtn;
        btnConfirmar: TBitBtn;
        tbPrincipal: TTabSheet;
    end;

var
    FrmCadastroPadrao: TFrmCadastroPadrao;

implementation

{$R *.dfm}

end.
