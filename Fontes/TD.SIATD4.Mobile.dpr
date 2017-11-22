program TD.SIATD4.Mobile;

uses
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils,
  Lib.Aguarde in 'TD.SIATD4.Core\Lib\Lib.Aguarde.pas',
  Lib.Atualizador in 'TD.SIATD4.Core\Lib\Lib.Atualizador.pas',
  Lib.Base in 'TD.SIATD4.Core\Lib\Lib.Base.pas',
  Lib.Biblioteca in 'TD.SIATD4.Core\Lib\Lib.Biblioteca.pas',
  Lib.CRUDFactory in 'TD.SIATD4.Core\Lib\Lib.CRUDFactory.pas',
  Lib.Enumeradores in 'TD.SIATD4.Core\Lib\Lib.Enumeradores.pas',
  Lib.Erro in 'TD.SIATD4.Core\Lib\Lib.Erro.pas',
  Lib.Filter in 'TD.SIATD4.Core\Lib\Lib.Filter.pas',
  Lib.Lista in 'TD.SIATD4.Core\Lib\Lib.Lista.pas',
  Lib.Observador in 'TD.SIATD4.Core\Lib\Lib.Observador.pas',
  Lib.Parametro in 'TD.SIATD4.Core\Lib\Lib.Parametro.pas',
  Lib.ProcessList in 'TD.SIATD4.Core\Lib\Lib.ProcessList.pas',
  Lib.ResultFilter in 'TD.SIATD4.Core\Lib\Lib.ResultFilter.pas',
  Lib.VersionInfo in 'TD.SIATD4.Core\Lib\Lib.VersionInfo.pas',
  Dal.CondicaoConsulta in 'TD.SIATD4.Dal\Classes\Dal.CondicaoConsulta.pas',
  Dal.ControleDados in 'TD.SIATD4.Dal\Classes\Dal.ControleDados.pas',
  Dal.FabricaSQL in 'TD.SIATD4.Dal\Classes\Dal.FabricaSQL.pas',
  Framework.UI.FormBase in 'TD.SIATD4.Core\Framework\UI\Framework.UI.FormBase.pas' {FrmBase},
  Framework.UI.FilterBase in 'TD.SIATD4.Core\Framework\UI\Framework.UI.FilterBase.pas',
  Framework.UI.MensagemBase in 'TD.SIATD4.Core\Framework\UI\Framework.UI.MensagemBase.pas' {frmMensagemBase},
  Framework.Controlador.CadastroBase in 'TD.SIATD4.Core\Framework\Controlador\Framework.Controlador.CadastroBase.pas',
  Framework.Controlador.ConsultaBase in 'TD.SIATD4.Core\Framework\Controlador\Framework.Controlador.ConsultaBase.pas',
  UI.Sistema.Login in 'TD.SIATD4.Mobile\UI\Sistema\UI.Sistema.Login.pas' {FrmLogin},
  UI.Sistema.Principal in 'TD.SIATD4.Mobile\UI\Sistema\UI.Sistema.Principal.pas' {FrmPrincipal},
  Biz.TipoEntrega in 'TD.SIATD4.Core\Biz\Orcamento\Biz.TipoEntrega.pas',
  Framework.UI.AutorizacaoProcessoBase in 'TD.SIATD4.Core\Framework\UI\Framework.UI.AutorizacaoProcessoBase.pas' {frmAutorizacaoProcessoBase},
  Biz.Fila in 'TD.SIATD4.Core\Biz\Inventario\Biz.Fila.pas',
  Biz.Tarefa in 'TD.SIATD4.Core\Biz\Inventario\Biz.Tarefa.pas',
  Biz.Dispositivo in 'TD.SIATD4.Core\Biz\Inventario\Biz.Dispositivo.pas',
  Biz.TipoOperacao in 'TD.SIATD4.Core\Biz\Inventario\Biz.TipoOperacao.pas',
  Biz.Produto in 'TD.SIATD4.Core\Biz\Produto\Biz.Produto.pas',
  Biz.Estoque in 'TD.SIATD4.Core\Biz\Produto\Biz.Estoque.pas',
  UI.Inventario.Operacao in 'TD.SIATD4.Mobile\UI\Inventario\UI.Inventario.Operacao.pas' {frmInventario},
  UI.Base.CadastroPadrao in 'TD.SIATD4.Mobile\UI\Base\UI.Base.CadastroPadrao.pas' {FrmCadastroPadraoMobile},
  UI.Base.ConsultaPadrao in 'TD.SIATD4.Mobile\UI\Base\UI.Base.ConsultaPadrao.pas' {FrmConsultaPadraoMobile},
  UI.Base.Controlador.CadastroMobile in 'TD.SIATD4.Mobile\UI\Base\UI.Base.Controlador.CadastroMobile.pas',
  UI.Base.Controlador.ConsultaMobile in 'TD.SIATD4.Mobile\UI\Base\UI.Base.Controlador.ConsultaMobile.pas',
  UI.Produto.Cadastro in 'TD.SIATD4.Mobile\UI\Produto\UI.Produto.Cadastro.pas',
  UI.Sistema.Filter in 'TD.SIATD4.Mobile\UI\Sistema\UI.Sistema.Filter.pas' {FrmFilter},
  UI.Sistema.MensagemMobile in 'TD.SIATD4.Mobile\UI\Sistema\UI.Sistema.MensagemMobile.pas' {FrmMensagem},
  Framework.Interfaces.Listavel in 'TD.SIATD4.Core\Framework\Interfaces\Framework.Interfaces.Listavel.pas',
  Framework.Interfaces.CRUDGenerico in 'TD.SIATD4.Core\Framework\Interfaces\Framework.Interfaces.CRUDGenerico.pas',
  Framework.Interfaces.CRUD in 'TD.SIATD4.Core\Framework\Interfaces\Framework.Interfaces.CRUD.pas',
  Framework.Interfaces.Consultavel in 'TD.SIATD4.Core\Framework\Interfaces\Framework.Interfaces.Consultavel.pas',
  Lib.ClasseBase in 'TD.SIATD4.Core\Lib\Lib.ClasseBase.pas',
  Biz.Acesso in 'TD.SIATD4.Core\Biz\Sistema\Biz.Acesso.pas',
  Biz.Empresa in 'TD.SIATD4.Core\Biz\Sistema\Biz.Empresa.pas',
  Biz.Filial in 'TD.SIATD4.Core\Biz\Sistema\Biz.Filial.pas',
  Biz.FilialUsuario in 'TD.SIATD4.Core\Biz\Sistema\Biz.FilialUsuario.pas',
  Biz.Grupo in 'TD.SIATD4.Core\Biz\Sistema\Biz.Grupo.pas',
  Biz.GrupoUsuario in 'TD.SIATD4.Core\Biz\Sistema\Biz.GrupoUsuario.pas',
  Biz.Modulo in 'TD.SIATD4.Core\Biz\Sistema\Biz.Modulo.pas',
  Biz.Permissao in 'TD.SIATD4.Core\Biz\Sistema\Biz.Permissao.pas',
  Biz.PermissaoAcesso in 'TD.SIATD4.Core\Biz\Sistema\Biz.PermissaoAcesso.pas',
  Biz.PermissaoRotina in 'TD.SIATD4.Core\Biz\Sistema\Biz.PermissaoRotina.pas',
  Biz.Rotina in 'TD.SIATD4.Core\Biz\Sistema\Biz.Rotina.pas',
  Biz.Usuario in 'TD.SIATD4.Core\Biz\Sistema\Biz.Usuario.pas',
  Biz.UsuarioLogado in 'TD.SIATD4.Core\Biz\Sistema\Biz.UsuarioLogado.pas',
  DBConnect_TLB in 'TD.SIATD4.Dal\TypeLibrary\DBConnect_TLB.pas',
  mscorlib_TLB in 'TD.SIATD4.Dal\TypeLibrary\mscorlib_TLB.pas',
  Biz.ParametroSistema in 'TD.SIATD4.Core\Biz\Sistema\Biz.ParametroSistema.pas',
  Biz.Log in 'TD.SIATD4.Core\Biz\Sistema\Biz.Log.pas',
  Biz.Auditoria in 'TD.SIATD4.Core\Biz\Sistema\Biz.Auditoria.pas',
  Lib.Persistable in 'TD.SIATD4.Core\Lib\Lib.Persistable.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Tlib.FormMensagem := tfrmMensagem;
  Tlib.FormFiltro := TfrmFilter;
//  TLib.FormAutorizacao := TfrmAutorizacaoProcesso;
//  TLib.FormTrocaSenha := TFrmTrocaSenha;
  TLib.Mobile := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmMensagem, FrmMensagem);
  if ParamCount > 0 then
  begin
      TUsuarioLogado.ObterInstancia.Autenticar(ParamStr(1), ParamStr(2));

      if not TUsuarioLogado.ObterInstancia.Autenticado then
          Application.Terminate;

      TUsuarioLogado.ObterInstancia.Filial.Obter(ParamStr(3));
      TUsuarioLogado.ObterInstancia.ModuloLogado.Obter(ParamStr(4));
      Application.Run;
  end
  else
  begin
      if FrmLogin.ShowModal <> MrOk then
      begin

          FreeandNil(FrmPrincipal);
          FreeandNil(FrmLogin);
          Application.Terminate;
      end
      else
      begin
          FreeandNil(FrmLogin);
          Application.Run;
      end;
  end;


end.
