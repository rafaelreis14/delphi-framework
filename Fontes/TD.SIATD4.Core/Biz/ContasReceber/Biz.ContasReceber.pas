unit Biz.ContasReceber;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.Lista, Lib.ResultFilter;

type
    TContasReceber = class(TClasseBase)
    private
        FFilialOrigem: string;
        FDataVencimentoReal: string;
        FPrefixo: string;
        FCodigoConta: string;
        FHistorico: string;
        FOrcamentoMae: string;
        FPortador: string;
        FNumeroCartao: string;
        FRotinaOrigem: string;
        FSaldoDevedor: double;
        FCondicaoPagamento: string;
        FValor: double;
        FFilialOrcamentoMae: string;
        FNomeCliente: string;
        FSequencialCliente: string;
        FBaseComissao: double;
        FDataVencimentoOrigem: string;
        FDelet: string;
        FCodigoPdv: string;
        FSequenciamentoCartaoCredito: string;
        FEmitenteCheque: string;
        FValorCruzado: double;
        FDataBaixa: string;
        FDataVencimento: string;
        FNumeroCheque: string;
        FNsuCartao: string;
        FSerie: string;
        FAgenciaDeposito: string;
        FCodigoFilial: string;
        FMoeda: double;
        FNumero: string;
        FPercentualJuros: double;
        FCodigoNatureza: string;
        FStatus: string;
        FDataEmissao: string;
        FContaCheque: string;
        FPercentualComissao: double;
        FDataContabilizacao: string;
        FOperador: string;
        FNumeroVendaECommerce: string;
        FRecno: integer;
        FSituacao: string;
        FCodigoCliente: string;
        FValorLiquido: double;
        FValorComissao: double;
        FNumeroPedido: string;
        FAgenciaCheque: string;
        FValorReal: double;
        FCodigoVendedor: string;
        FUsuario: string;
        FTipo: string;
        FBancoCheque: string;
        FMicrosigaFilial: string;
        FNumeroNota: string;
        FParcela: string;
        FStatusLiberacaoDeCredito: string;
        FValorDisponivel: double;
        FValorReservado: double;
        procedure SetAgenciaCheque(const Value: string);
        procedure SetAgenciaDeposito(const Value: string);
        procedure SetBancoCheque(const Value: string);
        procedure SetBaseComissao(const Value: double);
        procedure SetCodigoCliente(const Value: string);
        procedure SetCodigoConta(const Value: string);
        procedure SetCodigoFilial(const Value: string);
        procedure SetSequencialCliente(const Value: string);
        procedure SetCodigoNatureza(const Value: string);
        procedure SetCodigoPdv(const Value: string);
        procedure SetCodigoVendedor(const Value: string);
        procedure SetCondicaoPagamento(const Value: string);
        procedure SetContaCheque(const Value: string);
        procedure SetDataBaixa(const Value: string);
        procedure SetDataContabilizacao(const Value: string);
        procedure SetDataEmissao(const Value: string);
        procedure SetDataVencimento(const Value: string);
        procedure SetDataVencimentoOrigem(const Value: string);
        procedure SetDataVencimentoReal(const Value: string);
        procedure SetDelet(const Value: string);
        procedure SetEmitenteCheque(const Value: string);
        procedure SetFilialOrcamentoMae(const Value: string);
        procedure SetFilialOrigem(const Value: string);
        procedure SetHistorico(const Value: string);
        procedure SetMicrosigaFilial(const Value: string);
        procedure SetMoeda(const Value: double);
        procedure SetNomeCliente(const Value: string);
        procedure SetNsuCartao(const Value: string);
        procedure SetNumero(const Value: string);
        procedure SetNumeroCartao(const Value: string);
        procedure SetNumeroCheque(const Value: string);
        procedure SetNumeroNota(const Value: string);
        procedure SetNumeroPedido(const Value: string);
        procedure SetNumeroVendaECommerce(const Value: string);
        procedure SetOperador(const Value: string);
        procedure SetOrcamentoMae(const Value: string);
        procedure SetParcela(const Value: string);
        procedure SetPercentualComissao(const Value: double);
        procedure SetPercentualJuros(const Value: double);
        procedure SetPortador(const Value: string);
        procedure SetPrefixo(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetRotinaOrigem(const Value: string);
        procedure SetSaldoDevedor(const Value: double);
        procedure SetSequenciamentoCartaoCredito(const Value: string);
        procedure SetSerie(const Value: string);
        procedure SetSituacao(const Value: string);
        procedure SetStatus(const Value: string);
        procedure SetTipo(const Value: string);
        procedure SetUsuario(const Value: string);
        procedure SetValor(const Value: double);
        procedure SetValorComissao(const Value: double);
        procedure SetValorCruzado(const Value: double);
        procedure SetValorLiquido(const Value: double);
        procedure SetValorReal(const Value: double);
        procedure SetStatusLiberacaoDeCredito(const Value: string);
        procedure SetValorDisponivel(const Value: double);
        procedure SetValorReservado(const Value: double);
        function GetValorDisponivel: double;
    public
        /// <summary>
        /// M�todo que preenche a inst�ncia do Objeto
        /// </summary>
        /// <param name="ContasReceber">
        /// objeto de parametro para preenchimento da inst�ncia
        /// </param>
        procedure PreencherObjeto(ContasReceber: TContasReceber);

        class function ListarCreditoPendente(sequencialCliente, codigoCliente: String): TLista<TContasReceber>;

        [TPersistable(fgPersistable, 'ZA_FILIAL')]
        [TMaxLenght(2)]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgPersistable, 'ZA_PREFIXO')]
        [TMaxLenght(3)]
        property Prefixo: string read FPrefixo write SetPrefixo;

        [TPersistable(fgPersistable, 'ZA_NUM')]
        [TMaxLenght(9)]
        property Numero: string read FNumero write SetNumero;

        [TPersistable(fgPersistable, 'ZA_PARCELA')]
        [TMaxLenght(3)]
        property Parcela: string read FParcela write SetParcela;

        [TPersistable(fgPersistable, 'ZA_TIPO')]
        [TMaxLenght(3)]
        property Tipo: string read FTipo write SetTipo;

        [TPersistable(fgPersistable, 'ZA_NATUREZ')]
        [TMaxLenght(10)]
        property CodigoNatureza: string read FCodigoNatureza write SetCodigoNatureza;

        [TPersistable(fgPersistable, 'ZA_PORTADO')]
        [TMaxLenght(3)]
        property Portador: string read FPortador write SetPortador;

        [TPersistable(fgPersistable, 'ZA_AGEDEP')]
        [TMaxLenght(5)]
        property AgenciaDeposito: string read FAgenciaDeposito write SetAgenciaDeposito;

        [TPersistable(fgPersistable, 'ZA_CLIENTE')]
        [TMaxLenght(6)]
        property codigoCliente: string read FCodigoCliente write SetCodigoCliente;

        [TPersistable(fgPersistable, 'ZA_LOJA')]
        [TMaxLenght(2)]
        property sequencialCliente: string read FSequencialCliente write SetSequencialCliente;

        [TPersistable(fgPersistable, 'ZA_NOMCLI')]
        [TMaxLenght(20)]
        property NomeCliente: string read FNomeCliente write SetNomeCliente;

        [TPersistable(fgPersistable, 'ZA_PEDIDO')]
        [TMaxLenght(6)]
        property NumeroPedido: string read FNumeroPedido write SetNumeroPedido;

        [TPersistable(fgPersistable, 'ZA_EMISSAO')]
        [TMaxLenght(8)]
        property DataEmissao: string read FDataEmissao write SetDataEmissao;

        [TPersistable(fgPersistable, 'ZA_VENCTO')]
        [TMaxLenght(8)]
        property DataVencimento: string read FDataVencimento write SetDataVencimento;

        [TPersistable(fgPersistable, 'ZA_VENCREA')]
        [TMaxLenght(8)]
        property DataVencimentoReal: string read FDataVencimentoReal write SetDataVencimentoReal;

        [TPersistable(fgPersistable, 'ZA_VALOR')]
        property Valor: double read FValor write SetValor;

        [TPersistable(fgPersistable, 'ZA_HIST')]
        [TMaxLenght(60)]
        property Historico: string read FHistorico write SetHistorico;

        [TPersistable(fgPersistable, 'ZA_BAIXA')]
        [TMaxLenght(8)]
        property DataBaixa: string read FDataBaixa write SetDataBaixa;

        [TPersistable(fgPersistable, 'ZA_EMIS1')]
        [TMaxLenght(8)]
        property DataContabilizacao: string read FDataContabilizacao write SetDataContabilizacao;

        [TPersistable(fgPersistable, 'ZA_SITUACA')]
        [TMaxLenght(1)]
        property Situacao: string read FSituacao write SetSituacao;

        [TPersistable(fgPersistable, 'ZA_SALDO')]
        property SaldoDevedor: double read FSaldoDevedor write SetSaldoDevedor;

        [TPersistable(fgPersistable, 'ZA_VEND1')]
        [TMaxLenght(6)]
        property CodigoVendedor: string read FCodigoVendedor write SetCodigoVendedor;

        [TPersistable(fgPersistable, 'ZA_COMIS1')]
        property PercentualComissao: double read FPercentualComissao write SetPercentualComissao;

        [TPersistable(fgPersistable, 'ZA_VALCOM1')]
        property ValorComissao: double read FValorComissao write SetValorComissao;

        [TPersistable(fgPersistable, 'ZA_VALLIQ')]
        property ValorLiquido: double read FValorLiquido write SetValorLiquido;

        [TPersistable(fgPersistable, 'ZA_VENCORI')]
        [TMaxLenght(8)]
        property DataVencimentoOrigem: string read FDataVencimentoOrigem write SetDataVencimentoOrigem;

        [TPersistable(fgPersistable, 'ZA_CONTA')]
        [TMaxLenght(10)]
        property CodigoConta: string read FCodigoConta write SetCodigoConta;

        [TPersistable(fgPersistable, 'ZA_MOEDA')]
        property Moeda: double read FMoeda write SetMoeda;

        [TPersistable(fgPersistable, 'ZA_BASCOM1')]
        property BaseComissao: double read FBaseComissao write SetBaseComissao;

        [TPersistable(fgPersistable, 'ZA_NUMNOTA')]
        [TMaxLenght(9)]
        property NumeroNota: string read FNumeroNota write SetNumeroNota;

        [TPersistable(fgPersistable, 'ZA_SERIE')]
        [TMaxLenght(3)]
        property Serie: string read FSerie write SetSerie;

        [TPersistable(fgPersistable, 'ZA_STATUS')]
        [TMaxLenght(1)]
        property Status: string read FStatus write SetStatus;

        [TPersistable(fgPersistable, 'ZA_ORIGEM')]
        [TMaxLenght(8)]
        property RotinaOrigem: string read FRotinaOrigem write SetRotinaOrigem;

        [TPersistable(fgPersistable, 'ZA_NUMCART')]
        [TMaxLenght(19)]
        property NumeroCartao: string read FNumeroCartao write SetNumeroCartao;

        [TPersistable(fgPersistable, 'ZA_PORCJUR')]
        property PercentualJuros: double read FPercentualJuros write SetPercentualJuros;

        [TPersistable(fgPersistable, 'ZA_VLRREAL')]
        property ValorReal: double read FValorReal write SetValorReal;

        [TPersistable(fgPersistable, 'ZA_BCOCHQ')]
        [TMaxLenght(3)]
        property BancoCheque: string read FBancoCheque write SetBancoCheque;

        [TPersistable(fgPersistable, 'ZA_AGECHQ')]
        [TMaxLenght(5)]
        property AgenciaCheque: string read FAgenciaCheque write SetAgenciaCheque;

        [TPersistable(fgPersistable, 'ZA_CTACHQ')]
        [TMaxLenght(10)]
        property ContaCheque: string read FContaCheque write SetContaCheque;

        [TPersistable(fgPersistable, 'ZA_FILORIG')]
        [TMaxLenght(2)]
        property FilialOrigem: string read FFilialOrigem write SetFilialOrigem;

        [TPersistable(fgPersistable, 'ZA_VLCRUZ')]
        property ValorCruzado: double read FValorCruzado write SetValorCruzado;

        [TPersistable(fgPersistable, 'ZA_CONDPG')]
        [TMaxLenght(16)]
        property CondicaoPagamento: string read FCondicaoPagamento write SetCondicaoPagamento;

        [TPersistable(fgPersistable, 'ZA_MSFIL')]
        [TMaxLenght(2)]
        property MicrosigaFilial: string read FMicrosigaFilial write SetMicrosigaFilial;

        [TPersistable(fgPersistable, 'ZA_USERID')]
        [TMaxLenght(50)]
        property Usuario: string read FUsuario write SetUsuario;

        [TPersistable(fgPersistable, 'ZA_EMITCHQ')]
        [TMaxLenght(40)]
        property EmitenteCheque: string read FEmitenteCheque write SetEmitenteCheque;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delet: string read FDelet write SetDelet;

        [TPersistable(fgPersistable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgPersistable, 'ZA_ORCFIL')]
        [TMaxLenght(2)]
        property FilialOrcamentoMae: string read FFilialOrcamentoMae write SetFilialOrcamentoMae;

        [TPersistable(fgPersistable, 'ZA_ORCORI')]
        [TMaxLenght(6)]
        property OrcamentoMae: string read FOrcamentoMae write SetOrcamentoMae;

        [TPersistable(fgPersistable, 'ZA_NSUTD')]
        [TMaxLenght(9)]
        property NsuCartao: string read FNsuCartao write SetNsuCartao;

        [TPersistable(fgPersistable, 'ZA_CHQTOD')]
        [TMaxLenght(15)]
        property NumeroCheque: string read FNumeroCheque write SetNumeroCheque;

        [TPersistable(fgPersistable, 'ZA_CARTID')]
        [TMaxLenght(2)]
        property SequenciamentoCartaoCredito: string read FSequenciamentoCartaoCredito write SetSequenciamentoCartaoCredito;

        [TPersistable(fgPersistable, 'ZA_TDNUME')]
        [TMaxLenght(24)]
        property NumeroVendaECommerce: string read FNumeroVendaECommerce write SetNumeroVendaECommerce;

        [TPersistable(fgPersistable, 'ZA_TDPDV')]
        [TMaxLenght(10)]
        property CodigoPdv: string read FCodigoPdv write SetCodigoPdv;

        [TPersistable(fgPersistable, 'ZA_TDOPERA')]
        [TMaxLenght(3)]
        property Operador: string read FOperador write SetOperador;

        [TPersistable(fgPersistable, 'ZA_TDLIBNC')]
        property StatusLiberacaoDeCredito: string read FStatusLiberacaoDeCredito write SetStatusLiberacaoDeCredito;

        [TPersistable(fgReadOnly, 'Z40_SLDCMP')]
        property ValorReservado: double read FValorReservado write SetValorReservado;

        property ValorDisponivel: double read GetValorDisponivel;

    end;

