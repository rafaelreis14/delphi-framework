{*Created by @ReisCodeGenerator*}
unit Biz.ParametroSistema;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
	Framework.Interfaces.CRUD, Dal.FabricaSQL;

type
    [TReferenceTable('SIATD_S14')]
	TParametroSistema = class(TClasseBase, ICRUD<TParametroSistema>)
	private
        FCodigoEmpresa: string;
        FCodigoFilial: string;
        FNome: string;
        FValor: string;
        FRecno: integer;
        procedure SetCodigoEmpresa(const Value: string);
        procedure SetCodigoFilial(const Value: string);
        procedure SetNome(const Value: string);
        procedure SetValor(const Value: string);
        procedure SetRecno(const Value: integer);



    public
        class var dao: TControleDados<TLista<TParametroSistema>,TListaDAO<TParametroSistema>>;

        ///	<summary>
        ///	  Metodo que faz a inser��o da ClasseBase
        ///	</summary>
        function Inserir: integer;
        ///	<summary>
        ///	  Metodo que faz a altera��o da ClasseBase
        ///	</summary>
        function Alterar: boolean;

        ///	<summary>
        ///	  M�tido que faz a Dele��o da ClasseBase
        ///	</summary>
        function Excluir: boolean;

        ///	<summary>
        ///	  M�todo que chama a tela de filtro
        ///	</summary>
        ///	<param name="tipoOperacao">
        ///	  Tipo da opera��o, se � somente filtro, ou sele��o de registro
        ///	</param>
        function Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter; 


        ///	<summary>
        ///	  M�todo que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="ID">
        ///	  Chave prim�ria da tabela
        ///	</param>
        function Obter(ID: string): TParametroSistema; overload;

        ///	<summary>
        ///	  M�todo que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Obter(parametros:TParametro): TParametroSistema; overload;


        ///	<summary>
        ///	  M�todo que retonar uma lista com varios objetos de acordo com parametro passado
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Consultar(parametros:TParametro): TLista<TParametroSistema>;


        ///	<summary>
        ///	  M�todo que preenche a inst�ncia do Objeto
        ///	</summary>
        ///	<param name="ClasseBase">
        ///	  objeto de parametro para preenchimento da inst�ncia
        ///	</param>
        procedure PreencherObjeto(ParametroSistema: TParametroSistema);

        class function ObterParametroSistema(parametro: string): string; static;

        [TPersistable(fgPersistable, 'S14_S12_EMP')]
        [TMaxLenght(2)]
        property CodigoEmpresa: string read FCodigoEmpresa write SetCodigoEmpresa;

        [TPersistable(fgPersistable, 'S14_S13_FILIAL')]
        [TMaxLenght(2)]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgPersistable, 'S14_NOME')]
        [TMaxLenght(10)]
        property Nome: string read FNome write SetNome;

        [TPersistable(fgPersistable, 'S14_VALOR')]
        [TMaxLenght(100)]
        property Valor: string read FValor write SetValor;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        constructor Create; override;
        destructor Destroy; override;

    end;

implementation


{ TParametroSistema }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'M�todos CRUD'}

function TParametroSistema.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao inserir ParametroSistema'+#13+ e.Message);
        end;
    finally
    end;
end;

function TParametroSistema.Alterar: boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao alterar ParametroSistema'+#13+ e.Message);
        end;
    finally
    end;
end;


function TParametroSistema.Excluir: boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao excluir ParametroSistema'+#13+ e.Message);
        end;
    finally
    end;
end;

function TParametroSistema.Consultar(parametros: TParametro): Tlista<TParametroSistema>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('S14_S12_EMP',ccIgual, lgAnd); 
        condicao.Adiciona('S14_S13_FILIAL',ccIgual, lgAND);
        condicao.Adiciona('S14_NOME',ccLike, lgAND);
        condicao.Adiciona('S14_VALOR',ccLike, lgAND);
        condicao.Adiciona('R_E_C_N_O_',ccIgual, lgAND);

        query := 'SELECT '+Self.ObterCamposSeparadosPorVirgula(Consulta,[]) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        Result := dao.Consultar(query,parametros);
    finally
        condicao.Free;
    end;
end;

constructor TParametroSistema.Create;
begin
  inherited;

end;

destructor TParametroSistema.Destroy;
begin

  inherited;
end;

function TParametroSistema.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro:TFieldFilter;
    filtro : TFilter<TParametroSistema>;
    //parametro : TParametro;
    //lista:TLista<TParametroSistema>
begin
    try
        filtro := TFilter<TParametroSistema>.Create;
        filtro.ScreenName := 'Filtro de ParametroSistema';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'Nome=S14_NOME', 'Nome');
        filtro.AddIndex(2, 'Valor=S14_VALOR', 'Valor');
        filtro.AddIndex(3, 'CodigoEmpresa=S14_S12_EMP', 'CodigoEmpresa');
        filtro.AddIndex(4, 'CodigoFilial=S14_S13_FILIAL', 'CodigoFilial');

        //###Criar os �ndices do filtro
		// filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descri��o');

        {$REGION 'Campo Filtro'}

        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'CodigoEmpresa'; 
        campoFiltro.Name := 'CodigoEmpresa'; 
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
        campoFiltro.Description := 'Nome'; 
        campoFiltro.Name := 'Nome'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Valor'; 
        campoFiltro.Name := 'Valor'; 
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
 

        {$ENDREGION}

        result := filtro.Execute;
    finally
        // FreeAndNil(parametro);
        // FreeAndNil(lista);
    end;
end;

function TParametroSistema.Obter(parametros: TParametro): TParametroSistema;
var
  lista: TLista<TParametroSistema>;
begin
    try
        lista := Self.Consultar(parametros);

        if lista.Count = 1 then
        begin
           PreencherObjeto(lista[0]);
           Result := Self;
        end
        else
        begin
            Result := nil;
        end;
    finally
        lista.Destroy;
    end;
end;

function TParametroSistema.Obter(ID: string): TParametroSistema;
var
    parametros: TParametro;

begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'S14_NOME', ID);
        result := Obter(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;


{$ENDREGION}

{$REGION 'Regras de Neg�cio'}

procedure TParametroSistema.PreencherObjeto(ParametroSistema: TParametroSistema);
begin
    ParametroSistema.CopiarPara(Self);
    FPreenchido := true;
end;

class function TParametroSistema.ObterParametroSistema(parametro: string): string;
var
    ps: TParametroSistema;
begin
    ps := nil;
    try
        ps := TParametroSistema.Create;
        ps.Obter(parametro);
        if not ps.Preenchido then
            result := EmptyStr
        else
            result := ps.Valor;
    finally
        if ps <> nil then
            FreeAndNil(ps);
    end;
end;



{$ENDREGION}

{$REGION 'M�todos de Propriedades'}

procedure TParametroSistema.SetCodigoEmpresa(const Value: string);
begin
    FCodigoEmpresa := Value;
end;

procedure TParametroSistema.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TParametroSistema.SetNome(const Value: string);
begin
    FNome := Value;
end;

procedure TParametroSistema.SetValor(const Value: string);
begin
    FValor := Value;
end;

procedure TParametroSistema.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;


{$ENDREGION}

end.

