{ *C{ *Created by @ReisCodeGenerator* }
unit Biz.Orcamento;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
    Framework.Interfaces.CRUD, Dal.FabricaSQL, Biz.Cliente, Biz.Vendedor,
    Biz.OrcamentoItem, Biz.Produto, Biz.TipoEntrega, Biz.Filial,
    Biz.TabelaComissao, Biz.CursoSeguro, Biz.Municipio, Biz.FormaPagamento;

type

    [TReferenceTable('SZ3010')]
    TOrcamento = class(TClasseBase, ICRUD<TOrcamento>)
    private
        FCodigoFilial: string;
        FNumeroOrcamento: string;
        FCodigoVendedor: string;
        FNomeVendedor: string;
        FCodigoCliente: string;
        FStatusOrcamento: string;
        FDataEmissao: string;
        FTipoCliente: string;
        FValorTotal: double;
        FValorDesconto: double;
        FValorLiquido: double;
        FDataValidade: string;
        FValorBruto: double;
        FValorMercadoria: double;
        FPercetualDesconto: double;
        FCodigoCondicaoPagamento: string;
        FLojaCliente: string;
        FHora: string;
        FObservacao1: string;
        FObservacao2: string;
        FDataCadastro: string;
        FCodigoTransportadora: string;
        FCodigoLojaTransportadora: string;
        FTipoDoFrete: string;
        FBairroEntrega: string;
        FCepEntrega: string;
        FMunicipioEntrega: string;
        FUFEntrega: string;
        FValorDespesa: double;
        FPesoLiquido: double;
        FPesoBruto: double;
        FVolume: double;
        FEspecie: string;
        FPlaca: string;
        FTipoVenda: string;
        FNumeroPedidoEcommerce: string;
        FNomeCliente: string;
        FDelete: string;
        FRecno: integer;
        FRecnoDel: integer;
        FVersaoSistema: string;
        FCodigoBairroTOTVS: string;
        FCliente: TCliente;
        FVendedor: TVendedor;
        FOrcamentoItens: TLista<TOrcamentoItem>;
        FTipoEntregaPadrao: TTipoEntrega;
        FFilial_: TFilial;
        FTabelaComissao_: TTabelaComissao;
        // FTabelaComissaoLista: TLista<TTabelaComissao>;
        FTabelaComissaoQuantidadeParcelas: integer;
        FValorEntrada: double;
        FOrcamentoPagamentoNegociacao: TLista<TFormaPagamento>;
        procedure SetCodigoFilial(const Value: string);
        procedure SetNumeroOrcamento(const Value: string);
        procedure SetCodigoVendedor(const Value: string);
        procedure SetNomeVendedor(const Value: string);
        procedure SetCodigoCliente(const Value: string);
        procedure SetStatusOrcamento(const Value: string);
        procedure SetDataEmissao(const Value: string);
        procedure SetTipoCliente(const Value: string);
        procedure SetValorTotal(const Value: double);
        procedure SetValorDesconto(const Value: double);
        procedure SetValorLiquido(const Value: double);
        procedure SetDataValidade(const Value: string);
        procedure SetValorBruto(const Value: double);
        procedure SetValorMercadoria(const Value: double);
        procedure SetPercetualDesconto(const Value: double);
        procedure SetCodigoCondicaoPagamento(const Value: string);
        procedure SetLojaCliente(const Value: string);
        procedure SetHora(const Value: string);
        procedure SetObservacao1(const Value: string);
        procedure SetObservacao2(const Value: string);
        procedure SetDataCadastro(const Value: string);
        procedure SetCodigoTransportadora(const Value: string);
        procedure SetCodigoLojaTransportadora(const Value: string);
        procedure SetTipoDoFrete(const Value: string);
        procedure SetBairroEntrega(const Value: string);
        procedure SetCepEntrega(const Value: string);
        procedure SetMunicipioEntrega(const Value: string);
        procedure SetUFEntrega(const Value: string);
        procedure SetValorDespesa(const Value: double);
        procedure SetPesoLiquido(const Value: double);
        procedure SetPesoBruto(const Value: double);
        procedure SetVolume(const Value: double);
        procedure SetEspecie(const Value: string);
        procedure SetPlaca(const Value: string);
        procedure SetTipoVenda(const Value: string);
        procedure SetNumeroPedidoEcommerce(const Value: string);
        procedure SetNomeCliente(const Value: string);
        procedure SetDelete(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetRecnoDel(const Value: integer);
        procedure SetVersaoSistema(const Value: string);
        procedure SetCodigoBairroTOTVS(const Value: string);
        procedure SetCliente(const Value: TCliente);
        procedure SetVendedor(const Value: TVendedor);
        procedure SetOrcamentoItens(const Value: TLista<TOrcamentoItem>);
        function GetTipoEntregaPadrao: TTipoEntrega;
        procedure SetFilial_(const Value: TFilial);
        procedure SetFilial(const Value: TFilial);
        procedure SetTabelaComissao_(const Value: TTabelaComissao);
        // procedure SetTabelaComissaoLista(const Value: TLista<TTabelaComissao>);
        procedure SetTabelaComissaoQuantidadeParcelas(const Value: integer);
        procedure SetValorEntrada(const Value: double);
        procedure SetOrcamentoPagamentoNegociacao(const Value: TLista<TFormaPagamento>);

    public
        class var dao: TControleDados<TLista<TOrcamento>, TListaDAO<TOrcamento>>;

        /// <summary>
        /// Metodo que faz a inserção da Orcamento
        /// </summary>
        function Inserir: integer;
        /// <summary>
        /// Metodo que faz a alteração da Orcamento
        /// </summary>
        function Alterar: boolean;

        /// <summary>
        /// Métido que faz a Deleção da Orcamento
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
        function Obter(ID: string): TOrcamento; overload;
        function Obter(parametros: TParametro): TOrcamento; overload;

        /// <summary>
        /// Método que retonar uma lista com varios objetos de acordo com parametro passado
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Consultar(parametros: TParametro): TLista<TOrcamento>;

        /// <summary>
        /// Método que preenche a instância do Objeto
        /// </summary>
        /// <param name="Orcamento">
        /// objeto de parametro para preenchimento da instância
        /// </param>
        procedure PreencherObjeto(Orcamento: TOrcamento);

{$REGION 'Orcamento'}
        [TPersistable(fgPersistable, 'Z3_FILIAL')]
        [TMaxLenght(2)]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgPersistable, 'Z3_NUM')]
        [TMaxLenght(6)]
        property NumeroOrcamento: string read FNumeroOrcamento write SetNumeroOrcamento;

        [TPersistable(fgPersistable, 'Z3_VEND')]
        [TMaxLenght(6)]
        property CodigoVendedor: string read FCodigoVendedor write SetCodigoVendedor;

        [TPersistable(fgPersistable, 'Z3_NOMVDO')]
        [TMaxLenght(15)]
        property NomeVendedor: string read FNomeVendedor write SetNomeVendedor;

        [TPersistable(fgPersistable, 'Z3_CLIENTE')]
        [TMaxLenght(6)]
        property CodigoCliente: string read FCodigoCliente write SetCodigoCliente;

        [TPersistable(fgPersistable, 'Z3_LOJA')]
        [TMaxLenght(2)]
        property LojaCliente: string read FLojaCliente write SetLojaCliente;

        [TPersistable(fgPersistable, 'Z3_ORCLIB')]
        [TMaxLenght(5)]
        property StatusOrcamento: string read FStatusOrcamento write SetStatusOrcamento;

        [TPersistable(fgPersistable, 'Z3_EMISSAO')]
        [TMaxLenght(8)]
        property DataEmissao: string read FDataEmissao write SetDataEmissao;

        [TPersistable(fgPersistable, 'Z3_TIPOCLI')]
        [TMaxLenght(1)]
        property TipoCliente: string read FTipoCliente write SetTipoCliente;

        [TPersistable(fgPersistable, 'Z3_VLRTOT')]
        property ValorTotal: double read FValorTotal write SetValorTotal;

        [TPersistable(fgPersistable, 'Z3_DESCONT')]
        property ValorDesconto: double read FValorDesconto write SetValorDesconto;

        [TPersistable(fgPersistable, 'Z3_VLRLIQ')]
        property ValorLiquido: double read FValorLiquido write SetValorLiquido;

        [TPersistable(fgPersistable, 'Z3_DTLIM')]
        [TMaxLenght(8)]
        property DataValidade: string read FDataValidade write SetDataValidade;

        [TPersistable(fgPersistable, 'Z3_VALBRUT')]
        property ValorBruto: double read FValorBruto write SetValorBruto;

        [TPersistable(fgPersistable, 'Z3_VALMERC')]
        property ValorMercadoria: double read FValorMercadoria write SetValorMercadoria;

        [TPersistable(fgPersistable, 'Z3_DESCNF')]
        property PercetualDesconto: double read FPercetualDesconto write SetPercetualDesconto;

        [TPersistable(fgPersistable, 'Z3_CONDPG')]
        [TMaxLenght(3)]
        property CodigoCondicaoPagamento: string read FCodigoCondicaoPagamento write SetCodigoCondicaoPagamento;

        [TPersistable(fgPersistable, 'Z3_HORA')]
        [TMaxLenght(8)]
        property Hora: string read FHora write SetHora;

        [TPersistable(fgPersistable, 'Z3_OBS1')]
        [TMaxLenght(74)]
        property Observacao1: string read FObservacao1 write SetObservacao1;

        [TPersistable(fgPersistable, 'Z3_OBS2')]
        [TMaxLenght(74)]
        property Observacao2: string read FObservacao2 write SetObservacao2;

        [TPersistable(fgPersistable, 'Z3_DTCAD')]
        [TMaxLenght(8)]
        property DataCadastro: string read FDataCadastro write SetDataCadastro;

        [TPersistable(fgPersistable, 'Z3_CODTRAN')]
        [TMaxLenght(6)]
        property CodigoTransportadora: string read FCodigoTransportadora write SetCodigoTransportadora;

        [TPersistable(fgPersistable, 'Z3_LOJTRAN')]
        [TMaxLenght(2)]
        property CodigoLojaTransportadora: string read FCodigoLojaTransportadora write SetCodigoLojaTransportadora;

        [TPersistable(fgPersistable, 'Z3_TIPFRET')]
        [TMaxLenght(1)]
        property TipoDoFrete: string read FTipoDoFrete write SetTipoDoFrete;

        [TPersistable(fgPersistable, 'Z3_BAIRROE')]
        [TMaxLenght(40)]
        property BairroEntrega: string read FBairroEntrega write SetBairroEntrega;

        [TPersistable(fgPersistable, 'Z3_CEPE')]
        [TMaxLenght(8)]
        property CepEntrega: string read FCepEntrega write SetCepEntrega;

        [TPersistable(fgPersistable, 'Z3_MUNE')]
        [TMaxLenght(60)]
        property MunicipioEntrega: string read FMunicipioEntrega write SetMunicipioEntrega;

        [TPersistable(fgPersistable, 'Z3_ESTE')]
        [TMaxLenght(2)]
        property UFEntrega: string read FUFEntrega write SetUFEntrega;

        [TPersistable(fgPersistable, 'Z3_DESPESA')]
        property ValorDespesa: double read FValorDespesa write SetValorDespesa;

        [TPersistable(fgPersistable, 'Z3_ENTRADA')]
        property ValorEntrada: double read FValorEntrada write SetValorEntrada;

        [TPersistable(fgPersistable, 'Z3_PLIQUI')]
        property PesoLiquido: double read FPesoLiquido write SetPesoLiquido;

        [TPersistable(fgPersistable, 'Z3_PBRUTO')]
        property PesoBruto: double read FPesoBruto write SetPesoBruto;

        [TPersistable(fgPersistable, 'Z3_VOLUME')]
        property Volume: double read FVolume write SetVolume;

        [TPersistable(fgPersistable, 'Z3_ESPECIE')]
        [TMaxLenght(15)]
        property Especie: string read FEspecie write SetEspecie;

        [TPersistable(fgPersistable, 'Z3_PLACA')]
        [TMaxLenght(10)]
        property Placa: string read FPlaca write SetPlaca;

        [TPersistable(fgPersistable, 'Z3_TIPOVEN')]
        [TMaxLenght(2)]
        property TipoVenda: string read FTipoVenda write SetTipoVenda;

        [TPersistable(fgPersistable, 'Z3_TDNUME')]
        [TMaxLenght(24)]
        property NumeroPedidoEcommerce: string read FNumeroPedidoEcommerce write SetNumeroPedidoEcommerce;

        [TPersistable(fgPersistable, 'Z3_TDNOMCL')]
        [TMaxLenght(30)]
        property NomeCliente: string read FNomeCliente write SetNomeCliente;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgPersistable, 'R_E_C_D_E_L_')]
        property RecnoDel: integer read FRecnoDel write SetRecnoDel;

        [TPersistable(fgPersistable, 'Z3_VERSAO')]
        [TMaxLenght(20)]
        property VersaoSistema: string read FVersaoSistema write SetVersaoSistema;

        [TPersistable(fgPersistable, 'Z3_XCODBAI')]
        [TMaxLenght(8)]
        property CodigoBairroTOTVS: string read FCodigoBairroTOTVS write SetCodigoBairroTOTVS;
{$ENDREGION}
        /// <summary>
        /// Popular informações do cliente necessárias no orcamento
        /// </summary>
        procedure PopularClienteAoOrcamento;
        property Cliente: TCliente read FCliente write SetCliente;

        /// <summary>
        /// Popula algumas informações do vendedor necessárias no orcamento
        /// </summary>
        property Vendedor: TVendedor read FVendedor write SetVendedor;
        procedure PopularVendedorAoOrcamento;

        /// <summary>
        /// Informações da filial necessárias no orcamento
        /// </summary>
        property Filial_: TFilial read FFilial_ write SetFilial_;

