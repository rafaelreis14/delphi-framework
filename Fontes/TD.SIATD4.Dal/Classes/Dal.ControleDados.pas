unit Dal.ControleDados;

interface

uses Db, DbCommon, Generics.Collections, DBClient,
    Data.Win.ADODB, Lib.Parametro,Lib.Lista, Xml.XMLIntf, Xml.XMLDoc,
    System.Classes, System.Rtti, Lib.ClasseBase, DBConnect_TLB;

type
    TConexao = (Principal, Secundaria, Terciaria);

    // padr�o singleton, somente ser� instanciado uma vez
    TDataControl = class abstract
    strict private
        class var FDataControl: IDataControl;
    public
        class function ObterInstancia: IDataControl;
    end;

    TDAO<T> = class abstract
    protected
        NomeTabela: string;
        function ConsultarBase(sql: string; Parametro: TParametro; conexao: TConexao): WideString;
    public
        function ConverterParametro(Parametro: TParametro): _Parameters;
        function Consultar(sql: string; Parametro: TParametro; conexao: TConexao): T; virtual; abstract;
        function SalvarMudancas(lista:T):boolean; virtual; abstract;

    end;

    TXmlDAO = class(TDAO<TXMLDocument>)
    public
        function Consultar(sql: string; Parametro: TParametro; conexao: TConexao): TXMLDocument; override;
    end;

    TDataSetDAO = class(TDAO<TClientDataSet>)
    private
        function XmlToDataset(Xml: WideString): TClientDataSet;
    public
        function Consultar(sql: string; Parametro: TParametro; conexao: TConexao): TClientDataSet; override;
    end;

    TListaDAO<T: class> = class(TDAO<TLista<T>>)
    private
        function RetornaPropriedade(typ: TRttiType; campo: string): TRttiProperty;
        function XmlToObject(Xml: WideString): TLista<T>;

    public
        function Consultar(sql: string; Parametro: TParametro; conexao: TConexao): TLista<T>; override;
        function SalvarMudancas(lista: TLista<T>):boolean; override;
        constructor Create();
    end;

    TControleDados<T:class; A: TDAO<T>, constructor> = class
    private

    public
        function Consultar(sql: string; Parametro: TParametro; conexao: TConexao): T; overload;
        function Consultar(sql: string; Parametro: TParametro): T; overload;

        function Inserir(sql: string; Parametro: TParametro; conexao: TConexao): integer; overload;
        function Inserir(sql: string; Parametro: TParametro): integer; overload;
        function Inserir(classeBase: TClasseBase; conexao: TConexao): integer; overload;
        function Inserir(classeBase: TClasseBase): integer; overload;

        function Alterar(sql: string; Parametro: TParametro; conexao: TConexao): boolean; overload;
        function Alterar(sql: string; Parametro: TParametro): boolean; overload;
        function Alterar(classeBase: TClasseBase; conexao: TConexao): boolean; overload;
        function Alterar(classeBase: TClasseBase): boolean; overload;

        function Excluir(sql: string; Parametro: TParametro; conexao: TConexao): boolean; overload;
        function Excluir(sql: string; Parametro: TParametro): boolean; overload;
        function Excluir(classeBase: TClasseBase; conexao: TConexao; definitivo: boolean = false):boolean; overload;
        function Excluir(classeBase: TClasseBase; definitivo: boolean = false):boolean; overload;

        function ExecutarProc(nome: string; Parametro: TParametro; conexao: TConexao): TParametro; overload;
        function ExecutarProc(nome: string; Parametro: TParametro): TParametro; overload;

        function IniciarTransacao(nomeTransancao: string; conexao: TConexao; nivelIsolamento: TIsolationLevel = ilReadUncommitted): boolean; overload;
        function IniciarTransacao(nomeTransancao: string): boolean; overload;
        function IniciarTransacao: boolean; overload;

        function ConfirmarTransacao(nomeTransancao: string; conexao: TConexao): boolean; overload;
        function ConfirmarTransacao(nomeTransacao:string): boolean; overload;
        function ConfirmarTransacao: boolean; overload;

        function ReverterTransacao(nomeTransancao: string; conexao: TConexao): boolean; overload;
        function ReverterTransacao(nomeTransancao: string): boolean; overload;
        function ReverterTransacao: boolean; overload;

        function SalvarMudancas(lista: T; conexao: TConexao):boolean; overload;
        function SalvarMudancas(lista: T):boolean; overload;

        procedure Conectar;
        procedure Desconectar;
    end;

