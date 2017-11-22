unit Biz.OrcamentoItens;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores, Vcl.Forms,
    Lib.Persistable, Lib.Biblioteca, Biz.Produto, Lib.ResultFilter, Biz.TipoEntrega, Datasnap.DBClient,
    Lib.MaxLenght, Biz.Filial, Biz.TabelaComissao, Dal.ControleDados, Lib.Lista;

type
    TTipoCusto = (tcCustoCompra, tcCustoNota);

    [TReferenceTable('SZ6010')]
    TOrcamentoItens = class(TClasseBase)
    private
        FValorFrete: double;
        FQuantidadeEntregue: double;
        FValorDespesa: double;
        FValorIcmsRetido: double;
        FValorIPI: double;
        FFlegueVendido: string;
        FFilial: string;
        FTipoEntrega: string;
        FDataEntregaPSE: string;
        FValorDesconto: double;
        FQuantidadeLiberadaPSE: double;
        FCampanha: string;
        FQuantidadeDevolvida: double;
        FDescricaoProduto: string;
        FCustoCompra: double;
        FCodigoProduto: string;
        FCodigoPDV: string;
        FValorUnitario: double;
        FCustoNota: double;
        FRecnoDelete: integer;
        FValorIcms: double;
        FLocalEstoque: string;
        FPercIcms: double;
        FCodigoTES: string;
        FCodigoRegraCA: string;
        FUnidadeMedida: string;
        FItemOrigem: string;
        FValorSeguro: double;
        FCFOP: string;
        FNumero: string;
        FPedidoCompraPSE: string;
        FDataEmissao: string;
        FValorTotal: double;
        FItem: string;
        FRecno: integer;
        FBaseIcmsRetido: double;
        FTipoTributacao: string;
        FQuantidadePSE: double;
        FTabelaPremio: string;
        FPrecoTabela: double;
        FTabelaPreco: string;
        FQuantidade: double;
        FPercComissao: double;
        FDelete: string;
        FCustoGerencial: double;
        FCodigoVendedor: string;
        FFormulaSelfColor: string;
        FSerieDocumento: string;
        FBaseIcms: double;
        FNumeroDocumento: string;
        FProduto: TProduto;
        FTipoEntrega_: TTipoEntrega;
        FQuantidadeConferida: double;
        FStatusDevolucao: string;
        FUsuarioBaixaDeposito: string;
        FUsuarioSistema: string;
        FDataEntregaDeposito: string;
        FItemComissaoAplicada: string;
        FTipoVenda: string;
        FPesoItem: double;
        FPercentualPrecoNegociado: double;
        FTipoAlternativo: TTipoAlternativo;
        FProdutoPaiAlternativo: TProduto;
        FTipoEntregaPaiAlternativo: TTipoEntrega;
        FLocalEstoquePaiAlternativo: string;
        FFilial_: TFilial;
        FPaiAlternativo: Boolean;
        FGrupoSelfColor: integer;
        FProdutoSelfColor: integer;
        FCorSelfColor: integer;
        FColoranteSelfColor: integer;
        FEmbalagemSelfColor: integer;
        FItemPai: String;
        FBaseSelfColor: integer;
        procedure SetBaseIcms(const Value: double);
        procedure SetBaseIcmsRetido(const Value: double);
        procedure SetCampanha(const Value: string);
        procedure SetCFOP(const Value: string);
        procedure SetCodigoPDV(const Value: string);
        procedure SetCodigoProduto(const Value: string);
        procedure SetCodigoRegraCA(const Value: string);
        procedure SetCodigoTES(const Value: string);
        procedure SetCodigoVendedor(const Value: string);
        procedure SetCustoCompra(const Value: double);
        procedure SetCustoGerencial(const Value: double);
        procedure SetCustoNota(const Value: double);
        procedure SetDataEmissao(const Value: string);
        procedure SetDataEntregaPSE(const Value: string);
        procedure SetDelete(const Value: string);
        procedure SetDescricaoProduto(const Value: string);
        procedure SetFilial(const Value: string);
        procedure SetFlegueVendido(const Value: string);
        procedure SetFormulaSelfColor(const Value: string);
        procedure SetItem(const Value: string);
        procedure SetItemOrigem(const Value: string);
        procedure SetLocalEstoque(const Value: string);
        procedure SetNumero(const Value: string);
        procedure SetNumeroDocumento(const Value: string);
        procedure SetPedidoCompraPSE(const Value: string);
        procedure SetPercComissao(const Value: double);
        procedure SetPercIcms(const Value: double);
        procedure SetPrecoTabela(const Value: double);
        procedure SetQuantidade(const Value: double);
        procedure SetQuantidadeDevolvida(const Value: double);
        procedure SetQuantidadeEntregue(const Value: double);
        procedure SetQuantidadeLiberadaPSE(const Value: double);
        procedure SetQuantidadePSE(const Value: double);
        procedure SetRecno(const Value: integer);
        procedure SetRecnoDelete(const Value: integer);
        procedure SetSerieDocumento(const Value: string);
        procedure SetTabelaPreco(const Value: string);
        procedure SetTabelaPremio(const Value: string);
        procedure SetTipoEntrega(const Value: string);
        procedure SetTipoTributacao(const Value: string);
        procedure SetUnidadeMedida(const Value: string);
        procedure SetValorDesconto(const Value: double);
        procedure SetValorDespesa(const Value: double);
        procedure SetValorFrete(const Value: double);
        procedure SetValorIcms(const Value: double);
        procedure SetValorIcmsRetido(const Value: double);
        procedure SetValorIPI(const Value: double);
        procedure SetValorSeguro(const Value: double);
        procedure SetValorTotal(const Value: double);
        procedure SetValorUnitario(const Value: double);
        procedure SetPercentualPrecoNegociado(const Value: double);
        procedure SetProduto(const Value: TProduto);
        procedure SetTipoEntrega_(const Value: TTipoEntrega);
        procedure SetQuantidadeConferida(const Value: double);
        procedure SetStatusDevolucao(const Value: string);
        procedure SetUsuarioBaixaDeposito(const Value: string);
        procedure SetUsuarioSistema(const Value: string);
        procedure SetDataEntregaDeposito(const Value: string);
        procedure SetItemComissaoAplicada(const Value: string);
        procedure SetTipoVenda(const Value: string);

        function GetLocalEstoque: string;
        function GetStatusConferecia: string;
        function GetConferido: Boolean;
        function GetRemanescenteConferencia: double;
        function GetTabelaPreco: string;
        function GetCustoGerencial: double;
        function GetCustoCompra: double;
        function GetCustoNota: double;
        procedure SetPesoItem(const Value: double);
        function GetEmCampanha: Boolean;
        function GetEmPromocao: Boolean;
        function GetForaDeLinha: Boolean;

        function GetSobEncomenda: Boolean;
        procedure SetTipoAlternativo(const Value: TTipoAlternativo);
        procedure SetLocalEstoquePaiAlternativo(const Value: string);
        procedure SetProdutoPaiAlternativo(const Value: TProduto);
        procedure SetTipoEntregaPaiAlternativo(const Value: TTipoEntrega);
        procedure SetFilial_(const Value: TFilial);
        procedure SetPaiAlternativo(const Value: Boolean);
        function GetValorComissao: double;
        procedure SetBaseSelfColor(const Value: integer);
        procedure SetColoranteSelfColor(const Value: integer);
        procedure SetCorSelfColor(const Value: integer);
        procedure SetEmbalagemSelfColor(const Value: integer);
        procedure SetGrupoSelfColor(const Value: integer);
        procedure SetItemPai(const Value: String);
        procedure SetProdutoSelfColor(const Value: integer);


        function ObterCusto(tipoCusto: TTipoCusto): Double;
        function ObterPercentualNovaComissao(Produto: string; var percentualNovaComissao, percentualPadrao: double; var codigoNovaComissao: string): Boolean;
        function checarValidadeComissao(codigoAtual: string): Boolean;
        function CalculaPercValorProduto(valProduto, valDesconto, quantidade, valTabela: double): string;
        function ObterItemFatorNovaComissao(codigoNovaComissao, prazoMedio, percentualProduto: string; var item: string; var fator: double): Boolean;

    public
        class var dao: TControleDados<TLista<TOrcamentoItens>,TListaDAO<TOrcamentoItens>>;

        function Inserir: boolean;
        function Alterar: boolean;
        function Excluir(definitivo: boolean = false): boolean;
        function ExcluirItensPorOrcamento(numeroOrcamento: string): boolean;



        procedure PopularObjeto(OrcamentoItens: TOrcamentoItens);

        function Consultar(parametros: TParametro): Tlista<TOrcamentoItens>;


        /// <summary>
        /// Calcula comiss�o aplicada e preenche as informa��es:
        /// PercentualComissao, RegraComissaoAplicada�e ItemComissaoAplicada
        /// </summary>
        procedure CalcularComissaoAplicada(prazoMedioCondicaoPagamento: double);

        /// <summary>
        /// sobrescrita do m�todo da classe base que copia as instancia da
        /// classe (herdada da classe base) bem como as demais propriedades
        /// agregadadas (lista de itens do orcamento, lista de forma de
        /// pagamento, etc).
        /// </summary>
        procedure CopiarPara(objeto: TObject); override;

        procedure CalcularPrecoEmTabela(TabelaComissao: TTabelaComissao; quantidadeParcelas: integer; totalPrecoEmTabela, valorEntrada: Currency);
        function CalcularPMT(qtParcelas, taxaDeJuros, vrLiquido: Real): Currency;

        procedure CalcularValorTotal;

