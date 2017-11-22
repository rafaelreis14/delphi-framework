{ *Created by @ReisCodeGenerator* }
unit Biz.FormaPagamento;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
    Framework.Interfaces.CRUD, Dal.FabricaSQL;

type

    [TReferenceTable('Z41010')]
    TFormaPagamento = class(TClasseBase, ICRUD<TFormaPagamento>)
    private
        // FCodigo: string;
        // FDescricaoForma: string;
        FTipo: string;
        // FQuantidadeMaxParcelas: integer;
        // FIntervaloEntreParcelas: integer;
        FStatus: string;
        FDescricaoTipo: string;
        // procedure SetCodigo(const Value: string);
        // procedure SetDescricaoForma(const Value: string);
        procedure SetTipo(const Value: string);
        // procedure SetQuantidadeMaxParcelas(const Value: integer);
        // procedure SetIntervaloEntreParcelas(const Value: integer);
        procedure SetStatus(const Value: string);
        procedure SetDescricaoTipo(const Value: string);

    public
        class var dao: TControleDados<TLista<TFormaPagamento>, TListaDAO<TFormaPagamento>>;

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
        function Obter(ID: string): TFormaPagamento; overload;

        /// <summary>
        /// Método que retorna um objeto preenchido
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Obter(parametros: TParametro): TFormaPagamento; overload;

        /// <summary>
        /// Método que retonar uma lista com varios objetos de acordo com parametro passado
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Consultar(parametros: TParametro): TLista<TFormaPagamento>; overload;
        class function Consultar(PermiteMostraTDC: boolean): TLista<TFormaPagamento>; overload;

        /// <summary>
        /// Método que preenche a instância do Objeto
        /// </summary>
        /// <param name="ClasseBase">
        /// objeto de parametro para preenchimento da instância
        /// </param>
        procedure PreencherObjeto(FormaPagamento: TFormaPagamento);

        // [TPersistable(fgPersistable, 'Z41_COD')]
        // [TMaxLenght(3)]
        // property Codigo: string read FCodigo write SetCodigo;

        // [TPersistable(fgPersistable, 'Z41_DESCR')]
        // [TMaxLenght(35)]
        // property DescricaoForma: string read FDescricaoForma write SetDescricaoForma;

        [TPersistable(fgPersistable, 'Z41_TIPO')]
        [TMaxLenght(3)]
        property Tipo: string read FTipo write SetTipo;

        // [TPersistable(fgPersistable, 'Z41_QTPAR')]
        // property QuantidadeMaxParcelas: integer read FQuantidadeMaxParcelas write SetQuantidadeMaxParcelas;

        // [TPersistable(fgPersistable, 'Z41_INTERV')]
        // property IntervaloEntreParcelas: integer read FIntervaloEntreParcelas write SetIntervaloEntreParcelas;

        [TPersistable(fgPersistable, 'Z41_ATIVO')]
        [TMaxLenght(1)]
        property Status: string read FStatus write SetStatus;

        [TPersistable(fgPersistable, 'Z41_DESCTP')]
        [TMaxLenght(30)]
        property DescricaoTipo: string read FDescricaoTipo write SetDescricaoTipo;

        constructor Create; override;
        destructor Destroy; override;

    end;

implementation

{ TFormaPagamento }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'Métodos CRUD'}

function TFormaPagamento.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao inserir FormaPagamento' + #13 + e.Message);
        end;
    finally
    end;
end;

function TFormaPagamento.Alterar: boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao alterar FormaPagamento' + #13 + e.Message);
        end;
    finally
    end;
end;

function TFormaPagamento.Excluir: boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao excluir FormaPagamento' + #13 + e.Message);
        end;
    finally
    end;

end;

