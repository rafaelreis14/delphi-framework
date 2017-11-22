unit Framework.UI.TrocaSenhaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FormBase, UntErrorProvider, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, REdit;

type
  TFrmTrocaSenhaBase = class(TFrmBase)
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtSenhaAtual: TREdit;
    EdtNovaSenha: TREdit;
    EdtRepeteNovaSenha: TREdit;
    GroupBox1: TGroupBox;
    LblUsuario: TLabel;
    btnEntrar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnEntrarClick(Sender: TObject);
    procedure EdtNovaSenhaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrocaSenhaBase: TFrmTrocaSenhaBase;

implementation

uses
  Data.DB, Lib.Parametro, Lib.Biblioteca, Biz.UsuarioLogado, Lib.Enumeradores;

{$R *.dfm}

procedure TFrmTrocaSenhaBase.btnEntrarClick(Sender: TObject);
Var
   ParametroSenha, ParametroValidaSenha : TParametro;
   DatasetPoliticaSenha : TDataset;
   RegraSenha : integer;
  I: Integer;
begin
    inherited;
    if EdtSenhaAtual.Text <> tlib.Desencriptar(TUsuarioLogado.ObterInstancia.Senha) then
    begin
       Tlib.MensagemAdvertencia('Senha atual do usuário não confere com a cadastrada, favor verificar.');
       EdtSenhaAtual.SetFocus;
       exit;
    end;
    if EdtSenhaAtual.Text = EdtNovaSenha.Text then
    begin
       Tlib.MensagemAdvertencia('A nova senha não pode ser igual a senha atual, favor verificar.');
       EdtNovaSenha.SetFocus;
       exit;
    end;
    if (EdtNovaSenha.Text <> EmptyStr) then
    begin
        if not TUsuarioLogado.ObterInstancia.ValidarSenha(EdtNovaSenha.Text) then
        begin
            tlib.MensagemInformacao('Senha deve conter no mínimo 8 caracteres e/ou conter letras e números');
            EdtNovaSenha.SetFocus;
            exit;
        end;
    end;
    if EdtNovaSenha.Text <> EdtRepeteNovaSenha.Text then
    begin
       Tlib.MensagemAdvertencia('A nova senha não conicide com a contra-senha, favor verificar.');
       EdtNovaSenha.SetFocus;
       exit;
    end;
    //
    try
      ParametroValidaSenha := TParametro.Create;
      ParametroValidaSenha.Add('S23','S23_S01_LOGIN',TUsuarioLogado.ObterInstancia.Login);
//      DatasetPoliticaSenha := BaseLib.XmlToDataset(BaseLib.ExecutaTarefa('ValidaSenha',Self.Name,ParametroValidaSenha));
      //
//      if DatasetPoliticaSenha.RecordCount > 0 then
//      begin
//           while not DatasetPoliticaSenha.Eof do
//           begin
//                if tlib.Desencriptar(DatasetPoliticaSenha.FieldByName('S23_SENHA').AsString) = EdtNovaSenha.Value then
//                begin
//                    Tlib.MensagemAdvertencia('A nova senha não atende os requisitos de histórico de senha,'+#13+
//                                      'A senha informada deve ser diferentes das 3 últimas senhas.');
//                    EdtNovaSenha.SetFocus;
//                    exit;
//                end;
//                DatasetPoliticaSenha.Next;
//           end;
//      end;
      //
      ParametroSenha := TParametro.Create;

      TUsuarioLogado.ObterInstancia.Senha := tlib.Encriptar(EdtNovaSenha.Value);
      TUsuarioLogado.ObterInstancia.Alterar;
      Tlib.MensagemInformacao('Senha alterada com sucesso!');
      TUsuarioLogado.ObterInstancia.SenhaAlterada := True;
      RetornoFormulario := rfOK;
      Self.Close;
    finally
       FreeAndNil(ParametroSenha);
       FreeAndNil(DatasetPoliticaSenha);
    end;
end;

procedure TFrmTrocaSenhaBase.EdtNovaSenhaExit(Sender: TObject);
begin
   if (Length(EdtNovaSenha.Value) < 8) and (EdtNovaSenha.Value <> EmptyStr) then
  begin
      tlib.MensagemInformacao('Senha deve conter no mínimo 8 caracteres');
      EdtNovaSenha.Clear;
      EdtNovaSenha.SetFocus;
  end;

end;

procedure TFrmTrocaSenhaBase.FormCreate(Sender: TObject);
begin
  inherited;
  TUsuarioLogado.ObterInstancia.SenhaAlterada := False;
  LblUsuario.Caption := TUsuarioLogado.ObterInstancia.Login;
end;

end.
