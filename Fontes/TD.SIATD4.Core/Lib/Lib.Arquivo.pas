unit Lib.Arquivo;

interface

uses ExtActns, Classes, ADODB, Wininet, IdURI, WideStrUtils, Datasnap.DBClient;

type
    TTipoDado = (Numerico, Real, Texto, Data);
    TTipoRestricao = (Normal, ChavePrimaria, ChaveEstrangeira, ArquivoBlob);
    TTipoBloco = (BlocoPai, BlocoContinuacao, BlocoFilho, BlocoAgrupador, Nenhum);

    //
    TDado = class
    private
        Fvalor: string;
        Flinha: integer;
        Fchave: string;
        FLinhaPai: integer;
        procedure Setchave(const Value: string);
        procedure Setlinha(const Value: integer);
        procedure Setvalor(const Value: string);
        procedure SetLinhaPai(const Value: integer);
    public
        property Linha: integer read Flinha write Setlinha;
        property LinhaPai: integer read FLinhaPai write SetLinhaPai;
        property Chave: string read Fchave write Setchave;
        property Valor: string read Fvalor write Setvalor;
    end;

    //
    TMetaDado = class
    private
        FTipoDado: TTipoDado;
        FDescricao: string;
        FTamanho: integer;
        FInicio: integer;
        FNomeCampo: string;
        FDados: TList;
        FCasaDecimal: integer;
        FTipoRestricao: TTipoRestricao;
        FValorDefault: string;
        procedure SetDescricao(const Value: string);
        procedure SetTamanho(const Value: integer);
        procedure SetInicio(const Value: integer);
        procedure SetTipoDado(const Value: TTipoDado);
        procedure SetNomeCampo(const Value: string);
        procedure SetCasaDecimal(const Value: integer);
        function GetPersistivel: boolean;
        procedure SetTipoRestricao(const Value: TTipoRestricao);
        function GetDados(index: integer): TDado;
        procedure SetDados(index: integer; const Value: TDado);
        procedure SetValorDefault(const Value: string);
    public
        property Inicio: integer read FInicio write SetInicio;
        property Tamanho: integer read FTamanho write SetTamanho;
        property TipoDado: TTipoDado read FTipoDado write SetTipoDado;
        property Descricao: string read FDescricao write SetDescricao;
        property NomeCampo: string read FNomeCampo write SetNomeCampo;
        property CasaDecimal: integer read FCasaDecimal write SetCasaDecimal default 2;
        property Persistivel: boolean read GetPersistivel default true;
        property ValorDefault: string read FValorDefault write SetValorDefault;
        property TipoRestricao: TTipoRestricao read FTipoRestricao write SetTipoRestricao;
        property Dados[index: integer]: TDado read GetDados write SetDados;
        procedure AdicionarDados(Linha: integer; Chave, Valor: string; LinhaPai: integer = 1);
        procedure CopiarDados(metaDado: TMetaDado);
        function ObterTotalDados: integer;

        constructor Create;
        destructor Destroy; override;
    end;

    //
    TArrayString = array of string;

    //
    TBloco = class
    private
        FMetaDados: TList;
        FDescricao: string;
        FTabela: string;
        FNome: string;
        FBlocos: TList;
        FTamanho: integer;
        FTipoBloco: TTipoBloco;
        FSeparadorBloco: string;
        FExcecao: boolean;
        FBlocosLimite: TStringList;
        procedure SetDescricao(const Value: string);
        procedure SetNome(const Value: string);
        procedure SetTabela(const Value: string);
        procedure SetTamanho(const Value: integer);
        procedure SetTipoBloco(const Value: TTipoBloco);
        procedure SetSeparadorBloco(const Value: string);
        procedure SetMetaDados(index: integer; const Value: TMetaDado);
        function GetMetaDados(index: integer): TMetaDado;
        function GetBlocos(index: integer): TBloco;
        procedure SetBlocos(index: integer; const Value: TBloco);
        procedure SetExcecao(const Value: boolean);
        function GetBlocosLimite(index: integer): string;
        procedure SetBlocosLimite(index: integer; const Value: string);
    public
        property Nome: string read FNome write SetNome;
        property Descricao: string read FDescricao write SetDescricao;
        property Tabela: string read FTabela write SetTabela;
        property Tamanho: integer read FTamanho write SetTamanho;
        property SeparadorBloco: string read FSeparadorBloco write SetSeparadorBloco;
        property Blocos[index: integer]: TBloco read GetBlocos write SetBlocos;
        property MetaDados[index: integer]: TMetaDado read GetMetaDados write SetMetaDados;
        property TipoBloco: TTipoBloco read FTipoBloco write SetTipoBloco;
        property Excecao: boolean read FExcecao write SetExcecao default false;
        property BlocosLimite[index: integer]: string read GetBlocosLimite write SetBlocosLimite;
        //
        function BlocosLimiteCount: integer;
        function TemBlocosLimite: boolean;
        procedure AdicionarBlocoLimite(blocoLimite: string);
        function ExisteEsteBlocoLimite(blocoLimite: string): boolean;
        //
        procedure CopiarBloco(blc: TBloco);
        function ObterTotalBlocosFilhos: integer;
        function ObterListaDeBlocosFilhos: TList;
        function ObterBlocoPorNome(Nome: string): TBloco;
        function ObterTotalBlocoContinuacao: integer;
        procedure AdicionarBloco(bloco: TBloco);
        //
        function ObterTotalMetadados: integer;
        procedure AdicionarMetaDado(Inicio, Tamanho: integer; TipoDado: TTipoDado; NomeCampo: string; Descricao: string; CasaDecimal: integer;
          TipoRestricao: TTipoRestricao; ValorDefault: string); overload;
        procedure AdicionarMetaDado(Inicio, Tamanho: integer; TipoDado: TTipoDado; Descricao: string); overload;
        procedure AdicionarMetaDado(Inicio, Tamanho: integer; TipoDado: TTipoDado; NomeCampo: string; Descricao: string); overload;
        procedure AdicionarMetaDado(Inicio, Tamanho: integer; NomeCampo: string; Descricao: string; TipoRestricao: TTipoRestricao); overload;
        procedure AdicionarMetaDado(Inicio, Tamanho: integer; NomeCampo: string; Descricao: string; CasaDecimal: integer); overload;
        procedure AdicionarMetaDado(NomeCampo: string; Descricao: string; ValorDefault: string); overload;
        procedure AdicionarMetaDado(metaDado: TMetaDado); overload;
        procedure CopiarMetadados(blc: TBloco);
        procedure RemoverMetadadoPorNomeCampo(NomeCampo: string);
        function ObterMetaDadoPorNome(NomeCampo: string): TMetaDado;

        /// <summary>
        /// Popula as informa��es e retorna o numero da linha
        /// </summary>
        function PopularInformacoes(strBloco: string; LinhaPai: integer = 0): integer;

        constructor Create;
        destructor Destroy; override;
    end;

    //
    TArquivo = Class Abstract
    private
        FBloco: TBloco;
        FDiretorio: string;
        FArquivo: WideString;
        FProducao: boolean;
        procedure SetBloco(const Value: TBloco);
        procedure SetArquivo(const Value: WideString);
        procedure SetProducao(const Value: boolean);
    protected
        function ExecutarConsulta(conexao: TADOConnection; query: WideString): TADOQuery;
    public
        property Diretorio: string read FDiretorio;
        property Arquivo: WideString read FArquivo write SetArquivo;
        property BlocoPrincipal: TBloco read FBloco write SetBloco;
        property Producao: boolean read FProducao write SetProducao;
        //
        procedure AdicionarBloco(bloco: TBloco);
        function AcharPalavra(const SubStr, Str: WideString; posicao: integer = 1): integer;
        function ObterPorParametro(Str: WideString; posicao: integer; separador: string): string;
        function ContarCaracter(Texto: string; caracter: Char): integer;
        procedure ValidarCaracteresArquivo;
        //
        constructor Create(Diretorio, usuario: string; Producao: boolean = false); virtual;
        destructor Destroy; override;
    end;

    //
    TArquivoRemessa = Class Abstract(TArquivo)
    private

    public
        procedure GerarArquivo; virtual;
    end;

    //
    TRecno = class
        Tabela: string;
        recno: integer;
    end;

    //
    TQuery = class
        recPai: integer;
        rec: integer;
        bloco: string;
        Tabela: string;
        query: WideString;
    end;

    //
    TArquivoRetorno = Class Abstract(TArquivo)
    private
        FRecnos: TList;
        FQueries: TList;
        FSenha: string;
        FUsuario: string;
        FTempoConsulta: string;
        procedure FinalizarQueries(sql: WideString; valores: TStringList; bloco, Tabela: string);
        function FormatarNumeroReal(number: string): String;
        function AlterarRecnoScript(script: WideString; recMae: string; out valorMae, recno: string): WideString;

        function GetRecnos(index: integer): TRecno;
        procedure SetRecnos(index: integer; const Value: TRecno);
        function GetQueries(index: integer): TQuery;
        procedure SetQueries(index: integer; const Value: TQuery);
        procedure SetSenha(const Value: string);
        procedure SetTempoConsulta(const Value: string);
        procedure SetUsuario(const Value: string);
    protected
        FUrl: WideString;
        procedure Donwload;
        function IncrementarRecno(Tabela: string): string;
        function ObterRecno(Tabela: string): TRecno;

        function ObterRecnoBase(Tabela: string): integer; virtual;
        function ObterListaSQL(blc: TBloco; sql: WideString; valores: TStringList): boolean; overload;
        procedure AdicionarQuery(recPai, rec: integer; query: WideString; bloco, Tabela: string);
        procedure ObterArquivo;

        /// <summary>
        /// Este m�todo � executado ao carregar o arquivo e deve ser implementado nas classes herdadas desta classe.
        /// </summary>
        procedure ValidarArquivo; virtual;

        /// <summary>
        /// Este m�todo � executado antes de obter as informa��es do arquivo e deve ser implementado nas classes herdadas desta classe, caso tenha alguma particularidade.
        /// </summary>
        function ExecutarParticularidades(blc: TBloco; retorno: WideString; valorReferencia: string; LinhaPai: integer): WideString; virtual;

        /// <summary>
        /// Este m�todo � executado no momento e que � gerado  os SQL de inserts e deve ser implementado nas classes herdadas desta classe, caso tenha alguma particularidade.
        /// </summary>
        procedure ExecutarParticularidadesSQLInsercao(blc: TBloco; retorno: WideString); virtual;

        /// <summary>
        /// Este m�todo � executado ap�s obter as informa��es do arquivo e deve ser implementado nas classes herdadas desta classe, caso exista alguma informa��o que precise ser ajustada.
        /// </summary>
        procedure AjustarInformacoes; Virtual;
    public
        property Url: WideString read FUrl;
        property Recnos[index: integer]: TRecno read GetRecnos write SetRecnos;
        property Queries[index: integer]: TQuery read GetQueries write SetQueries;

        property usuario: string read FUsuario write SetUsuario;
        property Senha: string read FSenha write SetSenha;
        property TempoConsulta: string read FTempoConsulta write SetTempoConsulta;

        function ObterTotalRecnos: integer;
        function ObterToTalQueries: integer;

        procedure ConverterScripts;

        procedure DonwloadArquivo(Url: string); overload;
        procedure DonwloadArquivo(parametro: array of string); overload; virtual;
        procedure FormatarArquivo;
        procedure Carregar; virtual;
        function ObterListaSQL: boolean; overload;

        function ObterInformacaoArquivo(bl: TList; retorno: WideString; LinhaPai: integer; blocosExcluidos: array of string; valorReferencia: string)
          : WideString; overload;
        function ObterInformacaoArquivo(bl: TList; retorno: WideString; LinhaPai: integer): WideString; overload;
        function ObterInformacaoArquivo(bl: TList; retorno: WideString; blocosExcluidos: array of string; valorReferencia: string)
          : WideString; overload;
        function ObterInformacaoArquivo(bl: TList; retorno: WideString): WideString; overload;

        procedure InserirRegistros;

        constructor Create(Diretorio, usuario: string; Producao: boolean = false); override;
        destructor Destroy; override;
    end;