{$REGION 'SZ6 - Itens do Orcamento'}
        [TPersistable(fgPersistable, 'Z6_NUM')]
        property Numero: string read FNumero write SetNumero;

        [TPersistable(fgPersistable, 'Z6_PRODUTO')]
        property CodigoProduto: string read FCodigoProduto write SetCodigoProduto;

        [TPersistable(fgPersistable, 'Z6_DESCRI')]
        [TMaxLenght(36)]
        property DescricaoProduto: string read FDescricaoProduto write SetDescricaoProduto;

        [TPersistable(fgPersistable, 'Z6_QUANT')]
        property quantidade: double read FQuantidade write SetQuantidade;

        [TPersistable(fgPersistable, 'Z6_TDVUNIT')]
        property ValorUnitario: double read FValorUnitario write SetValorUnitario;

        [TPersistable(fgPersistable, 'Z6_TDVITEM')]
        property ValorTotal: double read FValorTotal write SetValorTotal;

        /// <summary>
        /// Campo valida armazem do microsiga, e ser� usado futuramente
        /// quando estiver integrado, atualmente guardada-se valor "01" para
        /// este campo (segundo o Marcio Andr�)
        /// </summary>
        [TPersistable(fgPersistable, 'Z6_LOCAL')]
        property LocalEstoque: string read GetLocalEstoque write SetLocalEstoque;

        [TPersistable(fgPersistable, 'Z6_UM')]
        property UnidadeMedida: string read FUnidadeMedida write SetUnidadeMedida;

        [TPersistable(fgPersistable, 'Z6_DESCPRO')]
        property ValorDesconto: double read FValorDesconto write SetValorDesconto;

        [TPersistable(fgPersistable, 'Z6_TIPTRIB')]
        property TipoTributacao: string read FTipoTributacao write SetTipoTributacao;

        [TPersistable(fgPersistable, 'Z6_TES')]
        property CodigoTES: string read FCodigoTES write SetCodigoTES;

        [TPersistable(fgPersistable, 'Z6_CF')]
        property CFOP: string read FCFOP write SetCFOP;

        [TPersistable(fgPersistable, 'Z6_VENDIDO')]
        property Vendido: string read FFlegueVendido write SetFlegueVendido;

        [TPersistable(fgPersistable, 'Z6_DOCTD')]
        property NumeroDocumento: string read FNumeroDocumento write SetNumeroDocumento;

        [TPersistable(fgPersistable, 'Z6_SERTD')]
        property SerieDocumento: string read FSerieDocumento write SetSerieDocumento;

        [TPersistable(fgPersistable, 'Z6_PDV')]
        property CodigoPDV: string read FCodigoPDV write SetCodigoPDV;

        [TPersistable(fgPersistable, 'Z6_VALIPI')]
        property ValorIPI: double read FValorIPI write SetValorIPI;

        [TPersistable(fgPersistable, 'Z6_VALICM')]
        property ValorIcms: double read FValorIcms write SetValorIcms;

        [TPersistable(fgPersistable, 'Z6_BASEICM')]
        property BaseIcms: double read FBaseIcms write SetBaseIcms;

        /// <summary>
        /// propriedade que guarda '1' para�pre�o normal�e '2' para pre�o em
        /// promo��o
        /// </summary>
        [TPersistable(fgPersistable, 'Z6_TABELA')]
        property TabelaPreco: string read GetTabelaPreco write SetTabelaPreco;

        [TPersistable(fgPersistable, 'Z6_EMISSAO')]
        property DataEmissao: string read FDataEmissao write SetDataEmissao;

        [TPersistable(fgPersistable, 'Z6_PRCTAB')]
        property PrecoTabela: double read FPrecoTabela write SetPrecoTabela;

        [TPersistable(fgPersistable, 'Z6_FILIAL')]
        property Filial: string read FFilial write SetFilial;
        property Filial_: TFilial read FFilial_ write SetFilial_;

        [TPersistable(fgPersistable, 'Z6_VEND')]
        property CodigoVendedor: string read FCodigoVendedor write SetCodigoVendedor;

        [TPersistable(fgPersistable, 'Z6_FORMSEL')]
        property FormulaSelfColor: string read FFormulaSelfColor write SetFormulaSelfColor;

        [TPersistable(fgPersistable, 'Z6_ITEM')]
        property item: string read FItem write SetItem;

        [TPersistable(fgPersistable, 'Z6_ICMSRET')]
        property ValorIcmsRetido: double read FValorIcmsRetido write SetValorIcmsRetido;

        [TPersistable(fgPersistable, 'Z6_VALFRE')]
        property ValorFrete: double read FValorFrete write SetValorFrete;

        [TPersistable(fgPersistable, 'Z6_SEGURO')]
        property ValorSeguro: double read FValorSeguro write SetValorSeguro;

        [TPersistable(fgPersistable, 'Z6_DESPESA')]
        property ValorDespesa: double read FValorDespesa write SetValorDespesa;

        [TPersistable(fgPersistable, 'Z6_QENT')]
        property QuantidadeEntregue: double read FQuantidadeEntregue write SetQuantidadeEntregue;

        [TPersistable(fgPersistable, 'Z6_PICM')]
        property PercIcms: double read FPercIcms write SetPercIcms;

        [TPersistable(fgPersistable, 'Z6_QDEV')]
        property QuantidadeDevolvida: double read FQuantidadeDevolvida write SetQuantidadeDevolvida;

        [TPersistable(fgPersistable, 'Z6_COMIS')]
        property PercentualComissao: double read FPercComissao write SetPercComissao;

        [TPersistable(fgPersistable, 'Z6_TDREGRA')]
        property RegraComissaoAplicada: string read FCodigoRegraCA write SetCodigoRegraCA;

        [TPersistable(fgPersistable, 'Z6_TDITEM')]
        property ItemComissaoAplicada: string read FItemComissaoAplicada write SetItemComissaoAplicada;

        [TPersistable(fgPersistable, 'Z6_BASERET')]
        property BaseIcmsRetido: double read FBaseIcmsRetido write SetBaseIcmsRetido;

        [TPersistable(fgPersistable, 'Z6_CAMPANH')]
        property Campanha: string read FCampanha write SetCampanha;
        { Estas propridades foram criadas pois existe a necessidade de recuparar os status dos produtos, quando foram gravados, pois podem estar diferentes do cadastro atual }
        property EmPromocao: Boolean read GetEmPromocao;
        property EmCampanha: Boolean read GetEmCampanha;
        property ForaDeLinha: Boolean read GetForaDeLinha;
        property SobEncomenda: Boolean read GetSobEncomenda;

        [TPersistable(fgPersistable, 'Z6_T')]
        property Tabela: string read FTabelaPremio write SetTabelaPremio;

        [TPersistable(fgPersistable, 'Z6_TDITORI')]
        property ItemOrigem: string read FItemOrigem write SetItemOrigem;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgPersistable, 'R_E_C_D_E_L_')]
        property RecnoDelete: integer read FRecnoDelete write SetRecnoDelete;

        [TPersistable(fgPersistable, 'Z6_TPENT')]
        property TipoEntrega: string read FTipoEntrega write SetTipoEntrega;

        property TipoEntrega_: TTipoEntrega read FTipoEntrega_ write SetTipoEntrega_;

        [TPersistable(fgPersistable, 'Z6_CGER')]
        property CustoGerencial: double read GetCustoGerencial write SetCustoGerencial;

        [TPersistable(fgPersistable, 'Z6_DTPSETD')]
        property DataEntregaPSE: string read FDataEntregaPSE write SetDataEntregaPSE;

        [TPersistable(fgPersistable, 'Z6_QTPSETD')]
        property QuantidadePSE: double read FQuantidadePSE write SetQuantidadePSE;

        [TPersistable(fgPersistable, 'Z6_QTLIBAR')]
        property QuantidadeLiberadaPSE: double read FQuantidadeLiberadaPSE write SetQuantidadeLiberadaPSE;

        [TPersistable(fgPersistable, 'Z6_PCPSETD')]
        property PedidoCompraPSE: string read FPedidoCompraPSE write SetPedidoCompraPSE;

        [TPersistable(fgPersistable, 'Z6_CCOMPR')]
        property CustoCompra: double read GetCustoCompra write SetCustoCompra;

        [TPersistable(fgPersistable, 'Z6_CNFE')]
        property CustoNota: double read GetCustoNota write SetCustoNota;

        [TPersistable(fgPersistable, 'Z6_STATUS')]
        property StatusDevolucao: string read FStatusDevolucao write SetStatusDevolucao;

        [TPersistable(fgPersistable, 'Z6_NOMPRO')]
        property UsuarioBaixaDeposito: string read FUsuarioBaixaDeposito write SetUsuarioBaixaDeposito;

        [TPersistable(fgPersistable, 'Z6_USERID')]
        property UsuarioSistema: string read FUsuarioSistema write SetUsuarioSistema;

        [TPersistable(fgPersistable, 'Z6_FDTENTR')]
        property DataEntregaDeposito: string read FDataEntregaDeposito write SetDataEntregaDeposito;

        [TPersistable(fgPersistable, 'Z6_ITEMPAI')]
        property ItemPai: String read FItemPai write SetItemPai;

        [TPersistable(fgPersistable, 'Z6_GRPSELF')]
        property GrupoSelfColor: integer read FGrupoSelfColor write SetGrupoSelfColor;

        [TPersistable(fgPersistable, 'Z6_PRDSELF')]
        property ProdutoSelfColor: integer read FProdutoSelfColor write SetProdutoSelfColor;

        [TPersistable(fgPersistable, 'Z6_BSESELF')]
        property BaseSelfColor: integer read FBaseSelfColor write SetBaseSelfColor;

        [TPersistable(fgPersistable, 'Z6_EMBSELF')]
        property EmbalagemSelfColor: integer read FEmbalagemSelfColor write SetEmbalagemSelfColor;

        [TPersistable(fgPersistable, 'Z6_CORSELF')]
        property CorSelfColor: integer read FCorSelfColor write SetCorSelfColor;

        [TPersistable(fgPersistable, 'Z6_COLSELF')]
        property ColoranteSelfColor: integer read FColoranteSelfColor write SetColoranteSelfColor;

        property QuantidadeConferida: double read FQuantidadeConferida write SetQuantidadeConferida;

        property RemanescenteConferencia: double read GetRemanescenteConferencia;

        property StatusConferencia: string read GetStatusConferecia;

        property Conferido: Boolean read GetConferido;

        property PercentualPrecoNegociado: double read FPercentualPrecoNegociado write SetPercentualPrecoNegociado;

        property TipoAlternativo: TTipoAlternativo read FTipoAlternativo write SetTipoAlternativo;

        property LocalEstoquePaiAlternativo: string read FLocalEstoquePaiAlternativo write SetLocalEstoquePaiAlternativo;
        property TipoEntregaPaiAlternativo: TTipoEntrega read FTipoEntregaPaiAlternativo write SetTipoEntregaPaiAlternativo;
        property ProdutoPaiAlternativo: TProduto read FProdutoPaiAlternativo write SetProdutoPaiAlternativo;
        property PaiAlternativo: Boolean read FPaiAlternativo write SetPaiAlternativo;

        // CAMPOS CRIADOS PARA MELHORAR PERFORMACE NA FINALIZA��O DA VENDA
        [TPersistable(fgReadOnly, 'Z3_TIPOVEN')]
        property tipoVenda: string read FTipoVenda write SetTipoVenda;

        [TPersistable(fgReadOnly, 'B1_PESO')]
        property PesoItem: double read FPesoItem write SetPesoItem;

        property ValorComissao: double read GetValorComissao;

