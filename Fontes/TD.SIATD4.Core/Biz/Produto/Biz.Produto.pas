unit Biz.Produto;

interface

uses Classes, System.SysUtils, Lib.Parametro, Lib.Enumeradores, Lib.ClasseBase,
    Biz.Filial, Lib.Filter, Lib.Persistable, Lib.Biblioteca,
    Lib.ResultFilter, Lib.Lista, Biz.Estoque, Biz.TipoEntrega,
    Vcl.Forms, Biz.UsuarioLogado, Framework.Interfaces.CRUD, Dal.ControleDados;

type
    TTipoProduto = (tpNenhum = 0, tpNormal = 1, tpSelfColor = 2, tpHidrometro = 3, tpCurso = 4, tpSeguro = 5);
    TTipoAbastecimento = (taNenhum = 0, taAbastecimentoCD = 1, taCrossDock = 2, taCrossDockLibVendasCD = 3);

    [TReferenceTable('SB1010')]
    TProduto = class(TClasseBase, ICRUD<TProduto>)
    private
        FDataFimPromocao: string;
        FDataInicioPromocao: string;
        FDescricao: string;
        FCodigo: string;
        FEstoqueProduto: Double;
        FPrecoTabelaProduto: Double;
        FTotalProduto: Double;
        FQuantidadeVendida: Double;
        FQtdMultiplaVenda: Double;
        FUnidadeMedidaTransp: string;
        FUnidadeMedidaEmbalagem: string;
        FCodigoBarraTransp: string;
        FCodigoBarraEmbalagem: string;
        FCodigoBarra2: string;
        FQtdPorEmbalagem: Double;
        FCodigoBarra3: string;
        FCodigoBarra1: string;
        FQtdCaixaPorTransp: Double;
        FPrecoPromocao: Double;
        FProdutoAtivo_: string;
        FProdutoHidrometro_: string;
        FProdutoSelfColor_: string;
        FPeso: Double;
        FCustoGerencial: Double;
        FPercentualImpostoDilma: Double;
        FPodeEntregarDepositoLoja_: string;
        FTipoProduto_: integer;
        FCodigoCursoSeguro: string;
        FTipoAbastecimento_: integer;
        FProdutoEcommerce_: string;
        FProdutoSobEncomenda_: string;
        FProdutoLiberadoConferenciaFiscal_: string;
        FProdutoForaLinha_: string;
        FProdutoEmCampanha_: string;
        FEstoqueFiliais: TLista<TEstoque>;
        FFamilia: string;
        FFabricante: string;
        FSubGrupo: string;
        FTipologia: string;
        FGrupo: string;
        procedure SetCodigo(const Value: string);
        procedure SetDataFimPromocao(const Value: string);
        procedure SetDataInicioPromocao(const Value: string);
        procedure SetDescricao(const Value: string);
        procedure SetEstoqueProduto(const Value: Double);
        procedure SetPrecoTabelaProduto(const Value: Double);
        procedure SetTotalProduto(const Value: Double);
        function GetTotalProduto: Double;
        procedure SetQuantidadeVendida(const Value: Double);
        procedure SetQtdMultiplaVenda(const Value: Double);
        procedure SetCodigoBarra1(const Value: string);
        procedure SetCodigoBarra2(const Value: string);
        procedure SetCodigoBarra3(const Value: string);
        procedure SetCodigoBarraEmbalagem(const Value: string);
        procedure SetCodigoBarraTransp(const Value: string);
        procedure SetQtdCaixaPorTransp(const Value: Double);
        procedure SetQtdPorEmbalagem(const Value: Double);
        procedure SetUnidadeMedidaEmbalagem(const Value: string);
        procedure SetUnidadeMedidaTransp(const Value: string);
        procedure SetPrecoPromocao(const Value: Double);
        function GetPrecoAtualProduto: Double;
        function GetProdutoEmPromocao: boolean;
        function GetProdutoAtivo: boolean;
        procedure SetProdutoAtivo_(const Value: string);
        function GetProdutoHidrometro: boolean;
        function GetProdutoSelfColor: boolean;
        procedure SetProdutoHidrometro_(const Value: string);
        procedure SetProdutoSelfColor_(const Value: string);
        procedure SetPeso(const Value: Double);
        procedure SetCustoGerencial(const Value: Double);
        procedure SetPercentualImpostoDilma(const Value: Double);
        function GetPodeEntregarDepositoLoja: boolean;
        procedure SetPodeEntregarDepositoLoja_(const Value: string);
        procedure SetTipoProduto_(const Value: integer);
        procedure SetCodigoCursoSeguro(const Value: string);
        function GetTipoProduto: TTipoProduto;
        function GetTipoAbastecimento: TTipoAbastecimento;
        function GetProdutoEcommerce: boolean;
        procedure SetProdutoEcommerce_(const Value: string);
        procedure SetTipoAbastecimento_(const Value: integer);
        function GetProdutoSobEncomenda: boolean;
        procedure SetProdutoSobEncomenda_(const Value: string);
        function GetProdutoLiberadoConferenciaFiscal: boolean;
        procedure SetProdutoLiberadoConferenciaFiscal_(const Value: string);
        function GetProdutoForaLinha: boolean;
        procedure SetProdutoForaLinha_(const Value: string);
        function GetProdutoEmCampanha: boolean;
        procedure SetProdutoEmCampanha_(const Value: string);
        function ObterAlternativos(tipoAlternativo: TTipoAlternativo; descricao: string): TLista<TProduto>;
        function ObterQuantidadeAlternativo(tipoAlternativo: TTipoAlternativo): integer;
        procedure SetEstoqueFiliais(const Value: TLista<TEstoque>);
        procedure SetFabricante(const Value: string);
        procedure SetFamilia(const Value: string);
        procedure SetGrupo(const Value: string);
        procedure SetSubGrupo(const Value: string);
        procedure SetTipologia(const Value: string);
        function GetCodigoTabelaPreco: String;

    public

        class var dao: TControleDados<TLista<TProduto>, TListaDAO<TProduto>>;

        /// <summary>
        /// Metodo que faz a inser��o da ClasseBase
        /// </summary>
        function Inserir: integer;

        /// <summary>
        /// Metodo que faz a altera��o da ClasseBase
        /// </summary>
        function Alterar: boolean;

        /// <summary>
        /// M�tido que faz a Dele��o da ClasseBase
        /// </summary>
        /// <param name="ID">
        /// Chave  prim�ria da tabela
        /// </param>
        function Excluir: boolean;

        /// <summary>
        /// M�todo que chama a tela de filtro
        /// </summary>
        /// <param name="tipoOperacao">
        /// Tipo da opera��o, se � somente filtro, ou sele��o de registro
        /// </param>
        function Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter; overload;
        function Listar(tipoOperacao: TOparationTypes; multselect: boolean; descricaoProduto: string): TResultFilter; overload;

        /// <summary>
        /// M�todo que retorna um objeto preenchido
        /// </summary>
        /// <param name="ID">
        /// Chave prim�ria da tabela
        /// </param>
        function Obter(ID: string): TProduto; overload;
        function ObterLista(ID: string): TLista<TProduto>;
        function ObterCrossSelling: TLista<TProduto>;
        function ObterUpSelling: TLista<TProduto>;
        function ObterSimilares: TLista<TProduto>;
        function ObterQuantidadeCrossSelling: integer;
        function ObterQuantidadeUpSelling: integer;
        function ObterQuantidadeSimilar: integer;

        function Consultar(parametros: TParametro): TLista<TProduto>;

        /// <summary>
        /// M�todo que retorna um objeto preenchido
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        // function Obter(parametros: TParametro): TObject; overload;

        /// <summary>
        /// M�todo que preenche a inst�ncia do Objeto
        /// </summary>
        /// <param name="ClasseBase">
        /// objeto de parametro para preenchimento da inst�ncia
        /// </param>
        procedure PreencherObjeto(Produto: TProduto);

        procedure PreencherProdutoBasico(Produto: TProduto);
        procedure PreencherProdutoPreco(Produto: TProduto);
        procedure PreencherProdutoEstoqueCusto(Produto: TProduto);

        /// <summary>
        /// Retonar� quantidade multipla de venda dependendo do codigo de
        /// identifica��o
        /// </summary>
        /// <param name="codigoIdentificacao">
        /// codigo produto, codigo de barra, codigo palet, codigo caixa
        /// </param>
        function ObterQuantidadeMultipla(codigoIdentificacao: string): Double;

        /// <summary>
        /// Faz uma checagem em todos os c�digo de referencia e retorna se �
        /// do produto ou n�o
        /// </summary>
        function ChecarCodigoProduto(codigoIdentificacao: string): boolean;

        /// <summary>
        /// Verifica se o valor�digitado � compativel com o multiplo do
        /// produto
        /// </summary>
        /// <param name="qtdDigitada">
        /// quantidade passada pelo usu�rio
        /// </param>
        /// <param name="mensagem">
        /// se deseja exibir a mensagem
        /// </param>
        function ValidarQuantidadeMultipla(qtdDigitada: Double; mensagem: boolean = true): boolean;

        /// <summary>
        /// Valida se a descri��o tem caracteres inv�lidos
        /// </summary>
        function ValidarCaracteresInvalidosDescricao: boolean;

        procedure ObterEstoqueFiliais(tiposDeEntrega: TLista<TTipoEntrega>);
        procedure MostrarEstoqueFiliais;

        procedure AtualizarEstoqueCusto(Filial: string);

        procedure CopiarPara(objeto: TObject); override;

        [TPersistable(fgPersistable, 'B1_COD')]
        property Codigo: string read FCodigo write SetCodigo;

        [TPersistable(fgPersistable, 'B1_DESC')]
        property descricao: string read FDescricao write SetDescricao;

        [TPersistable(fgReadOnly, 'B0_DTAINIC')]
        property DataInicioPromocao: string read FDataInicioPromocao write SetDataInicioPromocao;

        [TPersistable(fgReadOnly, 'B0_DTAFIM')]
        property DataFimPromocao: string read FDataFimPromocao write SetDataFimPromocao;

        property ProdutoEmPromocao: boolean read GetProdutoEmPromocao;

        [TPersistable(fgReadOnly, 'B0_PRV1')]
        property PrecoTabelaProduto: Double read FPrecoTabelaProduto write SetPrecoTabelaProduto;

        [TPersistable(fgReadOnly, 'B0_PRV2')]
        property PrecoPromocao: Double read FPrecoPromocao write SetPrecoPromocao;

        property PrecoAtualProduto: Double read GetPrecoAtualProduto;

        [TPersistable(fgReadOnly, 'ESTOQUE')]
        property EstoqueProduto: Double read FEstoqueProduto write SetEstoqueProduto;

        [TPersistable(fgPersistable, 'B1_QTMULTV')]
        property QtdMultiplaVenda: Double read FQtdMultiplaVenda write SetQtdMultiplaVenda;

         [TPersistable(fgPersistable, 'B1_CODBAR')]
         property CodigoBarra1: string read FCodigoBarra1 write SetCodigoBarra1;

         [TPersistable(fgPersistable, 'B1_CODBARR')]
         property CodigoBarra2: string read FCodigoBarra2 write SetCodigoBarra2;

         [TPersistable(fgPersistable, 'B1_CODBAR1')]
         property CodigoBarra3: string read FCodigoBarra3 write SetCodigoBarra3;

         [TPersistable(fgPersistable, 'B1_UMTRANS')]
         property UnidadeMedidaTransp: string read FUnidadeMedidaTransp write SetUnidadeMedidaTransp;

         [TPersistable(fgPersistable, 'B1_QTTRANS')]
         property QtdCaixaPorTransp: Double read FQtdCaixaPorTransp write SetQtdCaixaPorTransp;

         [TPersistable(fgPersistable, 'B1_CBTRANS')]
         property CodigoBarraTransp: string read FCodigoBarraTransp write SetCodigoBarraTransp;

        [TPersistable(fgPersistable, 'B1_SEGUM')]
        property UnidadeMedidaEmbalagem: string read FUnidadeMedidaEmbalagem write SetUnidadeMedidaEmbalagem;

        [TPersistable(fgPersistable, 'B1_CONV')]
        property QtdPorEmbalagem: Double read FQtdPorEmbalagem write SetQtdPorEmbalagem;

         [TPersistable(fgPersistable, 'B1_CBEMB')]
         property CodigoBarraEmbalagem: string read FCodigoBarraEmbalagem write SetCodigoBarraEmbalagem;

        [TPersistable(fgPersistable, 'B1_ATVDA')]
        property ProdutoAtivo_: string read FProdutoAtivo_ write SetProdutoAtivo_;
        property ProdutoAtivo: boolean read GetProdutoAtivo;

        // [TPersistable(fgPersistable, 'B1_TDHIDRO')]
        // property ProdutoHidrometro_: string read FProdutoHidrometro_ write SetProdutoHidrometro_;
        property ProdutoHidrometro: boolean read GetProdutoHidrometro;
        //
        // [TPersistable(fgPersistable, 'B1_TDSELF1')]
        // property ProdutoSelfColor_: string read FProdutoSelfColor_ write SetProdutoSelfColor_;
        property ProdutoSelfColor: boolean read GetProdutoSelfColor;

        [TPersistable(fgPersistable, 'B1_PESO')]
        property Peso: Double read FPeso write SetPeso;

        // [TPersistable(fgReadOnly, 'B2_CGER')]
        // property CustoGerencial: Double read FCustoGerencial write SetCustoGerencial;

        // [TPersistable(fgPersistable, 'B1_IMPNCM')]
        // property PercentualImpostoDilma: Double read FPercentualImpostoDilma write SetPercentualImpostoDilma;

        [TPersistable(fgPersistable, 'B1_TDDL')]
        property PodeEntregarDepositoLoja_: string read FPodeEntregarDepositoLoja_ write SetPodeEntregarDepositoLoja_;
        property PodeEntregarDepositoLoja: boolean read GetPodeEntregarDepositoLoja;

        [TPersistable(fgPersistable, 'B1_TDLE')]
        property ProdutoSobEncomenda_: string read FProdutoSobEncomenda_ write SetProdutoSobEncomenda_;
        property ProdutoSobEncomenda: boolean read GetProdutoSobEncomenda;

        [TPersistable(fgPersistable, 'B1_TDTIPO')]
        property TipoProduto_: integer read FTipoProduto_ write SetTipoProduto_;
        property TipoProduto: TTipoProduto read GetTipoProduto;

        [TPersistable(fgPersistable, 'B1_ABASTEC')]
        property TipoAbastecimento_: integer read FTipoAbastecimento_ write SetTipoAbastecimento_;
        property TipoAbastecimento: TTipoAbastecimento read GetTipoAbastecimento;

        [TPersistable(fgPersistable, 'B1_PRODETD')]
        property ProdutoEcommerce_: string read FProdutoEcommerce_ write SetProdutoEcommerce_;
        property ProdutoEcommerce: boolean read GetProdutoEcommerce;

        [TPersistable(fgPersistable, 'B1_TDLIBPE')]
        property ProdutoLiberadoConferenciaFiscal_: string read FProdutoLiberadoConferenciaFiscal_ write SetProdutoLiberadoConferenciaFiscal_;
        property ProdutoLiberadoConferenciaFiscal: boolean read GetProdutoLiberadoConferenciaFiscal;

        [TPersistable(fgPersistable, 'B1_TDLIN')]
        property ProdutoForaLinha_: string read FProdutoForaLinha_ write SetProdutoForaLinha_;
        property ProdutoForaLinha: boolean read GetProdutoForaLinha;

        [TPersistable(fgPersistable, 'B1_STATUS')]
        property ProdutoEmCampanha_: string read FProdutoEmCampanha_ write SetProdutoEmCampanha_;
        property ProdutoEmCampanha: boolean read GetProdutoEmCampanha;

        [TPersistable(fgPersistable, 'B1_FAMIL')]
        property Familia: string read FFamilia write SetFamilia;

        [TPersistable(fgPersistable, 'B1_GRPO')]
        property Grupo: string read FGrupo write SetGrupo;

        [TPersistable(fgPersistable, 'B1_SGRUPO')]
        property SubGrupo: string read FSubGrupo write SetSubGrupo;

        [TPersistable(fgPersistable, 'B1_TIPOLOG')]
        property Tipologia: string read FTipologia write SetTipologia;

        [TPersistable(fgPersistable, 'B1_FABRIC')]
        property Fabricante: string read FFabricante write SetFabricante;

        property EstoqueFiliais: TLista<TEstoque> read FEstoqueFiliais write SetEstoqueFiliais;

        property CodigoTabelaPreco: String read GetCodigoTabelaPreco;

        constructor Create; override;
        destructor destroy; override;
    end;

