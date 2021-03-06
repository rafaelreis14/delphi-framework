unit Biz.OrcamentoPagamento;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.Biblioteca, Lib.ResultFilter, System.StrUtils, Biz.Cliente,
    Biz.Adminsitradora, Lib.Lista, Dal.ControleDados;

type
    TFormaPagamento = (fpAVista = 1, fpCartaoDebito = 2, fpCartaoCredito = 3, fpCheque = 4, fpDuplicata = 5, fpFinanciamento = 6, fpCompesacaoCreditoTDC = 7, fpExclusivoTDE = 8, fpPrivativoTDP = 9);

    TTipoGeracaoParcela = (tgNenhum = -1, tgVencimento = 0, tgIntervalo = 1);

    [TReferenceTable('SZ9010')]
    TOrcamentoPagamento = class(TClasseBase)
    private
        FObservacao: string;
        FRG: string;
        FFilial: string;
        FValorParcela: double;
        FNomeCliente: string;
        FFormaPagto: string;
        FAdministradora: string;
        FVencimento: string;
        FNumero: string;
        FRecno: integer;
        FCartID: string;
        FConta: string;
        FDelete: string;
        FTipoCheque: string;
        FAgenciaBanco: string;
        FCgc: string;
        FTelefone: string;
        FParcela: string;
        FNumeroDocumento: string;
        FCliente: TCliente;
        FCodigoCliente: integer;
        FFormaPagamento: TFormaPagamento;
        FNSUTef: string;
        FUsuario: string;
        FAdministradora_: TAdministradora;
        FNSUHost: string;
        FAutorizacao: string;
        procedure SetAdministradora(const Value: string);
        procedure SetAgenciaBanco(const Value: string);
        procedure SetCartID(const Value: string);
        procedure SetCgc(const Value: string);
        procedure SetConta(const Value: string);
        procedure SetDelete(const Value: string);
        procedure SetFilial(const Value: string);
        procedure SetFormaPagto(const Value: string);
        procedure SetNomeCliente(const Value: string);
        procedure SetNumero(const Value: string);
        procedure SetNumeroDocumento(const Value: string);
        procedure SetObservacao(const Value: string);
        procedure SetParcela(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetRG(const Value: string);
        procedure SetTelefone(const Value: string);
        procedure SetTipoCheque(const Value: string);
        procedure SetValorParcela(const Value: double);
        procedure SetVencimento(const Value: string);
        function GetFormaPagamento: TFormaPagamento;
        function ObterDescricaoTipoCheque: string;
        function GetFormaPagto: string;
        procedure SetCliente(const Value: TCliente);
        procedure SetCodigoCliente(const Value: integer);
        procedure SetFormaPagamento(const Value: TFormaPagamento);
        procedure SetNSUTef(const Value: string);
        procedure SetUsuario(const Value: string);
        procedure SetAdministradora_(const Value: TAdministradora);
        procedure SetNSUHost(const Value: string);
        procedure SetAutorizacao(const Value: string);
    public

        class var dao: TControleDados<TLista<TOrcamentoPagamento>, TListaDAO<TOrcamentoPagamento>>;

        function Inserir: boolean;
        function Alterar: boolean;
        function Excluir(definitivo: boolean = false): boolean;
        function ExcluirCondicoesPagamentoPorOrcamento(numeroOrcamento: string): boolean;

        function Consultar(parametros: TParametro): TLista<TOrcamentoPagamento>;

        procedure PopularObjeto(OrcamentoPagamento: TOrcamentoPagamento);

        /// <summary>
        /// Retorna valor correspondente da parcela
        /// </summary>
        class function ObtemValorParcela(i: integer): string; deprecated; // n�o esta mais em uso;

        /// <summary>
        /// Converte de String para TformaPagamento
        /// </summary>
        class function StringParaFormaPagamento(formaPgto: string): TFormaPagamento;

        /// <summary>
        /// Converte de TformaPagamento para String
        /// </summary>
        class function FormaPagamentoParaString(formaPgto: TFormaPagamento): string;

        /// <summary>
        /// Obtem a descricao extendida da forma de pagamento
        /// </summary>
        function ObtemDescricaoExtendidaFormaPagamento: string;

        /// <summary>
        /// Verifica igualdade da condicao de pagamento passada por parametro
        /// </summary>
        function VerificarIgualdadeCondicaoPagamento(condicaoPagto: TOrcamentoPagamento): boolean;

        [TPersistable(fgPersistable, 'Z9_FILIAL')]
        property Filial: string read FFilial write SetFilial;

        [TPersistable(fgPersistable, 'Z9_NUM')]
        property Numero: string read FNumero write SetNumero;

        [TPersistable(fgPersistable, 'Z9_DATA')]
        property Vencimento: string read FVencimento write SetVencimento;

        [TPersistable(fgPersistable, 'Z9_VALOR')]
        property ValorParcela: double read FValorParcela write SetValorParcela;

        [TPersistable(fgPersistable, 'Z9_FORMA')]
        property FormaPagamento_: string read GetFormaPagto write SetFormaPagto;

        property FormaPagamento: TFormaPagamento read GetFormaPagamento write SetFormaPagamento;

        [TPersistable(fgPersistable, 'Z9_ADMINIS')]
        [TMaxLenght(20)]
        property Administradora: string read FAdministradora write SetAdministradora;

        property Administradora_: TAdministradora read FAdministradora_ write SetAdministradora_;

        [TPersistable(fgPersistable, 'Z9_NUMCART')]
        property NumeroDocumento: string read FNumeroDocumento write SetNumeroDocumento;

        [TPersistable(fgPersistable, 'Z9_AGENCIA')]
        property AgenciaBanco: string read FAgenciaBanco write SetAgenciaBanco;

        [TPersistable(fgPersistable, 'Z9_CONTA')]
        property Conta: string read FConta write SetConta;

        [TPersistable(fgPersistable, 'Z9_RG')]
        property RG: string read FRG write SetRG;

        [TPersistable(fgPersistable, 'Z9_TELEFON')]
        property Telefone: string read FTelefone write SetTelefone;

        [TPersistable(fgPersistable, 'Z9_OBS')]
        property Observacao: string read FObservacao write SetObservacao;

        /// <summary>
        /// Se � cheque de terceceiro ou pr�prio
        /// </summary>
        /// <value>
        /// T = Terceiro ou F = Pr�prio
        /// </value>
        [TPersistable(fgPersistable, 'Z9_TERCEIR')]
        property TipoCheque: string read FTipoCheque write SetTipoCheque;

        property TipoCheque_: string read ObterDescricaoTipoCheque;

        [TPersistable(fgPersistable, 'Z9_XNUMSEQ')]
        property Parcela: string read FParcela write SetParcela;

        [TPersistable(fgPersistable, 'Z9_CGC')]
        property Cgc: string read FCgc write SetCgc;

        [TPersistable(fgPersistable, 'Z9_NOMECLI')]
        [TMaxLenght(40)]
        property NomeCliente: string read FNomeCliente write SetNomeCliente;

        property CodigoCliente: integer read FCodigoCliente write SetCodigoCliente;

        property Cliente: TCliente read FCliente write SetCliente;

        [TPersistable(fgPersistable, 'Z9_CARTID')]
        property SequenciamentoCartao: string read FCartID write SetCartID;

        /// <summary>
        /// Propriedade que guarda o n�medo de identifica��o do TEF, e
        /// servir� pra fazer a concilia��o do banco.
        /// </summary>
        [TPersistable(fgPersistable, 'Z9_NSUTD')]
        property NSUTef: string read FNSUTef write SetNSUTef;

        [TPersistable(fgPersistable, 'Z9_DOCTEF')]
        property NSUHost: string read FNSUHost write SetNSUHost;

        [TPersistable(fgPersistable, 'Z9_AUTORIZ')]
        property Autorizacao: string read FAutorizacao write SetAutorizacao;

        [TPersistable(fgPersistable, 'Z9_USERID')]
        property Usuario: string read FUsuario write SetUsuario;

        [TPersistable(fgUpdateable, 'D_E_L_E_T_')]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgPersistable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        constructor Create;
        destructor Destroy; override;

    end;

implementation

{ TOrcamentoPagamento }

{$REGION 'M�todos CRUD'}

uses Lib.Filter, Dal.CondicaoConsulta, Dal.FabricaSQL, Biz.UsuarioLogado;

class function TOrcamentoPagamento.FormaPagamentoParaString(formaPgto: TFormaPagamento): string;
begin
    case integer(formaPgto) of
        1:
            Result := 'R$';
        2:
            Result := 'CD';
        3:
            Result := 'CC';
        4:
            Result := 'CH';
        5:
            Result := 'DP';
        6:
            Result := 'FI';
        7:
            Result := 'TDC';
        8:
            Result := 'TDE';
        9:
            Result := 'TDP';
    end;

end;

function TOrcamentoPagamento.GetFormaPagamento: TFormaPagamento;
begin
    // if (FormaPagamento_ <> EmptyStr) then
    Result := StringParaFormaPagamento(FormaPagamento_);
end;

function TOrcamentoPagamento.GetFormaPagto: string;
begin
    // if (FFormaPagto = EmptyStr) then
    //
    // result := FormaPagamentoParaString(FormaPagamento)
    // else
    Result := FFormaPagto;
end;

function TOrcamentoPagamento.Alterar: boolean;
var
    fabrica: TFabricaSql;
    query: WideString;
    parametros: TParametro;
begin
    Result := false;
    try
        try
            fabrica := TFabricaSql.Create(Self);
            fabrica.GerarSqlAlteracao(query, parametros);
            dao.Alterar(query, parametros);
        except
            raise Exception.Create('Erro ao alterar condi��o de pagamento do or�amento');

        end;
        Result := true;
    finally
        if fabrica <> nil then
            FreeAndNil(fabrica);

        if parametros <> nil then
            FreeAndNil(parametros);
    end;
end;

function TOrcamentoPagamento.Inserir: boolean;
var
    fabrica: TFabricaSql;
    query: WideString;
    parametros: TParametro;
begin
    Result := false;
    try
        try
            fabrica := TFabricaSql.Create(Self);
            fabrica.GerarSqlInsercao(query, parametros);
            dao.Inserir(query, parametros);
        except
            raise Exception.Create('Erro ao inserir condi��o de pagamento  do or�amento');

        end;
        Result := true;
    finally
        if fabrica <> nil then
            FreeAndNil(fabrica);

        if parametros <> nil then
            FreeAndNil(parametros);
    end;

end;

function TOrcamentoPagamento.Consultar(parametros: TParametro): TLista<TOrcamentoPagamento>;
var
    query: TStringBuilder;
    condicao: TCondicaoConsulta;
    camposPadrao: TStringList;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('Z9_FILIAL', ccIgual, lgAND);
        condicao.Adiciona('Z9_NUM', ccIgual, lgAND);
        condicao.Adiciona('Z9_DATA', ccIgual, lgAND);
        condicao.Adiciona('Z9_VALOR', ccIgual, lgAND);
        condicao.Adiciona('Z9_FORMA', ccIgual, lgAND);
        condicao.Adiciona('Z9_ADMINIS', ccIgual, lgAND);
        condicao.Adiciona('Z9_NUMCART', ccIgual, lgAND);
        condicao.Adiciona('Z9_AGENCIA', ccIgual, lgAND);
        condicao.Adiciona('Z9_CONTA', ccIgual, lgAND);
        condicao.Adiciona('Z9_RG', ccIgual, lgAND);
        condicao.Adiciona('Z9_TELEFON', ccIgual, lgAND);
        condicao.Adiciona('Z9_OBS', ccIgual, lgAND);
        condicao.Adiciona('Z9_TERCEIR', ccIgual, lgAND);
        condicao.Adiciona('Z9_XNUMSEQ', ccIgual, lgAND);
        condicao.Adiciona('Z9_CGC', ccIgual, lgAND);
        condicao.Adiciona('Z9_NOMECLI', ccIgual, lgAND);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAND);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAND);
        condicao.Adiciona('Z9_CARTID', ccIgual, lgAND);
        condicao.Adiciona('Z9_NSUTD', ccIgual, lgAND);
        condicao.Adiciona('Z9_USERID', ccIgual, lgAND);

        camposPadrao := Self.ObterListaDeCampos(Consulta, []);

        query := TStringBuilder.Create;
        query.Append('SELECT ');
        query.Append(camposPadrao.CommaText);
        query.Append(' FROM ').Append(Self.TabelaReferencia);
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