implementation

{ TContasReceber }

uses Lib.Biblioteca, Lib.Filter;

{$REGION 'M�todos CRUD'}

function TContasReceber.GetValorDisponivel: double;
begin
    Result := SaldoDevedor - ValorReservado;
end;


class function TContasReceber.ListarCreditoPendente(sequencialCliente, codigoCliente: String): TLista<TContasReceber>;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TContasReceber>;
    parametro: TParametro;
    // lista:TLista<TContasReceber>
begin
    try
        filtro := TFilter<TContasReceber>.Create;
        filtro.ScreenName := 'Filtro de Credito Pendente do Cliente';
        filtro.OperationType := otSelect;
        filtro.MultiSelect := true;
        filtro.FilterType := ftAlredyFilteredWithParameters;
        filtro.Task := 'ListarCreditoPendente';
        // ###Criar os �ndices do filtro

{$REGION 'Campo Filtro'}
        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Loja';
        campoFiltro.Name := 'SequencialCliente';
        campoFiltro.MaskTypes := mtString;
        campoFiltro.GridSize := 50;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoCliente';
        campoFiltro.Name := 'CodigoCliente';
        campoFiltro.MaskTypes := mtString;
        campoFiltro.GridSize := 80;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Nome do Cliente';
        campoFiltro.Name := 'NomeCliente';
        campoFiltro.MaskTypes := mtString;
        campoFiltro.GridSize := 200;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Saldo Receber';
        campoFiltro.Name := 'SaldoDevedor';
        campoFiltro.MaskTypes := mtCurrency;
        campoFiltro.GridSize := 80;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Valor Reservado';
        campoFiltro.Name := 'ValorReservado';
        campoFiltro.MaskTypes := mtCurrency;
        campoFiltro.GridSize := 80;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Valor Dispon�vel';
        campoFiltro.Name := 'ValorDisponivel';
        campoFiltro.MaskTypes := mtCurrency;
        campoFiltro.GridSize := 80;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Valor Original';
        campoFiltro.Name := 'Valor';
        campoFiltro.MaskTypes := mtCurrency;
        campoFiltro.GridSize := 80;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Data Emiss�o';
        campoFiltro.Name := 'DataEmissao';
        campoFiltro.MaskTypes := mtDate;
        campoFiltro.GridSize := 80;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Filial';
        campoFiltro.Name := 'CodigoFilial';
        campoFiltro.MaskTypes := mtString;
        campoFiltro.GridSize := 50;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Prefixo';
        campoFiltro.Name := 'Prefixo';
        campoFiltro.MaskTypes := mtString;
        campoFiltro.GridSize := 50;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Numero';
        campoFiltro.Name := 'Numero';
        campoFiltro.MaskTypes := mtString;
        campoFiltro.GridSize := 50;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Parcela';
        campoFiltro.Name := 'Parcela';
        campoFiltro.MaskTypes := mtString;
        campoFiltro.GridSize := 50;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Tipo';
        campoFiltro.Name := 'Tipo';
        campoFiltro.MaskTypes := mtString;
        campoFiltro.GridSize := 50;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Status';
        campoFiltro.Name := 'StatusLiberacaoDeCredito';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 80;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);
{$ENDREGION}

        parametro := TParametro.Create;

        parametro.Add('', 'E1_CLIENTE', codigoCliente);
        parametro.Add('', 'E1_LOJA', sequencialCliente);

        filtro.parametro := parametro;

        Result := TLista<TContasReceber>(filtro.Execute.List);

    finally
        if parametro <> nil then
            FreeAndNil(parametro);
        // FreeAndNil(lista.Destroy);
    end;
