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

        class var dao: TControleDados<TLista<TAdministradora>, TListaDAO<TAdministradora>>;

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

        class function ObterListaAdmistradorasPorFormaPagto(tipoPagamento: string): TLista<TAdministradora>;
    end;

implementation

{ TAdministrdora }

uses Lib.Parametro, Lib.Biblioteca;

class function TAdministradora.ObterListaAdmistradorasPorFormaPagto(tipoPagamento: string): TLista<TAdministradora>;
var
    query: string;
    tipo: string;
begin
    try
        query := '';

        if (tipoPagamento = 'DP') then
        begin
            query := 'SELECT Z41_COD AS AE_COD, ';
            query := query + 'Z41_COD+''-''+Z41_DESCR AS AE_DESC, ';
            query := query + 'LTRIM(STR(Z41_INTERV)) AS AE_VENCTO, ';
            query := query + 'LTRIM(STR(Z41_QTPAR)) AS AE_TDPMAX ';
            query := query + 'FROM Z41010 WITH(NOLOCK) ';
            query := query + 'WHERE Z41_TIPO  = ' + QuotedStr(tipoPagamento);
            query := query + ' AND Z41_ATIVO = ''S'' ';
        end
        else
        begin
            query := 'SELECT Z41_COD AS AE_COD, ';
            query := query + 'Z41_COD+''-''+Z41_DESCR AS AE_DESC, ';
            query := query + 'LTRIM(STR(Z41_INTERV)) AS AE_VENCTO, ';
            query := query + 'LTRIM(STR(Z41_QTPAR)) AS AE_TDPMAX ';
            query := query + 'FROM Z41010 WITH(NOLOCK) ';
            query := query + 'WHERE Z41_TIPO  = ' + QuotedStr(tipoPagamento);
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
