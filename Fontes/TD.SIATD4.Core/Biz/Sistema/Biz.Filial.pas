unit Biz.Filial;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Biz.Empresa, Lib.Lista, Biz.TipoEntrega,
    Dal.ControleDados, Dal.CondicaoConsulta, Framework.Interfaces.CRUD, Dal.FabricaSQL;

type

    [TReferenceTable('SIATD_S13')]
    TFilial = class(TClasseBase, ICRUD<TFilial>)
    private
        FFone: string;
        FCnpj: string;
        FFilial: string;
        FEmail: string;
        FBairro: string;
        FFax: string;
        FUf: string;
        FDescricao: string;
        FCep: string;
        FDataAbertura: string;
        FRazaoSocial: string;
        FRecno: integer;
        FEmpresa: string;
        FCD: string;
        FInscricaoEstadual: string;
        FCidade: string;
        FEndereco: string;
        FNomeEmpresa: string;
        FPafEcf: string;
        FMensagemCupom: string;
        FCodigoChubb: string;
        FTiposEntrega: TLista<TTipoEntrega>;
        FSimilar: String;
        FCrossSelling: String;
        FUpSelling: String;
        FCodigoClientePadrao: string;
        FLojaClientePadrao: string;
        FVendedorPadrao: string;

        procedure SetBairro(const Value: string);
        procedure SetCD(const Value: string);
        procedure SetCep(const Value: string);
        procedure SetCidade(const Value: string);
        procedure SetCnpj(const Value: string);
        procedure SetDataAbertura(const Value: string);
        procedure SetDescricao(const Value: string);
        procedure SetEmail(const Value: string);
        procedure SetEmpresa(const Value: string);
        procedure SetEndereco(const Value: string);
        procedure SetFax(const Value: string);
        procedure SetFilial(const Value: string);
        procedure SetFone(const Value: string);
        procedure SetInscricaoEstadual(const Value: string);
        procedure SetRazaoSocial(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetUf(const Value: string);
        function GetEmpresaFilial: string;
        procedure SetNomeEmpresa(const Value: string);
        procedure SetPafEcf(const Value: string);
        procedure SetMensagemCupom(const Value: string);
        procedure SetCodigoChubb(const Value: string);
        procedure SetTiposEntrega(const Value: TLista<TTipoEntrega>);
        function GetCrossSelling_: Boolean;
        function GetSimilar_: Boolean;
        function GetUpSelling_: Boolean;
        procedure SetCrossSelling(const Value: String);
        procedure SetSimilar(const Value: String);
        procedure SetUpSelling(const Value: String);
        procedure SetCodigoClientePadrao(const Value: string);
        procedure SetLojaClientePadrao(const Value: string);
        procedure SetVendedorPadrao(const Value: string);

    public
        class var dao: TControleDados<TLista<TFilial>, TListaDAO<TFilial>>;

        /// <summary>
        /// Metodo que faz a inserção da ClasseBase
        /// </summary>
        function Inserir: integer;

        /// <summary>
        /// Metodo que faz a alteração da ClasseBase
        /// </summary>
        function Alterar: Boolean;

        /// <summary>
        /// Métido que faz a Deleção da ClasseBase
        /// </summary>
        /// <param name="ID">
        /// Chave  primária da tabela
        /// </param>
        function Excluir: Boolean;

        /// <summary>
        /// Métodos que retorna uma lista  de objetos de uma consulta
        /// pré-definida pelos parâmentros passados.
        /// </summary>
        function Consultar(parametros: TParametro): TLista<TFilial>;

        /// <summary>
        /// Método que chama a tela de filtro
        /// </summary>
        /// <param name="tipoOperacao">
        /// Tipo da operação, se é somente filtro, ou seleção de registro
        /// </param>
        function Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;

        /// <summary>
        /// Método que retorna um objeto preenchido
        /// </summary>
        /// <param name="ID">
        /// Chave primária da tabela
        /// </param>
        function Obter(ID: string): TFilial; overload;

        /// <summary>
        /// Método que retorna um objeto preenchido
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Obter(parametros: TParametro): TFilial; overload;

        /// <summary>
        /// obtem a lista de todas as filiais;
        /// </summary>
        class function ObterTodasFiliais: TLista<TFilial>;

        function ObterFiliaisAcessoPorUsuario(usuario: string): TLista<TFilial>;

        /// <summary>
        /// retorna uma lista de tipo de entraga de acordo com a filial logada
        /// </summary>
        procedure ObterListaTipoEntrega(codigoFilial: String);
        function ObterTipoEntrega(TipoEntrega: String): TTipoEntrega;

        /// <summary>
        /// Método que preenche a instância do Objeto
        /// </summary>
        /// <param name="ClasseBase">
        /// objeto de parametro para preenchimento da instância
        /// </param>
        procedure PopularObjeto(Filial: TFilial);

        [TPersistable(fgPersistable, 'S13_S12_EMP')]
        property Empresa: string read FEmpresa write SetEmpresa;

        [TPersistable(fgReadOnly, 'S12_NOME')]
        property NomeEmpresa: string read FNomeEmpresa write SetNomeEmpresa;

        [TPersistable(fgPersistable, 'S13_FILIAL')]
        property Filial: string read FFilial write SetFilial;

        property CodigoNomeFilial: string read GetEmpresaFilial;

        [TPersistable(fgPersistable, 'S13_DESC')]
        property Descricao: string read FDescricao write SetDescricao;

        [TPersistable(fgPersistable, 'S13_RAZAOSOCIAL')]
        property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;

        [TPersistable(fgPersistable, 'S13_END')]
        property Endereco: string read FEndereco write SetEndereco;

        [TPersistable(fgPersistable, 'S13_BAIRRO')]
        property Bairro: string read FBairro write SetBairro;

        [TPersistable(fgPersistable, 'S13_CIDADE')]
        property Cidade: string read FCidade write SetCidade;

        [TPersistable(fgPersistable, 'S13_UF')]
        property Uf: string read FUf write SetUf;

        [TPersistable(fgPersistable, 'S13_CEP')]
        property Cep: string read FCep write SetCep;

        [TPersistable(fgPersistable, 'S13_CNPJ')]
        property Cnpj: string read FCnpj write SetCnpj;

        [TPersistable(fgPersistable, 'S13_IE')]
        property InscricaoEstadual: string read FInscricaoEstadual write SetInscricaoEstadual;

        [TPersistable(fgPersistable, 'S13_FONE')]
        property Fone: string read FFone write SetFone;

        [TPersistable(fgPersistable, 'S13_FAX')]
        property Fax: string read FFax write SetFax;

        [TPersistable(fgPersistable, 'S13_DTABERTURA')]
        property DataAbertura: string read FDataAbertura write SetDataAbertura;

        [TPersistable(fgPersistable, 'S13_EMAIL')]
        property Email: string read FEmail write SetEmail;

        [TPersistable(fgPersistable, 'S13_CD')]
        property CD: string read FCD write SetCD;

        [TPersistable(fgPersistable, 'S13_PAFECF')]
        property PafEcf: string read FPafEcf write SetPafEcf;

        [TPersistable(fgPersistable, 'S13_MENSAGEMCUPOM')]
        property MensagemCupom: string read FMensagemCupom write SetMensagemCupom;

        [TPersistable(fgPersistable, 'S13_CLIENTEPADRAO')]
        property CodigoClientePadrao: string read FCodigoClientePadrao write SetCodigoClientePadrao;

        [TPersistable(fgPersistable, 'S13_SEQCLIENTEPADRAO')]
        property LojaClientePadrao: string read FLojaClientePadrao write SetLojaClientePadrao;

        [TPersistable(fgPersistable, 'S13_VENDEDORPADRAO')]
        property VendedorPadrao: string read FVendedorPadrao write SetVendedorPadrao;

        [TPersistable(fgPersistable, 'S13_CODIGOCHUBB')]
        property CodigoChubb: string read FCodigoChubb write SetCodigoChubb;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgPersistable, 'S13_CROSSSELLING')]
        property CrossSelling: String read FCrossSelling write SetCrossSelling;
        property CrossSelling_: Boolean read GetCrossSelling_;

        [TPersistable(fgPersistable, 'S13_UPSELLING')]
        property UpSelling: String read FUpSelling write SetUpSelling;
        property UpSelling_: Boolean Read GetUpSelling_;

        [TPersistable(fgPersistable, 'S13_SIMILAR')]
        property Similar: String read FSimilar write SetSimilar;
        property Similar_: Boolean Read GetSimilar_;

        property TiposEntrega: TLista<TTipoEntrega> read FTiposEntrega write SetTiposEntrega;

        constructor Create; override;
        destructor Destroy; override;
    end;

