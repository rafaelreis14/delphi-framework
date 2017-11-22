unit UI.Usuario.Cadastro;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
    Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntErrorProvider,
    Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, REdit,
    RCheckBox, Vcl.CheckLst, RCheckListBox, Lib.Biblioteca, Lib.Enumeradores, Biz.Filial,
    Biz.Grupo, Lib.ResultFilter, Biz.Funcionario, RComboBox,
    Biz.Empresa, Lib.Parametro, Biz.UsuarioLogado, UI.Base.Controlador.CadastroDesktop,
    Biz.Usuario, UI.Base.CadastroPadrao;

type
    //TFrmCadUsuario = class(TFrmCadastroPadrao)
    TFrmCadUsuario = class(TControladorCadastroDesktop<TUsuario>)
        Label3: TLabel;
        TabSheet1: TTabSheet;
        edNome: TREdit;
        cklGrupoUsuario: TRCheckListBox;
        TabSheet2: TTabSheet;
        cklFiliaisUsuario: TRCheckListBox;
        GroupBox1: TGroupBox;
        edSenha: TREdit;
        Label4: TLabel;
        Label5: TLabel;
        edContraSenha: TREdit;
        edLogin: TREdit;
        Label2: TLabel;
        GroupBox2: TGroupBox;
        RCheckBox1: TRCheckBox;
        RCheckBox3: TRCheckBox;
        RCheckBox5: TRCheckBox;
        GrpBxSRA: TGroupBox;
        edMatricula: TREdit;
        Label8: TLabel;
        edFilial: TREdit;
        Label9: TLabel;
        edEmpresa: TREdit;
        Label10: TLabel;
        btnPesquisarSRA: TBitBtn;
        edCracha: TREdit;
        Label13: TLabel;
        ckExterno: TRCheckBox;
        Panel1: TPanel;
        Label6: TLabel;
        cbEmpresa: TRComboBox;
        Label14: TLabel;
        REdit5: TREdit;
        procedure btnPesquisarSRAClick(Sender: TObject);
        procedure ckExternoClick(Sender: TObject);
        procedure cbEmpresaChange(Sender: TObject);
        procedure edSenhaExit(Sender: TObject);
        procedure FormCreate(Sender: TObject);

    private
        procedure ObterAcessoFiliais;
        procedure ObterAcessoGrupos;
        procedure ExecutarEventoMostrarFormulario(Sender: TObject); override;
        function Validar: boolean; override;

    public

    end;

var
    FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.dfm}

procedure TFrmCadUsuario.btnPesquisarSRAClick(Sender: TObject);
var
    Funcionario: TFuncionario;
    Lib: Tlib;
    Lista: Tlist;
    nome, primeiroNome, ultimoNome: string;
    cont: integer;
begin
    inherited;
    try
        Funcionario := TFuncionario.Create();
        //
        Lista := Funcionario.Listar(otSelect, False).List;
        //
        if Lista.Count > 0 then
        begin
            edEmpresa.Value := TUsuarioLogado.ObterInstancia.Filial.Empresa;
            edFilial.Value := TFuncionario(Lista[0]).Filial;
            edMatricula.Value := TFuncionario(Lista[0]).Matricula;
            edNome.Value := TFuncionario(Lista[0]).nome;
            edCracha.Value := TFuncionario(Lista[0]).Matricula;

            nome := trim(TFuncionario(Lista[0]).nome);
            nome := nome + ' ';
            cont := Tlib.ContarCaracter(nome, ' ');

            primeiroNome := Tlib.ObterPorParametro(nome, '1', ' ');
            ultimoNome := Tlib.ObterPorParametro(nome, inttostr(cont), ' ');

            if AcaoJanela = acInsercao then
                edLogin.Value := primeiroNome + ultimoNome;
        end;
    finally
        FreeAndNil(Funcionario);
        FreeAndNil(Lista);
    end;
end;

procedure TFrmCadUsuario.FormCreate(Sender: TObject);
begin
    inherited;
    Inicializar;
end;

procedure TFrmCadUsuario.ckExternoClick(Sender: TObject);
var
    I: integer;
begin
    inherited;
    // GrpBxSRA.Enabled := not(RChckBxExterno.Checked);
    if ckExterno.Checked then
    begin
        for I := 0 to GrpBxSRA.ControlCount - 1 do
            if (GrpBxSRA.Controls[I] is TREdit) then
            begin
                (GrpBxSRA.Controls[I] as TREdit).Value := '';
                (GrpBxSRA.Controls[I] as TREdit).MandatoryField := False;
            end;
    end
    else
        for I := 0 to GrpBxSRA.ControlCount - 1 do
            if (GrpBxSRA.Controls[I] is TREdit) then
            begin
                (GrpBxSRA.Controls[I] as TREdit).MandatoryField := True;
            end;

end;

procedure TFrmCadUsuario.cbEmpresaChange(Sender: TObject);
begin
    inherited;
    if Tlib.MensagemPergunta('Se voc� alterar a op��o todas as configura��es n�o salvas ser�o perdidas!' + #10 + #13 + 'Deseja Continuar?',
      'Pergunta', 0) = mrNo then
    begin
        exit;
    end;
    ObterAcessoFiliais;