end;



{$ENDREGION}
{$REGION 'Regras de Neg�cio'}

procedure TContasReceber.PreencherObjeto(ContasReceber: TContasReceber);
begin
    ContasReceber.CopiarPara(Self);
    FPreenchido := true;
end;

procedure TContasReceber.SetAgenciaCheque(const Value: string);
begin
    FAgenciaCheque := Value;
end;

procedure TContasReceber.SetAgenciaDeposito(const Value: string);
begin
    FAgenciaDeposito := Value;
end;

procedure TContasReceber.SetBancoCheque(const Value: string);
begin
    FBancoCheque := Value;
end;

procedure TContasReceber.SetBaseComissao(const Value: double);
begin
    FBaseComissao := Value;
end;

procedure TContasReceber.SetCodigoCliente(const Value: string);
begin
    FCodigoCliente := Value;
end;

procedure TContasReceber.SetCodigoConta(const Value: string);
begin
    FCodigoConta := Value;
end;

procedure TContasReceber.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TContasReceber.SetSequencialCliente(const Value: string);
begin
    FSequencialCliente := Value;
end;

procedure TContasReceber.SetCodigoNatureza(const Value: string);
begin
    FCodigoNatureza := Value;
end;

procedure TContasReceber.SetCodigoPdv(const Value: string);
begin
    FCodigoPdv := Value;