implementation

uses Vcl.Dialogs, Lib.Erro, Datasnap.DBClient;

{ TProduto }

function TProduto.Alterar: boolean;
begin

end;

procedure TProduto.AtualizarEstoqueCusto(Filial: string);
var
    list: TLista<TProduto>;
    Parametro: TParametro;
    query: string;
begin
    try
        list := nil;
        Parametro := nil;

        Parametro := TParametro.Create;
        Parametro.Add('', 'FILIAL', Filial);
        Parametro.Add('', 'CODIGO', Self.Codigo);
        query := 'SELECT (B2_QATU-B2_RESERVA) AS ESTOQUE, B2_CGER  FROM SB2010 WHERE B2_FILIAL = :FILIAL AND B2_COD = :CODIGO AND B2_LOCAL = ''01'' AND R_E_C_D_E_L_ = 0  AND D_E_L_E_T_ = '''' ';
        list := dao.Consultar(query, Parametro);
        PreencherProdutoEstoqueCusto(list[0]);
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);

        if list <> nil then
            FreeAndNil(list);
    end;

end;

 function TProduto.ChecarCodigoProduto(codigoIdentificacao: string): boolean;
 begin
 if (codigoIdentificacao = Self.Codigo) or (codigoIdentificacao = Self.CodigoBarra1) or (codigoIdentificacao = Self.CodigoBarra2) or
 (codigoIdentificacao = Self.CodigoBarra3) or (codigoIdentificacao = Self.CodigoBarraEmbalagem) or (codigoIdentificacao = Self.CodigoBarraTransp)
 then
 result := true
 else
 result := false;
 end;

function TProduto.Consultar(parametros: TParametro): TLista<TProduto>;
var
    query: string;
begin
    query := 'SELECT B1_QTMULTV, B1_CODBAR, B1_CODBARR, B1_CODBAR1, B1_UMTRANS, B1_QTTRANS, ' + //
      'B1_CBTRANS, B1_SEGUM, B1_ABASTEC, B1_TDLE, B1_PRODETD, B1_TDLIBPE, B1_TDLIN, B1_STATUS, ' + //
      'B1_CONV, B1_CBEMB, B1_COD, B1_DESC,  B1_PESO, B2_CGER, B1_IMPNCM, B1_QTMULTV, B1_ATVDA, ' + //
      'B1_TDHIDRO, B1_TDSELF1, B1_TDDL, B1_TDCOD, B1_TDTIPO, B0_DTAINIC, B0_DTAFIM, B0_PRV1, ' + //
      'B0_PRV2, (B2_QATU-B2_RESERVA) AS ESTOQUE, B2_CGER, B1_FAMIL, B1_GRPO, B1_SGRUPO, B1_TIPOLOG, B1_FABRIC ' + //
      'FROM SB1010 AS SB1 INNER ' + //
      'JOIN SB0010 AS SB0 ' + //
      'ON B1_FILIAL = '''' ' + //
      'AND B1_COD = B0_COD ' + //
      'AND SB1.R_E_C_N_O_ > 0 ' + //
      'AND SB1.D_E_L_E_T_ = '''' ' + //
      'INNER JOIN SB2010 AS SB2 ' + //
      'ON B2_FILIAL = B0_FILIAL ' + //
      'AND B2_LOCAL = ''01'' ' + //
      'AND B2_COD = B0_COD ' + //
      'AND SB2.R_E_C_D_E_L_ = 0 ';

    if (parametros.ObterValorParamentro('CODIGO') = 'NULL') and (parametros.ObterValorParamentro('DESC') = 'NULL') and
      (parametros.ObterValorParamentro('CODIGOALTERNATIVO') = 'NULL') then
    begin
        query := query + ' INNER JOIN SLK010 AS LK ON LK.LK_CODIGO = B1_COD AND LK.D_E_L_E_T_ = '''' ';
    end;

    query := query + ' WHERE B0_FILIAL = ''' + TUsuarioLogado.ObterInstancia.Filial.Filial +
      '''  AND SB1.B1_TIPO =''ME''  AND SB1.B1_ATVDA = ''S'' AND SB1.B1_GRUPO != ''9000'' ';

    if parametros.ObterValorParamentro('DESC') <> 'NULL' then
    begin
        query := query + ' AND B1_DESC LIKE :DESC +''%'' ';

        query := query + ' AND SB0.D_E_L_E_T_ = '''' ORDER BY B1_DESC ';
    end
    else
    begin
        if parametros.ObterValorParamentro('CODIGO') <> 'NULL' then
            query := query + 'AND (B1_COD = :CODIGO) '
        else if parametros.ObterValorParamentro('CODBAR') <> 'NULL' then
            query := query + 'AND LK.LK_FILIAL = '''' AND LK.LK_CODBAR = :CODBAR ';

        query := query + ' AND SB0.D_E_L_E_T_ = '''' ';
    end;

    result := dao.Consultar(query, parametros);

