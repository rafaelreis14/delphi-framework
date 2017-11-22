unit Lib.Biblioteca;

interface

uses
    DbClient, Data.DB, SysUtils, WinSock, Classes, Generics.Collections,
    RTTI, Vcl.Forms, System.StrUtils,
    ComObj, ActiveX, Lib.Persistable, Lib.Enumeradores, Lib.Parametro, RegularExpressions,
    Lib.VersionInfo, Lib.Erro, Dal.ControleDados;

type

    TVarAmbiente = (vaUsuarioWindows, vaServidorTS, vaClienteTS);

    Tlib = class
    private
        class function VarAmbiente(const pNome: string): string;
        class function ConverterTipoGenerico<ReturnT>(const Value): ReturnT;
    public
    class var
        Tipo: string;
        Mobile: boolean;
        FormMensagem: TFormClass;
        FormFiltro: TFormClass;
        FormAutorizacao: TFormClass;
        FormTrocaSenha: TFormClass;

    const
        Key: string = 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';

        class function ValidaXML(pXML: AnsiString): AnsiString; static;
        class function ConverteXMLToCharacterUpper(pCampo: Widestring): Widestring; static;
        class function ConverteCharacterToXML(pCampo: Widestring): Widestring; static;
        class function ConverteXMLToCharacter(pCampo: Widestring): Widestring; static;
        class function ResolveIP(HostName: string): string; static;
        class function ResolveHost(IP: string): string; static;
        class function StreamToString(Stream: TStream): string; static;
        class function Desencriptar(const valor: String): String; static;
        class function Encriptar(const valor: String): String; static;

        /// <summary>
        /// Retonar os IDs separados por virgula de uma lista qualquer. Ex: 01,02,03,04
        /// </summary>
        class function RetornarIDs(lista: TList; propriedade: string): string; static;

        /// <summary>
        /// Replica caracteres
        /// </summary>
        class function ReplicaCarateres(pCaracter: Char; pQuantidade: integer): String;

        /// <summary>
        /// Conta quantos caracteres possui em uma string
        /// </summary>
        class function ContarCaracter(psTexto: string; pcChar: Char): integer; static;

        /// <summary>
        /// Valida Caracteres Invalidos
        /// </summary>
        class function ValidarCaracteresInvalidos(expressao: string): boolean; static;

        /// <summary>
        /// Verifica se o sistema est� em mode debug
        /// </summary>
        class function SistemaEstaEmModoDebug: boolean;

        /// <summary>
        /// Retorna uma string com zeros a esquerda
        /// </summary>
        /// <param name="quantidade">
        /// quantidade de zeros a esquerda desejado
        /// </param>
        /// <param name="numero">
        /// numero inteiro
        /// </param>
        class function ColocarZeroEsquerda(tamanhoNumero: integer; numero: string): string;

        /// <summary>
        /// Func�o para convers�o simples de Data para string
        /// </summary>
        class function DataString(pData, pTipo: string): string; deprecated;

        /// <summary>
        /// Converte a data do sistema (yyyymmdd) para dateTime
        /// </summary>
        class function DataSistemaParaDateTime(dataSistema: string): TDateTime;

        /// <summary>
        /// incrementa a data
        /// </summary>
        /// <param name="data">
        /// data desejada em string(data formato YYYYMMDD) ou tdatetime
        /// </param>
        /// <param name="dias">
        /// quantidade de dias incrementado
        /// </param>
        class function IncrementaData<T>(Data: T; dias: integer): T; overload;
        class function IncrementaData(Data: string; dias: integer): TDateTime; overload; deprecated;

        /// <summary>
        /// Verifica se a data � uma data v�lida
        /// </summary>
        /// <param name="data">
        /// data desejada
        /// </param>
        class function ValidaData(Data: string): boolean; overload;

        /// <summary>
        /// Func�es para convers�es simples de�Boolean para string
        /// </summary>
        function StringToBoolean(pValor: string): boolean;

        function BooleanToString(pValor: boolean): string;

        /// <summary>
        /// Fun��o para apresentar uma mensagem de Advert�ncia
        /// </summary>
        /// <param name="pTexto">
        /// Mensagem
        /// </param>
        /// <param name="pCaption">
        /// Titulo da Janela de mensagem
        /// </param>
        /// <param name="pMobile">
        /// Mensagem para M�bile - True or False
        /// </param>
        class procedure MensagemAdvertencia(texto: string; caption: string = 'Aviso');

        /// <summary>
        /// Fun��o para apresentar uma mensagem de Erro
        /// </summary>
        /// <param name="pTexto">
        /// Mensagem
        /// </param>
        /// <param name="pErro">
        /// Erro enviado pela exce��o
        /// </param>
        /// <param name="pCaption">
        /// Titulo da Janela de mensagem
        /// </param>
        /// <param name="pMobile">
        /// Mensagem para M�bile - True or False
        /// </param>
        class procedure MensagemErro(descricao, Erro: string; titulo: string = 'Erro');

        /// <summary>
        /// Fun��o para apresentar uma mensagem de Advert�ncia
        /// </summary>
        /// <param name="pTexto">
        /// Mensagem
        /// </param>
        /// <param name="pCaption">
        /// Titulo da Janela de mensagem
        /// </param>
        /// <param name="pFlags">
        /// Retorno da mensagem
        /// </param>
        /// <param name="pMobile">
        /// Mensagem para M�bile - True or False
        /// </param>
        class function MensagemPergunta(texto, caption: string; flags: integer = 0; focoBotaoSim: boolean = false): integer; static;

        /// <summary>
        /// Fun��o para apresentar uma mensagem de informa��o
        /// </summary>
        /// <param name="pTexto">
        /// Mensagem
        /// </param>
        /// <param name="pCaption">
        /// Titulo da Janela de mensagem
        /// </param>
        /// <param name="pFlags">
        /// Retorno da mensagem
        /// </param>
        /// <param name="pMobile">
        /// Mensagem para M�bile - True or False
        /// </param>
        class procedure MensagemInformacao(texto: string; caption: string = 'Informa��o');

        /// <summary>
        /// ImputBox, para capturar alguma informa��o do usu�rio
        /// </summary>
        class function MensagemCaixaEntrada<T>(texto, caption: string; tipoInformcao: TMaskTypes): T; static;

        /// <summary>
        /// Fun��o para grava��o de N�mero
        /// </summary>
        /// <param name="pValor">
        /// Valor a serv gravado
        /// </param>
        /// <param name="pSeparador">
        /// Separador utilizado na grava��o
        /// </param>
        class function GravaNumeros(pValor, pSeparador: string): string; static;

        /// <summary>
        /// Fun��o desenvolvida para centralizar o arredondamento de valores.
        /// </summary>
        /// <param name="valor">
        /// Passar o n�mero/valor sem nenhum tipo de arredondamento.
        /// </param>
        class function ArredondarNumero(valor: Currency): Currency;

        /// <summary>
        /// Fun��o que retorna um valor a partir de uma posi��o e separador
        /// </summary>
        /// <param name="pString">
        /// Valor avaliado
        /// </param>
        /// <param name="pPosicao">
        /// Posi��o inicial para c�pia
        /// </param>
        /// <param name="pSep">
        /// Delimiotador da c�pia
        /// </param>
        class function ObterPorParametro(pString: Widestring; pPosicao, pSep: string): string; static;

        /// <summary>
        /// Fun��o para obter variav�s de ambiente do sistema operacional
        /// </summary>
        /// <param name="pVarAmbiemte">
        /// Nome da Vari�vel a ser recuperada
        /// </param>
        class function ObterVarAmbiente(pVarAmbiemte: TVarAmbiente): string;

        /// <summary>
        /// Fun��o para obter o IP da esta��o de trabalho
        /// </summary>
        class function ObterIP: string; static;

        /// <summary>
        /// Retorna a vers�o do sistema
        /// </summary>
        class function ObterVersao: string; static;

        class function ObterVersaoAutorizadaServidor: string; static;

        /// <summary>
        /// Fun��o para obter o Nome do Host da esta��o de trabalho
        /// </summary>
        class function ObterNomeComputador: string;

        /// <summary>
        /// Fun��o para obter o Nome do sistema
        /// </summary>
        class function ObterNomeSistema: string;


        /// <summary>
        /// Obtem a data atual do sistema
        /// </summary>
        class function ObterDataAtual: string; overload; static;

        /// <summary>
        /// Obtem a data atual do sistema
        /// </summary>
        /// <param name="formato">
        /// y = ano, m = mes, d = dia - ex: yyyymmdd
        /// </param>
        class function ObterDataAtual(formato: string): string; overload; static;

        /// <summary>
        /// Obtem a hora atual do sistema
        /// </summary>
        class function ObterHoraAtual: string; overload; static;

        /// <summary>
        /// Obtem a hora atual do sistema
        /// </summary>
        /// <param name="formato">
        /// formato ex: hh:mm
        /// </param>
        class function ObterHoraAtual(formato: string): string; overload; static;

        /// <summary>
        /// Fun��o para abrir formulario do sistema
        /// </summary>
        /// <param name="form">
        /// Qualquer formulario herdado de UntFormbase
        /// </param>
        class function AbrirFormulario(form: TFormClass): TRetornoFormulario; overload;

        /// <summary>
        /// Fun��o para abrir formulario do sistema
        /// </summary>
        /// <param name="form">
        /// Qualquer formulario herdado de UntFormbase
        /// </param>
        /// <param name="objeto">
        /// Objeto
        /// </param>
        class function AbrirFormulario(form: TFormClass; objeto: TObject): TRetornoFormulario; overload;

        /// <summary>
        /// Fun��o para abrir formulario do sistema
        /// </summary>
        /// <param name="form">
        /// Qualquer formulario herdado de UntFormbase
        /// </param>
        /// <param name="statusJanela">
        /// a��o da janela
        /// </param>
        class function AbrirFormulario(form: TFormClass; acaoJanela: TAcaoJanela): TRetornoFormulario; overload;

        /// <summary>
        /// Fun��o para abrir formulario do sistema
        /// </summary>
        /// <param name="form">
        /// Qualquer formulario herdado de UntFormbase
        /// </param>
        /// <param name="acaoJanela">
        /// A��o da janela
        /// </param>
        /// <param name="objeto">
        /// Objeto
        /// </param>
        /// <param name="statusJanela">
        /// a��o da janela
        /// </param>
        class function AbrirFormulario(form: TFormClass; acaoJanela: TAcaoJanela; objeto: TObject): TRetornoFormulario; overload;

        /// <summary>
        /// If tern�rio
        /// </summary>
        /// <param name="condicao">
        /// condi��o a ser analizada
        /// </param>
        /// <param name="verdadeiro">
        /// valor retornado caso a condi��o seja verdadeira
        /// </param>
        /// <param name="falso">
        /// valor retornado caso a condi��o seja falsa
        /// </param>
        class function IfTernario(condicao: boolean; verdadeiro, falso: variant): variant; static;

        /// <summary>
        /// Libera listas da mem�ria
        /// </summary>
        class procedure LiberarListaMemoria(lista: TList); static;

        /// <summary>
        /// retirar acentos de� uma string
        /// </summary>
        class function RetirarAcentos(texto: string): string;

        /// <summary>
        /// Fun��o para encapsular o tratamento de erro da aplica��o
        /// </summary>
        /// <param name="Sender">
        /// Objeto que�gerou o erro
        /// </param>
        /// <param name="E">
        /// Objeto que encapsula�o erro
        /// </param>
        class procedure TrataErro(Sender: TObject; E: Exception);

        /// <summary>
        /// M�todo que quebra uma string em uma lista de string
        /// </summary>
        /// <param name="Delimiter">
        /// delimitador que separa a string
        /// </param>
        /// <param name="Value">
        /// string que ser� separada
        /// </param>
        procedure Split(const Delimiter: Char; Value: string; const Strings: TStrings);

        /// <summary>
        /// M�todo que verifica se existe subtextos dentro de um texto
        /// </summary>
        /// <param name="texto">
        /// texto a ser verificado
        /// </param>
        /// <param name="subTextos">
        /// subtextos separados por um delimitador  Ex: CIMENTO%%%CAl
        /// </param>
        /// <param name="delimitador">
        /// delimitador
        /// </param>
        class function AcharSubTextosEmUmTexto(texto, subTextos, delimitador: string): boolean;

        class function SomenteNumeros(num: variant): variant;

        class function CriaInstancia<T: Class>: T; static;

    type
        Parametro = class(TParametro)
        end;
    end;