end;

procedure TContasReceber.SetCodigoVendedor(const Value: string);
begin
    FCodigoVendedor := Value;
end;

procedure TContasReceber.SetCondicaoPagamento(const Value: string);
begin
    FCondicaoPagamento := Value;
end;

procedure TContasReceber.SetContaCheque(const Value: string);
begin
    FContaCheque := Value;
end;

procedure TContasReceber.SetDataBaixa(const Value: string);
begin
    FDataBaixa := Value;
end;

procedure TContasReceber.SetDataContabilizacao(const Value: string);
begin
    FDataContabilizacao := Value;
end;

procedure TContasReceber.SetDataEmissao(const Value: string);
begin
    FDataEmissao := Value;
end;

procedure TContasReceber.SetDataVencimento(const Value: string);
begin
    FDataVencimento := Value;
end;

procedure TContasReceber.SetDataVencimentoOrigem(const Value: string);
begin
    FDataVencimentoOrigem := Value;
end;

procedure TContasReceber.SetDataVencimentoReal(const Value: string);
begin
    FDataVencimentoReal := Value;
end;

procedure TContasReceber.SetDelet(const Value: string);
begin
    FDelet := Value;
end;

procedure TContasReceber.SetEmitenteCheque(const Value: string);
begin
    FEmitenteCheque := Value;