implementation

uses
    Dialogs, SysUtils, SysConst, StrUtils, IdHTTP,
    Types, IdSSLOpenSSL, Dal.ControleDados;

{ TArquivoRetorno }

procedure TArquivoRetorno.AdicionarQuery(recPai, rec: integer; query: WideString; bloco, Tabela: string);
var
    qry: TQuery;
begin
    qry := TQuery.Create;
    qry.recPai := recPai;
    qry.rec := rec;
    qry.query := query;
    qry.bloco := bloco;
    qry.Tabela := Tabela;
    Self.FQueries.Add(qry);
end;

constructor TArquivoRetorno.Create(Diretorio, usuario: string; Producao: boolean = false);
begin
    inherited;
    FRecnos := TList.Create;
    FQueries := TList.Create;
end;

destructor TArquivoRetorno.Destroy;
begin
    if FRecnos <> nil then
        FreeAndNil(FRecnos);

    if FQueries <> nil then
        FreeAndNil(FQueries);

    inherited;
end;

procedure TArquivoRetorno.AjustarInformacoes;
begin

end;

function TArquivoRetorno.AlterarRecnoScript(script: WideString; recMae: string; out valorMae, recno: string): WideString;
var
    Valor: string;
    rec: string;
    temMae: boolean;
    Tabela: string;
    recno_: TRecno;