implementation

uses
    System.SysUtils, Vcl.Forms, Lib.Erro, Lib.Biblioteca, Lib.Enumeradores, Lib.Persistable, Framework.Interfaces.CRUD,
  Vcl.Dialogs, Dal.FabricaSQL, Biz.Log, Biz.UsuarioLogado,
  Biz.ParametroSistema;

{ TXmlDAO }

function TXmlDAO.Consultar(sql: string; Parametro: TParametro; conexao: TConexao): TXMLDocument;
var
    XMLDocument: TXMLDocument;
    resultado: string;
begin
    try
        resultado := ConsultarBase(sql, Parametro, conexao);
        XMLDocument := TXMLDocument.Create(Application);
        XMLDocument.Xml.Text := resultado;
        XMLDocument.Active := True;

        result := XMLDocument;
    except
        XMLDocument.Free;
        result := nil;
    end;
end;

{ TDataSetDAO }

function TDataSetDAO.Consultar(sql: string; Parametro: TParametro; conexao: TConexao): TClientDataSet;
var
    resultado: string;
begin
    try
        resultado := ConsultarBase(sql, Parametro, conexao);
        result := XmlToDataset(resultado);
    except
        raise;
        result := nil;
    end;
end;

function TDataSetDAO.XmlToDataset(Xml: WideString): TClientDataSet;
    function TipoDados(pTipo: String): Tfieldtype;
    begin
        if pTipo = 'Memo' then
            result := ftMemo
        else if pTipo = 'Bigint' then
            result := ftLargeint
        else if pTipo = 'BCD' then
            result := ftBCD
        else if pTipo = 'WideString' then
            result := ftWideString
        else if pTipo = 'String' then
            result := ftString
        else if pTipo = 'Numeric' then
            result := ftFMTBcd
        else if pTipo = 'Integer' then
            result := ftInteger
        else if pTipo = 'Money' then
            result := ftCurrency
        else if pTipo = 'Date' then
            result := ftDate
        else if pTipo = 'TIMESTAMP' then
            result := ftDateTime
        else if pTipo = 'AUTOINC' then
            result := ftInteger
        else if pTipo = 'Date' then
            result := ftTimeStamp
        else if pTipo = 'Word' then
            result := ftWord
        else if pTipo = 'Boolean' then
            result := ftBoolean
        else if pTipo = 'Time' then
            result := ftTime
        else if pTipo = 'Bytes' then
            result := ftBytes
        else if pTipo = 'SmallInt' then
            result := ftSmallint
        else if pTipo = 'BLOB' then
            result := ftBlob;
    end;

var
    XMLDocument: TXMLDocument;
    NoRetorno: IXMLNode;
    NoMetadados: IXMLNode;
    NoDataSet: IXMLNode;
    NoCampo: IXMLNode;
    NoDados: IXMLNode;
    NoLinha: IXMLNode;
    NoColuna: IXMLNode;
    iCont, iCont2, iCont3: integer;
    CDSResultado: TClientDataSet;
    cRetorno: string;
    Field: TField;
    iContLinhas: integer;
    vTipoDado: Tfieldtype;
    iTamanho: integer;
