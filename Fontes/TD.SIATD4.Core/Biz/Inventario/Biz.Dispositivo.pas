unit Biz.Dispositivo;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.Biblioteca, Biz.Filial, Lib.Lista, Lib.ResultFilter,
  Dal.ControleDados;

type
    [TReferenceTable('Z15010')]
    TDispositivo = class(TClasseBase)
    private
        FCodigoDispositivo: string;
        FDescricao: string;
        FDelet: string;
        FCodigoFilial: string;
        FCodigoUltimoUsuario: string;
        FStatus: string;
        FFilial: TFilial;
        FRecno: integer;
        procedure SetCodigoDispositivo(const Value: string);
        procedure SetCodigoFilial(const Value: string);
        procedure SetCodigoUltimoUsuario(const Value: string);
        procedure SetDelet(const Value: string);
        procedure SetDescricao(const Value: string);
        procedure SetStatus(const Value: string);
        procedure SetFilial(const Value: TFilial);

        class var dao: TControleDados<TLista<TDispositivo>, TListaDAO<TDispositivo>>;

    procedure SetRecno(const Value: integer);

    public

        ///	<summary>
        ///	  Metodo que faz a altera��o da ClasseBase
        ///	</summary>
        function Alterar: boolean;

        ///	<summary>
        ///	  M�todo que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="ID">
        ///	  Chave prim�ria da tabela
        ///	</param>
        function Obter(ID: string): TObject; overload;

        ///	<summary>
        ///	  M�todo que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Obter(parametros:TParametro): TObject; overload;

        // <summary>
        /// M�todos que retorna uma lista� de objetos de uma consulta
        /// pr�-definida pelos par�mentros passados.
        /// </summary>
        function Consultar(parametros: TParametro): TLista<TDispositivo>;



        /// <summary>
        /// Obtem todos os dispositivos livres da filial logada
        /// </summary>
        function ObterDispositivosLivresPorFilial: TLista<TDispositivo>;


        ///	<summary>
        ///	  Obtem todos dispositivos cadastados
        ///	</summary>
        function ObterTodosDispositivosPorFilial: TLista<TDispositivo>;

        ///	<summary>
        ///	  M�todo que preenche a inst�ncia do Objeto
        ///	</summary>
        ///	<param name="ClasseBase">
        ///	  objeto de parametro para preenchimento da inst�ncia
        ///	</param>
        procedure PopularObjeto(Dispositivo: TDispositivo);


        ///	<summary>
        ///	  Bloquear dispositivo instanciado
        ///	</summary>
        procedure BloquearDispositivo(iduser:string);

        ///	<summary>
        ///	  Desbloquear dispositivo instanciado
        ///	</summary>
        procedure DesbloquearDispositivo;


        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;

        [TPersistable(fgPersistable, 'Z15_FILIAL')]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        property Filial: TFilial read FFilial write SetFilial;

        [TPersistable(fgPersistable, 'Z15_DISPO')]
        property CodigoDispositivo: string read FCodigoDispositivo write SetCodigoDispositivo;

        [TPersistable(fgPersistable, 'Z15_DESCRI')]
        property Descricao: string read FDescricao write SetDescricao;

        [TPersistable(fgPersistable, 'Z15_STATUS')]
        property Status: string read FStatus write SetStatus;

        [TPersistable(fgPersistable, 'Z15_USERID')]
        property CodigoUltimoUsuario: string read FCodigoUltimoUsuario write SetCodigoUltimoUsuario;

        [TPersistable(fgUpdateable, 'D_E_L_E_T_')]
        property Delet: string read FDelet write SetDelet;

    end;

implementation

uses
  Biz.UsuarioLogado, Dal.FabricaSQL, Dal.CondicaoConsulta;

{ TDispositivo }


{$REGION 'M�todos CRUD'}


function TDispositivo.Alterar: boolean;
begin
    try
        try
            dao.Alterar(Self);
        except
            on e: exception do
                Tlib.MensagemErro('Erro ao alterar dispositivo.', e.Message);
        end;
    finally
    end;

end;


procedure TDispositivo.DesbloquearDispositivo;
begin
   self.Status := 'LIVRE';
   Self.Alterar;
end;



procedure TDispositivo.BloquearDispositivo(iduser: string);
begin
    self.CodigoUltimoUsuario := iduser;
    self.Status := 'OCUPADO';
    Self.Alterar;
