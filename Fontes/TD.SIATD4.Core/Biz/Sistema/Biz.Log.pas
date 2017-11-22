{*Created by @ReisCodeGenerator*}
unit Biz.Log;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.CondicaoConsulta,
	Framework.Interfaces.CRUD, Dal.FabricaSQL, Lib.Biblioteca, Dal.ControleDados;

type
    [TReferenceTable('SIATD_S25')]
	TLog = class(TClasseBase, ICRUD<TLog>)
	private
        FNomeComputador: string;
        FData: string;
        FHora: string;
        FUsuario: string;
        FOperacao: string;
        FRecnoRegistro: integer;
        FTabela: string;
        FCampo: string;
        FValorAntigo: string;
        FValorAtual: string;
        FRecno: integer;
        procedure SetNomeComputador(const Value: string);
        procedure SetData(const Value: string);
        procedure SetHora(const Value: string);
        procedure SetUsuario(const Value: string);
        procedure SetOperacao(const Value: string);
        procedure SetRecnoRegistro(const Value: integer);
        procedure SetTabela(const Value: string);
        procedure SetCampo(const Value: string);
        procedure SetValorAntigo(const Value: string);
        procedure SetValorAtual(const Value: string);
        procedure SetRecno(const Value: integer);



    public
        class var dao: TControleDados<TLista<TLog>,TListaDAO<TLog>>;

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
        function Obter(ID: string): TLog; overload;

        ///	<summary>
        ///	  Método que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Obter(parametros:TParametro): TLog; overload;


        ///	<summary>
        ///	  Método que retonar uma lista com varios objetos de acordo com parametro passado
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Consultar(parametros:TParametro): TLista<TLog>;


        ///	<summary>
        ///	  Método que preenche a instância do Objeto
        ///	</summary>
        ///	<param name="ClasseBase">
        ///	  objeto de parametro para preenchimento da instância
        ///	</param>
        procedure PreencherObjeto(Log: TLog);

        class procedure GravarLog(tipoManutencao: TTipoManutencao; recno: integer; tabela, campo: string; valorAntigo, valorAtual: widestring); overload; static;
        class procedure GravarLog(tipoManutencao: TTipoManutencao; recno: integer; tabela, campo: string; valor: widestring); overload; static;
        class procedure GravarLog(tipoManutencao: TTipoManutencao; recno: integer; tabela: string); overload; static;

        [TPersistable(fgPersistable, 'S25_COMPUTADOR')]
        [TMaxLenght(30)]
        property NomeComputador: string read FNomeComputador write SetNomeComputador;

        [TPersistable(fgPersistable, 'S25_DATA')]
        [TMaxLenght(8)]
        property Data: string read FData write SetData;

        [TPersistable(fgPersistable, 'S25_HORA')]
        [TMaxLenght(8)]
        property Hora: string read FHora write SetHora;

        [TPersistable(fgPersistable, 'S25_USUARIO')]
        [TMaxLenght(30)]
        property Usuario: string read FUsuario write SetUsuario;

        [TPersistable(fgPersistable, 'S25_OPERACAO')]
        [TMaxLenght(1)]
        property Operacao: string read FOperacao write SetOperacao;

        [TPersistable(fgPersistable, 'S25_RECNO')]
        property RecnoRegistro: integer read FRecnoRegistro write SetRecnoRegistro;

        [TPersistable(fgPersistable, 'S25_TABELA')]
        [TMaxLenght(20)]
        property Tabela: string read FTabela write SetTabela;

        [TPersistable(fgPersistable, 'S25_CAMPO')]
        [TMaxLenght(20)]
        property Campo: string read FCampo write SetCampo;

        [TPersistable(fgPersistable, 'S25_VALORANTIGO')]
        [TMaxLenght(255)]
        property ValorAntigo: string read FValorAntigo write SetValorAntigo;

        [TPersistable(fgPersistable, 'S25_VALORATUAL')]
        [TMaxLenght(255)]
        property ValorAtual: string read FValorAtual write SetValorAtual;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;


        constructor Create; override;
        destructor Destroy; override;

    end;