end;

procedure TProduto.CopiarPara(objeto: TObject);
begin
    inherited;
end;

constructor TProduto.Create;
begin
    inherited;
    FEstoqueFiliais := TLista<TEstoque>.Create;
end;

function TProduto.Excluir: boolean;
begin

end;

destructor TProduto.destroy;
begin
    if FEstoqueFiliais <> nil then
        FreeAndNil(FEstoqueFiliais);
    inherited;
end;

function TProduto.GetCodigoTabelaPreco: String;
begin
    if Self.ProdutoEmPromocao then
        result := '2'
    else
        result := '1';
end;

function TProduto.GetPodeEntregarDepositoLoja: boolean;
begin
    if PodeEntregarDepositoLoja_ = 'S' then
        result := true
    else
        result := false;
end;

function TProduto.GetPrecoAtualProduto: Double;
begin
    if (ProdutoEmPromocao) and (PrecoPromocao < PrecoTabelaProduto) then
        result := PrecoPromocao
    else
        result := PrecoTabelaProduto;
end;

function TProduto.GetProdutoAtivo: boolean;
begin
    if FProdutoAtivo_ <> 'N' then
        result := true
    else
        result := false;
end;

function TProduto.GetProdutoEcommerce: boolean;
begin
    if ProdutoEcommerce_ = 'S' then
        result := true
    else
        result := false;