implementation

uses XMLIntf, Winapi.Windows, Vcl.Dialogs, Framework.UI.MensagemBase,
    System.UITypes, XML.XMLDoc,
    System.TypInfo, Framework.UI.FormBase, Lib.Base,
    System.Variants;

{$REGION 'Metodos Eletivos a permanecerem'}

class function Tlib.ResolveIP(HostName: string): string;
var
    WSData: TWSAData;
    HostEnt: PHostEnt;
begin
    Result := '';
    if WSAStartup($101, WSData) = 0 then
    begin
        HostEnt := WinSock.gethostbyname(PAnsiChar(AnsiString(HostName)));
        if HostEnt <> nil then
        begin
            Result := Format('%d.%d.%d.%d', [Byte(HostEnt^.h_addr^[0]), Byte(HostEnt^.h_addr^[1]), Byte(HostEnt^.h_addr^[2]),
              Byte(HostEnt^.h_addr^[3])]);
        end;
        WSACleanup;
    end;
end;

class function Tlib.ResolveHost(IP: string): string;
var
    WSData: TWSAData;
    SockAddrIn: TSockAddrIn;
    HostEnt: PHostEnt;
begin
    Result := '';
    if WSAStartup($101, WSData) = 0 then
    begin
        SockAddrIn.sin_addr.S_addr := inet_addr(PAnsiChar(AnsiString(IP)));
        HostEnt := WinSock.GetHostByAddr(@SockAddrIn.sin_addr.S_addr, SizeOf(SockAddrIn.sin_addr.S_addr), AF_INET);
        if HostEnt <> nil then
        begin
            Result := StrPas(HostEnt^.h_name);
            // ShowMessage(Result);
        end;
        WSACleanup;
    end;
