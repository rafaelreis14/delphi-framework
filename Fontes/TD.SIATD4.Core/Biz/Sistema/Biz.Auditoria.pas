{*Created by @ReisCodeGenerator*}
unit Biz.Auditoria;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
	Framework.Interfaces.CRUD, Dal.FabricaSQL;

type
    [TReferenceTable('SIATD_S21')]
	TAuditoria = class(TClasseBase, ICRUD<TAuditoria>)
	private
        FCodigoEmpresa: string;
        FCodigoFilial: string;
        FID: string;
        FData: string;
        FHora: string;
        FNivel: string;
        FTipoEvento: string;
        FTipoLog: string;
        FMensagem: string;
        FComputador: string;
        FUsuario: string;
        FSistema: string;
        FDelet: string;
        FRecno: integer;
        procedure SetCodigoEmpresa(const Value: string);
        procedure SetCodigoFilial(const Value: string);
        procedure SetID(const Value: string);
        procedure SetData(const Value: string);
        procedure SetHora(const Value: string);
        procedure SetNivel(const Value: string);
        procedure SetTipoEvento(const Value: string);
        procedure SetTipoLog(const Value: string);
        procedure SetMensagem(const Value: string);
        procedure SetComputador(const Value: string);
        procedure SetUsuario(const Value: string);
        procedure SetSistema(const Value: string);
        procedure SetDelet(const Value: string);
        procedure SetRecno(const Value: integer);



    public
        class var dao: TControleDados<TLista<TAuditoria>,TListaDAO<TAuditoria>>;

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
        function Obter(ID: string): TAuditoria; overload;

        ///	<summary>
        ///	  M�todo que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Obter(parametros:TParametro): TAuditoria; overload;


        ///	<summary>
        ///	  M�todo que retonar uma lista com varios objetos de acordo com parametro passado
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Consultar(parametros:TParametro): TLista<TAuditoria>;


        ///	<summary>
        ///	  M�todo que preenche a inst�ncia do Objeto
        ///	</summary>
        ///	<param name="ClasseBase">
        ///	  objeto de parametro para preenchimento da inst�ncia
        ///	</param>
        procedure PreencherObjeto(Auditoria: TAuditoria);

        class procedure GravarPadrao(id, nivel, tipoEvento, tipoLog, usuario: string; mensagem: widestring); static;
        class procedure GravarAutorizacao(id, tipoAutorizacao, formulario: string; outrasInformacoes: widestring; usuario: string = ''); static;
        class procedure GravarTrace(id, formulario: string; texto: widestring); static;
        class procedure GravarProcesso(formulario: string; texto: widestring); static;




        [TPersistable(fgPersistable, 'S21_S12_EMP')]
        [TMaxLenght(2)]
        property CodigoEmpresa: string read FCodigoEmpresa write SetCodigoEmpresa;

        [TPersistable(fgPersistable, 'S21_S13_FILIAL')]
        [TMaxLenght(2)]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgPersistable, 'S21_ID')]
        [TMaxLenght(30)]
        property ID: string read FID write SetID;

        [TPersistable(fgPersistable, 'S21_DATA')]
        [TMaxLenght(8)]
        property Data: string read FData write SetData;

        [TPersistable(fgPersistable, 'S21_HORA')]
        [TMaxLenght(8)]
        property Hora: string read FHora write SetHora;

        [TPersistable(fgPersistable, 'S21_NIVEL')]
        [TMaxLenght(30)]
        property Nivel: string read FNivel write SetNivel;

        [TPersistable(fgPersistable, 'S21_TIPO_EVENTO')]
        [TMaxLenght(30)]
        property TipoEvento: string read FTipoEvento write SetTipoEvento;

        [TPersistable(fgPersistable, 'S21_TIPO_LOG')]
        [TMaxLenght(30)]
        property TipoLog: string read FTipoLog write SetTipoLog;

        [TPersistable(fgPersistable, 'S21_MENSAGEM')]
        property Mensagem: string read FMensagem write SetMensagem;

        [TPersistable(fgPersistable, 'S21_COMPUTADOR')]
        [TMaxLenght(30)]
        property Computador: string read FComputador write SetComputador;

        [TPersistable(fgPersistable, 'S21_USUARIO')]
        [TMaxLenght(30)]
        property Usuario: string read FUsuario write SetUsuario;

        [TPersistable(fgPersistable, 'S21_SISTEMA')]
        [TMaxLenght(30)]
        property Sistema: string read FSistema write SetSistema;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delet: string read FDelet write SetDelet;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;


        constructor Create; override;
        destructor Destroy; override;

    end;

