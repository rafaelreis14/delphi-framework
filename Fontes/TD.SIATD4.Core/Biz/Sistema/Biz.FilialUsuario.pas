{ *Created by @ReisCodeGenerator* }
unit Biz.FilialUsuario;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
    Framework.Interfaces.CRUD, Dal.FabricaSQL;

type

    [TReferenceTable('SIATD_S04')]
    TFilialUsuario = class(TClasseBase, ICRUD<TFilialUsuario>)
    private

        FDelet: string;
        FCodigoFilial: string;
        FRecno: integer;
        FLogin: string;
        FCodigoEmpresa: string;
        FDescricaoFilial: string;
        procedure SetCodigoEmpresa(const Value: string);
        procedure SetCodigoFilial(const Value: string);
        procedure SetDelet(const Value: string);
        procedure SetLogin(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetDescricaoFilial(const Value: string);
        function GetEmpresaFilial: string;
    public
        class var dao: TControleDados<TLista<TFilialUsuario>, TListaDAO<TFilialUsuario>>;

        /// <summary>
        /// Metodo que faz a inser��o da FilialUsuario
        /// </summary>
        function Inserir: integer;
        /// <summary>
        /// Metodo que faz a altera��o da FilialUsuario
        /// </summary>
        function Alterar: boolean;

        /// <summary>
        /// M�tido que faz a Dele��o da FilialUsuario
        /// </summary>
        function Excluir: boolean;

        function ExcluirPorLoginEEmpresa(login: string; codigoEmpresa: string): boolean;

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
        function Obter(ID: string): TFilialUsuario; overload;

        /// <summary>
        /// M�todo que retorna um objeto preenchido
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Obter(parametros: TParametro): TFilialUsuario; overload;

        /// <summary>
        /// M�todo que retonar uma lista com varios objetos de acordo com parametro passado
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Consultar(parametros: TParametro): TLista<TFilialUsuario>;

        /// <summary>
        /// M�todo que preenche a inst�ncia do Objeto
        /// </summary>
        /// <param name="FilialUsuario">
        /// objeto de parametro para preenchimento da inst�ncia
        /// </param>
        procedure PreencherObjeto(FilialUsuario: TFilialUsuario);

        [TPersistable(fgPersistable, 'S04_S12_EMP')]
        [TMaxLenght(2)]
        property codigoEmpresa: string read FCodigoEmpresa write SetCodigoEmpresa;

        [TPersistable(fgPersistable, 'S04_S13_FILIAL')]
        [TMaxLenght(2)]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgReadOnly, 'S13_DESC')]
        property DescricaoFilial: string read FDescricaoFilial write SetDescricaoFilial;

        property CodigoNomeFilial: string read GetEmpresaFilial;

        [TPersistable(fgPersistable, 'S04_S01_LOGIN')]
        [TMaxLenght(20)]
        property login: string read FLogin write SetLogin;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delet: string read FDelet write SetDelet;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

    end;

implementation

{ TFilialUsuario }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado, Biz.Empresa, Biz.Filial;

{$REGION 'M�todos CRUD'}

function TFilialUsuario.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao inserir FilialUsuario' + #13 + e.Message);
        end;
    finally
    end;
end;

function TFilialUsuario.Alterar: boolean;
var
    fabrica: TFabricaSQL;
    sql: WideString;
    Parametro: TParametro;
begin
    fabrica := TFabricaSQL.Create(Self);
    try
        try
            fabrica.GerarSqlAlteracao(sql,parametro);
            result := dao.Alterar(sql, Parametro);
        except
            on e: exception do
                raise exception.Create('Erro ao alterar FilialUsuario' + #13 + e.Message);
        end;
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);
    end;
end;

function TFilialUsuario.Excluir: boolean;
var
    fabrica: TFabricaSQL;
    sql: WideString;
    Parametro: TParametro;
begin
    fabrica := TFabricaSQL.Create(Self);
    try
        try
            fabrica.GerarSqlExclusao(sql,parametro);
            result := dao.Excluir(sql, Parametro);
        except
            on e: exception do
                raise exception.Create('Erro ao excluir FilialUsuario' + #13 + e.Message);
        end;
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);
    end;