end;

class function Tlib.ObterNomeComputador: string;
const
    cnMaxComputerNameLen = 254;
var
    sComputerName: string;
    dwComputerNameLen: DWord;
begin
    dwComputerNameLen := cnMaxComputerNameLen - 1;
    SetLength(sComputerName, cnMaxComputerNameLen);
    GetComputerName(PChar(sComputerName), dwComputerNameLen);
    SetLength(sComputerName, dwComputerNameLen);
    Result := sComputerName;
end;

class function Tlib.ObterNomeSistema: string;
begin
    result := 'SIATD.4'
end;

class function Tlib.VarAmbiente(const pNome: string): string;
var
    BufSize: integer;
begin
    BufSize := GetEnvironmentVariable(PChar(pNome), nil, 0);
    if BufSize > 0 then
    begin
        SetLength(Result, BufSize - 1);
        GetEnvironmentVariable(PChar(pNome), PChar(Result), BufSize);
    end
    else
        Result := '';
end;

class function Tlib.ObterVarAmbiente(pVarAmbiemte: TVarAmbiente): string;
begin
    case pVarAmbiemte of
        vaUsuarioWindows:
            Result := Trim(VarAmbiente('USERNAME'));
        vaServidorTS:
            Result := Trim(VarAmbiente('COMPUTERNAME'));
        vaClienteTS:
            Result := Trim(VarAmbiente('CLIENTNAME'));
    end;