implementation


{ TAuditoria }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'M�todos CRUD'}

function TAuditoria.Inserir: integer;
var
    fabrica: TFabricaSQL;
    sql: WideString;
    parametro: TParametro;
begin
    fabrica := TFabricaSQL.Create(Self);
    try
        try
            fabrica.GerarSqlInsercao(sql, parametro);
            result := dao.Inserir(sql, parametro, Secundaria);
        except
          on e: exception do
              raise Exception.Create('Erro ao inserir Auditoria'+#13+ e.Message);
        end;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;
end;

function TAuditoria.Alterar: boolean;
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
              raise Exception.Create('Erro ao alterar Auditoria'+#13+ e.Message);
        end;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;
end;


function TAuditoria.Excluir: boolean;
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
              raise Exception.Create('Erro ao excluir Auditoria'+#13+ e.Message);
        end;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;

end;

function TAuditoria.Consultar(parametros: TParametro): Tlista<TAuditoria>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('S21_S12_EMP',ccIgual, lgAnd); 
        condicao.Adiciona('S21_S13_FILIAL',ccIgual, lgAND); 
        condicao.Adiciona('S21_ID',ccIgual, lgAND); 
        condicao.Adiciona('S21_DATA',ccIgual, lgAND); 
        condicao.Adiciona('S21_HORA',ccIgual, lgAND); 
        condicao.Adiciona('S21_NIVEL',ccIgual, lgAND); 
        condicao.Adiciona('S21_TIPO_EVENTO',ccIgual, lgAND); 
        condicao.Adiciona('S21_TIPO_Auditoria',ccIgual, lgAND);
        condicao.Adiciona('S21_MENSAGEM',ccIgual, lgAND); 
        condicao.Adiciona('S21_COMPUTADOR',ccIgual, lgAND); 
        condicao.Adiciona('S21_USUARIO',ccIgual, lgAND); 
        condicao.Adiciona('S21_SISTEMA',ccIgual, lgAND); 
        condicao.Adiciona('D_E_L_E_T_',ccIgual, lgAND); 
        condicao.Adiciona('R_E_C_N_O_',ccIgual, lgAND); 

        query := 'SELECT '+Self.ObterCamposSeparadosPorVirgula(Consulta,[]) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        Result := dao.Consultar(query,parametros);
    finally
        condicao.Free;
    end;
end;

constructor TAuditoria.Create;
begin
  inherited;

end;

destructor TAuditoria.Destroy;
begin

  inherited;
end;

function TAuditoria.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro:TFieldFilter;
    filtro : TFilter<TAuditoria>;
    //parametro : TParametro;
    //lista:TLista<TAuditoria>
begin
    try
        filtro := TFilter<TAuditoria>.Create;
        filtro.ScreenName := 'Filtro de Auditoria';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'CodigoEmpresa=S21_S12_EMP', 'CodigoEmpresa'); 
        filtro.AddIndex(2, 'CodigoFilial=S21_S13_FILIAL', 'CodigoFilial'); 
        filtro.AddIndex(3, 'ID=S21_ID', 'ID'); 
        filtro.AddIndex(4, 'Data=S21_DATA', 'Data'); 
        filtro.AddIndex(5, 'Hora=S21_HORA', 'Hora'); 
        filtro.AddIndex(6, 'Nivel=S21_NIVEL', 'Nivel'); 
        filtro.AddIndex(7, 'TipoEvento=S21_TIPO_EVENTO', 'TipoEvento'); 
        filtro.AddIndex(8, 'TipoLog=S21_TIPO_Auditoria', 'TipoLog');
        filtro.AddIndex(9, 'Mensagem=S21_MENSAGEM', 'Mensagem'); 
        filtro.AddIndex(10, 'Computador=S21_COMPUTADOR', 'Computador'); 
        filtro.AddIndex(11, 'Usuario=S21_USUARIO', 'Usuario'); 
        filtro.AddIndex(12, 'Sistema=S21_SISTEMA', 'Sistema'); 
        filtro.AddIndex(13, 'Delet=D_E_L_E_T_', 'Delet'); 
        filtro.AddIndex(14, 'Recno=R_E_C_N_O_', 'Recno'); 
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
        campoFiltro.Description := 'ID'; 
        campoFiltro.Name := 'ID'; 
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
        campoFiltro.Description := 'Nivel'; 
        campoFiltro.Name := 'Nivel'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'TipoEvento'; 
        campoFiltro.Name := 'TipoEvento'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'TipoLog';
        campoFiltro.Name := 'TipoLog';
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Mensagem'; 
        campoFiltro.Name := 'Mensagem'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Computador'; 
        campoFiltro.Name := 'Computador'; 
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
        campoFiltro.Description := 'Sistema'; 
        campoFiltro.Name := 'Sistema'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Delet'; 
        campoFiltro.Name := 'Delet'; 
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

function TAuditoria.Obter(parametros: TParametro): TAuditoria;
var
  lista: TLista<TAuditoria>;
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

function TAuditoria.Obter(ID: string): TAuditoria;
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

procedure TAuditoria.PreencherObjeto(Auditoria: TAuditoria);
begin
    Auditoria.CopiarPara(Self);
    FPreenchido := true;
end;


class procedure TAuditoria.GravarAutorizacao(id, tipoAutorizacao, formulario: string; outrasInformacoes: widestring; usuario: string);
begin
    TAuditoria.GravarPadrao(id, tipoAutorizacao, formulario,'AUTORIZACAO',usuario, outrasInformacoes);
end;

class procedure TAuditoria.GravarPadrao(id, nivel, tipoEvento, tipoLog, usuario: string; mensagem: widestring);
var
    Auditoria: TAuditoria;
begin
    try
        try
            Auditoria := TAuditoria.Create;
            Auditoria.CodigoEmpresa :=  TUsuarioLogado.ObterInstancia.Filial.Empresa;
            Auditoria.CodigoFilial := TUsuarioLogado.ObterInstancia.Filial.Filial;
            Auditoria.ID := id;
            Auditoria.Data := Tlib.ObterDataAtual;
            Auditoria.Hora := Tlib.ObterHoraAtual('hh:mm:ss');
            Auditoria.Nivel := nivel;
            Auditoria.TipoEvento := tipoEvento;
            Auditoria.TipoLog := tipoLog;
            Auditoria.Mensagem := mensagem;
            Auditoria.Computador := Tlib.ObterNomeComputador;
            Auditoria.Sistema := Tlib.IfTernario(Tlib.mobile, 'SIATD4 MOBILE', 'SIATD4 DESKTOP');
            Auditoria.Usuario := Tlib.IfTernario(usuario = EmptyStr, TUsuarioLogado.ObterInstancia.Login, usuario);
            Auditoria.Inserir;
        except
            on E: Exception do
                raise Exception.Create(E.Message);
        end;
    finally

        if Auditoria <> nil then
            FreeAndNil(Auditoria);

    end;
end;


class procedure TAuditoria.GravarProcesso(formulario: string; texto: widestring);
begin
    TAuditoria.GravarPadrao('', '', formulario,'PROCESSO','',texto);

end;

class procedure TAuditoria.GravarTrace(id, formulario: string; texto: widestring);
begin
    TAuditoria.GravarPadrao(id, '', formulario,'TRACE','',texto);
end;

{$ENDREGION}

{$REGION 'M�todos de Propriedades'}

procedure TAuditoria.SetCodigoEmpresa(const Value: string);
begin
    FCodigoEmpresa := Value;
end;

procedure TAuditoria.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TAuditoria.SetID(const Value: string);
begin
    FID := Value;
end;

procedure TAuditoria.SetData(const Value: string);
begin
    FData := Value;
end;

procedure TAuditoria.SetHora(const Value: string);
begin
    FHora := Value;
end;

procedure TAuditoria.SetNivel(const Value: string);
begin
    FNivel := Value;
end;

procedure TAuditoria.SetTipoEvento(const Value: string);
begin
    FTipoEvento := Value;
end;

procedure TAuditoria.SetTipoLog(const Value: string);
begin
    FTipoLog := Value;
end;

procedure TAuditoria.SetMensagem(const Value: string);
begin
    FMensagem := Value;
end;

procedure TAuditoria.SetComputador(const Value: string);
begin
    FComputador := Value;
end;

procedure TAuditoria.SetUsuario(const Value: string);
begin
    FUsuario := Value;
end;

procedure TAuditoria.SetSistema(const Value: string);
begin
    FSistema := Value;
end;

procedure TAuditoria.SetDelet(const Value: string);
begin
    FDelet := Value;
end;

procedure TAuditoria.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;


{$ENDREGION}

end.