end;

procedure TContasReceber.SetFilialOrcamentoMae(const Value: string);
begin
    FFilialOrcamentoMae := Value;
end;

procedure TContasReceber.SetFilialOrigem(const Value: string);
begin
    FFilialOrigem := Value;
end;

procedure TContasReceber.SetHistorico(const Value: string);
begin
    FHistorico := Value;
end;

procedure TContasReceber.SetMicrosigaFilial(const Value: string);
begin
    FMicrosigaFilial := Value;
end;

procedure TContasReceber.SetMoeda(const Value: double);
begin
    FMoeda := Value;
end;

procedure TContasReceber.SetNomeCliente(const Value: string);
begin
    FNomeCliente := Value;
end;

procedure TContasReceber.SetNsuCartao(const Value: string);
begin
    FNsuCartao := Value;
end;

procedure TContasReceber.SetNumero(const Value: string);
begin
    FNumero := Value;
end;

procedure TContasReceber.SetNumeroCartao(const Value: string);
begin
    FNumeroCartao := Value;
end;

procedure TContasReceber.SetNumeroCheque(const Value: string);
begin
    FNumeroCheque := Value;
end;

procedure TContasReceber.SetNumeroNota(const Value: string);
begin
    FNumeroNota := Value;
end;

procedure TContasReceber.SetNumeroPedido(const Value: string);
begin
    FNumeroPedido := Value;