constructor TOrcamentoPagamento.Create;
begin
    FAdministradora_ := TAdministradora.Create;
end;

destructor TOrcamentoPagamento.Destroy;
begin
    if FAdministradora_ <> nil then
        FreeAndNil(FAdministradora_);

    inherited;
end;

function TOrcamentoPagamento.Excluir(definitivo: boolean): boolean;
var
    fabrica: TFabricaSql;
    query: WideString;
    parametros: TParametro;
begin
    Result := false;
    try
        try
            fabrica := TFabricaSql.Create(Self);
            fabrica.GerarSqlExclusao(query, parametros, definitivo);
            dao.Excluir(query, parametros);
        except
            raise Exception.Create('Erro ao excluir condicao de pagamento do or�amento');

        end;
        Result := true;
    finally
        if fabrica <> nil then
            FreeAndNil(fabrica);

        if parametros <> nil then
            FreeAndNil(parametros);
    end;
end;

function TOrcamentoPagamento.ExcluirCondicoesPagamentoPorOrcamento(numeroOrcamento: string): boolean;
var
    query: string;
    Parametro: TParametro;
begin
    Result := false;
    try
        try
            Parametro := TParametro.Create;
            Parametro.Add('', '', 'Z9_NUM', numeroOrcamento);
            Parametro.Add('', '', 'Z9_FILIAL', TUsuarioLogado.ObterInstancia.Filial.Filial);
            query := 'DELETE FROM ' + Self.TabelaReferencia + ' WHERE Z9_NUM = :Z9_NUM AND Z9_FILIAL = :Z9_FILIAL';
            dao.Excluir(query, Parametro);
            Result := true;
        except
            raise Exception.Create('Erro ao excluir condi��es de pagamento do orcamento');
        end;

    finally
        if Parametro <> nil then
            FreeAndNil(Parametro);
    end;
