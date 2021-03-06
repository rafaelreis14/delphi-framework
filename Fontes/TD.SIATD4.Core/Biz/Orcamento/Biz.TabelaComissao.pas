unit Biz.TabelaComissao;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.Lista, Lib.ResultFilter,
    Dal.ControleDados;

type

    [TReferenceTable('Z20010')]
    TTabelaComissao = class(TClasseBase)
    private
        FIndice: double;
        FFormasDePagamentoAutorizada: string;
        FTaxaDeJuros: double;
        FQuantidadeParcelas: integer;
        FPercentualMaximoEntrada: double;
        FRecno: integer;
        FCodigoTabela: string;
        procedure SetCodigoTabela(const Value: string);
        procedure SetFormasDePagamentoAutorizada(const Value: string);
        procedure SetIndice(const Value: double);
        procedure SetPercentualMaximoEntrada(const Value: double);
        procedure SetQuantidadeParcelas(const Value: integer);
        procedure SetRecno(const Value: integer);
        procedure SetTaxaDeJuros(const Value: double);
    public

        class var dao: TControleDados<TLista<TTabelaComissao>, TListaDAO<TTabelaComissao>>;

        /// <summary>
        /// M�todo que chama a tela de filtro
        /// </summary>
        /// <param name="tipoOperacao">
        /// Tipo da opera��o, se � somente filtro, ou sele��o de registro
        /// </param>
        function Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;

        /// <summary>
        /// M�todo que retorna um objeto preenchido
        /// </summary>
        /// <param name="ID">
        /// Chave prim�ria da tabela
        /// </param>
        function Obter(ID: string): TTabelaComissao; overload;
        function ObterPadrao: TTabelaComissao;

        /// <summary>
        /// M�todo que retorna um objeto preenchido
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Obter(parametros: TParametro): TTabelaComissao; overload;

        class function ObterTabelasComissao: TLista<TTabelaComissao>; static;

        /// <summary>
        /// M�todo que retonar uma lista com varios objetos de acordo com parametro passado
        /// </summary>
        /// <param name="parametros">
        /// Parametros para a consulta do objeto a ser preenchido
        /// </param>
        function Consultar(parametros: TParametro): TLista<TTabelaComissao>;

        /// <summary>
        /// M�todo que preenche a inst�ncia do Objeto
        /// </summary>
        /// <param name="TabelaComissao">
        /// objeto de parametro para preenchimento da inst�ncia
        /// </param>
        procedure PopularObjeto(TabelaComissao: TTabelaComissao);

        [TPersistable(fgPersistable, 'Z20_RECNO')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgPersistable, 'Z20_TABELA')]
        [TMaxLenght(2)]
        property CodigoTabela: string read FCodigoTabela write SetCodigoTabela;

        [TPersistable(fgPersistable, 'Z20_PARCEL')]
        property QuantidadeParcelas: integer read FQuantidadeParcelas write SetQuantidadeParcelas;

        [TPersistable(fgPersistable, 'Z20_INDICE')]
        property Indice: double read FIndice write SetIndice;

        [TPersistable(fgPersistable, 'Z20_JUROS')]
        property TaxaDeJuros: double read FTaxaDeJuros write SetTaxaDeJuros;

        [TPersistable(fgPersistable, 'Z20_ENTRAD')]
        property PercentualMaximoEntrada: double read FPercentualMaximoEntrada write SetPercentualMaximoEntrada;

        [TPersistable(fgPersistable, 'Z20_CONDPG')]
        [TMaxLenght(50)]
        property FormasDePagamentoAutorizada: string read FFormasDePagamentoAutorizada write SetFormasDePagamentoAutorizada;

    end;

implementation

{ TTabelaComissao }

uses Lib.Filter, Lib.Biblioteca, Dal.CondicaoConsulta;

{$REGION 'M�todos CRUD'}

function TTabelaComissao.Consultar(parametros: TParametro): TLista<TTabelaComissao>;
var
    query: TStringBuilder;
    campos: TStringList;
    CondicaoConsulta: TCondicaoConsulta;
