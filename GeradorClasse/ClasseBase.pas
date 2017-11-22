{*Created by @ReisCodeGenerator*}
unit Biz.ClsBase;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
	Framework.Interfaces.CRUD, Dal.FabricaSQL[CRIAR_USES_DETALHES];

type
    [TReferenceTable('[TABELA]')]
	TClsBase = class(TClasseBase, ICRUD<TClsBase>)
	private
	    [CRIAR_GETSET_ASSINATURA]

    public
        class var dao: TControleDados<TLista<TClsBase>,TListaDAO<TClsBase>>;

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
        function Obter(ID: string): TClsBase; overload;

        ///	<summary>
        ///	  M�todo que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Obter(parametros:TParametro): TClsBase; overload;


        ///	<summary>
        ///	  M�todo que retonar uma lista com varios objetos de acordo com parametro passado
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Consultar(parametros:TParametro): TLista<TClsBase>;


        ///	<summary>
        ///	  M�todo que preenche a inst�ncia do Objeto
        ///	</summary>
        ///	<param name="ClasseBase">
        ///	  objeto de parametro para preenchimento da inst�ncia
        ///	</param>
        procedure PreencherObjeto(ClsBase: TClsBase);

        [CRIAR_PROPRIEDADES]

        constructor Create; override;
        destructor Destroy; override;

    end;

implementation


{ TClsBase }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'M�todos CRUD'}

function TClsBase.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao inserir ClsBase'+#13+ e.Message);
        end;
    finally
    end;
end;

function TClsBase.Alterar: boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao alterar ClsBase'+#13+ e.Message);
        end;
    finally
    end;
end;


function TClsBase.Excluir: boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao excluir ClsBase'+#13+ e.Message);
        end;
    finally
    end;

end;

function TClsBase.Consultar(parametros: TParametro): Tlista<TClsBase>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
		[CRIAR_CONSULTA]

        query := 'SELECT '+Self.ObterCamposSeparadosPorVirgula(Consulta,[]) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        Result := dao.Consultar(query,parametros);
    finally
        condicao.Free;
    end;
end;

constructor TClsBase.Create;
begin
  inherited;

end;

destructor TClsBase.Destroy;
begin

  inherited;
end;

function TClsBase.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro:TFieldFilter;
    filtro : TFilter<TClsBase>;
    //parametro : TParametro;
    //lista:TLista<TClsBase>
begin
    try
        filtro := TFilter<TClsBase>.Create;
        filtro.ScreenName := 'Filtro de ClsBase';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
		[CRIAR_INDICES_FILTRO]
        //###Criar os �ndices do filtro
		// filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descri��o');

        {$REGION 'Campo Filtro'}

        [CRIAR_CAMPOS_FILTRO]

        {$ENDREGION}

        result := filtro.Execute;
    finally
        // FreeAndNil(parametro);
        // FreeAndNil(lista);
    end;
end;

function TClsBase.Obter(parametros: TParametro): TClsBase;
var
  lista: TLista<TClsBase>;
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
            TLib.MensagemAdvertencia('Nenhum registro encontrado.', 'Aviso');
            Result := nil;
        end;
    finally
        lista.Destroy;
    end;
end;

function TClsBase.Obter(ID: string): TClsBase;
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

procedure TClsBase.PreencherObjeto(ClsBase: TClsBase);
begin
    ClsBase.CopiarPara(Self);
    FPreenchido := true;
end;


{$ENDREGION}

{$REGION 'M�todos de Propriedades'}

[CRIAR_GETSET_CORPO]

{$ENDREGION}

end.