end;

function TOrcamentoPagamento.ObtemDescricaoExtendidaFormaPagamento: string;
begin
    case AnsiIndexStr(Self.FormaPagamento_, ['R$', 'CD', 'CC', 'CH', 'DP', 'FI', 'TDC', 'TDE', 'TDP']) of
        0:
            Result := 'A Vista';
        1:
            Result := 'Cartao Debito';
        2:
            Result := 'Cartao Credito';
        3:
            Result := 'Cheque';
        4:
            Result := 'Duplicata';
        5:
            Result := 'Financiado';
        6:
            Result := 'Todimo Comprescao de Credito';
        7:
            Result := 'Todimo Exclusivo';
        8:
            Result := 'Todimo Privativo';
    end;
end;

class function TOrcamentoPagamento.ObtemValorParcela(i: integer): string;
const
    aParcelas: array [0 .. 24] of Char = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'Y', 'W', 'Z');
begin
    Result := aParcelas[i];
end;

function TOrcamentoPagamento.ObterDescricaoTipoCheque: string;
begin
    if FTipoCheque = 'F' then
        Result := 'Pr�prio'
    else if FTipoCheque = 'T' then
        Result := 'Terceiro';
end;

{$ENDREGION}
{$REGION 'Regras de Neg�cio'}

procedure TOrcamentoPagamento.PopularObjeto(OrcamentoPagamento: TOrcamentoPagamento);
begin
    OrcamentoPagamento.copiarPara(Self);
    FPreenchido := true;
