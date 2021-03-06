unit Biz.Adminsitradora;

interface

uses Lib.ClasseBase, Lib.Persistable, Lib.Lista, System.SysUtils, System.StrUtils,
  Dal.ControleDados;

type
    [TReferenceTable('SAE010')]
    TAdministradora = class(TClasseBase)
    private
        FDescricao: string;
        FCodigoFilial: string;
        FDias: integer;
        FCodigoAdministradora: string;
        FTaxa: double;
        FQuantidadeParcelasMaxima: integer;
        procedure SetCodigoAdministradora(const Value: string);
        procedure SetCodigoFilial(const Value: string);
        procedure SetDescricao(const Value: string);
        procedure SetDias(const Value: integer);
        procedure SetTaxa(const Value: double);
        procedure SetQuantidadeParcelasMaxima(const Value: integer);
    public

        class var dao: TControleDados<TLista<TAdministradora>,TListaDAO<TAdministradora>>;

        [TPersistable(fgPersistable, 'AE_FILIAL')]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgPersistable, 'AE_COD')]
        property CodigoAdministradora: string read FCodigoAdministradora write SetCodigoAdministradora;

        [TPersistable(fgPersistable, 'AE_DESC')]
        property Descricao: string read FDescricao write SetDescricao;

        [TPersistable(fgPersistable, 'AE_VENCTO')]
        property Dias: integer read FDias write SetDias;

        [TPersistable(fgPersistable, 'AE_TAXA')]
        property Taxa: double read FTaxa write SetTaxa;

        [TPersistable(fgPersistable, 'AE_TDPMAX')]
        property QuantidadeParcelasMaxima: integer read FQuantidadeParcelasMaxima write SetQuantidadeParcelasMaxima;

        function ObterListaAdmistradorasPorFormaPagto(tipoPagamento: string): TLista<TAdministradora>;
    end;

implementation

{ TAdministrdora }

uses Lib.Parametro, Lib.Biblioteca;


function TAdministradora.ObterListaAdmistradorasPorFormaPagto(tipoPagamento: string): TLista<TAdministradora>;
var
    query: string;
    tipo: string;
begin
    try
        query := '';

        if (tipo = 'CD') or (tipo = 'CC') then
        begin
            query := 'SELECT T1.AE_COD, (T1.AE_COD + '' - '' + T1.AE_DESC) AS AE_DESC, AE_VENCTO, AE_TDPMAX ';
            query := query + ' FROM( SELECT (SELECT TOP 1 AE_COD FROM ' + Self.TabelaReferencia + ' WITH(NOLOCK) ';
            query := query + ' WHERE AE_CODCLI!=''*'' AND AE_TIPO= ' + QuotedStr(tipoPagamento);
            query := query + ' AND AE_FILIAL = ''''  AND AE_TDOPERA != '''' ';
            query := query + ' AND  D_E_L_E_T_!=''*'' AND AE_TDOPERA = AE.AE_TDOPERA) AS AE_COD';
            query := query + ', AE.AE_TDOPERA AS AE_DESC, AE.AE_VENCTO, MAX(AE.AE_TDPMAX) AE_TDPMAX ';
            query := query + ' FROM ' + Self.TabelaReferencia +' AS AE WITH(NOLOCK) ';
            query := query + ' WHERE AE.AE_CODCLI!=''*'' AND AE.AE_TIPO= ' + QuotedStr(tipo);
            query := query + ' AND AE.AE_FILIAL = '''' AND AE.AE_TDOPERA != '''' AND AE.D_E_L_E_T_!=''*'' ';
            query := query + ' GROUP BY AE.AE_TDOPERA, AE.AE_VENCTO) AS T1 ';
            query := query + ' ORDER BY T1.AE_COD';
        end
        else
        if (tipoPagamento = 'FI') then
        begin
            query := 'SELECT AE_COD, (AE_COD+'' - ''+AE_DESC) AS AE_DESC, AE_VENCTO, AE_TDPMAX FROM ' + Self.TabelaReferencia + ' WITH(NOLOCK) WHERE AE_CODCLI!=''*'' AND AE_TIPO= ' + QuotedStr(tipo) + 'AND AE_FILIAL = '''' AND  D_E_L_E_T_!=''*'' ';
        end
        else
        if (tipoPagamento = 'DP') then
        begin
            query := 'SELECT Z41_COD AS AE_COD, ';
            query := query + 'Z41_COD+''-''+Z41_DESCR AS AE_DESC, ';
            query := query + 'LTRIM(STR(Z41_INTERV)) AS AE_VENCTO, ';
            query := query + 'LTRIM(STR(Z41_QTPAR)) AS AE_TDPMAX ';
            query := query + 'FROM Z41010 WITH(NOLOCK) ';
            query := query + 'WHERE Z41_TIPO  = '+QuotedStr(tipoPagamento);
            query := query + ' AND Z41_ATIVO = ''S'' ';
        end
        else
        begin
            query := 'SELECT Z41_COD AS AE_COD, ';
            query := query + 'Z41_COD+''-''+Z41_DESCR AS AE_DESC, ';
            query := query + 'LTRIM(STR(Z41_INTERV)) AS AE_VENCTO, ';
            query := query + 'LTRIM(STR(Z41_QTPAR)) AS AE_TDPMAX ';
            query := query + 'FROM Z41010 WITH(NOLOCK) ';
            query := query + 'WHERE Z41_TIPO  = '+QuotedStr(tipoPagamento);
            query := query + ' AND Z41_ATIVO = ''S'' ';
        end;

        result := dao.Consultar(query, nil)

    finally

    end;
end;

procedure TAdministradora.SetCodigoAdministradora(const Value: string);
begin
    FCodigoAdministradora := Value;
end;

procedure TAdministradora.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TAdministradora.SetDescricao(const Value: string);
begin
    FDescricao := Value;
end;

procedure TAdministradora.SetDias(const Value: integer);
begin
    FDias := Value;
end;

procedure TAdministradora.SetQuantidadeParcelasMaxima(const Value: integer);
begin
    FQuantidadeParcelasMaxima := Value;
end;

procedure TAdministradora.SetTaxa(const Value: double);
begin
    FTaxa := Value;
end;

end.