implementation


{ TLog }

uses Lib.Filter, Biz.UsuarioLogado;

{$REGION 'Métodos CRUD'}

function TLog.Inserir: integer;
var
    fabrica: TFabricaSQL;
    sql: WideString;
    parametro: TParametro;
begin
    fabrica := TFabricaSQL.Create(Self);
    try
        try
            fabrica.GerarSqlInsercao(sql, parametro);
            result := dao.Inserir(sql, parametro,Secundaria);
        except
          on e: exception do
              raise Exception.Create('Erro ao inserir Log'+#13+ e.Message);
        end;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;
end;

function TLog.Alterar: boolean;
var
    fabrica: TFabricaSQL;
    sql: WideString;
    parametro: TParametro;
begin
    fabrica := TFabricaSQL.Create(Self);
    try
        try
            fabrica.GerarSqlAlteracao(sql,parametro);
            result := dao.Alterar(sql, parametro, Secundaria);
        except
          on e: exception do
              raise Exception.Create('Erro ao alterar Log'+#13+ e.Message);
        end;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;
end;


function TLog.Excluir: boolean;
var
    fabrica: TFabricaSQL;
    sql: WideString;
    parametro: TParametro;
begin
    fabrica := TFabricaSQL.Create(Self);
    try
        try
            fabrica.GerarSqlExclusao(sql, parametro);
            Self.ObjetoParaParametros(Exclusao);
            result := dao.Excluir(sql, parametro, Secundaria);
        except
          on e: exception do
              raise Exception.Create('Erro ao excluir Log'+#13+ e.Message);
        end;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;

end;

class procedure TLog.GravarLog(tipoManutencao: TTipoManutencao; recno: integer; tabela, campo: string; valor: widestring);
begin
    TLog.GravarLog(tipoManutencao, recno,tabela, campo, EmptyStr, valor);
end;

class procedure TLog.GravarLog(tipoManutencao: TTipoManutencao; recno: integer; tabela: string);
begin
    TLog.GravarLog(tipoManutencao, recno,tabela, EmptyStr, EmptyStr, EmptyStr);
end;

function TLog.Consultar(parametros: TParametro): Tlista<TLog>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('S25_COMPUTADOR',ccIgual, lgAnd); 
        condicao.Adiciona('S25_DATA',ccIgual, lgAND); 
        condicao.Adiciona('S25_HORA',ccIgual, lgAND); 
        condicao.Adiciona('S25_USUARIO',ccIgual, lgAND); 
        condicao.Adiciona('S25_OPERACAO',ccIgual, lgAND); 
        condicao.Adiciona('S25_RECNO',ccIgual, lgAND); 
        condicao.Adiciona('S25_TABELA',ccIgual, lgAND); 
        condicao.Adiciona('S25_CAMPO',ccIgual, lgAND); 
        condicao.Adiciona('S25_VALORANTIGO',ccIgual, lgAND); 
        condicao.Adiciona('S25_VALORATUAL',ccIgual, lgAND); 
        condicao.Adiciona('R_E_C_N_O_',ccIgual, lgAND); 

        query := 'SELECT '+Self.ObterCamposSeparadosPorVirgula(Consulta,[]) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        Result := dao.Consultar(query,parametros);
    finally
        condicao.Free;
    end;
end;

constructor TLog.Create;
begin
  inherited;

end;

destructor TLog.Destroy;
begin

  inherited;
end;

function TLog.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro:TFieldFilter;
    filtro : TFilter<TLog>;
    //parametro : TParametro;
    //lista:TLista<TLog>
begin
    try
        filtro := TFilter<TLog>.Create;
        filtro.ScreenName := 'Filtro de Log';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'NomeComputador=S25_COMPUTADOR', 'NomeComputador'); 
        filtro.AddIndex(2, 'Data=S25_DATA', 'Data'); 
        filtro.AddIndex(3, 'Hora=S25_HORA', 'Hora'); 
        filtro.AddIndex(4, 'Usuario=S25_USUARIO', 'Usuario'); 
        filtro.AddIndex(5, 'Operacao=S25_OPERACAO', 'Operacao'); 
        filtro.AddIndex(6, 'RecnoRegistro=S25_RECNO', 'RecnoRegistro'); 
        filtro.AddIndex(7, 'Tabela=S25_TABELA', 'Tabela'); 
        filtro.AddIndex(8, 'Campo=S25_CAMPO', 'Campo'); 
        filtro.AddIndex(9, 'ValorAntigo=S25_VALORANTIGO', 'ValorAntigo'); 
        filtro.AddIndex(10, 'ValorAtual=S25_VALORATUAL', 'ValorAtual'); 
        filtro.AddIndex(11, 'Recno=R_E_C_N_O_', 'Recno'); 
        //###Criar os Índices do filtro
		// filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descrição');

        {$REGION 'Campo Filtro'}

        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'NomeComputador'; 
        campoFiltro.Name := 'NomeComputador'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Data'; 
        campoFiltro.Name := 'Data'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Hora'; 
        campoFiltro.Name := 'Hora'; 
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
        campoFiltro.Description := 'Operacao'; 
        campoFiltro.Name := 'Operacao'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'RecnoRegistro'; 
        campoFiltro.Name := 'RecnoRegistro'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Tabela'; 
        campoFiltro.Name := 'Tabela'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Campo'; 
        campoFiltro.Name := 'Campo'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'ValorAntigo'; 
        campoFiltro.Name := 'ValorAntigo'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'ValorAtual'; 
        campoFiltro.Name := 'ValorAtual'; 
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

function TLog.Obter(parametros: TParametro): TLog;
var
  lista: TLista<TLog>;
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

function TLog.Obter(ID: string): TLog;
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

procedure TLog.PreencherObjeto(Log: TLog);
begin
    Log.CopiarPara(Self);
    FPreenchido := true;
end;

class procedure TLog.GravarLog(tipoManutencao: TTipoManutencao; recno: integer; tabela, campo: string; valorAntigo, valorAtual: widestring);
var
    log: TLog;
begin
    try
        log := TLog.Create;
        log.NomeComputador := tlib.ObterNomeComputador;
        log.Data := tlib.ObterDataAtual;
        log.Hora := tlib.ObterHoraAtual;
        log.FUsuario := TUsuarioLogado.ObterInstancia.Login;
        log.RecnoRegistro := recno;
        log.Operacao := TConverteEnum<TTipoManutencao>.ToString(tipoManutencao);
        log.Tabela := tabela;
        log.Campo := campo;
        log.ValorAntigo := valorAntigo;
        log.ValorAtual := valorAtual;
        log.Inserir;
    finally
        if log <> nil then
            FreeAndNil(log);
    end;
end;


{$ENDREGION}

{$REGION 'Métodos de Propriedades'}

procedure TLog.SetNomeComputador(const Value: string);
begin
    FNomeComputador := Value;
end;

procedure TLog.SetData(const Value: string);
begin
    FData := Value;
end;

procedure TLog.SetHora(const Value: string);
begin
    FHora := Value;
end;

procedure TLog.SetUsuario(const Value: string);
begin
    FUsuario := Value;
end;

procedure TLog.SetOperacao(const Value: string);
begin
    FOperacao := Value;
end;

procedure TLog.SetRecnoRegistro(const Value: integer);
begin
    FRecnoRegistro := Value;
end;

procedure TLog.SetTabela(const Value: string);
begin
    FTabela := Value;
end;

procedure TLog.SetCampo(const Value: string);
begin
    FCampo := Value;
end;

procedure TLog.SetValorAntigo(const Value: string);
begin
    FValorAntigo := Value;
end;

procedure TLog.SetValorAtual(const Value: string);
begin
    FValorAtual := Value;
end;

procedure TLog.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;


{$ENDREGION}

end.

