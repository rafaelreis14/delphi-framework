unit UI.Sistema.Login;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Lib.Biblioteca, Data.DB, Vcl.DBCtrls, Vcl.Imaging.pngimage,
  UntErrorProvider, Vcl.ComCtrls, Framework.UI.FormBase, Lib.Parametro, RComboBox;

type
  TFrmLogin = class(TFrmBase)
    Panel1: TPanel;
    PnlRodape: TPanel;
    lblServidorSocket: TLabel;
    Label3: TLabel;
    BtBtnOk: TBitBtn;
    BtBtnSair: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edLogin: TLabeledEdit;
    edSenha: TLabeledEdit;
    cbFiliais: TRComboBox;
    cbModulos: TRComboBox;
    procedure BtBtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
    procedure cbFiliaisExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmLogin: TFrmLogin;

implementation

uses
  Datasnap.DBClient, Biz.UsuarioLogado, Biz.Filial, Biz.Modulo, Lib.Enumeradores,
  Winapi.Windows, Biz.FilialUsuario;

{$R *.dfm}

procedure TFrmLogin.BtBtnOkClick(Sender: TObject);
var
   validado : Boolean;
   Msg: string;
   ParametroFlgAlteracaoSenha: TParametro;
begin
    try
      inherited;
      validado := True;
      //
      if (edLogin.Text = '')  or (EdSenha.Text = '') or
         (cbFiliais.Value = '') or (cbModulos.value = '') then
      begin
          Validado := false;
      end;
      //
      if not(Validado) then
      begin
          TLib.MensagemInformacao('Todo os campos s�o obrigat�rios.',Self.Caption);
          Abort;
      end;
      //
      cbModulos.GetObject<TModulo>.CopiarPara(TUsuarioLogado.ObterInstancia.ModuloLogado);
      //
//      if (TUsuarioLogado.ObterInstancia.ObrigaTrocaSenha = 'S') or
//      (TUsuarioLogado.ObterInstancia.SenhaExpirada = true) then
//      begin
//           Msg := 'A sua senha expirou, favor informar a nova senha.';
//           if tlib.AbrirFormulario(TFrmTrocaSenha,TObject(Msg)) <> rfOK then
//              Application.Terminate;
//      end;
      //
      ModalResult := mrOk;
    finally

    end;
end;



procedure TFrmLogin.cbFiliaisExit(Sender: TObject);
begin
    if cbFiliais.value <> '' then
    begin
        TUsuarioLogado.ObterInstancia.Filial.Obter(cbFiliais.GetObject<TFilialUsuario>.CodigoFilial);
        TUsuarioLogado.ObterInstancia.ObterModulosDeAcesso;
        cbModulos.Enabled := True;
        cbModulos.DataSource := TUsuarioLogado.ObterInstancia.ModulosAcesso.ToList;
        cbModulos.DataBind;
        cbModulos.SetFocus;
    end;
end;



procedure TFrmLogin.FormCreate(Sender: TObject);
begin
    inherited;
    //PgCntrlLogin.TabIndex := 0;
end;

procedure TFrmLogin.edSenhaExit(Sender: TObject);
begin
    inherited;
    TUsuarioLogado.ObterInstancia.Autenticar(edLogin.Text, edSenha.Text);
    if TUsuarioLogado.ObterInstancia.Autenticado then
    begin
        TUsuarioLogado.ObterInstancia.CarregarFiliaisAcesso;
        cbFiliais.DataSource := TUsuarioLogado.ObterInstancia.FiliaisAcesso.ToList;
        cbFiliais.DataBind;
    end
    else
    begin
        cbModulos.Clear();
        edLogin.SetFocus;
    end;
end;

end.