end;

procedure TContasReceber.SetNumeroVendaECommerce(const Value: string);
begin
    FNumeroVendaECommerce := Value;
end;

procedure TContasReceber.SetOperador(const Value: string);
begin
    FOperador := Value;
end;

procedure TContasReceber.SetOrcamentoMae(const Value: string);
begin
    FOrcamentoMae := Value;
end;

procedure TContasReceber.SetParcela(const Value: string);
begin
    FParcela := Value;
end;

procedure TContasReceber.SetPercentualComissao(const Value: double);
begin
    FPercentualComissao := Value;
end;

procedure TContasReceber.SetPercentualJuros(const Value: double);
begin
    FPercentualJuros := Value;
end;

procedure TContasReceber.SetPortador(const Value: string);
begin
    FPortador := Value;
end;

procedure TContasReceber.SetPrefixo(const Value: string);
begin
    FPrefixo := Value;
end;

procedure TContasReceber.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TContasReceber.SetRotinaOrigem(const Value: string);
begin
    FRotinaOrigem := Value;
end;

procedure TContasReceber.SetSaldoDevedor(const Value: double);
begin
    FSaldoDevedor := Value;
end;

procedure TContasReceber.SetSequenciamentoCartaoCredito(const Value: string);
begin
    FSequenciamentoCartaoCredito := Value;
end;

procedure TContasReceber.SetSerie(const Value: string);
begin
    FSerie := Value;
end;

procedure TContasReceber.SetSituacao(const Value: string);
begin
    FSituacao := Value;
end;

procedure TContasReceber.SetStatus(const Value: string);
begin
    FStatus := Value;
end;

procedure TContasReceber.SetStatusLiberacaoDeCredito(const Value: string);
begin
    FStatusLiberacaoDeCredito := Value;
end;

procedure TContasReceber.SetTipo(const Value: string);
begin
    FTipo := Value;
end;

procedure TContasReceber.SetUsuario(const Value: string);
begin
    FUsuario := Value;
end;

procedure TContasReceber.SetValor(const Value: double);
begin
    FValor := Value;
end;

procedure TContasReceber.SetValorComissao(const Value: double);
begin
    FValorComissao := Value;
end;

procedure TContasReceber.SetValorCruzado(const Value: double);
begin
    FValorCruzado := Value;
end;

procedure TContasReceber.SetValorDisponivel(const Value: double);
begin
    FValorDisponivel := Value;
end;

procedure TContasReceber.SetValorLiquido(const Value: double);
begin
    FValorLiquido := Value;
end;

procedure TContasReceber.SetValorReal(const Value: double);
begin
    FValorReal := Value;
end;

procedure TContasReceber.SetValorReservado(const Value: double);
begin
    FValorReservado := Value;
end;



end.
