{*Created by @ReisCodeGenerator*}
unit Biz.CondicaoPagamentoPorCliente;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
	Framework.Interfaces.CRUD, Dal.FabricaSQL;

type
    [TReferenceTable('ZBN010')]
	TCondicaoPagamentoPorCliente = class(TClasseBase, ICRUD<TCondicaoPagamentoPorCliente>)
	private
        FFilial: string;
        FCodigoCliente: string;
        FCodigoCondicaoPagamaneto: string;
        FBloqueado: string;
        FDelete: string;
        FRecno: integer;
        procedure SetFilial(const Value: string);
        procedure SetCodigoCliente(const Value: string);
        procedure SetCodigoCondicaoPagamaneto(const Value: string);
        procedure SetBloqueado(const Value: string);
        procedure SetDelete(const Value: string);
        procedure SetRecno(const Value: integer);


    public
        class var dao: TControleDados<TLista<TCondicaoPagamentoPorCliente>,TListaDAO<TCondicaoPagamentoPorCliente>>;

        ///	<summary>
        ///	  Metodo que faz a inserção da ClasseBase
        ///	</summary>
        function Inserir: integer;
        ///	<summary>
        ///	  Metodo que faz a alteração da ClasseBase
        ///	</summary>
        function Alterar: boolean;

        ///	<summary>
        ///	  Métido que faz a Deleção da ClasseBase
        ///	</summary>
        function Excluir: boolean;

        ///	<summary>
        ///	  Método que chama a tela de filtro
        ///	</summary>
        ///	<param name="tipoOperacao">
        ///	  Tipo da operação, se é somente filtro, ou seleção de registro
        ///	</param>
        function Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter; 


        ///	<summary>
        ///	  Método que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="ID">
        ///	  Chave primária da tabela
        ///	</param>
        function Obter(ID: string): TCondicaoPagamentoPorCliente; overload;

        ///	<summary>
        ///	  Método que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Obter(parametros:TParametro): TCondicaoPagamentoPorCliente; overload;


        ///	<summary>
        ///	  Método que retonar uma lista com varios objetos de acordo com parametro passado
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Consultar(parametros:TParametro): TLista<TCondicaoPagamentoPorCliente>; overload;
        function Consultar(codigoCliente:String): TLista<TCondicaoPagamentoPorCliente>; overload;


        ///	<summary>
        ///	  Método que preenche a instância do Objeto
        ///	</summary>
        ///	<param name="ClasseBase">
        ///	  objeto de parametro para preenchimento da instância
        ///	</param>
        procedure PreencherObjeto(CondicaoPagamentoPorCliente: TCondicaoPagamentoPorCliente);

        [TPersistable(fgPersistable, 'ZBN_FILIAL')]
        [TMaxLenght(2)]
        property Filial: string read FFilial write SetFilial;

        [TPersistable(fgPersistable, 'ZBN_CLIENT')]
        [TMaxLenght(6)]
        property CodigoCliente: string read FCodigoCliente write SetCodigoCliente;

        [TPersistable(fgPersistable, 'ZBN_CONDPG')]
        [TMaxLenght(3)]
        property CodigoCondicaoPagamaneto: string read FCodigoCondicaoPagamaneto write SetCodigoCondicaoPagamaneto;

        [TPersistable(fgPersistable, 'ZBN_MSBLQL')]
        [TMaxLenght(1)]
        property Bloqueado: string read FBloqueado write SetBloqueado;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;


        constructor Create; override;
        destructor Destroy; override;

    end;

implementation


{ TCondicaoPagamentoPorCliente }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'Métodos CRUD'}

function TCondicaoPagamentoPorCliente.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao inserir CondicaoPagamentoPorCliente'+#13+ e.Message);
        end;
    finally
    end;
end;

function TCondicaoPagamentoPorCliente.Alterar: boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao alterar CondicaoPagamentoPorCliente'+#13+ e.Message);
        end;
    finally
    end;
end;


function TCondicaoPagamentoPorCliente.Excluir: boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao excluir CondicaoPagamentoPorCliente'+#13+ e.Message);
        end;
    finally
    end;

end;