end;

function TFilialUsuario.ExcluirPorLoginEEmpresa(login, codigoEmpresa: string): boolean;
var
    Parametro: TParametro;
    query: string;
begin
    Parametro := TParametro.Create;
    try
        try
            Parametro.Add('', 'S04_S12_EMP', codigoEmpresa);
            Parametro.Add('', 'S04_S01_LOGIN', login);

            query := 'DELETE FROM '+Self.TabelaReferencia+' WHERE S04_S12_EMP = :S04_S12_EMP AND S04_S01_LOGIN = :S04_S01_LOGIN';

            dao.Excluir(query, Parametro);
        except
            on e: exception do
                raise exception.Create('Erro ao excluir Filiais de Acesso ' + #13 + e.Message);
        end;
    finally
        FreeAndNil(Parametro);
    end;
end;

function TFilialUsuario.GetEmpresaFilial: string;
begin
    result := Self.CodigoFilial + ' - ' + Self.DescricaoFilial;
end;

function TFilialUsuario.Consultar(parametros: TParametro): TLista<TFilialUsuario>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('S04_S12_EMP', ccIgual, lgAnd);
        condicao.Adiciona('S04_S13_FILIAL', ccIgual, lgAnd);
        condicao.Adiciona('S04_S01_LOGIN', ccIgual, lgAnd);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAnd);

        query := 'SELECT ' + Self.ObterCamposSeparadosPorVirgula(Consulta, ['DescricaoFilial'], 'S04') + ', S13.S13_DESC FROM ' + Self.TabelaReferencia + ' AS S04 ' +
          ' INNER JOIN '+TFilial.TabelaReferencia+' AS S13 ON S13_FILIAL  = S04_S13_FILIAL WHERE S04.D_E_L_E_T_ = '''' ' +
          condicao.ToString(true);

        result := dao.Consultar(query, parametros);
    finally
        condicao.Free;
    end;
end;

function TFilialUsuario.Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TFilialUsuario>;
    // parametro : TParametro;
    // lista:TLista<TFilialUsuario>
begin
    try
        filtro := TFilter<TFilialUsuario>.Create;
        filtro.ScreenName := 'Filtro de FilialUsuario';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'CodigoEmpresa=S04_S12_EMP', 'CodigoEmpresa');
        filtro.AddIndex(2, 'CodigoFilial=S04_S13_FILIAL', 'CodigoFilial');
        filtro.AddIndex(3, 'Login=S04_S01_LOGIN', 'Login');
        filtro.AddIndex(4, 'Delet=D_E_L_E_T_', 'Delet');
        filtro.AddIndex(5, 'Recno=R_E_C_N_O_', 'Recno');
        // ###Criar os �ndices do filtro
        // filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descri��o');

{$REGION 'Campo Filtro'}
        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoEmpresa';
        campoFiltro.Name := 'CodigoEmpresa';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoFilial';
        campoFiltro.Name := 'CodigoFilial';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Login';
        campoFiltro.Name := 'Login';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Delet';
        campoFiltro.Name := 'Delet';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Recno';
        campoFiltro.Name := 'Recno';
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

function TFilialUsuario.Obter(parametros: TParametro): TFilialUsuario;
var
    Lista: TLista<TFilialUsuario>;
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

function TFilialUsuario.Obter(ID: string): TFilialUsuario;
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

procedure TFilialUsuario.PreencherObjeto(FilialUsuario: TFilialUsuario);
begin
    FilialUsuario.CopiarPara(Self);
    FPreenchido := true;
end;

procedure TFilialUsuario.SetCodigoEmpresa(const Value: string);
begin
    FCodigoEmpresa := Value;
end;

procedure TFilialUsuario.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TFilialUsuario.SetDelet(const Value: string);
begin
    FDelet := Value;
end;

procedure TFilialUsuario.SetDescricaoFilial(const Value: string);
begin
    FDescricaoFilial := Value;
end;

procedure TFilialUsuario.SetLogin(const Value: string);
begin
    FLogin := Value;
end;

procedure TFilialUsuario.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

{$ENDREGION}
{$REGION 'M�todos de Propriedades'}
{$ENDREGION}

end.
