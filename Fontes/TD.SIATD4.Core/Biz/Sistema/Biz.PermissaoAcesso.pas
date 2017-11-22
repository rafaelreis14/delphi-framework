{ *Created by @ReisCodeGenerator* }
unit Biz.PermissaoAcesso;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
    Framework.Interfaces.CRUD, Dal.FabricaSQL, Biz.Permissao;

type

    [TReferenceTable('SIATD_S24_01')]
    TPermissaoAcesso = class(TClasseBase, ICRUD<TPermissaoAcesso>)
    private

        FPermissao: string;
        FRotina: string;
        FDelet: string;
        FRecno: integer;
        FModulo: string;
        FGrupo: string;
        FPermissao_: TPermissao;
    FTipoRotina: string;
        procedure SetDelet(const Value: string);
        procedure SetGrupo(const Value: string);
        procedure SetModulo(const Value: string);
        procedure SetPermissao(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetRotina(const Value: string);
        procedure SetPermissao_(const Value: TPermissao);
        procedure SetTipoRotina(const Value: string);
    public

        class var dao: TControleDados<TLista<TPermissaoAcesso>, TListaDAO<TPermissaoAcesso>>;

        /// <summary>
        /// Metodo que faz a inser��o da AcessoPermissao
        /// </summary>
        function Inserir: integer;
        /// <summary>
        /// Metodo que faz a altera��o da AcessoPermissao
        /// </summary>
        function Alterar: boolean;

        /// <summary>
        /// M�tido que faz a Dele��o da AcessoPermissao
        /// </summary>
        function Excluir: boolean;

        procedure ExcluirPermissoes(grupo,modulo: string);

        /// <summary>
        /// M�todo que chama a tela de filtro
        /// </summary>
        /// <param name="tipoOperacao">
        /// Tipo da opera��o, se � somente filtro, ou sele��o de registro
        /// </param>
        function Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter;

        /// <summary>
        /// M�todo que retorna um objeto preenchido
        /// </summary>
        /// <param name="ID">
        /// Chave prim�ria da tabela
        /// </param>
        function Obter(ID: string): TPermissaoAcesso; overload;

        /// <summary>
        /// M�todo que retorna um objeto preenchido
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Obter(parametros: TParametro): TPermissaoAcesso; overload;

        /// <summary>
        /// M�todo que retonar uma lista com varios objetos de acordo com parametro passado
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Consultar(parametros: TParametro): TLista<TPermissaoAcesso>;

        /// <summary>
        /// M�todo que preenche a inst�ncia do Objeto
        /// </summary>
        /// <param name="AcessoPermissao">
        /// objeto de parametro para preenchimento da inst�ncia
        /// </param>
        procedure PreencherObjeto(AcessoPermissao: TPermissaoAcesso);

        [TPersistable(fgPersistable, 'S24_S20_S02_GRUPO')]
        [TMaxLenght(30)]
        property Grupo: string read FGrupo write SetGrupo;

        [TPersistable(fgPersistable, 'S24_S20_S09_S08_MODULO')]
        [TMaxLenght(30)]
        property Modulo: string read FModulo write SetModulo;

        [TPersistable(fgPersistable, 'S24_S20_S09_S05_ROTINA')]
        [TMaxLenght(30)]
        property Rotina: string read FRotina write SetRotina;

        [TPersistable(fgPersistable, 'S24_S20_TIPOROTINA')]
        [TMaxLenght(30)]
        property TipoRotina: string read FTipoRotina write SetTipoRotina;

        [TPersistable(fgPersistable, 'S24_S19_S06_PERMISSAO')]
        [TMaxLenght(10)]
        property Permissao: string read FPermissao write SetPermissao;

        property Permissao_ : TPermissao read FPermissao_ write SetPermissao_;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delet: string read FDelet write SetDelet;

        constructor Create;
        destructor Destroy; override;

    end;

implementation

{ TPermissaoAcesso }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'M�todos CRUD'}

function TPermissaoAcesso.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao inserir AcessoPermissao' + #13 + e.Message);
        end;
    finally
    end;
end;

function TPermissaoAcesso.Alterar: boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao alterar AcessoPermissao' + #13 + e.Message);
        end;
    finally
    end;
end;

function TPermissaoAcesso.Excluir: boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao excluir AcessoPermissao' + #13 + e.Message);
        end;
    finally
    end;
end;

procedure TPermissaoAcesso.ExcluirPermissoes(grupo, modulo: string);
var
    query: string;
    parametro: TParametro;
