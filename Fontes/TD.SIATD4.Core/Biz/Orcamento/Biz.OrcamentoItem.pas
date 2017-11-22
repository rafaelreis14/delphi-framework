{ *Created by @ReisCodeGenerator* }
unit Biz.OrcamentoItem;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
    Framework.Interfaces.CRUD, Dal.FabricaSQL, Biz.Produto, Biz.Filial,
    Biz.TabelaComissao;

type

    [TReferenceTable('SZ6010')]
    TOrcamentoItem = class(TClasseBase, ICRUD<TOrcamentoItem>)
    private
        FNumeroOrcamento: string;
        FCodigoProduto: string;
        FQuantidade: double;
        FArmazem: string;
        FUnidadeMedida: string;
        FPercentualDesconto: double;
        FCodigoTes: string;
        FCfop: string;
        FCodigoTabelaPreco: string;
        FDataEmissao: string;
        FValorDesconto: double;
        FValorPrecoTabela: double;
        FCodigoFilial: string;
        FCodigoVendedor: string;
        FFormulaSelfColor: string;
        FItem: string;
        FValorDespesa: double;
        FFilialReserva: string;
        FUsuario: string;
        FPercentualComissao: double;
        FTabelaComissaoCodigo: string;
        FTipoEntrega: string;
        FCodigoRegraComissaoAplicada: string;
        FCodigoItemComissaoAplicada: string;
        FValorUnitarioNegociado: double;
        FValorTotal: double;
        FDelete: string;
        FRecno: integer;
        FRecnoDelete: integer;
        FValorIcmsGerencial: double;
        FItemPai: string;
        FCodigoGrupoSelfColor: double;
        FCodigoProdutoSelfColor: double;
        FCodigoBaseSelfColor: double;
        FCodigoEmbalagemSelfColor: double;
        FCodigoCorSelfColor: double;
        FCodigoColoranteSelfColor: double;
        FProduto: TProduto;
        FFilial_: TFilial;
        FDescricaoProduto: String;
        FCampanha: string;
        FPercentualDescontoValorNegociado: double;
        procedure SetNumeroOrcamento(const Value: string);
        procedure SetCodigoProduto(const Value: string);
        procedure SetQuantidade(const Value: double);
        procedure SetArmazem(const Value: string);
        procedure SetUnidadeMedida(const Value: string);
        procedure SetPercentualDesconto(const Value: double);
        procedure SetCodigoTes(const Value: string);
        procedure SetCfop(const Value: string);
        procedure SetCodigoTabelaPreco(const Value: string);
        procedure SetDataEmissao(const Value: string);
        procedure SetValorDesconto(const Value: double);
        procedure SetValorPrecoTabela(const Value: double);
        procedure SetCodigoFilial(const Value: string);
        procedure SetCodigoVendedor(const Value: string);
        procedure SetFormulaSelfColor(const Value: string);
        procedure SetItem(const Value: string);
        procedure SetValorDespesa(const Value: double);
        procedure SetFilialReserva(const Value: string);
        procedure SetUsuario(const Value: string);
        procedure SetPercentualComissao(const Value: double);
        procedure SetTabelaComissaoCodigo(const Value: string);
        procedure SetTipoEntrega(const Value: string);
        procedure SetCodigoRegraComissaoAplicada(const Value: string);
        procedure SetCodigoItemComissaoAplicada(const Value: string);
        procedure SetValorUnitarioNegociado(const Value: double);
        procedure SetValorTotal(const Value: double);
        procedure SetDelete(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetRecnoDelete(const Value: integer);
        procedure SetValorIcmsGerencial(const Value: double);
        procedure SetItemPai(const Value: string);
        procedure SetCodigoGrupoSelfColor(const Value: double);
        procedure SetCodigoProdutoSelfColor(const Value: double);
        procedure SetCodigoBaseSelfColor(const Value: double);
        procedure SetCodigoEmbalagemSelfColor(const Value: double);
        procedure SetCodigoCorSelfColor(const Value: double);
        procedure SetCodigoColoranteSelfColor(const Value: double);
        procedure SetProduto(const Value: TProduto);
        procedure SetFilial_(const Value: TFilial);
        function GetDescricaoProduto: String;
        procedure SeDescricaoProduto(const Value: String);

        procedure CalcularValorTotalProduto;
        procedure SetCampanha(const Value: string);
        procedure SetPercentualDescontoValorNegociado(const Value: double);
        function GetForaDeLinha: Boolean;
        function GetEncomenda: Boolean;
        function GetPromocao: Boolean;
        function GetCombo: Boolean;
        function GetCampanhaEstado: Boolean;

    public
        class var dao: TControleDados<TLista<TOrcamentoItem>, TListaDAO<TOrcamentoItem>>;

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
        function Excluir: Boolean;

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
        function Obter(ID: string): TOrcamentoItem; overload;

        /// <summary>
        /// Método que retorna um objeto preenchido
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Obter(parametros: TParametro): TOrcamentoItem; overload;

        /// <summary>
        /// Método que retonar uma lista com varios objetos de acordo com parametro passado
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Consultar(parametros: TParametro): TLista<TOrcamentoItem>;

        /// <summary>
        /// Método que preenche a instância do Objeto
        /// </summary>
        /// <param name="ClasseBase">
        /// objeto de parametro para preenchimento da instância
        /// </param>
        procedure PreencherObjeto(OrcamentoItem: TOrcamentoItem);

        [TPersistable(fgPersistable, 'Z6_FILRES')]
        [TMaxLenght(2)]
        property FilialReserva: string read FFilialReserva write SetFilialReserva;

        [TPersistable(fgPersistable, 'Z6_TPENT')]
        [TMaxLenght(3)]
        property TipoEntrega: string read FTipoEntrega write SetTipoEntrega;

        [TPersistable(fgPersistable, 'Z6_ITEM')]
        [TMaxLenght(2)]
        property Item: string read FItem write SetItem;

        [TPersistable(fgPersistable, 'Z6_PRODUTO')]
        [TMaxLenght(15)]
        property CodigoProduto: string read FCodigoProduto write SetCodigoProduto;

        property DescricaoProduto: String read FDescricaoProduto write SeDescricaoProduto;

        [TPersistable(fgPersistable, 'Z6_UM')]
        [TMaxLenght(2)]
        property UnidadeMedida: string read FUnidadeMedida write SetUnidadeMedida;

        [TPersistable(fgPersistable, 'Z6_QUANT')]
        property Quantidade: double read FQuantidade write SetQuantidade;

        [TPersistable(fgPersistable, 'Z6_PRCTAB')]
        property ValorPrecoTabela: double read FValorPrecoTabela write SetValorPrecoTabela;

        [TPersistable(fgPersistable, 'Z6_TDVUNIT')]
        property ValorUnitarioNegociado: double read FValorUnitarioNegociado write SetValorUnitarioNegociado;
        property PercentualDescontoValorNegociado: double read FPercentualDescontoValorNegociado write SetPercentualDescontoValorNegociado;

        [TPersistable(fgPersistable, 'Z6_TDVITEM')]
        property ValorTotal: double read FValorTotal write SetValorTotal;

        [TPersistable(fgPersistable, 'Z6_COMIS')]
        property PercentualComissao: double read FPercentualComissao write SetPercentualComissao;

        [TPersistable(fgPersistable, 'Z6_T')]
        [TMaxLenght(2)]
        property TabelaComissaoCodigo: string read FTabelaComissaoCodigo write SetTabelaComissaoCodigo;
        procedure TabelaComissaoCodigoCalcularPreco(TabelaComissao: TTabelaComissao; quantidadeParcelas: integer; totalPrecoEmTabela, valorEntrada: Currency);
        function CalcularPMT(qtParcelas, taxaDeJuros, vrLiquido: Real): Currency;

        [TPersistable(fgPersistable, 'Z6_LOCAL')]
        [TMaxLenght(2)]
        property Armazem: string read FArmazem write SetArmazem;

        [TPersistable(fgPersistable, 'Z6_DESC')]
        property PercentualDesconto: double read FPercentualDesconto write SetPercentualDesconto;

        [TPersistable(fgPersistable, 'Z6_DESCPRO')]
        property ValorDesconto: double read FValorDesconto write SetValorDesconto;

        [TPersistable(fgPersistable, 'Z6_DESPESA')]
        property ValorDespesa: double read FValorDespesa write SetValorDespesa;

        [TPersistable(fgPersistable, 'Z6_TES')]
        [TMaxLenght(3)]
        property CodigoTes: string read FCodigoTes write SetCodigoTes;

        [TPersistable(fgPersistable, 'Z6_CF')]
        [TMaxLenght(5)]
        property Cfop: string read FCfop write SetCfop;

        [TPersistable(fgPersistable, 'Z6_TABELA')]
        [TMaxLenght(1)]
        property CodigoTabelaPreco: string read FCodigoTabelaPreco write SetCodigoTabelaPreco;

        [TPersistable(fgPersistable, 'Z6_FILIAL')]
        [TMaxLenght(2)]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgPersistable, 'Z6_NUM')]
        [TMaxLenght(6)]
        property NumeroOrcamento: string read FNumeroOrcamento write SetNumeroOrcamento;

        [TPersistable(fgPersistable, 'Z6_EMISSAO')]
        [TMaxLenght(8)]
        property DataEmissao: string read FDataEmissao write SetDataEmissao;

        [TPersistable(fgPersistable, 'Z6_VEND')]
        [TMaxLenght(6)]
        property CodigoVendedor: string read FCodigoVendedor write SetCodigoVendedor;

        [TPersistable(fgPersistable, 'Z6_USERID')]
        [TMaxLenght(50)]
        property Usuario: string read FUsuario write SetUsuario;

        [TPersistable(fgPersistable, 'Z6_TDREGRA')]
        [TMaxLenght(6)]
        property CodigoRegraComissaoAplicada: string read FCodigoRegraComissaoAplicada write SetCodigoRegraComissaoAplicada;

        [TPersistable(fgPersistable, 'Z6_TDITEM')]
        [TMaxLenght(3)]
        property CodigoItemComissaoAplicada: string read FCodigoItemComissaoAplicada write SetCodigoItemComissaoAplicada;

        [TPersistable(fgPersistable, 'Z6_TDICMGE')]
        property ValorIcmsGerencial: double read FValorIcmsGerencial write SetValorIcmsGerencial;

        [TPersistable(fgPersistable, 'Z6_FORMSEL')]
        [TMaxLenght(330)]
        property FormulaSelfColor: string read FFormulaSelfColor write SetFormulaSelfColor;

        [TPersistable(fgPersistable, 'Z6_CAMPANH')]
        [TMaxLenght(50)]
        property Campanha: string read FCampanha write SetCampanha;
        property ForaDeLinha: Boolean read GetForaDeLinha;
        property Encomenda: Boolean read GetEncomenda;
        property Promocao: Boolean read GetPromocao;
        property Combo: Boolean read GetCombo;
        property CampanhaEstado: Boolean read GetCampanhaEstado;

        [TPersistable(fgPersistable, 'Z6_ITEMPAI')]
        [TMaxLenght(4)]
        property ItemPai: string read FItemPai write SetItemPai;

        [TPersistable(fgPersistable, 'Z6_GRPSELF')]
        property CodigoGrupoSelfColor: double read FCodigoGrupoSelfColor write SetCodigoGrupoSelfColor;

        [TPersistable(fgPersistable, 'Z6_PRDSELF')]
        property CodigoProdutoSelfColor: double read FCodigoProdutoSelfColor write SetCodigoProdutoSelfColor;

        [TPersistable(fgPersistable, 'Z6_BSESELF')]
        property CodigoBaseSelfColor: double read FCodigoBaseSelfColor write SetCodigoBaseSelfColor;

        [TPersistable(fgPersistable, 'Z6_EMBSELF')]
        property CodigoEmbalagemSelfColor: double read FCodigoEmbalagemSelfColor write SetCodigoEmbalagemSelfColor;

        [TPersistable(fgPersistable, 'Z6_CORSELF')]
        property CodigoCorSelfColor: double read FCodigoCorSelfColor write SetCodigoCorSelfColor;

        [TPersistable(fgPersistable, 'Z6_COLSELF')]
        property CodigoColoranteSelfColor: double read FCodigoColoranteSelfColor write SetCodigoColoranteSelfColor;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgPersistable, 'R_E_C_D_E_L_')]
        property RecnoDelete: integer read FRecnoDelete write SetRecnoDelete;

        property Produto: TProduto read FProduto write SetProduto;
        property Filial_: TFilial read FFilial_ write SetFilial_;

        constructor Create; override;
        destructor Destroy; override;

    end;

