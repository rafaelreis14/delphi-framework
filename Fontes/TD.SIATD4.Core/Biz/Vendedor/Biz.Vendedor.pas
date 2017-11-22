unit Biz.Vendedor;

interface

uses Classes, System.SysUtils, Lib.Parametro, Lib.Enumeradores, Biz.Filial,
     Lib.Filter, Lib.Persistable, Lib.ResultFilter, Framework.Interfaces.CRUD, Lib.Lista,
  Dal.ControleDados, Dal.CondicaoConsulta, Lib.ClasseBase,
  Framework.Interfaces.CRUDGenerico, Lib.Base;

type
    [TReferenceTable('SA3010')]
    TVendedor = class(TClasseBase, ICRUD<TVendedor>, ICRUDGenerico)
    private
        FCodigo: string;
        FNomeReduzido: string;
        FNome: string;
        FVendedorPadrao: string;
        FTabelaComissao: string;
        procedure SetCodigo(const Value: string);
        procedure SetNomeReduzido(const Value: string);
        procedure SetNome(const Value: string);
        procedure SetTabelaComissao(const Value: string);
    public
        class var dao: TControleDados<TLista<TVendedor>,TListaDAO<TVendedor>>;
        function Inserir: integer;
        function Alterar: boolean;
        function Excluir: boolean;
        function Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
        function Obter(ID: string): TVendedor;
        function ObterBase(ID: string): TBase;
        function Consultar(parametros: TParametro): TLista<TVendedor>;
        procedure PreencherObjeto(vendedor: TVendedor);

        [TPersistable(fgPersistable, 'A3_COD')]
        property Codigo: string read FCodigo write SetCodigo;

        [TPersistable(fgPersistable, 'A3_NREDUZ')]
        property NomeReduzido: string read FNomeReduzido write SetNomeReduzido;

        [TPersistable(fgPersistable, 'A3_NOME')]
        property Nome: string read FNome write SetNome;

        [TPersistable(fgPersistable, 'A3_TCOMIS')]
        property TabelaComissao: string read FTabelaComissao write SetTabelaComissao;

        property VendedorPadrao: string read FVendedorPadrao;


        ///	<summary>
        ///	  Obtem somente o código do vendedor padrao
        ///	</summary>
        procedure ObterCodigoVendedorPadrao(codigoFilial: String);

        ///	<summary>
        ///	  Obter e popula o vendedor
        ///	</summary>
        procedure ObterVendedorPadrao(codigoFilial: String);


        constructor Create;
    end;

implementation

{ TVendedor }

uses Lib.BIblioteca, Biz.UsuarioLogado;

function TVendedor.Alterar: boolean;
begin
    //
end;

function TVendedor.Consultar(parametros: TParametro): TLista<TVendedor>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('A3_COD',ccIgual, lgAnd);
        condicao.Adiciona('A3_NREDUZ',ccIgual, lgAnd);
        condicao.Adiciona('A3_NOME',ccIgual, lgAnd);
        condicao.Adiciona('A3_TCOMIS',ccIgual, lgAnd);

        query := 'SELECT '+Self.ObterCamposSeparadosPorVirgula(Consulta,[]) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        Result := dao.Consultar(query,parametros);
    finally
        condicao.Free;
    end;
end;

constructor TVendedor.Create;
begin
    inherited;
end;

function TVendedor.Excluir: boolean;
begin
    //
end;

function TVendedor.Inserir: integer;
begin
    //
end;

function TVendedor.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TVendedor>;
begin
    inherited;
    filtro := TFilter<TVendedor>.Create;
    filtro.ScreenName := 'Filtro de Vendedores';
    filtro.OperationType := tipoOperacao;
    filtro.MultiSelect := multselect;
    filtro.AddIndex(1, 'Codigo=A3_COD', 'Código');
    filtro.AddIndex(2, 'Nome=A3_NREDUZ', 'Nome');
    filtro.Task := 'ConsultarVendedor';

    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'Codigo';
    campoFiltro.Name := 'Codigo';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.GridSize := 80;
    campoFiltro.FieldType := fdNormal;
    filtro.AddField(campoFiltro);

    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'Nome Reduzido';
    campoFiltro.Name := 'NomeReduzido';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.FieldType := fdNormal;
    campoFiltro.GridSize := 200;
    filtro.AddField(campoFiltro);

    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'Nome';
    campoFiltro.Name := 'Nome';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.FieldType := fdNormal;
    campoFiltro.GridSize := 200;
    filtro.AddField(campoFiltro);

    result := filtro.Execute;
end;

function TVendedor.Obter(ID: string): TVendedor;
var
    parametro: TParametro;
    lista: TLista<TVendedor>;
begin
    // inherited;
    try
        parametro := TParametro.Create;
        parametro.Add('', 'A3_COD', ID);
        lista := Self.Consultar(parametro);

        if lista.Count = 1 then
        begin
            PreencherObjeto(lista[0]);
            Result := self;
        end else
        begin
            TLib.MensagemAdvertencia('Nenhum registro encontrado.', 'Aviso');
            Result := nil;
        end;
    finally
        parametro.Free;
        lista.Destroy;
    end;
end;

function TVendedor.ObterBase(ID: string): TBase;
begin
    Result := Self.Obter(ID);
end;

procedure TVendedor.ObterCodigoVendedorPadrao(codigoFilial: String);
var
    filial: TFilial;
begin
    try
        filial := TFilial.Create;
        filial.Obter(codigoFilial);

        if filial.Preenchido then
        begin
            FVendedorPadrao := filial.VendedorPadrao;
        end else
            raise Exception.Create('Não foi possível obter o cliente padrão, favor verificar.');
    finally
        if filial <> nil then
            FreeAndNil(filial);
    end;
end;

procedure TVendedor.ObterVendedorPadrao(codigoFilial: String);
begin
    if Self.VendedorPadrao = '' then
        Self.ObterCodigoVendedorPadrao(codigoFilial);

    Self.Obter(Self.VendedorPadrao);
end;

procedure TVendedor.PreencherObjeto(vendedor: TVendedor);
begin
    vendedor.CopiarPara(self);
end;

procedure TVendedor.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TVendedor.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TVendedor.SetNomeReduzido(const Value: string);
begin
  FNomeReduzido := Value;
end;

procedure TVendedor.SetTabelaComissao(const Value: string);
begin
  FTabelaComissao := Value;
end;

end.