begin
    try
        try
            parametro := TParametro.Create;
            parametro.Add('','S24_S20_S02_GRUPO', grupo );
            parametro.Add('','S24_S20_S09_S08_MODULO', modulo );
            query := 'DELETE '+ Self.TabelaReferencia +' WHERE S24_S20_S02_GRUPO  = :S24_S20_S02_GRUPO AND S24_S20_S09_S08_MODULO = :S24_S20_S09_S08_MODULO';

            dao.Excluir(query,parametro);

        except on E: Exception do
            raise Exception.Create('Erro ao excluir permiss�es'+#13+e.Message);
        end;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;
end;

function TPermissaoAcesso.Consultar(parametros: TParametro): TLista<TPermissaoAcesso>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('S24_S20_S02_GRUPO', ccIgual, lgAnd);
        condicao.Adiciona('S24_S20_S09_S08_MODULO', ccIgual, lgAnd);
        condicao.Adiciona('S24_S20_S09_S05_ROTINA', ccIgual, lgAnd);
        condicao.Adiciona('S24_S19_S06_PERMISSAO', ccIgual, lgAnd);
        condicao.Adiciona('S24_S20_TIPOROTINA', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAnd);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAnd);

        query := 'SELECT ' + Self.ObterCamposSeparadosPorVirgula(Consulta, []) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' +
          condicao.ToString(true);

        result := dao.Consultar(query, parametros);
    finally
        condicao.Free;
    end;
end;

constructor TPermissaoAcesso.Create;
begin
    inherited;
    FPermissao_ := TPermissao.Create;
end;

destructor TPermissaoAcesso.Destroy;
begin
    FreeAndNil(FPermissao_);
    inherited;
end;

function TPermissaoAcesso.Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TPermissaoAcesso>;
    // parametro : TParametro;
    // lista:TLista<TPermissaoAcesso>
begin
    try
        filtro := TFilter<TPermissaoAcesso>.Create;
        filtro.ScreenName := 'Filtro de AcessoPermissao';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'Grupo=S24_S20_S02_GRUPO', 'Grupo');
        filtro.AddIndex(2, 'Modulo=S24_S20_S09_S08_MODULO', 'Modulo');
        filtro.AddIndex(3, 'Rotina=S24_S20_S09_S05_ROTINA', 'Rotina');
        filtro.AddIndex(4, 'Permissao=S24_S19_S06_PERMISSAO', 'Permissao');
        filtro.AddIndex(5, 'TipoRotina=S24_S20_TIPOROTINA', 'TipoRotina');
       // ###Criar os �ndices do filtro
        // filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descri��o');

{$REGION 'Campo Filtro'}
        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Grupo';
        campoFiltro.Name := 'Grupo';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Modulo';
        campoFiltro.Name := 'Modulo';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Rotina';
        campoFiltro.Name := 'Rotina';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Permissao';
        campoFiltro.Name := 'Permissao';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);
{$ENDREGION}
        result := filtro.Execute;
    finally
        // FreeAndNil(parametro);
        // FreeAndNil(lista);
    end;
end;

function TPermissaoAcesso.Obter(parametros: TParametro): TPermissaoAcesso;
var
    Lista: TLista<TPermissaoAcesso>;
begin
    try
        Lista := Self.Consultar(parametros);

        if Lista.Count = 1 then
        begin
            PreencherObjeto(Lista[0]);
            result := Self;
        end
        else
        begin
            TLib.MensagemAdvertencia('Nenhum registro encontrado.', 'Aviso');
            result := nil;
        end;
    finally
        Lista.Destroy;
    end;
end;

function TPermissaoAcesso.Obter(ID: string): TPermissaoAcesso;
var
    parametros: TParametro;

begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'R_E_C_N_O_', ID);
        result := Obter(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

{$ENDREGION}
{$REGION 'Regras de Neg�cio'}

procedure TPermissaoAcesso.PreencherObjeto(AcessoPermissao: TPermissaoAcesso);
begin
    AcessoPermissao.CopiarPara(Self);
    FPreenchido := true;
end;

procedure TPermissaoAcesso.SetDelet(const Value: string);
begin
    FDelet := Value;
end;

procedure TPermissaoAcesso.SetGrupo(const Value: string);
begin
    FGrupo := Value;
end;

procedure TPermissaoAcesso.SetModulo(const Value: string);
begin
    FModulo := Value;
end;

procedure TPermissaoAcesso.SetPermissao(const Value: string);
begin
    FPermissao := Value;
end;

procedure TPermissaoAcesso.SetPermissao_(const Value: TPermissao);
begin
  FPermissao_ := Value;
end;

procedure TPermissaoAcesso.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TPermissaoAcesso.SetRotina(const Value: string);
begin
    FRotina := Value;
end;

procedure TPermissaoAcesso.SetTipoRotina(const Value: string);
begin
    FTipoRotina := Value;
end;

{$ENDREGION}
{$REGION 'M�todos de Propriedades'}
{$ENDREGION}

end.
