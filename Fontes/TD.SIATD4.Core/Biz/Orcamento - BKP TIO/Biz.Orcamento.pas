unit Biz.Orcamento;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores, System.Math, DateUtils,
    Lib.Persistable, Lib.Biblioteca, Biz.Cliente, Biz.Vendedor, Lib.ResultFilter, Lib.Lista, Biz.Produto, Biz.Filial,
    Lib.MaxLenght, StrUtils, RComboBox,
    Biz.CreditoCliente, ComCtrls, Biz.OrcamentoPagamento, Biz.OrcamentoItens,
    Biz.TipoEntrega, Biz.TabelaComissao, Biz.Adminsitradora, Dal.ControleDados;

type
    TTipoFrete = (toEmitente = 1, toDestinatario = 2, toSemFrete = 9);

    TStatusConferencia = (Aguardando, Conferindo, Conferido);

    TTipoDeRateio = (trDespesas, trDesconto, trSeguro, trFrete);

    [TReferenceTable('SZ3010')]
    TOrcamento = class(TClasseBase)
    private
{$REGION 'Vari�veis de propriedade'}
        FPesoBruto: double;
        FValorFrete: double;
        FCodigoOperadorPDV: string;
        FValorDespesa: double;
        FTipoOrcamento: string;
        FDataEmissaoDocumento: string;
        FValorIpi: double;
        FValorBruto: double;
        FFilial: string;
        FBairro: string;
        FHora: string;
        FTipoCliente: string;
        FValorDesconto: double;
        FPercDesconto: double;
        FNomeVendedor: string;
        FVendaComTEF: string;
        FValorPagoCartaoCredito: double;
        FCodigoPDV: string;
        FRecnoDelete: integer;
        FCodigoOrcamentoOrigem: string;
        FValorIcms: double;
        FCep: string;
        FValorSeguro: double;
        FNumero: string;
        FCodigoTransportadora: string;
        FCodigoFormaPagto: string;
        FTipoVolume: string;
        FMunicipio: string;
        FValorTotal: double;
        FDataEmissao: string;
        FRecno: integer;
        FPesoLiquido: double;
        FValorPagoFinan: double;
        FValorPagoCheque: double;
        FTipoDaVenda: string;
        FVolume: double;
        FValorPagoDinheiro: double;
        FDataLimiteValidade: string;
        FCodigoCliente: string;
        FTipoFrete: string;
        FSenhaAutorizador: string;
        FValorLiquido: double;
        FLojaTransportadora: string;
        FDataDigitacao: string;
        FDelete: string;
        FObservacao2: string;
        FCodigoVendedor: string;
        FUsuario: string;
        FSerieDocumento: string;
        FEndereco: string;
        FObservacao1: string;
        FLojaCliente: string;
        FEstado: string;
        FNumeroDocumento: string;
        FOrcamentoPagamento: TLista<TOrcamentoPagamento>;
        FCliente: TCliente;
        FVendedor: TVendedor;
        FOrcamentoItens: TLista<TOrcamentoItens>;
        FOrcamentosFilhos: TLista<TOrcamento>;
        FCopiaCompleta: boolean;
        FValorSubstituicao: double;
        FTipoNotaFiscalMicrossiga: string;
        FUltimoItemAlterado: TOrcamentoItens;
        FCodigoEstacaoMS: String;
        FValorMercadoria: double;
        FOperacaoVenda: string;
        FControleEntrega: string;
        FOrcamentoGeradoPeloSiatd: string;
        FNomeCliente: string;
        FStatusEnvioEcommerce: string;
        FNumeroPedidoEcommerce: string;
        FStatusPedidoEcommerce: string;
        FValorFreteTodimoTransporte: double;
        FTipoDesconto: string;
        FStatusLiberacaoEntregaFutura: string;
        FValorPagoCartaoDebito: double;
        FUsuarioQueBloqueouOrcamento: string;
        FMoeda: double;
        FPlacaTransportadora: string;
        FCodigoVeiculoTransportadora: string;
        FUFPlancaTransportadora: string;
        FBaseICMSRestido: double;
        FTipo: string;
        FValorPagoConven: double;
        FVersaoSistema: string;
        FValorPagoDuplicata: double;
        FFilial_: TFilial;
        FOrcamentoConferencia: TOrcamento;
        FStatusConferencia: TStatusConferencia;
        FTipoEntregaPadrao: TTipoEntrega;
        FTipoVenda: TTipoVenda;
        FValorEntrada: double;
        FValorPromocao: double;
        FTabelaComissao: TTabelaComissao;
        FTabelaComissaoQuantidadeParcelas: integer;
        FCreditosCliente: TLista<TCreditoCliente>;
        FValorAcrescimosTotalNegociado: double;
        FValorDescontoTotalNegociado: double;
        FCPFCNPJImpressao: string;
{$ENDREGION}
{$REGION 'Metodos Get Set'}
        procedure SetBairro(const Value: string);
        procedure SetCep(const Value: string);
        procedure SetCodigoCliente(const Value: string);
        procedure SetCodigoFormaPagto(const Value: string);
        procedure SetCodigoOperadorPDV(const Value: string);
        procedure SetCodigoOrcamentoOrigem(const Value: string);
        procedure SetCodigoPDV(const Value: string);
        procedure SetCodigoTransportadora(const Value: string);
        procedure SetCodigoVendedor(const Value: string);
        procedure SetDataDigitacao(const Value: string);
        procedure SetDataEmissao(const Value: string);
        procedure SetDataEmissaoDocumento(const Value: string);
        procedure SetDataLimiteValidade(const Value: string);
        procedure SetDelete(const Value: string);
        procedure SetEndereco(const Value: string);
        procedure SetEstado(const Value: string);
        procedure SetFilial(const Value: string);
        procedure SetHora(const Value: string);
        procedure SetLojaCliente(const Value: string);
        procedure SetLojaTransportadora(const Value: string);
        procedure SetMunicipio(const Value: string);
        procedure SetNomeVendedor(const Value: string);
        procedure SetNumero(const Value: string);
        procedure SetNumeroDocumento(const Value: string);
        procedure SetObservacao1(const Value: string);
        procedure SetObservacao2(const Value: string);
        procedure SetPercDesconto(const Value: double);
        procedure SetPesoBruto(const Value: double);
        procedure SetPesoLiquido(const Value: double);
        procedure SetRecno(const Value: integer);
        procedure SetRecnoDelete(const Value: integer);
        procedure SetSenhaAutorizador(const Value: string);
        procedure SetSerieDocumento(const Value: string);
        procedure SetTipoCliente(const Value: string);
        procedure SetTipoDaVenda(const Value: string);
        procedure SetTipoFrete(const Value: string);
        procedure SetTipoOrcamento(const Value: string);
        procedure SetTipoVolume(const Value: string);
        procedure SetUsuario(const Value: string);
        procedure SetValorBruto(const Value: double);
        procedure SetValorDesconto(const Value: double);
        procedure SetValorDespesa(const Value: double);
        procedure SetValorFrete(const Value: double);
        procedure SetValorIcms(const Value: double);
        procedure SetValorIpi(const Value: double);
        procedure SetValorLiquido(const Value: double);
        procedure SetValorPagoCartaoCredito(const Value: double);
        procedure SetValorPagoCheque(const Value: double);
        procedure SetValorPagoDinheiro(const Value: double);
        procedure SetValorPagoFinan(const Value: double);
        procedure SetValorSeguro(const Value: double);
        procedure SetValorTotal(const Value: double);
        procedure SetVendaComTEF(const Value: string);
        procedure SetVolume(const Value: double);
        procedure SetCliente(const Value: TCliente);
        procedure SetVendedor(const Value: TVendedor);
        function GetValorBruto: double;
        function GetValorDesconto: double;
        function GetValorDespesa: double;
        function GetValorFrete: double;
        function GetValorIcms: double;
        function GetValorIpi: double;
        function GetValorLiquido: double;
        function GetValorSeguro: double;
        function GetValorTotal: double;
        procedure SetOrcamentosFilhos(const Value: TLista<TOrcamento>);
        procedure SetCopiaCompleta(const Value: boolean);
        procedure SetValorSubstituicao(const Value: double);
        function GetValorSubstituicao: double;
        procedure SetTipoNotaFiscalMicrossiga(const Value: string);
        procedure SetUltimoItemAlterado(const Value: TOrcamentoItens);
        procedure SetCodigoEstacaoMS(const Value: String);
        function GetOrcamentoComPrecoNegociado: boolean;
        function GetOrcamentoComTabela: boolean;
        function GetOrcamentoComProdutoSelf: boolean;
        function GetCupomOuNotaFiscal: string;
        procedure SetValorMercadoria(const Value: double);
        function GetValorMercadoria: double;
        procedure SetOperacaoVenda(const Value: string);
        procedure SetControleEntrega(const Value: string);
        procedure SetOrcamentoGeradoPeloSiatd(const Value: string);
        procedure SetNomeCliente(const Value: string);
        procedure SetNumeroPedidoEcommerce(const Value: string);
        procedure SetStatusEnvioEcommerce(const Value: string);
        procedure SetStatusPedidoEcommerce(const Value: string);
        procedure SetValorFreteTodimoTransporte(const Value: double);
        procedure SetTipoDesconto(const Value: string);
        function GetTipoDesconto: string;
        procedure SetStatusLiberacaoEntregaFutura(const Value: string);
        procedure SetValorPagoCartaoDebito(const Value: double);
        procedure SetUsuarioQueBloqueouOrcamento(const Value: string);
        procedure SetMoeda(const Value: double);
        procedure SetCodigoVeiculoTransportadora(const Value: string);
        procedure SetPlacaTransportadora(const Value: string);
        procedure SetUFPlancaTransportadora(const Value: string);
        procedure SetBaseICMSRestido(const Value: double);
        procedure SetTipo(const Value: string);
        procedure SetValorPagoConven(const Value: double);
        procedure SetVersaoSistema(const Value: string);
        function GetVersaoSistema: string;
        procedure SetValorPagoDuplicata(const Value: double);
        procedure SetFilial_(const Value: TFilial);
        function GetTipoEntregaPadrao: TTipoEntrega;
        function GetTipoVenda: TTipoVenda;
        procedure SetTipoVenda(const Value: TTipoVenda);
        procedure SetValorEntrada(const Value: double);
        procedure SetValorPromocao(const Value: double);
        procedure SetTabelaComissao(const Value: TTabelaComissao);
        procedure SetTabelaComissaoQuantidadeParcelas(const Value: integer);
        procedure SetCreditosCliente(const Value: TLista<TCreditoCliente>);
        procedure SetValorAcrescimosTotalNegociado(const Value: double);
        procedure SetValorDescontoTotalNegociado(const Value: double);
        procedure SetCPFCNPJImpressao(const Value: string);


{$ENDREGION}
        function GerarParcelasOutros(quantidadeParcelas_GP, dias_GP, intervalo_GP, ultimaSequenciaCartao_GP: integer;
          tipoGeracaoParcela_GP: TTipoGeracaoParcela; formaPagamento_GP: TFormaPagamento;
          primeiraDataVcto_GP, administradoraDescricao_GP, tipoCheque_GP, agenciaBanco_GP, conta_GP, rg_GP, cgc_GP, telefone_GP, observacao_GP,
          numeroDocumento_GP, nomeCliente_GP: String; valorParcela_GP, valorTotalRestante_GP: double): boolean;
        function GerarParcelasTDC(primeiraDataVcto_GP, administradoraDescricao_GP: string; formaPagamento_GP: TFormaPagamento): boolean;

        procedure PreencherTreeView(treeView: TTreeView);
        procedure AddTreeView(pai, filho: String; treeView: TTreeView);
        function AddTreeViewDeletar(item: TOrcamentoItens; treeView: TTreeView): boolean;
        function PreencheTreeViewDeletar(item: TOrcamentoItens; treeView: TTreeView): boolean;
        procedure ObterArvoreProdutosCrossSelling(item: TOrcamentoItens; treeView: TTreeView);
        procedure ExcluirItens;
        procedure ExcluirCondicoesPagamento;

    public

        class var dao: TControleDados<TLista<TOrcamento>, TListaDAO<TOrcamento>>;

{$REGION 'Or�amento'}
{$REGION 'propriedades Orcamento'}
        [TPersistable(fgPersistable, 'Z3_FILIAL')]

        property Filial: string read FFilial write SetFilial;

        property Filial_: TFilial read FFilial_ write SetFilial_;

        [TPersistable(fgPersistable, 'Z3_NUM')]
        property Numero: string read FNumero write SetNumero;

        [TPersistable(fgPersistable, 'Z3_VEND')]
        property CodigoVendedor: string read FCodigoVendedor write SetCodigoVendedor;

        [TPersistable(fgPersistable, 'Z3_NOMVDO')]
        property NomeVendedor: string read FNomeVendedor write SetNomeVendedor;

        property Vendedor: TVendedor read FVendedor write SetVendedor;

        [TPersistable(fgPersistable, 'Z3_CLIENTE')]
        property CodigoCliente: string read FCodigoCliente write SetCodigoCliente;

        [TPersistable(fgPersistable, 'Z3_TDNOMCL')]
        [TMaxLenght(30)]
        property NomeCliente: string read FNomeCliente write SetNomeCliente;

        /// <summary>
        /// Campo que guarda o sequencial do cliente. Z3_loja foi usado para
        /// este prop�sito
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_LOJA')]
        property SequencialCliente: string read FLojaCliente write SetLojaCliente;

        property Cliente: TCliente read FCliente write SetCliente;

        [TPersistable(fgPersistable, 'Z3_CGCCLI')]
        property CPFCNPJImpressao: string read FCPFCNPJImpressao write SetCPFCNPJImpressao;

        [TPersistable(fgPersistable, 'Z3_ORCLIB')]
        property TipoOrcamento: string read FTipoOrcamento write SetTipoOrcamento;

        [TPersistable(fgPersistable, 'Z3_EMISSAO')]
        property DataEmissao: string read FDataEmissao write SetDataEmissao;

        [TPersistable(fgPersistable, 'Z3_HORA')]
        property Hora: string read FHora write SetHora;

        [TPersistable(fgPersistable, 'Z3_TIPOCLI')]
        property TipoCliente: string read FTipoCliente write SetTipoCliente;

{$REGION 'Valores Totalizados'}
        /// <summary>
        /// Valor bruto do or�amento sem desconto
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_VLRTOT')]
        property ValorTotal: double read GetValorTotal write SetValorTotal;

        /// <summary>
        /// Total dos descontos consedidos no or�amento, ou seja, � o valor desconto digitado
        /// duranta a negocia��o da forma de pagamento, ou desconto geral.
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_DESCONT')]
        property ValorDesconto: double read GetValorDesconto write SetValorDesconto;

        /// <summary>
        /// Valor pago pelo cliente
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_VLRLIQ')]
        property ValorLiquido: double read GetValorLiquido write SetValorLiquido;

        /// <summary>
        /// Valor bruto do orcamento sem desconto
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_VALBRUT')]
        property ValorBruto: double read GetValorBruto write SetValorBruto;

        /// <summary>
        /// Soma dos valors dos produtos
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_VALMERC')]
        property ValorMercadoria: double read GetValorMercadoria write SetValorMercadoria;

        [TPersistable(fgPersistable, 'Z3_VALICM')]
        property ValorIcms: double read GetValorIcms write SetValorIcms;

        [TPersistable(fgPersistable, 'Z3_ICMSRET')]
        property ValorSubstituicao: double read GetValorSubstituicao write SetValorSubstituicao;

        [TPersistable(fgPersistable, 'Z3_VALIPI')]
        property ValorIpi: double read GetValorIpi write SetValorIpi;

        [TPersistable(fgPersistable, 'Z3_FRETE')]
        property ValorFrete: double read GetValorFrete write SetValorFrete;

        [TPersistable(fgPersistable, 'Z3_SEGURO')]
        property ValorSeguro: double read GetValorSeguro write SetValorSeguro;

        /// <summary>
        /// Total das despesas consedidos no or�amento, ou seja, � o valor de despesa digitado
        /// duranta a negocia��o da forma de pagamento, ou despesa geral.
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_DESPESA')]
        property ValorDespesa: double read GetValorDespesa write SetValorDespesa;

        /// <summary>
        /// Propriedade que indica ao usuario qual o valor dos produto que esta em promo��o
        /// </summary>
        property ValorPromocao: double read FValorPromocao write SetValorPromocao;

        /// <summary>
        /// Esta propriedade � diferente a propriedade FValorDesconto.
        /// � o valor desconto geral (FValorDesconto) mais os descontos negociados
        /// diretamento no produto.
        /// </summary>
        property ValorDescontoTotalNegociado: double read FValorDescontoTotalNegociado write SetValorDescontoTotalNegociado;

        /// <summary>
        /// Esta propriedade � diferente a propriedade FValorDespesa.
        /// � o valor de despesa geral (FValorDespesa) mais os acr�scimos negociados
        /// diretamento no produto.
        /// </summary>
        property ValorAcrescimosTotalNegociado: double read FValorAcrescimosTotalNegociado write SetValorAcrescimosTotalNegociado;