end;

function TProduto.GetProdutoEmCampanha: boolean;
begin
    if ((Pos('P/', FProdutoEmCampanha_) > 0) and (TUsuarioLogado.ObterInstancia.Filial.Uf = 'MT')) or
      ((Pos('R/', FProdutoEmCampanha_) > 0) and (TUsuarioLogado.ObterInstancia.Filial.Uf = 'PR')) then
        result := true
    else
        result := false;
end;

function TProduto.GetProdutoEmPromocao: boolean;
begin
    if (DataFimPromocao >= Tlib.ObterDataAtual) and (DataInicioPromocao <= Tlib.ObterDataAtual) and (PrecoAtualProduto > PrecoPromocao) then
        result := true
    else
        result := false;

end;

function TProduto.GetProdutoForaLinha: boolean;
begin
    if ProdutoForaLinha_ = 'S' then
        result := true
    else
        result := false;
end;

function TProduto.GetProdutoHidrometro: boolean;
begin
    if TipoProduto = tpHidrometro then
        result := true
    else
        result := false;
end;

function TProduto.GetProdutoLiberadoConferenciaFiscal: boolean;
begin
    if ProdutoLiberadoConferenciaFiscal_ = 'S' then
        result := true
    else
        result := false;
end;

function TProduto.GetProdutoSelfColor: boolean;
begin
    if TipoProduto = tpSelfColor then
        result := true
    else
        result := false;
