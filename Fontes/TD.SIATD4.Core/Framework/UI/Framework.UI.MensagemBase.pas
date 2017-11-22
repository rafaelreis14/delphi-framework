unit Framework.UI.MensagemBase;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FormBase, UntErrorProvider,
    Lib.Enumeradores;

type
    TFrmMensagemBase = class(TFrmBase)
    private
        FValorRetorno: string;
        FFocoNoBotaoSim: boolean;
        procedure SetValorRetorno(const Value: string);
        procedure SetFocoNoBotaoSim(const Value: boolean);
        procedure FormCreate(Sender: TObject);

    public
        property ValorRetorno: string read FValorRetorno write SetValorRetorno;
        property FocoNoBotaoSim: boolean read FFocoNoBotaoSim write SetFocoNoBotaoSim;
        procedure ConfigurarTela(titulo: string; descricao: string; erro: String; tipoMsg: TipoMensagem; tipoMascara: TMaskTypes = mtString; focoBotaoSim: boolean = false); virtual;
    end;

var
    frmMensagemBase: TFrmMensagemBase;

implementation

{$R *.dfm}
{ TFrmMensagemBase }

procedure TFrmMensagemBase.ConfigurarTela(titulo, descricao, erro: String;
  tipoMsg: TipoMensagem; tipoMascara: TMaskTypes; focoBotaoSim: boolean);
begin

end;

procedure TFrmMensagemBase.FormCreate(Sender: TObject);
begin
    inherited;
    Self.FormStyle := fsStayOnTop;
end;

procedure TFrmMensagemBase.SetFocoNoBotaoSim(const Value: boolean);
begin
    FFocoNoBotaoSim := Value;
end;

procedure TFrmMensagemBase.SetValorRetorno(const Value: string);
begin
    FValorRetorno := Value;
end;

end.
