unit UI.Base.CadastroPadrao;

interface

uses

    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FormBase, Vcl.StdCtrls,
    Vcl.Buttons, Vcl.ExtCtrls, Lib.Biblioteca,
    UntErrorProvider, Vcl.ComCtrls, RTTI, REdit, RGrid, RComboBox, RSearch,
    Lib.Enumeradores, Lib.Parametro, Lib.Base;

type
    TFrmCadastroPadrao = class(TFrmBase)
        Panel2: TPanel;
    lblLetreiro: TLabel;
        Panel3: TPanel;
        pnlBotoes: TPanel;
        btnConfirmar: TBitBtn;
        btnCancelar: TBitBtn;
        pgcComponentes: TPageControl;
        tbPrincipal: TTabSheet;
    procedure FormActivate(Sender: TObject);
    end;

var
    FrmCadastroPadrao: TFrmCadastroPadrao;

implementation

uses
  Biz.ParametroSistema;

{$R *.dfm}


procedure TFrmCadastroPadrao.FormActivate(Sender: TObject);
begin
  inherited;
  if TParametroSistema.ObterParametroSistema('HOMOLOGA') = 'SIM' then
      panel2.Color := clRed;
end;

end.