end;

function TProduto.GetProdutoSobEncomenda: boolean;
begin
    if ProdutoSobEncomenda_ = 'S' then
        result := true
    else
        result := false;
end;

function TProduto.GetTipoAbastecimento: TTipoAbastecimento;
begin
    result := TTipoAbastecimento(TipoAbastecimento_);
end;

function TProduto.GetTipoProduto: TTipoProduto;
begin
    result := TTipoProduto(FTipoProduto_)
end;

function TProduto.GetTotalProduto: Double;
begin
    FTotalProduto := Tlib.IfTernario(FQuantidadeVendida = 0, 1, FQuantidadeVendida) * PrecoAtualProduto;
end;

function TProduto.Inserir: integer;
begin

end;

function TProduto.Listar(tipoOperacao: TOparationTypes; multselect: boolean; descricaoProduto: string): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TProduto>;
    Parametro: TParametro;
begin
    inherited;
    try
        Parametro := nil;
        filtro := TFilter<TProduto>.Create;
        filtro.ScreenName := 'Filtro de Produtos';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'Descricao=DESC', 'Nome');
        filtro.AddIndex(2, 'Codigo=CODBAR', 'C�digo de Barra');
        filtro.AddIndex(3, 'Codigo=CODIGO', 'C�digo');
        filtro.Task := 'ConsultarProdutoVenda';

        // REIS VERIRICAR
        // if Self.FormularioCadastro <> nil then
        // filtro.InputForm := FormularioCadastro;

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Codigo';
        campoFiltro.Name := 'Codigo';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 55;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Descri��o';
        campoFiltro.Name := 'Descricao';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.FieldType := fdNormal;
        campoFiltro.GridSize := 340;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Pre�o';
        campoFiltro.Name := 'PrecoAtualProduto';
        campoFiltro.MaskTypes := mtDouble;
        campoFiltro.FieldType := fdNormal;
        campoFiltro.GridSize := 80;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Estoque';
        campoFiltro.Name := 'EstoqueProduto';
        campoFiltro.MaskTypes := mtDouble;
        campoFiltro.FieldType := fdNormal;
        campoFiltro.GridSize := 80;
        filtro.AddField(campoFiltro);

        if descricaoProduto <> EmptyStr then
        begin
            Parametro := TParametro.Create;
            // parametro.Add('','DESC',descricaoProduto);
            Parametro.Add('', 'Descricao', descricaoProduto);
            filtro.Parametro := Parametro;
            filtro.FilterType := ftAlredyFilteredWithParametersChangingValues;
        end;

        result := filtro.Execute;
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);
    end;
end;

procedure TProduto.MostrarEstoqueFiliais;
var
    Estoque: TEstoque;
    mensagem, valor: String;
begin
    if EstoqueFiliais.Count <= 0 then
        raise Erro.Create('N�o existe a lista de estoque');

    mensagem := '';
    for Estoque in EstoqueFiliais do
    begin
        valor := FormatCurr('###,###,##0.00', Estoque.Saldo);
        mensagem := mensagem + Estoque.Filial + ' - ' + valor + #13;
    end;

    if mensagem = '' then
        raise Erro.Create('Nenhuma filial encontrada!');

    Tlib.MensagemInformacao(mensagem, 'Estoque Filiais');
end;

function TProduto.Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter;
begin
    result := Listar(tipoOperacao, multselect, EmptyStr);
end;