end;

class function Tlib.ObterDataAtual: string;
begin
    Result := ObterDataAtual('yyyymmdd')
end;

class function Tlib.ObterDataAtual(formato: string): string;
var
    query: string;
    dataSet: TClientDataSet;
    Dal: TControleDados<TClientDataSet, TDataSetDAO>;
begin
    try
        Dal := TControleDados<TClientDataSet, TDataSetDAO>.Create;

        query := 'SELECT FORMAT(GETDATE(),''dd/MM/yyyy'') DATA';
        dataSet := Dal.Consultar(query, nil);
        Result := FormatDateTime(formato, dataSet.FieldByName('DATA').AsDateTime);
    finally
        if Dal <> nil then
            FreeAndNil(Dal);

        if dataSet <> nil then
            FreeAndNil(dataSet);
    end;
end;


class function Tlib.ObterHoraAtual: string;
begin
    Result := ObterHoraAtual('hh:mm');
end;

class function Tlib.ObterHoraAtual(formato: string): string;
var
    hora: string;
    dataSet: TClientDataSet;
    query: string;
    Dal: TControleDados<TClientDataSet, TDataSetDAO>;
begin
    try
        Dal := TControleDados<TClientDataSet, TDataSetDAO>.Create;
        query := 'SELECT FORMAT(GETDATE(),''hh:mm:ss'') HORA';
        dataSet := Dal.Consultar(query, nil);
        hora := dataSet.FieldByName('HORA').AsString;
        Result := FormatDateTime(formato, StrToTime(hora));
    finally
        if Dal <> nil then
            FreeAndNil(Dal);

        if dataSet <> nil then
            FreeAndNil(dataSet);
    end;
end;

class function Tlib.Encriptar(Const valor: String): String;
var

    KeyLen: integer;
    KeyPos: integer;
    OffSet: integer;
    Dest: String;
    SrcPos: integer;
    SrcAsc: integer;
    TmpSrcAsc: integer;
    Range: integer;
begin
    Dest := '';
    KeyLen := Length(Key);
    KeyPos := 0;
    SrcPos := 0;
    SrcAsc := 0;
    Range := 256;
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(valor) do
    begin
        Application.ProcessMessages;
        SrcAsc := (Ord(valor[SrcPos]) + OffSet) Mod 255;
        if KeyPos < KeyLen then
            KeyPos := KeyPos + 1
        else
            KeyPos := 1;

        SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
        Dest := Dest + Format('%1.2x', [SrcAsc]);
        OffSet := SrcAsc;
    end;

    Result := Dest;
end;

class function Tlib.Desencriptar(Const valor: String): String;
var
    KeyLen: integer;
    KeyPos: integer;
    OffSet: integer;
    Dest: String;
    SrcPos: integer;
    SrcAsc: integer;
    TmpSrcAsc: integer;
    Range: integer;
begin
    Dest := '';
    KeyLen := Length(Key);
    KeyPos := 0;
    SrcPos := 0;
    SrcAsc := 0;
    Range := 256;

    OffSet := StrToInt('$' + copy(valor, 1, 2));
    SrcPos := 3;
    repeat
        SrcAsc := StrToInt('$' + copy(valor, SrcPos, 2));
        if (KeyPos < KeyLen) Then
            KeyPos := KeyPos + 1
        else
            KeyPos := 1;
        TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
        if TmpSrcAsc <= OffSet then
            TmpSrcAsc := 255 + TmpSrcAsc - OffSet
        else
            TmpSrcAsc := TmpSrcAsc - OffSet;
        Dest := Dest + Chr(TmpSrcAsc);
        OffSet := SrcAsc;
        SrcPos := SrcPos + 2;
    until (SrcPos >= Length(valor));
    Result := Dest;
end;

class function Tlib.ObterIP: string;
var
    WSAData: TWSAData;
    HostEnt: PHostEnt;
    Name: string;
begin
    WSAStartup(2, WSAData);
    SetLength(Name, 255);
    Gethostname(PAnsiChar(Name), 255);
    SetLength(Name, StrLen(PAnsiChar(Name)));
    HostEnt := gethostbyname(PAnsiChar(Name));
    with HostEnt^ do
    begin
        Result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);
    end;
    WSACleanup;
end;

class function Tlib.ObterVersao: string;
var
    verInf: tVersionInfo;
