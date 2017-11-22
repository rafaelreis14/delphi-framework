unit Framework.UI.FormBase;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, REdit, RComboBox, RSearch, RCheckBox, RCheckListBox,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBClient,
    Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,    Lib.Enumeradores, System.RTTI, Lib.Parametro,
    UntErrorProvider, Lib.Biblioteca;

type
    TFrmBase = class(TForm)
        ErrorProvider1: TErrorProvider;
        procedure FormKeyPress(Sender: TObject; var Key: Char);
        procedure FormCreate(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: Word;
          Shift: TShiftState);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    private
        FTabEnter: boolean;
        FEsc: boolean;
        FAcaoJanela: TAcaoJanela;
        FObjeto: TObject;
        FRetornoFormulario: TRetornoFormulario;
        procedure SetEsc(const Value: boolean);
        procedure SetTabEnter(const Value: boolean);
        procedure SetAcaoJanela(const Value: TAcaoJanela);
        procedure SetObjeto(const Value: TObject);
        procedure SetRetornoFormulario(const Value: TRetornoFormulario);
    public
        property TabEnter: boolean read FTabEnter write SetTabEnter;
        property FecharComEsc: boolean read FEsc write SetEsc default true;
        property AcaoJanela: TAcaoJanela read FAcaoJanela write SetAcaoJanela;
        property Objeto: TObject read FObjeto write SetObjeto;

        property RetornoFormulario: TRetornoFormulario read FRetornoFormulario write SetRetornoFormulario;
        const MobileWidth: integer = 258;
        const MobileHeight: integer = 338;
    type
        Parametro = class(TParametro);
    end;

var
    FrmBase: TFrmBase;

implementation

uses
  Biz.ParametroSistema;

{$R *.dfm}



procedure TFrmBase.FormActivate(Sender: TObject);
begin
  self.FormStyle := fsNormal;
end;

procedure TFrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if RetornoFormulario = null then
      RetornoFormulario := rfCancelado;
end;

procedure TFrmBase.FormCreate(Sender: TObject);
begin
    self.FTabEnter := true;
    Self.FEsc := true;
    if TParametroSistema.ObterParametroSistema('HOMOLOGA') = 'SIM' then
        self.Caption := '[ '+TLib.ObterNomeSistema+' ] - HOMOLOGAÇÃO'
    else
        self.Caption := '[ '+TLib.ObterNomeSistema+' ]';

    if Tlib.Mobile then
    begin
       Self.Width := MobileWidth;
       Self.Height := MobileHeight;
    end;

end;

procedure TFrmBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then
        if FEsc then
            close;
end;

procedure TFrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if ((Key = #13) and (FTabEnter = true)) then
    begin
        SelectNext(ActiveControl, true, true);
        Key := #0;
    end;
end;

procedure TFrmBase.SetAcaoJanela(const Value: TAcaoJanela);
begin
    FAcaoJanela := Value;
end;


procedure TFrmBase.SetEsc(const Value: boolean);
begin
    FEsc := Value;
end;

procedure TFrmBase.SetObjeto(const Value: TObject);
begin
    FObjeto := Value;
end;


procedure TFrmBase.SetRetornoFormulario(const Value: TRetornoFormulario);
begin
  FRetornoFormulario := Value;
end;


procedure TFrmBase.SetTabEnter(const Value: boolean);
begin
    FTabEnter := Value;
end;



end.