end;

{$ENDREGION}
{$REGION 'M�todos de Propriedades'}

procedure TOrcamentoPagamento.SetAdministradora(const Value: string);
begin
    FAdministradora := Value;
end;

procedure TOrcamentoPagamento.SetAdministradora_(const Value: TAdministradora);
begin
    FAdministradora_ := Value;
end;

procedure TOrcamentoPagamento.SetAgenciaBanco(const Value: string);
begin
    FAgenciaBanco := Value;
end;

procedure TOrcamentoPagamento.SetAutorizacao(const Value: string);
begin
    FAutorizacao := Value;
end;

procedure TOrcamentoPagamento.SetCartID(const Value: string);
begin
    FCartID := Value;
end;

procedure TOrcamentoPagamento.SetCgc(const Value: string);
begin
    FCgc := Value;
end;

procedure TOrcamentoPagamento.SetCliente(const Value: TCliente);
begin
    FCliente := Value;
end;

procedure TOrcamentoPagamento.SetCodigoCliente(const Value: integer);
begin
    FCodigoCliente := Value;
end;

procedure TOrcamentoPagamento.SetConta(const Value: string);
begin
    FConta := Value;
end;

procedure TOrcamentoPagamento.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TOrcamentoPagamento.SetFilial(const Value: string);
begin
    FFilial := Value;