function TProduto.Obter(ID: string): TProduto;
var
    list: TLista<TProduto>;
begin
    try
        list := Self.ObterLista(ID);
        if list.Count > 0 then
        begin
            PreencherObjeto(list[0]);
            result := Self;
        end
        else
            result := nil;
    finally
        if list <> nil then
            FreeAndNil(list);

    end;

end;

function TProduto.ObterAlternativos(tipoAlternativo: TTipoAlternativo; descricao: string): TLista<TProduto>;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TProduto>;
    Parametro: TParametro;
begin
    inherited;
    try
        Parametro := nil;
        filtro := TFilter<TProduto>.Create;
        filtro.ScreenName := descricao + ' - ' + Self.descricao;
        filtro.OperationType := otSelect;
        filtro.MultiSelect := Tlib.IfTernario(tipoAlternativo = CrossSelling, true, false);
        filtro.Task := 'ConsultarProdutoVenda';
        filtro.FilterType := ftAlredyFilteredWithParameters;

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Codigo';
        campoFiltro.Name := 'Codigo';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 55;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Descri��o';
        campoFiltro.Name := 'Descricao';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.FieldType := fdNormal;
        campoFiltro.GridSize := 340;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Pre�o';
        campoFiltro.Name := 'PrecoAtualProduto';
        campoFiltro.MaskTypes := mtDouble;
        campoFiltro.FieldType := fdNormal;
        campoFiltro.GridSize := 80;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Estoque';
        campoFiltro.Name := 'EstoqueProduto';
        campoFiltro.MaskTypes := mtDouble;
        campoFiltro.FieldType := fdNormal;
        campoFiltro.GridSize := 80;
        filtro.AddField(campoFiltro);

        Parametro := TParametro.Create;
        Parametro.Add('', 'CODIGOALTERNATIVO', Self.Codigo);
        Parametro.Add('', 'TIPOALTERNATIVO', InttoStr(integer(tipoAlternativo)));
        filtro.Parametro := Parametro;

        result := TLista<TProduto>(filtro.Execute.list);
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);
    end;
end;

function TProduto.ObterCrossSelling: TLista<TProduto>;
begin
    result := nil;

    if ObterQuantidadeCrossSelling > 0 then
        result := ObterAlternativos(CrossSelling, 'Filtro Cross Selling ');
end;

procedure TProduto.ObterEstoqueFiliais(tiposDeEntrega: TLista<TTipoEntrega>);
var
    Parametro: TParametro;
    filiais: String;
    entrega: TTipoEntrega;
    Estoque: TEstoque;
begin
    Try
        filiais := QuotedStr(TUsuarioLogado.ObterInstancia.Filial.Filial) + ',' + QuotedStr(TUsuarioLogado.ObterInstancia.Filial.CD);

        for entrega in tiposDeEntrega do
        begin
            if StrToIntDef(entrega.TipoEntrega, -1) > 0 then
                filiais := filiais + ',' + QuotedStr(entrega.TipoEntrega);
        end;

        Parametro := TParametro.Create;
        Parametro.Add('', 'B2_FILIAL', filiais);
        Parametro.Add('', 'B2_COD', Self.Codigo);

        Estoque := TEstoque.Create;
        EstoqueFiliais := Estoque.Consultar(Parametro);
    Finally
        FreeAndNil(Parametro);
    End;
end;

function TProduto.ObterLista(ID: string): TLista<TProduto>;
var
    Parametro: TParametro;
    Lista: TLista<TProduto>;
    ResultFilter: TResultFilter;
    prod: TProduto;
    i: integer;
begin
    try
        Parametro := nil;
        ResultFilter := nil;
        Lista := nil;
        prod := nil;

        if StrToInt64Def(ID, -1) <> -1 then
        begin
            Parametro := TParametro.Create;
            Parametro.Add('', 'DESC', 'NULL');
            Parametro.Add('', 'CODIGOALTERNATIVO', 'NULL');
            if Length(ID) = 6 then
                Parametro.Add('', 'CODIGO', ID)
            else
            begin
                Parametro.Add('', 'CODIGO', 'NULL');
                Parametro.Add('', 'CODBAR', ID);
            end;

            Lista := Self.Consultar(Parametro);

            if Lista.Count = 1 then
            begin
                result := Lista;
            end
            else
            begin
                Tlib.MensagemAdvertencia('Nenhum registro encontrado.', 'Aviso');
                result := nil;
                exit;
            end;

        end
        else
        begin
            if Length(trim(StringReplace(ID, '%', '', [rfReplaceAll]))) <= 3 then
                raise Exception.Create('Descri��o do produto precisa conter mais que 3 (tr�s) caracteres');

            ResultFilter := Self.Listar(otSelect, true, ID);

            if ResultFilter.list.Count > 0 then
            begin
                result := TLista<TProduto>.Create;

                for i := 0 to ResultFilter.list.Count - 1 do
                begin
                    prod := TProduto(ResultFilter.list[i]);
                    result.Add(prod);
                end;
            end
            else
            begin
                Tlib.MensagemAdvertencia('Nenhum registro encontrado.', 'Aviso');
                result := nil;
            end;
        end;
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);

        // if ResultFilter <> nil then
        // FreeAndNil(ResultFilter);

        // if prod <> nil then FreeAndNil(prod);

        // if list <> nil then
        // FreeAndNil(list);

    end;
end;

function TProduto.ObterQuantidadeAlternativo(tipoAlternativo: TTipoAlternativo): integer;
var
    Parametro: TParametro;
    teste: string;
    query: string;
    daoDataSet: TControleDados<TClientDataSet, TDataSetDAO>;
    ds: TClientDataSet;