{$REGION 'OrcamentoItem'}
        property OrcamentoItens: TLista<TOrcamentoItem> read FOrcamentoItens write SetOrcamentoItens;
        /// <summary>
        /// Método que retorna um objeto preenchido
        /// </summary>
        function ObterItem(codigoProduto, TipoEntrega: String): TOrcamentoItem;

        /// <summary>
        /// Adiciona item na lista de itens
        /// </summary>
        procedure AddOrcamentoItem(OrcamentoItens: TOrcamentoItem); overload;

        /// <summary>
        /// Adiciona Item na lista de Itens através de um produto
        /// </summary>
        procedure AddOrcamentoItem(Produto: TProduto; quantidade: double = 0); overload;
{$ENDREGION}
        property TipoEntregaPadrao: TTipoEntrega read GetTipoEntregaPadrao;
        function SelecionarTipoEntrega(item: TOrcamentoItem): TTipoEntrega;

        property TabelaComissao_: TTabelaComissao read FTabelaComissao_ write SetTabelaComissao_;
        property TabelaComissaoQuantidadeParcelas: integer read FTabelaComissaoQuantidadeParcelas write SetTabelaComissaoQuantidadeParcelas;
        procedure TabelaComissaoRecalcular;
        procedure TabelaComissaoZerar;
        procedure TabelaComissaoAjustar;
        function ObterValorTotalEmPrecoDeTabela: double;

        property OrcamentoPagamentoNegociacao: TLista<TFormaPagamento> read FOrcamentoPagamentoNegociacao write SetOrcamentoPagamentoNegociacao;
        procedure LimparCondicaoDePagamento;

        constructor Create; override;
        destructor Destroy; override;

    end;

