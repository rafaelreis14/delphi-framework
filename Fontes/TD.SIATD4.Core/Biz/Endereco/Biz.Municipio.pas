{ *Created by @ReisCodeGenerator* }
unit Biz.Municipio;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
    Framework.Interfaces.CRUD, Dal.FabricaSQL;

type

    [TReferenceTable('CC2010')]
    TMunicipio = class(TClasseBase, ICRUD<TMunicipio>)
    private
        FCodigoFilial: string;
        FUF: string;
        FCodigoMunicipio: string;
        FMunicipio: string;
        FDelete: string;
        FRecno: integer;
        procedure SetCodigoFilial(const Value: string);
        procedure SetUF(const Value: string);
        procedure SetCodigoMunicipio(const Value: string);
        procedure SetMunicipio(const Value: string);
        procedure SetDelete(const Value: string);
        procedure SetRecno(const Value: integer);

    public
        class var dao: TControleDados<TLista<TMunicipio>, TListaDAO<TMunicipio>>;

        /// <summary>
        /// Metodo que faz a inserção da ClasseBase
        /// </summary>
        function Inserir: integer;
        /// <summary>
        /// Metodo que faz a alteração da ClasseBase
        /// </summary>
        function Alterar: boolean;

        /// <summary>
        /// Métido que faz a Deleção da ClasseBase
        /// </summary>
        function Excluir: boolean;

        /// <summary>
        /// Método que chama a tela de filtro
        /// </summary>
        /// <param name="tipoOperacao">
        /// Tipo da operação, se é somente filtro, ou seleção de registro
        /// </param>
        function Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter;

        /// <summary>
        /// Método que retorna um objeto preenchido
        /// </summary>
        /// <param name="ID">
        /// Chave primária da tabela
        /// </param>
        function Obter(ID: string): TMunicipio; overload;

        /// <summary>
        /// Método que retorna um objeto preenchido
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Obter(parametros: TParametro): TMunicipio; overload;

        /// <summary>
        /// Método que retonar uma lista com varios objetos de acordo com parametro passado
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Consultar(parametros: TParametro): TLista<TMunicipio>;
        function ValidaMunicipio(uf, Municipio: string): boolean;

        /// <summary>
        /// Método que preenche a instância do Objeto
        /// </summary>
        /// <param name="ClasseBase">
        /// objeto de parametro para preenchimento da instância
        /// </param>
        procedure PreencherObjeto(Municipio: TMunicipio);

        [TPersistable(fgPersistable, 'CC2_FILIAL')]
        [TMaxLenght(2)]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgPersistable, 'CC2_EST')]
        [TMaxLenght(2)]
        property uf: string read FUF write SetUF;

        [TPersistable(fgPersistable, 'CC2_CODMUN')]
        [TMaxLenght(5)]
        property CodigoMunicipio: string read FCodigoMunicipio write SetCodigoMunicipio;

        [TPersistable(fgPersistable, 'CC2_MUN')]
        [TMaxLenght(60)]
        property Municipio: string read FMunicipio write SetMunicipio;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        constructor Create; override;
        destructor Destroy; override;

    end;

implementation

{ TMunicipio }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'Métodos CRUD'}

function TMunicipio.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao inserir Municipio' + #13 + e.Message);
        end;
    finally
    end;
end;

function TMunicipio.Alterar: boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao alterar Municipio' + #13 + e.Message);
        end;
    finally
    end;
end;

function TMunicipio.Excluir: boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao excluir Municipio' + #13 + e.Message);
        end;
    finally
    end;

end;

function TMunicipio.Consultar(parametros: TParametro): TLista<TMunicipio>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('CC2_FILIAL', ccIgual, lgAnd);
        condicao.Adiciona('CC2_EST', ccIgual, lgAnd);
        condicao.Adiciona('CC2_CODMUN', ccIgual, lgAnd);
        condicao.Adiciona('CC2_MUN', ccIgual, lgAnd);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAnd);

        query := 'SELECT ' + Self.ObterCamposSeparadosPorVirgula(Consulta, []) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        result := dao.Consultar(query, parametros);
    finally
        condicao.Free;
    end;
end;

constructor TMunicipio.Create;
begin
    inherited;

end;

destructor TMunicipio.Destroy;
begin

    inherited;
end;

function TMunicipio.Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TMunicipio>;
    // parametro : TParametro;
    // lista:TLista<TMunicipio>
begin
    try
        filtro := TFilter<TMunicipio>.Create;
        filtro.ScreenName := 'Filtro de Municipio';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'CodigoFilial=CC2_FILIAL', 'CodigoFilial');
        filtro.AddIndex(2, 'UF=CC2_EST', 'UF');
        filtro.AddIndex(3, 'CodigoMunicipio=CC2_CODMUN', 'CodigoMunicipio');
        filtro.AddIndex(4, 'Municipio=CC2_MUN', 'Municipio');
        filtro.AddIndex(5, 'Delete=D_E_L_E_T_', 'Delete');
        filtro.AddIndex(6, 'Recno=R_E_C_N_O_', 'Recno');
        // ###Criar os Índices do filtro
        // filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descrição');

{$REGION 'Campo Filtro'}
        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoFilial';
        campoFiltro.Name := 'CodigoFilial';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'UF';
        campoFiltro.Name := 'UF';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoMunicipio';
        campoFiltro.Name := 'CodigoMunicipio';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Municipio';
        campoFiltro.Name := 'Municipio';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Delete';
        campoFiltro.Name := 'Delete';
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

function TMunicipio.Obter(parametros: TParametro): TMunicipio;
var
    Lista: TLista<TMunicipio>;
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

function TMunicipio.Obter(ID: string): TMunicipio;
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
{$REGION 'Regras de Negócio'}

procedure TMunicipio.PreencherObjeto(Municipio: TMunicipio);
begin
    Municipio.CopiarPara(Self);
    FPreenchido := true;
end;

{$ENDREGION}
{$REGION 'Métodos de Propriedades'}

procedure TMunicipio.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TMunicipio.SetUF(const Value: string);
begin
    FUF := Value;
end;

function TMunicipio.ValidaMunicipio(uf, Municipio: string): boolean;
var
    parametros: TParametro;
begin
    result := False;
    try
        parametros := TParametro.Create;
        parametros.Add('', 'CC2_FILIAL', '');
        parametros.Add('', 'CC2_EST', uf);
        parametros.Add('', 'CC2_MUN', Municipio);

        Self.Obter(parametros);

        if Self.Preenchido then
        begin
            if (Self.CodigoMunicipio <> EmptyStr) and (Self.uf <> EmptyStr) and (Self.Municipio <> EmptyStr) then
                result := true
        end;
    finally
        if parametros <> nil then
            FreeAndNil(parametros);
    end;
end;

procedure TMunicipio.SetCodigoMunicipio(const Value: string);
begin
    FCodigoMunicipio := Value;
end;

procedure TMunicipio.SetMunicipio(const Value: string);
begin
    FMunicipio := Value;
end;

procedure TMunicipio.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TMunicipio.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

{$ENDREGION}

end.