{$ENDREGION}
        /// <summary>
        /// Z3_DESCONT > 0 then '1' else ''
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_TIPODES')]
        property TipoDesconto: string read GetTipoDesconto write SetTipoDesconto;

        /// <summary>
        /// Validade do or�amento
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_DTLIM')]
        property DataLimiteValidade: string read FDataLimiteValidade write SetDataLimiteValidade;

        [TPersistable(fgPersistable, 'Z3_DOCTD')]
        property NumeroDocumento: string read FNumeroDocumento write SetNumeroDocumento;

        [TPersistable(fgPersistable, 'Z3_SERTD')]
        property SerieDocumento: string read FSerieDocumento write SetSerieDocumento;

        [TPersistable(fgPersistable, 'Z3_PDV')]
        property CodigoPDV: string read FCodigoPDV write SetCodigoPDV;

        [TPersistable(fgPersistable, 'Z3_OPERADO')]
        property CodigoOperadorPDV: string read FCodigoOperadorPDV write SetCodigoOperadorPDV;

        [TPersistable(fgPersistable, 'Z3_EMISNF')]
        property DataEmissaoDocumento: string read FDataEmissaoDocumento write SetDataEmissaoDocumento;

        [TPersistable(fgPersistable, 'Z3_DESCNF')]
        property PercDesconto: double read FPercDesconto write SetPercDesconto;

        [TPersistable(fgPersistable, 'Z3_DINHEIR')]
        property ValorPagoDinheiro: double read FValorPagoDinheiro write SetValorPagoDinheiro;

        [TPersistable(fgPersistable, 'Z3_CHEQUES')]
        property ValorPagoCheque: double read FValorPagoCheque write SetValorPagoCheque;

        [TPersistable(fgPersistable, 'Z3_CARTAO')]
        property ValorPagoCartaoCredito: double read FValorPagoCartaoCredito write SetValorPagoCartaoCredito;

        [TPersistable(fgPersistable, 'Z3_VLRDEBI')]
        property ValorPagoCartaoDebito: double read FValorPagoCartaoDebito write SetValorPagoCartaoDebito;

        [TPersistable(fgPersistable, 'Z3_CONVENI')]
        property ValorPagoConven: double read FValorPagoConven write SetValorPagoConven;

        [TPersistable(fgPersistable, 'Z3_FINANC')]
        property ValorPagoFinan: double read FValorPagoFinan write SetValorPagoFinan;

        [TPersistable(fgPersistable, 'Z3_OUTROS')]
        property ValorPagoDuplicata: double read FValorPagoDuplicata write SetValorPagoDuplicata;

        /// <summary>
        /// Para NFE = '', outros= 'FI'
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_FORMPG')]
        property CodigoFormaPagto: string read FCodigoFormaPagto write SetCodigoFormaPagto;

        [TPersistable(fgPersistable, 'Z3_VENDTEF')]
        property VendaComTEF: string read FVendaComTEF write SetVendaComTEF;

        /// <summary>
        /// Venda Futura, 4-FAT e 6-FUT =  orcamento + 'ORC' + Filial +  Data Emissao
        /// data Quem preenche � o microsiga
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_AUTSENH')]
        property SenhaAutorizador: string read FSenhaAutorizador write SetSenhaAutorizador;

        [TPersistable(fgPersistable, 'Z3_OBS1')]
        property Observacao1: string read FObservacao1 write SetObservacao1;

        [TPersistable(fgPersistable, 'Z3_OBS2')]
        property Observacao2: string read FObservacao2 write SetObservacao2;

        /// <summary>
        /// Data Inclus�o do or�amento
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_DTCAD')]
        property DataDigitacao: string read FDataDigitacao write SetDataDigitacao;

        [TPersistable(fgPersistable, 'Z3_CODTRAN')]
        property CodigoTransportadora: string read FCodigoTransportadora write SetCodigoTransportadora;

        [TPersistable(fgPersistable, 'Z3_LOJTRAN')]
        property LojaTransportadora: string read FLojaTransportadora write SetLojaTransportadora;

        /// <summary>
        /// 1-Emitente 2-Destinat�rio 9-Sem Frete
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_TIPFRET')]
        property TipoFrete: string read FTipoFrete write SetTipoFrete;

        [TPersistable(fgPersistable, 'Z3_ENDENT')]
        [TMaxLenght(60)]
        property Endereco: string read FEndereco write SetEndereco;

        [TPersistable(fgPersistable, 'Z3_BAIRROE')]
        property Bairro: string read FBairro write SetBairro;

        [TPersistable(fgPersistable, 'Z3_CEPE')]
        property Cep: string read FCep write SetCep;

        [TPersistable(fgPersistable, 'Z3_MUNE')]
        property Municipio: string read FMunicipio write SetMunicipio;

        [TPersistable(fgPersistable, 'Z3_ESTE')]
        property Estado: string read FEstado write SetEstado;

        [TPersistable(fgPersistable, 'Z3_PLIQUI')]
        property PesoLiquido: double read FPesoLiquido write SetPesoLiquido;

        [TPersistable(fgPersistable, 'Z3_PBRUTO')]
        property PesoBruto: double read FPesoBruto write SetPesoBruto;

        [TPersistable(fgPersistable, 'Z3_VOLUME')]
        property Volume: double read FVolume write SetVolume;

        [TPersistable(fgPersistable, 'Z3_ESPECIE')]
        property TipoVolume: string read FTipoVolume write SetTipoVolume;

        /// <summary>
        /// Nome usuario ultima altera��o
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_USERID')]
        property Usuario: string read FUsuario write SetUsuario;

        /// <summary>
        /// Filial + Or�amento de Origem
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_DOCORIG')]
        property NumeroOrcamentoOrigem: string read FCodigoOrcamentoOrigem write SetCodigoOrcamentoOrigem;

        /// <summary>
        /// Nos orcamentos filhos, se for 9-PSE = 'PE' else 'OD'
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_TIPOVEN')]
        property TipoDaVenda: string read FTipoDaVenda write SetTipoDaVenda;

        property TipoVenda: TTipoVenda read GetTipoVenda write SetTipoVenda;

        /// <summary>
        /// venda Rapida Mae = 'R'
        /// venda futura Mae = 'F',
        /// 8-EOK = 'F',
        /// 6-FUT = 'O'
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_OPERACA')]
        property OperacaoVenda: string read FOperacaoVenda write SetOperacaoVenda;

        /// <summary>
        /// � preenchido com 'S' no orcamento mae, quando tem filhos 6-FUT, 9-ENT ou 9-ENL
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_ENTREG')]
        property ControleEntrega: string read FControleEntrega write SetControleEntrega;

        [TPersistable(fgPersistable, 'Z3_SIATD')]
        property OrcamentoGeradoPeloSiatd: string read FOrcamentoGeradoPeloSiatd write SetOrcamentoGeradoPeloSiatd;

        [TPersistable(fgPersistable, 'Z3_TDNUME')]
        property NumeroPedidoEcommerce: string read FNumeroPedidoEcommerce write SetNumeroPedidoEcommerce;

        [TPersistable(fgPersistable, 'Z3_TDSTPED')]
        property StatusPedidoEcommerce: string read FStatusPedidoEcommerce write SetStatusPedidoEcommerce;

        [TPersistable(fgPersistable, 'Z3_TDFLAG')]
        property StatusEnvioEcommerce: string read FStatusEnvioEcommerce write SetStatusEnvioEcommerce;

        [TPersistable(fgPersistable, 'Z3_VLRFRE')]
        property ValorFreteTodimoTransporte: double read FValorFreteTodimoTransporte write SetValorFreteTodimoTransporte;

        [TPersistable(fgPersistable, 'Z3_STATUS')]
        property StatusLiberacaoEntregaFutura: string read FStatusLiberacaoEntregaFutura write SetStatusLiberacaoEntregaFutura;

        [TPersistable(fgPersistable, 'Z3_CONFVEN')]
        property UsuarioQueBloqueouOrcamento: string read FUsuarioQueBloqueouOrcamento write SetUsuarioQueBloqueouOrcamento;

        /// <summary>
        /// Para NFE = '', outros = '1'
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_MOEDA')]
        property Moeda: double read FMoeda write SetMoeda;

        [TPersistable(fgPersistable, 'Z3_PLACA')]
        property PlacaTransportadora: string read FPlacaTransportadora write SetPlacaTransportadora;

        [TPersistable(fgPersistable, 'Z3_UFPLACA')]
        property UFPlancaTransportadora: string read FUFPlancaTransportadora write SetUFPlancaTransportadora;

        [TPersistable(fgPersistable, 'Z3_VEIPESQ')]
        property CodigoVeiculoTransportadora: string read FCodigoVeiculoTransportadora write SetCodigoVeiculoTransportadora;

        [TPersistable(fgPersistable, 'Z3_BRICMS')]
        property BaseICMSRestido: double read FBaseICMSRestido write SetBaseICMSRestido;

        /// <summary>
        /// Precisamos ver qual � a necessidade desse campo
        /// preenchido no 8-eok e 4-fat da venda futura
        /// </summary>
        [TPersistable(fgPersistable, 'Z3_TIPO')]
        property Tipo: string read FTipo write SetTipo;

        [TPersistable(fgUpdateable, 'D_E_L_E_T_')]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgPersistable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgReadOnly, 'R_E_C_D_E_L_')]
        property RecnoDelete: integer read FRecnoDelete write SetRecnoDelete;

        [TPersistable(fgPersistable, 'Z3_VERSAO')]
        property VersaoSistema: string read GetVersaoSistema write SetVersaoSistema;

        [TPersistable(fgPersistable, 'Z3_ENTRADA')]
        property ValorEntrada: double read FValorEntrada write SetValorEntrada;

        /// <summary>
        /// Propriedade que indica ao copiar se a func��o de CopiarPara ir�
        /// fazer a c�pia completa das informa��es (itens, codicao pagamento
        /// etc) ou somente o cabe�alho
        /// </summary>
        /// <value>
        /// ser� setada como verdadeira na inst�ncia da classe
        /// </value>
        property CopiaCompleta: boolean read FCopiaCompleta write SetCopiaCompleta;

        /// <summary>
        /// propriedade usada na integra��o com o microssiga para gravar na
        /// tabela Z80  Cupom Fiscal = 4, Nota Fiscal = 1
        /// </summary>
        property TipoNotaFiscalMicrossiga: string read FTipoNotaFiscalMicrossiga write SetTipoNotaFiscalMicrossiga;

        /// <summary>
        /// Baseado na propiedade TipoNotaFiscalMicrossiga�pode ser 'C' = cupom discal ou 'N' = nota fiscal
        /// </summary>
        property CupomOuNotaFiscal: string read GetCupomOuNotaFiscal;

        /// <summary>
        /// Propriedade utilizada para guardar o codigo da esta��o do
        /// Microsiga, este valor vem da tabela SLG
        /// </summary>
        property CodigoEstacaoMS: String read FCodigoEstacaoMS write SetCodigoEstacaoMS;


        /// <summary>
        /// Properiedade que indica que se o orcamento tem tabela (T1, T2,
        /// T3.. etc);
        /// </summary>
        property OrcamentoComTabela: boolean read GetOrcamentoComTabela;

        /// <summary>
        /// Properiedade que indica que se o orcamento tem algum item com
        /// pre�o negociado
        /// </summary>
        property OrcamentoComPrecoNegociado: boolean read GetOrcamentoComPrecoNegociado;

        /// <summary>
        /// Properiedade que indica que se o orcamento tem algum item que
        /// seja da SelfColor
        /// </summary>
        property OrcamentoComProdutoSelf: boolean read GetOrcamentoComProdutoSelf;

        property TabelaComissao: TTabelaComissao read FTabelaComissao write SetTabelaComissao;
        property TabelaComissaoQuantidadeParcelas: integer read FTabelaComissaoQuantidadeParcelas write SetTabelaComissaoQuantidadeParcelas;

        property TipoEntregaPadrao: TTipoEntrega read GetTipoEntregaPadrao;

{$ENDREGION}
        function Inserir: boolean;
        function Alterar: boolean;
        function Deletar: boolean;

        function Obter(parametros: TParametro): TOrcamento; overload;
        function Obter(ID: string): TOrcamento; overload;

        function Listar(tipoOperacao: TOparationTypes; multiSelect: boolean; paramentro: TParametro): TResultFilter;

        function Consultar(parametros: TParametro): TLista<TOrcamento>;

        /// <summary>
        /// retorna o N�mero do Orcamento
        /// </summary>
        procedure ObterNumeroOrcamento;

        /// <summary>
        /// Popula o objeto Orcamento
        /// </summary>
        procedure PopularObjeto(Orcamento: TOrcamento);

        /// <summary>
        /// popula�todos os totais do orcamento e totais dos impostos
        /// </summary>
        procedure ObterTotaisOrcamento;

        /// <summary>
        /// Zero todos os totais do orcamento
        /// </summary>
        procedure ZerarTotais;

        /// <summary>
        /// Obt�m o orcaemento da loja dos orcamento filhos - 8-EOK
        /// </summary>
        function ObterOrcamentoLoja: TOrcamento;

        /// <summary>
        /// Obt�m o orcaemento filho por tipo
        /// </summary>
        function ObterOrcamentoFilhoPorTipo(TipoOrcamento: string): TOrcamento;

        /// <summary>
        /// Este m�todo retorna a quantidade de or�amentos que s�o entregues
        /// fora da loja.
        /// </summary>
        function VerificarQuantidadeItensForaDaLoja: integer;

        /// <summary>
        /// sobrescrita do m�todo da classe base que copia as instancia da
        /// classe (herdada da classe base) bem como as demais propriedades
        /// agregadadas (lista de itens do orcamento, lista de forma de
        /// pagamento, etc).
        /// </summary>
        procedure CopiarPara(objeto: TObject); override;

        /// <summary>
        /// Obtem os itens e popula os itens do orcamento
        /// </summary>
        procedure ObterItensOrcamento;

        /// <summary>
        /// obtem lista de condi��o de pagamento do orcamento;
        /// </summary>
        procedure ObterCondicaoPagamentoOrcamento;

        /// <summary>
        /// obtem os orcamentos filhos;
        /// </summary>
        procedure ObterOrcamentosFilhos;

        /// <summary>
        /// Bloqueia o orcameto para que possa fazer a altera��o sem que
        /// nenhum outro usu�rio possa us�-lo
        /// </summary>
        procedure BloquearOrcamento;

        /// <summary>
        /// Libera o or�amento para que todos possam alter�-lo
        /// </summary>
        procedure LiberarOrcamento;

        procedure EnviarParaCaixa;

        /// <summary>
        /// Popula algumas informa��es do vendedor necess�rias no orcamento
        /// </summary>
        procedure PopularVendedorAoOrcamento(Vendedor: TVendedor);

        /// <summary>
        /// Popular informa��es do cliente necess�rias no orcamento
        /// </summary>
        procedure PopularClienteAoOrcamento(Cliente: TCliente);

        procedure CalcularValorEntradaPagamento(valorRateio: double);
        procedure ObterValorParaRateio(var valorDosProduto: double; var tipos: String; tipoDoRateio: TTipoDeRateio);
        procedure RatearValoresNosItens(valorRateio: double; nomeCampoParaRateio: String; tipoDoRateio: TTipoDeRateio); overload;
        procedure RatearValoresNosItens; overload;
        function ZerarRateioValoresNosItens(nomeCampoParaRateio: String): boolean;
        function ObterTotalProdutosDiferenteDeCursoSeguro(var tipos: String): double;
        function ObterTotalPorTipoParaRateio(Tipo: String; var tiposDeEntrega: string): double;
        procedure AtualizarTabelaComissaoItens;
        function ObterValorRestanteParaPagamento: double;

        procedure MostrarArvoreProdutosAlternativos(item: TOrcamentoItens = nil);

        constructor Create; overload;
        constructor Create(tipoVda: TTipoVenda); overload;
        destructor Destroy; override;

{$ENDREGION}
{$REGION 'Itens do Orcamento'}
        property OrcamentoItens: TLista<TOrcamentoItens> read FOrcamentoItens;

        /// <summary>
        /// Guarda o �ltimo item alterado ou inserido da lista
        /// </summary>
        property UltimoItemAlterado: TOrcamentoItens read FUltimoItemAlterado write SetUltimoItemAlterado;

        /// <summary>
        /// Retorna a quantidade de itens
        /// </summary>
        function ObterQuantidadeItens: integer;

        /// <summary>
        /// Obtem o total das quantidade de todos os itens.
        /// </summary>
        function ObterQuantidadeTotalItens: double;

        /// <summary>
        /// Obt�m o peso total de todos os items
        /// </summary>
        function ObterPesoTotalItens: double;

        /// <summary>
        /// Adiciona item na lista de itens
        /// </summary>
        procedure AddOrcamentoItem(OrcamentoItens: TOrcamentoItens); overload;

        /// <summary>
        /// Adiciona Item na lista de Itens atrav�s de um produto
        /// </summary>
        procedure AddOrcamentoItem(Produto: TProduto; quantidade: double = 0; TipoEntrega: string = 'LJ'); overload;

        /// <summary>
        /// Pesquisa um ou mais produto e adiciona ao orcamento.
        /// </summary>
        procedure AddOrcamentoItemPesquisandoProduto(Produto: String);

        /// <summary>
        /// Deleta item da lista de itens
        /// </summary>
        function DeletarOrcamentoItem(item: TOrcamentoItens; mostraMensagem: boolean = false): boolean;

        /// <summary>
        /// Limpa todos os itens�do orcamento
        /// </summary>
        procedure LimparItensDoOrcamento;

        /// <summary>
        /// Obtem item por c�digo e validaConferencia da lista de itens do orcamento
        /// </summary>
        /// <param name="entrega">
        /// ex: DL, LJ...
        /// </param>
        function ObterItem(codigo: string; validaConferido: boolean; TipoEntrega: string): TOrcamentoItens; overload;
        function ObterItem(codigo: string; validaConferido: boolean): TOrcamentoItens; overload;
        function ObterItem(codigo: string; TipoEntrega: string): TOrcamentoItens; overload;
        function ObterItem(codigo: string): TOrcamentoItens; overload;

        /// <summary>
        /// obtem a quantidade item conforme o tipo de entrega (DL, LJ)
        /// passado por parametro
        /// </summary>
        /// <param name="entrega">
        /// tipo de entrega (DL, LJ)
        /// </param>
        function ObterQuantidadeItemPorTipoEntrega(entrega: string): integer;

        /// <summary>
        /// Recalcula todos as comiss�es aplicadas de todos os itens
        /// </summary>
        procedure RecalcularComissoesAplicadas;

        /// <summary>
        /// M�tdo que atualizar as tabelas de comiss�es dos itens.
        /// </summary>
        procedure AtualizarTabelasDeComissao;

        /// <summary>
        /// Verifica se existe algum item com caracters inv�lidos
        /// </summary>
        function ValidarCaracteresInvalidosNosItens: boolean;

        function ObterTotalPrecoTabela: double;
        procedure RecalcularPrecoEmTabelaComissao;
        procedure ZerarPrecoEmTabela;

        function ObterCrossSelling(item: TOrcamentoItens): boolean;
        function ObterUpSelling(item: TOrcamentoItens): boolean; overload;
        function ObterUpSelling(Produto: TProduto): boolean; overload;
        function ObterSimilares(item: TOrcamentoItens): boolean; overload;
        function ObterSimilares(Produto: TProduto): boolean; overload;

        procedure AtualizarFilhosCrossSelling(itemAtual, itemAnterior: TOrcamentoItens);