implementation

{ TOrcamento }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado, Lib.Erro, UI.SelecionaTipoEntrega,
    Vcl.Forms;

{$REGION 'Métodos CRUD'}

function TOrcamento.Inserir: integer;
begin
    try
        try
            TabelaComissaoAjustar;
            dao.IniciarTransacao;
            result := dao.Inserir(Self);
            TOrcamentoItem.dao.SalvarMudancas(Self.OrcamentoItens);
            dao.ConfirmarTransacao;
        except
            on e: exception do
            begin
                dao.ReverterTransacao;
                raise exception.Create('Erro ao inserir Orcamento' + #13 + e.Message);
            end;
        end;
    finally
    end;
end;

procedure TOrcamento.AddOrcamentoItem(OrcamentoItens: TOrcamentoItem);
begin
    FOrcamentoItens.add(OrcamentoItens);
end;

procedure TOrcamento.AddOrcamentoItem(Produto: TProduto; quantidade: double);
var
    item: TOrcamentoItem;
    idade, numeroTentativas: integer;
    tipoSeguro: string;
    numeroDeSerieHidrometro: string;
    tipoDeEntrega: TTipoEntrega;
begin
    try
        if TipoEntregaPadrao = nil then
            raise exception.Create('Tipo de entrega padão não preenchido.');

        tipoDeEntrega := TTipoEntrega.Create;

        if not Produto.ProdutoAtivo then
            raise exception.Create('Produto não esta ativo.');

        if Produto.PrecoAtualProduto = 0 then
            raise exception.Create('Produto está sem preço cadastrado.');

        if Produto.TipoProduto = tpCurso then
            raise exception.Create('Produto do tipo Curso não validado.');

        if TipoEntregaPadrao = nil then
            raise exception.Create('Erro ao pegar Local de entrega.');

        TipoEntregaPadrao.CopiarPara(tipoDeEntrega);

        if Produto.ProdutoEmPromocao then
            Tlib.MensagemInformacao('O Produto..:' + Produto.Descricao + ' esta em Promoção '#13 + #13 + 'Promoção Válida para o dia: ' + Produto.DataInicioPromocao + '   Até   ' + Produto.DataFimPromocao + #13 + #13 + 'De  R$: ' + FormatFloat('###,###,##0.00', Produto.PrecoTabelaProduto) +
                '   Por   R$:' + FormatFloat('###,###,##0.00', Produto.PrecoPromocao));

        if (Produto.TipoProduto <> tpNormal) and (Produto.ProdutoSobEncomenda) then
            raise Erro.Create('Tipo do produto ' + TConverteEnum<TTipoProduto>.ToString(Produto.TipoProduto) + ', não pode ser sob encomenda.', MSGInformacao);

        if (Produto.ProdutoLiberadoConferenciaFiscal = false) and (Produto.ProdutoSobEncomenda = false) then
            raise exception.Create('Produto não conferido dados fiscais, contate o departamento de compras.');

        if (Produto.ProdutoLiberadoConferenciaFiscal = false) then
        begin
            Tlib.MensagemInformacao('Este produto só é permitido venda sobre encomenda.');
            tipoDeEntrega.Obter(CodigoFilial, 'PE');

            item := Self.ObterItem(Produto.Codigo, tipoDeEntrega.TipoEntrega);
            if item <> nil then
                raise exception.Create('Produto já selecionado.');
        end;

        // validar futuramento pelo Tipo de Produto;
        if Produto.TipoProduto = tpHidrometro then
        begin
            numeroTentativas := 0;
            while (numeroTentativas <= 3) and (numeroDeSerieHidrometro = '') do
            begin
                Inc(numeroTentativas);
                numeroDeSerieHidrometro := Tlib.MensagemCaixaEntrada<string>('Este Produto tem Numero de Séríe' + #13 + 'utilizado pela Companhia de Abastecimento,'#13 + 'e deve constar na Nota Fiscal...'#13 + 'A série é formada por letras e números'#13 +
                    'totalizando 10 caracteres. Exemplo.: A04F019082', 'Hidrômetro', mtString);

                if Length(numeroDeSerieHidrometro) = 10 then
                begin
                    numeroDeSerieHidrometro := '[N.S: ' + numeroDeSerieHidrometro + ']';
                    numeroTentativas := 3
                end
                else
                begin
                    numeroDeSerieHidrometro := '';
                end;
            end;

            if numeroDeSerieHidrometro = EmptyStr then
            begin
                raise exception.Create('Não é possivel inserir produto do tipo Hidrômetro sem número de série!');
            end;

        end;

        if not Produto.ValidarCaracteresInvalidosDescricao then
            raise exception.Create('Caracteres inválidos.');

        if quantidade = 0 then
            quantidade := Produto.QtdMultiplaVenda;

        // verifica se o item já foi adicionado somente para venda rápida (Caixa).
        item := Self.ObterItem(Produto.Codigo, tipoDeEntrega.TipoEntrega);
        if (item <> nil) then
        begin
            if (Produto.ProdutoHidrometro = false) and (Produto.ProdutoSelfColor = false) then
            begin
                tipoDeEntrega := SelecionarTipoEntrega(item);

                if not tipoDeEntrega.Preenchido then
                    raise exception.Create('Nenhum tipo de entrega selecionado');
            end;
        end;

        item := TOrcamentoItem.Create;
        // Obtem a filial
        Self.Filial_.CopiarPara(item.Filial_);
        Produto.CopiarPara(item.Produto);

        item.TipoEntrega := tipoDeEntrega.TipoEntrega;
        item.FilialReserva := tipoDeEntrega.CodigoFilialReserva;
        // Obtem o numero do item do orcamento
        item.item := Tlib.ColocarZeroEsquerda(2, inttostr(FOrcamentoItens.Count + 1));

        item.codigoProduto := Produto.Codigo;
        item.DescricaoProduto := Produto.Descricao;
        item.UnidadeMedida := Produto.UnidadeMedidaEmbalagem;
        item.quantidade := quantidade;
        item.ValorPrecoTabela := Produto.PrecoAtualProduto;
        item.ValorUnitarioNegociado := Produto.PrecoAtualProduto;
        item.PercentualComissao := 0; // Falta preencher
        item.TabelaComissaoCodigo := TabelaComissao_.CodigoTabela;
        item.Armazem := '01';
        item.PercentualDesconto := 0;
        item.ValorDesconto := 0;
        item.ValorDespesa := 0;
        item.CodigoTes := ''; // verificar se ainda é necessario gravar.
        item.Cfop := ''; // verificar se ainda é necessario gravar.
        item.CodigoTabelaPreco := Produto.CodigoTabelaPreco;
        item.CodigoFilial := Self.Filial_.Filial;
        item.NumeroOrcamento := Self.NumeroOrcamento;
        item.DataEmissao := Tlib.ObterDataAtual;
        item.CodigoVendedor := Self.CodigoVendedor;
        item.Usuario := TUsuarioLogado.ObterInstancia.Login;
        item.CodigoRegraComissaoAplicada := ''; // falta preencher
        item.CodigoItemComissaoAplicada := ''; // falta preencher
        item.ValorIcmsGerencial := 0; // falta preencher

        if Produto.ProdutoHidrometro then
            item.FormulaSelfColor := numeroDeSerieHidrometro
        else
            item.FormulaSelfColor := '';
        { Preenche Campanha e/ou status produto }
        item.Campanha := '';
        item.Campanha := item.Produto.ProdutoEmCampanha_;
        if Produto.ProdutoEmPromocao then
            item.Campanha := item.Campanha + 'X/';
        if Produto.ProdutoForaLinha then
            item.Campanha := item.Campanha + 'F/';
        if Produto.ProdutoSobEncomenda then
            item.Campanha := item.Campanha + 'E/';

        item.ItemPai := '';
        item.CodigoGrupoSelfColor := 0;
        item.CodigoProdutoSelfColor := 0;
        item.CodigoBaseSelfColor := 0;
        item.CodigoEmbalagemSelfColor := 0;
        item.CodigoCorSelfColor := 0;
        item.CodigoColoranteSelfColor := 0;

        if Produto.ProdutoSelfColor then
        begin
            // if Tlib.AbrirFormulario(TfrmCadSelfColor, acAlteracao, item) <> rfOK then
            // exit;

            item.ValorPrecoTabela := item.ValorUnitarioNegociado;
        end;

        if not Self.Cliente.Preenchido then
            Self.Cliente.Obter(Self.LojaCliente, Self.CodigoCliente);

        // item.CustoGerencial := Produto.CustoGerencial;
        // item.Vendido := '';
        // item.TipoVenda := Self.TipoDaVenda;
        // UltimoItemAlterado := item;





        // if Produto.ProdutoEmPromocao = false then
        // begin
        // {Calcula preço em combo}
        // end;



        //
        // item.PaiAlternativo := false;

        item.TabelaComissaoCodigoCalcularPreco(TabelaComissao_, TabelaComissaoQuantidadeParcelas, item.ValorPrecoTabela, 0);

        FOrcamentoItens.add(item);
        // RatearValoresNosItens;

        { Limpar Condições de pagamento }
        { Somar Totais do Orçamento }
    finally
        if tipoDeEntrega <> nil then
            FreeAndNil(tipoDeEntrega);
    end;
end;

function TOrcamento.Alterar: boolean;
begin
    try
        try
            TabelaComissaoAjustar;
            result := dao.Alterar(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao alterar Orcamento' + #13 + e.Message);
        end;
    finally
    end;
end;

function TOrcamento.Excluir: boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao excluir Orcamento' + #13 + e.Message);
        end;
    finally
    end;

end;

function TOrcamento.GetTipoEntregaPadrao: TTipoEntrega;
var
    TipoEntrega: TTipoEntrega;
begin
    try
        TipoEntrega := TTipoEntrega.Create;

        if FTipoEntregaPadrao = nil then
            FTipoEntregaPadrao := TipoEntrega.ObterTipoEntregaPadrao(CodigoFilial);

        result := FTipoEntregaPadrao;
    finally
        if TipoEntrega <> nil then
            FreeAndNil(TipoEntrega);
    end;
end;

function TOrcamento.Consultar(parametros: TParametro): TLista<TOrcamento>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('Z3_FILIAL', ccIgual, lgAnd);
        condicao.Adiciona('Z3_NUM', ccIgual, lgAnd);
        condicao.Adiciona('Z3_VEND', ccIgual, lgAnd);
        condicao.Adiciona('Z3_NOMVDO', ccIgual, lgAnd);
        condicao.Adiciona('Z3_CLIENTE', ccIgual, lgAnd);
        condicao.Adiciona('Z3_ORCLIB', ccIgual, lgAnd);
        condicao.Adiciona('Z3_EMISSAO', ccIgual, lgAnd);
        condicao.Adiciona('Z3_TIPOCLI', ccIgual, lgAnd);
        condicao.Adiciona('Z3_VLRTOT', ccIgual, lgAnd);
        condicao.Adiciona('Z3_DESCONT', ccIgual, lgAnd);
        condicao.Adiciona('Z3_VLRLIQ', ccIgual, lgAnd);
        condicao.Adiciona('Z3_DTLIM', ccIgual, lgAnd);
        condicao.Adiciona('Z3_VALBRUT', ccIgual, lgAnd);
        condicao.Adiciona('Z3_VALMERC', ccIgual, lgAnd);
        condicao.Adiciona('Z3_DESCNF', ccIgual, lgAnd);
        condicao.Adiciona('Z3_CONDPG', ccIgual, lgAnd);
        condicao.Adiciona('Z3_LOJA', ccIgual, lgAnd);
        condicao.Adiciona('Z3_HORA', ccIgual, lgAnd);
        condicao.Adiciona('Z3_OBS1', ccIgual, lgAnd);
        condicao.Adiciona('Z3_OBS2', ccIgual, lgAnd);
        condicao.Adiciona('Z3_DTCAD', ccIgual, lgAnd);
        condicao.Adiciona('Z3_CODTRAN', ccIgual, lgAnd);
        condicao.Adiciona('Z3_LOJTRAN', ccIgual, lgAnd);
        condicao.Adiciona('Z3_TIPFRET', ccIgual, lgAnd);
        condicao.Adiciona('Z3_BAIRROE', ccIgual, lgAnd);
        condicao.Adiciona('Z3_CEPE', ccIgual, lgAnd);
        condicao.Adiciona('Z3_MUNE', ccIgual, lgAnd);
        condicao.Adiciona('Z3_ESTE', ccIgual, lgAnd);
        condicao.Adiciona('Z3_DESPESA', ccIgual, lgAnd);
        condicao.Adiciona('Z3_PLIQUI', ccIgual, lgAnd);
        condicao.Adiciona('Z3_PBRUTO', ccIgual, lgAnd);
        condicao.Adiciona('Z3_VOLUME', ccIgual, lgAnd);
        condicao.Adiciona('Z3_ESPECIE', ccIgual, lgAnd);
        condicao.Adiciona('Z3_PLACA', ccIgual, lgAnd);
        condicao.Adiciona('Z3_TIPOVEN', ccIgual, lgAnd);
        condicao.Adiciona('Z3_TDNUME', ccIgual, lgAnd);
        condicao.Adiciona('Z3_TDNOMCL', ccLikeInicio, lgAnd);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_D_E_L_', ccIgual, lgAnd);
        condicao.Adiciona('Z3_VERSAO', ccIgual, lgAnd);
        condicao.Adiciona('Z3_XCODBAI', ccIgual, lgAnd);

        query := 'SELECT ' + Self.ObterCamposSeparadosPorVirgula(Consulta, []) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        result := dao.Consultar(query, parametros);
    finally
        condicao.Free;
    end;
end;

constructor TOrcamento.Create;
begin
    inherited;
    FFilial_ := TFilial.Create;
    FFilial_.Obter(TUsuarioLogado.ObterInstancia.Filial.Filial);
    FCodigoFilial := FFilial_.Filial;

    FOrcamentoItens := TLista<TOrcamentoItem>.Create;

    FCliente := TCliente.Create;

    FVendedor := TVendedor.Create;

    FTipoEntregaPadrao := TTipoEntrega.Create;
    FTipoEntregaPadrao := FTipoEntregaPadrao.ObterTipoEntregaPadrao(CodigoFilial);

    FTabelaComissao_ := TTabelaComissao.Create;
end;

destructor TOrcamento.Destroy;
begin
    if FCliente <> nil then
        FreeAndNil(FCliente);
    if FVendedor <> nil then
        FreeAndNil(FVendedor);
    if FTipoEntregaPadrao <> nil then
        FreeAndNil(FTipoEntregaPadrao);
    if FOrcamentoItens <> nil then
        FreeAndNil(FOrcamentoItens);
    if FFilial_ <> nil then
        FreeAndNil(FFilial_);
    if FTabelaComissao_ <> nil then
        FreeAndNil(FTabelaComissao_);
    inherited;
end;

procedure TOrcamento.LimparCondicaoDePagamento;
begin
    //
end;

function TOrcamento.Listar(tipoOperacao: TOparationTypes; multselect: boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TOrcamento>;
    Parametro: TParametro;
    // lista:TLista<TOrcamento>
begin
    try
        filtro := TFilter<TOrcamento>.Create;
        filtro.ScreenName := 'Filtro de Orcamento';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'NumeroOrcamento=Z3_NUM', 'NumeroOrcamento');
        filtro.AddIndex(2, 'CodigoVendedor=Z3_VEND', 'CodigoVendedor');
        filtro.AddIndex(3, 'LojaCliente=Z3_LOJA', 'LojaCliente');
        filtro.AddIndex(4, 'CodigoCliente=Z3_CLIENTE', 'CodigoCliente');
        filtro.AddIndex(5, 'NomeCliente=Z3_TDNOMCL', 'NomeCliente');
        filtro.AddIndex(6, 'DataEmissao=Z3_EMISSAO', 'DataEmissao');
        filtro.AddIndex(7, 'NumeroPedidoEcommerce=Z3_TDNUME', 'NumeroPedidoEcommerce');
        // ###Criar os Índices do filtro
        // filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descrição');

{$REGION 'Campo Filtro'}
        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'NumeroOrcamento';
        campoFiltro.Name := 'NumeroOrcamento';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoVendedor';
        campoFiltro.Name := 'CodigoVendedor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'NomeVendedor';
        campoFiltro.Name := 'NomeVendedor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'LojaCliente';
        campoFiltro.Name := 'LojaCliente';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoCliente';
        campoFiltro.Name := 'CodigoCliente';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'NomeCliente';
        campoFiltro.Name := 'NomeCliente';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'StatusOrcamento';
        campoFiltro.Name := 'StatusOrcamento';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'DataEmissao';
        campoFiltro.Name := 'DataEmissao';
        campoFiltro.MaskTypes := mtDate;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'ValorLiquido';
        campoFiltro.Name := 'ValorLiquido';
        campoFiltro.MaskTypes := mtCurrency;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'DataValidade';
        campoFiltro.Name := 'DataValidade';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'NumeroPedidoEcommerce';
        campoFiltro.Name := 'NumeroPedidoEcommerce';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

{$ENDREGION}
        Parametro := TParametro.Create;
        Parametro.add('', 'Z3_FILIAL', CodigoFilial);

        filtro.Parametro := Parametro;
        result := filtro.Execute;
    finally
        FreeAndNil(Parametro);
        // FreeAndNil(lista);
    end;
end;

function TOrcamento.Obter(parametros: TParametro): TOrcamento;
var
    Lista: TLista<TOrcamento>;
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
            Tlib.MensagemAdvertencia('Nenhum registro encontrado.', 'Aviso');
            result := nil;
        end;
    finally
        Lista.Destroy;
    end;
end;

function TOrcamento.ObterItem(codigoProduto, TipoEntrega: String): TOrcamentoItem;
var
    item: TOrcamentoItem;
begin
    result := nil;

    if Self.OrcamentoItens.Count > 0 then
    begin
        for item in Self.OrcamentoItens do
        begin
            if (item.codigoProduto = codigoProduto) and (item.TipoEntrega = TipoEntrega) then
            begin
                result := item;
                Break;
            end;
        end;
    end;
end;

function TOrcamento.ObterValorTotalEmPrecoDeTabela: double;
var
    item: TOrcamentoItem;
begin
    result := 0;
    for item in OrcamentoItens do
    begin
        result := result + (item.quantidade * item.ValorPrecoTabela);
    end;
end;

function TOrcamento.Obter(ID: string): TOrcamento;
var
    parametros: TParametro;

begin
    try
        parametros := TParametro.Create;
        parametros.add('', 'R_E_C_N_O_', ID);
        result := Obter(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

{$ENDREGION}
{$REGION 'Regras de Negócio'}

procedure TOrcamento.PopularClienteAoOrcamento;
var
    mun: TMunicipio;
begin
    try
        mun := nil;
        if not Self.Cliente.Preenchido then
            raise exception.Create('O cliente não está preenchido.');

        if Self.Cliente.CodigoBairroTOTVS = EmptyStr then
            raise exception.Create('Código do bairro TOTVS não esta preenchido.');

        if Self.Cliente.CodigoMunicipio = EmptyStr then
            Tlib.MensagemAdvertencia('Cóigo do município não esta preenchido'#13 + #13 + 'Atualize o cadastro do cliente.');

        if Self.Cliente.VerificarClientePadrao(Self.CodigoFilial) = false then
        begin
            if (Self.Cliente.Email = EmptyStr) or (Self.Cliente.EmailNfe = EmptyStr) then
                raise exception.Create('E-mail do cliente ou NFE não esta preenchido.');

            mun := TMunicipio.Create;
            if not mun.ValidaMunicipio(Self.Cliente.Estado, Self.Cliente.Municipio) then
            begin
                Self.Cliente.ObterClientePadrao(Self.CodigoFilial);
                Tlib.MensagemAdvertencia('Município inválido, atualize o cadastro do cliente.');
            end;

            if (Self.Cliente.Nome = EmptyStr) or (Self.Cliente.Estado = EmptyStr) or //
                (Self.Cliente.Tipo = EmptyStr) or (Self.Cliente.Cep = EmptyStr) or //
                (Self.Cliente.Municipio = EmptyStr) or (Self.Cliente.Bairro = EmptyStr) or //
                (Self.Cliente.Endereco = EmptyStr) or (Self.Cliente.Cgc = EmptyStr) or //
                (Self.Cliente.Inscricao = EmptyStr) or (Self.Cliente.Telefone = EmptyStr) or //
                (Self.Cliente.TipoPessoa = EmptyStr) or (Self.Cliente.CodigoPais = EmptyStr) then
            begin
                raise exception.Create('Cadastro do cliente com dados em branco, favor corrigir o cadastro.'#13#10 + //
                    'Nome'#13#10 + 'Estado'#13#10 + 'Tipo'#13#10 + 'Cep'#13#10 + 'Município'#13#10 + 'Bairro'#13#10 + //
                    'Endereço'#13#10 + 'CNPJ/CPF'#13#10 + 'Inscrição'#13#10 + 'Telefone'#13#10 + 'Pessoa'#13#10 + 'Código Pais');
            end;

            if Self.Cliente.ValidaCPF then
                if Self.Cliente.ValidarCPFCNPJ = false then
                    raise exception.Create('CPF ou CNPJ inválido.');

            if (Self.Cliente.CodigoPais <> '01058') or (Self.Cliente.Estado = 'EX') then
                raise exception.Create('Não é permitido vende para fora do País.');

            if (Self.Cliente.TipoPessoa = 'F') and (Self.Cliente.Rg = EmptyStr) then
                raise exception.Create('RG do cadastro do cliente em branco.');

            if Self.Cliente.ValidarInscricaoEstadual = false then
                raise exception.Create('Inscrição estadual inválida.');

        end;

        Self.Cliente.CarregarCondicoesPagamentoCliente;
        Self.CodigoCliente := Self.Cliente.Codigo;
        Self.NomeCliente := Self.Cliente.Nome;
        Self.LojaCliente := Self.Cliente.Loja;
        Self.TipoCliente := Self.Cliente.Tipo;
        // Self.Endereco := Cliente.Endereco;
        // Self.Bairro := Cliente.Bairro;
        // Self.Cep := Cliente.Cep;
        // Self.Municipio := Cliente.Municipio;
        // Self.Estado := Cliente.Estado;

    finally
        if mun <> nil then
            FreeAndNil(mun);
    end;
end;

procedure TOrcamento.PopularVendedorAoOrcamento;
begin
    if not Self.Vendedor.Preenchido then
        raise exception.Create('O vendedor não está preenchido.');

    Self.CodigoVendedor := Vendedor.Codigo;
    Self.NomeVendedor := Vendedor.NomeReduzido;
end;

procedure TOrcamento.PreencherObjeto(Orcamento: TOrcamento);
begin
    Orcamento.CopiarPara(Self);
    FPreenchido := true;
end;

{$ENDREGION}
{$REGION 'Métodos de Propriedades'}

procedure TOrcamento.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TOrcamento.SetNumeroOrcamento(const Value: string);
begin
    FNumeroOrcamento := Value;
end;

procedure TOrcamento.SetCodigoVendedor(const Value: string);
begin
    FCodigoVendedor := Value;
end;

procedure TOrcamento.SetNomeVendedor(const Value: string);
begin
    FNomeVendedor := Value;
end;

procedure TOrcamento.SetCodigoCliente(const Value: string);
begin
    if FCodigoCliente <> Value then
        LimparCondicaoDePagamento;

    FCodigoCliente := Value;
end;

procedure TOrcamento.SetStatusOrcamento(const Value: string);
begin
    FStatusOrcamento := Value;
end;

procedure TOrcamento.SetDataEmissao(const Value: string);
begin
    FDataEmissao := Value;
end;

procedure TOrcamento.SetTabelaComissao_(const Value: TTabelaComissao);
begin
    FTabelaComissao_ := Value;
end;

// procedure TOrcamento.SetTabelaComissaoLista(const Value: TLista<TTabelaComissao>);
// begin
// FTabelaComissaoLista := Value;
// end;

procedure TOrcamento.SetTabelaComissaoQuantidadeParcelas(const Value: integer);
begin
    FTabelaComissaoQuantidadeParcelas := Value;
end;

procedure TOrcamento.SetTipoCliente(const Value: string);
begin
    FTipoCliente := Value;
end;

procedure TOrcamento.SetValorTotal(const Value: double);
begin
    FValorTotal := Value;
end;

procedure TOrcamento.SetValorDesconto(const Value: double);
begin
    FValorDesconto := Value;
end;

procedure TOrcamento.SetValorLiquido(const Value: double);
begin
    FValorLiquido := Value;
end;

procedure TOrcamento.SetDataValidade(const Value: string);
begin
    FDataValidade := Value;
end;

procedure TOrcamento.SetValorBruto(const Value: double);
begin
    FValorBruto := Value;
end;

procedure TOrcamento.SetValorMercadoria(const Value: double);
begin
    FValorMercadoria := Value;
end;

procedure TOrcamento.SetPercetualDesconto(const Value: double);
begin
    FPercetualDesconto := Value;
end;

procedure TOrcamento.SetCodigoCondicaoPagamento(const Value: string);
begin
    FCodigoCondicaoPagamento := Value;
end;

procedure TOrcamento.SetLojaCliente(const Value: string);
begin
    if FLojaCliente <> Value then
        LimparCondicaoDePagamento;

    FLojaCliente := Value;
end;

procedure TOrcamento.SetHora(const Value: string);
begin
    FHora := Value;
end;

procedure TOrcamento.SetOrcamentoItens(const Value: TLista<TOrcamentoItem>);
begin
    FOrcamentoItens := Value;
end;

procedure TOrcamento.SetOrcamentoPagamentoNegociacao(const Value: TLista<TFormaPagamento>);
begin
    FOrcamentoPagamentoNegociacao := Value;
end;

procedure TOrcamento.SetObservacao1(const Value: string);
begin
    FObservacao1 := Value;
end;

procedure TOrcamento.SetObservacao2(const Value: string);
begin
    FObservacao2 := Value;
end;

procedure TOrcamento.SetDataCadastro(const Value: string);
begin
    FDataCadastro := Value;
end;

procedure TOrcamento.SetCodigoTransportadora(const Value: string);
begin
    FCodigoTransportadora := Value;
end;

procedure TOrcamento.SetCodigoLojaTransportadora(const Value: string);
begin
    FCodigoLojaTransportadora := Value;
end;

procedure TOrcamento.SetTipoDoFrete(const Value: string);
begin
    FTipoDoFrete := Value;
end;

function TOrcamento.SelecionarTipoEntrega(item: TOrcamentoItem): TTipoEntrega;
begin
    result := nil;

    if (Self.Cliente.Codigo = Self.Cliente.CodigoClientePadrao) and (Self.Cliente.Loja = Self.Cliente.LojaClientePadrao) then
        raise exception.Create('Não é permitido incluir tipos de entrega para cliente consumidor final');

    if trim(item.TipoEntrega) = 'CS' then
        exit;

    if item.Produto.ProdutoLiberadoConferenciaFiscal = false then
        raise Erro.Create('Este produto pode ser vendido, somente para Encomenda');

    // Self.Filial_.ObterListaTipoEntrega(tvVendaBalcao);

    frmSelecionarTipoEntrega := TfrmSelecionarTipoEntrega.Create(Application.MainForm);
    frmSelecionarTipoEntrega.Orcamento := Self;
    frmSelecionarTipoEntrega.Produto := item.Produto;
    frmSelecionarTipoEntrega.ShowModal;

    if frmSelecionarTipoEntrega.TipoEntregaSelecionado = nil then
    begin
        FreeAndNil(frmSelecionarTipoEntrega);
        result := nil;
        exit;
    end;

    result := TTipoEntrega.Create;
    frmSelecionarTipoEntrega.TipoEntregaSelecionado.CopiarPara(result);

    FreeAndNil(frmSelecionarTipoEntrega);
end;

procedure TOrcamento.SetBairroEntrega(const Value: string);
begin
    FBairroEntrega := Value;
end;

procedure TOrcamento.SetCepEntrega(const Value: string);
begin
    FCepEntrega := Value;
end;

procedure TOrcamento.SetCliente(const Value: TCliente);
begin
    FCliente := Value;
end;

procedure TOrcamento.SetMunicipioEntrega(const Value: string);
begin
    FMunicipioEntrega := Value;
end;

procedure TOrcamento.SetUFEntrega(const Value: string);
begin
    FUFEntrega := Value;
end;

procedure TOrcamento.SetValorDespesa(const Value: double);
begin
    FValorDespesa := Value;
end;

procedure TOrcamento.SetValorEntrada(const Value: double);
begin
    FValorEntrada := Value;
end;

procedure TOrcamento.SetPesoLiquido(const Value: double);
begin
    FPesoLiquido := Value;
end;

procedure TOrcamento.SetPesoBruto(const Value: double);
begin
    FPesoBruto := Value;
end;

procedure TOrcamento.SetVolume(const Value: double);
begin
    FVolume := Value;
end;

procedure TOrcamento.TabelaComissaoAjustar;
var
    item: TOrcamentoItem;
begin
    if Self.TabelaComissao_.CodigoTabela = 'T1' then
    begin
        if Self.TabelaComissao_.CodigoTabela <> Self.Vendedor.TabelaComissao then
        begin
            for item in Self.OrcamentoItens do
            begin
                item.TabelaComissaoCodigo := Self.Vendedor.TabelaComissao;
            end;
        end;
    end;
end;

procedure TOrcamento.TabelaComissaoRecalcular;
var
    item: TOrcamentoItem;
    totalPrecoTabela: double;
begin
    totalPrecoTabela := ObterValorTotalEmPrecoDeTabela;
    for item in OrcamentoItens do
    begin
        item.TabelaComissaoCodigoCalcularPreco(TabelaComissao_, TabelaComissaoQuantidadeParcelas, totalPrecoTabela, Self.ValorEntrada);
        item.TabelaComissaoCodigo := Self.TabelaComissao_.CodigoTabela;
    end;
end;

procedure TOrcamento.TabelaComissaoZerar;
var
    item: TOrcamentoItem;
begin
    for item in OrcamentoItens do
    begin
        item.ValorUnitarioNegociado := item.ValorPrecoTabela;
        item.TabelaComissaoCodigo := Self.TabelaComissao_.CodigoTabela;
    end;
end;

procedure TOrcamento.SetEspecie(const Value: string);
begin
    FEspecie := Value;
end;

procedure TOrcamento.SetFilial(const Value: TFilial);
begin
    FFilial_ := Value;
end;

procedure TOrcamento.SetFilial_(const Value: TFilial);
begin

end;

procedure TOrcamento.SetPlaca(const Value: string);
begin
    FPlaca := Value;
end;

procedure TOrcamento.SetTipoVenda(const Value: string);
begin
    FTipoVenda := Value;
end;

procedure TOrcamento.SetNumeroPedidoEcommerce(const Value: string);
begin
    FNumeroPedidoEcommerce := Value;
end;

procedure TOrcamento.SetNomeCliente(const Value: string);
begin
    FNomeCliente := Value;
end;

procedure TOrcamento.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TOrcamento.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TOrcamento.SetRecnoDel(const Value: integer);
begin
    FRecnoDel := Value;
end;

procedure TOrcamento.SetVendedor(const Value: TVendedor);
begin
    FVendedor := Value;
end;

procedure TOrcamento.SetVersaoSistema(const Value: string);
begin
    FVersaoSistema := Value;
end;

procedure TOrcamento.SetCodigoBairroTOTVS(const Value: string);
begin
    FCodigoBairroTOTVS := Value;
end;

{$ENDREGION}

end.