begin
    try
        CondicaoConsulta := TCondicaoConsulta.Create(parametros);
        CondicaoConsulta.Adiciona('Z20_RECNO', ccIgual, lgAnd);
        CondicaoConsulta.Adiciona('Z20_TABELA', ccIgual, lgAnd);
        CondicaoConsulta.Adiciona('Z20_PARCEL', ccIgual, lgAnd);
        CondicaoConsulta.Adiciona('Z20_INDICE', ccIgual, lgAnd);
        CondicaoConsulta.Adiciona('Z20_JUROS', ccIgual, lgAnd);
        CondicaoConsulta.Adiciona('Z20_ENTRAD', ccIgual, lgAnd);
        CondicaoConsulta.Adiciona('Z20_CONDPG', ccIgual, lgAnd);

        campos := Self.ObterListaDeCampos(Consulta, []);

        query := TStringBuilder.Create;
        query.Append('SELECT ');
        query.Append(campos.CommaText);
        query.Append(' FROM ').Append(Self.TabelaReferencia);
        query.Append(' WHERE D_E_L_E_T_ = '''' ');
        query.Append(' AND Z20_TABELA IN (''T1'',''T4'',''T6'') ');
        query.Append(CondicaoConsulta.ToString(true));
        query.Append(' ORDER BY Z20_TABELA ');

        result := dao.Consultar(query.ToString, parametros);
    finally
        if CondicaoConsulta <> nil then
            FreeAndNil(CondicaoConsulta);

        if campos <> nil then
            FreeAndNil(campos);

        if query <> nil then
            FreeAndNil(query);
    end;
end;

function TTabelaComissao.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TTabelaComissao>;
    // parametro : TParametro;
    // lista:TLista<TTabelaComissao>
begin
    try
        filtro := TFilter<TTabelaComissao>.Create;
        filtro.ScreenName := 'Filtro de TabelaComissao';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.Task := 'ConsultarTabelaComissao';
        // ###Criar os �ndices do filtro

{$REGION 'Campo Filtro'}
        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Recno';
        campoFiltro.Name := 'Recno';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'CodigoTabela';
        campoFiltro.Name := 'CodigoTabela';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'QuantidadeParcelas';
        campoFiltro.Name := 'QuantidadeParcelas';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'Indice';
        campoFiltro.Name := 'Indice';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'TaxaDeJuros';
        campoFiltro.Name := 'TaxaDeJuros';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'PercentualMaximoEntrada';
        campoFiltro.Name := 'PercentualMaximoEntrada';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

        campoFiltro := TFieldFilter.Create;
        campoFiltro.Description := 'FormasDePagamentoAutorizada';
        campoFiltro.Name := 'FormasDePagamentoAutorizada';
        campoFiltro.MaskTypes := mtNone;
        campoFiltro.GridSize := 100;
        campoFiltro.FieldType := fdNormal;
        filtro.AddField(campoFiltro);

{$ENDREGION}
        result := filtro.Execute;
    finally
        // FreeAndNil(parametro);
        // FreeAndNil(lista.Destroy);
    end;
end;

function TTabelaComissao.Obter(parametros: TParametro): TTabelaComissao;
var
    Lista: TLista<TTabelaComissao>;
    query: string;
begin
    try
        Lista := nil;
        Lista := Self.Consultar(parametros);

        if Lista.Count = 1 then
        begin
            PopularObjeto(Lista[0]);
            result := Self;
        end
        else
        begin
            MessageDlg('Nenhum registro encontrado.', mtError, [mbOk], 0);
            result := nil;
        end;
    finally
        FreeAndNil(Lista);
    end;

end;

function TTabelaComissao.ObterPadrao: TTabelaComissao;
var
    parametros: TParametro;

begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'Z20_TABELA', 'T1');
        result := Obter(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

class function TTabelaComissao.ObterTabelasComissao: TLista<TTabelaComissao>;
var
    t: TTabelaComissao;
begin
    Result := nil;
    try
        t := TTabelaComissao.Create;
        Result := t.Consultar(nil);
    finally
        if t <> nil then FreeAndNil(t);
    end;
end;

function TTabelaComissao.Obter(ID: string): TTabelaComissao;
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
{$REGION 'Regras de Neg�cio'}

procedure TTabelaComissao.PopularObjeto(TabelaComissao: TTabelaComissao);
begin
    TabelaComissao.CopiarPara(Self);
    FPreenchido := true;
end;

procedure TTabelaComissao.SetCodigoTabela(const Value: string);
begin
    FCodigoTabela := Value;
end;

procedure TTabelaComissao.SetFormasDePagamentoAutorizada(const Value: string);
begin
    FFormasDePagamentoAutorizada := Value;
end;

procedure TTabelaComissao.SetIndice(const Value: double);
begin
    FIndice := Value;
end;

procedure TTabelaComissao.SetPercentualMaximoEntrada(const Value: double);
begin
    FPercentualMaximoEntrada := Value;
end;

procedure TTabelaComissao.SetQuantidadeParcelas(const Value: integer);
begin
    FQuantidadeParcelas := Value;
end;

procedure TTabelaComissao.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;

procedure TTabelaComissao.SetTaxaDeJuros(const Value: double);
begin
    FTaxaDeJuros := Value;
end;

{$ENDREGION}
{$REGION 'M�todos de Propriedades'}
{$ENDREGION}

end.