begin
    Result := '';
    verInf := tVersionInfo.Create(Application.ExeName);
    try
        Result := verInf.GetVerValue('FileVersion');
    finally
        if verInf <> nil then
            FreeAndNil(verInf);
    end;


    // var
    // VerInfoSize: DWord;
    // VerInfo: Pointer;
    // VerValueSize: DWord;
    // VerValue: PVSFixedFileInfo;
    // Dummy: DWord;
    // V1, V2, V3, V4: Word;
    // Prog, ultimo: string;
    // begin
    // Prog := Application.Exename;
    // VerInfoSize := GetFileVersionInfoSize(PChar(Prog), Dummy);
    // GetMem(VerInfo, VerInfoSize);
    // GetFileVersionInfo(PChar(Prog), 0, VerInfoSize, VerInfo);
    // VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
    // with VerValue^ do
    // begin
    // V1 := dwFileVersionMS shr 16;
    // V2 := dwFileVersionMS and $FFFF;
    // V3 := dwFileVersionLS shr 16;
    // V4 := dwFileVersionLS and $FFFF;
    // end;
    // FreeMem(VerInfo, VerInfoSize);
    // ultimo := Copy('100' + IntToStr(V4), 4, 2);
    //
    // Result := Copy('100' + IntToStr(V1), 4, 2) + '.' + Copy('100' + IntToStr(V2), 4, 2) + '.' + Copy('100' + IntToStr(V3), 4, 2) + '.' +
    // Copy('100' + IntToStr(V4), 4, 2);

end;

class function Tlib.ObterVersaoAutorizadaServidor: string;
var
    verInf: tVersionInfo;
begin
    Result := '';
    verInf := tVersionInfo.Create(Application.ExeName);
    try
        Result := verInf.GetVerValue('ServerVersionAllowed');
    finally
        if verInf <> nil then
            FreeAndNil(verInf);
    end;
end;

function Tlib.StringToBoolean(pValor: string): boolean;
begin
    if pValor = 'S' then
        Result := True
    else if pValor = 'N' then
        Result := false;
end;

class function Tlib.AbrirFormulario(form: TFormClass): TRetornoFormulario;
begin
    Result := AbrirFormulario(form, acNenhumaAcao, nil);
end;

class function Tlib.AbrirFormulario(form: TFormClass; acaoJanela: TAcaoJanela): TRetornoFormulario;
begin
    Result := AbrirFormulario(form, acaoJanela, nil);
end;

// class function Tlib.AbrirFormulario(form: TFormClass; acaoJanela: TAcaoJanela; objeto: TObject): TRetornoFormulario;
// begin
// Result := AbrirFormulario(form, acaoJanela, objeto);
// end;

class function Tlib.AbrirFormulario(form: TFormClass; acaoJanela: TAcaoJanela; objeto: TObject): TRetornoFormulario;
var
    formulario: TFrmBase;
begin
    try
        Application.CreateForm(form, formulario);
        formulario.Position := poMainFormCenter;
        // formulario.parametros := parametros;
        formulario.objeto := objeto;
        formulario.acaoJanela := acaoJanela;
        formulario.ShowModal;
        Result := formulario.RetornoFormulario;
    finally
        FreeAndNil(formulario);
    end;
end;

class function Tlib.AbrirFormulario(form: TFormClass; objeto: TObject): TRetornoFormulario;
begin
    Result := AbrirFormulario(form, acNenhumaAcao, objeto);
end;

function Tlib.BooleanToString(pValor: boolean): string;
begin

    if pValor = True then
        Result := 'S'
    else if pValor = false then
        Result := 'N';
end;

class function Tlib.DataSistemaParaDateTime(dataSistema: string): TDateTime;
begin
    try
        Result := strtodate(copy(dataSistema, 7, 2) + '/' + copy(dataSistema, 5, 2) + '/' + copy(dataSistema, 1, 4))
    except
        raise Exception.Create('Data inv�lida');
    end;
end;

class function Tlib.DataString(pData, pTipo: string): string;
var
    cAuxData: string;
    cAux: string;
    nAux: integer;
begin
    cAux := pData;
    cAuxData := '';
    if Length(cAux) > 0 then
    begin
        for nAux := 1 to 10 do
            if StrToIntDef(cAux[nAux], -1) <> -1 then
                cAuxData := cAuxData + cAux[nAux];
        cAux := cAuxData;
        cAuxData := '';
        if pTipo = 'S' then
            cAuxData := copy(cAux, 5, 4) + copy(cAux, 3, 2) + copy(cAux, 1, 2);
        // --> AAAAMMDD
        if pTipo = 'D' then
            cAuxData := copy(cAux, 7, 2) + copy(cAux, 5, 2) + copy(cAux, 1, 4);
        // --> DDMMAAAA
        if pTipo = 'ME' then
            cAuxData := copy(cAux, 1, 2) + copy(cAux, 3, 2) + copy(cAux, 5, 4);
        // --> DDMMAAAA formatando para mask edit
        if pTipo = 'DF' then
            cAuxData := copy(cAux, 7, 2) + '/' + copy(cAux, 5, 2) + '/' + copy(cAux, 1, 4);
        // --> Data Formatada com barras //--> AAAA/MM/DD
        if pTipo = 'DF' then
            cAuxData := copy(cAux, 1, 2) + '/ ' + copy(cAux, 3, 2) + '/' + copy(cAux, 5, 4); // --> Formatada padr�o Windows //--> DD/MM/AAAA
        if pTipo = 'AR/' then
            cAuxData := copy(cAux, 1, 2) + '/' + copy(cAux, 3, 2) + '/' + copy(cAux, 7, 2); // --> Data com ano reduzido //--> DD/MM/AA
        if pTipo = 'AR' then
            cAuxData := copy(cAux, 1, 2) + copy(cAux, 3, 2) + copy(cAux, 7, 2);
        // --> Data com ano reduzido //--> DDMMAA
    end;
    Result := cAuxData;