end;

procedure TOrcamentoPagamento.SetFormaPagamento(const Value: TFormaPagamento);
begin
    FFormaPagamento := Value;
end;

procedure TOrcamentoPagamento.SetFormaPagto(const Value: string);
begin
    FFormaPagto := Value;
end;

procedure TOrcamentoPagamento.SetNomeCliente(const Value: string);
begin
    FNomeCliente := Value;
end;

procedure TOrcamentoPagamento.SetNSUHost(const Value: string);
begin
    FNSUHost := Value;
end;

procedure TOrcamentoPagamento.SetNSUTef(const Value: string);
begin
    FNSUTef := Value;
end;

procedure TOrcamentoPagamento.SetNumero(const Value: string);
begin
    FNumero := Value;
end;

procedure TOrcamentoPagamento.SetNumeroDocumento(const Value: string);
begin
    FNumeroDocumento := Value;
end;

procedure TOrcamentoPagamento.SetObservacao(const Value: string);
begin
    FObservacao := Value;
end;

procedure TOrcamentoPagamento.SetParcela(const Value: string);
begin
    FParcela := Value;
end;

procedure TOrcamentoPagamento.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TOrcamentoPagamento.SetRG(const Value: string);
begin
    FRG := Value;
end;

procedure TOrcamentoPagamento.SetTelefone(const Value: string);
begin
    FTelefone := Value;
end;

procedure TOrcamentoPagamento.SetTipoCheque(const Value: string);
begin
    FTipoCheque := Value;
end;

procedure TOrcamentoPagamento.SetUsuario(const Value: string);
begin
    FUsuario := Value;
end;

procedure TOrcamentoPagamento.SetValorParcela(const Value: double);
begin
    FValorParcela := Value;
end;

procedure TOrcamentoPagamento.SetVencimento(const Value: string);
begin
    FVencimento := Value;
end;

class function TOrcamentoPagamento.StringParaFormaPagamento(formaPgto: string): TFormaPagamento;
begin
    case AnsiIndexStr(formaPgto, ['R$', 'CD', 'CC', 'CH', 'DP', 'FI', 'TDC', 'TDE', 'TDP']) of
        0:
            Result := fpAVista;
        1:
            Result := fpCartaoDebito;
        2:
            Result := fpCartaoCredito;
        3:
            Result := fpCheque;
        4:
            Result := fpDuplicata;
        5:
            Result := fpFinanciamento;
        6:
            Result := fpCompesacaoCreditoTDC;
        7:
            Result := fpExclusivoTDE;
        8:
            Result := fpPrivativoTDP;
    end;
end;

function TOrcamentoPagamento.VerificarIgualdadeCondicaoPagamento(condicaoPagto: TOrcamentoPagamento): boolean;
begin
    Result := false;
    if condicaoPagto = nil then
        exit;

    if (Self.FormaPagamento = condicaoPagto.FormaPagamento) and (Self.Administradora = condicaoPagto.Administradora) and (Self.SequenciamentoCartao = condicaoPagto.SequenciamentoCartao) then
        Result := true;

end;

{$ENDREGION}

end.
