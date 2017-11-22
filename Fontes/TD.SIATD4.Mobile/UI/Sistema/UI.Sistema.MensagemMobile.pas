unit UI.Sistema.MensagemMobile;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Lib.Biblioteca, Vcl.Buttons,
    Vcl.ExtCtrls, Lib.Enumeradores, Framework.UI.MensagemBase, UntErrorProvider;

type
    TFrmMensagem = class(TfrmMensagemBase)
        Label1: TLabel;
        BtBtnSim: TBitBtn;
        BtBtnNao: TBitBtn;
        BtBtnOK: TBitBtn;
        Panel1: TPanel;
        lblDescricao: TLabel;
        pnMensagemErro: TPanel;
        mmErro: TMemo;
        btnErro: TButton;
        procedure btnErroClick(Sender: TObject);
        procedure BtBtnSimClick(Sender: TObject);
        procedure BtBtnNaoClick(Sender: TObject);
        procedure BtBtnOKClick(Sender: TObject);
    private

        { Private declarations }
    public
         procedure ConfigurarTela(titulo, descricao, erro: String; tipoMsg: TipoMensagem; tipoMascara: Lib.Enumeradores.TMaskTypes;focoBotaoSim: boolean); override;
    end;

var
    FrmMensagem: TFrmMensagem;

implementation

{$R *.dfm}

procedure TFrmMensagem.BtBtnNaoClick(Sender: TObject);
begin
    inherited;
    ModalResult := mrNo;
end;

procedure TFrmMensagem.BtBtnOKClick(Sender: TObject);
begin
    inherited;
    ModalResult := mrOk;
end;

procedure TFrmMensagem.BtBtnSimClick(Sender: TObject);
begin
    inherited;
    ModalResult := mrYes;
end;

procedure TFrmMensagem.btnErroClick(Sender: TObject);
begin
    inherited;
    if pnMensagemErro.Top <> lblDescricao.Top then
    begin
        pnMensagemErro.BiDiMode := bdLeftToRight;
        pnMensagemErro.Align := alClient;
        mmErro.Align := alClient;
    end
    else
    begin
        pnMensagemErro.BiDiMode := bdRightToLeft;
        pnMensagemErro.Align := alBottom;
        pnMensagemErro.Height := 29;
    end;
end;

procedure TFrmMensagem.ConfigurarTela(titulo, descricao, erro: String; tipoMsg: TipoMensagem; tipoMascara: Lib.Enumeradores.TMaskTypes;
  focoBotaoSim: boolean);
begin
    Self.lblDescricao.Caption := descricao;
    case tipoMsg of
        MSGErro:
            begin
                Self.Caption := 'Erro';
                BtBtnOK.Visible := true;
                pnMensagemErro.Visible := true;
                mmErro.Lines.Add(erro);
            end;
        MSGInformacao:
            begin
                Self.Caption := 'Informação';
                BtBtnOK.Visible := true;
            end;
        MSGAdvertencia:
            begin
                Self.Caption := 'Aviso';
                BtBtnOK.Visible := true;
            end;
        MSGPergunta:
            begin
                Self.Caption := 'Pergunta';
                BtBtnSim.Left := BtBtnNao.Left;
                BtBtnNao.Left := BtBtnOK.Left;
                BtBtnSim.Visible := true;
                BtBtnNao.Visible := true;
            end;
    end;
end;

end.