function TFormaPagamento.Consultar(parametros: TParametro): TLista<TFormaPagamento>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        // condicao.Adiciona('Z41_COD', ccIgual, lgAnd);
        // condicao.Adiciona('Z41_DESCR', ccIgual, lgAnd);
        condicao.Adiciona('Z41_TIPO', ccIgual, lgAnd);
        // condicao.Adiciona('Z41_QTPAR', ccIgual, lgAnd);
        // condicao.Adiciona('Z41_INTERV', ccIgual, lgAnd);
        condicao.Adiciona('Z41_ATIVO', ccIgual, lgAnd);
        condicao.Adiciona('Z41_DESCTP', ccIgual, lgAnd);

        query := 'SELECT DISTINCT ' + Self.ObterCamposSeparadosPorVirgula(Consulta, []) + ' FROM ' + Self.TabelaReferencia + ' WHERE Z41_COD > '''' ' + condicao.ToString(true);

        result := dao.Consultar(query, parametros);
    finally
        condicao.Free;
    end;
end;

class function TFormaPagamento.Consultar(PermiteMostraTDC: boolean): TLista<TFormaPagamento>;
var
    f: TFormaPagamento;
begin
    try
        f := TFormaPagamento.Create;
        result := f.Consultar(nil);
    finally
        if f <> nil then
            FreeAndNil(f);
    end;
end;

constructor TFormaPagamento.Create;
begin
    inherited;

end;

destructor TFormaPagamento.Destroy;
begin

    inherited;
end;

function TFormaPagamento.Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TFormaPagamento>;
    // parametro : TParametro;
    // lista:TLista<TFormaPagamento>
begin
    try
        filtro := TFilter<TFormaPagamento>.Create;
        filtro.ScreenName := 'Filtro de FormaPagamento';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'Tipo=Z41_TIPO', 'Tipo');
        filtro.AddIndex(2, 'DescricaoTipo=Z41_DESCTP', 'DescricaoTipo');
        filtro.AddIndex(3, 'Status=Z41_ATIVO', 'Status');
        // filtro.AddIndex(1, 'Codigo=Z41_COD', 'Codigo');
        // filtro.AddIndex(2, 'DescricaoForma=Z41_DESCR', 'DescricaoForma');
        // filtro.AddIndex(4, 'QuantidadeMaxParcelas=Z41_QTPAR', 'QuantidadeMaxParcelas');
        // filtro.AddIndex(5, 'IntervaloEntreParcelas=Z41_INTERV', 'IntervaloEntreParcelas');


        // ###Criar os Índices do filtro
        // filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descrição');

{$REGION 'Campo Filtro'}
        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Tipo';
        campoFiltro.Name := 'Tipo';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'DescricaoTipo';
        campoFiltro.Name := 'DescricaoTipo';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Status';
        campoFiltro.Name := 'Status';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);


        // campoFiltro := TFieldFilter.Create;
        // campoFiltro.Description := 'Codigo';
        // campoFiltro.Name := 'Codigo';
        // campoFiltro.MaskTypes := mtNone;
        // campoFiltro.GridSize := 100;
        // campoFiltro.FieldType := fdNormal;
        // filtro.AddField(campoFiltro);

        // campoFiltro := TFieldFilter.Create;
        // campoFiltro.Description := 'DescricaoForma';
        // campoFiltro.Name := 'DescricaoForma';
        // campoFiltro.MaskTypes := mtNone;
        // campoFiltro.GridSize := 100;
        // campoFiltro.FieldType := fdNormal;
        // filtro.AddField(campoFiltro);

        // campoFiltro := TFieldFilter.Create;
        // campoFiltro.Description := 'QuantidadeMaxParcelas';
        // campoFiltro.Name := 'QuantidadeMaxParcelas';
        // campoFiltro.MaskTypes := mtNone;
        // campoFiltro.GridSize := 100;
        // campoFiltro.FieldType := fdNormal;
        // filtro.AddField(campoFiltro);

        // campoFiltro := TFieldFilter.Create;
        // campoFiltro.Description := 'IntervaloEntreParcelas';
        // campoFiltro.Name := 'IntervaloEntreParcelas';
        // campoFiltro.MaskTypes := mtNone;
        // campoFiltro.GridSize := 100;
        // campoFiltro.FieldType := fdNormal;
        // filtro.AddField(campoFiltro);

{$ENDREGION}
        result := filtro.Execute;
    finally
        // FreeAndNil(parametro);
        // FreeAndNil(lista);
    end;
end;

function TFormaPagamento.Obter(parametros: TParametro): TFormaPagamento;
var
    Lista: TLista<TFormaPagamento>;
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

function TFormaPagamento.Obter(ID: string): TFormaPagamento;
var
    parametros: TParametro;

begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'Z41_TIPO', ID);
        result := Obter(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

{$ENDREGION}
{$REGION 'Regras de Negócio'}

procedure TFormaPagamento.PreencherObjeto(FormaPagamento: TFormaPagamento);
begin
    FormaPagamento.CopiarPara(Self);
    FPreenchido := true;
end;

{$ENDREGION}
{$REGION 'Métodos de Propriedades'}
// procedure TFormaPagamento.SetCodigo(const Value: string);
// begin
// FCodigo := Value;
// end;

// procedure TFormaPagamento.SetDescricaoForma(const Value: string);
// begin
// FDescricaoForma := Value;
// end;

procedure TFormaPagamento.SetTipo(const Value: string);
begin
    FTipo := Value;
end;

// procedure TFormaPagamento.SetQuantidadeMaxParcelas(const Value: integer);
// begin
// FQuantidadeMaxParcelas := Value;
// end;

// procedure TFormaPagamento.SetIntervaloEntreParcelas(const Value: integer);
// begin
// FIntervaloEntreParcelas := Value;
// end;

procedure TFormaPagamento.SetStatus(const Value: string);
begin
    FStatus := Value;
end;

procedure TFormaPagamento.SetDescricaoTipo(const Value: string);
begin
    FDescricaoTipo := Value;
end;

{$ENDREGION}

end.
