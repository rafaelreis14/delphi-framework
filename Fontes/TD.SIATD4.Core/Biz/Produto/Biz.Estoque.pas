unit Biz.Estoque;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.Lista, Lib.ResultFilter,
    Framework.Interfaces.CRUD, Dal.ControleDados;

type
    [TReferenceTable('SB2010')]
    TEstoque = class(TClasseBase)
    private
        FLocal: string;
        FFilial: string;
        FCodigoProduto: string;
        FRecno: integer;
        FSaldo: double;
        FDelete: string;
        procedure SetCodigoProduto(const Value: string);
        procedure SetDelete(const Value: string);
        procedure SetFilial(const Value: string);
        procedure SetLocal(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetSaldo(const Value: double);
    public

        class var dao: TControleDados<TLista<TEstoque>,TListaDAO<TEstoque>>;

        /// <summary>
        /// M�todo que retonar uma lista com varios objetos de acordo com parametro passado
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Consultar(parametros: TParametro): TLista<TEstoque>;

        /// <summary>
        /// M�todo que preenche a inst�ncia do Objeto
        /// </summary>
        /// <param name="Estoque">
        /// objeto de parametro para preenchimento da inst�ncia
        /// </param>
        procedure PreencherObjeto(Estoque: TEstoque);

        [TPersistable(fgPersistable, 'B2_FILIAL')]
        [TMaxLenght(2)]
        property Filial: string read FFilial write SetFilial;

        [TPersistable(fgPersistable, 'B2_COD')]
        [TMaxLenght(15)]
        property CodigoProduto: string read FCodigoProduto write SetCodigoProduto;

        [TPersistable(fgPersistable, 'B2_LOCAL')]
        [TMaxLenght(2)]
        property Local: string read FLocal write SetLocal;

        [TPersistable(fgPersistable, 'B2_QATU')]
        property Saldo: double read FSaldo write SetSaldo;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgPersistable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

    end;

implementation

{ TEstoque }

uses Lib.Filter, Lib.Biblioteca, Dal.CondicaoConsulta;

{$REGION 'M�todos CRUD'}


function TEstoque.Consultar(parametros: TParametro): TLista<TEstoque>;
var
    query: TStringBuilder;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametroS);
        // condicao.Adiciona('B2_FILIAL', ccIn, lgAnd);
        condicao.Adiciona('B2_COD', ccIgual, lgAnd);
        condicao.Adiciona('B2_QATU', ccIgual, lgAnd);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAnd);

        query := TStringBuilder.Create;
        query.Append('SELECT ');
        query.Append(Self.ObterCamposSeparadosPorVirgula(Consulta,[])).Append(', CAST((B2_QATU-B2_RESERVA) AS NUMERIC(15,2)) AS B2_QATU ');
        query.Append(' FROM ').Append(Self.TabelaReferencia);
        query.Append(' WHERE D_E_L_E_T_ = '''' ');
        query.Append(condicao.ToString(true));
        query.Append(' AND B2_LOCAL = ''01'' ');
        query.Append('AND B2_FILIAL IN ( ').Append(parametros.ObterValorParamentro('B2_FILIAL')).Append(' )');

        Result := dao.Consultar(query.ToString, parametros);
    finally
        if query <> nil then
            FreeAndNil(query);
        if condicao <> nil then
            FreeAndNil(condicao);
    end;
end;

{$ENDREGION}
{$REGION 'Regras de Neg�cio'}

procedure TEstoque.PreencherObjeto(Estoque: TEstoque);
begin
    Estoque.CopiarPara(Self);
    FPreenchido := true;
end;

procedure TEstoque.SetCodigoProduto(const Value: string);
begin
    FCodigoProduto := Value;
end;

procedure TEstoque.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TEstoque.SetFilial(const Value: string);
begin
    FFilial := Value;
end;

procedure TEstoque.SetLocal(const Value: string);
begin
    FLocal := Value;
end;

procedure TEstoque.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TEstoque.SetSaldo(const Value: double);
begin
    FSaldo := Value;
end;

{$ENDREGION}
{$REGION 'M�todos de Propriedades'}
{$ENDREGION}

end.