{$ENDREGION}
{$REGION 'Condi��es de Pagamento'}
        property OrcamentoPagamento: TLista<TOrcamentoPagamento> read FOrcamentoPagamento;

        /// <summary>
        /// Adiciona condi��o de pagamento
        /// </summary>
        procedure AddOrcamentoPagto(OrcamentoPagto: TOrcamentoPagamento);

        /// <summary>
        /// Gera as parcelas de uma determinada condi��o de pagamento�de
        /// acordo com os paramentros passados
        /// </summary>
        function GerarParcelas(formaPagamento_GP: TFormaPagamento; administradora_GP: TAdministradora; valorTotal_GP: double;
          quantidadeParcelas_GP: integer; primeiraDataVcto_GP: string; tipoGeracaoParcela_GP: TTipoGeracaoParcela; dias_GP, intervalo_GP: integer;
          tipoCheque_GP, agenciaBanco_GP, conta_GP, numeroDocumento_GP, nomeCliente_GP, rg_GP, cgc_GP, telefone_GP, observacao_GP: string)
          : boolean; overload;

        /// <summary>
        /// Gera as parcelas de uma determinada condi��o de pagamento�de
        /// acordo com os paramentros passados
        /// </summary>
        function GerarParcelas(formaPagamento_GP: TFormaPagamento; administradora_GP: TAdministradora; valorTotal_GP: double;
          quantidadeParcelas_GP: integer; primeiraDataVcto_GP: string; tipoGeracaoParcela_GP: TTipoGeracaoParcela; dias_GP, intervalo_GP: integer)
          : boolean; overload;

        /// <summary>
        /// Cancela as parcelas de uma determinada condi��o de pagamento
        /// </summary>
        procedure CancelarCondicaoPagamento(formaPg: TFormaPagamento; administradora, sequenciamentoCartao: string);

        /// <summary>
        /// Obt�m o valor total de uma determinada condi��o de pagamento.
        /// </summary>
        function ObterValorTotalCondicaoPagamento(formaPg: TFormaPagamento; administradora, sequenciamentoCartao: string): double; overload;
        function ObterValorTotalCondicaoPagamento(condicaoPgto: TOrcamentoPagamento): double; overload;
        function ObterValorTotalCondicaoPagamento(formaPg: TFormaPagamento): double; overload;

        /// <summary>
        /// Obtem o total de parcelas das condi��es de pagamento
        /// </summary>
        function ObterTotalParcelas(condicaoPgto: TOrcamentoPagamento): integer;

        /// <summary>
        /// Obtem o valor total de todas as condi��es de pagamento
        /// </summary>
        function ObterValorTotalTodasCondicoesPagamento: double;

        /// <summary>
        /// Retorna a quantidade de condicao Pagamento
        /// </summary>
        function ObterQuantidadeCondicaoPagamento: integer;

        /// <summary>
        /// Limpa todas as condi��es de pagamento
        /// </summary>
        procedure LimparCondicoesPagamento;

        /// <summary>
        /// percorre as condi��es de pagamento e retorna o prazo medio
        /// </summary>
        function ObterPrazoMedioDasCondicoesPagto: double;

        /// <summary>
        /// Altera as informa��es das�parcelas seguintes da condi��o de
        /// pagamento de acordo com condicao alterada
        /// </summary>
        procedure AlterarParcelasDaMesmaCondicaoPagamento(condicaoPgto: TOrcamentoPagamento);

        /// <summary>
        /// Retorna a condi��o de pagamento que possui a maior parcela
        /// </summary>
        function ObterCondicaoPagamentoComMaiorParcela: TOrcamentoPagamento;

        /// <summary>
        /// Verifica se existe parcela em atraso
        /// </summary>
        function VeriricarExistenciaParcelasVencidas: boolean;

{$REGION 'Orcamentos Filhos'}
        property OrcamentosFilhos: TLista<TOrcamento> read FOrcamentosFilhos write SetOrcamentosFilhos;

        /// <summary>
        /// Verifica se existe orcamento filho com itens para entrega.
        /// usar met�do VerificarQuantidadeItensForaDaLoja
        /// </summary>
        function VerificarExistenciaOrcamentoParaEntrega: boolean; deprecated;

        /// <summary>
        /// Verifica a quantiade de orcamento filhos
        /// </summary>
        function ObterQuantidadeOrcamentoFilhos: integer;

        function SelecionarTipoEntrega(item: TOrcamentoItens): TTipoEntrega;
{$ENDREGION}
{$REGION 'CreditosClinte'}
        property CreditosCliente: TLista<TCreditoCliente> read FCreditosCliente write SetCreditosCliente;
        procedure AdicionarCreditoCliente(credito: TCreditoCliente);
        function ConsultarCreditosCliente: boolean;
{$ENDREGION}
    end;

implementation

uses Lib.Filter, Datasnap.DBClient, Lib.Aguarde,
    System.Types, forms, System.UITypes, Lib.Erro, Biz.UsuarioLogado,
    Biz.ContasReceber, Dal.CondicaoConsulta, Dal.FabricaSQL;

{ TOrcamento }

{$REGION 'M�todos CRUD'}

function TOrcamento.Inserir: boolean;
var
    fabrica: TFabricaSql;
    query: WideString;
    parametros:TParametro;
    item: TOrcamentoItens;
    pagto: TOrcamentoPagamento;
begin
    result := false;
    try
        try
            dao.IniciarTransacao;
            fabrica := TFabricaSQL.Create(Self);
            query := fabrica.GerarSqlInsercao;
            parametros := Self.ObjetoParaParametros(Insercao);
            Self.ObterNumeroOrcamento;

            dao.Inserir(query,parametros);


            for item in Self.OrcamentoItens do
                item.Inserir;

            for pagto in Self.OrcamentoPagamento do
                pagto.Inserir;

        except
            dao.ReverterTransacao;
            raise Exception.Create('Erro ao inserir or�amento');

        end;
        dao.ConfirmarTransacao;
        result := true;
    finally
        if fabrica <> nil then
            FreeAndNil(fabrica);

        if parametros <> nil then
            FreeAndNil(parametros);
    end;
end;

procedure TOrcamento.AddOrcamentoItem(Produto: TProduto; quantidade: double; TipoEntrega: string);
var
    item: TOrcamentoItens;
    idade, numeroTentativas: integer;
    tipoSeguro: string;
    numeroDeSerieHidrometro: string;
begin
    if not Produto.ProdutoAtivo then
        raise Exception.Create('Produto n�o esta ativo.');

    if Produto.PrecoAtualProduto = 0 then
        raise Exception.Create('Produto est� sem pre�o cadastrado.');

    if Produto.TipoProduto = tpCurso then
        raise Exception.Create('Produto do tipo Curso n�o validado.');

    if TipoEntregaPadrao = nil then
        raise Exception.Create('Erro ao pegar Local de entrega.');

    TipoEntrega := TipoEntregaPadrao.TipoEntrega;

    if Produto.ProdutoEmPromocao then
        Tlib.MensagemInformacao('O Produto..:' + Produto.Descricao + ' esta em Promo��o '#13 + #13 + 'Promo��o V�lida para o dia: ' +
          Produto.DataInicioPromocao + '   At�   ' + Produto.DataFimPromocao + #13 + #13 + 'De  R$: ' + FormatFloat('###,###,##0.00',
          Produto.PrecoTabelaProduto) + '   Por   R$:' + FormatFloat('###,###,##0.00', Produto.PrecoPromocao));

    if (Produto.TipoProduto <> tpNormal) and (Produto.ProdutoSobEncomenda) then
        raise Erro.Create('Tipo do produto ' + TConverteEnum<TTipoProduto>.ToString(Produto.TipoProduto) + ', n�o pode ser sob encomenda.',
          MSGInformacao);

    if (Produto.ProdutoLiberadoConferenciaFiscal = false) and (Produto.ProdutoSobEncomenda = false) then
        raise Exception.Create('Produto n�o conferido dados fiscais, contate o departamento de compras.');

    if (Produto.ProdutoLiberadoConferenciaFiscal = false) then
        TipoEntrega := 'PE';

    // validar futuramento pelo Tipo de Produto;
    if Produto.ProdutoHidrometro then
    begin
        numeroTentativas := 0;
        while (numeroTentativas <= 3) and (numeroDeSerieHidrometro = '') do
        begin
            Inc(numeroTentativas);
            numeroDeSerieHidrometro := Tlib.MensagemCaixaEntrada<string>('Este Produto tem Numero de S�r�e' + #13 +
              'utilizado pela Companhia de Abastecimento,'#13 + 'e deve constar na Nota Fiscal...'#13 + 'A s�rie � formada por letras e n�meros'#13 +
              'totalizando 10 caracteres. Exemplo.: A04F019082', 'Hidr�metro', mtString);

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
            raise Exception.Create('N�o � possivel inserir produto do tipo Hidr�metro sem n�mero de s�rie!');
        end;
    end;

    if not Produto.ValidarCaracteresInvalidosDescricao then
        raise Exception.Create('Caracteres inv�lidos.');

    if quantidade = 0 then
        quantidade := Produto.QtdMultiplaVenda;

    // verifica se o item j� foi adicionado somente para venda r�pida (Caixa).
    item := Self.ObterItem(Produto.codigo);
    if (item <> nil) then
    begin

        if (Produto.ProdutoHidrometro = false) and (Produto.ProdutoSelfColor = false) then
        begin
            TipoEntrega := SelecionarTipoEntrega(item).TipoEntrega;

            if TipoEntrega = '' then
                raise Exception.Create('Nenhum tipo de entrega selecionado');
        end;

    end;

    item := TOrcamentoItens.Create;
    // Obtem a filial
    item.Filial := Self.Filial_.Filial;
    item.Filial_ := Self.Filial_;

    item.CodigoProduto := Produto.codigo;
    item.DescricaoProduto := Produto.Descricao;
    item.quantidade := quantidade;
    item.PrecoTabela := Produto.PrecoAtualProduto;
    item.ValorUnitario := Produto.PrecoAtualProduto;

    item.Tabela := TabelaComissao.CodigoTabela; // trim(Self.Vendedor.TabelaComissao); // 'T1';
    item.UnidadeMedida := Produto.UnidadeMedidaEmbalagem;
    item.DataEmissao := Tlib.ObterDataAtual;

    // Obtem o numero do item do orcamento
    item.item := Tlib.ColocarZeroEsquerda(2, inttostr(FOrcamentoItens.Count + 1));

    Produto.CopiarPara(item.Produto);

    if Produto.ProdutoSelfColor then
    begin
        // REIS VERIFICAR
        // if Tlib.AbrirFormulario(TfrmCadSelfColor, acAlteracao, item) <> rfOK then
        exit;

        item.PrecoTabela := item.ValorUnitario;
    end;

    item.TipoEntrega := TipoEntrega;

    // item.TipoEntrega_ := Self.Filial_.ObterTipoEntrega(item.tipoEntrega);

    item.CustoGerencial := Produto.CustoGerencial;
    item.CodigoVendedor := Self.CodigoVendedor;
    item.Vendido := '';
    item.UsuarioSistema := TUsuarioLogado.ObterInstancia.Login;
    item.TipoVenda := Self.TipoDaVenda;

    if Produto.ProdutoHidrometro then
        item.FormulaSelfColor := numeroDeSerieHidrometro;

    UltimoItemAlterado := item;

    if not Self.Cliente.preenchido then
        Self.Cliente.Obter(Self.SequencialCliente, Self.CodigoCliente);

    item.CalcularPrecoEmTabela(TabelaComissao, TabelaComissaoQuantidadeParcelas, ObterTotalPrecoTabela, Self.ValorEntrada);

    { Preenche Campanha e/ou status produto }
    item.Campanha := '';
    item.Campanha := item.Produto.ProdutoEmCampanha_;
    if Produto.ProdutoEmPromocao then
        item.Campanha := item.Campanha + 'X/';
    if Produto.ProdutoForaLinha then
        item.Campanha := item.Campanha + 'F/';
    if Produto.ProdutoSobEncomenda then
        item.Campanha := item.Campanha + 'E/';

    item.PaiAlternativo := false;

    FOrcamentoItens.add(item);
    RatearValoresNosItens;

    { Limpar Condi��es de pagamento }
    { Somar Totais do Or�amento }
end;

procedure TOrcamento.AddOrcamentoItemPesquisandoProduto(Produto: String);
var
    prod: TProduto;
    resultado: TResultFilter;
    i: integer;
begin
    try
        prod := TProduto.Create;
        if StrToInt64Def(Produto, -1) <> -1 then
        begin
            // Pesquisa produto por codigo ou codigo de barras
            if prod.Obter(Produto) <> nil then
            begin
                // Venda direto no caixa n�o mostra produtos alternativos

                // Se selecionado produto sem pre�o, indica que usu�rio quer ver os produtos alternativos
                if prod.PrecoAtualProduto = 0 then
                begin
                    if Tlib.MensagemPergunta('Produto ' + prod.Descricao + ' esta sem pre�o'#13 + 'Deseja visualizar produtos alternativos',
                      'Produtos Alternativaos') = mrYes then
                    begin
                        if not Self.ObterUpSelling(prod) then
                            if not Self.ObterSimilares(prod) then
                                Tlib.MensagemInformacao('Este produto n�o possui produtos alternatinativos', 'Produtos Alternativos');
                    end;
                    exit;
                end;

                Self.AddOrcamentoItem(prod, 0);

                if not((Self.Filial_.UpSelling_) and (Self.ObterUpSelling(Self.UltimoItemAlterado))) then
                    if (Self.Filial_.Similar_) then
                        Self.ObterSimilares(Self.UltimoItemAlterado);

                if Self.Filial_.CrossSelling_ then
                    Self.ObterCrossSelling(Self.UltimoItemAlterado);

            end;
        end
        else
        begin
            resultado := prod.Listar(otSelect, True, Produto);
            if resultado.List.Count <> 0 then
            begin
                for i := 0 to resultado.List.Count - 1 do
                begin
                    prod := TProduto(resultado.List[i]);
                    try
                        if prod.PrecoAtualProduto = 0 then
                        begin
                            if Tlib.MensagemPergunta('Produto ' + prod.Descricao + ' esta sem pre�o'#13 + 'Deseja visualizar produtos alternativos',
                              'Produtos Alternativaos') = mrYes then
                            begin
                                if not Self.ObterUpSelling(prod) then
                                    if not Self.ObterSimilares(prod) then
                                        Tlib.MensagemInformacao('O produto ' + prod.Descricao + ' n�o possui produtos alternatinativos',
                                        'Produtos Alternativos');
                            end;

                            continue;
                        end;

                        Self.AddOrcamentoItem(prod, 0);

                        if not((Self.Filial_.UpSelling_) and (Self.ObterUpSelling(Self.UltimoItemAlterado))) then
                            if (Self.Filial_.Similar_) then
                                Self.ObterSimilares(Self.UltimoItemAlterado);

                        if Self.Filial_.CrossSelling_ then
                            Self.ObterCrossSelling(Self.UltimoItemAlterado);

                    except
                        on e: Exception do
                        begin
                            Tlib.MensagemErro('Erro ao inserir item', e.Message);
                        end;
                    end;
                end;
            end;
        end;
    finally
        if prod <> nil then
            FreeAndNil(prod);
    end;
end;

procedure TOrcamento.PopularVendedorAoOrcamento(Vendedor: TVendedor);
begin
    Vendedor.CopiarPara(Self.Vendedor);
    Self.CodigoVendedor := Vendedor.codigo;
    Self.NomeVendedor := Vendedor.NomeReduzido;
end;

procedure TOrcamento.PreencherTreeView(treeView: TTreeView);
var
    itemOrc: TOrcamentoItens;
    pai, filho: String;
begin
    treeView.Items.Clear;
    for itemOrc in Self.OrcamentoItens do
    begin
        if (itemOrc.PaiAlternativo) or (itemOrc.ProdutoPaiAlternativo <> nil) then
        begin
            filho := itemOrc.CodigoProduto + '-' + itemOrc.LocalEstoque + '-' + itemOrc.TipoEntrega_.TipoEntrega;

            pai := '';
            if itemOrc.ProdutoPaiAlternativo <> nil then
                pai := itemOrc.ProdutoPaiAlternativo.codigo + '-' + itemOrc.LocalEstoquePaiAlternativo + '-' +
                  itemOrc.TipoEntregaPaiAlternativo.TipoEntrega;

            AddTreeView(pai, filho, treeView);
        end;
    end;
end;

function TOrcamento.PreencheTreeViewDeletar(item: TOrcamentoItens; treeView: TTreeView): boolean;
begin
    treeView.Items.Clear;

    AddTreeView('', item.CodigoProduto + '-' + item.LocalEstoque + '-' + item.TipoEntrega_.TipoEntrega, treeView);

    AddTreeViewDeletar(item, treeView);
end;

procedure TOrcamento.PopularClienteAoOrcamento(Cliente: TCliente);
begin
    Cliente.CopiarPara(Self.Cliente);
    Self.CodigoCliente := Cliente.codigo;
    Self.NomeCliente := Cliente.Nome;
    Self.SequencialCliente := Cliente.Sequencial;
    Self.TipoCliente := Cliente.Tipo;
    Self.Endereco := Cliente.Endereco;
    Self.Bairro := Cliente.Bairro;
    Self.Cep := Cliente.Cep;
    Self.Municipio := Cliente.Municipio;
    Self.Estado := Cliente.Estado;
end;

procedure TOrcamento.AddOrcamentoItem(OrcamentoItens: TOrcamentoItens);
begin
    FOrcamentoItens.add(OrcamentoItens);
end;

procedure TOrcamento.AddOrcamentoPagto(OrcamentoPagto: TOrcamentoPagamento);
begin
    FOrcamentoPagamento.add(OrcamentoPagto);
end;

procedure TOrcamento.AddTreeView(pai, filho: String; treeView: TTreeView);
var
    tv, tvs, jatem: integer;
    tem: boolean;
begin
    if pai = '' then
    begin
        treeView.Items.AddChild(nil, filho);
    end
    else
    begin
        for tv := 0 to treeView.Items.Count - 1 do
        begin
            if treeView.Items.item[tv].Text = pai then
            begin
                tem := false;
                for jatem := 0 to treeView.Items.Count - 1 do
                    if treeView.Items.item[jatem].Text = filho then
                        tem := True;

                if tem = false then
                    treeView.Items.AddChild(treeView.Items.item[tv], filho);
            end;

            for tvs := 0 to treeView.Items.item[tv].Count - 1 do
                if treeView.Items.item[tv].item[tvs].Text = pai then
                begin
                    tem := false;
                    for jatem := 0 to treeView.Items.item[tv].Count - 1 do
                        if treeView.Items.item[tv].item[tvs].Text = filho then
                            tem := True;

                    if tem = false then
                        treeView.Items.AddChild(treeView.Items.item[tv].item[tvs], filho);
                end;
        end;
    end;
end;

function TOrcamento.AddTreeViewDeletar(item: TOrcamentoItens; treeView: TTreeView): boolean;
var
    index, i: integer;
    itemOrc: TOrcamentoItens;
    pai, filho: String;
begin
    result := false;
    i := 0;
    while i <= Self.OrcamentoItens.Count - 1 do
    begin
        itemOrc := Self.OrcamentoItens[i];

        if (itemOrc.LocalEstoquePaiAlternativo = item.LocalEstoque) and (itemOrc.ProdutoPaiAlternativo.codigo = item.CodigoProduto) and
          (itemOrc.TipoEntregaPaiAlternativo.TipoEntrega = item.TipoEntrega_.TipoEntrega) then
        begin
            pai := item.CodigoProduto + '-' + item.LocalEstoque + '-' + item.TipoEntrega_.TipoEntrega;
            filho := itemOrc.CodigoProduto + '-' + itemOrc.LocalEstoque + '-' + itemOrc.TipoEntrega_.TipoEntrega;
            AddTreeView(pai, filho, treeView);
            result := True;
            AddTreeViewDeletar(itemOrc, treeView);
        end;

        Inc(i);
    end;
    result := True;
end;

procedure TOrcamento.AdicionarCreditoCliente(credito: TCreditoCliente);
begin
    Self.FCreditosCliente.add(credito);