implementation

{ TOrcamentoItem }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado, System.Math;

{$REGION 'Métodos CRUD'}

function TOrcamentoItem.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao inserir OrcamentoItem' + #13 + e.Message);
        end;
    finally
    end;
end;

function TOrcamentoItem.Alterar: Boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao alterar OrcamentoItem' + #13 + e.Message);
        end;
    finally
    end;
end;

function TOrcamentoItem.Excluir: Boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
            on e: exception do
                raise exception.Create('Erro ao excluir OrcamentoItem' + #13 + e.Message);
        end;
    finally
    end;

end;

function TOrcamentoItem.GetCampanhaEstado: Boolean;
begin
    result := False;
    if (Pos('P', Self.Campanha) > 0) and (Self.Filial_.Uf = 'MT') then
        result := True;
    if (Pos('R', Self.Campanha) > 0) and (Self.Filial_.Uf = 'PR') then
        result := True;
end;

function TOrcamentoItem.GetCombo: Boolean;
begin
    result := False;

    if Pos('5', Self.Campanha) > 0 then
        result := True;
end;

function TOrcamentoItem.GetDescricaoProduto: String;
begin
    FDescricaoProduto := Self.Produto.descricao;
end;

function TOrcamentoItem.GetEncomenda: Boolean;
begin
    result := False;

    if Pos('E', Self.Campanha) > 0 then
        result := True;
end;

function TOrcamentoItem.GetForaDeLinha: Boolean;
begin
    result := False;

    if Pos('F', Self.Campanha) > 0 then
        result := True;
end;

function TOrcamentoItem.GetPromocao: Boolean;
begin
    result := False;

    if Pos('X', Self.Campanha) > 0 then
        result := True;
end;

procedure TOrcamentoItem.TabelaComissaoCodigoCalcularPreco(TabelaComissao: TTabelaComissao; quantidadeParcelas: integer; totalPrecoEmTabela, valorEntrada: Currency);
var
    valor, coeficiente, vrEntrada, vrLiquido, vrNegociado, prazoMedio: Currency;
    juros: Real;
begin
    try
        valor := 0;
        coeficiente := 0;
        if (Self.TipoEntrega <> 'CS') and //
           (Self.Produto.ProdutoEmPromocao = False) and //
           (Self.Combo = False) and //
           (TabelaComissao.CodigoTabela <> 'T1') then
        begin
            if TabelaComissao.Indice = 0 then
            begin
                if totalPrecoEmTabela <> 0 then
                    valor := totalPrecoEmTabela
                else
                    valor := Self.ValorPrecoTabela;

                if valor > 0 then
                    if valorEntrada > 0 then
                        coeficiente := (valorEntrada / valor);

                { Pega o valor unitário da entrada }
                vrEntrada := (Self.ValorPrecoTabela * coeficiente);
                { Pega o valor liquido para calculo do preco }
                vrLiquido := (Self.ValorPrecoTabela - vrEntrada);
                { Calcula prece em tabela }
                vrNegociado := (CalcularPMT(quantidadeParcelas, (TabelaComissao.taxaDeJuros), vrLiquido));
                vrNegociado := vrNegociado * quantidadeParcelas;
                vrNegociado := vrNegociado + vrEntrada;

                if vrNegociado < Self.ValorPrecoTabela then
                    vrNegociado := Self.ValorPrecoTabela;
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
                    vrNegociado := (Self.ValorPrecoTabela * TabelaComissao.Indice);
                end
                else
                begin
                    prazoMedio := (quantidadeParcelas - 1) / 2;
                    juros := Power((1 + (TabelaComissao.taxaDeJuros / 100)), prazoMedio);
                    vrNegociado := (Self.ValorPrecoTabela / quantidadeParcelas) * juros;
                    vrNegociado := vrNegociado * quantidadeParcelas;
                end
            end;
        end
        else
        begin
            vrNegociado := Self.ValorPrecoTabela;
        end;

        Self.ValorUnitarioNegociado := Tlib.ArredondarNumero(vrNegociado);

    except
        on e: exception do
        begin
            raise exception.Create('Erro ao calcular preço em tabela '#13 + e.Message);
        end;
    end;
end;

function TOrcamentoItem.CalcularPMT(qtParcelas, taxaDeJuros, vrLiquido: Real): Currency;
begin
    result := ((-vrLiquido * taxaDeJuros / 100.0 / (1.0 - exp(-qtParcelas * ln(1.0 + taxaDeJuros / 100.0)))) * -1);
end;

procedure TOrcamentoItem.CalcularValorTotalProduto;
begin
    FValorTotal := Tlib.ArredondarNumero((Self.Quantidade * Self.ValorUnitarioNegociado));
end;

function TOrcamentoItem.Consultar(parametros: TParametro): TLista<TOrcamentoItem>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('Z6_NUM', ccIgual, lgAnd);
        condicao.Adiciona('Z6_PRODUTO', ccIgual, lgAnd);
        condicao.Adiciona('Z6_QUANT', ccIgual, lgAnd);
        condicao.Adiciona('Z6_LOCAL', ccIgual, lgAnd);
        condicao.Adiciona('Z6_UM', ccIgual, lgAnd);
        condicao.Adiciona('Z6_DESC', ccIgual, lgAnd);
        condicao.Adiciona('Z6_TES', ccIgual, lgAnd);
        condicao.Adiciona('Z6_CF', ccIgual, lgAnd);
        condicao.Adiciona('Z6_TABELA', ccIgual, lgAnd);
        condicao.Adiciona('Z6_EMISSAO', ccIgual, lgAnd);
        condicao.Adiciona('Z6_DESCPRO', ccIgual, lgAnd);
        condicao.Adiciona('Z6_PRCTAB', ccIgual, lgAnd);
        condicao.Adiciona('Z6_FILIAL', ccIgual, lgAnd);
        condicao.Adiciona('Z6_VEND', ccIgual, lgAnd);
        condicao.Adiciona('Z6_FORMSEL', ccIgual, lgAnd);
        condicao.Adiciona('Z6_ITEM', ccIgual, lgAnd);
        condicao.Adiciona('Z6_DESPESA', ccIgual, lgAnd);
        condicao.Adiciona('Z6_FILRES', ccIgual, lgAnd);
        condicao.Adiciona('Z6_USERID', ccIgual, lgAnd);
        condicao.Adiciona('Z6_COMIS', ccIgual, lgAnd);
        condicao.Adiciona('Z6_T', ccIgual, lgAnd);
        condicao.Adiciona('Z6_TPENT', ccIgual, lgAnd);
        condicao.Adiciona('Z6_TDREGRA', ccIgual, lgAnd);
        condicao.Adiciona('Z6_TDITEM', ccIgual, lgAnd);
        condicao.Adiciona('Z6_TDVUNIT', ccIgual, lgAnd);
        condicao.Adiciona('Z6_TDVITEM', ccIgual, lgAnd);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_D_E_L_', ccIgual, lgAnd);
        condicao.Adiciona('Z6_TDICMGE', ccIgual, lgAnd);
        condicao.Adiciona('Z6_ITEMPAI', ccIgual, lgAnd);
        condicao.Adiciona('Z6_GRPSELF', ccIgual, lgAnd);
        condicao.Adiciona('Z6_PRDSELF', ccIgual, lgAnd);
        condicao.Adiciona('Z6_BSESELF', ccIgual, lgAnd);
        condicao.Adiciona('Z6_EMBSELF', ccIgual, lgAnd);
        condicao.Adiciona('Z6_CORSELF', ccIgual, lgAnd);
        condicao.Adiciona('Z6_COLSELF', ccIgual, lgAnd);

        query := 'SELECT ' + Self.ObterCamposSeparadosPorVirgula(Consulta, []) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(True);

        result := dao.Consultar(query, parametros);
    finally
        condicao.Free;
    end;
end;

constructor TOrcamentoItem.Create;
begin
    inherited;
    FFilial_ := TFilial.Create;
    FProduto := TProduto.Create;
end;

destructor TOrcamentoItem.Destroy;
begin
    inherited;
    if FFilial_ <> nil then
        FreeAndNil(FFilial_);

    if FProduto <> nil then
        FreeAndNil(FProduto);
end;

function TOrcamentoItem.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TOrcamentoItem>;
    // parametro : TParametro;
    // lista:TLista<TOrcamentoItem>
begin
    try
        filtro := TFilter<TOrcamentoItem>.Create;
        filtro.ScreenName := 'Filtro de OrcamentoItem';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'NumeroOrcamento=Z6_NUM', 'NumeroOrcamento');
        filtro.AddIndex(2, 'CodigoProduto=Z6_PRODUTO', 'CodigoProduto');
        filtro.AddIndex(3, 'Quantidade=Z6_QUANT', 'Quantidade');
        filtro.AddIndex(4, 'Armazem=Z6_LOCAL', 'Armazem');
        filtro.AddIndex(5, 'UnidadeMedida=Z6_UM', 'UnidadeMedida');
        filtro.AddIndex(6, 'PercentualDesconto=Z6_DESC', 'PercentualDesconto');
        filtro.AddIndex(7, 'CodigoTes=Z6_TES', 'CodigoTes');
        filtro.AddIndex(8, 'Cfop=Z6_CF', 'Cfop');
        filtro.AddIndex(9, 'CodigoTabelaPreco=Z6_TABELA', 'CodigoTabelaPreco');
        filtro.AddIndex(10, 'DataEmissao=Z6_EMISSAO', 'DataEmissao');
        filtro.AddIndex(11, 'ValorDesconto=Z6_DESCPRO', 'ValorDesconto');
        filtro.AddIndex(12, 'ValorPrecoTabela=Z6_PRCTAB', 'ValorPrecoTabela');
        filtro.AddIndex(13, 'CodigoFilial=Z6_FILIAL', 'CodigoFilial');
        filtro.AddIndex(14, 'CodigoVendedor=Z6_VEND', 'CodigoVendedor');
        filtro.AddIndex(15, 'FormulaSelfColor=Z6_FORMSEL', 'FormulaSelfColor');
        filtro.AddIndex(16, 'Item=Z6_ITEM', 'Item');
        filtro.AddIndex(17, 'ValorDespesa=Z6_DESPESA', 'ValorDespesa');
        filtro.AddIndex(18, 'FilialReserva=Z6_FILRES', 'FilialReserva');
        filtro.AddIndex(19, 'Usuario=Z6_USERID', 'Usuario');
        filtro.AddIndex(20, 'PercentualComissao=Z6_COMIS', 'PercentualComissao');
        filtro.AddIndex(21, 'TabelaComissaoCodigo=Z6_T', 'TabelaComissaoCodigo');
        filtro.AddIndex(22, 'TipoEntrega=Z6_TPENT', 'TipoEntrega');
        filtro.AddIndex(23, 'CodigoRegraComissaoAplicada=Z6_TDREGRA', 'CodigoRegraComissaoAplicada');
        filtro.AddIndex(24, 'CodigoItemComissaoAplicada=Z6_TDITEM', 'CodigoItemComissaoAplicada');
        filtro.AddIndex(25, 'ValorUnitarioNegociado=Z6_TDVUNIT', 'ValorUnitarioNegociado');
        filtro.AddIndex(26, 'ValorTotal=Z6_TDVITEM', 'ValorTotal');
        filtro.AddIndex(27, 'Delete=D_E_L_E_T_', 'Delete');
        filtro.AddIndex(28, 'Recno=R_E_C_N_O_', 'Recno');
        filtro.AddIndex(29, 'RecnoDelete=R_E_C_D_E_L_', 'RecnoDelete');
        filtro.AddIndex(30, 'ValorIcmsGerencial=Z6_TDICMGE', 'ValorIcmsGerencial');
        filtro.AddIndex(31, 'ItemPai=Z6_ITEMPAI', 'ItemPai');
        filtro.AddIndex(32, 'CodigoGrupoSelfColor=Z6_GRPSELF', 'CodigoGrupoSelfColor');
        filtro.AddIndex(33, 'CodigoProdutoSelfColor=Z6_PRDSELF', 'CodigoProdutoSelfColor');
        filtro.AddIndex(34, 'CodigoBaseSelfColor=Z6_BSESELF', 'CodigoBaseSelfColor');
        filtro.AddIndex(35, 'CodigoEmbalagemSelfColor=Z6_EMBSELF', 'CodigoEmbalagemSelfColor');
        filtro.AddIndex(36, 'CodigoCorSelfColor=Z6_CORSELF', 'CodigoCorSelfColor');
        filtro.AddIndex(37, 'CodigoColoranteSelfColor=Z6_COLSELF', 'CodigoColoranteSelfColor');
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
        campoFiltro.Description := 'CodigoProduto';
        campoFiltro.Name := 'CodigoProduto';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Quantidade';
        campoFiltro.Name := 'Quantidade';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Armazem';
        campoFiltro.Name := 'Armazem';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'UnidadeMedida';
        campoFiltro.Name := 'UnidadeMedida';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'PercentualDesconto';
        campoFiltro.Name := 'PercentualDesconto';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoTes';
        campoFiltro.Name := 'CodigoTes';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Cfop';
        campoFiltro.Name := 'Cfop';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoTabelaPreco';
        campoFiltro.Name := 'CodigoTabelaPreco';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'DataEmissao';
        campoFiltro.Name := 'DataEmissao';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'ValorDesconto';
        campoFiltro.Name := 'ValorDesconto';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'ValorPrecoTabela';
        campoFiltro.Name := 'ValorPrecoTabela';
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
        campoFiltro.Description := 'CodigoVendedor';
        campoFiltro.Name := 'CodigoVendedor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'FormulaSelfColor';
        campoFiltro.Name := 'FormulaSelfColor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Item';
        campoFiltro.Name := 'Item';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'ValorDespesa';
        campoFiltro.Name := 'ValorDespesa';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'FilialReserva';
        campoFiltro.Name := 'FilialReserva';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Usuario';
        campoFiltro.Name := 'Usuario';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'PercentualComissao';
        campoFiltro.Name := 'PercentualComissao';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'TabelaComissaoCodigo';
        campoFiltro.Name := 'TabelaComissaoCodigo';
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
        campoFiltro.Description := 'CodigoRegraComissaoAplicada';
        campoFiltro.Name := 'CodigoRegraComissaoAplicada';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoItemComissaoAplicada';
        campoFiltro.Name := 'CodigoItemComissaoAplicada';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'ValorUnitarioNegociado';
        campoFiltro.Name := 'ValorUnitarioNegociado';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'ValorTotal';
        campoFiltro.Name := 'ValorTotal';
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
        campoFiltro.Description := 'RecnoDelete';
        campoFiltro.Name := 'RecnoDelete';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'ValorIcmsGerencial';
        campoFiltro.Name := 'ValorIcmsGerencial';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'ItemPai';
        campoFiltro.Name := 'ItemPai';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoGrupoSelfColor';
        campoFiltro.Name := 'CodigoGrupoSelfColor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoProdutoSelfColor';
        campoFiltro.Name := 'CodigoProdutoSelfColor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoBaseSelfColor';
        campoFiltro.Name := 'CodigoBaseSelfColor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoEmbalagemSelfColor';
        campoFiltro.Name := 'CodigoEmbalagemSelfColor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoCorSelfColor';
        campoFiltro.Name := 'CodigoCorSelfColor';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoColoranteSelfColor';
        campoFiltro.Name := 'CodigoColoranteSelfColor';
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

function TOrcamentoItem.Obter(parametros: TParametro): TOrcamentoItem;
var
    Lista: TLista<TOrcamentoItem>;
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

function TOrcamentoItem.Obter(ID: string): TOrcamentoItem;
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

procedure TOrcamentoItem.PreencherObjeto(OrcamentoItem: TOrcamentoItem);
begin
    OrcamentoItem.CopiarPara(Self);
    FPreenchido := True;
end;

{$ENDREGION}
{$REGION 'Métodos de Propriedades'}

procedure TOrcamentoItem.SetNumeroOrcamento(const Value: string);
begin
    FNumeroOrcamento := Value;
end;

procedure TOrcamentoItem.SetCodigoProduto(const Value: string);
begin
    FCodigoProduto := Value;
end;

procedure TOrcamentoItem.SetQuantidade(const Value: double);
begin
    FQuantidade := Value;

    CalcularValorTotalProduto;
end;

procedure TOrcamentoItem.SeDescricaoProduto(const Value: String);
begin
    FDescricaoProduto := Value;
end;

procedure TOrcamentoItem.SetArmazem(const Value: string);
begin
    FArmazem := Value;
end;

procedure TOrcamentoItem.SetUnidadeMedida(const Value: string);
begin
    FUnidadeMedida := Value;
end;

procedure TOrcamentoItem.SetPercentualDesconto(const Value: double);
begin
    FPercentualDesconto := Value;
end;

procedure TOrcamentoItem.SetPercentualDescontoValorNegociado(const Value: double);
begin
    FPercentualDescontoValorNegociado := Value;
end;

procedure TOrcamentoItem.SetProduto(const Value: TProduto);
begin
    FProduto := Value;
end;

procedure TOrcamentoItem.SetCodigoTes(const Value: string);
begin
    FCodigoTes := Value;
end;

procedure TOrcamentoItem.SetCampanha(const Value: string);
begin
    FCampanha := Value;
end;

procedure TOrcamentoItem.SetCfop(const Value: string);
begin
    FCfop := Value;
end;

procedure TOrcamentoItem.SetCodigoTabelaPreco(const Value: string);
begin
    FCodigoTabelaPreco := Value;
end;

procedure TOrcamentoItem.SetDataEmissao(const Value: string);
begin
    FDataEmissao := Value;
end;

procedure TOrcamentoItem.SetValorDesconto(const Value: double);
begin
    FValorDesconto := Value;
end;

procedure TOrcamentoItem.SetValorPrecoTabela(const Value: double);
begin
    FValorPrecoTabela := Value;
end;

procedure TOrcamentoItem.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TOrcamentoItem.SetCodigoVendedor(const Value: string);
begin
    FCodigoVendedor := Value;
end;

procedure TOrcamentoItem.SetFormulaSelfColor(const Value: string);
begin
    FFormulaSelfColor := Value;
end;

procedure TOrcamentoItem.SetItem(const Value: string);
begin
    FItem := Value;
end;

procedure TOrcamentoItem.SetValorDespesa(const Value: double);
begin
    FValorDespesa := Value;
end;

procedure TOrcamentoItem.SetFilialReserva(const Value: string);
begin
    FFilialReserva := Value;
end;

procedure TOrcamentoItem.SetFilial_(const Value: TFilial);
begin
    FFilial_ := Value;
end;

procedure TOrcamentoItem.SetUsuario(const Value: string);
begin
    FUsuario := Value;
end;

procedure TOrcamentoItem.SetPercentualComissao(const Value: double);
begin
    FPercentualComissao := Value;
end;

procedure TOrcamentoItem.SetTabelaComissaoCodigo(const Value: string);
begin
    FTabelaComissaoCodigo := Value;
end;

procedure TOrcamentoItem.SetTipoEntrega(const Value: string);
begin
    FTipoEntrega := Value;
end;

procedure TOrcamentoItem.SetCodigoRegraComissaoAplicada(const Value: string);
begin
    FCodigoRegraComissaoAplicada := Value;
end;

procedure TOrcamentoItem.SetCodigoItemComissaoAplicada(const Value: string);
begin
    FCodigoItemComissaoAplicada := Value;
end;

procedure TOrcamentoItem.SetValorUnitarioNegociado(const Value: double);
begin
    FValorUnitarioNegociado := Value;

    CalcularValorTotalProduto;
end;

procedure TOrcamentoItem.SetValorTotal(const Value: double);
begin
    FValorTotal := Value;
end;

procedure TOrcamentoItem.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TOrcamentoItem.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TOrcamentoItem.SetRecnoDelete(const Value: integer);
begin
    FRecnoDelete := Value;
end;

procedure TOrcamentoItem.SetValorIcmsGerencial(const Value: double);
begin
    FValorIcmsGerencial := Value;
end;

procedure TOrcamentoItem.SetItemPai(const Value: string);
begin
    FItemPai := Value;
end;

procedure TOrcamentoItem.SetCodigoGrupoSelfColor(const Value: double);
begin
    FCodigoGrupoSelfColor := Value;
end;

procedure TOrcamentoItem.SetCodigoProdutoSelfColor(const Value: double);
begin
    FCodigoProdutoSelfColor := Value;
end;

procedure TOrcamentoItem.SetCodigoBaseSelfColor(const Value: double);
begin
    FCodigoBaseSelfColor := Value;
end;

procedure TOrcamentoItem.SetCodigoEmbalagemSelfColor(const Value: double);
begin
    FCodigoEmbalagemSelfColor := Value;
end;

procedure TOrcamentoItem.SetCodigoCorSelfColor(const Value: double);
begin
    FCodigoCorSelfColor := Value;
end;

procedure TOrcamentoItem.SetCodigoColoranteSelfColor(const Value: double);
begin
    FCodigoColoranteSelfColor := Value;
end;

{$ENDREGION}

end.