function TCondicaoPagamentoPorCliente.Consultar(parametros: TParametro): Tlista<TCondicaoPagamentoPorCliente>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('ZBN_FILIAL',ccIgual, lgAnd);
        condicao.Adiciona('ZBN_CLIENT',ccIgual, lgAND);
        condicao.Adiciona('ZBN_CONDPG',ccIgual, lgAND);
        condicao.Adiciona('ZBN_MSBLQL',ccDiferente, lgAND);
        condicao.Adiciona('D_E_L_E_T_',ccIgual, lgAND);
        condicao.Adiciona('R_E_C_N_O_',ccIgual, lgAND);

        query := 'SELECT '+Self.ObterCamposSeparadosPorVirgula(Consulta,[]) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        Result := dao.Consultar(query,parametros);
    finally
        condicao.Free;
    end;
end;

function TCondicaoPagamentoPorCliente.Consultar(codigoCliente: String): TLista<TCondicaoPagamentoPorCliente>;
var
    parametros: TParametro;
begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'ZBN_FILIAL', '');
        parametros.Add('', 'ZBN_CLIENT', codigoCliente);
        parametros.Add('', 'ZBN_MSBLQL', '1');
        result := Consultar(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

constructor TCondicaoPagamentoPorCliente.Create;
begin
  inherited;

end;

destructor TCondicaoPagamentoPorCliente.Destroy;
begin

  inherited;
end;

function TCondicaoPagamentoPorCliente.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro:TFieldFilter;
    filtro : TFilter<TCondicaoPagamentoPorCliente>;
    //parametro : TParametro;
    //lista:TLista<TCondicaoPagamentoPorCliente>
begin
    try
        filtro := TFilter<TCondicaoPagamentoPorCliente>.Create;
        filtro.ScreenName := 'Filtro de CondicaoPagamentoPorCliente';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'Filial=ZBN_FILIAL', 'Filial'); 
        filtro.AddIndex(2, 'CodigoCliente=ZBN_CLIENT', 'CodigoCliente'); 
        filtro.AddIndex(3, 'CodigoCondicaoPagamaneto=ZBN_CONDPG', 'CodigoCondicaoPagamaneto'); 
        filtro.AddIndex(4, 'Bloqueado=ZBN_MSBLQL', 'Bloqueado'); 
        filtro.AddIndex(5, 'Delete=D_E_L_E_T_', 'Delete'); 
        filtro.AddIndex(6, 'Recno=R_E_C_N_O_', 'Recno'); 
        //###Criar os Índices do filtro
		// filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descrição');

        {$REGION 'Campo Filtro'}

        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Filial'; 
        campoFiltro.Name := 'Filial'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'CodigoCliente'; 
        campoFiltro.Name := 'CodigoCliente'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'CodigoCondicaoPagamaneto'; 
        campoFiltro.Name := 'CodigoCondicaoPagamaneto'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Bloqueado'; 
        campoFiltro.Name := 'Bloqueado'; 
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
 

        {$ENDREGION}

        result := filtro.Execute;
    finally
        // FreeAndNil(parametro);
        // FreeAndNil(lista);
    end;
end;

function TCondicaoPagamentoPorCliente.Obter(parametros: TParametro): TCondicaoPagamentoPorCliente;
var
  lista: TLista<TCondicaoPagamentoPorCliente>;
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

function TCondicaoPagamentoPorCliente.Obter(ID: string): TCondicaoPagamentoPorCliente;
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

procedure TCondicaoPagamentoPorCliente.PreencherObjeto(CondicaoPagamentoPorCliente: TCondicaoPagamentoPorCliente);
begin
    CondicaoPagamentoPorCliente.CopiarPara(Self);
    FPreenchido := true;
end;


{$ENDREGION}

{$REGION 'Métodos de Propriedades'}

procedure TCondicaoPagamentoPorCliente.SetFilial(const Value: string);
begin
    FFilial := Value;
end;

procedure TCondicaoPagamentoPorCliente.SetCodigoCliente(const Value: string);
begin
    FCodigoCliente := Value;
end;

procedure TCondicaoPagamentoPorCliente.SetCodigoCondicaoPagamaneto(const Value: string);
begin
    FCodigoCondicaoPagamaneto := Value;
end;

procedure TCondicaoPagamentoPorCliente.SetBloqueado(const Value: string);
begin
    FBloqueado := Value;
end;

procedure TCondicaoPagamentoPorCliente.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TCondicaoPagamentoPorCliente.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;


{$ENDREGION}

end.