end;

class function Tlib.ConverteCharacterToXML(pCampo: Widestring): Widestring;
var
    texto: string;
begin
    texto := StringReplace(pCampo, '&', '&amp;', [rfReplaceAll]);
    texto := StringReplace(texto, '<', '&lt;', [rfReplaceAll]);
    texto := StringReplace(texto, '>', '&gt;', [rfReplaceAll]);
    texto := StringReplace(texto, '''', '&apos;', [rfReplaceAll]);
    texto := StringReplace(texto, '"', '&quot;', [rfReplaceAll]);
    Result := texto;
end;

class function Tlib.ConverteXMLToCharacter(pCampo: Widestring): Widestring;
var
    texto: string;
begin
    texto := StringReplace(pCampo, '&amp;', '&', [rfReplaceAll]);
    texto := StringReplace(texto, '&lt;', '<', [rfReplaceAll]);
    texto := StringReplace(texto, '&gt;', '>', [rfReplaceAll]);
    texto := StringReplace(texto, '&apos;', '''', [rfReplaceAll]);
    texto := StringReplace(texto, '&quot;', '"', [rfReplaceAll]);
    Result := texto;
end;

class function Tlib.ConverteXMLToCharacterUpper(pCampo: Widestring): Widestring;
var
    texto: string;
begin
    texto := StringReplace(pCampo, '&AMP;', '&', [rfReplaceAll]);
    texto := StringReplace(texto, '&LT;', '<', [rfReplaceAll]);
    texto := StringReplace(texto, '&GT;', '>', [rfReplaceAll]);
    texto := StringReplace(texto, '&APOS;', '''', [rfReplaceAll]);
    texto := StringReplace(texto, '&QUOT;', '"', [rfReplaceAll]);
    Result := texto;
end;

class procedure Tlib.MensagemAdvertencia(texto, caption: string);
begin
    try
        Application.CreateForm(FormMensagem, frmMensagemBase);
        frmMensagemBase.ConfigurarTela(caption, texto, '', MSGAdvertencia);
        frmMensagemBase.ShowModal;
    finally
        FreeAndNil(frmMensagemBase);
    end;
end;

class procedure Tlib.MensagemErro(descricao, Erro, titulo: string);
begin
    try
        Application.CreateForm(FormMensagem, frmMensagemBase);
        frmMensagemBase.ConfigurarTela(titulo, descricao, Erro, MSGErro);
        frmMensagemBase.ShowModal;
    finally
        FreeAndNil(frmMensagemBase);
    end;
end;

class procedure Tlib.MensagemInformacao(texto, caption: string);
begin
    try
        Application.CreateForm(FormMensagem, frmMensagemBase);
        frmMensagemBase.ConfigurarTela(caption, texto, '', MSGInformacao);
        frmMensagemBase.ShowModal;
    finally
        FreeAndNil(frmMensagemBase);
    end;
end;

class function Tlib.ConverterTipoGenerico<ReturnT>(const Value): ReturnT;
begin
    Result := ReturnT(Value);
end;

class function Tlib.MensagemCaixaEntrada<T>(texto, caption: string; tipoInformcao: TMaskTypes): T;
var
    s: string;
    i: integer;
    d: double;
begin
    try
        Application.CreateForm(FormMensagem, frmMensagemBase);
        frmMensagemBase.ConfigurarTela(caption, texto, '', MSGCaixaEntrada, tipoInformcao);
        frmMensagemBase.ShowModal;
        if frmMensagemBase.ModalResult = mrYes then
        begin
            if TypeInfo(T) = System.TypeInfo(string) then
            begin
                s := frmMensagemBase.ValorRetorno;
                Result := ConverterTipoGenerico<T>(s);
            end
            else if TypeInfo(T) = System.TypeInfo(integer) then
            begin
                i := StrToIntDef(frmMensagemBase.ValorRetorno, 0);
                Result := ConverterTipoGenerico<T>(i);
            end
            else if TypeInfo(T) = System.TypeInfo(double) then
            begin
                d := StrToFloatDef(frmMensagemBase.ValorRetorno, 0);
                Result := ConverterTipoGenerico<T>(d)
            end
            else
            begin
                s := frmMensagemBase.ValorRetorno;
                Result := ConverterTipoGenerico<T>(s);
            end;
        end
        else if TypeInfo(T) = System.TypeInfo(string) then
            Result := ConverterTipoGenerico<T>(EmptyStr)
        else
        begin
            i := 0;
            Result := ConverterTipoGenerico<T>(i);
        end;

    finally
        FreeAndNil(frmMensagemBase);
    end;

end;

class function Tlib.MensagemPergunta(texto, caption: string; flags: integer; focoBotaoSim: boolean): integer;
begin
    try
        Application.CreateForm(FormMensagem, frmMensagemBase);
        frmMensagemBase.ConfigurarTela(caption, texto, '', MSGPergunta, mtString, focoBotaoSim);
        result := frmMensagemBase.ShowModal;
    finally
        FreeAndNil(frmMensagemBase);
    end;
end;

class function Tlib.RetirarAcentos(texto: String): String;
type
    USASCIIString = type AnsiString(20127);
var
    C: Char;
begin
    Result := '';
    for C in texto do
        Result := Result + String(USASCIIString(C));

end;

class function Tlib.RetornarIDs(lista: TList; propriedade: string): string;
var
    i: integer;
    context: TRttiContext;
    prop: TRttiProperty;
    text: string;
begin
    for i := 0 to lista.Count - 1 do
    begin
        prop := context.GetType(TObject(lista[i]).ClassType).GetProperty(propriedade);
        text := text + prop.GetValue(TObject(lista[i])).ToString + ',';
    end;
    delete(text, Length(text), 1);
    Result := text;
end;

class function Tlib.SistemaEstaEmModoDebug: boolean;
begin
    if DebugHook = 1 then
        Result := True
    else
        Result := false;
end;

class function Tlib.SomenteNumeros(num: variant): variant;
var
    nums: string;
    i: integer;
begin
    nums := VarToStr(num);
    Result := EmptyStr;
    for i := 1 to Length(nums) do
        if (nums[i] in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']) then
            Result := Result + nums[i];

end;

procedure Tlib.Split(const Delimiter: Char; Value: string; const Strings: TStrings);
begin
    Assert(Assigned(Strings));
    Strings.Clear;
    Strings.DelimitedText := Value;
    Strings.Delimiter := Delimiter;
end;

class function Tlib.AcharSubTextosEmUmTexto(texto, subTextos, delimitador: string): boolean;
var
    achouTodas: boolean;
    i: integer;
    lista: TStringList;
begin
    try
        achouTodas := True;
        lista := TStringList.Create;
        lista.QuoteChar := ' ';
        lista.DelimitedText := StringReplace(subTextos, delimitador, ' ', [rfReplaceAll]);
        for i := 0 to lista.Count - 1 do
            if Pos(lista[i], texto) = 0 then
            begin
                achouTodas := false;
                break;
            end;
        Result := achouTodas;
    finally
        if lista <> nil then
            FreeAndNil(lista);
    end;
end;

class function Tlib.ArredondarNumero(valor: Currency): Currency;
var
    valorString: String;
    valorNumerico: Currency;
begin
    valorString := FormatFloat('0.00', valor);
    valorNumerico := StrToFloat(valorString);
    Result := valorNumerico;
end;

class function Tlib.StreamToString(Stream: TStream): string;
var
    ms: TMemoryStream;
begin
    Result := '';
    ms := TMemoryStream.Create;
    try
        ms.LoadFromStream(Stream);
        SetString(Result, PChar(ms.memory), ms.Size);
    finally
        ms.Free;
    end;
end;

class function Tlib.ReplicaCarateres(pCaracter: Char; pQuantidade: integer): String;
begin
    Result := StringOfChar(pCaracter, pQuantidade);
end;

class function Tlib.ContarCaracter(psTexto: string; pcChar: Char): integer;
const
    MetaCaracter = '.*+?\^$|(){}[]';
var
    s: TRegEx;
begin
    if Pos(pcChar, MetaCaracter) > 0 then
        s := TRegEx.Create('(\' + pcChar + ')')
    else
        s := TRegEx.Create('(' + pcChar + ')');

    Result := s.Matches(psTexto).Count;
end;

class function Tlib.ValidarCaracteresInvalidos(expressao: string): boolean;
var
    s: TRegEx;
    match: TMatch;
    caracInvalido: string;
begin
    Result := True;
    s := TRegEx.Create('([^A-Z0-9.,:;/\\*-=!()@_ ])');

    if s.match(expressao).Success then
    begin
        for match in s.Matches(expressao) do
            caracInvalido := caracInvalido + match.Value + ' ';
        MensagemErro('Erro ao validar caracteres da expressao' + #13 + expressao, 'Esta express�o possui caracter(es) inv�lido(s)' + #13 +
          caracInvalido);
        Result := false;
    end;
end;

class function Tlib.ObterPorParametro(pString: Widestring; pPosicao, pSep: string): string;
var
    nx: integer;
    ny: integer;
    cAux: Widestring;
    cRetrun: Widestring;
begin
    nx := 1;
    cAux := pString;
    cRetrun := '';
    for ny := 1 to Length(pString) do
    begin
        if cAux[ny] = pSep then
        begin
            nx := nx + 1;
        end;
        if (nx = StrToIntDef(pPosicao, 1)) and (cAux[ny] <> pSep) then
            cRetrun := cRetrun + cAux[ny];
    end;
    Result := cRetrun;
end;

class function Tlib.ValidaData(Data: string): boolean;
begin
    try
        strtodate(Data);
        Result := True;
    except
        Result := false;
    end;
end;

class function Tlib.ValidaXML(pXML: AnsiString): AnsiString;
var
    XMLDocument: TXMLDocument;
    NoRetorno: IXMLNode;
    NoDataSet: IXMLNode;
    NoErro: IXMLNode;
begin
    try
        XMLDocument := TXMLDocument.Create(Application);
        XMLDocument.XML.text := Trim(pXML);
        XMLDocument.Active := True;
        NoRetorno := XMLDocument.ChildNodes.Nodes['Retorno'];
        NoDataSet := NoRetorno.ChildNodes.Nodes['DataSet'];
        NoErro := NoDataSet.ChildNodes['Erro'];
        if NoErro.HasAttribute('Mensagem') = True then
            raise Erro.Create(NoErro.Attributes['Mensagem']);
    finally
        FreeAndNil(XMLDocument);
    end;
end;

class function Tlib.GravaNumeros(pValor, pSeparador: string): string;
var
    cAux: string;
    cNumero: string;
    x: integer;
begin
    cAux := pValor;
    cNumero := '';
    // -> Formata o valor digitado em n�mero para grava��o no SQL
    for x := 1 to Length(cAux) do
    begin
        if ((cAux[x] <> '.') and (cAux[x] <> ',')) then
            cNumero := cNumero + cAux[x];
        if cAux[x] = ',' then
            cNumero := cNumero + pSeparador;
    end;
    Result := cNumero;
end;


class function Tlib.IfTernario(condicao: boolean; verdadeiro, falso: variant): variant;
begin
    if condicao then
        Result := verdadeiro
    else
        Result := falso;
end;

class function Tlib.ColocarZeroEsquerda(tamanhoNumero: integer; numero: string): string;
var
    quantidadeZeros: integer;
begin
    // Result := Format('%.' + IntToStr(quantidade + Length(VarToStr(numero))) + 'd', [numero]);

    quantidadeZeros := tamanhoNumero - Length(numero);
    Result := StringOfChar('0', quantidadeZeros) + numero;

end;

class function Tlib.IncrementaData(Data: string; dias: integer): TDateTime;
begin
    Result := strtodate(Data) + dias;
end;

class function Tlib.IncrementaData<T>(Data: T; dias: integer): T;
var
    str: string;
    dta: TDateTime;
begin
    if (TypeInfo(T) <> System.TypeInfo(string)) and (TypeInfo(T) <> System.TypeInfo(TDateTime)) then
        raise Exception.Create('String ou TdateTime');

    if TypeInfo(T) = System.TypeInfo(string) then
    begin
        dta := DataSistemaParaDateTime(ConverterTipoGenerico<string>(Data));
        str := FormatDateTime('YYYYMMDD', (dta + dias));
        Result := ConverterTipoGenerico<T>(str);
    end
    else if (TypeInfo(T) = System.TypeInfo(TDateTime)) then
    begin
        dta := ConverterTipoGenerico<TDateTime>(Data) + 1;
        Result := ConverterTipoGenerico<T>(dta);
    end;

end;

{$ENDREGION}
{$REGION 'Metodos a analisar'}

class procedure Tlib.LiberarListaMemoria(lista: TList);
// var
// i: integer;
begin
    // for i := 0 to lista.Count - 1 do
    // TObject(lista[i]).Free;

    // FreeAndNil(lista);
end;

class procedure Tlib.TrataErro(Sender: TObject; E: Exception);
var
    mensagem: string;
    mensagemPadrao: string;
begin
    mensagemPadrao := 'Ocorreu um erro inesperado ao executar uma opera��o do sistema.' + #13 +
      'Se o problema persistir entre em contato com a central de servi�os.';

    mensagem := E.Message;

    if not(E is Erro) then
    begin
        MensagemErro(mensagem, mensagemPadrao, 'Erro');
    end
    else
    begin
        if (E as Erro).TipoMensagem = MSGInformacao then
            MensagemInformacao(mensagem)
        else if (E as Erro).TipoMensagem = MSGAdvertencia then
            MensagemAdvertencia(mensagem)
        else
            MensagemErro(mensagem, mensagemPadrao);
        // tratamento para verificar se � erro de conex�o com o servidor socket
        if (E as Erro).CodigoErro = 10061 then // erro de comunica��o com servidor
        begin
            Application.Terminate;
            // DMCliente.ErroAoConectar := True;
        end;
    end;
end;

{$ENDREGION}
{$REGION 'Metodos foram pra a classe TBaseLib'}

class function Tlib.CriaInstancia<T>: T;
var
    valor: TValue;
    ctx: TRttiContext;
    Tipo: TRttiType;
    metodo: TRttiMethod;
    tipoInstancia: TRttiInstanceType;
begin
    Tipo := ctx.GetType(TypeInfo(T));
    metodo := Tipo.GetMethod('Create');
    //
    if Assigned(metodo) and Tipo.IsInstance then
    begin
        tipoInstancia := Tipo.AsInstance;
        //
        valor := metodo.Invoke(tipoInstancia.MetaclassType, []);

        Result := valor.AsType<T>;
    end;
end;


{$ENDREGION}

end.

