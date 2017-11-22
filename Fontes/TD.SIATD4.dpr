program TD.SIATD4;



uses
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils,
  Framework.UI.FormBase in 'TD.SIATD4.Core\Framework\UI\Framework.UI.FormBase.pas' {FrmBase},
  Framework.UI.FilterBase in 'TD.SIATD4.Core\Framework\UI\Framework.UI.FilterBase.pas' {FrmFilterBase},
  Framework.UI.MensagemBase in 'TD.SIATD4.Core\Framework\UI\Framework.UI.MensagemBase.pas' {frmMensagemBase},
  Framework.Interfaces.CRUD in 'TD.SIATD4.Core\Framework\Interfaces\Framework.Interfaces.CRUD.pas',
  Framework.Controlador.CadastroBase in 'TD.SIATD4.Core\Framework\Controlador\Framework.Controlador.CadastroBase.pas',
  Framework.Controlador.ConsultaBase in 'TD.SIATD4.Core\Framework\Controlador\Framework.Controlador.ConsultaBase.pas',
  Lib.Aguarde in 'TD.SIATD4.Core\Lib\Lib.Aguarde.pas',
  Lib.Atualizador in 'TD.SIATD4.Core\Lib\Lib.Atualizador.pas',
  Lib.Biblioteca in 'TD.SIATD4.Core\Lib\Lib.Biblioteca.pas',
  Lib.Enumeradores in 'TD.SIATD4.Core\Lib\Lib.Enumeradores.pas',
  Lib.Filter in 'TD.SIATD4.Core\Lib\Lib.Filter.pas',
  Lib.Lista in 'TD.SIATD4.Core\Lib\Lib.Lista.pas',
  Lib.Observador in 'TD.SIATD4.Core\Lib\Lib.Observador.pas',
  Lib.Parametro in 'TD.SIATD4.Core\Lib\Lib.Parametro.pas',
  Lib.Persistable in 'TD.SIATD4.Core\Lib\Lib.Persistable.pas',
  Lib.ProcessList in 'TD.SIATD4.Core\Lib\Lib.ProcessList.pas',
  Lib.ResultFilter in 'TD.SIATD4.Core\Lib\Lib.ResultFilter.pas',
  Lib.VersionInfo in 'TD.SIATD4.Core\Lib\Lib.VersionInfo.pas',
  Biz.Cliente in 'TD.SIATD4.Core\Biz\Cliente\Biz.Cliente.pas',
  Biz.CreditoCliente in 'TD.SIATD4.Core\Biz\Cliente\Biz.CreditoCliente.pas',
  Biz.Serasa in 'TD.SIATD4.Core\Biz\Cliente\Biz.Serasa.pas',
  Biz.Endereco in 'TD.SIATD4.Core\Biz\Endereco\Biz.Endereco.pas',
  Biz.Estoque in 'TD.SIATD4.Core\Biz\Produto\Biz.Estoque.pas',
  Biz.Produto in 'TD.SIATD4.Core\Biz\Produto\Biz.Produto.pas',
  Biz.Grupo in 'TD.SIATD4.Core\Biz\Sistema\Biz.Grupo.pas',
  Biz.Modulo in 'TD.SIATD4.Core\Biz\Sistema\Biz.Modulo.pas',
  Biz.Permissao in 'TD.SIATD4.Core\Biz\Sistema\Biz.Permissao.pas',
  Biz.Usuario in 'TD.SIATD4.Core\Biz\Sistema\Biz.Usuario.pas',
  Biz.UsuarioLogado in 'TD.SIATD4.Core\Biz\Sistema\Biz.UsuarioLogado.pas',
  Biz.Vendedor in 'TD.SIATD4.Core\Biz\Vendedor\Biz.Vendedor.pas',
  Dal.CondicaoConsulta in 'TD.SIATD4.Dal\Classes\Dal.CondicaoConsulta.pas',
  Dal.ControleDados in 'TD.SIATD4.Dal\Classes\Dal.ControleDados.pas',
  Dal.FabricaSQL in 'TD.SIATD4.Dal\Classes\Dal.FabricaSQL.pas',
  UI.Base.Controlador.CadastroDesktop in 'TD.SIATD4.Desktop\UI\Base\UI.Base.Controlador.CadastroDesktop.pas',
  UI.Base.Controlador.ConsultaDesktop in 'TD.SIATD4.Desktop\UI\Base\UI.Base.Controlador.ConsultaDesktop.pas',
  UI.Base.CadastroPadrao in 'TD.SIATD4.Desktop\UI\Base\UI.Base.CadastroPadrao.pas' {FrmCadastroPadrao},
  UI.Base.ConsultaPadrao in 'TD.SIATD4.Desktop\UI\Base\UI.Base.ConsultaPadrao.pas' {FrmConsultaPadrao},
  UI.Frame.PesquisaCliente in 'TD.SIATD4.Desktop\UI\Frames\UI.Frame.PesquisaCliente.pas' {frmPesquisaCliente: TFrame},
  UI.Frame.PesquisaEndereco in 'TD.SIATD4.Desktop\UI\Frames\UI.Frame.PesquisaEndereco.pas' {frmPesquisaEndereco: TFrame},
  UI.Frame.PesquisaProduto in 'TD.SIATD4.Desktop\UI\Frames\UI.Frame.PesquisaProduto.pas' {frmPesquisaProduto: TFrame},
  UI.Frame.PesquisaVendedor in 'TD.SIATD4.Desktop\UI\Frames\UI.Frame.PesquisaVendedor.pas' {frmPesquisaVendedor: TFrame},
  UI.Sistema.AutorizacaoProcesso in 'TD.SIATD4.Desktop\UI\Sistema\UI.Sistema.AutorizacaoProcesso.pas' {frmAutorizacaoProcesso},
  UI.Sistema.Filter in 'TD.SIATD4.Desktop\UI\Sistema\UI.Sistema.Filter.pas' {frmFilter},
  UI.Sistema.Login in 'TD.SIATD4.Desktop\UI\Sistema\UI.Sistema.Login.pas' {FrmLogin},
  UI.Sistema.Mensagem in 'TD.SIATD4.Desktop\UI\Sistema\UI.Sistema.Mensagem.pas' {FrmMensagem},
  UI.Sistema.Principal in 'TD.SIATD4.Desktop\UI\Sistema\UI.Sistema.Principal.pas' {FrmPrincipal},
  UI.Sistema.Teste in 'TD.SIATD4.Desktop\UI\Sistema\UI.Sistema.Teste.pas' {frmTeste},
  UI.Sistema.TesteRelatorio in 'TD.SIATD4.Desktop\UI\Sistema\UI.Sistema.TesteRelatorio.pas' {FrmTesteRelatorio},
  UI.Sistema.TrocaSenha in 'TD.SIATD4.Desktop\UI\Sistema\UI.Sistema.TrocaSenha.pas' {FrmTrocaSenha},
  UI.Filial.Cadastro in 'TD.SIATD4.Desktop\UI\Filial\UI.Filial.Cadastro.pas',
  UI.Filial.Consulta in 'TD.SIATD4.Desktop\UI\Filial\UI.Filial.Consulta.pas',
  Biz.Adminsitradora in 'TD.SIATD4.Core\Biz\Orcamento\Biz.Adminsitradora.pas',
  Biz.TabelaComissao in 'TD.SIATD4.Core\Biz\Orcamento\Biz.TabelaComissao.pas',
  Biz.ContasReceber in 'TD.SIATD4.Core\Biz\ContasReceber\Biz.ContasReceber.pas',
  Framework.UI.AutorizacaoProcessoBase in 'TD.SIATD4.Core\Framework\UI\Framework.UI.AutorizacaoProcessoBase.pas' {frmAutorizacaoProcessoBase},
  Framework.UI.TrocaSenhaBase in 'TD.SIATD4.Core\Framework\UI\Framework.UI.TrocaSenhaBase.pas' {FrmTrocaSenhaBase},
  UI.Usuario.Consulta in 'TD.SIATD4.Desktop\UI\Usuario\UI.Usuario.Consulta.pas' {FrmConUsuario},
  UI.Usuario.Cadastro in 'TD.SIATD4.Desktop\UI\Usuario\UI.Usuario.Cadastro.pas' {FrmCadUsuario},
  Biz.Funcionario in 'TD.SIATD4.Core\Biz\Funcionario\Biz.Funcionario.pas',
  Framework.Interfaces.Consultavel in 'TD.SIATD4.Core\Framework\Interfaces\Framework.Interfaces.Consultavel.pas',
  Biz.Filial in 'TD.SIATD4.Core\Biz\Sistema\Biz.Filial.pas',
  Biz.Empresa in 'TD.SIATD4.Core\Biz\Sistema\Biz.Empresa.pas',
  UI.Empresa.Cadastro in 'TD.SIATD4.Desktop\UI\Empresa\UI.Empresa.Cadastro.pas',
  UI.Empresa.Consulta in 'TD.SIATD4.Desktop\UI\Empresa\UI.Empresa.Consulta.pas',
  UI.Rotina.Cadastro in 'TD.SIATD4.Desktop\UI\Rotina\UI.Rotina.Cadastro.pas',
  UI.Rotina.Consulta in 'TD.SIATD4.Desktop\UI\Rotina\UI.Rotina.Consulta.pas',
  Biz.Rotina in 'TD.SIATD4.Core\Biz\Sistema\Biz.Rotina.pas',
  UI.Permissao.Cadastro in 'TD.SIATD4.Desktop\UI\Permissao\UI.Permissao.Cadastro.pas',
  UI.Permissao.Consulta in 'TD.SIATD4.Desktop\UI\Permissao\UI.Permissao.Consulta.pas',
  UI.Modulo.Cadastro in 'TD.SIATD4.Desktop\UI\Modulo\UI.Modulo.Cadastro.pas',
  UI.Modulo.Consulta in 'TD.SIATD4.Desktop\UI\Modulo\UI.Modulo.Consulta.pas',
  UI.Grupo.Cadastro in 'TD.SIATD4.Desktop\UI\Grupo\UI.Grupo.Cadastro.pas',
  UI.Grupo.Consulta in 'TD.SIATD4.Desktop\UI\Grupo\UI.Grupo.Consulta.pas',
  Framework.Interfaces.Listavel in 'TD.SIATD4.Core\Framework\Interfaces\Framework.Interfaces.Listavel.pas',
  Framework.Interfaces.CRUDGenerico in 'TD.SIATD4.Core\Framework\Interfaces\Framework.Interfaces.CRUDGenerico.pas',
  Biz.Acesso in 'TD.SIATD4.Core\Biz\Sistema\Biz.Acesso.pas',
  UI.Acesso.Cadastro in 'TD.SIATD4.Desktop\UI\Acesso\UI.Acesso.Cadastro.pas' {frmCadAcessos},
  Biz.PermissaoAcesso in 'TD.SIATD4.Core\Biz\Sistema\Biz.PermissaoAcesso.pas',
  Biz.FilialUsuario in 'TD.SIATD4.Core\Biz\Sistema\Biz.FilialUsuario.pas',
  Biz.GrupoUsuario in 'TD.SIATD4.Core\Biz\Sistema\Biz.GrupoUsuario.pas',
  Biz.PermissaoRotina in 'TD.SIATD4.Core\Biz\Sistema\Biz.PermissaoRotina.pas',
  Lib.ClasseBase in 'TD.SIATD4.Core\Lib\Lib.ClasseBase.pas',
  Lib.Base in 'TD.SIATD4.Core\Lib\Lib.Base.pas',
  Biz.Orcamento in 'TD.SIATD4.Core\Biz\Orcamento\Biz.Orcamento.pas',
  Biz.Auditoria in 'TD.SIATD4.Core\Biz\Sistema\Biz.Auditoria.pas',
  Biz.Log in 'TD.SIATD4.Core\Biz\Sistema\Biz.Log.pas',
  Biz.ParametroSistema in 'TD.SIATD4.Core\Biz\Sistema\Biz.ParametroSistema.pas',
  UI.ParametroSistema.Cadastro in 'TD.SIATD4.Desktop\UI\ParametroSistema\UI.ParametroSistema.Cadastro.pas',
  UI.ParametroSistema.Consulta in 'TD.SIATD4.Desktop\UI\ParametroSistema\UI.ParametroSistema.Consulta.pas',
  Biz.ControleVersao in 'TD.SIATD4.Core\Biz\Sistema\Biz.ControleVersao.pas',
  UI.ControleVersao.Cadastro in 'TD.SIATD4.Desktop\UI\ConstroleVersao\UI.ControleVersao.Cadastro.pas',
  UI.ControleVersao.Consulta in 'TD.SIATD4.Desktop\UI\ConstroleVersao\UI.ControleVersao.Consulta.pas',
  DBConnect_TLB in 'TD.SIATD4.Dal\TypeLibrary\DBConnect_TLB.pas',
  mscorlib_TLB in 'TD.SIATD4.Dal\TypeLibrary\mscorlib_TLB.pas',
  Biz.OrcamentoItem in 'TD.SIATD4.Core\Biz\Orcamento\Biz.OrcamentoItem.pas',
  Biz.TipoEntrega in 'TD.SIATD4.Core\Biz\Orcamento\Biz.TipoEntrega.pas',
  UI.TipoEntrega.Cadastro in 'TD.SIATD4.Desktop\UI\Orcamento\UI.TipoEntrega.Cadastro.pas',
  UI.Orcamento.Cadastro in 'TD.SIATD4.Desktop\UI\Orcamento\UI.Orcamento.Cadastro.pas' {frmCadOrcamento},
  UI.Orcamento.Consulta in 'TD.SIATD4.Desktop\UI\Orcamento\UI.Orcamento.Consulta.pas',
  UI.TipoEntrega.Consulta in 'TD.SIATD4.Desktop\UI\Orcamento\UI.TipoEntrega.Consulta.pas' {frmConTipoEntrega},
  Lib.Erro in 'TD.SIATD4.Core\Lib\Lib.Erro.pas',
  UI.SelecionaTipoEntrega in 'TD.SIATD4.Desktop\UI\Orcamento\UI.SelecionaTipoEntrega.pas' {frmSelecionarTipoEntrega},
  Biz.CursoSeguro in 'TD.SIATD4.Core\Biz\Orcamento\Biz.CursoSeguro.pas',
  Biz.Municipio in 'TD.SIATD4.Core\Biz\Endereco\Biz.Municipio.pas',
  Biz.OrcamentoPagamento in 'TD.SIATD4.Core\Biz\Orcamento\Biz.OrcamentoPagamento.pas',
  Biz.FormaPagamento in 'TD.SIATD4.Core\Biz\Orcamento\Biz.FormaPagamento.pas',
  Biz.CondicaoPagamentoPorCliente in 'TD.SIATD4.Core\Biz\Cliente\Biz.CondicaoPagamentoPorCliente.pas',
  UI.CondicaoPagamentoPorCliente.Cadastro in 'TD.SIATD4.Desktop\UI\Cliente\UI.CondicaoPagamentoPorCliente.Cadastro.pas' {frmCadCondicaoPagamentoPorCliente},
  UI.CondicaoPagamentoPorCliente.Consulta in 'TD.SIATD4.Desktop\UI\Cliente\UI.CondicaoPagamentoPorCliente.Consulta.pas' {frmConCondicaoPagamentoPorCliente},
  UI.Cliente.Consulta in 'TD.SIATD4.Desktop\UI\Cliente\UI.Cliente.Consulta.pas' {frmConCliente},
  UI.Cliente.Cadastro in 'TD.SIATD4.Desktop\UI\Cliente\UI.Cliente.Cadastro.pas' {frmCadCliente},
  Lib.Arquivo in 'TD.SIATD4.Core\Lib\Lib.Arquivo.pas',
  Biz.ArquivoSerasa in 'TD.SIATD4.Core\Biz\Arquivo\Biz.ArquivoSerasa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  tlib.FormMensagem := tfrmMensagem;
  Tlib.FormFiltro := TfrmFilter;
  TLib.FormAutorizacao := TfrmAutorizacaoProcesso;
  TLib.FormTrocaSenha := TFrmTrocaSenha;
  TLib.Mobile := false;

  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmLogin, FrmLogin);
  if ParamCount > 0 then
  begin
      TUsuarioLogado.ObterInstancia.Autenticar(ParamStr(1), ParamStr(2));

      if not TUsuarioLogado.ObterInstancia.Autenticado then
          Application.Terminate;

      TUsuarioLogado.ObterInstancia.Filial.Obter(ParamStr(3));
      TUsuarioLogado.ObterInstancia.ModuloLogado.Obter(ParamStr(4));
      TUsuarioLogado.ObterInstancia.Deslogar;
      TUsuarioLogado.ObterInstancia.Logar;
      Application.Run;
  end
  else
  begin
      if (FrmLogin <> nil) and (FrmLogin.ShowModal <> MrOk) then
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