implementation

{ TFilial }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'Métodos CRUD'}

function TFilial.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao inserir Filial' + #13 + e.Message);
        end;
    finally
    end;
end;

function TFilial.Alterar: Boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao alterar Filial' + #13 + e.Message);
        end;
    finally
    end;
end;

function TFilial.Consultar(parametros: TParametro): TLista<TFilial>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('S13_S12_EMP', ccIgual, lgAnd);
        condicao.Adiciona('S13_FILIAL', ccIgual, lgAnd);
        condicao.Adiciona('S13_DESC', ccLike, lgAnd);
        condicao.Adiciona('S13_RAZAOSOCIAL', ccIgual, lgAnd);
        condicao.Adiciona('S13_END', ccIgual, lgAnd);
        condicao.Adiciona('S13_BAIRRO', ccIgual, lgAnd);
        condicao.Adiciona('S13_CIDADE', ccIgual, lgAnd);
        condicao.Adiciona('S13_UF', ccIgual, lgAnd);
        condicao.Adiciona('S13_CEP', ccIgual, lgAnd);
        condicao.Adiciona('S13_CNPJ', ccIgual, lgAnd);
        condicao.Adiciona('S13_IE', ccIgual, lgAnd);
        condicao.Adiciona('S13_FONE', ccIgual, lgAnd);
        condicao.Adiciona('S13_FAX', ccIgual, lgAnd);
        condicao.Adiciona('S13_DTABERTURA', ccIgual, lgAnd);
        condicao.Adiciona('S13_EMAIL', ccIgual, lgAnd);
        condicao.Adiciona('S13_CD', ccIgual, lgAnd);
        condicao.Adiciona('S13_PAFECF', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAnd);

        query := 'SELECT S13_S12_EMP, ' + //
            'S12_NOME, ' + //
            'S13_FILIAL, ' + //
            'S13_DESC, ' + //
            'S13_RAZAOSOCIAL, ' + //
            'S13_END, ' + //
            'S13_BAIRRO, ' + //
            'S13_CIDADE, ' + //
            'S13_UF, ' + //
            'S13_CEP, ' + //
            'S13_CNPJ, ' + //
            'S13_IE, ' + //
            'S13_FONE, ' + //
            'S13_FAX, ' + //
            'S13_DTABERTURA, ' + //
            'S13_EMAIL, ' + //
            'S13_CD, ' + //
            'S13_PAFECF, ' + //
            'S13_MENSAGEMCUPOM, ' + //
            'S13_CODIGOCHUBB, ' + //
            'SIATD_S13.R_E_C_N_O_, ' + //
            'S13_SEQCLIENTEPADRAO, ' + //
            'S13_CLIENTEPADRAO, ' + //
            'S13_VENDEDORPADRAO, ' + //
            'S13_CROSSSELLING, ' + //
            'S13_UPSELLING, ' + //
            'S13_SIMILAR ' + //
            ' FROM SIATD_S13 INNER JOIN SIATD_S12 ' + //
            ' ON S12_EMPRESA = S13_S12_EMP ' + //
            ' WHERE S12_EMPRESA = ''01'' ' + condicao.ToString(true);

        result := dao.Consultar(query, parametros)
    finally
        if condicao <> nil then
            FreeAndNil(condicao);
    end;