begin
    try
        repeat
            temMae := false;
            if (AcharPalavra('@RecMae', script) > 0) or (AcharPalavra('@Rec', script) > 0) then
            begin
                if AcharPalavra(WideString('@RecMae'), script) > 0 then
                begin
                    Valor := copy(script, AcharPalavra('@RecMae', script), 13);
                    temMae := true;
                end
                else
                    Valor := copy(script, AcharPalavra('@Rec', script), 10);

                Tabela := RightStr(Valor, 6);
                recno_ := ObterRecno(Tabela);

                if (recno_ <> nil) and (temMae) then
                begin
                    if recMae <> EmptyStr then
                        rec := recMae
                    else
                        rec := inttostr(recno_.recno);
                end
                else
                begin
                    rec := IncrementarRecno(Tabela);
                    recno := rec;
                    valorMae := '@RecMae' + Tabela
                end;

                script := StringReplace(script, Valor, rec, [rfReplaceAll, rfIgnoreCase]);
                rec := EmptyStr;
            end;
            if AcharPalavra('@Arq', script) > 0 then
                script := StringReplace(script, '@Arq', QuotedStr(Arquivo), [rfReplaceAll, rfIgnoreCase]);

            // se for passada o recMae eu s� altero a m�e e saio do m�todo
            if recMae <> EmptyStr then
            begin
                result := script;
                exit;
            end;

        until (AcharPalavra('@RecMae', script) = 0) and (AcharPalavra('@Rec', script) = 0) and (AcharPalavra('@Arq', script) = 0);

        result := script;
    except
        result := EmptyStr;
        raise;
    end;
end;

procedure TArquivoRetorno.ObterArquivo;
var
    Linha: string;
    arq: textfile;
begin
    try
        if FileExists(Self.Diretorio) then
        begin
            AssignFile(arq, Self.Diretorio);
            Reset(arq);
            while not Eof(arq) do
            begin
                Readln(arq, Linha);
                FArquivo := FArquivo + Linha;
            end;
            Self.ValidarCaracteresArquivo;
        end
        else
            raise Exception.Create('Arquivo para restaura��o n�o encontrado.');
    finally
        // if arq <> nil then
        CloseFile(arq);
    end;
end;

function TArquivoRetorno.ObterInformacaoArquivo(bl: TList; retorno: WideString; LinhaPai: integer): WideString;
begin
    result := ObterInformacaoArquivo(bl, retorno, LinhaPai, [''], EmptyStr);
end;

function TArquivoRetorno.ObterInformacaoArquivo(bl: TList; retorno: WideString; blocosExcluidos: array of string; valorReferencia: string)
  : WideString;
begin
    result := ObterInformacaoArquivo(bl, retorno, 0, blocosExcluidos, valorReferencia);
end;

procedure TArquivoRetorno.Donwload;
// SEGUNDA OPCAO PARA DOWNLOAD

// function GetInetFile (const fileURL, FileName: String): boolean;
// const BufferSize = 1024;
// var
// hSession, hURL: HInternet;
// Buffer: array[1..BufferSize] of Byte;
// BufferLen: DWORD;
// f: File;
// teste:string;
// begin
// Result:=False;
// hSession := InternetOpen(PChar('ChronicleHelp'), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
// try
// hURL := InternetOpenURL(hSession, PChar(fileURL), nil,0,0,0);
// try
// AssignFile(f, FileName);
// Rewrite(f,1);
// repeat
// InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
// //StrLCopy(, PAnsiChar(teste), High(Buffer));
// ShowMessage(PAnsiChar(@Buffer));
// BlockWrite(f, Buffer, BufferLen)
//
// until BufferLen = 0;
// CloseFile(f);
// Result:=True;
// finally
// InternetCloseHandle(hURL)
// end
// finally
// InternetCloseHandle(hSession)
// end
// end;

var
    dl: TDownloadURL;
    aux: string;
    // IdHTTP1: TIdHTTP;
    // IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    // Stream: TStringStream;
    // Url, FileName: String;
