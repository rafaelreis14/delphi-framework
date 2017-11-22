unit UI.Sistema.Mensagem;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Menus, Lib.Biblioteca, Vcl.ComCtrls,
    Vcl.Mask, REdit, Lib.Enumeradores,  Framework.UI.FormBase, UntErrorProvider,
    Framework.UI.MensagemBase;

type

    TFrmMensagem = class(TfrmMensagemBase)
        Imgadventencia: TImage;
        ImgPergunta: TImage;
        ImgInformacao: TImage;
        ImgErro: TImage;
        lblDescricao: TLabel;
        BtBtnSim: TBitBtn;
        BtBtnNao: TBitBtn;
        BtBtnOK: TBitBtn;
        lblTexto: TLabel;
        SpdBTnErro: TSpeedButton;
        edValor: TREdit;
        RchEdtErro: TRichEdit;
        procedure BtBtnCancelaClick(Sender: TObject);
        procedure BtBtnSimClick(Sender: TObject);
        procedure BtBtnNaoClick(Sender: TObject);
        procedure BtBtnOkClick(Sender: TObject);
        procedure SpdBTnErroClick(Sender: TObject);
        procedure BtBtnNaoExit(Sender: TObject);
        procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
        fAlturaOriginal: integer;
    public
        procedure ConfigurarTela(titulo: string; descricao: string; erro: String; tipoMsg: TipoMensagem; tipoMascara: Lib.Enumeradores.TMaskTypes = mtString; focoBotaoSim: boolean = false); override;
    end;

var
    FrmMensagem: TFrmMensagem;

implementation

{$R *.dfm}

procedure TFrmMensagem.BtBtnSimClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TFrmMensagem.BtBtnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFrmMensagem.BtBtnCancelaClick(Sender: TObject);
begin
    Self.ModalResult := mrCancel;
end;

procedure TFrmMensagem.BtBtnNaoClick(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TFrmMensagem.BtBtnNaoExit(Sender: TObject);
begin
    BtBtnSim.SetFocus
end;

procedure TFrmMensagem.ConfigurarTela(titulo, descricao, erro: String; tipoMsg: TipoMensagem; tipoMascara: TMaskTypes; focoBotaoSim: boolean);
begin
    inherited;

    if Length(Descricao) < 60 then
        Descricao := Descricao + Tlib.ReplicaCarateres(' ', 60 - Length(descricao));

    Self.lblDescricao.Caption := descricao;
    Self.Height := lblDescricao.Height + 120;
    fAlturaOriginal := Self.Height;
    Self.Width := lblDescricao.Width + 100;
    RchEdtErro.Visible := False;

    FocoNoBotaoSim := focoBotaoSim;

    case tipoMsg of
        MSGErro:
            begin
                Self.Caption := Tlib.IfTernario(Titulo = EmptyStr, 'Erro', titulo);
                ImgErro.Visible := true;
                BtBtnOK.Visible := true;
                RchEdtErro.Visible := true;
                RchEdtErro.Lines.Clear;
                RchEdtErro.Text := StringReplace(Erro, '&apos;', '', [rfReplaceAll]);
                RchEdtErro.Width := lblDescricao.Width + 80;
                SpdBTnErro.Visible := true;
                SpdBTnErro.Down := true;
                SpdBTnErro.Click;

            end;
        MSGInformacao:
            begin

                Self.Caption := Tlib.IfTernario(Titulo = EmptyStr, 'Informação', Titulo);
                ImgInformacao.Visible := true;
                BtBtnOK.Visible := true;
                RchEdtErro.Visible := False;
            end;
        MSGAdvertencia:
            begin
                Self.Caption := Tlib.IfTernario(Titulo = EmptyStr, 'Aviso', Titulo);;
                Imgadventencia.Visible := true;
                BtBtnOK.Visible := true;
            end;
        MSGPergunta:
            begin
                Self.Caption := Tlib.IfTernario(Titulo = EmptyStr, 'Pergunta', Titulo);
                ImgPergunta.Visible := true;
                BtBtnSim.Left := BtBtnNao.Left;
                BtBtnNao.Left := BtBtnOK.Left;
                BtBtnSim.Visible := true;
                BtBtnNao.Visible := true;
            end;
        MSGCaixaEntrada:
            begin
                Self.Caption := Tlib.IfTernario(Titulo = EmptyStr, 'Caixa de Entrada', Titulo);
                ImgPergunta.Visible := true;
                BtBtnSim.Left := BtBtnNao.Left;
                BtBtnNao.Left := BtBtnOK.Left;
                BtBtnSim.Visible := true;
                BtBtnNao.Visible := true;
                BtBtnSim.Caption := 'Confirmar';
                BtBtnNao.Caption := 'Cancelar';
                edValor.Visible := true;
                edValor.MaskType := REdit.TMaskTypes(TipoMascara);
                edValor.SaveLiteralCharacters := true;
                Self.Height := edValor.Height + 120;
                Self.Width := edValor.Width + 100;

            end;
    end;
end;

procedure TFrmMensagem.FormActivate(Sender: TObject);
begin
    if not FocoNoBotaoSim then
        //BtBtnNao.SetFocus
end;

procedure TFrmMensagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ValorRetorno := edValor.Value;
end;

procedure TFrmMensagem.SpdBTnErroClick(Sender: TObject);
begin
    if SpdBTnErro.Down then
    begin
        Self.Height := 320;
        SpdBTnErro.Caption := 'Ocultar'
    end
    else
    begin
        Self.Height := fAlturaOriginal;
        SpdBTnErro.Caption := 'Detalhes'
    end;
end;

end.