begin
    try
        try
            CDSResultado := TClientDataSet.Create(Application);
            XMLDocument := TXMLDocument.Create(Application);
            XMLDocument.Xml.Text := Xml;
            XMLDocument.Active := True;
            //
            NoRetorno := XMLDocument.ChildNodes.Nodes['Retorno'];
            //
            NoDataSet := NoRetorno.ChildNodes.Nodes['DataSet'];
            //
            NoMetadados := NoDataSet.ChildNodes.Nodes['Metadados'];
            for iCont := 0 to NoMetadados.ChildNodes.Count - 1 do
            begin
                NoCampo := NoMetadados.ChildNodes[iCont];
                //
                if (NoCampo.NodeName = 'Campo') and (NoCampo.Attributes['Nome'] = 'Padrao') then
                begin
                    NoDados := NoDataSet.ChildNodes.Nodes['Dados'];
                    NoLinha := NoDados.ChildNodes.Nodes[0];
                    raise Erro.Create(NoLinha.ChildNodes.Nodes[iCont2].Attributes['Valor']);
                end;
                //
                vTipoDado := TipoDados(NoCampo.Attributes['TipoDado']);
                iTamanho := StrToInt(NoCampo.Attributes['Tamanho']);
                //
                CDSResultado.FieldDefs.Add(NoCampo.Attributes['Nome'], vTipoDado, iTamanho);
            end;
            CDSResultado.CreateDataSet;
            //
            iContLinhas := 0;
            NoDados := NoDataSet.ChildNodes.Nodes['Dados'];
            for iCont := 0 to NoDados.ChildNodes.Count - 1 do
            // percorrendo as linhas
            begin
                inc(iContLinhas);
                CDSResultado.Append();
                NoLinha := NoDados.ChildNodes.Nodes[iCont];
                for iCont2 := 0 to NoLinha.ChildNodes.Count - 1 do
                // percorrendo as colunas das linhas
                begin
                    CDSResultado.FieldList.Fields[iCont2].AsString := NoLinha.ChildNodes.Nodes[iCont2].Attributes['Valor'];
                end;
                CDSResultado.Post;
            end;
            Application.ProcessMessages;
            CDSResultado.First;
            result := CDSResultado;
            Application.ProcessMessages;
        except
            on E: Exception do
                raise Erro.Create('Erro ao converter o XML em dataSet' + #13 + 'Mensagem interna: ' + E.Message);
        end;
    finally
        FreeAndNil(XMLDocument);
    end;
end;

{ TDAO<T> }

function TDAO<T>.ConsultarBase(sql: string; Parametro: TParametro; conexao: TConexao): WideString;
var
    resultado: WideString;
begin
    if Parametro <> nil then
        result := TDataControl.ObterInstancia.Query(sql, ConverterParametro(Parametro), ConnectionType(conexao))
    else
        result := TDataControl.ObterInstancia.Query(sql, nil, ConnectionType(conexao));

end;

function TDAO<T>.ConverterParametro(Parametro: TParametro): _Parameters;
var
    param: IParameter;
    itemParametro: TItemParametro;
begin
    param := CoParameters.Create() as IParameter;
    for itemParametro in Parametro.Item do
    begin
        if itemParametro.Valor = '' then
            param.Add(itemParametro.Chave, ' ', '', '')
        else
            param.Add(itemParametro.Chave, itemParametro.Valor, '', '');
    end;
    result := (param as _Parameters);
end;

{ TControleDados<T, A> }

function TControleDados<T, A>.Alterar(sql: string; Parametro: TParametro; conexao: TConexao): boolean;
var
    cd: A;
begin
    cd := A.Create;
    try
        try
            if sql <> EmptyStr then
            begin
                if Parametro <> nil then
                    result := TDataControl.ObterInstancia.Update(sql, cd.ConverterParametro(Parametro), ConnectionType(conexao))
                else
                    result := TDataControl.ObterInstancia.Update(sql, nil, ConnectionType(conexao))
            end
        except on E: Exception do
            begin
                result := false;
                raise Exception.Create('Erro ao executar a altera��o de dados.'+#13+E.Message);
            end;
        end;
    finally
        cd.Free;
    end;
end;

function TControleDados<T, A>.ConfirmarTransacao(nomeTransancao: string; conexao: TConexao): boolean;
var
    Parametro: IParameter;
begin
    try
        Parametro := CoParameters.Create() as IParameter;
        Parametro.Add('COMMIT', nomeTransancao, '', '');
        result := TDataControl.ObterInstancia.Commit((Parametro as _Parameters), ConnectionType(conexao));
    finally
    end;
end;

function TControleDados<T, A>.Alterar(classeBase: TClasseBase; conexao: TConexao): boolean;
var
    fabrica: TFabricaSQL;
    sql: WideString;
    parametro: TParametro;
    item: TPropriedadeAlterada;
    campoReferencia: string;
begin
    fabrica := TFabricaSQL.Create(classeBase);
    try
            fabrica.GerarSqlAlteracao(sql,parametro);
            result := Self.Alterar(sql, parametro, conexao);

            for item in classeBase.PropriedadesAlteradas do
            begin
                if classeBase.VeririficarPropriedadeAlterada(item.NomePropriedade,classeBase.ObterValorPorNomePropriedade(item.NomePropriedade)) then
                begin
                    campoReferencia := classeBase.ObterCampoReferencia(item.NomePropriedade);

                    if campoReferencia <> EmptyStr then
                    begin
                        if TParametroSistema.ObterParametroSistema('GRAVALOG') <> 'NAO' then
                        begin
                            TLog.GravarLog(Alteracao,
                                           StrToInt(classeBase.ObterValorPorNomePropriedade('Recno')),
                                           classeBase.TabelaReferencia,
                                           campoReferencia,
                                           item.ValorAntigo,
                                           classeBase.ObterValorPorNomePropriedade(item.NomePropriedade));
                        end;
                    end;
                end;
            end;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;

end;

function TControleDados<T, A>.Alterar(sql: string; Parametro: TParametro): boolean;
begin
    result := Self.Alterar(sql,Parametro,TConexao.Principal);
end;

function TControleDados<T, A>.Alterar(classeBase: TClasseBase): boolean;
begin
    result := Self.Alterar(classeBase,TConexao.Principal);
end;

procedure TControleDados<T, A>.Conectar;
begin
    TDataControl.ObterInstancia.Connect(TLib.ObterNomeSistema+' '+Tlib.ObterVersao, TLib.ObterNomeComputador, TUsuarioLogado.ObterInstancia.ModuloLogado.Modulo, TUsuarioLogado.ObterInstancia.Filial.Filial, TUsuarioLogado.ObterInstancia.Login);
end;

function TControleDados<T, A>.ConfirmarTransacao: boolean;
begin
    result := ConfirmarTransacao('DEFAULSERVTR');
end;

function TControleDados<T, A>.Consultar(sql: string; Parametro: TParametro): T;
begin
    result := Self.Consultar(sql, Parametro, TConexao.Principal);
end;

procedure TControleDados<T, A>.Desconectar;
begin
    TDataControl.ObterInstancia.Disconnect;
end;

function TControleDados<T, A>.ConfirmarTransacao(nomeTransacao: string): boolean;
begin
    result := ConfirmarTransacao(nomeTransacao, TConexao.Principal);
end;

function TControleDados<T, A>.Consultar(sql: string; Parametro: TParametro; conexao: TConexao): T;
var
    cd: A;
begin
    cd := A.Create;
    try
        result := cd.Consultar(sql, Parametro, conexao);
    finally
        cd.Free;
    end;
end;

function TControleDados<T, A>.Excluir(sql: string; Parametro: TParametro; conexao: TConexao): boolean;
var
    cd: A;
begin
    cd := A.Create;
    try
        try
            if Parametro <> nil then
                result := TDataControl.ObterInstancia.Delete(sql, cd.ConverterParametro(Parametro), ConnectionType(conexao))
            else
                result := TDataControl.ObterInstancia.Delete(sql, nil, ConnectionType(conexao))
        except on E: Exception do
            begin
                result := false;
                raise Exception.Create('Erro ao executar a exclus�o de dados.'+#13+E.Message);
            end;
        end;
    finally
        cd.Free;
    end;
end;

function TControleDados<T, A>.Excluir(classeBase: TClasseBase; conexao: TConexao; definitivo: boolean = false): boolean;
var
    fabrica: TFabricaSQL;
    sql: WideString;
    parametro: TParametro;
    item: TItemParametro;
begin
    fabrica := TFabricaSQL.Create(classeBase);
    try
            fabrica.GerarSqlExclusao(sql,parametro, definitivo);
            result := Self.Excluir(sql, parametro, conexao);

            if TParametroSistema.ObterParametroSistema('GRAVALOG') <> 'NAO' then
            begin
                TLog.GravarLog(Exclusao,
                               StrToInt(classeBase.ObterValorPorNomePropriedade('Recno')),
                               classeBase.TabelaReferencia);
            end;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;

end;

function TControleDados<T, A>.Excluir(sql: string; Parametro: TParametro): boolean;
begin
    result := Self.Excluir(sql, Parametro, TConexao.Principal);
end;

function TControleDados<T, A>.Excluir(classeBase: TClasseBase; definitivo: boolean = false): boolean;
begin
    result := Self.Excluir(classeBase, TConexao.Principal, definitivo);
end;

function TControleDados<T, A>.ExecutarProc(nome: string; Parametro: TParametro): TParametro;
begin
    result := Self.ExecutarProc(nome, Parametro, TConexao.Principal);
end;

function TControleDados<T, A>.ExecutarProc(nome: string; Parametro: TParametro; conexao: TConexao): TParametro;
var
    cd: A;
    retorno: TParametro;
    retornoProc: WideString;

    parte: TStringList;
    itemRetorno: WideString;
begin
    cd := A.Create;
    Parametro := TParametro.Create;
    try
        try
            if Parametro <> nil then
            begin

                retornoProc := TDataControl.ObterInstancia.StoredProcedure(nome, cd.ConverterParametro(Parametro), ConnectionType(conexao));

                ExtractStrings([';'], [], PChar(retornoProc), parte);

                for itemRetorno in parte do
                    retorno.Add('', '', TLib.ObterPorParametro(TLib.ObterPorParametro(itemRetorno, '1', ';'), '1', '|'),
                      TLib.ObterPorParametro(TLib.ObterPorParametro(itemRetorno, '1', ';'), '2', '|'));

                result := retorno;
            end;
        except
            if Parametro <> nil then
                Parametro.Free;
        end;
    finally
        cd.Free;
    end;
end;

function TControleDados<T, A>.IniciarTransacao(nomeTransancao: string; conexao: TConexao; nivelIsolamento: TIsolationLevel): boolean;
var
    Parametro: IParameter;
    nivel: string;
begin
    try
        Parametro := CoParameters.Create() as IParameter;
        Parametro.Add('BEGINTRANS', nomeTransancao, '', '');
        nivel := TConverteEnum<TIsolationLevel>.ToString(nivelIsolamento);
        Parametro.Add('NIVELISOLAMENTO', nivel, '', '');
        result := TDataControl.ObterInstancia.StartTransaction((Parametro as _Parameters), ConnectionType(conexao));
    finally
    end;

end;

function TControleDados<T, A>.IniciarTransacao: boolean;
begin
    result := IniciarTransacao('DEFAULSERVTR');
end;

function TControleDados<T, A>.Inserir(classeBase: TClasseBase; conexao: TConexao): integer;
var
    fabrica: TFabricaSQL;
    sql: WideString;
    parametro: TParametro;
    item: TItemParametro;
    recno: integer;
begin
    fabrica := TFabricaSQL.Create(classeBase);
    try
        fabrica.GerarSqlInsercao(sql,parametro);
        recno := Self.Inserir(sql, parametro, conexao);

        if TParametroSistema.ObterParametroSistema('GRAVALOG') <> 'NAO' then
        begin
            for item in parametro.Item do
                TLog.GravarLog(Insercao,recno,classeBase.TabelaReferencia,item.Chave,item.Valor);
        end;

        result := recno;
    finally
        if parametro <> nil then
            FreeAndNil(parametro);
    end;

end;

function TControleDados<T, A>.Inserir(sql: string; Parametro: TParametro; conexao: TConexao): integer;
var
    cd: A;
begin
    cd := A.Create;
    try
        try
            if Parametro <> nil then
                result := TDataControl.ObterInstancia.Insert(sql, cd.ConverterParametro(Parametro), ConnectionType(conexao))
            else
                result := TDataControl.ObterInstancia.Insert(sql, nil, ConnectionType(conexao))

        except on E: Exception do
            begin
                result := 0;
                raise Exception.Create('Erro ao executar a inser��o de dados.'+#13+E.Message);
            end;
        end;
    finally
        cd.Free;
    end;
end;

function TControleDados<T, A>.ReverterTransacao: boolean;
begin
    result := ReverterTransacao('DEFAULSERVTR');
end;


function TControleDados<T, A>.ReverterTransacao(nomeTransancao: string): boolean;
begin
    result := ReverterTransacao(nomeTransancao, TConexao.Principal);
end;

function TControleDados<T, A>.SalvarMudancas(lista: T): boolean;
begin
    result := Self.SalvarMudancas(lista, TConexao.Principal);
end;

function TControleDados<T, A>.SalvarMudancas(lista: T; conexao: TConexao): boolean;
var
    cd: A;
begin
    result := false;
    cd := A.Create;
    try
        try
            Self.IniciarTransacao('SALAVARMUDANCAS', conexao);
            cd.SalvarMudancas(lista);
            Self.ConfirmarTransacao('SALAVARMUDANCAS', conexao);
            result := true;
        except
            on E: Exception do
            begin
                Self.ReverterTransacao('SALAVARMUDANCAS', conexao);
                raise Exception.Create('Erro ao salvar mudan�as'+#13+e.Message);
            end;
        end;
    finally
        cd.Free;
    end;

end;

function TControleDados<T, A>.ReverterTransacao(nomeTransancao: string; conexao: TConexao): boolean;
var
    Parametro: IParameter;
begin
    try
        Parametro := CoParameters.Create() as IParameter;
        Parametro.Add('ROLLBACK', nomeTransancao, '', '');
        result := TDataControl.ObterInstancia.Rollback((Parametro as _Parameters), ConnectionType(conexao));
    finally
    end;
end;

{ TListaDAO }

function TListaDAO<T>.Consultar(sql: string; Parametro: TParametro; conexao: TConexao): TLista<T>;
var
    resultado: string;
    item: T;
begin
    try
        resultado := ConsultarBase(sql, Parametro, conexao);
        result := XmlToObject(resultado);

        for item in result do
        begin

            resultado := TClasseBase(item).ClassName;
            TClasseBase(item).TipoManutencao := Consulta;
            TClasseBase(item).PreencherValoresPropriedadesAlteradas;
        end;
    except
        raise;
        result := nil;
    end;
end;

constructor TListaDAO<T>.Create;
begin
    inherited Create();
end;

function TListaDAO<T>.RetornaPropriedade(typ: TRttiType; campo: string): TRttiProperty;
var
    _ctx: TRttiContext;
    _typ: TRttiType;
    _pro: TRttiProperty;
    oAtt: TCustomAttribute;
begin
    // _ctx := TRttiContext.Create;
    _typ := typ;
    result := nil;
    for _pro in _typ.GetProperties do
    begin
        for oAtt in _pro.GetAttributes do
        begin
            if oAtt is TPersistable then
            begin
                if TPersistable(oAtt).FieldName = campo then
                begin
                    result := _pro;
                    exit;
                end;
            end;
        end;
    end;
end;


function TListaDAO<T>.SalvarMudancas(lista: TLista<T>): boolean;
var
    item: T;
begin
    try
        for item in lista do
        begin
            case TClasseBase(item).TipoManutencao of
                Insercao : ICRUD<T>(item).Inserir;
                Exclusao: ICRUD<T>(item).Excluir;
                Consulta:
                    begin
                        TClasseBase(item).VerificarAlteracao;
                        if TClasseBase(item).TipoManutencao = Alteracao then
                            ICRUD<T>(item).Alterar;
                    end;
            end;
        end;
    except on E: Exception do
        begin
            raise Exception.Create('Erro ao salvar mudan�as'+#13+e.Message);
        end;
    end;
end;

function TListaDAO<T>.XmlToObject(Xml: WideString): TLista<T>;
var
    XMLDocument: TXMLDocument;
    NoRetorno: IXMLNode;
    NoMetadados: IXMLNode;
    NoDataSet: IXMLNode;
    NoCampo: IXMLNode;
    NoDados: IXMLNode;
    NoLinha: IXMLNode;
    NoColuna: IXMLNode;
    iCont, iCont2, iCont3: integer;
    cRetorno: string;
    Field: TField;
    iContLinhas: integer;
    vTipoDado: Tfieldtype;
    iTamanho: integer;
    cCampo, cValor, cTipo: string;
    Lista: TLista<T>;
    objeto: T;
    context: TRttiContext;
    prop: TRttiProperty;
begin
    try
        try
            Lista := TLista<T>.Create;
            XMLDocument := TXMLDocument.Create(Application);
            XMLDocument.Xml.Text := Xml;
            XMLDocument.Active := True;
            //
            NoRetorno := XMLDocument.ChildNodes.Nodes['Retorno'];
            //
            NoDataSet := NoRetorno.ChildNodes.Nodes['DataSet'];
            //
            iContLinhas := 0;
            NoDados := NoDataSet.ChildNodes.Nodes['Dados'];
            for iCont := 0 to NoDados.ChildNodes.Count - 1 do
            // percorrendo as linhas
            begin
                objeto := TLib.CriaInstancia<T>;
                inc(iContLinhas);
                NoLinha := NoDados.ChildNodes.Nodes[iCont];
                for iCont2 := 0 to NoLinha.ChildNodes.Count - 1 do
                // percorrendo as colunas das linhas
                begin
                    cCampo := NoLinha.ChildNodes.Nodes[iCont2].Attributes['Campo'];
                    cValor := NoLinha.ChildNodes.Nodes[iCont2].Attributes['Valor'];
                    cTipo := NoLinha.ChildNodes.Nodes[iCont2].Attributes['TipoDado'];
                    //
                    prop := RetornaPropriedade(context.GetType(TObject(objeto).ClassType), cCampo);
                    //
                    if Assigned(prop) then
                        TClasseBase(Objeto).ConverteEPopularValorPropriedade(prop, objeto, cValor);
                    //
                end;
                Lista.Add(objeto);
            end;
            //
            result := Lista;
        Except
            on E: Exception do
                raise Erro.Create(E.Message);
        end;
    finally
        // FreeAndNil(lista);
        FreeAndNil(XMLDocument);
    end;
end;

function TControleDados<T, A>.Inserir(sql: string; Parametro: TParametro): integer;
begin
    result := Self.Inserir(sql,Parametro, TConexao.Principal);
end;

function TControleDados<T, A>.IniciarTransacao(nomeTransancao: string): boolean;
begin
    result := IniciarTransacao(nomeTransancao, TConexao.Principal);
end;

function TControleDados<T, A>.Inserir(classeBase: TClasseBase): integer;
begin
    result := Self.Inserir(classeBase, TConexao.Principal);
end;

{ TDataControl }

class function TDataControl.ObterInstancia: IDataControl;
begin
    if not Assigned(FDataControl) then
    begin
        FDataControl := CoSQLDataControl.Create() as IDataControl;
        FDataControl.Connect(TLib.ObterNomeSistema+' '+Tlib.ObterVersao, TLib.ObterNomeComputador, TUsuarioLogado.ObterInstancia.ModuloLogado.Modulo, TUsuarioLogado.ObterInstancia.Filial.Filial, TUsuarioLogado.ObterInstancia.Login);
    end;

    result := FDataControl;

end;

end.