end;

procedure TFrmCadUsuario.edSenhaExit(Sender: TObject);
begin
    inherited;
    if (edSenha.Value <> EmptyStr) then
    begin
        if not TUsuario(Objeto).ValidarSenha(edSenha.Value) then
        begin
            Tlib.MensagemInformacao('Senha deve conter no m�nimo 8 caracteres e/ou conter letras e n�meros');
            edSenha.Clear;
            edSenha.SetFocus;
        end;
    end;
end;

procedure TFrmCadUsuario.ExecutarEventoMostrarFormulario(Sender: TObject);
var
    ListaFiliaisUsuario: Tlist;
    ListaGruposUsuario: Tlist;
    Empresa: TEmpresa;
    Grupo: TGrupo;
begin
    inherited;
    try
        Grupo := TGrupo.Create;
        Empresa := TEmpresa.Create;

        cbEmpresa.DataSource<TEmpresa>(Empresa.ObterTodasEmpresa);
        cbEmpresa.DataBind();

        ObterAcessoFiliais;
        ObterAcessoGrupos;

        if AcaoJanela <> acInsercao then
        begin
            edLogin.Enabled := False;
            edSenha.Value := Tlib.Desencriptar(TUsuario(Objeto).Senha);
            edContraSenha.Value := Tlib.Desencriptar(TUsuario(Objeto).Senha);
        end;
    finally
        if Grupo <> nil then
            FreeAndNil(Grupo);

        if Empresa <> nil then
            FreeAndNil(Empresa);

    end;
end;

function TFrmCadUsuario.Validar: boolean;
var
    param: tparametro;
    Usuario: TUsuario;
begin
    Usuario := nil;
    param := nil;
    result := True;

    try
        if ((edMatricula.IsChanged(cvOriginalValue) and (AcaoJanela = acAlteracao)) or (AcaoJanela = acInsercao)) then
        begin
            Usuario := TUsuario.Create;
            param := tparametro.Create;
            param.Add('', 'S01_SRA_MAT', edMatricula.Value);
            param.Add('', 'S01_BLOQUEADO', 'N');

            Usuario.Obter(param);

            if Usuario.Preenchido then
            begin
                Tlib.MensagemAdvertencia('J� possui um usu�rio com esta matr�cula - ' + Usuario.nome);
                result := False;
            end;
        end;

        if AcaoJanela = acInsercao then
        begin
            Usuario := TUsuario.Create;
            param := tparametro.Create;
            param.Add('', 'S01_LOGIN', edLogin.Value);
            param.Add('', 'S01_BLOQUEADO', 'N');

            Usuario.Obter(param);

            if Usuario.Preenchido then
            begin
                Tlib.MensagemAdvertencia('J� possui um usu�rio com este login - ' + Usuario.Login);
                result := False;
            end;
        end;

        if edSenha.Value <> edContraSenha.Value then
        begin
            Tlib.MensagemInformacao('As Senhas n�o s�o iguais, favor verificar');
            pgcComponentes.ActivePageIndex := 0;
            edSenha.SetFocus;
            exit;
        end;

        TUsuario(Objeto).FiliaisAcessoSelecionada := cklFiliaisUsuario.Value;
        TUsuario(Objeto).GruposAcessoSelecionado := cklGrupoUsuario.Value;
        edSenha.Value := Tlib.Encriptar(edSenha.Value);
    finally
        if Usuario <> nil then
            FreeAndNil(Usuario);

        if param <> nil then
            FreeAndNil(param);
    end;

end;

procedure TFrmCadUsuario.ObterAcessoGrupos;
var
    Grupo: TGrupo;
begin
    Grupo := TGrupo.Create;
    try
        cklGrupoUsuario.DataSource<TGrupo>(Grupo.ObterTodosGrupos);
        cklGrupoUsuario.DataBind;
        if AcaoJanela <> acInsercao then
        begin
            TUsuario(Objeto).CarregarGruposAcesso;
            cklGrupoUsuario.Value := TUsuario(Objeto).GruposAcesso.ToDelimiterList('Grupo');
        end;
    finally
        FreeAndNil(Grupo);
    end;
end;

procedure TFrmCadUsuario.ObterAcessoFiliais;
var
    Filial: TFilial;
    Parametro: tparametro;
begin
    Filial := TFilial.Create;
    Parametro := tparametro.Create;

    try

        Parametro.Add('S13', 'S13_S12_EMP', cbEmpresa.Value);

        cklFiliaisUsuario.DataSource<TFilial>(Filial.Consultar(Parametro));
        cklFiliaisUsuario.DataBind;

        if AcaoJanela <> acInsercao then
        begin
            TUsuario(Objeto).CarregarFiliaisAcesso;
            //
            cklFiliaisUsuario.Value := TUsuario(Objeto).FiliaisAcesso.ToDelimiterList('CodigoFilial');
            // ObterFilialUsuario(TUsuario(Objeto).Login).ToDelimiterList('Filial');
        end;

    finally
        FreeAndNil(Parametro);
        FreeAndNil(Filial);
    end;
end;

end.