end;

function TOrcamento.Alterar: boolean;
var
    fabrica: TFabricaSql;
    query: WideString;
    parametros:TParametro;

    itemAlterar: TOrcamentoItens;
    pagtoAlterar: TOrcamentoPagamento;

    item: TOrcamentoItens;
    pagto: TOrcamentoPagamento;
begin
    result := false;
    try
        try
            dao.IniciarTransacao;
            fabrica := TFabricaSQL.Create(Self);
            query := fabrica.GerarSqlAlteracao;
            parametros := Self.ObjetoParaParametros(Alteracao);

            dao.Alterar(query,parametros);

            itemAlterar := TOrcamentoItens.Create;
            itemAlterar.ExcluirItensPorOrcamento(Self.Numero);

            pagtoAlterar := TOrcamentoPagamento.Create;
            pagtoAlterar.ExcluirCondicoesPagamentoPorOrcamento(Self.Numero);

            for item in Self.OrcamentoItens do
                item.Inserir;

            for pagto in Self.OrcamentoPagamento do
                pagto.Inserir;

        except
            dao.ReverterTransacao;
            raise Exception.Create('Erro ao alterar or�amento');

        end;
        dao.ConfirmarTransacao;
        result := true;
    finally
        if fabrica <> nil then
            FreeAndNil(fabrica);

        if parametros <> nil then
            FreeAndNil(parametros);

        if itemAlterar <> nil then
            FreeAndNil(itemAlterar);

        if pagtoAlterar <> nil then
            FreeAndNil(pagtoAlterar);
    end;
end;

procedure TOrcamento.AlterarParcelasDaMesmaCondicaoPagamento(condicaoPgto: TOrcamentoPagamento);
var
    condicao, primeiraCondicao: TOrcamentoPagamento;
    achou: boolean;
    i, j: integer;
    ultimaParcela: integer;
    alteraParcela: boolean;
begin
    if (condicaoPgto.formaPagamento = fpAVista) or (condicaoPgto.formaPagamento = fpCartaoDebito) then
        exit;

    for i := 0 to Self.ObterQuantidadeCondicaoPagamento - 1 do
    begin
        // acha a parcela alterada (passada por parametro)
        if FOrcamentoPagamento[i] = condicaoPgto then
        begin
            // acha a primeira parcela
            for j := i downto 0 do
            begin
                if StrToInt(Self.FOrcamentoPagamento[j].Parcela) = 1 then
                begin
                    primeiraCondicao := Self.FOrcamentoPagamento[j];
                    break;
                end;
            end;
        end;
    end;

    ultimaParcela := 1;
    alteraParcela := True;
    achou := false;

    for i := 0 to Self.ObterQuantidadeCondicaoPagamento - 1 do
    begin

        // acha a primeira parcela
        condicao := Self.FOrcamentoPagamento[i];
        if condicao = primeiraCondicao then
            achou := True;

        if achou then
        begin
            // verifica se esta parcela esta dentro do numero de parcelas da parcela alterada
            if (alteraParcela) then
            begin
                condicao.administradora := condicaoPgto.administradora;
                condicao.tipoCheque := condicaoPgto.tipoCheque;
                condicao.agenciaBanco := condicaoPgto.agenciaBanco;
                condicao.conta := condicaoPgto.conta;
                condicao.NomeCliente := condicaoPgto.NomeCliente;
                condicao.rg := condicaoPgto.rg;
                condicao.cgc := condicaoPgto.cgc;
                condicao.telefone := condicaoPgto.telefone;
                condicao.observacao := condicaoPgto.observacao;
                // condicao.ValorParcelaDedudizo := condicaoPgto.ValorParcelaDedudizo;
                // faz o calculo do valor deduzido pela taxa da administradora
                if condicaoPgto.Administradora_.preenchido then
                begin
                    condicaoPgto.Administradora_.CopiarPara(condicao.Administradora_);
                    condicao.ValorParcelaDedudizo := (condicao.ValorParcela - ((condicao.ValorParcela / 100) * condicao.Administradora_.Taxa));
                end;

                // somente cheque porque pra cada parcela de cheque pq cada cheque tem um n�mero espec�fico,
                /// esse campo guarda o numero do cartao de credito tbm
                if (condicaoPgto.formaPagamento <> fpCheque) then
                    condicao.NumeroDocumento := condicaoPgto.NumeroDocumento;

                condicao.NSUTef := condicaoPgto.NSUTef;
                condicao.NSUHost := condicaoPgto.NSUHost;
                condicao.Autorizacao := condicaoPgto.Autorizacao;

                ultimaParcela := StrToInt(condicao.Parcela);

                // verifico se a pr�xima parcela pode ser alterada
                alteraParcela := false;
                if i < Self.ObterQuantidadeCondicaoPagamento - 1 then
                    if StrToInt(Self.FOrcamentoPagamento[i + 1].Parcela) <> 1 then
                        alteraParcela := True;

            end
            else
                break;

        end;
    end;
end;

procedure TOrcamento.BloquearOrcamento;
begin
    Self.TipoOrcamento := '3-BLO';
    Self.Alterar;
end;

procedure TOrcamento.CancelarCondicaoPagamento(formaPg: TFormaPagamento; administradora, sequenciamentoCartao: string);
var
    index: integer;
begin
    index := 0;
    for index := 0 to Self.OrcamentoPagamento.Count - 1 do
    begin
        if (Self.OrcamentoPagamento[index].formaPagamento = formaPg) and (Self.OrcamentoPagamento[index].administradora = administradora) and
          (Self.OrcamentoPagamento[index].sequenciamentoCartao = sequenciamentoCartao) then
        begin
            Self.OrcamentoPagamento.Delete(Self.OrcamentoPagamento[index]);
            CancelarCondicaoPagamento(formaPg, administradora, sequenciamentoCartao);
            break;
        end;
    end;
end;