end;

constructor TFilial.Create;
begin
    inherited;
    FTiposEntrega := TLista<TTipoEntrega>.Create;
end;

function TFilial.Excluir: Boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao excluir Filial' + #13 + e.Message);
        end;
    finally
    end;
end;

destructor TFilial.Destroy;
begin
    if FTiposEntrega <> nil then
        FreeAndNil(FTiposEntrega);
    inherited;
end;

function TFilial.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    Parametro: TParametro;
    campoFiltro: TFieldFilter;
    Filtro: TFilter<TFilial>;
    Lista: TLista<TFilial>;
begin
    try
        Parametro := TParametro.Create;
        Parametro.Add('', 'S13_S12_EMP', TUsuarioLogado.ObterInstancia.Filial.Empresa);
        Lista := Self.Consultar(Parametro);

        Filtro := TFilter<TFilial>.Create;

        Filtro.ScreenName := 'Filtro de Filial';
        Filtro.OperationType := tipoOperacao;
        Filtro.MultiSelect := true;
        // filtro.AddIndex(1, 'Empresa=S13_S12_EMP, Filila=S13_FILIAL', 'Empresa + Filial');
        Filtro.AddIndex(2, 'Filial=S13_FILIAL', 'Filial');
        // filtro.AddIndex(3, 'Empresa=S13_S12_EMP, Filial=S13_FILIAL, Descricao=S13_DESC', 'Empresa + Filial + Descrição');
        Filtro.Task := 'ConsultarFilial';

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Empresa';
        campoFiltro.Name := 'Empresa';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        Filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Filial';
        campoFiltro.Name := 'Filial';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.IDFieldName := 'Filial';
        campoFiltro.DescriptionFieldName := 'Descricao';
        campoFiltro.FieldType := fdDataListCombo;
        campoFiltro.DataSource := Lista.Tolist;
        Filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Descricao';
        campoFiltro.Name := 'Descricao';
        campoFiltro.MaskTypes := mtString;
        campoFiltro.FieldType := fdNormal;
        campoFiltro.GridSize := 100;
        Filtro.AddField(campoFiltro);

        result := Filtro.Execute;

    finally
        FreeAndNil(Parametro);
        FreeAndNil(Lista);
    end;