end;

function TDispositivo.Consultar(parametros: TParametro): TLista<TDispositivo>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('Z15_FILIAL', ccIgual, lgAND);
        condicao.Adiciona('Z15_DISPO', ccIgual, lgAND);
        condicao.Adiciona('Z15_DESCRI', ccIgual, lgAND);
        condicao.Adiciona('Z15_STATUS', ccIgual, lgAND);
        condicao.Adiciona('Z15_USERID', ccIgual, lgAND);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAND);
        condicao.Adiciona('D_E_L_E_T_', ccIgual, lgAND);

        query :=  'SELECT '+Self.ObterCamposSeparadosPorVirgula(consulta,[])+' FROM '+Self.TabelaReferencia+' WHERE D_E_L_E_T_ = '''' '+(condicao.ToString(true));

        result := dao.Consultar(query, parametros)
    finally
        if condicao <> nil then
            FreeAndNil(condicao);
    end;


end;

function TDispositivo.Obter(parametros: TParametro): TObject;
var
    lista: TLista<TDispositivo>;
begin
    try
        lista := Self.Consultar(parametros);

        if lista.Count = 1 then
        begin
            PopularObjeto(lista[0]);
            result := Self;
        end
        else
        begin
            MessageDlg('Nenhum registro encontrado.', mtError, [mbOk], 0);
            result := nil;
        end;
    finally
        lista.Destroy;
    end;
end;

function TDispositivo.ObterDispositivosLivresPorFilial: TLista<TDispositivo>;
var
    parametro: TParametro;
begin
    try
        parametro := TParametro.Create;
        parametro.Add('', 'Z15_FILIAL', TUsuarioLogado.ObterInstancia.Filial.Filial);
        parametro.Add('', 'Z15_STATUS', 'LIVRE');
        result := Self.Consultar(parametro);
    finally
        if parametro <> nil  then
            FreeAndNil(parametro);
    end;
end;

function TDispositivo.ObterTodosDispositivosPorFilial: TLista<TDispositivo>;
var
    parametro: TParametro;
begin
    try
        parametro := TParametro.Create;
        parametro.Add('', 'Z15_FILIAL', TUsuarioLogado.ObterInstancia.Filial.Filial);
        result := Consultar(parametro)
    finally
        FreeAndNil(parametro);
    end;
end;

function TDispositivo.Obter(ID: string): TObject;
var
    parametro: TParametro;
begin
    try
        parametro := TParametro.Create;
        parametro.Add('', 'Z15_DISPO', ID);
        parametro.Add('', 'Z15_FILIAL', TUsuarioLogado.ObterInstancia.Filial.FIlial);
        result := Obter(parametro);
    finally
        FreeAndNil(parametro);
    end;
end;

{$ENDREGION}

{$REGION 'Regras de Neg�cio'}

procedure TDispositivo.PopularObjeto(Dispositivo: TDispositivo);
begin
    Self.CodigoFilial := Dispositivo.CodigoFilial;
    Self.CodigoDispositivo := Dispositivo.CodigoDispositivo;
    Self.Descricao := Dispositivo.Descricao;
    Self.Status := Dispositivo.Status;
    Self.CodigoUltimoUsuario := Dispositivo.CodigoUltimoUsuario;
    Self.Delet := Dispositivo.Delet;
    self.Recno := Dispositivo.Recno;

end;

{$ENDREGION}

{$REGION 'M�todos de Propriedades'}

procedure TDispositivo.SetCodigoDispositivo(const Value: string);
begin
    FCodigoDispositivo := Value;
end;

procedure TDispositivo.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TDispositivo.SetCodigoUltimoUsuario(const Value: string);
begin
    FCodigoUltimoUsuario := Value;
end;

procedure TDispositivo.SetDelet(const Value: string);
begin
    FDelet := Value;
end;

procedure TDispositivo.SetDescricao(const Value: string);
begin
    FDescricao := Value;
end;

procedure TDispositivo.SetFilial(const Value: TFilial);
begin
    FFilial := Value;
end;

procedure TDispositivo.SetRecno(const Value: integer);
begin
  FRecno := Value;
end;

procedure TDispositivo.SetStatus(const Value: string);
begin
    FStatus := Value;
end;

{$ENDREGION}

end.