{$ENDREGION}
{$REGION 'Produto'}
        property Produto: TProduto read FProduto write SetProduto;
{$ENDREGION}
        constructor Create;
        destructor Destroy;

    end;

implementation

{ TOrcamentoItens }

{$REGION 'M�todos CRUD'}

uses Lib.Filter, System.Math, System.Types,
    Biz.UsuarioLogado, Dal.CondicaoConsulta, Dal.FabricaSQL, Biz.Empresa;

function TOrcamentoItens.checarValidadeComissao(codigoAtual: string): Boolean;
var
    dataset: TClientDataSet;
    query: string;
    cdDataSet: TControleDados<TClientDataSet, TDataSetDAO>;
begin
    try
        cdDataSet := TControleDados<TClientDataSet, TDataSetDAO>.Create;
        query := 'SELECT Z86_DTINIC, Z86_DTFIM ' + 'FROM Z86010 WITH(NOLOCK) ' + 'WHERE Z86_FILIAL = '''' ' + 'AND Z86_NUMERO = ''' + codigoAtual +
          ''' ' + 'AND R_E_C_N_O_ > 0 ' + 'AND D_E_L_E_T_ = '''' ';

        dataset := cdDataSet.Consultar(query, nil);
        if dataset.RecordCount <= 0 then
        begin
            Result := false;
            dataset.Close;
            Exit;
        end;

        // Validade da vigencia da nova comiss�o
        if (dataset.FieldByName('Z86_DTFIM').AsString >= FormatDateTime('yyyymmdd', date)) and
          (dataset.FieldByName('Z86_DTINIC').AsString <= FormatDateTime('yyyymmdd', date)) then
        begin
            Result := true;
        end
        else
        begin
            Result := false;
        end;
        dataset.Close;
    finally
        if dataset <> nil then
            FreeAndNil(dataset);

        if cdDataSet <> nil then
            FreeAndNil(cdDataSet);
    end;
end;

function TOrcamentoItens.ObterPercentualNovaComissao(Produto: string; var percentualNovaComissao, percentualPadrao: double;
  var codigoNovaComissao: string): Boolean;
var
    dataset: TClientDataSet;
    query: string;
    codigoComissao1, codigoComissao2: string;
    percentual1, percentuaSZ6: double;
    cdDataSet: TControleDados<TClientDataSet, TDataSetDAO>;