end;

function TFilial.Obter(parametros: TParametro): TFilial;
var
    Lista: TLista<TFilial>;
    query: string;
begin
    try
        Lista := nil;
        Lista := Self.Consultar(parametros);

        if Lista.Count = 1 then
        begin
            PopularObjeto(Lista[0]);
            result := Self;
        end
        else
        begin
            MessageDlg('Nenhum registro encontrado.', mtError, [mbOk], 0);
            result := nil;
        end;
    finally
        FreeAndNil(Lista);
    end;
end;

function TFilial.ObterFiliaisAcessoPorUsuario(usuario: string): TLista<TFilial>;
var
    Parametro: TParametro;
    query: string;
begin
    try
        Parametro := TParametro.Create();
        Parametro.Add('', 'S04_S01_LOGIN', usuario);
        query := 'SELECT ' + ' S13.S13_S12_EMP, S13.S13_FILIAL, S13.S13_DESC, S13.S13_RAZAOSOCIAL, S13.S13_END, ' + ' S13.S13_BAIRRO, S13.S13_CIDADE, S13.S13_UF, S13.S13_CEP, S13.S13_CNPJ, S13.S13_IE, S13.S13_FONE, ' +
            ' S13.S13_FAX, S13.S13_DTABERTURA, S13.S13_EMAIL, S13.S13_CD, S13_MENSAGEMCUPOM, S13_CODIGOCHUBB, ' + ' S13.R_E_C_N_O_, S13_PAFECF, SIATD_S12.S12_NOME, S13_CROSSSELLING, S13_UPSELLING, S13_SIMILAR ' + ' FROM SIATD_S04 S04 INNER JOIN SIATD_S13 ' +
            ' S13 ON S04.S04_S13_FILIAL = S13.S13_FILIAL ' + ' INNER JOIN  SIATD_S12 ' + ' ON S12_EMPRESA = S13_S12_EMP ' + ' WHERE S04.D_E_L_E_T_ = '''' ' + ' AND S04.S04_S01_LOGIN = :S04_S01_LOGIN AND S12_EMPRESA = ''01'' ';
        result := dao.Consultar(query, Parametro);
    finally
        FreeAndNil(Parametro);
    end;

end;

function TFilial.ObterTipoEntrega(TipoEntrega: String): TTipoEntrega;
var
    tipo: TTipoEntrega;
begin
    result := nil;
    for tipo in Self.TiposEntrega do
    begin
        if tipo.TipoEntrega = TipoEntrega then
        begin
            result := tipo;
            Break;
        end;
    end;

end;

class function TFilial.ObterTodasFiliais: TLista<TFilial>;
var
    fil: TFilial;
begin
    fil := TFilial.Create;
    try
        result := fil.Consultar(nil);
    finally
        FreeAndNil(fil);
    end;

end;

function TFilial.Obter(ID: string): TFilial;
var
    parametros: TParametro;

begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'S13_FILIAL', ID);
        result := Obter(parametros);
    finally
        FreeAndNil(parametros)
    end;
end;

{$ENDREGION}
{$REGION 'Regras de Negócio'}

procedure TFilial.PopularObjeto(Filial: TFilial);
begin
    Filial.CopiarPara(Self);
    FPreenchido := true;
end;

{$ENDREGION}
{$REGION 'Métodos de Propriedades'}

procedure TFilial.SetBairro(const Value: string);
begin
    FBairro := Value;
end;

procedure TFilial.SetCD(const Value: string);
begin
    FCD := Value;
end;

procedure TFilial.SetCep(const Value: string);
begin
    FCep := Value;
end;

procedure TFilial.SetCidade(const Value: string);
begin
    FCidade := Value;
end;

procedure TFilial.SetCnpj(const Value: string);
begin
    FCnpj := Value;
end;

procedure TFilial.SetCodigoChubb(const Value: string);
begin
    FCodigoChubb := Value;
end;

procedure TFilial.SetCodigoClientePadrao(const Value: string);
begin
    FCodigoClientePadrao := Value;
end;

function TFilial.GetCrossSelling_: Boolean;
begin
    result := false;

    if FCrossSelling = 'S' then
        result := true;
end;

procedure TFilial.SetCrossSelling(const Value: String);
begin
    FCrossSelling := Value;
end;

function TFilial.GetEmpresaFilial: string;
begin
    result := Self.Filial + ' - ' + Self.Descricao;
end;

function TFilial.GetSimilar_: Boolean;
begin
    result := false;

    if FSimilar = 'S' then
        result := true;
end;

function TFilial.GetUpSelling_: Boolean;
begin
    result := false;

    if FUpSelling = 'S' then
        result := true;
end;

procedure TFilial.SetDataAbertura(const Value: string);
begin
    FDataAbertura := Value;
end;

procedure TFilial.SetDescricao(const Value: string);
begin
    FDescricao := Value;
end;

procedure TFilial.SetEmail(const Value: string);
begin
    FEmail := Value;
end;

procedure TFilial.SetEmpresa(const Value: string);
begin
    FEmpresa := Value;
end;

procedure TFilial.SetEndereco(const Value: string);
begin
    FEndereco := Value;
end;

procedure TFilial.SetFax(const Value: string);
begin
    FFax := Value;
end;

procedure TFilial.SetFilial(const Value: string);
begin
    FFilial := Value;
end;

procedure TFilial.SetFone(const Value: string);
begin
    FFone := Value;
end;

procedure TFilial.SetInscricaoEstadual(const Value: string);
begin
    FInscricaoEstadual := Value;
end;

procedure TFilial.SetLojaClientePadrao(const Value: string);
begin
    FLojaClientePadrao := Value;
end;

procedure TFilial.SetMensagemCupom(const Value: string);
begin
    FMensagemCupom := Value;
end;

procedure TFilial.SetNomeEmpresa(const Value: string);
begin
    FNomeEmpresa := Value;
end;

procedure TFilial.SetPafEcf(const Value: string);
begin
    FPafEcf := Value;
end;

procedure TFilial.SetRazaoSocial(const Value: string);
begin
    FRazaoSocial := Value;
end;

procedure TFilial.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TFilial.SetSimilar(const Value: String);
begin
    FSimilar := Value;
end;

procedure TFilial.SetTiposEntrega(const Value: TLista<TTipoEntrega>);
begin
    FTiposEntrega := Value;
end;

procedure TFilial.SetUf(const Value: string);
begin
    FUf := Value;
end;

procedure TFilial.SetUpSelling(const Value: String);
begin
    FUpSelling := Value;
end;

procedure TFilial.SetVendedorPadrao(const Value: string);
begin
    FVendedorPadrao := Value;
end;

{$ENDREGION}

procedure TFilial.ObterListaTipoEntrega(codigoFilial: String);
var
    TipoEntrega: TTipoEntrega;
begin
    try
        TipoEntrega := TTipoEntrega.Create;

        FTiposEntrega := TipoEntrega.ConsultarTiposDeEntregaOrcamento(codigoFilial);
    finally
        if TipoEntrega <> nil then
            FreeAndNil(TipoEntrega);

    end;
end;

end.
