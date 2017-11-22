{ *Created by @ReisCodeGenerator* }
unit Biz.TipoEntrega;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
    Framework.Interfaces.CRUD, Dal.FabricaSQL;

type

    [TReferenceTable('Z07010')]
    TTipoEntrega = class(TClasseBase, ICRUD<TTipoEntrega>)
    private
        FCodigoFilial: string;
        FTipoEntrega: string;
        FDescricao: string;
        FCor: string;
        FMarcaOrcamento: string;
        FDelete: string;
        FRecno: integer;
        FCodigoFilialReserva: string;
        FTipoEntregaPadrao: string;
        procedure SetCodigoFilial(const Value: string);
        procedure SetTipoEntrega(const Value: string);
        procedure SetDescricao(const Value: string);
        procedure SetCor(const Value: string);
        procedure SetMarcaOrcamento(const Value: string);
        procedure SetDelete(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetCodigoFilialReserva(const Value: string);
        procedure SetTipoEntregaPadrao(const Value: string);

    public
        class var dao: TControleDados<TLista<TTipoEntrega>, TListaDAO<TTipoEntrega>>;

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
        function Obter(ID: string): TTipoEntrega; overload;
        function Obter(codigoFilial, tipoEntrega: string): TTipoEntrega; overload;

        /// <summary>
        /// Método que retorna um objeto preenchido
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Obter(parametros: TParametro): TTipoEntrega; overload;
        function ObterTipoEntregaPadrao(codigoFilial: string): TTipoEntrega;

        /// <summary>
        /// Método que retonar uma lista com varios objetos de acordo com parametro passado
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Consultar(parametros: TParametro): TLista<TTipoEntrega>;

        /// <summary>
        /// Método que retonar uma lista com varios objetos que é utilizado no orçamento, são os tipos de entrega
        ///    que podem ser marcados.
        /// </summary>
        function ConsultarTiposDeEntregaOrcamento(codigoFilial: String): TLista<TTipoEntrega>;

        /// <summary>
        /// Método que preenche a instância do Objeto
        /// </summary>
        /// <param name="ClasseBase">
        /// objeto de parametro para preenchimento da instância
        /// </param>
        procedure PreencherObjeto(TipoEntrega: TTipoEntrega);

        [TPersistable(fgPersistable, 'Z07_FILIAL')]
        [TMaxLenght(2)]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgPersistable, 'Z07_ENTREGA')]
        [TMaxLenght(3)]
        property TipoEntrega: string read FTipoEntrega write SetTipoEntrega;

        [TPersistable(fgPersistable, 'Z07_DESCRI')]
        [TMaxLenght(70)]
        property Descricao: string read FDescricao write SetDescricao;

        [TPersistable(fgPersistable, 'Z07_COR')]
        [TMaxLenght(20)]
        property Cor: string read FCor write SetCor;

        [TPersistable(fgPersistable, 'Z07_MARCAR')]
        [TMaxLenght(1)]
        property MarcaOrcamento: string read FMarcaOrcamento write SetMarcaOrcamento;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgPersistable, 'Z07_RECNO')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgPersistable, 'Z07_FILRES')]
        [TMaxLenght(2)]
        property CodigoFilialReserva: string read FCodigoFilialReserva write SetCodigoFilialReserva;

        [TPersistable(fgPersistable, 'Z07_PADRAO')]
        [TMaxLenght(1)]
        property TipoEntregaPadrao: string read FTipoEntregaPadrao write SetTipoEntregaPadrao;

        constructor Create; override;
        destructor Destroy; override;

    end;

implementation

{ TTipoEntrega }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'Métodos CRUD'}

function TTipoEntrega.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao inserir TipoEntrega' + #13 + e.Message);
        end;
    finally
    end;
end;

function TTipoEntrega.Alterar: boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao alterar TipoEntrega' + #13 + e.Message);
        end;
    finally
    end;
end;

function TTipoEntrega.Excluir: boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao excluir TipoEntrega' + #13 + e.Message);
        end;
    finally
    end;

end;

function TTipoEntrega.Consultar(parametros: TParametro): TLista<TTipoEntrega>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('Z07_FILIAL', ccIgual, lgAnd);
        condicao.Adiciona('Z07_ENTREGA', ccIgual, lgAnd);
        condicao.Adiciona('Z07_DESCRI', ccIgual, lgAnd);
        condicao.Adiciona('Z07_COR', ccIgual, lgAnd);
        condicao.Adiciona('Z07_MARCAR', ccIgual, lgAnd);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAnd);
        condicao.Adiciona('Z07_RECNO', ccIgual, lgAnd);
        condicao.Adiciona('Z07_FILRES', ccIgual, lgAnd);
        condicao.Adiciona('Z07_PADRAO', ccIgual, lgAnd);

        query := 'SELECT ' + Self.ObterCamposSeparadosPorVirgula(Consulta, []) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        result := dao.Consultar(query, parametros);
    finally
        condicao.Free;
    end;
end;

function TTipoEntrega.ConsultarTiposDeEntregaOrcamento(codigoFilial: String): TLista<TTipoEntrega>;
var
    query: string;