begin
    try
        cdDataSet := TControleDados<TClientDataSet, TDataSetDAO>.Create;

        query := ' SELECT BZ_TDCOMIS, BZ_TDPERCE, B1_TDCOMIS, B1_TDPERCE, B1_COMIS ' + '   FROM SB1010 AS B1 LEFT OUTER JOIN SBZ010 AS BZ ' +
          '      ON BZ_COD = B1_COD AND BZ.D_E_L_E_T_<>''*'' ' + ' WHERE BZ_FILIAL = ' + QuotedStr(TUsuarioLogado.ObterInstancia.Filial.Filial) +
          ' AND B1_COD = ''' + Produto + ''' ' + ' AND B1.D_E_L_E_T_<>''*'' ';

        dataset := cdDataSet.Consultar(query, nil);

        if not dataset.IsEmpty then
        begin
            codigoComissao1 := dataset.FieldByName('BZ_TDCOMIS').AsString;
            percentual1 := dataset.FieldByName('BZ_TDPERCE').AsFloat;
            codigoComissao2 := dataset.FieldByName('B1_TDCOMIS').AsString;
            percentuaSZ6 := dataset.FieldByName('B1_TDPERCE').AsFloat;
            percentualPadrao := dataset.FieldByName('B1_COMIS').AsFloat;

            if (percentual1 = 0) and (percentuaSZ6 = 0) and (percentualPadrao = 0) then
                raise Exception.Create('Nenhuma comiss�o configurada para esse produto');

            if (percentual1 = 0) and (percentuaSZ6 = 0) then
            begin
                percentualNovaComissao := 0;
                codigoNovaComissao := emptyStr;
                Result := false;
                Exit;
            end
            else
            begin
                if percentual1 > 0 then
                begin
                    percentualNovaComissao := percentual1;
                    codigoNovaComissao := codigoComissao1;
                end
                else
                begin
                    percentualNovaComissao := percentuaSZ6;
                    codigoNovaComissao := codigoComissao2;
                end;

                if not checarValidadeComissao(codigoNovaComissao) then
                begin
                    percentualNovaComissao := 0;
                    codigoNovaComissao := emptyStr;
                    Result := false;
                    Exit;
                end;

                Result := true;

            end;
        end
        else
            raise Exception.Create('nenhuma comiss�o encontrada');
    finally
        if dataset <> nil then
            FreeAndNil(dataset);

        if cdDataSet <> nil then
            FreeAndNil(cdDataSet);
    end;

end;

function TOrcamentoItens.Alterar: boolean;
var
    fabrica: TFabricaSql;
    query: WideString;
    parametros:TParametro;
begin
    result := false;
    try
        try
            fabrica := TFabricaSQL.Create(Self);
            query := fabrica.GerarSqlAlteracao;
            parametros := Self.ObjetoParaParametros(Alteracao);
            dao.Alterar(query,parametros);
        except
            raise Exception.Create('Erro ao alterar item do or�amento');

        end;
        result := true;
    finally
        if fabrica <> nil then
            FreeAndNil(fabrica);

        if parametros <> nil then
            FreeAndNil(parametros);
    end;

end;

function TOrcamentoItens.CalculaPercValorProduto(valProduto, valDesconto, quantidade, valTabela: double): string;
var
    valNegociado, diferenca, percentual: double;
begin
    percentual := 0;
    valNegociado := valProduto - valDesconto / quantidade;

    diferenca := valTabela - valNegociado;

    // Calcula diferen�a
    if diferenca < 0 then
        diferenca := diferenca * (-1);

    // Calcular percentual
    percentual := roundTo((diferenca / valTabela), -4);
    percentual := roundTo((percentual * 100), -2);

    // Calcula Percentual do valor do produto
    if diferenca >= 0 then
        percentual := 100 - percentual
    else
        percentual := 100 + percentual;

    Result := FormatCurr('##0.00', percentual);
end;

function TOrcamentoItens.ObterItemFatorNovaComissao(codigoNovaComissao, prazoMedio, percentualProduto: string; var item: string;
  var fator: double): Boolean;
var
    dataset: TClientDataSet;
    query: string;
    cdDataSet: TControleDados<TClientDataSet, TDataSetDAO>;
begin
    try
        cdDataSet := TControleDados<TClientDataSet, TDataSetDAO>.Create;

        query := 'SELECT Z87_ITENS, Z87_FATOR ' + 'FROM Z87010 WITH(NOLOCK) ' + 'WHERE Z87_FILIAL = '''' ' + 'AND Z87_NUMERO = ''' +
          codigoNovaComissao + ''' ' + 'AND (Z87_PZINIC <= ' + TLib.GravaNumeros(prazoMedio, '.') + ' AND Z87_PZFIM >= ' +
          TLib.GravaNumeros(prazoMedio, '.') + ') ' + 'AND (Z87_VLINIC <= ' + TLib.GravaNumeros(percentualProduto, '.') + ' AND Z87_VLFIM >= ' +
          TLib.GravaNumeros(percentualProduto, '.') + ') ' + 'AND R_E_C_N_O_ > 0 ' + 'AND D_E_L_E_T_ = '''' ';

        dataset := cdDataSet.Consultar(query, nil);

        if not dataset.IsEmpty then
        begin
            item := dataset.FieldByName('Z87_ITENS').AsString;
            fator := dataset.FieldByName('Z87_FATOR').AsFloat;
            Result := true;
        end
        else
        begin
            item := emptyStr;
            fator := 0;
            Result := false;
        end;
    finally
        if dataset <> nil then
            FreeAndNil(dataset);

        if cdDataSet <> nil then
            FreeAndNil(dataset);

    end;
end;

procedure TOrcamentoItens.CalcularComissaoAplicada(prazoMedioCondicaoPagamento: double);
var
    param: TParametro;
    dataset: TClientDataSet;
    percentualAtual, percentualPadrao, fator: double;
    codigoNovaComissao, item: string;
    percentualProduto: string;
    prazoMedioCondiacaoPagamento: string;

begin
    try
        param := TParametro.Create;

        param.Add('', 'CODIGOPRODUTO', Self.CodigoProduto);
        param.Add('', 'PRAZOMEDIO', FloatToStr(prazoMedioCondicaoPagamento));
        param.Add('', 'VALPRODUTO', FloatToStr(Self.ValorTotal));
        param.Add('', 'VALDESCONTO', FloatToStr(Self.ValorDesconto));
        param.Add('', 'QUANTIDADE', FloatToStr(Self.quantidade));
        param.Add('', 'VALTABELA', FloatToStr(Self.PrecoTabela));

        if not ObterPercentualNovaComissao(Self.CodigoProduto, percentualAtual, percentualPadrao, codigoNovaComissao) then
        begin
            Self.PercentualComissao := percentualPadrao;
            Self.RegraComissaoAplicada := emptyStr;
            Self.ItemComissaoAplicada := emptyStr;
        end
        else
        begin
            percentualProduto := CalculaPercValorProduto(Self.ValorTotal, Self.ValorDesconto, Self.quantidade, Self.PrecoTabela);

            if ObterItemFatorNovaComissao(codigoNovaComissao, prazoMedioCondiacaoPagamento, percentualProduto, item, fator) then
            begin
                percentualAtual := roundTo((percentualAtual * fator) / 100, -2);

                if percentualAtual > 0 then
                begin
                    Self.PercentualComissao := percentualPadrao;
                    Self.RegraComissaoAplicada := codigoNovaComissao;
                    Self.ItemComissaoAplicada := emptyStr;
                end
                else
                begin
                    Self.PercentualComissao := percentualPadrao;
                    Self.RegraComissaoAplicada := emptyStr;
                    Self.ItemComissaoAplicada := emptyStr;
                end;
            end
            else
            begin
                Self.PercentualComissao := percentualPadrao;
                Self.RegraComissaoAplicada := emptyStr;
                Self.ItemComissaoAplicada := emptyStr;
            end;
        end;

    finally
        if param <> nil then
            FreeAndNil(param);

        if dataset <> nil then
            FreeAndNil(dataset);

    end;

