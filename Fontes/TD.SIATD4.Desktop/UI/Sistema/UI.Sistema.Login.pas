unit UI.Sistema.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FormBase, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Lib.Biblioteca, Data.DB, Vcl.DBCtrls, Vcl.Imaging.pngimage,
  UntErrorProvider, Biz.UsuarioLogado, RComboBox, Lib.Enumeradores, Lib.Parametro;

type
  TFrmLogin = class(TFrmBase)
    edLogin: TLabeledEdit;
    edSenha: TLabeledEdit;
    BtBtnOk: TBitBtn;
    BtBtnSair: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblServidorSocket: TLabel;
    Image1: TImage;
    cbFiliais: TRComboBox;
    cbModulos: TRComboBox;
    procedure edSenhaExit(Sender: TObject);
    procedure BtBtnOkClick(Sender: TObject);
    procedure cbFiliaisExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    //procedure ModulosUsuario(pLogin: string);
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FrmLogin: TFrmLogin;

implementation

uses
  Datasnap.DBClient, Biz.Usuario, Biz.Filial, Biz.Modulo, UI.Sistema.TrocaSenha, Biz.FilialUsuario,
  Biz.ParametroSistema;

{$R *.dfm}

procedure TFrmLogin.edSenhaExit(Sender: TObject);
begin
    inherited;
    TUsuarioLogado.ObterInstancia.Autenticar(edLogin.Text, edSenha.Text);
    if TUsuarioLogado.ObterInstancia.Autenticado then
    begin
        TUsuarioLogado.ObterInstancia.CarregarFiliaisAcesso;
        cbFiliais.DataSource<TFilialUsuario>(TUsuarioLogado.ObterInstancia.FiliaisAcesso);
        cbFiliais.DataBind;
    end
    else
    begin
        cbModulos.Clear();
        edLogin.SetFocus;
    end;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  inherited;
    if TParametroSistema.ObterParametroSistema('HOMOLOGA') = 'SIM' then
        Self.Color := clRed;
end;

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
          TLib.MensagemInformacao('Todo os campos são obrigatórios.',Self.Caption);
          Abort;
      end;
      //
      cbModulos.GetObject<TModulo>.CopiarPara(TUsuarioLogado.ObterInstancia.ModuloLogado);
      //
      if (TUsuarioLogado.ObterInstancia.ObrigaTrocaSenha = 'S') or
      (TUsuarioLogado.ObterInstancia.SenhaExpirada = true) then
      begin
           Msg := 'A sua senha expirou, favor informar a nova senha.';
           if tlib.AbrirFormulario(TFrmTrocaSenha,TObject(Msg)) <> rfOK then
              Application.Terminate;
      end;
      //
      TUsuarioLogado.ObterInstancia.Deslogar;
      TUsuarioLogado.ObterInstancia.Logar;
      ModalResult := mrOk;
    finally

    end;
end;


procedure TFrmLogin.cbFiliaisExit(Sender: TObject);
begin
inherited;
    if cbFiliais.value <> '' then
    begin

        TUsuarioLogado.ObterInstancia.Filial.Obter(cbFiliais.GetObject<TFilialUsuario>.CodigoFilial);
        TUsuarioLogado.ObterInstancia.ObterModulosDeAcesso;
        cbModulos.Enabled := True;
        cbModulos.DataSource<TModulo>(TUsuarioLogado.ObterInstancia.ModulosAcesso);
        cbModulos.DataBind;
        cbModulos.SetFocus;
    end;
end;



end.
