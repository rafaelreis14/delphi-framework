unit UI.Base.ConsultaPadrao;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
    Vcl.Buttons,
    Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
    DbClient, Framework.UI.FormBase, RGrid, RTTI;

type
    TFrmConsultaPadrao = class(TFrmBase)
        PnlGrade: TPanel;
        pgControles: TPageControl;
        tbsConsulta: TTabSheet;
        tbsDados: TTabSheet;
        Panel2: TPanel;
        BtBtnConsultar: TBitBtn;
        pnlBotoes: TPanel;
        btnInserir: TBitBtn;
        btnAlterar: TBitBtn;
        btnExcluir: TBitBtn;
        btnSair: TBitBtn;
        grDados: TRGrid;
    end;

var
    FrmConsultaPadrao: TFrmConsultaPadrao;

implementation

{$R *.dfm}



end.