begin
    try
        try
            daoDataSet := TControleDados<TClientDataSet, TDataSetDAO>.Create;
            Parametro := TParametro.Create;
            Parametro.Add('', 'TIPOALTERNATIVO', InttoStr(integer(tipoAlternativo)));
            Parametro.Add('', 'PRODUTOPAI', Self.Codigo);

            query := 'SELECT COUNT(*) COUNT FROM Z70010 WHERE Z70_COD = :PRODUTOPAI AND Z70_TIPO = :TIPOALTERNATIVO ' + ' AND D_E_L_E_T_ = '''' ';

            ds := daoDataSet.Consultar(query, Parametro);

            result := ds.FieldByName('COUNT').AsInteger;
        except
            on e: Exception do
            begin
                raise Erro.Create('Erro ao ObterQuantidadeAlternativo'#13 + e.Message);
            end;
        end;
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);

        if daoDataSet <> nil then
            FreeAndNil(daoDataSet);

        if ds <> nil then
            FreeAndNil(ds);

    end;
end;

function TProduto.ObterQuantidadeCrossSelling: integer;
begin
    result := ObterQuantidadeAlternativo(CrossSelling);
end;

function TProduto.ObterQuantidadeMultipla(codigoIdentificacao: string): Double;
begin
    // if (codigoIdentificacao = Self.Codigo) or (codigoIdentificacao = Self.CodigoBarra1) or (codigoIdentificacao = Self.CodigoBarra2) or (codigoIdentificacao = Self.CodigoBarra3) then
    result := Self.QtdMultiplaVenda;
    // else if codigoIdentificacao = CodigoBarraEmbalagem then
    // result := QtdPorEmbalagem
    // else if codigoIdentificacao = Self.CodigoBarraTransp then
    // result := QtdCaixaPorTransp * QtdPorEmbalagem
    // else
    // result := 0;
end;

function TProduto.ObterQuantidadeSimilar: integer;
begin
    result := ObterQuantidadeAlternativo(Similar);
end;

function TProduto.ObterQuantidadeUpSelling: integer;
begin
    result := ObterQuantidadeAlternativo(UpSelling);
end;

function TProduto.ObterSimilares: TLista<TProduto>;
begin
    result := nil;

    if ObterQuantidadeSimilar > 0 then
        result := ObterAlternativos(Similar, 'Filtro Similares');
end;

function TProduto.ObterUpSelling: TLista<TProduto>;
begin
    result := nil;

    if ObterQuantidadeUpSelling > 0 then
        result := ObterAlternativos(UpSelling, 'Filtro Up Selling');
end;

function TProduto.ValidarCaracteresInvalidosDescricao: boolean;
begin
    result := Tlib.ValidarCaracteresInvalidos(Self.descricao);
end;

function TProduto.ValidarQuantidadeMultipla(qtdDigitada: Double; mensagem: boolean): boolean;
var
    resto: string;
    quant: string;
    sugest1: string;
    sugest2: string;
begin
    result := true;
    resto := FormatFloat('########0.00', qtdDigitada / QtdMultiplaVenda);
    quant := Tlib.ObterPorParametro(resto, '1', ',');
    quant := FormatFloat('###,###,##0.00', (StrToFloat(Tlib.GravaNumeros(quant, ',')) * QtdMultiplaVenda));
    resto := FormatFloat('###,###,##0.00', qtdDigitada);
    sugest1 := quant;
    sugest2 := FormatFloat('###,###,##0.00', (StrToFloat(Tlib.GravaNumeros(quant, ',')) + QtdMultiplaVenda));
    if quant <> resto then
    begin
        if mensagem then
            Tlib.MensagemAdvertencia('A Quantidade do Produto..:  ' + Self.descricao + #13 +
              'Esta fora da Embalagem.... Altere a quantidade deste Produto.'#13 + 'Para:      ' + sugest1 + '     ou       ' + sugest2, 'Aviso');
        result := false;
    end;
end;

procedure TProduto.PreencherObjeto(Produto: TProduto);
begin
    Produto.CopiarPara(Self);
    FPreenchido := true;
end;

procedure TProduto.PreencherProdutoBasico(Produto: TProduto);
begin
    Self.Codigo := Produto.Codigo;
    Self.descricao := Produto.descricao;
    Self.QtdMultiplaVenda := Produto.QtdMultiplaVenda;
    // Self.CodigoBarra1 := Produto.CodigoBarra1;
    // Self.CodigoBarra2 := Produto.CodigoBarra2;
    // Self.CodigoBarra3 := Produto.CodigoBarra3;
    // Self.UnidadeMedidaTransp := Produto.UnidadeMedidaTransp;
    // Self.QtdCaixaPorTransp := Produto.QtdCaixaPorTransp;
    // Self.CodigoBarraTransp := Produto.CodigoBarraTransp;
    Self.UnidadeMedidaEmbalagem := Produto.UnidadeMedidaEmbalagem;
    Self.QtdPorEmbalagem := Produto.QtdPorEmbalagem;
    // Self.CodigoBarraEmbalagem := Produto.CodigoBarraEmbalagem;
    Self.ProdutoAtivo_ := Produto.ProdutoAtivo_;
    // Self.ProdutoHidrometro_ := Produto.ProdutoHidrometro_;
    // Self.ProdutoSelfColor_ := Produto.ProdutoSelfColor_;
    Self.Peso := Produto.Peso;
    // Self.PercentualImpostoDilma := Produto.PercentualImpostoDilma;
    Self.PodeEntregarDepositoLoja_ := Produto.PodeEntregarDepositoLoja_;
    Self.TipoProduto_ := Produto.TipoProduto_;
end;

procedure TProduto.PreencherProdutoEstoqueCusto(Produto: TProduto);
begin
    Self.EstoqueProduto := Produto.EstoqueProduto;
    // Self.CustoGerencial := Produto.CustoGerencial;
end;

procedure TProduto.PreencherProdutoPreco(Produto: TProduto);
begin
    Self.DataInicioPromocao := Produto.DataInicioPromocao;
    Self.DataFimPromocao := Produto.DataFimPromocao;
    Self.PrecoTabelaProduto := Produto.PrecoTabelaProduto;
    Self.PrecoPromocao := Produto.PrecoPromocao;
end;

procedure TProduto.SetCodigo(const Value: string);
begin
    FCodigo := Value;
end;

procedure TProduto.SetCodigoBarra1(const Value: string);
begin
    FCodigoBarra1 := Value;
end;

procedure TProduto.SetCodigoBarra2(const Value: string);
begin
    FCodigoBarra2 := Value;
end;

procedure TProduto.SetCodigoBarra3(const Value: string);
begin
    FCodigoBarra3 := Value;
end;

procedure TProduto.SetCodigoBarraEmbalagem(const Value: string);
begin
    FCodigoBarraEmbalagem := Value;
end;

procedure TProduto.SetCodigoBarraTransp(const Value: string);
begin
    FCodigoBarraTransp := Value;
end;

procedure TProduto.SetCodigoCursoSeguro(const Value: string);
begin
    FCodigoCursoSeguro := Value;
end;

procedure TProduto.SetCustoGerencial(const Value: Double);
begin
    FCustoGerencial := Value;
end;

procedure TProduto.SetDataFimPromocao(const Value: string);
begin
    FDataFimPromocao := Value;
end;

procedure TProduto.SetDataInicioPromocao(const Value: string);
begin
    FDataInicioPromocao := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
    FDescricao := Value;
end;

procedure TProduto.SetEstoqueFiliais(const Value: TLista<TEstoque>);
begin
    FEstoqueFiliais := Value;
end;

procedure TProduto.SetEstoqueProduto(const Value: Double);
begin
    FEstoqueProduto := Value;
end;

procedure TProduto.SetFabricante(const Value: string);
begin
    FFabricante := Value;
end;

procedure TProduto.SetFamilia(const Value: string);
begin
    FFamilia := Value;
end;

procedure TProduto.SetGrupo(const Value: string);
begin
    FGrupo := Value;
end;

procedure TProduto.SetPercentualImpostoDilma(const Value: Double);
begin
    FPercentualImpostoDilma := Value;
end;

procedure TProduto.SetPeso(const Value: Double);
begin
    FPeso := Value;
end;

procedure TProduto.SetPodeEntregarDepositoLoja_(const Value: string);
begin
    FPodeEntregarDepositoLoja_ := Value;
end;

procedure TProduto.SetPrecoPromocao(const Value: Double);
begin
    FPrecoPromocao := Value;
end;

procedure TProduto.SetPrecoTabelaProduto(const Value: Double);
begin
    FPrecoTabelaProduto := Value;
end;

procedure TProduto.SetProdutoAtivo_(const Value: string);
begin
    FProdutoAtivo_ := Value;
end;

procedure TProduto.SetProdutoEcommerce_(const Value: string);
begin
    FProdutoEcommerce_ := Value;
end;

procedure TProduto.SetProdutoEmCampanha_(const Value: string);
begin
    FProdutoEmCampanha_ := Value;
end;

procedure TProduto.SetProdutoForaLinha_(const Value: string);
begin
    FProdutoForaLinha_ := Value;
end;

procedure TProduto.SetProdutoHidrometro_(const Value: string);
begin
    FProdutoHidrometro_ := Value;
end;

procedure TProduto.SetProdutoLiberadoConferenciaFiscal_(const Value: string);
begin
    FProdutoLiberadoConferenciaFiscal_ := Value;
end;

procedure TProduto.SetProdutoSelfColor_(const Value: string);
begin
    FProdutoSelfColor_ := Value;
end;

procedure TProduto.SetProdutoSobEncomenda_(const Value: string);
begin
    FProdutoSobEncomenda_ := Value;
end;

procedure TProduto.SetQtdCaixaPorTransp(const Value: Double);
begin
    FQtdCaixaPorTransp := Value;
end;

procedure TProduto.SetQtdMultiplaVenda(const Value: Double);
begin
    FQtdMultiplaVenda := Value;
end;

procedure TProduto.SetQtdPorEmbalagem(const Value: Double);
begin
    FQtdPorEmbalagem := Value;
end;

procedure TProduto.SetQuantidadeVendida(const Value: Double);
begin
    FQuantidadeVendida := Value;
end;

procedure TProduto.SetSubGrupo(const Value: string);
begin
    FSubGrupo := Value;
end;

procedure TProduto.SetTipoAbastecimento_(const Value: integer);
begin
    FTipoAbastecimento_ := Value;
end;

procedure TProduto.SetTipologia(const Value: string);
begin
    FTipologia := Value;
end;

procedure TProduto.SetTipoProduto_(const Value: integer);
begin
    FTipoProduto_ := Value;
end;

procedure TProduto.SetTotalProduto(const Value: Double);
begin
    FTotalProduto := Value;
end;

procedure TProduto.SetUnidadeMedidaEmbalagem(const Value: string);
begin
    FUnidadeMedidaEmbalagem := Value;
end;

procedure TProduto.SetUnidadeMedidaTransp(const Value: string);
begin
    FUnidadeMedidaTransp := Value;
end;

end.