begin
    try
        query := 'SELECT Z07_ENTREGA, ' +
                 'Z07_DESCRI, ' +
                 'Z07_FILRES, ' +
                 '(SELECT TOP 1 UPPER(DESCRICAO) '+
                 'FROM SIATDEMPRESA WITH(NOLOCK) '+
                 'WHERE EMPRESA = ''01'' '+
                 'AND FILIAL = Z07_FILRES '+
                 'AND D_E_L_E_T_ = '''') AS DESCR_FILIAL, ' +
                 'Z07_COR,  ' +
                 'Z07_FILRES, ' +
                 'Z07_PADRAO ' +
                 'FROM ' + Self.TabelaReferencia + ' WITH(NOLOCK) ' +
                 'WHERE Z07_FILIAL = '''+codigoFilial+''' ' +
                 'AND Z07_MARCAR = ''S'' ' +
                 'AND D_E_L_E_T_ = '''' ' +
                 'AND Z07_ENTREGA NOT IN (''ECO'',''ECD'') ' +
                 'ORDER BY Z07_ENTREGA ';

        result := dao.Consultar(query, nil);
    except
        result := nil;
    end;
end;

constructor TTipoEntrega.Create;
begin
    inherited;

end;

destructor TTipoEntrega.Destroy;
begin

    inherited;
end;

function TTipoEntrega.Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TTipoEntrega>;
    // parametro : TParametro;
    // lista:TLista<TTipoEntrega>
begin
    try
        filtro := TFilter<TTipoEntrega>.Create;
        filtro.ScreenName := 'Filtro de TipoEntrega';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'CodigoFilial=Z07_FILIAL', 'CodigoFilial');
        filtro.AddIndex(2, 'TipoEntrega=Z07_ENTREGA', 'TipoEntrega');
        filtro.AddIndex(3, 'Descricao=Z07_DESCRI', 'Descricao');
//        filtro.AddIndex(4, 'Cor=Z07_COR', 'Cor');
//        filtro.AddIndex(5, 'MarcaOrcamento=Z07_MARCAR', 'MarcaOrcamento');
//        filtro.AddIndex(6, 'Delete=D_E_L_E_T_', 'Delete');
        filtro.AddIndex(7, 'Recno=Z07_RECNO', 'Recno');
        filtro.AddIndex(8, 'CodigoFilialReserva=Z07_FILRES', 'CodigoFilialReserva');
        filtro.AddIndex(9, 'TipoEntregaPadrao=Z07_PADRAO', 'TipoEntregaPadrao');
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
        campoFiltro.Description := 'TipoEntrega';
        campoFiltro.Name := 'TipoEntrega';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Descricao';
        campoFiltro.Name := 'Descricao';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Cor';
        campoFiltro.Name := 'Cor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'MarcaOrcamento';
        campoFiltro.Name := 'MarcaOrcamento';
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

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoFilialReserva';
        campoFiltro.Name := 'CodigoFilialReserva';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'TipoEntregaPadrao';
        campoFiltro.Name := 'TipoEntregaPadrao';
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

function TTipoEntrega.Obter(parametros: TParametro): TTipoEntrega;
var
    Lista: TLista<TTipoEntrega>;
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

function TTipoEntrega.Obter(codigoFilial, tipoEntrega: string): TTipoEntrega;
var
    parametros: TParametro;
begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'Z07_FILIAL', codigoFilial);
        parametros.Add('', 'Z07_ENTREGA', tipoEntrega);
        result := Obter(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

function TTipoEntrega.ObterTipoEntregaPadrao(codigoFilial: string): TTipoEntrega;
var
    parametros: TParametro;
begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'Z07_FILIAL', codigoFilial);
        parametros.Add('', 'Z07_PADRAO', 'S');
        result := Obter(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

function TTipoEntrega.Obter(ID: string): TTipoEntrega;
var
    parametros: TParametro;

begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'Z07_RECNO', ID);
        result := Obter(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

{$ENDREGION}
{$REGION 'Regras de Negócio'}

procedure TTipoEntrega.PreencherObjeto(TipoEntrega: TTipoEntrega);
begin
    TipoEntrega.CopiarPara(Self);
    FPreenchido := true;
end;

{$ENDREGION}
{$REGION 'Métodos de Propriedades'}

procedure TTipoEntrega.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TTipoEntrega.SetTipoEntrega(const Value: string);
begin
    FTipoEntrega := Value;
end;

procedure TTipoEntrega.SetTipoEntregaPadrao(const Value: string);
begin
    FTipoEntregaPadrao := Value;
end;

procedure TTipoEntrega.SetDescricao(const Value: string);
begin
    FDescricao := Value;
end;

procedure TTipoEntrega.SetCor(const Value: string);
begin
    FCor := Value;
end;

procedure TTipoEntrega.SetMarcaOrcamento(const Value: string);
begin
    FMarcaOrcamento := Value;
end;

procedure TTipoEntrega.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TTipoEntrega.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TTipoEntrega.SetCodigoFilialReserva(const Value: string);
begin
    FCodigoFilialReserva := Value;
end;

{$ENDREGION}

end.