end;





function TOrcamentoItens.CalcularPMT(qtParcelas, taxaDeJuros, vrLiquido: Real): Currency;
begin
    Result := ((-vrLiquido * taxaDeJuros / 100.0 / (1.0 - exp(-qtParcelas * ln(1.0 + taxaDeJuros / 100.0)))) * -1);
end;

procedure TOrcamentoItens.CalcularPrecoEmTabela(TabelaComissao: TTabelaComissao; quantidadeParcelas: integer;
  totalPrecoEmTabela, valorEntrada: Currency);
var
    valor, coeficiente, vrEntrada, vrLiquido, vrNegociado, prazoMedio: Currency;
    juros: Real;
begin
    try
        valor := 0;
        coeficiente := 0;
        if (Self.TipoEntrega <> 'CS') and (Self.Produto.ProdutoEmPromocao = false) and (TabelaComissao.CodigoTabela <> 'T1') then
        begin
            if TabelaComissao.Indice = 0 then
            begin
                if totalPrecoEmTabela <> 0 then
                    valor := totalPrecoEmTabela
                else
                    valor := Self.PrecoTabela;

                if valor > 0 then
                    if valorEntrada > 0 then
                        coeficiente := (valorEntrada / valor);

                { Pega o valor unit�rio da entrada }
                vrEntrada := (Self.PrecoTabela * coeficiente);
                { Pega o valor liquido para calculo do preco }
                vrLiquido := (Self.PrecoTabela - vrEntrada);
                { Calcula prece em tabela }
                vrNegociado := (CalcularPMT(quantidadeParcelas, (TabelaComissao.taxaDeJuros), vrLiquido));
                vrNegociado := vrNegociado * quantidadeParcelas;
                vrNegociado := vrNegociado + vrEntrada;

                if vrNegociado < Self.PrecoTabela then
                    vrNegociado := Self.PrecoTabela;
            end
            else
            begin
                // cAux := inttostr(nParc);
                // if Length(cAux) < 10 then
                // cAux := '0' + cAux + 'x'
                // else
                // cAux := cAux + 'x';

                if (TabelaComissao.Indice <> 0) then // and (Self.TabelaComissaoQuantidadeParcelas = cAux) then
                begin
                    vrNegociado := (Self.PrecoTabela * TabelaComissao.Indice);
                end
                else
                begin
                    prazoMedio := (quantidadeParcelas - 1) / 2;
                    juros := Power((1 + (TabelaComissao.taxaDeJuros / 100)), prazoMedio);
                    vrNegociado := (Self.PrecoTabela / quantidadeParcelas) * juros;
                    vrNegociado := vrNegociado * quantidadeParcelas;
                end
            end;
        end
        else
        begin
            vrNegociado := Self.PrecoTabela;
        end;

        Self.ValorUnitario := TLib.ArredondarNumero(vrNegociado);

    except
        on e: Exception do
        begin
            raise Exception.Create('Erro ao calcular pre�o em tabela '+#13 + e.Message);
        end;
    end;
end;

function TOrcamentoItens.Consultar(parametros: TParametro): Tlista<TOrcamentoItens>;
var
    query: TStringBuilder;
    condicao: TCondicaoConsulta;
    camposPadrao: TStringList;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('Z6_NUM',ccIgual, lgNenhuma);
        condicao.Adiciona('Z6_PRODUTO',ccIgual, lgAND);
        condicao.Adiciona('Z6_DESCRI',ccIgual, lgAND);
        condicao.Adiciona('Z6_QUANT',ccIgual, lgAND);
        condicao.Adiciona('Z6_VRUNIT',ccIgual, lgAND);
        condicao.Adiciona('Z6_VLRITEM',ccIgual, lgAND);
        condicao.Adiciona('Z6_LOCAL',ccIgual, lgAND);
        condicao.Adiciona('Z6_UM',ccIgual, lgAND);
        condicao.Adiciona('Z6_TIPTRIB',ccIgual, lgAND);
        condicao.Adiciona('Z6_TES',ccIgual, lgAND);
        condicao.Adiciona('Z6_CF',ccIgual, lgAND);
        condicao.Adiciona('Z6_VENDIDO',ccIgual, lgAND);
        condicao.Adiciona('Z6_DOCTD',ccIgual, lgAND);
        condicao.Adiciona('Z6_SERTD',ccIgual, lgAND);
        condicao.Adiciona('Z6_PDV',ccIgual, lgAND);
        condicao.Adiciona('Z6_VALIPI',ccIgual, lgAND);
        condicao.Adiciona('Z6_VALICM',ccIgual, lgAND);
        condicao.Adiciona('Z6_BASEICM',ccIgual, lgAND);
        condicao.Adiciona('Z6_TABELA',ccIgual, lgAND);
        condicao.Adiciona('Z6_EMISSAO',ccIgual, lgAND);
        condicao.Adiciona('Z6_DESCPRO',ccIgual, lgAND);
        condicao.Adiciona('Z6_PRCTAB',ccIgual, lgAND);
        condicao.Adiciona('Z6_FILIAL',ccIgual, lgAND);
        condicao.Adiciona('Z6_VEND',ccIgual, lgAND);
        condicao.Adiciona('Z6_FORMSEL',ccIgual, lgAND);
        condicao.Adiciona('Z6_ITEM',ccIgual, lgAND);
        condicao.Adiciona('Z6_ICMSRET',ccIgual, lgAND);
        condicao.Adiciona('Z6_VALFRE',ccIgual, lgAND);
        condicao.Adiciona('Z6_SEGURO',ccIgual, lgAND);
        condicao.Adiciona('Z6_DESPESA',ccIgual, lgAND);
        condicao.Adiciona('Z6_QENT',ccIgual, lgAND);
        condicao.Adiciona('Z6_PICM',ccIgual, lgAND);
        condicao.Adiciona('Z6_QDEV',ccIgual, lgAND);
        condicao.Adiciona('Z6_COMIS',ccIgual, lgAND);
        condicao.Adiciona('Z6_BASERET',ccIgual, lgAND);
        condicao.Adiciona('Z6_CAMPANH',ccIgual, lgAND);
        condicao.Adiciona('Z6.D_E_L_E_T_',ccIgual, lgAND);
        condicao.Adiciona('Z6.R_E_C_N_O_',ccIgual, lgAND);
        condicao.Adiciona('Z6.R_E_C_D_E_L_',ccIgual, lgAND);
        condicao.Adiciona('Z6_T',ccIgual, lgAND);
        condicao.Adiciona('Z6_TPENT',ccIgual, lgAND);
        condicao.Adiciona('Z6_CGER',ccIgual, lgAND);
        condicao.Adiciona('Z6_DTPSETD',ccIgual, lgAND);
        condicao.Adiciona('Z6_QTPSETD',ccIgual, lgAND);
        condicao.Adiciona('Z6_QTLIBAR',ccIgual, lgAND);
        condicao.Adiciona('Z6_PCPSETD',ccIgual, lgAND);
        condicao.Adiciona('Z6_CCOMPR',ccIgual, lgAND);
        condicao.Adiciona('Z6_CNFE',ccIgual, lgAND);
        condicao.Adiciona('Z6_TDITORI',ccIgual, lgAND);
        condicao.Adiciona('Z6_TDREGRA',ccIgual, lgAND);
        condicao.Adiciona('Z6_TDVUNIT',ccIgual, lgAND);
        condicao.Adiciona('Z6_STATUS',ccIgual, lgAND);
        condicao.Adiciona('Z6_USERID',ccIgual, lgAND);
        condicao.Adiciona('Z6_FDTENTR',ccIgual, lgAND);
        condicao.Adiciona('Z6_TOTIMP',ccIgual, lgAND);
        condicao.Adiciona('Z6_TDITEM',ccIgual, lgAND);
        condicao.Adiciona('Z6_ITEMPAI',ccIgual, lgAND);
        condicao.Adiciona('Z6_GRPSELF', ccIgual, lgAND);
        condicao.Adiciona('Z6_PRDSELF', ccIgual, lgAND);
        condicao.Adiciona('Z6_BSESELF', ccIgual, lgAND);
        condicao.Adiciona('Z6_EMBSELF', ccIgual, lgAND);
        condicao.Adiciona('Z6_CORSELF', ccIgual, lgAND);
        condicao.Adiciona('Z6_COLSELF', ccIgual, lgAND);

        camposPadrao := Self.ObterListaDeCampos(Consulta,[]);

        query := TStringBuilder.Create;
        query.Append('SELECT ');
        query.Append(camposPadrao.CommaText);
        query.Append(' FROM ').Append(Self.TabelaReferencia).Append(' AS Z6 ');
        query.Append(' WHERE D_E_L_E_T_ = '''' ');

        Result := dao.Consultar(query.ToString, parametros);
    finally
       if query <> nil then
            FreeAndNil(query);

        if condicao <> nil then
            FreeAndNil(condicao);

        if camposPadrao <> nil then
            FreeAndNil(camposPadrao);
    end;
end;

procedure TOrcamentoItens.CopiarPara(objeto: TObject);
begin
    inherited;
    if FProduto.Preenchido then
        FProduto.CopiarPara(TOrcamentoItens(objeto).Produto);

    if (FTipoEntrega_ <> nil) and (FTipoEntrega_.Preenchido) then
        FTipoEntrega_.CopiarPara(TOrcamentoItens(objeto).TipoEntrega_);
end;

constructor TOrcamentoItens.Create;
begin
    FProduto := TProduto.Create;
    FTipoEntrega_ := TTipoEntrega.Create;
end;


function TOrcamentoItens.ExcluirItensPorOrcamento(numeroOrcamento: string): boolean;
var
    query: string;
    parametro: TParametro;
begin
    result := false;
    try
        try
            parametro := TParametro.Create;
            parametro.Add('','','Z6_NUM',numeroOrcamento);
            parametro.Add('','','Z6_FILIAL',TUsuarioLogado.ObterInstancia.Filial.Filial);
            query := 'DELETE FROM '+Self.TabelaReferencia+' WHERE Z6_NUM = :Z6_NUM AND Z6_FILIAL = :Z6_FILIAL';
            dao.Excluir(query,parametro);
            result := true;
        except
            raise Exception.Create('Erro ao excluir os itens do orcamento');
        end;

    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;
end;

function TOrcamentoItens.Excluir(definitivo: boolean): boolean;
var
    fabrica: TFabricaSql;
    query: WideString;
    parametros:TParametro;
begin
    result := false;
    try
        try
            fabrica := TFabricaSQL.Create(Self);
            query := fabrica.GerarSqlExclusao(definitivo);
            parametros := Self.ObjetoParaParametros(Exclusao);
            dao.Excluir(query,parametros);
        except
            raise Exception.Create('Erro ao excluir item do or�amento');

        end;
        result := true;
    finally
        if fabrica <> nil then
            FreeAndNil(fabrica);

        if parametros <> nil then
            FreeAndNil(parametros);
    end;

end;

destructor TOrcamentoItens.Destroy;
begin
    if FProduto <> nil then
        FreeAndNil(FProduto);

    if FTipoEntrega_ <> nil then
        FreeAndNil(FTipoEntrega_);

end;

function TOrcamentoItens.GetSobEncomenda: Boolean;
begin
    if Pos('E/', FCampanha) > 0 then
        Result := true
    else
        Result := false;
end;

function TOrcamentoItens.GetStatusConferecia: string;
begin
    Result := TLib.IfTernario(Self.Conferido, 'CONFERIDO', ' - ');
end;

function TOrcamentoItens.GetTabelaPreco: string;
begin
    if (FTabelaPreco = emptyStr) then
    begin
        if not Self.Produto.Preenchido then
            Self.Produto.Obter(Self.CodigoProduto);

        if Self.Produto.ProdutoEmPromocao then
            FTabelaPreco := '2'
        else
            FTabelaPreco := '1';
    end;

    Result := FTabelaPreco;
end;

function TOrcamentoItens.GetValorComissao: double;
begin
    Result := (((ValorTotal - ValorDesconto) + ValorDespesa) * PercentualComissao) / 100;
end;

function TOrcamentoItens.Inserir: boolean;
var
    fabrica: TFabricaSql;
    query: WideString;
    parametros:TParametro;
begin
    result := false;
    try
        try
            fabrica := TFabricaSQL.Create(Self);
            query := fabrica.GerarSqlInsercao;
            parametros := Self.ObjetoParaParametros(Insercao);
            dao.Inserir(query,parametros);
        except
            raise Exception.Create('Erro ao inserir item do or�amento');

        end;
        result := true;
    finally
        if fabrica <> nil then
            FreeAndNil(fabrica);

        if parametros <> nil then
            FreeAndNil(parametros);
    end;

end;

function TOrcamentoItens.GetConferido: Boolean;
begin
    // result := tlib.IfTernario(Quantidade = QuantidadeConferida, true, false);
    Result := TLib.IfTernario(CompareValue(quantidade, QuantidadeConferida) = EqualsValue, true, false);
end;

function TOrcamentoItens.GetCustoCompra: double;
var
    parametros: TParametro;
    dataset: TClientDataSet;
    cdDataSet: TControleDados<TClientDataSet,TDataSetDAO>;
begin
    if FCustoCompra = 0 then
    begin
        if (tipoVenda = 'VR') then
        begin
            try
                FCustoCompra := ObterCusto(tcCustoCompra);
            except
                raise;
            end;
        end;
    end;
    Result := FCustoCompra;
end;

function TOrcamentoItens.GetCustoGerencial: double;
begin
    if FCustoGerencial = 0 then
    begin
        if (tipoVenda = 'VR') then
        begin
            if not Self.Produto.Preenchido then
                Self.Produto.Obter(Self.CodigoProduto);

            Self.FCustoGerencial := Self.Produto.CustoGerencial;

        end;
        // else
        // raise Exception.Create('Campo "Custo Gerencial" est� com problema, contatar a central de servi�o.');
    end;

    Result := Self.FCustoGerencial;
end;

function TOrcamentoItens.GetCustoNota: double;
begin
    if FCustoNota = 0 then
    begin
        if tipoVenda = 'VR' then
        begin
            FCustoNota := ObterCusto(tcCustoNota);
        end;
    end;
    Result := FCustoNota;
end;

function TOrcamentoItens.ObterCusto(tipoCusto: TTipoCusto): Double;
var
    dataset: TClientDataSet;
    query: string;
    custo: double;
    campo: string;
    cdDataSet: TControleDados<TClientDataSet,TDataSetDAO>;

begin
    try
        cdDataSet:= TControleDados<TClientDataSet,TDataSetDAO>.Create;
        campo := TLib.IfTernario(tipoCusto = tcCustoCompra, 'B2_CULTCPA', 'B2_CNFS');

        // Pega o Custo do SB2
        query := ' SELECT ' + campo + ' FROM SB2010 WITH(NOLOCK) WHERE B2_FILIAL = ' + QuotedStr(TUsuarioLogado.ObterInstancia.Filial.Filial) + ' AND B2_COD = ' +
          QuotedStr(Self.CodigoProduto) + ' AND B2_LOCAL = ''01'' AND D_E_L_E_T_<>''*'' ';

        dataset :=  cdDataSet.Consultar(query,nil);
        custo := dataset.FieldByName(campo).AsFloat;

        if custo <= 0 then
        begin
            // Pega o custo do CD
            query := ' SELECT ' + campo + ' FROM SB2010 WITH(NOLOCK) WHERE B2_FILIAL = ' + QuotedStr(TUsuarioLogado.ObterInstancia.Filial.CD) +
              ' AND B2_COD = ' + QuotedStr(Self.CodigoProduto) + ' AND B2_LOCAL = ''01'' AND D_E_L_E_T_<>''*'' ';
            dataset := cdDataSet.Consultar(query, nil);
            custo := dataset.FieldByName(campo).AsFloat;
        end;

        if custo <= 0 then
        begin
            // Verifica custo nas demais filiais da UF
            query := 'SELECT B2.' + campo + ' FROM SB2010 AS B2 WITH(NOLOCK) INNER JOIN '+TEmpresa.TabelaReferencia+' AS EMP WITH(NOLOCK) ' +
              ' ON B2.B2_FILIAL = EMP.S13_FILIAL  WHERE EMP.S13_S12_EMP = ' + QuotedStr(TUsuarioLogado.ObterInstancia.Filial.Empresa) + ' AND EMP.S13_UF = ' +
              QuotedStr(TUsuarioLogado.ObterInstancia.Filial.Uf) + ' AND B2.B2_COD = ' + QuotedStr(CodigoProduto) + ' AND B2.B2_LOCAL = ''01'' ' +
              ' AND B2.D_E_L_E_T_<>''*'' ' + ' AND B2.' + campo + ' > 0';

            dataset := cdDataSet.Consultar(query, nil);
            custo := dataset.FieldByName(campo).AsFloat;
        end;

        Result := custo;
    finally
        if dataSet <> nil then
            FreeAndNil(dataSet);

        if cdDataSet <> nil then
            FreeAndNil(cdDataSet);

    end;

end;

function TOrcamentoItens.GetEmCampanha: Boolean;
begin
    if ((Pos('P/', FCampanha) > 0) and (TUsuarioLogado.ObterInstancia.Filial.UF = 'MT')) or
      ((Pos('R/', FCampanha) > 0) and (TUsuarioLogado.ObterInstancia.Filial.UF = 'PR')) then
        Result := true
    else
        Result := false;
end;

function TOrcamentoItens.GetEmPromocao: Boolean;
begin
    if Pos('X/', FCampanha) > 0 then
        Result := true
    else
        Result := false;
end;

function TOrcamentoItens.GetForaDeLinha: Boolean;
begin
    if Pos('F/', FCampanha) > 0 then
        Result := true
    else
        Result := false;
end;


function TOrcamentoItens.GetLocalEstoque: string;
begin
    Result := '01'
end;

function TOrcamentoItens.GetRemanescenteConferencia: double;
begin
    Result := quantidade - QuantidadeConferida;
end;


{$ENDREGION}
{$REGION 'Regras de Neg�cio'}

procedure TOrcamentoItens.PopularObjeto(OrcamentoItens: TOrcamentoItens);
begin
    OrcamentoItens.CopiarPara(Self);
    FPreenchido := true;
end;

procedure TOrcamentoItens.SetBaseIcms(const Value: double);
begin
    FBaseIcms := Value;
end;

procedure TOrcamentoItens.SetBaseIcmsRetido(const Value: double);
begin
    FBaseIcmsRetido := Value;
end;

procedure TOrcamentoItens.SetBaseSelfColor(const Value: integer);
begin
    FBaseSelfColor := Value;
end;

procedure TOrcamentoItens.CalcularValorTotal;
begin
    FValorTotal := TLib.ArredondarNumero((Self.quantidade * Self.ValorUnitario));
end;

procedure TOrcamentoItens.SetCampanha(const Value: string);
begin
    FCampanha := Value;
end;

procedure TOrcamentoItens.SetCFOP(const Value: string);
begin
    FCFOP := Value;
end;

procedure TOrcamentoItens.SetCodigoPDV(const Value: string);
begin
    FCodigoPDV := Value;
end;

procedure TOrcamentoItens.SetCodigoProduto(const Value: string);
begin
    FCodigoProduto := Value;
end;

procedure TOrcamentoItens.SetCodigoRegraCA(const Value: string);
begin
    FCodigoRegraCA := Value;
end;

procedure TOrcamentoItens.SetCodigoTES(const Value: string);
begin
    FCodigoTES := Value;
end;

procedure TOrcamentoItens.SetCodigoVendedor(const Value: string);
begin
    FCodigoVendedor := Value;
end;

procedure TOrcamentoItens.SetColoranteSelfColor(const Value: integer);
begin
    FColoranteSelfColor := Value;
end;

procedure TOrcamentoItens.SetCorSelfColor(const Value: integer);
begin
    FCorSelfColor := Value;
end;

procedure TOrcamentoItens.SetCustoCompra(const Value: double);
begin
    FCustoCompra := Value;
end;

procedure TOrcamentoItens.SetCustoGerencial(const Value: double);
begin
    FCustoGerencial := Value;
end;

procedure TOrcamentoItens.SetCustoNota(const Value: double);
begin
    FCustoNota := Value;
end;

procedure TOrcamentoItens.SetDataEmissao(const Value: string);
begin
    FDataEmissao := Value;
end;

procedure TOrcamentoItens.SetDataEntregaDeposito(const Value: string);
begin
    FDataEntregaDeposito := Value;
end;

procedure TOrcamentoItens.SetDataEntregaPSE(const Value: string);
begin
    FDataEntregaPSE := Value;
end;

procedure TOrcamentoItens.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TOrcamentoItens.SetDescricaoProduto(const Value: string);
begin
    FDescricaoProduto := Value;
end;

procedure TOrcamentoItens.SetEmbalagemSelfColor(const Value: integer);
begin
    FEmbalagemSelfColor := Value;
end;

procedure TOrcamentoItens.SetFilial(const Value: string);
begin
    FFilial := Value;
end;

procedure TOrcamentoItens.SetFilial_(const Value: TFilial);
begin
    FFilial_ := Value;
end;

procedure TOrcamentoItens.SetFlegueVendido(const Value: string);
begin
    FFlegueVendido := Value;
end;

procedure TOrcamentoItens.SetFormulaSelfColor(const Value: string);
begin
    FFormulaSelfColor := Value;
end;

procedure TOrcamentoItens.SetGrupoSelfColor(const Value: integer);
begin
    FGrupoSelfColor := Value;
end;


procedure TOrcamentoItens.SetItem(const Value: string);
begin
    FItem := Value;
end;

procedure TOrcamentoItens.SetItemComissaoAplicada(const Value: string);
begin
    FItemComissaoAplicada := Value;
end;

procedure TOrcamentoItens.SetItemOrigem(const Value: string);
begin
    FItemOrigem := Value;
end;

procedure TOrcamentoItens.SetItemPai(const Value: String);
begin
    FItemPai := Value;
end;

procedure TOrcamentoItens.SetLocalEstoque(const Value: string);
begin
    FLocalEstoque := Value;
end;

procedure TOrcamentoItens.SetLocalEstoquePaiAlternativo(const Value: string);
begin
    FLocalEstoquePaiAlternativo := Value;
end;


procedure TOrcamentoItens.SetNumero(const Value: string);
begin
    FNumero := Value;
end;

procedure TOrcamentoItens.SetNumeroDocumento(const Value: string);
begin
    FNumeroDocumento := Value;
end;

procedure TOrcamentoItens.SetPaiAlternativo(const Value: Boolean);
begin
    FPaiAlternativo := Value;
end;

procedure TOrcamentoItens.SetPedidoCompraPSE(const Value: string);
begin
    FPedidoCompraPSE := Value;
end;

procedure TOrcamentoItens.SetPercComissao(const Value: double);
begin
    FPercComissao := Value;
end;

procedure TOrcamentoItens.SetPercentualPrecoNegociado(const Value: double);
// var
// valorCalculado: double;
begin
    // if Value <> 0 then
    // begin
    // valorCalculado := RoundTo(PrecoTabela - ((PrecoTabela * Value) / 100), -2);
    //
    // ValorUnitario := valorCalculado;
    // end
    // else
    // begin
    // ValorUnitario := PrecoTabela;
    // end;

    FPercentualPrecoNegociado := Value;

    CalcularValorTotal;
end;

procedure TOrcamentoItens.SetPercIcms(const Value: double);
begin
    FPercIcms := Value;
end;

procedure TOrcamentoItens.SetPesoItem(const Value: double);
begin
    FPesoItem := Value;
end;

procedure TOrcamentoItens.SetPrecoTabela(const Value: double);
begin
    FPrecoTabela := Value;
end;

procedure TOrcamentoItens.SetProduto(const Value: TProduto);
begin
    FProduto := Value;
end;

procedure TOrcamentoItens.SetProdutoPaiAlternativo(const Value: TProduto);
begin
    FProdutoPaiAlternativo := Value;
end;

procedure TOrcamentoItens.SetProdutoSelfColor(const Value: integer);
begin
    FProdutoSelfColor := Value;
end;

procedure TOrcamentoItens.SetQuantidade(const Value: double);
begin
    // if Value <= 0 then
    // begin
    // raise Exception.Create('Quantidade n�o pode ser menor ou igual a zero!!!');
    // end;
    //
    // if not Produto.Preenchido then
    // Produto.Obter(CodigoProduto);
    //
    // if not Produto.ValidarQuantidadeMultipla(Value) then
    // Exit;
    //
    // if (Produto.ProdutoSelfColor) or (Produto.ProdutoHidrometro) then
    // begin
    // if (FQuantidade > 0) and (FQuantidade <> Value) then
    // begin
    // raise Exception.Create('Quantidade do produto..: ' + Trim(DescricaoProduto) + '  n�o pode ser alterada...');
    // end;
    // end;
    //
    // if TipoEntrega = 'CS' then
    // begin
    // if Value <> 1 then
    // begin
    // FQuantidade := 1;
    // end;
    // end
    // else
    // FQuantidade := Value;
    //
    // Self.CalcularValorTotal;

    FQuantidade := Value;
    Self.CalcularValorTotal;
end;

procedure TOrcamentoItens.SetQuantidadeConferida(const Value: double);
begin
    FQuantidadeConferida := Value;
end;

procedure TOrcamentoItens.SetQuantidadeDevolvida(const Value: double);
begin
    FQuantidadeDevolvida := Value;
end;

procedure TOrcamentoItens.SetQuantidadeEntregue(const Value: double);
begin
    FQuantidadeEntregue := Value;
end;

procedure TOrcamentoItens.SetQuantidadeLiberadaPSE(const Value: double);
begin
    FQuantidadeLiberadaPSE := Value;
end;

procedure TOrcamentoItens.SetQuantidadePSE(const Value: double);
begin
    FQuantidadePSE := Value;
end;

procedure TOrcamentoItens.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TOrcamentoItens.SetRecnoDelete(const Value: integer);
begin
    FRecnoDelete := Value;
end;

procedure TOrcamentoItens.SetSerieDocumento(const Value: string);
begin
    FSerieDocumento := Value;
end;

procedure TOrcamentoItens.SetStatusDevolucao(const Value: string);
begin
    FStatusDevolucao := Value;
end;

procedure TOrcamentoItens.SetTabelaPreco(const Value: string);
begin
    FTabelaPreco := Value;
end;

procedure TOrcamentoItens.SetTabelaPremio(const Value: string);
begin
    FTabelaPremio := Value;
end;

procedure TOrcamentoItens.SetTipoAlternativo(const Value: TTipoAlternativo);
begin
    FTipoAlternativo := Value;
end;

procedure TOrcamentoItens.SetTipoEntrega(const Value: string);
begin
    FTipoEntrega := Value;

    if Self.Filial_ <> nil then
        FTipoEntrega_ := Self.Filial_.ObterTipoEntrega(Value);

end;

procedure TOrcamentoItens.SetTipoEntregaPaiAlternativo(const Value: TTipoEntrega);
begin
    FTipoEntregaPaiAlternativo := Value;
end;

procedure TOrcamentoItens.SetTipoEntrega_(const Value: TTipoEntrega);
begin
    FTipoEntrega_ := Value;
end;

procedure TOrcamentoItens.SetTipoTributacao(const Value: string);
begin
    FTipoTributacao := Value;
end;

procedure TOrcamentoItens.SetTipoVenda(const Value: string);
begin
    FTipoVenda := Value;
end;

procedure TOrcamentoItens.SetUnidadeMedida(const Value: string);
begin
    FUnidadeMedida := Value;
end;

procedure TOrcamentoItens.SetUsuarioBaixaDeposito(const Value: string);
begin
    FUsuarioBaixaDeposito := Value;
end;

procedure TOrcamentoItens.SetUsuarioSistema(const Value: string);
begin
    FUsuarioSistema := Value;
end;

procedure TOrcamentoItens.SetValorDesconto(const Value: double);
begin
    FValorDesconto := Value;
end;

procedure TOrcamentoItens.SetValorDespesa(const Value: double);
begin
    FValorDespesa := Value;
end;

procedure TOrcamentoItens.SetValorFrete(const Value: double);
begin
    FValorFrete := Value;
end;

procedure TOrcamentoItens.SetValorIcms(const Value: double);
begin
    FValorIcms := Value;
end;

procedure TOrcamentoItens.SetValorIcmsRetido(const Value: double);
begin
    FValorIcmsRetido := Value;
end;

procedure TOrcamentoItens.SetValorIPI(const Value: double);
begin
    FValorIPI := Value;
end;

procedure TOrcamentoItens.SetValorSeguro(const Value: double);
begin
    FValorSeguro := Value;
end;

procedure TOrcamentoItens.SetValorTotal(const Value: double);
begin
    FValorTotal := StrToFloat(FormatFloat('0.00', Value));
end;

procedure TOrcamentoItens.SetValorUnitario(const Value: double);
begin
    { if ((TipoEntrega <> '') and (TipoEntrega <> 'CS')) and (PrecoTabela <> Value) and (PrecoTabela > 0) then
      begin
      if Value <= 0 then
      raise Exception.Create('O valor negociado n�o pode ser menor ou igual a zero!!!');

      if (Tabela = 'T1') then
      begin
      if (PrecoTabela > Value) and (Tlib.UsuarioLogado.Filial.PermiteNegociarPrecoParaMenor = False) then
      raise Exception.Create('N�o � permitido negocioar pre�o menor que o pre�o de tabela:'#13 + 'Pre�o Tabela:    ' + FormatFloat('##0.00',
      PrecoTabela) + ' ' + #13 + 'Pre�o Negociado: ' + FormatFloat('##0.00', Value));

      if (PrecoTabela < Value) and (Tlib.UsuarioLogado.Filial.PermiteNegociarPrecoParaMaior = False) then
      raise Exception.Create('N�o � permitido negocioar pre�o maior que o pre�o de tabela:'#13 + 'Pre�o Tabela:    ' + FormatFloat('##0.00',
      PrecoTabela) + ' ' + #13 + 'Pre�o Negociado: ' + FormatFloat('##0.00', Value));
      end;

      if (Tabela <> 'T1') or (Tlib.UsuarioLogado.ChecarPermissaoNaRotina('FRMCONORCAMENTO', 'LIBORC', True, 'Pre�o negociado')) then
      begin
      FValorUnitario := Value;

      FPercentualPrecoNegociado := RoundTo(100 - (ValorUnitario * 100) / PrecoTabela, -2);

      Campanha := StringReplace(Campanha, 'X/', '', [rfReplaceAll]);
      end
      else
      raise Exception.Create('Sem permiss�o para alterar pre�o');
      end
      else
      begin
      FValorUnitario := Value;

      FPercentualPrecoNegociado := 0;

      if not Produto.Preenchido then
      Produto.Obter(CodigoProduto);

      if Produto.ProdutoEmPromocao then
      Campanha := Campanha + 'X/';
      end;
      Self.CalcularValorTotal; }

    FValorUnitario := Value;
    Self.CalcularValorTotal;
end;

{$ENDREGION}
{$REGION 'M�todos de Propriedades'}
{$ENDREGION}

end.