function TOrcamento.Consultar(parametros: TParametro): TLista<TOrcamento>;
var
    query: TStringBuilder;
    condicao: TCondicaoConsulta;
    camposPadrao: TStringList;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('Z3_FILIAL', ccIgual, lgAND);
        condicao.Adiciona('Z3_NUM', ccIgual, lgAND);
        condicao.Adiciona('Z3_VEND', ccIgual, lgAND);
        condicao.Adiciona('Z3_NOMVDO', ccIgual, lgAND);
        condicao.Adiciona('Z3_CLIENTE', ccIgual, lgAND);
        condicao.Adiciona('Z3_ORCLIB', ccIgual, lgAND);
        condicao.Adiciona('Z3_EMISSAO', ccIgual, lgAND);
        condicao.Adiciona('Z3_TIPOCLI', ccIgual, lgAND);
        condicao.Adiciona('Z3_VLRTOT', ccIgual, lgAND);
        condicao.Adiciona('Z3_DESCONT', ccIgual, lgAND);
        condicao.Adiciona('Z3_VLRLIQ', ccIgual, lgAND);
        condicao.Adiciona('Z3_DTLIM', ccIgual, lgAND);
        condicao.Adiciona('Z3_DOCTD', ccIgual, lgAND);
        condicao.Adiciona('Z3_SERTD', ccIgual, lgAND);
        condicao.Adiciona('Z3_PDV', ccIgual, lgAND);
        condicao.Adiciona('Z3_EMISNF', ccIgual, lgAND);
        condicao.Adiciona('Z3_VALBRUT', ccIgual, lgAND);
        condicao.Adiciona('Z3_DESCNF', ccIgual, lgAND);
        condicao.Adiciona('Z3_DINHEIR', ccIgual, lgAND);
        condicao.Adiciona('Z3_CHEQUES', ccIgual, lgAND);
        condicao.Adiciona('Z3_CARTAO', ccIgual, lgAND);
        condicao.Adiciona('Z3_CONVENI', ccIgual, lgAND);
        condicao.Adiciona('Z3_FINANC', ccIgual, lgAND);
        condicao.Adiciona('Z3_VALICM', ccIgual, lgAND);
        condicao.Adiciona('Z3_VALIPI', ccIgual, lgAND);
        condicao.Adiciona('Z3_CONDPG', ccIgual, lgAND);
        condicao.Adiciona('Z3_FORMPG', ccIgual, lgAND);
        condicao.Adiciona('Z3_LOJA', ccIgual, lgAND);
        condicao.Adiciona('Z3_VENDTEF', ccIgual, lgAND);
        condicao.Adiciona('Z3_AUTSENH', ccIgual, lgAND);
        condicao.Adiciona('Z3_OBS1', ccIgual, lgAND);
        condicao.Adiciona('Z3_OBS2', ccIgual, lgAND);
        condicao.Adiciona('Z3_DTCAD', ccIgual, lgAND);
        condicao.Adiciona('Z3_CODTRAN', ccIgual, lgAND);
        condicao.Adiciona('Z3_LOJTRAN', ccIgual, lgAND);
        condicao.Adiciona('Z3_TIPFRET', ccIgual, lgAND);
        condicao.Adiciona('Z3_ENDENT', ccIgual, lgAND);
        condicao.Adiciona('Z3_BAIRROE', ccIgual, lgAND);
        condicao.Adiciona('Z3_CEPE', ccIgual, lgAND);
        condicao.Adiciona('Z3_MUNE', ccIgual, lgAND);
        condicao.Adiciona('Z3_ESTE', ccIgual, lgAND);
        condicao.Adiciona('Z3_FRETE', ccIgual, lgAND);
        condicao.Adiciona('Z3_SEGURO', ccIgual, lgAND);
        condicao.Adiciona('Z3_DESPESA', ccIgual, lgAND);
        condicao.Adiciona('Z3_PLIQUI', ccIgual, lgAND);
        condicao.Adiciona('Z3_PBRUTO', ccIgual, lgAND);
        condicao.Adiciona('Z3_VOLUME', ccIgual, lgAND);
        condicao.Adiciona('Z3_ESPECIE', ccIgual, lgAND);
        condicao.Adiciona('Z3_USERID', ccIgual, lgAND);
        condicao.Adiciona('Z3_DOCORIG', ccIgual, lgAND);
        condicao.Adiciona('Z3_TIPOVEN', ccIgual, lgAND);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAND);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAND);
        condicao.Adiciona('R_E_C_D_E_L_', ccIgual, lgAND);
        condicao.Adiciona('Z3_ICMSRET', ccIgual, lgAND);
        condicao.Adiciona('Z3_OPERADO', ccIgual, lgAND);
        condicao.Adiciona('Z3_OPERACA', ccIgual, lgAND);
        condicao.Adiciona('Z3_ENTREG', ccIgual, lgAND);
        condicao.Adiciona('Z3_TDNOMCL', ccLike, lgAND);
        condicao.Adiciona('Z3_TDNUME', ccIgual, lgAND);
        condicao.Adiciona('Z3_TDSTPED', ccIgual, lgAND);
        condicao.Adiciona('Z3_TDFLAG', ccIgual, lgAND);
        condicao.Adiciona('Z3_STATUS', ccIgual, lgAND);
        condicao.Adiciona('Z3_VLRDEBI', ccIgual, lgAND);
        condicao.Adiciona('Z3_CONFVEN', ccIgual, lgAND);
        condicao.Adiciona('Z3_VALMERC', ccIgual, lgAND);
        condicao.Adiciona('Z3_VLRFRE', ccIgual, lgAND);
        condicao.Adiciona('Z3_VERSAO', ccIgual, lgAND);

        camposPadrao := Self.ObterListaDeCampos(Consulta, []);

        query := TStringBuilder.Create;
        query.Append('SELECT ');
        query.Append(camposPadrao.ToString);
        query.Append(' FROM ').Append(Self.TabelaReferencia);
        query.Append(' WHERE D_E_L_E_T_ = '''' ');
        query.Append(condicao.ToString(True));
        query.Append(' ORDER BY R_E_C_N_O_ DESC');

        result := dao.Consultar(query.ToString, parametros);
    finally
        if condicao <> nil then
            FreeAndNil(condicao);

        if query <> nil then
            FreeAndNil(query)
    end;

end;

function TOrcamento.ConsultarCreditosCliente: boolean;
var
    contasReceberCliente: TLista<TContasReceber>;
    contaReceber: TContasReceber;
    CreditoCliente: TCreditoCliente;
    valorRestante: double;
    i: integer;
begin
    result := false;
    if Cliente.VerificarClientePadrao then
        raise Erro.Create('N�o � permitido esta forma de pagamento para este cliente!');;

    valorRestante := ObterValorRestanteParaPagamento;

    contasReceberCliente := TContasReceber.ListarCreditoPendente(Self.SequencialCliente, Self.CodigoCliente);

    i := 0;

    for contaReceber in contasReceberCliente do
    begin
        if valorRestante > 0 then
        begin
            Inc(i);

            CreditoCliente := TCreditoCliente.Create;

            CreditoCliente.Filial := Self.Filial;
            CreditoCliente.PrefixoNCC := contaReceber.Prefixo;
            CreditoCliente.NumeroNCC := contaReceber.Numero;
            CreditoCliente.ParcelaNCC := contaReceber.Parcela;
            CreditoCliente.TipoNCC := contaReceber.Tipo;
            CreditoCliente.ClienteNCC := contaReceber.CodigoCliente;
            CreditoCliente.SequencialNCC := contaReceber.SequencialCliente;
            CreditoCliente.FilialNCC := contaReceber.CodigoFilial;
            // creditoCliente.NumeroOrcamento
            if valorRestante > contaReceber.ValorDisponivel then
            begin
                CreditoCliente.Valor := contaReceber.ValorDisponivel;
                valorRestante := (valorRestante - contaReceber.ValorDisponivel);
            end
            else
            begin
                CreditoCliente.Valor := valorRestante;
                valorRestante := 0;
            end;

            CreditoCliente.Status := contaReceber.StatusLiberacaoDeCredito;
            // creditoCliente.Data
            // creditoCliente.Usuario
            // creditoCliente.DataCancelamento
            // creditoCliente.UsuarioCancelamento
            // creditoCliente.MotivoCancelamento
            // creditoCliente.Delete
            // creditoCliente.Recno
            // creditoCliente.SaldoPendenteCompensar
            // creditoCliente.PrefixoOrc
            // creditoCliente.ParcelaOrc
            // creditoCliente.ClienteOrc
            // creditoCliente.SequencialOrc
            // creditoCliente.TipoOrc
            // creditoCliente.DocumentoOrigem
            // creditoCliente.RecnoDaSZ9
            CreditoCliente.NomeCliente := contaReceber.NomeCliente;
            CreditoCliente.SaldoNCC := contaReceber.SaldoDevedor;
            CreditoCliente.ValorReservado := contaReceber.ValorReservado;
            CreditoCliente.ValorDisponivel := contaReceber.ValorDisponivel;
            CreditoCliente.ValorNCC := contaReceber.Valor;
            CreditoCliente.EmissaoNCC := contaReceber.DataEmissao;
            CreditoCliente.formaPagamento := 'TDC';
            CreditoCliente.Sequenciamento := i;

            AdicionarCreditoCliente(CreditoCliente);

            result := True;
        end;
    end;
end;

procedure TOrcamento.CopiarPara(objeto: TObject);
var
    item, novoItem: TOrcamentoItens;
    pagto, novoPagto: TOrcamentoPagamento;
    orc, novoOrc: TOrcamento;
begin
    inherited;

    if Self.Vendedor.preenchido then
        Self.Vendedor.CopiarPara(TOrcamento(objeto).Vendedor);

    if Self.CopiaCompleta then
    begin
        // Self.OrcamentoItens.CopyTo(TOrcamento(objeto).OrcamentoItens);
        // Self.OrcamentoPagamento.CopyTo(TOrcamento(objeto).OrcamentoPagamento);

        for item in OrcamentoItens do
        begin
            novoItem := TOrcamentoItens.Create;
            item.CopiarPara(novoItem);
            TOrcamento(objeto).AddOrcamentoItem(novoItem);
        end;

        for pagto in OrcamentoPagamento do
        begin
            novoPagto := TOrcamentoPagamento.Create;
            pagto.CopiarPara(novoPagto);
            TOrcamento(objeto).AddOrcamentoPagto(novoPagto);
        end;
    end
    else
        // caso a copia nao seja completa eu zero os totais, j� que ser� uma c�pia somente do cabe�alho do orcamento;
        TOrcamento(objeto).ZerarTotais;

end;

constructor TOrcamento.Create;
begin
    Self.Create(tvVendaBalcao)
end;

procedure TOrcamento.ZerarPrecoEmTabela;
var
    item: TOrcamentoItens;
begin
    for item in OrcamentoItens do
    begin
        item.ValorUnitario := item.PrecoTabela;
    end;
end;

function TOrcamento.ZerarRateioValoresNosItens(nomeCampoParaRateio: String): boolean;
var
    item: TOrcamentoItens;
begin
    try
        for item in Self.OrcamentoItens do
            item.SetarValorPorNomePropriedade(nomeCampoParaRateio, '0');
    finally

    end;
end;

procedure TOrcamento.ZerarTotais;
begin
    Self.FValorDespesa := 0;
    Self.FValorSeguro := 0;
    Self.FValorFrete := 0;
    Self.FValorIcms := 0;
    Self.FValorBruto := 0;
    Self.FValorDesconto := 0;
    Self.FValorSubstituicao := 0;
    Self.FValorMercadoria := 0;
    Self.FValorPromocao := 0;

    Self.FPesoBruto := 0;
    Self.FPesoLiquido := 0;

    Self.FValorDescontoTotalNegociado := 0;
    Self.FValorAcrescimosTotalNegociado := 0;
end;

constructor TOrcamento.Create(tipoVda: TTipoVenda);
begin
    FOrcamentoItens := TLista<TOrcamentoItens>.Create;
    FOrcamentoPagamento := TLista<TOrcamentoPagamento>.Create;
    FCreditosCliente := TLista<TCreditoCliente>.Create;
    FVendedor := TVendedor.Create;
    FCliente := TCliente.Create;

    // como padr�o colocamos a filial do usu�rio logado
    FFilial_ := TFilial.Create;
    TUsuarioLogado.ObterInstancia.Filial.CopiarPara(Self.Filial_);
    Self.Filial_.ObterListaTipoEntrega(tipoVda);

    CopiaCompleta := True;
    Self.TipoVenda := tipoVda;
end;

function TOrcamento.Deletar: boolean;
var
    fabrica: TFabricaSql;
    query: WideString;
    parametros:TParametro;

    item: TOrcamentoItens;
    pagto: TOrcamentoPagamento;
begin
    result := false;
    try
        try
            dao.IniciarTransacao;
            fabrica := TFabricaSQL.Create(Self);
            query := fabrica.GerarSqlExclusao;
            parametros := Self.ObjetoParaParametros(Exclusao);

            dao.Excluir(query,parametros);

            for item in Self.OrcamentoItens do
                item.Excluir;

            for pagto in Self.OrcamentoPagamento do
                pagto.Excluir;

        except
            dao.ReverterTransacao;
            raise Exception.Create('Erro ao alterar or�amento');

        end;
        dao.ConfirmarTransacao;
        result := true;
    finally
        if fabrica <> nil then
            FreeAndNil(fabrica);

        if parametros <> nil then
            FreeAndNil(parametros);
    end;end;

function TOrcamento.DeletarOrcamentoItem(item: TOrcamentoItens; mostraMensagem: boolean): boolean;
var
    index, i: integer;
    itemOrc: TOrcamentoItens;
    deletarFilhos: boolean;
begin
    result := false;
    deletarFilhos := True;
    i := 0;

    if (mostraMensagem) then
    begin
        Self.MostrarArvoreProdutosAlternativos(item);

        if (Tlib.MensagemPergunta('Confirma a exclus�o dos itens filhos?', 'Confirma��o') = mrNo) then
            deletarFilhos := false;
    end;

    if deletarFilhos then
    begin
        while i <= Self.OrcamentoItens.Count - 1 do
        begin
            itemOrc := Self.OrcamentoItens[i];

            if (itemOrc.LocalEstoquePaiAlternativo = item.LocalEstoque) and (itemOrc.ProdutoPaiAlternativo.codigo = item.CodigoProduto) and
              (itemOrc.TipoEntregaPaiAlternativo.TipoEntrega = item.TipoEntrega_.TipoEntrega) then
            begin
                if Self.DeletarOrcamentoItem(itemOrc) then
                begin
                    i := 0;
                    continue;
                end;
            end;

            Inc(i);
        end;
    end
    else
        Self.AtualizarFilhosCrossSelling(nil, item);

    index := Self.OrcamentoItens.IndexOf(item);
    Self.OrcamentoItens.Delete(item);

    result := True;

    // reorganiza os itens
    i := 1;
    for itemOrc in Self.OrcamentoItens do
    begin
        itemOrc.item := Tlib.ColocarZeroEsquerda(2, inttostr(i));
        Inc(i);
    end;
end;

destructor TOrcamento.Destroy;
begin
    if FOrcamentoItens <> nil then
        FreeAndNil(FOrcamentoItens);

    if FOrcamentoPagamento <> nil then
        FreeAndNil(FOrcamentoPagamento);

    if FVendedor <> nil then
        FreeAndNil(FVendedor);

    if FCliente <> nil then
        FreeAndNil(FCliente);

    if FFilial_ <> nil then
        FreeAndNil(FFilial_);

    if FOrcamentoConferencia <> nil then
        FreeAndNil(FOrcamentoConferencia);

    if FCreditosCliente <> nil then
        FreeAndNil(FCreditosCliente);

    inherited;
end;



procedure TOrcamento.EnviarParaCaixa;
begin
// gerar Z80
end;

procedure TOrcamento.ExcluirCondicoesPagamento;
begin

end;

procedure TOrcamento.ExcluirItens;
begin

end;

function TOrcamento.GerarParcelas(formaPagamento_GP: TFormaPagamento; administradora_GP: TAdministradora; valorTotal_GP: double;
  quantidadeParcelas_GP: integer; primeiraDataVcto_GP: string; tipoGeracaoParcela_GP: TTipoGeracaoParcela; dias_GP, intervalo_GP: integer;
  tipoCheque_GP, agenciaBanco_GP, conta_GP, numeroDocumento_GP, nomeCliente_GP, rg_GP, cgc_GP, telefone_GP, observacao_GP: string): boolean;
var
    // i: integer;
    condicaoPgto: TOrcamentoPagamento;
    ValorParcela: double;
    /// /    OrcamentoPagamento: TOrcamentoPagamento;
    administradoraDescricao: string;
    // quantidadeZeros: integer;
    ultimaSequenciaCartao: integer;
    temDP, temOutrasFormasDepagamento: boolean;
begin
    result := True;

    ultimaSequenciaCartao := 0;

    if administradora_GP = nil then
        administradoraDescricao := ''
    else
        administradoraDescricao := administradora_GP.Descricao;

    { Verifica quantidade maxima por forma de pagamento }
    if (administradora_GP <> nil) and (administradora_GP.QuantidadeParcelasMaxima < quantidadeParcelas_GP) then
    begin
        Tlib.MensagemErro('Erro ao gerar condi��o de pagamento', 'N�o � poss�vel gerar parcelas maior que ' +
          inttostr(administradora_GP.QuantidadeParcelasMaxima) + 'x ', 'Erro');
        result := false;
        exit;
    end;

    { Verifica se foi selecionado uma tabela de comiss�o, e se a quantidade de parcelas � igual a quantidade seleniona na tabela de comiss�o }
    if (Self.TabelaComissao <> nil) and (Self.TabelaComissao.CodigoTabela <> 'T1') then
    begin
        if ((Self.TabelaComissaoQuantidadeParcelas - Self.ObterQuantidadeCondicaoPagamento) <> quantidadeParcelas_GP) then
        begin
            Tlib.MensagemErro('Erro ao gerar condi��o de pagamento', 'N�o � poss�vel gerar parcelas diferente a ' +
              inttostr((Self.TabelaComissaoQuantidadeParcelas - Self.ObterQuantidadeCondicaoPagamento)) + 'x ', 'Erro');
            result := false;
            exit;
        end;
    end;

    // Verifica se pode gerar mais parcelas.
    if Self.ObterValorTotalTodasCondicoesPagamento >= Self.ValorLiquido then
    begin
        Tlib.MensagemErro('Erro ao gerar condi��o de pagamento', 'N�o � poss�vel mais gerar condi��es de pagamento', 'Erro');
        result := false;
        exit;
    end;

    // Valida data primeiro vencimento
    if primeiraDataVcto_GP = EmptyStr then
    begin
        Tlib.MensagemAdvertencia('Data do Primeiro vencimento obrigat�rio.', 'Aviso');
        result := false;
        exit;
    end;

    // valida valores obrigatorios para cheque
    if formaPagamento_GP = fpCheque then
    begin
        if (tipoCheque_GP = EmptyStr) or (agenciaBanco_GP = EmptyStr) or (conta_GP = EmptyStr) then
        begin
            Tlib.MensagemAdvertencia('Informa��es dos cheques s�o obrigat�rias.', 'Aviso');
            result := false;
            exit;
        end;
    end;

    // Valida Condi��es extras para cliente padr�o.
    if (formaPagamento_GP = fpDuplicata) or (formaPagamento_GP = fpCheque) or (formaPagamento_GP = fpFinanciamento) then
    begin
        if Self.CodigoCliente = Self.Cliente.CodigoClientePadrao then
        begin
            Tlib.MensagemAdvertencia('N�o � permitido a gera��o de venda com cheque, duplicata ou financiado para consumidor final.', 'Aviso');
            result := false;
            exit;
        end;
    end;

    // Verifica se ja existe a condi��o de pagamento
    // Condi��es que s� podem ser incluidas uma vez
    if (formaPagamento_GP in [fpAVista, fpFinanciamento, fpDuplicata, fpCompesacaoCreditoTDC, fpExclusivoTDE, fpPrivativoTDP]) then
    begin
        for condicaoPgto in Self.OrcamentoPagamento do
        begin
            if condicaoPgto.formaPagamento = formaPagamento_GP then
            begin
                Tlib.MensagemAdvertencia('Forma existe esta forma de pagamento.', 'Aviso');
                result := false;
                exit;
            end;
        end;
    end
    // Condi��es que podem ser incluidas mais de uma vez
    else if (formaPagamento_GP <> fpCheque) then
    begin
        // Verifca se tem todas as administradora ou banco e as inclui
        for condicaoPgto in Self.OrcamentoPagamento do
        begin
            if not(condicaoPgto.formaPagamento in [fpCartaoCredito, fpCartaoDebito]) then
            begin
                if (condicaoPgto.formaPagamento = formaPagamento_GP) and (condicaoPgto.administradora = administradoraDescricao) then
                begin
                    Tlib.MensagemAdvertencia('Administradora ou banco existente para esta forma de pagamento!!!', 'Aviso');
                    result := false;
                    exit;
                end;
            end
            else
                ultimaSequenciaCartao := StrToIntDef(condicaoPgto.sequenciamentoCartao, 0);
        end;
    end;

    ValorParcela := RoundTo((ValorTotal / quantidadeParcelas_GP), -2);

    if formaPagamento_GP <> fpCompesacaoCreditoTDC then
    begin
        if not GerarParcelasOutros(quantidadeParcelas_GP, dias_GP, intervalo_GP, ultimaSequenciaCartao, tipoGeracaoParcela_GP, formaPagamento_GP,
          primeiraDataVcto_GP, administradoraDescricao, tipoCheque_GP, agenciaBanco_GP, conta_GP, rg_GP, cgc_GP, telefone_GP, observacao_GP,
          NumeroDocumento, NomeCliente, ValorParcela, valorTotal_GP) then
        begin
            result := false;
            exit;
        end;
    end
    else
    begin
        if not GerarParcelasTDC(primeiraDataVcto_GP, administradoraDescricao, formaPagamento_GP) then
        begin
            result := false;
            exit;
        end;
    end;

    { Forma de pagamento em Duplicata DP, n�o � permitido informar outras formas de pagamento,
      com exce��o de TDC }
    temDP := false;
    temOutrasFormasDepagamento := false;
    for condicaoPgto in Self.OrcamentoPagamento do
    begin
        if condicaoPgto.FormaPagamento_ = 'DP' then
            temDP := True
        else if condicaoPgto.FormaPagamento_ <> 'TDC' then
            temOutrasFormasDepagamento := True;
    end;
    if (temDP) and (temOutrasFormasDepagamento) then
    begin
        result := false;
        Self.LimparCondicoesPagamento;
        Tlib.MensagemInformacao('N�o � permitido duplicata com outras formas de pagamento');
        exit;
    end;
end;

function TOrcamento.GerarParcelas(formaPagamento_GP: TFormaPagamento; administradora_GP: TAdministradora; valorTotal_GP: double;
  quantidadeParcelas_GP: integer; primeiraDataVcto_GP: string; tipoGeracaoParcela_GP: TTipoGeracaoParcela; dias_GP, intervalo_GP: integer): boolean;
begin
    result := Self.GerarParcelas(formaPagamento_GP, administradora_GP, valorTotal_GP, quantidadeParcelas_GP, primeiraDataVcto_GP,
      tipoGeracaoParcela_GP, dias_GP, intervalo_GP, EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr);
end;

function TOrcamento.GerarParcelasOutros(quantidadeParcelas_GP, dias_GP, intervalo_GP, ultimaSequenciaCartao_GP: integer;
  tipoGeracaoParcela_GP: TTipoGeracaoParcela; formaPagamento_GP: TFormaPagamento; primeiraDataVcto_GP, administradoraDescricao_GP, tipoCheque_GP,
  agenciaBanco_GP, conta_GP, rg_GP, cgc_GP, telefone_GP, observacao_GP, numeroDocumento_GP, nomeCliente_GP: String;
  valorParcela_GP, valorTotalRestante_GP: double): boolean;
var
    i, tamanhoNumeroDocumento, doc: integer;
    OrcamentoPagamento: TOrcamentoPagamento;
    documento, dataPagamento: string;
begin
    result := false;
    dataPagamento := primeiraDataVcto_GP;

    for i := 1 to quantidadeParcelas_GP do
    begin
        if quantidadeParcelas_GP > 1 then
        begin
            // Valida data pagamento
            if i > 1 then
            begin
                dias_GP := Tlib.IfTernario((tipoGeracaoParcela_GP = tgIntervalo) and (formaPagamento_GP = fpCheque), intervalo_GP, dias_GP);

                dataPagamento := DateToStr(Tlib.IncrementaData(dataPagamento, dias_GP));

                // Verifica se o mes incrementado � igual ao mes anterior, se for incremente mais 1 dia
                if MonthOf(StrToDate(primeiraDataVcto_GP)) = MonthOf(StrToDate(dataPagamento)) then
                    dataPagamento := DateToStr(Tlib.IncrementaData(dataPagamento, 1));
            end;

            // Valida se � por vencimento  ou intervalo
            if tipoGeracaoParcela_GP <> tgNenhum then
            begin

                // Coloca o dia do vencimento no dia desejado
                dataPagamento := Tlib.ColocarZeroEsquerda(2, inttostr(intervalo_GP)) + copy(dataPagamento, 3, 8);

                // Decrementa Data
                while not Tlib.ValidaData(dataPagamento) do
                begin
                    dataPagamento := Tlib.ColocarZeroEsquerda(2, inttostr(intervalo_GP - 1)) + copy(dataPagamento, 3, 8);
                end;
            end;

            // Valida arredondamento das parcelas
            if i = quantidadeParcelas_GP then
                valorParcela_GP := valorParcela_GP + (valorTotalRestante_GP - (valorParcela_GP * quantidadeParcelas_GP));

        end
        else
        begin
            valorParcela_GP := valorTotalRestante_GP;
            dataPagamento := primeiraDataVcto_GP;
        end;

        OrcamentoPagamento := TOrcamentoPagamento.Create;

        OrcamentoPagamento.FormaPagamento_ := TOrcamentoPagamento.FormaPagamentoParaString(formaPagamento_GP);
        OrcamentoPagamento.administradora := administradoraDescricao_GP;
        OrcamentoPagamento.Vencimento := FormatDateTime('yyyymmdd', StrToDate(dataPagamento));
        OrcamentoPagamento.ValorParcela := valorParcela_GP;
        OrcamentoPagamento.Numero := ''; // TOrcamentoPagamento.ObtemValorParcela(i - 1);
        OrcamentoPagamento.tipoCheque := tipoCheque_GP;
        OrcamentoPagamento.agenciaBanco := agenciaBanco_GP;
        OrcamentoPagamento.conta := conta_GP;

        // incrementa o numero do documento
        if NumeroDocumento <> EmptyStr then
        begin
            if i > 1 then
            begin
                tamanhoNumeroDocumento := Length(documento);
                doc := StrToInt(NumeroDocumento);
                Inc(doc);
                NumeroDocumento := inttostr(doc);
                documento := Tlib.ColocarZeroEsquerda(tamanhoNumeroDocumento, NumeroDocumento);
            end
            else
                documento := NumeroDocumento;
        end;
        OrcamentoPagamento.Filial := TUsuarioLogado.ObterInstancia.Filial.Filial;
        OrcamentoPagamento.NumeroDocumento := documento;
        OrcamentoPagamento.NomeCliente := NomeCliente;
        OrcamentoPagamento.rg := rg_GP;
        OrcamentoPagamento.cgc := cgc_GP;
        OrcamentoPagamento.telefone := telefone_GP;
        OrcamentoPagamento.observacao := observacao_GP;
        OrcamentoPagamento.Parcela := Tlib.ColocarZeroEsquerda(3, inttostr(i));
        OrcamentoPagamento.sequenciamentoCartao := Tlib.IfTernario(formaPagamento_GP in [fpCartaoDebito, fpCartaoCredito],
          inttostr(ultimaSequenciaCartao_GP + 1), EmptyStr);
        OrcamentoPagamento.Usuario := TUsuarioLogado.ObterInstancia.Login;
        Self.OrcamentoPagamento.add(OrcamentoPagamento);
        result := True;
    end;
end;

function TOrcamento.GerarParcelasTDC(primeiraDataVcto_GP, administradoraDescricao_GP: string; formaPagamento_GP: TFormaPagamento): boolean;
var
    credito: TCreditoCliente;
    dataPagamento: String;
    OrcamentoPagamento: TOrcamentoPagamento;
    i: integer;
begin
    result := false;
    dataPagamento := primeiraDataVcto_GP;

    if CreditosCliente = nil then
    begin
        Tlib.MensagemInformacao('Nenhuma TDC - compensa��o foi selecionada!');
        exit;
    end;

    i := 0;
    for credito in CreditosCliente do
    begin
        Inc(i);

        OrcamentoPagamento := TOrcamentoPagamento.Create;

        OrcamentoPagamento.FormaPagamento_ := TOrcamentoPagamento.FormaPagamentoParaString(formaPagamento_GP);
        OrcamentoPagamento.administradora := administradoraDescricao_GP;
        OrcamentoPagamento.Vencimento := FormatDateTime('yyyymmdd', StrToDate(dataPagamento));
        OrcamentoPagamento.ValorParcela := credito.Valor;
        OrcamentoPagamento.Numero := ''; // TOrcamentoPagamento.ObtemValorParcela(i - 1);
        OrcamentoPagamento.tipoCheque := '';
        OrcamentoPagamento.agenciaBanco := '';
        OrcamentoPagamento.conta := '';
        OrcamentoPagamento.Filial := TUsuarioLogado.ObterInstancia.Filial.Filial;
        OrcamentoPagamento.NumeroDocumento := '';
        OrcamentoPagamento.NomeCliente := '';
        OrcamentoPagamento.rg := '';
        OrcamentoPagamento.cgc := '';
        OrcamentoPagamento.telefone := '';
        OrcamentoPagamento.observacao := '';
        OrcamentoPagamento.Parcela := Tlib.ColocarZeroEsquerda(3, inttostr(i));
        OrcamentoPagamento.sequenciamentoCartao := inttostr(credito.Sequenciamento);;
        OrcamentoPagamento.Usuario := TUsuarioLogado.ObterInstancia.Login;
        Self.OrcamentoPagamento.add(OrcamentoPagamento);

    end;
    result := True;
end;

function TOrcamento.GetCupomOuNotaFiscal: string;
begin
    result := Tlib.IfTernario((Self.TipoNotaFiscalMicrossiga = EmptyStr) or (Self.TipoNotaFiscalMicrossiga = '4'), 'C', 'N');
end;

function TOrcamento.GetOrcamentoComPrecoNegociado: boolean;
var
    item: TOrcamentoItens;
begin
    result := false;
    for item in OrcamentoItens do
    begin
        if (item.ValorUnitario <> item.PrecoTabela) then
        begin
            result := True;
            break;
        end;
    end;

end;

function TOrcamento.GetOrcamentoComProdutoSelf: boolean;
var
    item: TOrcamentoItens;
begin
    result := false;
    for item in OrcamentoItens do
    begin
        if (item.FormulaSelfColor <> EmptyStr) then
        begin
            result := True;
            break;
        end;
    end;
end;

function TOrcamento.GetOrcamentoComTabela: boolean;
var
    item: TOrcamentoItens;
begin
    result := false;
    for item in OrcamentoItens do
    begin
        if item.Tabela <> EmptyStr then
            if (item.Tabela <> 'T1') and (item.Tabela <> 'T3') then
            begin
                result := True;
                break;
            end;
    end;
end;

function TOrcamento.GetTipoDesconto: string;
begin
    if FTipoDesconto = EmptyStr then
        if Self.ValorDesconto > 0 then
            FTipoDesconto := '1'
        else
            FTipoDesconto := '';
    result := FTipoDesconto;
end;

function TOrcamento.GetTipoEntregaPadrao: TTipoEntrega;
begin
    if FTipoEntregaPadrao = nil then
    begin
        if Self.Filial_.TiposEntrega.Count = 0 then
            Self.Filial_.ObterListaTipoEntrega(Self.TipoVenda);

        FTipoEntregaPadrao := Self.Filial_.ObterTipoEntrega('LJ');
        if FTipoEntregaPadrao = nil then
            FTipoEntregaPadrao := Self.Filial_.ObterTipoEntrega('DL');
        if FTipoEntregaPadrao = nil then
            FTipoEntregaPadrao := Self.Filial_.ObterTipoEntrega('CD');

    end;

    result := FTipoEntregaPadrao;
end;

function TOrcamento.GetTipoVenda: TTipoVenda;
begin
    if TipoDaVenda = 'VN' then
        FTipoVenda := tvVendaBalcao
    else if TipoDaVenda = 'VF' then
        FTipoVenda := tvVendaFutura
    else
        FTipoVenda := tvOutrosTipos;

    result := FTipoVenda;
end;

function TOrcamento.GetValorBruto: double;
begin
    // if FValorBruto = 0 then
    // ObterTotaisOrcamento;

    result := FValorBruto
end;

function TOrcamento.GetValorDesconto: double;
begin
    // if FValorDesconto = 0 then
    // ObterTotaisOrcamento;

    result := FValorDesconto
end;

function TOrcamento.GetValorDespesa: double;
begin
    // if FValorDespesa = 0 then
    // ObterTotaisOrcamento;

    result := FValorDespesa;
end;

function TOrcamento.GetValorFrete: double;
begin
    // if FValorFrete = 0 then
    // ObterTotaisOrcamento;

    result := FValorFrete;
end;

function TOrcamento.GetValorIcms: double;
begin
    // if FValorIcms = 0 then
    // ObterTotaisOrcamento;

    result := FValorIcms;
end;

function TOrcamento.GetValorIpi: double;
begin
    // if FValorIpi = 0 then
    // ObterTotaisOrcamento;

    result := FValorIpi;
end;

function TOrcamento.GetValorLiquido: double;
begin
    // if FValorLiquido = 0 then
    // ObterTotaisOrcamento;

    result := FValorLiquido;
end;

function TOrcamento.GetValorMercadoria: double;
begin
    result := FValorMercadoria;
end;

function TOrcamento.GetValorSeguro: double;
begin
    if FValorSeguro = 0 then
        // ObterTotaisOrcamento;

        result := FValorSeguro;
end;

function TOrcamento.GetValorSubstituicao: double;
begin
    // if FValorSubstituicao = 0 then
    // ObterTotaisOrcamento;

    result := FValorSubstituicao;
end;

function TOrcamento.GetValorTotal: double;
begin
    // result := 0;
    // if FValorTotal = 0 then
    // ObterTotaisOrcamento;

    result := FValorTotal;
end;

function TOrcamento.GetVersaoSistema: string;
begin
    if trim(FVersaoSistema) = EmptyStr then
        FVersaoSistema := Tlib.ObterVersao;

    result := FVersaoSistema;
end;


procedure TOrcamento.LiberarOrcamento;
begin
    Self.TipoOrcamento := '1-LIB';
    Self.Alterar;
end;

procedure TOrcamento.LimparCondicoesPagamento;
begin
    FreeAndNil(FOrcamentoPagamento);
    FOrcamentoPagamento := TLista<TOrcamentoPagamento>.Create;

    FreeAndNil(FCreditosCliente);
    FCreditosCliente := TLista<TCreditoCliente>.Create;
    // self.OrcamentoPagamento.Clear;
end;

procedure TOrcamento.LimparItensDoOrcamento;
begin
    FreeAndNil(FOrcamentoItens);
    FOrcamentoItens := TLista<TOrcamentoItens>.Create;
    Self.ZerarTotais;
    // self.ObterTotaisOrcamento;
end;

procedure TOrcamento.MostrarArvoreProdutosAlternativos(item: TOrcamentoItens);
begin
    // frmArvoreProdutosAlternativos := TfrmArvoreProdutosAlternativos.Create(Application.MainForm);

    if item = nil then
        // frmArvoreProdutosAlternativos.lbTitulo.Caption := '�rvore Cross Selling'
    else
        // frmArvoreProdutosAlternativos.lbTitulo.Caption := 'Produto ' + item.produto.Descricao + ' tem Cross Selling';

        // ObterArvoreProdutosCrossSelling(item, frmArvoreProdutosAlternativos.TreeView1);
        // frmArvoreProdutosAlternativos.ShowModal;
        // FreeAndNil(frmArvoreProdutosAlternativos);
end;

function TOrcamento.Listar(tipoOperacao: TOparationTypes; multiSelect: boolean; paramentro: TParametro): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TOrcamento>;
    // parametro : TParametro;
    // lista:TLista<TOrcamento>
begin
    inherited;
    try
        filtro := TFilter<TOrcamento>.Create;
        filtro.ScreenName := 'Filtro de Orcamento';
        filtro.OperationType := tipoOperacao;
        filtro.multiSelect := multiSelect;
        filtro.FilterType := ftWithParameters;
        filtro.Task := 'ConsultarOrcamento';
        filtro.AddIndex(1, 'DataEmissao=Z3_EMISSAO,NomeCliente=Z3_TDNOMCL', 'Emiss�o + Nome do Cliente');
        filtro.AddIndex(1, 'Numero=Z3_NUM', 'Numero Or�amento');
        filtro.Parametro := paramentro;

{$REGION 'Campos de Filtro'}
        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Filial ';
        campoFiltro.Name := 'Filial ';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Numero';
        campoFiltro.Name := 'Numero';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'C�digo Vendedor';
        campoFiltro.Name := 'CodigoVendedor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Vendedor';
        campoFiltro.Name := 'NomeVendedor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Emiss�o';
        campoFiltro.Name := 'DataEmissao';
        campoFiltro.MaskTypes := mtDate;
        campoFiltro.GridSize := 60;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Cliente';
        campoFiltro.Name := 'NomeCliente';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Vlr. Total';
        campoFiltro.Name := 'ValorTotal';
        campoFiltro.MaskTypes := mtCurrency;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := ' ValorDesconto';
        campoFiltro.Name := 'ValorDesconto';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'ValorLiquido';
        campoFiltro.Name := 'ValorLiquido';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Caixa';
        campoFiltro.Name := 'CodigoPDV';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Tipo';
        campoFiltro.Name := 'TipoOrcamento';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 40;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

{$ENDREGION}
        result := filtro.Execute;
    finally
        // FreeAndNil(parametro);
        // lista.Destroy;
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
            PopularObjeto(Lista[0]);
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

procedure TOrcamento.ObterArvoreProdutosCrossSelling(item: TOrcamentoItens; treeView: TTreeView);
begin
    if item = nil then
        PreencherTreeView(treeView)
    else
        PreencheTreeViewDeletar(item, treeView);
end;

function TOrcamento.ObterCondicaoPagamentoComMaiorParcela: TOrcamentoPagamento;
var
    condPgto, maiorCondPgto: TOrcamentoPagamento;
    Parcela: integer;
begin
    maiorCondPgto := nil;
    for condPgto in Self.OrcamentoPagamento do
    begin
        if not condPgto.VerificarIgualdadeCondicaoPagamento(maiorCondPgto) then
            if Self.ObterTotalParcelas(condPgto) > Self.ObterTotalParcelas(maiorCondPgto) then
                maiorCondPgto := condPgto;
    end;
    result := maiorCondPgto;
end;

procedure TOrcamento.ObterCondicaoPagamentoOrcamento;
var
    Parametro: TParametro;
    condicaoPagto: TOrcamentoPagamento;
begin
    try
        Parametro := TParametro.Create;
        Parametro.add('', 'Z9_NUM', Self.Numero);

        condicaoPagto := TOrcamentoPagamento.Create;
        Self.FOrcamentoPagamento := condicaoPagto.Consultar(Parametro);
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);

        if condicaoPagto <> nil then
            FreeAndNil(condicaoPagto);
    end;
end;

function TOrcamento.ObterCrossSelling(item: TOrcamentoItens): boolean;
var
    resultado: TLista<TProduto>;
    Produto: TProduto;
begin
    result := false;

    resultado := item.Produto.ObterCrossSelling;

    if resultado <> nil then
    begin
        for Produto in resultado do
        begin
            Self.AddOrcamentoItem(Produto, 0);
            Self.UltimoItemAlterado.ProdutoPaiAlternativo := item.Produto;
            Self.UltimoItemAlterado.TipoEntregaPaiAlternativo := item.TipoEntrega_;
            Self.UltimoItemAlterado.LocalEstoquePaiAlternativo := item.LocalEstoque;
            item.PaiAlternativo := True;
        end;
        result := True;
    end;
end;

function TOrcamento.ObterItem(codigo: string; validaConferido: boolean; TipoEntrega: string): TOrcamentoItens;
var
    item: TOrcamentoItens;
    achou: boolean;
    aux: string;
    prod: TProduto;
    Count: integer;
    ResultFilter: TResultFilter;
begin
    result := nil;
    ResultFilter := nil;
    prod := nil;
    try
        if StrToInt64Def(codigo, -1) = -1 then
        begin
            aux := trim(StringReplace(codigo, '%', '', [rfReplaceAll]));
            if Length(aux) <= 3 then
                raise Exception.Create('Descri��o do produto precisa conter mais que 3 (tr�s) caracteres');

            Count := 0;
            for item in Self.OrcamentoItens do
            begin
                if not item.Produto.preenchido then
                    item.Produto.Obter(item.CodigoProduto);

                if Tlib.AcharSubTextosEmUmTexto(item.Produto.Descricao, codigo, '%') then
                begin
                    ResultFilter := item.Produto.Listar(otSelect, false, codigo);
                    if (Assigned(ResultFilter)) and (ResultFilter.List.Count > 0) then
                    begin
                        codigo := TProduto(ResultFilter.List[0]).codigo;
                        break;
                    end
                    else
                        exit;
                end;
            end;
        end;

        for item in Self.OrcamentoItens do
        begin
            if not item.Produto.preenchido then
                item.Produto.Obter(item.CodigoProduto);

            if (item.Produto.ChecarCodigoProduto(codigo) and ((validaConferido = false) or ((validaConferido) and (item.Conferido = false)))) and
              ((TipoEntrega = EmptyStr) or ((TipoEntrega <> EmptyStr) and (item.TipoEntrega = TipoEntrega))) then
            begin
                result := item;
                break;
            end;
        end;

    finally
        if prod <> nil then
            FreeAndNil(prod);

        if ResultFilter <> nil then
            FreeAndNil(ResultFilter)

    end;
end;

function TOrcamento.ObterItem(codigo: string): TOrcamentoItens;
begin
    result := ObterItem(codigo, false, '');
end;

function TOrcamento.ObterItem(codigo: string; validaConferido: boolean): TOrcamentoItens;
begin
    result := ObterItem(codigo, validaConferido, '');
end;

function TOrcamento.ObterItem(codigo, TipoEntrega: string): TOrcamentoItens;
begin
    result := ObterItem(codigo, false, TipoEntrega);
end;

procedure TOrcamento.ObterItensOrcamento;
var
    Parametro: TParametro;
    hi, hf: TDateTime;
    item, itemConsulta: TOrcamentoItens;
begin
    // hi := Now;
    try
        Parametro := TParametro.Create;
        Parametro.add('', 'Z6_NUM', Self.Numero);
        itemConsulta := TOrcamentoItens.Create;
        Self.FOrcamentoItens := itemConsulta.Consultar(Parametro);

        // atualizar filial
        if not Self.Filial_.preenchido then
            Self.Filial_.Obter(Self.Filial);

        for item in Self.FOrcamentoItens do
        begin
            item.Filial_ := Self.Filial_;
            // somente para atualizar o tipo de entrega_
            item.TipoEntrega := item.TipoEntrega;
        end;

        // hf := now;
        // showmessage(FormatDateTime('hh:mm:ss',hf-hi));
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);

        if itemConsulta <> nil then
            FreeAndNil(itemConsulta);
    end;
end;

procedure TOrcamento.ObterNumeroOrcamento;
var
    param: TParametro;
    item: TOrcamentoItens;
    pagto: TOrcamentoPagamento;
begin
    try
        try
            if Self.Filial = '' then
                raise Exception.Create('Filial n�o preenchida.');

            param := TParametro.Create;
            param.add('', '@Z88_FILIAL', Self.Filial);

            param := dao.ExecutarProc('GNSZ3_' + TUsuarioLogado.ObterInstancia.Filial.Empresa, param);
            Self.Numero := param.ObterValorParamentro('@Z88_NUMERO');

            if Self.ObterQuantidadeItens = 0 then
                raise Exception.Create('N�o existe itens de or�amento para preecher com o n�mero do or�amento');

            for item in Self.OrcamentoItens do
                item.Numero := Self.Numero;

            if Self.ObterQuantidadeCondicaoPagamento = 0 then
                raise Exception.Create('N�o existe condi��o de pagamento para preecher com o n�mero do or�amento');

            for pagto in Self.OrcamentoPagamento do
                pagto.Numero := Self.Numero;
        except
            on e: Exception do
                raise Exception.Create('Erro ao obter o n�mero do or�amento.' + #13 + e.Message);
        end;
    finally
        if param <> nil then
            FreeAndNil(param);
    end;
end;

function TOrcamento.ObterOrcamentoLoja: TOrcamento;
begin
    result := ObterOrcamentoFilhoPorTipo('8-EOK');
end;

function TOrcamento.ObterOrcamentoFilhoPorTipo(TipoOrcamento: string): TOrcamento;
var
    orcLoja: TOrcamento;
begin
    orcLoja := nil;
    result := orcLoja;
    if Self.OrcamentosFilhos <> nil then
    begin
        for orcLoja in Self.OrcamentosFilhos do
        begin
            if orcLoja.TipoOrcamento = TipoOrcamento then
            begin
                result := orcLoja;
                break;
            end;
        end;
    end;
end;

procedure TOrcamento.ObterOrcamentosFilhos;
var
    Parametro: TParametro;
begin
    try
        Parametro := TParametro.Create;
        Parametro.add('', 'Z3_DOCORIG', TUsuarioLogado.ObterInstancia.Filial.Filial + Self.Numero);
        FOrcamentosFilhos := Self.Consultar(Parametro)
    finally
        if Parametro <> nil then
            FreeAndNil(Parametro)
    end;
end;

function TOrcamento.ObterPesoTotalItens: double;
var
    item: TOrcamentoItens;
    totalPeso: double;
begin
    totalPeso := 0;
    for item in Self.OrcamentoItens do
    begin
        // este item foi criado para melhorar performace na finaliza��o da venda.
        if item.pesoItem <> 0 then
            totalPeso := totalPeso + (item.pesoItem * item.quantidade)
        else
        begin
            if not item.Produto.preenchido then
                item.Produto.Obter(item.CodigoProduto);

            totalPeso := totalPeso + (item.Produto.Peso * item.quantidade);
        end;
    end;
    result := totalPeso;
end;

function TOrcamento.ObterPrazoMedioDasCondicoesPagto: double;
var
    formaPgto: TOrcamentoPagamento;
    prazoMedio: double;
    dias: double;
    qtdCondicao: integer;
begin
    prazoMedio := 0;
    dias := 0;
    if Self.OrcamentoPagamento.Count > 0 then
    begin
        for formaPgto in Self.OrcamentoPagamento do
            if formaPgto.formaPagamento <> fpAVista then
                dias := dias + (Tlib.DataSistemaParaDateTime(Tlib.ObterDataAtual) - Tlib.DataSistemaParaDateTime(formaPgto.Vencimento));

        if dias > 0 then
            prazoMedio := dias / Self.OrcamentoPagamento.Count;
    end;

    result := prazoMedio;

end;

function TOrcamento.ObterQuantidadeItens: integer;
begin
    result := FOrcamentoItens.Count;
end;

function TOrcamento.ObterQuantidadeOrcamentoFilhos: integer;
begin
    result := FOrcamentosFilhos.Count;
end;

function TOrcamento.ObterSimilares(Produto: TProduto): boolean;
var
    resultado: TLista<TProduto>;
begin
    result := false;

    resultado := Produto.ObterSimilares;

    if resultado <> nil then
    begin
        if resultado.Count > 0 then
        begin
            Self.AddOrcamentoItem(resultado[0], 0);
            result := True;
        end;
    end;
end;

function TOrcamento.ObterSimilares(item: TOrcamentoItens): boolean;
var
    Produto: TProduto;
    resultado: TLista<TProduto>;
begin
    result := false;
    try
        resultado := item.Produto.ObterSimilares;

        if resultado <> nil then
        begin
            if resultado.Count > 0 then
            begin
                Produto := resultado[0];
                Self.AddOrcamentoItem(Produto, 0);
                Self.DeletarOrcamentoItem(item, item.PaiAlternativo);
                result := True;
            end;
        end;
    except
        on e: Exception do
        begin
            Tlib.MensagemErro('Erro ao adicionar produto Similar!', e.Message);
        end;
    end;
end;

procedure TOrcamento.ObterTotaisOrcamento;
var
    item: TOrcamentoItens;
    Valor: Currency;
begin
    ZerarTotais;
    for item in OrcamentoItens do
    begin
        Self.FValorDespesa := Self.ValorDespesa + item.ValorDespesa;
        Self.FValorSeguro := Self.ValorSeguro + item.ValorSeguro;
        Self.FValorFrete := Self.ValorFrete + item.ValorFrete;
        // Self.FValorIcms := Self.FValorIcms + item.ValorIcms;
        Self.FValorMercadoria := ValorMercadoria + item.ValorTotal;
        Self.FValorDesconto := Self.ValorDesconto + item.ValorDesconto;
        // estes itens tem que ser zerado pois n�o foi definido pela contabilidade se vai ser combrado do cliente ou n�o.
        Self.FValorSubstituicao := 0; // Self.FValorSubstituicao + item.ValorIcmsRetido;

        if item.EmPromocao then
            Self.FValorPromocao := Self.ValorPromocao + item.ValorTotal;

        Self.FValorIpi := 0;

        Valor := (item.PrecoTabela * item.quantidade) - (item.ValorUnitario * item.quantidade);

        if Valor > 0 then
            Self.FValorDescontoTotalNegociado := Self.FValorDescontoTotalNegociado + Valor
        else if Valor < 0 then
            Self.FValorAcrescimosTotalNegociado := Self.ValorAcrescimosTotalNegociado + (Valor * (-1));
    end;

    Self.FValorTotal := Self.ValorMercadoria + Self.ValorFrete + Self.ValorSeguro + Self.ValorDespesa;
    Self.FValorLiquido := (Self.ValorMercadoria - Self.ValorDesconto) + Self.ValorFrete + Self.ValorSeguro + Self.ValorDespesa;
    Self.FValorBruto := Self.ValorTotal;

    Self.FValorPagoDinheiro := Self.ObterValorTotalCondicaoPagamento(fpAVista);
    Self.FValorPagoCartaoCredito := Self.ObterValorTotalCondicaoPagamento(fpCartaoCredito);
    Self.FValorPagoCartaoDebito := Self.ObterValorTotalCondicaoPagamento(fpCartaoDebito);
    Self.FValorPagoCheque := Self.ObterValorTotalCondicaoPagamento(fpCheque);
    Self.FValorPagoFinan := Self.ObterValorTotalCondicaoPagamento(fpFinanciamento);
    Self.FValorPagoDuplicata := Self.ObterValorTotalCondicaoPagamento(fpDuplicata);

    Self.FPesoBruto := ObterPesoTotalItens;
    Self.FPesoLiquido := ObterPesoTotalItens;

    Self.ValorDescontoTotalNegociado := Self.ValorDescontoTotalNegociado + Self.ValorDesconto;
    Self.ValorAcrescimosTotalNegociado := Self.ValorAcrescimosTotalNegociado + Self.ValorDespesa;
end;

function TOrcamento.ObterQuantidadeTotalItens: double;
var
    item: TOrcamentoItens;
    totalQuantidade: double;
begin
    totalQuantidade := 0;
    for item in Self.OrcamentoItens do
        totalQuantidade := totalQuantidade + item.quantidade;

    result := totalQuantidade;
end;

function TOrcamento.ObterQuantidadeCondicaoPagamento: integer;
begin
    result := FOrcamentoPagamento.Count;
end;

function TOrcamento.ObterTotalPorTipoParaRateio(Tipo: String; var tiposDeEntrega: string): double;
var
    item: TOrcamentoItens;
    entrega, movimentoCD, vendaOutraLoja, resto: boolean;
    TiposEntrega, tiposMovimentoCD, tiposResto: String;
begin
    try
        result := 0;
        entrega := false;
        movimentoCD := false;
        vendaOutraLoja := false;
        resto := false;
        TiposEntrega := 'CD/EL/CE/LE';
        tiposMovimentoCD := 'PE/RC/TF';
        tiposResto := 'CS/' + TiposEntrega + '/' + tiposMovimentoCD;
        tiposDeEntrega := '';

        for item in Self.OrcamentoItens do
        begin
            if Tipo = 'ENTREGA' then
            begin
                if pos(item.TipoEntrega, TiposEntrega) > 0 then
                begin
                    result := result + item.ValorTotal;
                    tiposDeEntrega := tiposDeEntrega + '/' + item.TipoEntrega;
                    entrega := True;
                end;
            end
            else if Tipo = 'MOVCD' then
            begin
                if pos(item.TipoEntrega, tiposMovimentoCD) > 0 then
                begin
                    result := result + item.ValorTotal;
                    tiposDeEntrega := tiposDeEntrega + '/' + item.TipoEntrega;
                    movimentoCD := True;
                end;
            end
            else if Tipo = 'VOL' then
            begin
                if StrToIntDef(item.TipoEntrega, -1) > 0 then
                begin
                    result := result + item.ValorTotal;
                    tiposDeEntrega := tiposDeEntrega + '/' + item.TipoEntrega;
                    vendaOutraLoja := True;
                end;
            end
            else
            begin
                if (pos(item.TipoEntrega, tiposResto) = 0) and (StrToIntDef(item.TipoEntrega, -1) < 0) then
                begin
                    result := result + item.ValorTotal;
                    tiposDeEntrega := tiposDeEntrega + '/' + item.TipoEntrega;
                    resto := True;
                end;
            end;
        end;
    except
        result := 0;
        tiposDeEntrega := '';
    end;
end;

function TOrcamento.ObterTotalParcelas(condicaoPgto: TOrcamentoPagamento): integer;
var
    condicao: TOrcamentoPagamento;
    cont: integer;
begin
    cont := 0;
    for condicao in Self.OrcamentoPagamento do
    begin
        if condicao.VerificarIgualdadeCondicaoPagamento(condicaoPgto) then
        begin
            cont := cont + 1;
        end;
    end;
    result := cont;
end;

function TOrcamento.ObterTotalPrecoTabela: double;
var
    item: TOrcamentoItens;
begin
    result := 0;
    for item in OrcamentoItens do
    begin
        result := result + (item.quantidade * item.PrecoTabela);
    end;
end;

function TOrcamento.ObterTotalProdutosDiferenteDeCursoSeguro(var tipos: String): double;
var
    item: TOrcamentoItens;
begin
    try
        result := 0;
        tipos := '';
        for item in OrcamentoItens do
        begin
            if item.TipoEntrega <> 'CS' then
            begin
                result := result + item.ValorTotal;
                tipos := tipos + '/' + item.TipoEntrega;
            end;
        end;
    except
        result := 0;
    end;
end;

function TOrcamento.ObterUpSelling(Produto: TProduto): boolean;
var
    resultado: TLista<TProduto>;
begin
    result := false;

    resultado := Produto.ObterUpSelling;

    if resultado <> nil then
    begin
        if resultado.Count > 0 then
        begin
            Self.AddOrcamentoItem(resultado[0], 0);
            result := True;
        end;
    end;
end;

function TOrcamento.ObterUpSelling(item: TOrcamentoItens): boolean;
var
    Produto: TProduto;
    resultado: TLista<TProduto>;
begin
    result := false;
    try
        resultado := item.Produto.ObterUpSelling;

        if resultado <> nil then
        begin
            if resultado.Count > 0 then
            begin
                Produto := resultado[0];
                Self.AddOrcamentoItem(Produto, 0);
                Self.DeletarOrcamentoItem(item, item.PaiAlternativo);
                result := True;
            end;
        end;
    except
        on e: Exception do
        begin
            Tlib.MensagemErro('Erro ao adicionar produto Up Selling', e.Message);
        end;
    end;
end;

function TOrcamento.ObterValorTotalCondicaoPagamento(formaPg: TFormaPagamento; administradora, sequenciamentoCartao: string): double;
var
    formaPgto: TOrcamentoPagamento;
begin
    result := 0;
    for formaPgto in Self.OrcamentoPagamento do
    begin
        if (formaPgto.formaPagamento = formaPg) and
          ((formaPgto.administradora = administradora) and (formaPgto.sequenciamentoCartao = sequenciamentoCartao) or
          ((administradora = EmptyStr) and (sequenciamentoCartao = EmptyStr))) then
        begin
            result := result + formaPgto.ValorParcela;
        end;
    end;
end;

procedure TOrcamento.ObterValorParaRateio(var valorDosProduto: double; var tipos: String; tipoDoRateio: TTipoDeRateio);
begin
    valorDosProduto := 0;
    tipos := '';
    if tipoDoRateio = trDespesas then
    begin
        tipos := '';
        { Regra: 2.1.1. 9-ENT / 9-ENL / 9-ECD / 9-ECO: Priorizar as entregas feita pela todimo. }
        valorDosProduto := ObterTotalPorTipoParaRateio('ENTREGA', tipos);

        { 2.1.2. 9-PSE / 9-RCD / 9-TFF: Priorizar as modalidades que s�o movimentadas pelo CD }
        if valorDosProduto = 0 then
            valorDosProduto := ObterTotalPorTipoParaRateio('MOVCD', tipos);

        { 2.1.3. 9-VOL: Priorizar venda em outra loja. }
        if valorDosProduto = 0 then
            valorDosProduto := ObterTotalPorTipoParaRateio('VOL', tipos);

        { 2.1.4. Retear para todos os produtos. }
        if valorDosProduto = 0 then
            valorDosProduto := ObterTotalPorTipoParaRateio('RESTO', tipos);
    end
    else
    begin
        valorDosProduto := ObterTotalProdutosDiferenteDeCursoSeguro(tipos);
    end;
end;

function TOrcamento.ObterValorRestanteParaPagamento: double;
begin
    ObterTotaisOrcamento;
    result := (Self.ValorLiquido - ObterValorTotalTodasCondicoesPagamento);
end;

function TOrcamento.ObterValorTotalCondicaoPagamento(formaPg: TFormaPagamento): double;
begin
    result := Self.ObterValorTotalCondicaoPagamento(formaPg, EmptyStr, EmptyStr);
end;

function TOrcamento.ObterValorTotalCondicaoPagamento(condicaoPgto: TOrcamentoPagamento): double;
begin
    result := ObterValorTotalCondicaoPagamento(condicaoPgto.formaPagamento, condicaoPgto.administradora, condicaoPgto.sequenciamentoCartao);
end;

function TOrcamento.ObterValorTotalTodasCondicoesPagamento: double;
var
    formaPgto: TOrcamentoPagamento;
    total: double;
begin
    total := 0;
    for formaPgto in Self.OrcamentoPagamento do
        total := total + formaPgto.ValorParcela;

    result := total;
end;

function TOrcamento.Obter(ID: string): TOrcamento;
var
    parametros: TParametro;

begin
    try
        parametros := TParametro.Create;
        parametros.add('', 'Z3_NUM', ID);
        parametros.add('', 'Z3_FILIAL', TUsuarioLogado.ObterInstancia.Filial.Filial);
        result := Obter(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

{$ENDREGION}
{$REGION 'Regras de Neg�cio'}

procedure TOrcamento.PopularObjeto(Orcamento: TOrcamento);
begin
    Orcamento.CopiarPara(Self);
    FPreenchido := True;
end;

procedure TOrcamento.CalcularValorEntradaPagamento(valorRateio: double);
var
    valorMaximoEntrada: Currency;
begin
    try
        if (Self.ValorEntrada <> valorRateio) and (Self.TabelaComissao.CodigoTabela <> 'T1') then
        begin
            Self.ValorEntrada := valorRateio;
            { Valida o valor da entrada }
            if (TabelaComissao.PercentualMaximoEntrada > 0) and (Self.ValorLiquido > 0) then
            begin
                valorMaximoEntrada := (Self.ValorLiquido / 100) * TabelaComissao.PercentualMaximoEntrada;
                if valorRateio > valorMaximoEntrada then
                    raise Exception.Create('A entrada dever ser menor que ' + CurrToStr(TabelaComissao.PercentualMaximoEntrada) +
                      '% do valor total do or�amento');
            end;

            { Valida que a entrada n�o pode ser maior que valor do or�amento }
            if valorRateio >= Self.ValorLiquido then
                raise Exception.Create('A entrada dever ser menor que o valor total do or�amento');

            if TabelaComissao.CodigoTabela <> 'T1' then
            begin
                RecalcularPrecoEmTabelaComissao;
            end
            else
                Self.ValorEntrada := valorRateio;
            ObterTotaisOrcamento;
        end;
    except
        on e: Exception do
        begin
            raise Exception.Create('Erro ao ratear valor entrada'#13 + e.Message);
        end;
    end;
end;

procedure TOrcamento.RatearValoresNosItens(valorRateio: double; nomeCampoParaRateio: String; tipoDoRateio: TTipoDeRateio);
var
    coeficiente, valorProdutos, somaDosValoresRateados, diferenca, valorParaArredondamento, valorRateadoNoItem, Valor: double;
    tipos: String;
    estaCerto: boolean;
    item: TOrcamentoItens;
begin
{$REGION 'Regras para rateio'}
    {
      1. Regra principal:
      1.1. Produtos do tipo curso ou seguro, numca poder�o receber nenhum tipo de rateio.

      2. Rateio de Valor de Despesas
      2.1. Priorizar o rateio do valor da despesa para os tipos de entregas na seguinte ordem:
      2.1.1. 9-ENT / 9-ENL / 9-ECD / 9-ECO: Priorizar as entregas feita pela todimo.
      2.1.2. 9-PSE / 9-RCD / 9-TFF: Priorizar as modalidades que s�o movimentadas pelo CD
      2.1.3. 9-VOL: Priorizar venda em outra loja.
      2.1.4. Retear para todos os produtos.

      3. Demais valores rateados, obedecer a regra 1 e ratear para os demais produtos.
    }
{$ENDREGION}
    if Self.ObterQuantidadeItens <= 0 then
        exit;
    try
        if valorRateio = 0 then
        begin
            ZerarRateioValoresNosItens(nomeCampoParaRateio);
            if tipoDoRateio = trDesconto then
                Self.FPercDesconto := 0;
        end
        else
        begin

            ZerarRateioValoresNosItens(nomeCampoParaRateio);
            tipos := '';

            { Itens 1 e 3 das regras }
            if ObterTotalProdutosDiferenteDeCursoSeguro(tipos) > 0 then
            begin
                ObterValorParaRateio(valorProdutos, tipos, tipoDoRateio);

                if (valorProdutos > 0) and (tipos <> '') then
                begin
                    { Acha o coeficiente de desconto }
                    coeficiente := valorRateio / valorProdutos;

                    { Atualiza os itens }
                    for item in Self.OrcamentoItens do
                    begin
                        if pos(item.TipoEntrega, tipos) > 0 then
                        begin
                            Valor := Tlib.ArredondarNumero((item.ValorTotal * coeficiente));
                            item.SetarValorPorNomePropriedade(nomeCampoParaRateio, CurrToStr(Valor));
                        end;
                    end;

                    { Ajusta o valor rateado, at� a soma do rateio ficar igual ao valor digitado }
                    estaCerto := false;
                    while estaCerto = false do
                    begin
                        { Soma o valor rateado }
                        somaDosValoresRateados := 0;
                        for item in Self.OrcamentoItens do
                            somaDosValoresRateados := somaDosValoresRateados + StrToFloat(item.ObterValorPorNomePropriedade(nomeCampoParaRateio));

                        { Calcula a diferen�a }
                        diferenca := Tlib.ArredondarNumero((somaDosValoresRateados - valorRateio));

                        if diferenca <> 0 then
                        begin
                            if diferenca > 0 then
                                valorParaArredondamento := -0.01
                            else
                                valorParaArredondamento := 0.01;

                            { Ajusta o valor nos produtos }
                            for item in Self.OrcamentoItens do
                            begin
                                if pos(item.TipoEntrega, tipos) > 0 then
                                begin
                                    if StrToFloat(item.ObterValorPorNomePropriedade(nomeCampoParaRateio)) < 0 then
                                        valorRateadoNoItem := StrToFloat(item.ObterValorPorNomePropriedade(nomeCampoParaRateio)) * -1
                                    else
                                        valorRateadoNoItem := StrToFloat(item.ObterValorPorNomePropriedade(nomeCampoParaRateio));

                                    if (valorRateadoNoItem > 0.01) or (valorParaArredondamento = 0.01) then
                                    begin
                                        Valor := (StrToFloat(item.ObterValorPorNomePropriedade(nomeCampoParaRateio)) + (valorParaArredondamento));
                                        item.SetarValorPorNomePropriedade(nomeCampoParaRateio, CurrToStr(Valor));
                                        somaDosValoresRateados := somaDosValoresRateados + (valorParaArredondamento);

                                        if Tlib.ArredondarNumero(valorRateio) = Tlib.ArredondarNumero(somaDosValoresRateados) then
                                        begin
                                        estaCerto := True;
                                        break;
                                        end;
                                    end;
                                end;
                            end;
                        end
                        else
                        begin
                            estaCerto := True;
                        end;
                    end;

                    if tipoDoRateio = trDesconto then
                        Self.FPercDesconto := Tlib.ArredondarNumero(((valorRateio * 100) / valorProdutos));
                end
                else
                begin
                    raise Erro.Create('N�o existe itens para rateio!', MSGInformacao);
                end;
            end
            else
            begin
                raise Erro.Create('N�o existe itens para rateio!', MSGInformacao);
            end;
        end;
    finally
        Self.ObterTotaisOrcamento;
    end;
end;

procedure TOrcamento.RatearValoresNosItens;
begin
    if Self.ValorDesconto <> 0 then
        RatearValoresNosItens(Self.ValorDesconto, 'ValorDesconto', trDesconto);

    if Self.ValorDespesa <> 0 then
        RatearValoresNosItens(Self.ValorDespesa, 'ValorDespesa', trDespesas);

    if Self.ValorSeguro <> 0 then
        RatearValoresNosItens(Self.ValorSeguro, 'ValorSeguro', trSeguro);

    if Self.ValorFrete <> 0 then
        RatearValoresNosItens(Self.ValorFrete, 'ValorFrete', trFrete);
end;

procedure TOrcamento.RecalcularComissoesAplicadas;
var
    item: TOrcamentoItens;
    prazoMedio: double;
begin
    if Self.ObterQuantidadeCondicaoPagamento = 0 then
        raise Erro.Create('Para calcular a comiss�o � obrigat�rio informa uma condi��o de pagamento!');

    prazoMedio := Self.ObterPrazoMedioDasCondicoesPagto;

    for item in Self.OrcamentoItens do
        item.CalcularComissaoAplicada(prazoMedio);

end;

procedure TOrcamento.RecalcularPrecoEmTabelaComissao;
var
    item: TOrcamentoItens;
    totalPrecoTabela: double;
begin
    totalPrecoTabela := ObterTotalPrecoTabela;
    for item in OrcamentoItens do
    begin
        item.CalcularPrecoEmTabela(TabelaComissao, TabelaComissaoQuantidadeParcelas, totalPrecoTabela, Self.ValorEntrada);
    end;
end;

procedure TOrcamento.AtualizarFilhosCrossSelling(itemAtual, itemAnterior: TOrcamentoItens);
var
    itemOrc: TOrcamentoItens;
begin
    if itemAnterior.PaiAlternativo then
    begin
        for itemOrc in Self.OrcamentoItens do
        begin
            if itemOrc.ProdutoPaiAlternativo <> nil then
            begin
                if (itemOrc.ProdutoPaiAlternativo.codigo = itemAnterior.CodigoProduto) and
                  (itemOrc.LocalEstoquePaiAlternativo = itemAnterior.LocalEstoque) and
                  (itemOrc.TipoEntregaPaiAlternativo.TipoEntrega = itemAnterior.TipoEntrega) then
                begin
                    if itemAtual <> nil then
                    begin
                        itemOrc.ProdutoPaiAlternativo := itemAtual.Produto;
                        itemOrc.TipoEntregaPaiAlternativo := itemAtual.TipoEntrega_;
                        itemOrc.LocalEstoquePaiAlternativo := itemAtual.LocalEstoque;
                    end
                    else
                    begin
                        itemOrc.ProdutoPaiAlternativo := nil;
                        itemOrc.TipoEntregaPaiAlternativo := nil;
                        itemOrc.LocalEstoquePaiAlternativo := '';
                    end;
                end;
            end;
        end;
    end;
end;

procedure TOrcamento.AtualizarTabelaComissaoItens;
var
    item: TOrcamentoItens;
begin
    for item in OrcamentoItens do
    begin
        item.Tabela := TabelaComissao.CodigoTabela;
    end;
end;

procedure TOrcamento.AtualizarTabelasDeComissao;
var
    item: TOrcamentoItens;
begin
    if not Self.Vendedor.preenchido then
        raise Exception.Create('Vendedor n�o foi preenchido, impossibilitando a atualiza��o das tabelas de comiss�o.');

    for item in OrcamentoItens do
        item.Tabela := trim(Self.Vendedor.TabelaComissao);

end;

function TOrcamento.ValidarCaracteresInvalidosNosItens: boolean;
var
    item: TOrcamentoItens;
begin
    result := True;
    for item in OrcamentoItens do
        if not item.Produto.ValidarCaracteresInvalidosDescricao then
        begin
            result := false;
            exit;
        end;

end;

function TOrcamento.VerificarExistenciaOrcamentoParaEntrega: boolean;
var
    orc: TOrcamento;
begin
    result := false;
    for orc in Self.OrcamentosFilhos do
        if (orc.TipoOrcamento <> '8-EOK') and (orc.TipoOrcamento <> '6-FUT') then
            result := True;
end;

function TOrcamento.ObterQuantidadeItemPorTipoEntrega(entrega: string): integer;
var
    item: TOrcamentoItens;
begin
    result := 0;
    for item in Self.OrcamentoItens do
    begin
        // if not item.Produto.Preenchido then
        // item.Produto.Obter(item.CodigoProduto);

        if (trim(item.TipoEntrega) = entrega) then
            Inc(result)
    end;
end;

function TOrcamento.VerificarQuantidadeItensForaDaLoja: integer;
var
    itensLoja, itensForaLoja: integer;
begin
    itensLoja := Self.ObterQuantidadeItemPorTipoEntrega('LJ');
    itensLoja := itensLoja + ObterQuantidadeItemPorTipoEntrega('DL');
    itensLoja := itensLoja + ObterQuantidadeItemPorTipoEntrega('CS');
    result := Self.ObterQuantidadeItens - itensLoja;
end;

function TOrcamento.VeriricarExistenciaParcelasVencidas: boolean;
var
    formaPgto: TOrcamentoPagamento;
begin
    result := false;
    if Self.OrcamentoPagamento.Count > 0 then
    begin
        for formaPgto in Self.OrcamentoPagamento do
            if formaPgto.Vencimento < Tlib.ObterDataAtual then
                result := True;
    end;
end;

{$ENDREGION}
{$REGION 'M�todos de Propriedades'}

function TOrcamento.SelecionarTipoEntrega(item: TOrcamentoItens): TTipoEntrega;
begin
    result := nil;

    if (Self.Cliente.codigo = Self.Cliente.CodigoClientePadrao) and (Self.Cliente.Sequencial = Self.Cliente.SeguencialClientePadrao) then
        raise Exception.Create('N�o � permitido incluir tipos de entrega para cliente consumidor final');

    if trim(item.TipoEntrega) = 'CS' then
        exit;

    if item.Produto.ProdutoLiberadoConferenciaFiscal = false then
        raise Erro.Create('Este produto pode ser vendido, somente para Encomenda');

    // Self.Filial_.ObterListaTipoEntrega(tvVendaBalcao);

    // frmSelecionarTipoEntrega := TfrmSelecionarTipoEntrega.Create(Application.MainForm);
    // frmSelecionarTipoEntrega.Orcamento := Self;
    // frmSelecionarTipoEntrega.produto := item.produto;
    // frmSelecionarTipoEntrega.ShowModal;

    // if frmSelecionarTipoEntrega.TipoEntregaSelecionado = nil then
    begin
        // FreeAndNil(frmSelecionarTipoEntrega);
        result := nil;
        exit;
    end;

    result := TTipoEntrega.Create;
    // frmSelecionarTipoEntrega.TipoEntregaSelecionado.CopiarPara(result);

    // FreeAndNil(frmSelecionarTipoEntrega);
end;

procedure TOrcamento.SetBairro(const Value: string);
begin
    FBairro := Value;
end;

procedure TOrcamento.SetBaseICMSRestido(const Value: double);
begin
    FBaseICMSRestido := Value;
end;

procedure TOrcamento.SetCep(const Value: string);
begin
    FCep := Value;
end;

procedure TOrcamento.SetCliente(const Value: TCliente);
begin
    FCliente := Value;
end;

procedure TOrcamento.SetCodigoCliente(const Value: string);
begin
    FCodigoCliente := Value;
end;

procedure TOrcamento.SetCodigoEstacaoMS(const Value: String);
begin
    FCodigoEstacaoMS := Value;
end;

procedure TOrcamento.SetCodigoFormaPagto(const Value: string);
begin
    FCodigoFormaPagto := Value;
end;

procedure TOrcamento.SetCodigoOperadorPDV(const Value: string);
begin
    FCodigoOperadorPDV := Value;
end;

procedure TOrcamento.SetCodigoOrcamentoOrigem(const Value: string);
begin
    FCodigoOrcamentoOrigem := Value;
end;

procedure TOrcamento.SetCodigoPDV(const Value: string);
begin
    FCodigoPDV := Value;
end;

procedure TOrcamento.SetCodigoTransportadora(const Value: string);
begin
    FCodigoTransportadora := Value;
end;

procedure TOrcamento.SetCodigoVeiculoTransportadora(const Value: string);
begin
    FCodigoVeiculoTransportadora := Value;
end;

procedure TOrcamento.SetCodigoVendedor(const Value: string);
begin
    FCodigoVendedor := Value;
end;

procedure TOrcamento.SetControleEntrega(const Value: string);
begin
    FControleEntrega := Value;
end;

procedure TOrcamento.SetCopiaCompleta(const Value: boolean);
begin
    FCopiaCompleta := Value;
end;

procedure TOrcamento.SetCPFCNPJImpressao(const Value: string);
begin
    FCPFCNPJImpressao := Value;
end;

procedure TOrcamento.SetCreditosCliente(const Value: TLista<TCreditoCliente>);
begin
    FCreditosCliente := Value;
end;

procedure TOrcamento.SetDataDigitacao(const Value: string);
begin
    FDataDigitacao := Value;
end;

procedure TOrcamento.SetDataEmissao(const Value: string);
begin
    FDataEmissao := Value;
end;

procedure TOrcamento.SetDataEmissaoDocumento(const Value: string);
begin
    FDataEmissaoDocumento := Value;
end;

procedure TOrcamento.SetDataLimiteValidade(const Value: string);
begin
    FDataLimiteValidade := Value;
end;

procedure TOrcamento.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TOrcamento.SetEndereco(const Value: string);
begin
    FEndereco := Value;
end;

procedure TOrcamento.SetEstado(const Value: string);
begin
    FEstado := Value;
end;

procedure TOrcamento.SetFilial(const Value: string);
begin
    FFilial := Value;
end;

procedure TOrcamento.SetFilial_(const Value: TFilial);
begin
    FFilial_ := Value;
end;

procedure TOrcamento.SetHora(const Value: string);
begin
    FHora := Value;
end;

procedure TOrcamento.SetLojaCliente(const Value: string);
begin
    FLojaCliente := Value;
end;

procedure TOrcamento.SetLojaTransportadora(const Value: string);
begin
    FLojaTransportadora := Value;
end;

procedure TOrcamento.SetMoeda(const Value: double);
begin
    FMoeda := Value;
end;

procedure TOrcamento.SetMunicipio(const Value: string);
begin
    FMunicipio := Value;
end;

procedure TOrcamento.SetNomeCliente(const Value: string);
begin
    FNomeCliente := Value;
end;

procedure TOrcamento.SetNomeVendedor(const Value: string);
begin
    FNomeVendedor := Value;
end;

procedure TOrcamento.SetNumero(const Value: string);
begin
    FNumero := Value;
end;

procedure TOrcamento.SetNumeroDocumento(const Value: string);
begin
    FNumeroDocumento := Value;
end;

procedure TOrcamento.SetNumeroPedidoEcommerce(const Value: string);
begin
    FNumeroPedidoEcommerce := Value;
end;

procedure TOrcamento.SetObservacao1(const Value: string);
begin
    FObservacao1 := Value;
end;

procedure TOrcamento.SetObservacao2(const Value: string);
begin
    FObservacao2 := Value;
end;

procedure TOrcamento.SetOperacaoVenda(const Value: string);
begin
    FOperacaoVenda := Value;
end;

procedure TOrcamento.SetOrcamentoGeradoPeloSiatd(const Value: string);
begin
    FOrcamentoGeradoPeloSiatd := Value;
end;

procedure TOrcamento.SetOrcamentosFilhos(const Value: TLista<TOrcamento>);
begin
    FOrcamentosFilhos := Value;
end;

procedure TOrcamento.SetPercDesconto(const Value: double);
var
    valorParaDesconto: double;
    tipos: String;
begin

    if Value <> 0 then
    begin
        if (Value > 99) or (Value < 0) then
            raise Erro.Create('O percentual de desconto n�o pode ser maior 99% ou menor 0%', MSGInformacao);

        ObterValorParaRateio(valorParaDesconto, tipos, trDesconto);
        if valorParaDesconto > 0 then
        begin
            valorParaDesconto := Tlib.ArredondarNumero((((valorParaDesconto * Value) / 100)));
            Self.ValorDesconto := valorParaDesconto;
        end;
    end
    else
    begin
        Self.FValorDesconto := 0;
        ZerarRateioValoresNosItens('ValorDesconto');
    end;

    FPercDesconto := Value;
end;

procedure TOrcamento.SetPesoBruto(const Value: double);
begin
    FPesoBruto := Value;
end;

procedure TOrcamento.SetPesoLiquido(const Value: double);
begin
    FPesoLiquido := Value;
end;

procedure TOrcamento.SetPlacaTransportadora(const Value: string);
begin
    FPlacaTransportadora := Value;
end;

procedure TOrcamento.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TOrcamento.SetRecnoDelete(const Value: integer);
begin
    FRecnoDelete := Value;
end;

procedure TOrcamento.SetSenhaAutorizador(const Value: string);
begin
    FSenhaAutorizador := Value;
end;

procedure TOrcamento.SetSerieDocumento(const Value: string);
begin
    FSerieDocumento := Value;
end;

procedure TOrcamento.SetStatusEnvioEcommerce(const Value: string);
begin
    FStatusEnvioEcommerce := Value;
end;

procedure TOrcamento.SetStatusLiberacaoEntregaFutura(const Value: string);
begin
    FStatusLiberacaoEntregaFutura := Value;
end;

procedure TOrcamento.SetStatusPedidoEcommerce(const Value: string);
begin
    FStatusPedidoEcommerce := Value;
end;

procedure TOrcamento.SetTabelaComissao(const Value: TTabelaComissao);
begin
    FTabelaComissao := Value;

    AtualizarTabelaComissaoItens;
end;

procedure TOrcamento.SetTabelaComissaoQuantidadeParcelas(const Value: integer);
begin
    FTabelaComissaoQuantidadeParcelas := Value;
end;

procedure TOrcamento.SetTipo(const Value: string);
begin
    FTipo := Value;
end;

procedure TOrcamento.SetTipoCliente(const Value: string);
begin
    FTipoCliente := Value;
end;

procedure TOrcamento.SetTipoDaVenda(const Value: string);
begin
    if Value = 'VN' then
        FTipoVenda := tvVendaBalcao
    else if Value = 'VF' then
        FTipoVenda := tvVendaFutura
    else
        FTipoVenda := tvOutrosTipos;

    FTipoDaVenda := Value;
end;

procedure TOrcamento.SetTipoDesconto(const Value: string);
begin
    FTipoDesconto := Value;
end;

procedure TOrcamento.SetTipoFrete(const Value: string);
begin
    FTipoFrete := Value;
end;

procedure TOrcamento.SetTipoNotaFiscalMicrossiga(const Value: string);
begin
    FTipoNotaFiscalMicrossiga := Value;
end;

procedure TOrcamento.SetTipoOrcamento(const Value: string);
begin
    FTipoOrcamento := Value;
end;

procedure TOrcamento.SetTipoVenda(const Value: TTipoVenda);
begin
    if Value = tvVendaFutura then
        FTipoDaVenda := 'VF'
    else
        FTipoDaVenda := 'VN';

    FTipoVenda := Value;
end;

procedure TOrcamento.SetTipoVolume(const Value: string);
begin
    FTipoVolume := Value;
end;

procedure TOrcamento.SetUFPlancaTransportadora(const Value: string);
begin
    FUFPlancaTransportadora := Value;
end;

procedure TOrcamento.SetUltimoItemAlterado(const Value: TOrcamentoItens);
begin
    FUltimoItemAlterado := Value;
end;

procedure TOrcamento.SetUsuario(const Value: string);
begin
    FUsuario := Value;
end;

procedure TOrcamento.SetUsuarioQueBloqueouOrcamento(const Value: string);
begin
    FUsuarioQueBloqueouOrcamento := Value;
end;

procedure TOrcamento.SetValorAcrescimosTotalNegociado(const Value: double);
begin
    FValorAcrescimosTotalNegociado := Value;
end;

procedure TOrcamento.SetValorBruto(const Value: double);
begin
    FValorBruto := Value;
end;

procedure TOrcamento.SetValorDesconto(const Value: double);
var
    tipos: String;
begin

    if Value < 0 then
        raise Erro.Create('Valor de desconto n�o pode ser menor que zero.', MSGInformacao);

    if Value <> 0 then
    begin
        if ObterTotalProdutosDiferenteDeCursoSeguro(tipos) <= 0 then
            raise Erro.Create('N�o � permitido dar desconto para or�amento sem produtos ou produto do tipo curso ou seguro!', MSGInformacao);
    end;

    RatearValoresNosItens(Value, 'ValorDesconto', trDesconto);

    FValorDesconto := Value;
end;

procedure TOrcamento.SetValorDescontoTotalNegociado(const Value: double);
begin
    FValorDescontoTotalNegociado := Value;
end;

procedure TOrcamento.SetValorDespesa(const Value: double);
var
    tipos: String;
begin

    if Value < 0 then
        raise Erro.Create('Valor da despesa n�o pode ser menor que zero!', MSGInformacao);

    if Value <> 0 then
    begin
        if ObterTotalProdutosDiferenteDeCursoSeguro(tipos) <= 0 then
            raise Erro.Create('N�o � permitido despesa para or�amento sem produtos ou produto do tipo curso ou seguro!', MSGInformacao);

        if ObterTotalProdutosDiferenteDeCursoSeguro(tipos) <= Value then
            raise Erro.Create('Valor de desconto � maior que o valor do or�amento.'#13 +
              'Obs.: Produtos do tipo curso ou seguro n�o pode ter desconto', MSGInformacao);

        RatearValoresNosItens(Value, 'ValorDespesa', trDespesas);
    end
    else
    begin
        ZerarRateioValoresNosItens('ValorDespesa');
    end;
    FValorDespesa := Value;
end;

procedure TOrcamento.SetValorEntrada(const Value: double);
begin
    FValorEntrada := Value;
end;

procedure TOrcamento.SetValorFrete(const Value: double);
var
    tipos: String;
begin

    if Value < 0 then
        raise Erro.Create('Valor do frete n�o pode ser menor que zero!', MSGInformacao);

    if Value <> 0 then
    begin
        if ObterTotalProdutosDiferenteDeCursoSeguro(tipos) <= 0 then
            raise Erro.Create('N�o � permitido frete para or�amento sem produtos ou produto do tipo curso ou seguro!', MSGInformacao);

        if ObterTotalProdutosDiferenteDeCursoSeguro(tipos) <= Value then
            raise Erro.Create('Valor de frete � maior que o valor do or�amento.'#13 + 'Obs.: Produtos do tipo curso ou seguro n�o pode ter frete',
              MSGInformacao);

        RatearValoresNosItens(Value, 'ValorFrete', trFrete);
    end
    else
    begin
        ZerarRateioValoresNosItens('ValorFrete');
    end;

    FValorFrete := Value;
end;

procedure TOrcamento.SetValorFreteTodimoTransporte(const Value: double);
begin
    FValorFreteTodimoTransporte := Value;
end;

procedure TOrcamento.SetValorIcms(const Value: double);
begin
    FValorIcms := Value;
end;

procedure TOrcamento.SetValorIpi(const Value: double);
begin
    FValorIpi := Value;
end;

procedure TOrcamento.SetValorLiquido(const Value: double);
begin
    FValorLiquido := Value;
end;

procedure TOrcamento.SetValorMercadoria(const Value: double);
begin
    FValorMercadoria := Value;
end;

procedure TOrcamento.SetValorPagoCartaoCredito(const Value: double);
begin
    FValorPagoCartaoCredito := Value;
end;

procedure TOrcamento.SetValorPagoCartaoDebito(const Value: double);
begin
    FValorPagoCartaoDebito := Value;
end;

procedure TOrcamento.SetValorPagoCheque(const Value: double);
begin
    FValorPagoCheque := Value;
end;

procedure TOrcamento.SetValorPagoConven(const Value: double);
begin
    FValorPagoConven := Value;
end;

procedure TOrcamento.SetValorPagoDinheiro(const Value: double);
begin
    FValorPagoDinheiro := Value;
end;

procedure TOrcamento.SetValorPagoDuplicata(const Value: double);
begin
    FValorPagoDuplicata := Value;
end;

procedure TOrcamento.SetValorPagoFinan(const Value: double);
begin
    FValorPagoFinan := Value;
end;

procedure TOrcamento.SetValorPromocao(const Value: double);
begin
    FValorPromocao := Value;
end;

procedure TOrcamento.SetValorSeguro(const Value: double);
var
    tipos: String;
begin

    if Value < 0 then
        raise Erro.Create('Valor do seguro n�o pode ser menor que zero!', MSGInformacao);

    if Value <> 0 then
    begin
        if ObterTotalProdutosDiferenteDeCursoSeguro(tipos) <= 0 then
            raise Erro.Create('N�o � permitido seguroe para or�amento sem produtos ou produto do tipo curso ou seguro!', MSGInformacao);

        if ObterTotalProdutosDiferenteDeCursoSeguro(tipos) <= Value then
            raise Erro.Create('Valor do seguro � maior que o valor do or�amento.'#13 +
              'Obs.: Produtos do tipo curso ou seguro n�o pode ter valor de seguro', MSGInformacao);

        RatearValoresNosItens(Value, 'ValorSeguro', trSeguro);
    end
    else
    begin
        ZerarRateioValoresNosItens('ValorSeguro');
    end;

    FValorSeguro := Value;
end;

procedure TOrcamento.SetValorSubstituicao(const Value: double);
begin
    FValorSubstituicao := Value;
end;

procedure TOrcamento.SetValorTotal(const Value: double);
begin
    FValorTotal := Value;
end;

procedure TOrcamento.SetVendaComTEF(const Value: string);
begin
    FVendaComTEF := Value;
end;

procedure TOrcamento.SetVendedor(const Value: TVendedor);
begin
    FVendedor := Value;
end;

procedure TOrcamento.SetVersaoSistema(const Value: string);
begin
    FVersaoSistema := Value;
end;

procedure TOrcamento.SetVolume(const Value: double);
begin
    FVolume := Value;
end;

{$ENDREGION}

end.