begin
    // try
    // try
    // IdHTTP1 := TIdHTTP.Create(nil);
    // IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    // IdHTTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    // Stream := TStringStream.Create;
    //
    // IdHTTP1.Get(TIdURI.URLEncode(Self.Url), Stream);
    //
    // if Self.Diretorio <> EmptyStr then
    // Stream.SaveToFile(Self.Diretorio);
    //
    // Self.Arquivo := Stream.DataString;
    // except
    // raise Exception.Create('Falha ao abrir TXT. '+ Self.Diretorio);
    // end;
    // finally
    // Stream.Free;
    // IdSSLIOHandlerSocketOpenSSL1.Free;
    // IdHTTP1.Free;
    // end;

    dl := TDownloadURL.Create(nil);
    try
        try
            aux := copy(Self.Diretorio, 1, Self.AcharPalavra('\', Self.Diretorio, ContarCaracter(Self.Diretorio, '\')) - 1);

            if not DirectoryExists(aux) then
                raise Exception.Create('Diret�rio n�o encontrado.');

            dl.Url := Self.Url;
            dl.FileName := Self.Diretorio;
            dl.ExecuteTarget(nil);
            ObterArquivo;

        except
            on e: Exception do
            begin
                raise Exception.Create('Falha ao abrir TXT. ' + Self.Diretorio + #13 + e.Message);
            end;
        end;
    finally
        // dl.Free;
    end;
end;

procedure TArquivoRetorno.DonwloadArquivo(parametro: array of string);
begin
    Donwload;
end;

function TArquivoRetorno.ExecutarParticularidades(blc: TBloco; retorno: WideString; valorReferencia: string; LinhaPai: integer): WideString;
begin
    result := Self.Arquivo;
end;

procedure TArquivoRetorno.ExecutarParticularidadesSQLInsercao(blc: TBloco; retorno: WideString);
begin

end;

function TArquivoRetorno.ObterListaSQL: boolean;
var
    val: TList;
    campo: WideString;
begin
    result := ObterListaSQL(Self.BlocoPrincipal, '', nil);
end;

function TArquivoRetorno.IncrementarRecno(Tabela: string): string;
var
    recno: TRecno;
begin
    try
        try
            recno := Self.ObterRecno(Tabela);
            if recno = nil then
            begin

                recno := TRecno.Create;
                recno.Tabela := Tabela;
                recno.recno := ObterRecnoBase(Tabela);
                FRecnos.Add(recno);
            end
            else
                recno.recno := recno.recno + 1;

            result := inttostr(recno.recno);
        except
            on e: Exception do
            begin
                raise Exception.Create('Erro ao incremetar o recno.' + #13 + e.Message);

            end;
        end;
    finally

    end;
end;

procedure TArquivoRetorno.InserirRegistros;
//var
//    recno: TRecno;
//    cd: TControleDados<TClientDataSet, TDataSetDAO>;
//    i: integer;
begin
//    cd := TControleDados<TClientDataSet, TDataSetDAO>.Create;
//    try
//        try
//            ObterListaSQL;
//            ConverterScripts;
//            cd.IniciarTransacao();
//            for i := 0 to Self.FQueries.Count - 1 do
//            begin
//                cd.Inserir(Self.Queries[i].query, nil);
//            end;
//            cd.ConfirmarTransacao();
//        except
//            on e: Exception do
//            begin
//                cd.ReverterTransacao();
//                raise Exception.Create('Erro ao inserir registros.' + #13 + Self.ObterPorParametro(Self.Queries[i].query, 3, ' ') + #13 + e.Message);
//            end;
//        end;
//    finally
//        if cd <> nil then
//            FreeAndNil(cd);
//    end;
end;

function TArquivoRetorno.ObterRecno(Tabela: string): TRecno;
var
    i: integer;
    rec: TRecno;
begin
    for i := 0 to FRecnos.Count - 1 do
        if Recnos[i].Tabela = Tabela then
        begin
            result := Recnos[i];
            exit;
        end;

    result := nil;

end;

function TArquivoRetorno.ObterRecnoBase(Tabela: string): integer;
var
    cd: TControleDados<TClientDataSet, TDataSetDAO>;
    query: string;
    dataSet: TClientDataSet;
begin
    try

        cd := TControleDados<TClientDataSet, TDataSetDAO>.Create;
        query := 'SELECT ISNULL(MAX(R_E_C_N_O_+1),1) R_E_C_N_O_ FROM ' + Tabela;

        dataSet := cd.Consultar(query, nil);

        if dataSet.RecordCount = 0 then
            raise Exception.Create('tabela ' + Tabela + ' n�o existe');

        result := dataSet.FieldByName('R_E_C_N_O_').AsInteger;
    finally
        if cd <> nil then
            FreeAndNil(cd);

        if dataSet <> nil then
            FreeAndNil(dataSet);

    end;
end;

function TArquivoRetorno.ObterToTalQueries: integer;
begin
    result := FQueries.Count;
end;

function TArquivoRetorno.ObterTotalRecnos: integer;
begin
    result := FRecnos.Count;
end;

procedure TArquivoRetorno.Carregar;
begin
    ValidarArquivo;
    AjustarInformacoes;
end;

procedure TArquivoRetorno.ConverterScripts;
var
    tipoRec: WideString;
    i, j: integer;
    r, v, recMae, valorMae: string;
    query: TADOQuery;
    script: string;
    indicePai: integer;
    BlocoPai: string;
begin
    try
        for i := 0 to Self.ObterToTalQueries - 1 do
        begin
            Self.Queries[i].query := AlterarRecnoScript(Self.Queries[i].query, '', valorMae, recMae);
            indicePai := Self.Queries[i].rec;
            BlocoPai := Self.Queries[i].bloco;

            if i <= Self.FQueries.Count then
                for j := 0 to Self.ObterToTalQueries - 1 do
                    if (Self.Queries[j].recPai = indicePai) and (AcharPalavra(valorMae, Self.Queries[j].query) > 0) and
                      (Self.Queries[j].bloco = BlocoPai) then
                        Self.Queries[j].query := AlterarRecnoScript(Self.Queries[j].query, recMae, v, r);

        end;
    except
        raise;
    end;
end;

procedure TArquivoRetorno.SetQueries(index: integer; const Value: TQuery);
begin
    FQueries[index] := Value;
end;

procedure TArquivoRetorno.SetRecnos(index: integer; const Value: TRecno);
begin
    FRecnos[index] := Value;
end;

procedure TArquivoRetorno.SetSenha(const Value: string);
begin
    FSenha := Value;
end;

procedure TArquivoRetorno.SetTempoConsulta(const Value: string);
begin
    FTempoConsulta := Value;
end;

procedure TArquivoRetorno.SetUsuario(const Value: string);
begin
    FUsuario := Value;
end;

procedure TArquivoRetorno.ValidarArquivo;
begin

end;

procedure TArquivoRetorno.FinalizarQueries(sql: WideString; valores: TStringList; bloco, Tabela: string);
var
    i: integer;
    val, campos: WideString;
    recPai, rec: integer;
    instrucao, Valor, aux, aux1: string;
begin
    // Delete(campos, Length(campos), 1);
    // for i := 0 to valores.Count-1 do
    // begin
    // val := trim(widestring(valores[i]));
    // recPai := strtoint(trim(ObterPorParametro(val,1,'|')));
    // rec := strtoint(trim(ObterPorParametro(val,2,'|')));
    // // retiro os indices
    // val := ObterPorParametro(val,3,'|');
    // // deleta a ultima virgula
    // Delete(val, Length(val), 1);
    //
    // Self.AdicionarQuery(recPai,rec, sql+ campos+') ' + val+')', bloco);
    // end;

    for i := 0 to valores.Count - 1 do
    begin
        val := trim(WideString(valores[i]));
        recPai := strtoint(trim(ObterPorParametro(val, 1, '|')));
        rec := strtoint(trim(ObterPorParametro(val, 2, '|')));
        // retiro os indices
        val := ObterPorParametro(val, 3, '|');

        campos := EmptyStr;
        Valor := EmptyStr;
        while Pos('�', val) > 0 do
        begin
            aux := ObterPorParametro(val, 1, '�');
            delete(val, 1, length(aux) + 1);

            aux1 := ObterPorParametro(aux, 1, '#');
            if campos = EmptyStr then
                campos := campos + aux1
            else
                campos := campos + ', ' + aux1;

            aux1 := aux;
            delete(aux1, 1, Pos('#', aux1));
            if Valor = EmptyStr then
                Valor := Valor + aux1
            else
                Valor := Valor + ', ' + aux1;
        end;

        instrucao := EmptyStr;
        instrucao := sql + '(' + campos + ') VALUES (' + Valor + ')';
        Self.AdicionarQuery(recPai, rec, instrucao, bloco, Tabela);
    end;
end;

procedure TArquivoRetorno.FormatarArquivo;
var
    Linha: string;
    arq: textfile;
    arqTexto: WideString;
begin
    try
        if FileExists(Self.Diretorio) then
        begin
            AssignFile(arq, Self.Diretorio);
            Rewrite(arq);
            arqTexto := Self.Arquivo;
            while Self.AcharPalavra('#', arqTexto) > 0 do
            begin
                Linha := copy(arqTexto, 1, Self.AcharPalavra('#', arqTexto) - 1);
                delete(arqTexto, 1, length(Linha) + 1);
                Writeln(arq, '#' + Linha);
            end;
        end
        else
            raise Exception.Create('Arquivo para restaura��o n�o encontrado.');
    finally
        // if arq <> nil then
        CloseFile(arq);
    end;
end;

function TArquivoRetorno.FormatarNumeroReal(number: string): String;
begin
    result := StringReplace(number, '.', '', [rfReplaceAll, rfIgnoreCase]);
    result := StringReplace(result, ',', '.', [rfReplaceAll, rfIgnoreCase]);
end;

function TArquivoRetorno.GetQueries(index: integer): TQuery;
begin
    result := TQuery(FQueries[index]);
end;

function TArquivoRetorno.GetRecnos(index: integer): TRecno;
begin
    result := TRecno(FRecnos[index]);
end;

function TArquivoRetorno.ObterListaSQL(blc: TBloco; sql: WideString; valores: TStringList): boolean;
var
    i, j, r, contDados: integer;
    metaDado: TMetaDado;
    bloco: TBloco;
    dado: TDado;
    ultimoBlocoContinuacao: boolean;
    Valor: string;
    tbMae: string;
    query: TQuery;
    aux, aux1: string;
    adicionaValor: boolean;
begin
    //
    ultimoBlocoContinuacao := false;
    //
    for i := 0 to blc.ObterTotalBlocosFilhos - 1 do
    begin
        bloco := blc.Blocos[i];
        // nos blocos pai ou filhos eu inicio novamente  os campos
        if bloco.TipoBloco in [BlocoPai, BlocoFilho] then
        begin
            // se n�o tiver tabela ou n�o tiver dados
            if (bloco.Tabela = EmptyStr) then
                Continue;

            if bloco.ObterTotalMetadados = 0 then
                raise Exception.Create('n�o existe metados para o bloco ' + bloco.Nome);

            if (TMetaDado(bloco.MetaDados[bloco.ObterTotalMetadados - 1]).ObterTotalDados = 0) then
                Continue;

            sql := 'INSERT INTO ' + bloco.Tabela;

            valores := TStringList.Create;
            for r := 0 to TMetaDado(bloco.MetaDados[bloco.ObterTotalMetadados - 1]).ObterTotalDados - 1 do
            begin
                // adiciona os indices dos registros pais e filhos para a cria��o dos R_E_C_N_O_
                dado := bloco.MetaDados[0].Dados[r];
                valores.Add(inttostr(dado.LinhaPai) + '|' + inttostr(dado.Linha) + '| ');
            end;
        end;

        // Obtenho os valoes de acordo com os metadados
        contDados := 0;
        for j := 0 to bloco.ObterTotalMetadados - 1 do
        begin
            metaDado := bloco.MetaDados[j];
            // for persisistivel e se existir dados para tipos normais
            if (metaDado.Persistivel) and ((metaDado.ObterTotalDados > 0) or (metaDado.TipoRestricao <> Normal)) then
            begin
                if (metaDado.TipoRestricao in [ChavePrimaria, ChaveEstrangeira, ArquivoBlob]) then
                begin
                    if metaDado.TipoRestricao = ChaveEstrangeira then
                        Valor := '@RecMae' + blc.Tabela
                    else if metaDado.TipoRestricao = ChavePrimaria then
                        Valor := '@Rec' + bloco.Tabela
                    else
                        Valor := '@Arq';

                    for r := 0 to valores.Count - 1 do
                        valores[r] := valores[r] + metaDado.NomeCampo + '#' + Valor + '�';
                end
                else
                begin
                    contDados := 0;
                    while contDados <= metaDado.ObterTotalDados - 1 do
                    begin
                        adicionaValor := false;

                        dado := metaDado.Dados[contDados];

                        if metaDado.TipoDado = Real then
                        begin
                            // acrescenta a virgula da casa decimal
                            Valor := dado.Valor;
                            insert(',', Valor, (length(Valor) + 1) - metaDado.CasaDecimal);
                            // formata o valor
                            dado.Valor := FormatarNumeroReal(FormatCurr('###,##0.' + DupeString('0', metaDado.CasaDecimal), StrToFloat(Valor)))
                        end
                        else if metaDado.TipoDado = Numerico then
                            dado.Valor := inttostr(StrToIntDef(dado.Valor, 0))
                        else
                            dado.Valor := QuotedStr(dado.Valor);

                        // Verifico se j� o campo j� existe na query, pois � poss�vel que exista campos iguais em blocos diferentes, e deixo o que possui valor
                        if (Pos(metaDado.NomeCampo, valores[contDados]) > 0) then
                        begin
                            // de onde come�a o campo at� o final
                            aux := copy(valores[contDados], Pos(metaDado.NomeCampo, valores[contDados]), length(valores[contDados]));
                            // somente o campo com o valor
                            aux := ObterPorParametro(aux, 1, '�');
                            // somente o campo
                            aux1 := ObterPorParametro(aux, 1, '#');

                            // Pode ser que ocampo seja igual somente no come�o, ou seja, ZAT_MSG e ZAT_MSGNEG
                            if metaDado.NomeCampo = aux1 then
                            begin
                                // somente o valor
                                aux := copy(aux, Pos('#', aux) + 1, length(aux) - 1);
                                // para garantir que o valor esta sem informa��o nenhuma
                                if (aux = EmptyStr) or (aux = '''''') or (aux = '''') then
                                begin
                                    aux1 := valores[contDados];
                                    // deleto o campo sem valor
                                    delete(aux1, Pos(metaDado.NomeCampo, aux1), length(metaDado.NomeCampo) + length(aux) + 2);
                                    valores[contDados] := aux1;
                                    adicionaValor := true;
                                end;
                            end
                            else
                                adicionaValor := true;
                        end
                        else
                            adicionaValor := true;

                        if adicionaValor then
                            valores[contDados] := valores[contDados] + metaDado.NomeCampo + '#' + dado.Valor + '�';

                        contDados := contDados + 1;
                    end;
                end;
            end;
        end;

        // Finalizo a query se o bloco n�o tiver blocos filho de continua��o e nao entra se for blocos agrupadores e blocos continua��o, se for bloco
        // continua��o verifico na outra condi��o, ou seja, se for o ultimo bloco continua��o do bloco analisado eu fecho a query
        if ((bloco.ObterTotalBlocoContinuacao = 0) and not(bloco.TipoBloco in [BlocoContinuacao, BlocoAgrupador])) or
          ((blc.ObterTotalBlocoContinuacao = i + 1) and (bloco.TipoBloco = BlocoContinuacao)) then
            FinalizarQueries(sql, valores, blc.Nome, bloco.Tabela);

        // verifico os blocos dentro do bloco que esta sendo analisado.
        if bloco.TipoBloco in [BlocoPai, BlocoFilho, BlocoAgrupador] then
            ObterListaSQL(bloco, sql, valores);
    end;
end;

function TArquivoRetorno.ObterInformacaoArquivo(bl: TList; retorno: WideString; LinhaPai: integer; blocosExcluidos: array of string;
  valorReferencia: string): WideString;
    function VerificarBlocoExcluido(nomeBloco: string): boolean;
    var
        i: integer;
    begin
        result := false;
        for i := 0 to high(blocosExcluidos) do
        begin
            if nomeBloco = blocosExcluidos[i] then
            begin
                result := true;
                exit;
            end;
        end;
    end;

var
    i, j, l: integer;
    bloco: TBloco;
    strBloco: string;
    aux: WideString;
    blocoLimite: integer;
    linhaAtual: integer;
begin
    try
        for i := 0 to bl.Count - 1 do
        begin
            bloco := bl[i];

            if bloco.TipoBloco = BlocoAgrupador then
            begin
                retorno := ObterInformacaoArquivo(bloco.ObterListaDeBlocosFilhos, retorno, LinhaPai, blocosExcluidos, valorReferencia);
                Continue;
            end;

            if VerificarBlocoExcluido(bloco.Nome) then
            begin
                linhaAtual := bloco.PopularInformacoes(EmptyStr, LinhaPai);
                Continue;
            end;

            if bloco.Excecao then
            begin
                retorno := ExecutarParticularidades(bloco, retorno, valorReferencia, LinhaPai);
            end
            else
            begin
                while AcharPalavra(bloco.Nome, retorno) > 0 do
                begin
                    if bloco.TemBlocosLimite then
                    begin
                        blocoLimite := 99999999;
                        for j := 0 to bloco.BlocosLimiteCount - 1 do
                        begin
                            l := AcharPalavra(bloco.BlocosLimite[j], retorno);
                            if (l < blocoLimite) and (l > 0) then
                                blocoLimite := l;
                        end;
                        if blocoLimite > 0 then
                            if AcharPalavra(bloco.Nome, retorno) > blocoLimite then
                                break;
                    end;

                    if bloco.SeparadorBloco = EmptyStr then
                        strBloco := copy(retorno, AcharPalavra(bloco.Nome, retorno), bloco.Tamanho)
                    else
                    begin
                        aux := copy(retorno, AcharPalavra(bloco.Nome, retorno), length(retorno));
                        strBloco := copy(aux, 1, AcharPalavra(bloco.SeparadorBloco, aux));
                        bloco.Tamanho := length(strBloco);
                    end;

                    delete(retorno, AcharPalavra(bloco.Nome, retorno), bloco.Tamanho);
                    linhaAtual := bloco.PopularInformacoes(strBloco, LinhaPai);

                    if bloco.ObterTotalBlocosFilhos > 0 then
                        retorno := ObterInformacaoArquivo(bloco.ObterListaDeBlocosFilhos, retorno, linhaAtual);

                    if bloco.TipoBloco = BlocoContinuacao then
                        break;
                end;
            end;
        end;
        result := retorno;
    except
        raise;
    end;
end;

procedure TArquivoRetorno.DonwloadArquivo(Url: string);
begin
    Self.FUrl := Url;
    Donwload;
end;

function TArquivoRetorno.ObterInformacaoArquivo(bl: TList; retorno: WideString): WideString;
begin
    result := ObterInformacaoArquivo(bl, retorno, 0, [''], EmptyStr);
end;

{ TBloco }

procedure TBloco.AdicionarBloco(bloco: TBloco);
begin
    Self.FBlocos.Add(bloco);
end;

procedure TBloco.AdicionarMetaDado(Inicio, Tamanho: integer; TipoDado: TTipoDado; NomeCampo: string; Descricao: string; CasaDecimal: integer;
  TipoRestricao: TTipoRestricao; ValorDefault: string);
var
    metaDado: TMetaDado;
begin
    metaDado := TMetaDado.Create;
    metaDado.Inicio := Inicio;
    metaDado.Tamanho := Tamanho;
    metaDado.TipoDado := TipoDado;
    metaDado.NomeCampo := NomeCampo;
    metaDado.Descricao := Descricao;
    metaDado.CasaDecimal := CasaDecimal;
    metaDado.TipoRestricao := TipoRestricao;
    metaDado.ValorDefault := ValorDefault;
    Self.AdicionarMetaDado(metaDado);
end;

procedure TBloco.AdicionarMetaDado(Inicio, Tamanho: integer; TipoDado: TTipoDado; Descricao: string);
begin
    Self.AdicionarMetaDado(Inicio, Tamanho, TipoDado, '', Descricao, 2, Normal, '');
end;

procedure TBloco.CopiarBloco(blc: TBloco);
var
    i: integer;
    b, b1: TBloco;
begin
    blc.Nome := Self.Nome;
    blc.Descricao := Self.Descricao;
    blc.Tabela := Self.Tabela;
    blc.Tamanho := Self.Tamanho;
    blc.SeparadorBloco := Self.SeparadorBloco;
    blc.Excecao := Self.Excecao;

    for i := 0 to Self.BlocosLimiteCount - 1 do
        blc.AdicionarBlocoLimite(Self.BlocosLimite[i]);

    blc.TipoBloco := Self.TipoBloco;
    Self.CopiarMetadados(blc);
    // copia os blocos filhos
    for i := 0 to Self.ObterTotalBlocosFilhos - 1 do
    begin
        b := Self.Blocos[i];
        b1 := TBloco.Create;
        b.CopiarBloco(b1);
        blc.AdicionarBloco(b1);
    end;

end;

procedure TBloco.CopiarMetadados(blc: TBloco);
var
    i: integer;
    meta: TMetaDado;
begin
    for i := 0 to Self.ObterTotalMetadados - 1 do
    begin
        meta := Self.MetaDados[i];
        blc.AdicionarMetaDado(meta.Inicio, meta.Tamanho, meta.TipoDado, meta.NomeCampo, meta.Descricao, meta.CasaDecimal, meta.TipoRestricao,
          meta.ValorDefault);
    end;
end;

constructor TBloco.Create;
begin
    FBlocos := TList.Create;
    FMetaDados := TList.Create;
    FBlocosLimite := TStringList.Create;
end;

destructor TBloco.Destroy;
begin
    if FBlocos <> nil then
        FreeAndNil(FBlocos);

    if FMetaDados <> nil then
        FreeAndNil(FMetaDados);

    if FBlocosLimite <> nil then
        FreeAndNil(FBlocosLimite);

    inherited;
end;

function TBloco.ExisteEsteBlocoLimite(blocoLimite: string): boolean;
begin
    result := FBlocosLimite.IndexOf(blocoLimite) > -1;
end;

function TBloco.GetBlocos(index: integer): TBloco;
begin
    result := TBloco(FBlocos[index]);
end;

function TBloco.GetBlocosLimite(index: integer): string;
begin
    result := FBlocosLimite[index];
end;

function TBloco.GetMetaDados(index: integer): TMetaDado;
begin
    result := TMetaDado(FMetaDados[index]);
end;

function TBloco.ObterBlocoPorNome(Nome: string): TBloco;
var
    bloco: TBloco;
    i: integer;
begin
    result := nil;
    for i := 0 to Self.ObterTotalBlocosFilhos - 1 do
    begin
        bloco := Self.Blocos[i];
        if bloco.TipoBloco = BlocoAgrupador then
        begin
            result := bloco.ObterBlocoPorNome(Nome);
            exit;
        end;

        if bloco.Nome = Nome then
        begin
            result := bloco;
            exit;
        end;
    end;
    raise Exception.Create('N�o foi encontrado nenhum bloco com o nome: ' + Nome);
end;

function TBloco.ObterListaDeBlocosFilhos: TList;
begin
    if FBlocos <> nil then
        result := FBlocos
    else
        result := nil;
end;

function TBloco.ObterMetaDadoPorNome(NomeCampo: string): TMetaDado;
var
    i: integer;
    meta: TMetaDado;
begin
    for i := 0 to Self.ObterTotalMetadados - 1 do
    begin
        meta := Self.MetaDados[i];
        if meta.NomeCampo = NomeCampo then
        begin
            result := meta;
            exit;
        end;
    end;
    raise Exception.Create('N�o foi encontrado nenhum metadado');
end;

function TBloco.PopularInformacoes(strBloco: string; LinhaPai: integer): integer;
var
    i: integer;
    metaDado: TMetaDado;
    Valor: string;
begin
    for i := 0 to Self.ObterTotalMetadados - 1 do
    begin
        metaDado := Self.MetaDados[i];

        if metaDado.ValorDefault = EmptyStr then
            Valor := copy(strBloco, metaDado.Inicio, metaDado.Tamanho)
        else
            Valor := metaDado.ValorDefault;

        metaDado.AdicionarDados(metaDado.ObterTotalDados + 1, metaDado.NomeCampo, trim(Valor), LinhaPai);
        result := metaDado.ObterTotalDados;
    end;
end;

procedure TBloco.RemoverMetadadoPorNomeCampo(NomeCampo: string);
var
    i, j: integer;
    meta: TMetaDado;
    dado: TDado;
begin
    for i := 0 to Self.ObterTotalMetadados - 1 do
    begin
        meta := Self.MetaDados[i];
        if meta.NomeCampo = NomeCampo then
        begin
            Self.FMetaDados.delete(i);
            for j := 0 to meta.ObterTotalDados - 1 do
            begin
                dado := meta.Dados[j];
                meta.FDados.delete(j);
                FreeAndNil(dado);
            end;
            FreeAndNil(meta);
            exit;
        end;
    end;
end;

procedure TBloco.SetBlocos(index: integer; const Value: TBloco);
begin
    FBlocos[index] := Value;
end;

procedure TBloco.SetBlocosLimite(index: integer; const Value: string);
begin
    FBlocosLimite[index] := Value;
end;

procedure TBloco.SetDescricao(const Value: string);
begin
    FDescricao := Value;
end;

procedure TBloco.SetExcecao(const Value: boolean);
begin
    FExcecao := Value;
end;

procedure TBloco.SetMetaDados(index: integer; const Value: TMetaDado);
begin
    FMetaDados[index] := Value;
end;

procedure TBloco.SetNome(const Value: string);
begin
    FNome := Value;
end;

procedure TBloco.SetSeparadorBloco(const Value: string);
begin
    FSeparadorBloco := Value;
end;

procedure TBloco.SetTabela(const Value: string);
begin
    FTabela := Value;
end;

procedure TBloco.SetTamanho(const Value: integer);
begin
    FTamanho := Value;
end;

procedure TBloco.SetTipoBloco(const Value: TTipoBloco);
begin
    FTipoBloco := Value;
end;

function TBloco.TemBlocosLimite: boolean;
begin
    result := Self.BlocosLimiteCount > 0;
end;

function TBloco.ObterTotalBlocoContinuacao: integer;
var
    bloco: TBloco;
    i: integer;
begin
    result := 0;
    for i := 0 to Self.ObterTotalBlocosFilhos - 1 do
    begin
        bloco := Self.Blocos[i];
        if bloco.TipoBloco = BlocoAgrupador then
            result := result + bloco.ObterTotalBlocoContinuacao;

        if bloco.TipoBloco = BlocoContinuacao then
            result := result + 1
    end;
end;

function TBloco.ObterTotalBlocosFilhos: integer;
begin
    result := FBlocos.Count;
end;

function TBloco.ObterTotalMetadados: integer;
begin
    result := FMetaDados.Count;
end;

procedure TBloco.AdicionarMetaDado(Inicio, Tamanho: integer; NomeCampo: string; Descricao: string; TipoRestricao: TTipoRestricao);
begin
    Self.AdicionarMetaDado(Inicio, Tamanho, Numerico, NomeCampo, Descricao, 2, TipoRestricao, '');
end;

procedure TBloco.AdicionarMetaDado(Inicio, Tamanho: integer; TipoDado: TTipoDado; NomeCampo, Descricao: string);
begin
    Self.AdicionarMetaDado(Inicio, Tamanho, TipoDado, NomeCampo, Descricao, 2, Normal, '');
end;

procedure TBloco.AdicionarMetaDado(Inicio, Tamanho: integer; NomeCampo, Descricao: string; CasaDecimal: integer);
begin
    Self.AdicionarMetaDado(Inicio, Tamanho, Real, NomeCampo, Descricao, CasaDecimal, Normal, '');
end;

procedure TBloco.AdicionarMetaDado(NomeCampo, Descricao, ValorDefault: string);
begin
    Self.AdicionarMetaDado(0, 0, Texto, NomeCampo, Descricao, 2, Normal, ValorDefault);
end;

procedure TBloco.AdicionarBlocoLimite(blocoLimite: string);
begin
    FBlocosLimite.Add(blocoLimite);
end;

procedure TBloco.AdicionarMetaDado(metaDado: TMetaDado);
begin
    FMetaDados.Add(metaDado);
end;

function TBloco.BlocosLimiteCount: integer;
begin
    result := FBlocosLimite.Count;
end;

{ TMetaDado }

procedure TMetaDado.AdicionarDados(Linha: integer; Chave, Valor: string; LinhaPai: integer);
var
    dado: TDado;
begin
    dado := TDado.Create;
    dado.Linha := Linha;
    dado.Chave := Chave;
    dado.Valor := Valor;
    dado.LinhaPai := LinhaPai;
    Self.FDados.Add(dado);
end;

procedure TMetaDado.CopiarDados(metaDado: TMetaDado);
var
    i: integer;
    dado: TDado;
begin
    for i := 0 to Self.ObterTotalDados - 1 do
    begin
        dado := Self.Dados[i];
        metaDado.AdicionarDados(dado.Linha, dado.Chave, dado.Valor, dado.LinhaPai);
    end;
end;

constructor TMetaDado.Create;
begin
    FDados := TList.Create;
end;

destructor TMetaDado.Destroy;
begin
    FreeAndNil(FDados);
    inherited;
end;

function TMetaDado.GetDados(index: integer): TDado;
begin
    result := TDado(FDados[index]);
end;

function TMetaDado.GetPersistivel: boolean;
begin
    if Self.NomeCampo = EmptyStr then
        result := false
    else
        result := true;
end;

procedure TMetaDado.SetCasaDecimal(const Value: integer);
begin
    FCasaDecimal := Value;
end;

procedure TMetaDado.SetDados(index: integer; const Value: TDado);
begin
    FDados[index] := Value;
end;

procedure TMetaDado.SetDescricao(const Value: string);
begin
    FDescricao := Value;
end;

procedure TMetaDado.SetTamanho(const Value: integer);
begin
    FTamanho := Value;
end;

procedure TMetaDado.SetInicio(const Value: integer);
begin
    FInicio := Value;
end;

procedure TMetaDado.SetNomeCampo(const Value: string);
begin
    FNomeCampo := Value;
end;

procedure TMetaDado.SetTipoDado(const Value: TTipoDado);
begin
    FTipoDado := Value;
end;

procedure TMetaDado.SetTipoRestricao(const Value: TTipoRestricao);
begin
    FTipoRestricao := Value;
end;

procedure TMetaDado.SetValorDefault(const Value: string);
begin
    FValorDefault := Value;
end;

function TMetaDado.ObterTotalDados: integer;
begin
    result := FDados.Count;
end;

{ TDado }

procedure TDado.Setchave(const Value: string);
begin
    Fchave := Value;
end;

procedure TDado.Setlinha(const Value: integer);
begin
    Flinha := Value;
end;

procedure TDado.SetLinhaPai(const Value: integer);
begin
    FLinhaPai := Value;
end;

procedure TDado.Setvalor(const Value: string);
begin
    Fvalor := Value;
end;

{ TArquivo }

function TArquivo.AcharPalavra(const SubStr, Str: WideString; posicao: integer): integer;
var
    SubLen, SrcLen, Len, i, j: integer;
    C1: WideChar;
    encontrou: integer;
begin
    result := 0;
    if (Pointer(SubStr) = nil) or (Pointer(Str) = nil) then
        exit;
    SrcLen := length(Str);
    SubLen := length(SubStr);
    if (SubLen <= 0) or (SrcLen <= 0) or (SrcLen < SubLen) then
        exit;
    Len := SrcLen - SubLen + 1;
    C1 := PWideChar(SubStr)[0];
    encontrou := 0;
    for i := 0 to Len - 1 do
    begin
        if PWideChar(Str)[i] = C1 then
        begin
            result := i + 1;
            for j := 1 to SubLen - 1 do
            begin
                if PWideChar(Str)[i + j] <> PWideChar(SubStr)[j] then
                begin
                    result := 0;
                    break;
                end;
            end;
            if result <> 0 then
            begin
                encontrou := encontrou + 1;
                if encontrou <> posicao then
                begin
                    result := 0;
                    Continue;
                end
                else
                    exit;
            end;
        end;
    end;
end;

function TArquivo.ContarCaracter(Texto: string; caracter: Char): integer;
var
    i: integer;
begin
    result := 0;
    for i := 0 to length(Texto) do
        if Texto[i] = trim(caracter) then
            result := result + 1;
end;

function TArquivo.ObterPorParametro(Str: WideString; posicao: integer; separador: string): string;
var
    x: integer;
    y: integer;
    aux: WideString;
    retorno: string;
begin
    x := 1;
    aux := Str;
    for y := 1 to length(Str) do
    begin
        if aux[y] = separador then
            x := x + 1;

        if (x = posicao) and (aux[y] <> separador) then
            retorno := retorno + aux[y];
    end;
    result := retorno;
end;

procedure TArquivo.AdicionarBloco(bloco: TBloco);
begin
    Self.BlocoPrincipal.AdicionarBloco(bloco);
end;

destructor TArquivo.Destroy;
begin
    FreeAndNil(FBloco);
end;

function TArquivo.ExecutarConsulta(conexao: TADOConnection; query: WideString): TADOQuery;
var
    qry: TADOQuery;
begin
    try
        try
            qry := TADOQuery.Create(nil);
            qry.Connection := conexao;
            qry.sql.Clear;
            qry.sql.Add(query);
            qry.Open;
            result := qry;
        except
            on e: Exception do
            begin
                raise Exception.Create('Erro executar a query: ' + #13 + query + #13 + e.Message);
                if qry <> nil then
                    FreeAndNil(qry);
                result := nil
            end;
        end;
    finally

    end;
end;

constructor TArquivo.Create(Diretorio, usuario: string; Producao: boolean = false);
begin
    FDiretorio := Diretorio;
    FProducao := Producao;
    FBloco := TBloco.Create;
end;

procedure TArquivo.SetArquivo(const Value: WideString);
begin
    FArquivo := Value;
end;

procedure TArquivo.SetBloco(const Value: TBloco);
begin
    FBloco := Value;
end;

procedure TArquivo.SetProducao(const Value: boolean);
begin
    FProducao := Value;
end;

procedure TArquivo.ValidarCaracteresArquivo;
const
    caracteresValidos = 'ABCDEFGHIJKLMNOPQRSTUVXYWZ.,:;/\*-+=!(){}[]#@%$_0123456789 ';
var
    i: integer;
    retorno: WideString;
begin
    if trim(Self.Arquivo) = EmptyStr then
        exit;
    for i := 0 to length(Self.Arquivo) do
    begin
        if Pos(Self.Arquivo[i], caracteresValidos) > 0 then
            retorno := retorno + Self.Arquivo[i]
        else
            retorno := retorno + ' ';
    end;
    Self.FArquivo := retorno;
end;

{ TArquivoRemessa }

procedure TArquivoRemessa.GerarArquivo;
begin

end;

end.
