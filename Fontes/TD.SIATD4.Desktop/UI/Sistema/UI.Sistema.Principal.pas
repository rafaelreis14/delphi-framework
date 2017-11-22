unit UI.Sistema.Principal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, System.StrUtils,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FormBase, Vcl.ToolWin, Vcl.ActnMan,
    Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ActnList,
    Vcl.PlatformDefaultStyleActnCtrls,
    Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
    Lib.Biblioteca, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
    UntErrorProvider, UI.Sistema.Login, Vcl.Grids,
    Vcl.DBGrids, Data.DB, Vcl.Menus, UI.Sistema.Teste,
    RGrid, UI.Sistema.TrocaSenha, UI.Sistema.TesteRelatorio, MIDASLIB,
    Biz.UsuarioLogado;

type
    TFrmPrincipal = class(TFrmBase)
        SttsBrPadrao: TStatusBar;
        Image1: TImage;
        menuPrincipal: TMainMenu;
        Cadastro: TMenuItem;
        Processo: TMenuItem;
        Utilitarios1: TMenuItem;
        Relatorios: TMenuItem;
        Ajuda1: TMenuItem;
        Suporte1: TMenuItem;
        Sobreosistema1: TMenuItem;
        pnlDebug: TPanel;
        BitBtn1: TBitBtn;
        Logoff1: TMenuItem;
        AlterarSenha1: TMenuItem;
        Button1: TButton;
        Panel1: TPanel;
        procedure FormShow(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure BitBtn1Click(Sender: TObject);
        procedure Logoff1Click(Sender: TObject);
        procedure AlterarSenha1Click(Sender: TObject);
        procedure Button1Click(Sender: TObject);

    private
        { Private declarations }
        procedure SetBarraStatus;
        procedure PreparaMenu;
        procedure CadastroTipoEntrega;
        procedure CadastroCondicaoPagamentoPorCliente;

        // procedure CadastroPermissaoRotina;
    public
        mobile: boolean;
    published
        procedure MenuErro;

{$REGION 'M�dulo Venda'}
{$REGION 'Cadastro'}
        procedure CadastroCliente;

        { GERAR_METODO_VENDA }
{$ENDREGION}
{$REGION 'Processo'}
        procedure CadastroOrcamento;

{$ENDREGION}
{$REGION 'Utilit�rios'}
{$ENDREGION}
{$REGION 'Relat�rios'}
{$ENDREGION}
{$REGION 'Ajuda'}
{$ENDREGION}
{$ENDREGION}
{$REGION 'M�dulo Log�stica'}
{$REGION 'Cadastro'}
        { GERAR_METODO_LOGISTICA }
{$ENDREGION}
{$REGION 'Processo'}
{$ENDREGION}
{$REGION 'Utilit�rios'}
{$ENDREGION}
{$REGION 'Relat�rios'}
{$ENDREGION}
{$REGION 'Ajuda'}
{$ENDREGION}
{$ENDREGION}
{$REGION 'M�dulo Seguran�a'}
{$REGION 'Cadastro'}
        procedure CadastroEmpresa;
        procedure CadastroFilial;
        procedure CadastroRotina;
        procedure CadastroPermissao;
        procedure CadastroModulo;
        procedure CadastroGrupo;
        procedure CadastroUsuario;
        { GERAR_METODO_SEGURANCA }
{$ENDREGION}
{$REGION 'Processo'}
{$ENDREGION}
{$REGION 'Utilit�rios'}
{$ENDREGION}
{$REGION 'Relat�rios'}
{$ENDREGION}
{$REGION 'Ajuda'}
{$ENDREGION}
{$ENDREGION}
{$REGION 'M�dulo Configurador'}
{$REGION 'Cadastro'}
        procedure CadastroParametroSistema;
        procedure CadastroControleVersao;
        { GERAR_METODO_CONFIGURADOR }
{$ENDREGION}
{$REGION 'Processo'}
{$ENDREGION}
{$REGION 'Utilit�rios'}
{$ENDREGION}
{$REGION 'Relat�rios'}
{$ENDREGION}
{$REGION 'Ajuda'}
{$ENDREGION}
{$ENDREGION}
    end;

var
    FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses System.TypInfo, Biz.Filial,
    Biz.Cliente, Lib.Enumeradores, Lib.ResultFilter, Biz.Rotina,
    Lib.Atualizador, Lib.Aguarde, UI.Usuario.Consulta, UI.Empresa.Consulta, UI.Rotina.Consulta, UI.Permissao.Consulta, UI.Modulo.Consulta, UI.Grupo.Consulta,
    UI.Filial.Consulta, UI.Orcamento.Consulta, UI.ParametroSistema.Consulta,
    UI.ControleVersao.Consulta, Biz.ParametroSistema, UI.TipoEntrega.Consulta, UI.CondicaoPagamentoPorCliente.Consulta,
  UI.Cliente.Consulta, Dal.ControleDados, Datasnap.DBClient {GERAR_USES};

procedure TFrmPrincipal.PreparaMenu();
var

    event: TNotifyEvent;
    novoItem: TMenuItem;
    nomeMetodo: string;
    Rotina: TRotina;
    I: integer;
begin
    try
        inherited;

        for I := Cadastro.Count - 1 downto 0 do
            if Cadastro.Items[I].Tag = 1 then
                Cadastro.Items[I].Free;

        for I := Processo.Count - 1 downto 0 do
            if Processo.Items[I].Tag = 1 then
                Processo.Items[I].Free;

        for I := Utilitarios1.Count - 1 downto 0 do
            if Utilitarios1.Items[I].Tag = 1 then
                Utilitarios1.Items[I].Free;

        for I := Relatorios.Count - 1 downto 0 do
            if Relatorios.Items[I].Tag = 1 then
                Relatorios.Items[I].Free;

        for I := Ajuda1.Count - 1 downto 0 do
            if Ajuda1.Items[I].Tag = 1 then
                Ajuda1.Items[I].Free;

        TUsuarioLogado.ObterInstancia.CarregarGruposAcesso;
        TUsuarioLogado.ObterInstancia.ObterRotinasDeAcesso;

        for Rotina in TUsuarioLogado.ObterInstancia.RotinasAcesso do
        begin
            novoItem := TMenuItem.Create(Self);
            novoItem.Tag := 1;
            novoItem.Caption := Rotina.Descricao;

            case AnsiIndexStr(UpperCase(Rotina.Categoria), ['CADASTRO', 'PROCESSO', 'UTILITARIOS', 'RELATORIOS', 'AJUDA']) of
                0:
                    menuPrincipal.Items[0].Add(novoItem);
                1:
                    menuPrincipal.Items[1].Add(novoItem);
                2:
                    menuPrincipal.Items[2].Add(novoItem);
                3:
                    menuPrincipal.Items[3].Add(novoItem);
                4:
                    menuPrincipal.Items[4].Add(novoItem);
            end;
            nomeMetodo := trim(Rotina.AcaoMenu);
            TMethod(event).Code := MethodAddress(nomeMetodo);
            TMethod(event).Data := Self;

            if Assigned(TMethod(event).Code) then
                novoItem.OnClick := event
            else
            begin
                TMethod(event).Code := MethodAddress('MenuErro');
                TMethod(event).Data := Self;
                novoItem.OnClick := event;
            end;
        end;
    finally

    end;
end;

procedure TFrmPrincipal.AlterarSenha1Click(Sender: TObject);
begin
    inherited;
    if TUsuarioLogado.ObterInstancia.AlteraSenha <> 'S' then
    begin
        Tlib.MensagemAdvertencia('Usu�rio n�o tem permiss�o para alterar a senha.');
        exit;
    end;
    //
    Tlib.AbrirFormulario(TFrmTrocaSenha);
end;

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin
    inherited;
    // tlib.MensagemPergunta('teste','teste');
    // TAguardeProcesso.AguardandoFinalizacaoProcesso(25, 'O sistema foi atualizado e fechar� em 10 minutos'+#13+'   Por favor, feche o sistema assim que poss�vel.  ', $001D17DD);
    // sleep(2000);   // 2 seg
    // TAguardeProcesso.ProcessoFinalizado;
    try
        frmTeste := TfrmTeste.Create(Application);
        frmTeste.ShowModal;
    finally
        FreeAndNil(frmTeste);
    end;


    // tlib.AbrirFormulario(TFrmConFilialAcesso)

end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
    inherited;
    Tlib.AbrirFormulario(TFrmTesteRelatorio);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
    Atualizador: TAtualizador;
begin
    inherited;
    Application.OnException := Tlib.TrataErro;
    Atualizador := TAtualizador.Create('clienteSIATD');
    Atualizador.Start;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
    Item: string;

begin
    inherited;
    Self.SetBarraStatus;
    PreparaMenu;
    mobile := false;
    pnlDebug.Visible := Tlib.SistemaEstaEmModoDebug;
    if TParametroSistema.ObterParametroSistema('HOMOLOGA') = 'SIM' then
        Self.Color := clRed;
end;

procedure TFrmPrincipal.Logoff1Click(Sender: TObject);
begin
    try
        FrmLogin := TFrmLogin.Create(Self);
        If FrmLogin.ShowModal <> MrOk then
        begin
            // FreeandNil(FrmPrincipal);
            // FreeandNil(FrmLogin);
            Application.Terminate;
        end
        else
        begin
            SetBarraStatus();
            PreparaMenu();
        end;
    finally
        // FreeAndNil(FrmLogin);
    end;
end;

procedure TFrmPrincipal.MenuErro;
begin
    Tlib.MensagemInformacao('A��o do menu n�o configurada.');
end;

procedure TFrmPrincipal.SetBarraStatus;
begin
    SttsBrPadrao.Panels[1].Text := Tlib.ObterVersao;
    SttsBrPadrao.Panels[3].Text := TUsuarioLogado.ObterInstancia.Login;
    SttsBrPadrao.Panels[5].Text := TUsuarioLogado.ObterInstancia.Filial.Empresa + '-' + TUsuarioLogado.ObterInstancia.Filial.NomeEmpresa;
    SttsBrPadrao.Panels[7].Text := TUsuarioLogado.ObterInstancia.Filial.Filial + '-' + TUsuarioLogado.ObterInstancia.Filial.Descricao;
    SttsBrPadrao.Panels[9].Text := TUsuarioLogado.ObterInstancia.ModuloLogado.Modulo;
    // SttsBrPadrao.Panels[9].Text := IntToStr(TLib.UsuarioLogado.Conexao.SPID);
    // SttsBrPadrao.Panels[11].Text := UpperCase(TLib.UsuarioLogado.Conexao.DataBase);
    //
    // lblServidorSocket.Caption :=
    // Tlib.IfTernario(UpperCase(DMCliente.HostName) = '',
    // DMCliente.IPaddress,UpperCase(DMCliente.HostName)) +' - ['+
    // IntToStr(DMCliente.ClientSocket.Port)+']';

end;

procedure TFrmPrincipal.CadastroUsuario;
begin
    Tlib.AbrirFormulario(TfrmConUsuario);
end;

procedure TFrmPrincipal.CadastroControleVersao;
begin
    Tlib.AbrirFormulario(TFrmConControleVersao);
end;

procedure TFrmPrincipal.CadastroEmpresa;
begin
    Tlib.AbrirFormulario(TfrmConEmpresa);
end;

procedure TFrmPrincipal.CadastroFilial;
begin
    Tlib.AbrirFormulario(TFrmConFilial);
end;

procedure TFrmPrincipal.CadastroRotina;
begin
    Tlib.AbrirFormulario(TfrmConRotina);
end;

procedure TFrmPrincipal.CadastroParametroSistema;
begin
    Tlib.AbrirFormulario(TFrmConParametroSistema);
end;

procedure TFrmPrincipal.CadastroPermissao;
begin
    Tlib.AbrirFormulario(TfrmConPermissao);
end;

procedure TFrmPrincipal.CadastroModulo;
begin
    Tlib.AbrirFormulario(TfrmConModulo);
end;

procedure TFrmPrincipal.CadastroGrupo;
begin
    Tlib.AbrirFormulario(TfrmConGrupo);
end;

procedure TFrmPrincipal.CadastroOrcamento;
begin
    Tlib.AbrirFormulario(TfrmConOrcamento);
end;

procedure TFrmPrincipal.CadastroTipoEntrega;
begin
    Tlib.AbrirFormulario(TfrmConTipoEntrega);
end;

procedure TFrmPrincipal.CadastroCliente;
begin
    Tlib.AbrirFormulario(TfrmConCliente);

end;

procedure TFrmPrincipal.CadastroCondicaoPagamentoPorCliente;
begin
    Tlib.AbrirFormulario(TfrmConCondicaoPagamentoPorCliente);
end;
{ GERAR_CORPO_METODO }

end.
