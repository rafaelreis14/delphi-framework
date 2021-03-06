unit Biz.Cliente;

interface

uses Classes, System.SysUtils, Lib.Parametro, Lib.Enumeradores, Lib.ClasseBase,
    Biz.Filial, Lib.Filter, Lib.Persistable, Lib.Lista, Datasnap.DBClient,
    Lib.ResultFilter, Biz.Serasa, Framework.Interfaces.CRUD, Dal.ControleDados,
    Dal.CondicaoConsulta, Framework.Interfaces.CRUDGenerico, Lib.Base,
    Biz.CondicaoPagamentoPorCliente;

type

    TTipoPessoa = (tpDesconhecido, tpPessoaFisica, tpPessoaJuridica);

    [TReferenceTable('SA1010')]
    TCliente = Class(TClasseBase, ICRUD<TCliente>, ICRUDGenerico)
    private
        FCodigo: string;
        FLoja: string;
        FNome: string;
        FCgc: string;
        FRecno: Integer;
        FTipo: string;
        FTipoPessoal: string;
        FRg: string;
        FBairro: string;
        FCep: string;
        FMunicipio: string;
        FInscricao: string;
        FEndereco: string;
        FTelefone: string;
        FEstado: string;
        FCodigoClientePadrao: string;
        FLojaClientePadrao: string;
        FEmail: string;
        FEmailNfe: string;
        FDataNascimento: string;
        FCodigoBairroTOTVS: string;
        FCodigoMunicipio: string;
        FValidadorCPF_CNPJ: String;
        FCodigoPais: string;
        procedure SetCodigo(const Value: string);
        procedure SetLoja(const Value: string);
        procedure SetNome(const Value: string);
        procedure SetCgc(const Value: string);
        procedure SetRecno(const Value: Integer);
        procedure SetTipo(const Value: string);
        procedure SetTipoPessoal(const Value: string);
        procedure SetBairro(const Value: string);
        procedure SetCep(const Value: string);
        procedure SetEndereco(const Value: string);
        procedure SetInscricao(const Value: string);
        procedure SetMunicipio(const Value: string);
        procedure SetRg(const Value: string);
        procedure SetTelefone(const Value: string);
        procedure SetEstado(const Value: string);
        function GetTipoPessoa: TTipoPessoa;
        procedure SetEmail(const Value: string);
        procedure SetEmailNfe(const Value: string);
        procedure SetDataNascimento(const Value: string);
        function GetIdade: Integer;
        procedure SetCodigoBairroTOTVS(const Value: string);
        procedure SetCodigoMunicipio(const Value: string);
        function GetValidaCPF: Boolean;
        procedure SetValidadorCPF_CNPJ(const Value: String);
        procedure SetCodigoPais(const Value: string);
    private
        FCondicaoPagamentoParaOCliente: TLista<TCondicaoPagamentoPorCliente>;
        function CharToInt(ch: Char): ShortInt;
        function IntToChar(int: ShortInt): Char;
        function IsNumero(const s: string): Boolean;
        function ValidaIEAC: Boolean;
        function ValidaIEAL: Boolean;
        function ValidaIEAP: Boolean;
        function ValidaIEAM: Boolean;
        function ValidaIEBA: Boolean;
        function ValidaIECE: Boolean;
        function ValidaIEDF: Boolean;
        function ValidaIEES: Boolean;
        function ValidaIEGO: Boolean;
        function ValidaIEMA: Boolean;
        function ValidaIEMG: Boolean;
        function ValidaIEMT: Boolean;
        function ValidaIEMS: Boolean;
        function ValidaIEPA: Boolean;
        function ValidaIEPB: Boolean;
        function ValidaIEPR: Boolean;
        function ValidaIEPE: Boolean;
        function ValidaIEPI: Boolean;
        function ValidaIERJ: Boolean;
        function ValidaIERN: Boolean;
        function ValidaIERS: Boolean;
        function ValidaIERO: Boolean;
        function ValidaIERR: Boolean;
        function ValidaIESC: Boolean;
        function ValidaIESP: Boolean;
        function ValidaIESE: Boolean;
        function ValidaIETO: Boolean;
        procedure SetCondicaoPagamentoParaOCliente(const Value: TLista<TCondicaoPagamentoPorCliente>);
    public
        class var dao: TControleDados<TLista<TCliente>, TListaDAO<TCliente>>;
        function Inserir: Integer;

        /// <summary>
        /// M�todos que retorna uma lista� de objetos de uma consulta
        /// pr�-definida pelos par�mentros passados.
        /// </summary>
        function Consultar(parametros: TParametro): TLista<TCliente>;

        function Alterar: Boolean;
        function Excluir: Boolean;
        function Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;

        function Obter(ID: string): TCliente; overload;
        function Obter(parametros: TParametro): TCliente; overload;
        function Obter(loja, codigo: string): TCliente; overload;
        function ObterBase(ID: string): TBase;

        procedure PreencherObjeto(Cliente: TCliente);

        function ValidarCPFCNPJ: Boolean;

        function ValidarCaracteresInvalidosNome: Boolean;

        function EFormatoCpf: Boolean;
        function VerificarClientePadrao(codigoFilial: String): Boolean;

        procedure CarregarCondicoesPagamentoCliente;

        [TPersistable(fgPersistable, 'A1_LOJA')]
        property loja: string read FLoja write SetLoja;

        [TPersistable(fgPersistable, 'A1_COD')]
        property codigo: string read FCodigo write SetCodigo;

        [TPersistable(fgPersistable, 'A1_NOME')]
        property Nome: string read FNome write SetNome;

        [TPersistable(fgPersistable, 'A1_CGC')]
        property Cgc: string read FCgc write SetCgc;

        [TPersistable(fgPersistable, 'A1_RG')]
        property Rg: string read FRg write SetRg;

        [TPersistable(fgPersistable, 'A1_DTNASC')]
        property DataNascimento: string read FDataNascimento write SetDataNascimento;

        [TPersistable(fgPersistable, 'A1_CEP')]
        property Cep: string read FCep write SetCep;

        [TPersistable(fgPersistable, 'A1_MUN')]
        property Municipio: string read FMunicipio write SetMunicipio;

        [TPersistable(fgPersistable, 'A1_BAIRRO')]
        property Bairro: string read FBairro write SetBairro;

        [TPersistable(fgPersistable, 'A1_END')]
        property Endereco: string read FEndereco write SetEndereco;

        [TPersistable(fgPersistable, 'A1_EST')]
        property Estado: string read FEstado write SetEstado;

        [TPersistable(fgPersistable, 'A1_INSCR')]
        property Inscricao: string read FInscricao write SetInscricao;

        [TPersistable(fgPersistable, 'A1_TEL')]
        property Telefone: string read FTelefone write SetTelefone;

        [TPersistable(fgPersistable, 'A1_EMAIL')]
        property Email: string read FEmail write SetEmail;

        [TPersistable(fgPersistable, 'A1_MAILNTD')]
        property EmailNfe: string read FEmailNfe write SetEmailNfe;

        /// <summary>
        /// Tipo Cliente - �R = Revenda F = Final
        /// </summary>
        [TPersistable(fgPersistable, 'A1_TIPO')]
        property Tipo: string read FTipo write SetTipo;

        [TPersistable(fgPersistable, 'A1_CODPAIS')]
        property CodigoPais: string read FCodigoPais write SetCodigoPais;

        /// <summary>
        /// Tipo pessoa - F = Pessoa F�sica, J = Pessoa Jur�dica
        /// </summary>
        [TPersistable(fgPersistable, 'A1_PESSOA')]
        property TipoPessoa: string read FTipoPessoal write SetTipoPessoal;

        [TPersistable(fgPersistable, 'A1_XCODBAI')]
        [TMaxLenght(8)]
        property CodigoBairroTOTVS: string read FCodigoBairroTOTVS write SetCodigoBairroTOTVS;

        [TPersistable(fgPersistable, 'A1_COD_MUN')]
        property CodigoMunicipio: string read FCodigoMunicipio write SetCodigoMunicipio;

        property TipoPessoa_: TTipoPessoa read GetTipoPessoa;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: Integer read FRecno write SetRecno;

        property LojaClientePadrao: string read FLojaClientePadrao;
        property CodigoClientePadrao: string read FCodigoClientePadrao;

        property Idade: Integer read GetIdade;

        [TPersistable(fgReadOnly, 'A1_EXPORT')]
        property ValidadorCPF_CNPJ: String read FValidadorCPF_CNPJ write SetValidadorCPF_CNPJ;
        property ValidaCPF: Boolean read GetValidaCPF;
        function ValidarInscricaoEstadual: Boolean;

        property CondicaoPagamentoParaOCliente: TLista<TCondicaoPagamentoPorCliente> read FCondicaoPagamentoParaOCliente write SetCondicaoPagamentoParaOCliente;
        function TemCondicaoPagamento: Boolean;

        /// <summary>
        /// Obtem somente os c�digos dos cliente padrao
        /// </summary>
        procedure ObterCodigoClientePadrao(codigoFilial: String);

        // Obtem e popular o Cliente
        procedure ObterClientePadrao(codigoFilial: String);

        procedure ConsultarSerasa;

        function ObterUltimaConsultaSerasa: TDadosConsultaSerasa;

        function ObterInformacoesCadastrais(zab_zaarec: string): TInformacoesCadastrais;

        function ObterAnotacoesSerasa(zac_zabrec: string): TLista<TAnotacaoSerasa>;

        constructor Create; override;
        destructor Destroy; override;
    end;

const
    OrdZero = Ord('0');

implementation

{ TCliente }

uses Lib.Biblioteca, Biz.UsuarioLogado, Biz.ArquivoSerasa, Vcl.Forms,
  Biz.ParametroSistema;

function TCliente.Alterar: Boolean;
begin

end;

procedure TCliente.CarregarCondicoesPagamentoCliente;
var
    condicao: TCondicaoPagamentoPorCliente;
begin
    try
        if FCondicaoPagamentoParaOCliente <> nil then
            FreeAndNil(FCondicaoPagamentoParaOCliente);

        condicao := TCondicaoPagamentoPorCliente.Create;

        FCondicaoPagamentoParaOCliente := condicao.Consultar(Self.codigo);

    finally
        if condicao <> nil then
            FreeAndNil(condicao);
    end;

end;

function TCliente.CharToInt(ch: Char): ShortInt;
begin
    Result := Ord(ch) - OrdZero;
end;

function TCliente.Consultar(parametros: TParametro): TLista<TCliente>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('Z3_FILIAL', ccIgual, lgAnd);
        condicao.Adiciona('A1_LOJA', ccIgual, lgAnd);
        condicao.Adiciona('A1_COD', ccIgual, lgAnd);
        condicao.Adiciona('A1_NOME', ccLikeInicio, lgAnd);
        condicao.Adiciona('A1_CGC', ccIgual, lgAnd);
        condicao.Adiciona('A1_RG', ccIgual, lgAnd);
        condicao.Adiciona('A1_DTNASC', ccIgual, lgAnd);
        condicao.Adiciona('A1_CEP', ccIgual, lgAnd);
        condicao.Adiciona('A1_MUN', ccIgual, lgAnd);
        condicao.Adiciona('A1_BAIRRO', ccIgual, lgAnd);
        condicao.Adiciona('A1_END', ccIgual, lgAnd);
        condicao.Adiciona('A1_EST', ccIgual, lgAnd);
        condicao.Adiciona('A1_INSCR', ccIgual, lgAnd);
        condicao.Adiciona('A1_TEL', ccIgual, lgAnd);
        condicao.Adiciona('A1_EMAIL', ccIgual, lgAnd);
        condicao.Adiciona('A1_MAILNTD', ccIgual, lgAnd);
        condicao.Adiciona('A1_TIPO', ccIgual, lgAnd);
        condicao.Adiciona('A1_PESSOA', ccIgual, lgAnd);
        condicao.Adiciona('R_E_C_N_O_', ccIgual, lgAnd);

        query := 'SELECT ' + Self.ObterCamposSeparadosPorVirgula(Consulta, []) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        Result := dao.Consultar(query, parametros);
    finally
        condicao.Free;
    end;
end;

procedure TCliente.ConsultarSerasa;
var
   arquivo: TArquivoRetornoSerasa;
   i: integer;
   tabela: string;
   query: widestring;
begin
    try
        if trim(Self.Cgc) = EmptyStr then
            raise Exception.Create('Cliente sem CPF/CNPJ cadastrado');

        try
            dao.IniciarTransacao();

            if length(Self.Cgc) = 14 then
                arquivo := TArquivoRetornoSerasaCNPJ.Create(ExtractFilePath(Application.Exename) + 'SERASA\' + Self.Cgc + '.txt', TUsuarioLogado.ObterInstancia.Login, true)
            else
                arquivo := TArquivoRetornoSerasaCPF.Create(ExtractFilePath(Application.Exename) + 'SERASA\' + Self.Cgc + '.txt', TUsuarioLogado.ObterInstancia.Login, true);


            arquivo.Usuario := TParametroSistema.ObterParametroSistema('USUARIOSER');
            arquivo.Senha := TParametroSistema.ObterParametroSistema('SENHASERAS');
            arquivo.TempoConsulta := TParametroSistema.ObterParametroSistema('TEMPOSERASA');;
            arquivo.DonwloadArquivo([Self.Cgc, arquivo.Usuario, arquivo.Senha]);

            arquivo.carregar;
            arquivo.ObterListaSQL;
            arquivo.ConverterScripts;

            try
                for i := 0 to arquivo.ObterToTalQueries - 1 do
                begin
                    tabela := arquivo.Queries[i].tabela;
                    query := arquivo.Queries[i].query;
                    dao.Inserir(arquivo.Queries[i].query, nil);
                end;
            except
                on e: exception do
                    raise exception.Create('Erro ao inserir registro na tabela ' + tabela + #13 + e.message + #13 + query);
            end;

            dao.ConfirmarTransacao();
        except
            dao.ReverterTransacao();
            raise;
//
        end;
    finally
    end;
end;

constructor TCliente.Create;
begin
    inherited;
    // ObterCodigoClientePadrao;
end;

destructor TCliente.Destroy;
begin
    if FCondicaoPagamentoParaOCliente <> nil then
        FreeAndNil(FCondicaoPagamentoParaOCliente);
    inherited;
end;

function TCliente.Excluir: Boolean;
begin

end;

function TCliente.EFormatoCpf: Boolean;
begin
    if length(Self.Cgc) > 11 then
        Result := false
    else
        Result := true;
end;

function TCliente.GetIdade: Integer;
begin
    Result := 0;

    if Self.DataNascimento = EmptyStr then
        exit;

    Result := Trunc((tlib.DataSistemaParaDateTime(tlib.ObterDataAtual) - tlib.DataSistemaParaDateTime(Self.DataNascimento)) / 365.25);
end;

function TCliente.GetTipoPessoa: TTipoPessoa;
begin
    if Self.TipoPessoa = 'J' then
        Result := tpPessoaJuridica
    else if Self.TipoPessoa = 'F' then
        Result := tpPessoaFisica
    else
        Result := tpDesconhecido;
end;

function TCliente.GetValidaCPF: Boolean;
begin
    if FValidadorCPF_CNPJ = '1' then
        Result := false
    else
        Result := true;
end;

function TCliente.Inserir: Integer;
begin

end;

function TCliente.IntToChar(int: ShortInt): Char;
begin
    Result := Chr(int + OrdZero);
end;

function TCliente.IsNumero(const s: string): Boolean;
var
    i: byte;
begin
    Result := false;
    for i := 1 to length(s) do
        if not(s[i] in ['0' .. '9']) then
            exit;
    Result := true;
end;

function TCliente.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro: TFieldFilter;
    filtro: TFilter<TCliente>;
begin
    inherited;
    filtro := TFilter<TCliente>.Create;
    filtro.ScreenName := 'Filtro de Clientes';
    filtro.OperationType := tipoOperacao;
    filtro.MultiSelect := multselect;
    filtro.AddIndex(1, 'Cgc=A1_CGC', 'CNPJ/CPF');
    filtro.AddIndex(2, 'Nome=A1_NOME', 'Nome');
    filtro.AddIndex(3, 'Loja=A1_LOJA, Codigo=A1_COD', 'Loja + C�digo');
    filtro.Task := 'ConsultarCliente';
    // REIS VERIFICAR
    // filtro.InputForm := TfrmCadCliente;
    //
    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'Loja';
    campoFiltro.Name := 'Loja';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.GridSize := 60;
    campoFiltro.FieldType := fdNormal;
    filtro.AddField(campoFiltro);
    //
    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'Codigo';
    campoFiltro.Name := 'Codigo';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.GridSize := 60;
    campoFiltro.FieldType := fdNormal;
    filtro.AddField(campoFiltro);
    //
    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'Nome';
    campoFiltro.Name := 'Nome';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.FieldType := fdNormal;
    campoFiltro.GridSize := 200;
    filtro.AddField(campoFiltro);
    //
    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'UF';
    campoFiltro.Name := 'Estado';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.GridSize := 30;
    campoFiltro.FieldType := fdNormal;
    filtro.AddField(campoFiltro);
    //
    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'Cgc';
    campoFiltro.Name := 'Cgc';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.FieldType := fdNormal;
    campoFiltro.GridSize := 80;
    filtro.AddField(campoFiltro);
    //
    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'CodigoBairroTOTVS';
    campoFiltro.Name := 'CodigoBairroTOTVS';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.FieldType := fdNormal;
    campoFiltro.GridSize := 60;
    filtro.AddField(campoFiltro);
    //
    campoFiltro := TFieldFilter.Create;
    campoFiltro.Description := 'Recno';
    campoFiltro.Name := 'Recno';
    campoFiltro.MaskTypes := mtNone;
    campoFiltro.FieldType := fdNormal;
    campoFiltro.GridSize := 60;
    filtro.AddField(campoFiltro);
    //
    Result := filtro.Execute;
end;

function TCliente.Obter(loja, codigo: string): TCliente;
var
    Parametro: TParametro;
begin
    try
        Parametro := TParametro.Create;
        Parametro.Add('', 'A1_LOJA', loja);
        Parametro.Add('', 'A1_COD', codigo);

        Self.Obter(Parametro);
    finally
        FreeAndNil(Parametro);
    end;
end;

function TCliente.Obter(ID: string): TCliente;
begin

end;

function TCliente.ObterAnotacoesSerasa(zac_zabrec: string): TLista<TAnotacaoSerasa>;
var
    param: TParametro;
begin
    try
        param := TParametro.Create;
        param.Add('', 'zac_zabrec', zac_zabrec);

        // Result := BaseLib.XmlToObject<TAnotacaoSerasa>(BaseLib.ExecutaTarefa('ObterObterAnotacoesSerasa', 'TCliente', param));
    finally
        if param <> nil then
            FreeAndNil(param);
    end;
end;

function TCliente.ObterBase(ID: string): TBase;
begin
    Result := Self.Obter(ID);
end;

procedure TCliente.ObterClientePadrao(codigoFilial: String);
begin
    if (Self.LojaClientePadrao = '') or (Self.CodigoClientePadrao = '') then
        Self.ObterCodigoClientePadrao(codigoFilial);

    Self.Obter(Self.LojaClientePadrao, Self.CodigoClientePadrao);
end;

procedure TCliente.ObterCodigoClientePadrao(codigoFilial: String);
var
    Filial: TFilial;
begin
    try
        Filial := TFilial.Create;
        Filial.Obter(codigoFilial);

        if Filial.Preenchido then
        begin
            FLojaClientePadrao := Filial.LojaClientePadrao;
            FCodigoClientePadrao := Filial.CodigoClientePadrao;
        end
        else
            raise Exception.Create('N�o foi poss�vel obter o cliente padr�o, favor verificar.');
    finally
        if Filial <> nil then
            FreeAndNil(Filial);
    end;
end;

function TCliente.ObterInformacoesCadastrais(zab_zaarec: string): TInformacoesCadastrais;
var
    param: TParametro;
    Lista: TLista<TInformacoesCadastrais>;
begin
    try
        param := TParametro.Create;
        param.Add('', 'zab_zaarec', zab_zaarec);

        // lista := BaseLib.XmlToObject<TInformacoesCadastrais>(BaseLib.ExecutaTarefa('ObterInformacoesCadastrais', 'TCliente', param));

        if Lista.count > 0 then
            Result := Lista[0]
        else
            Result := nil;
    finally
        if param <> nil then
            FreeAndNil(param);
    end;

end;

function TCliente.ObterUltimaConsultaSerasa: TDadosConsultaSerasa;
var
    dadoSerasa: TDadosConsultaSerasa;
begin
    dadoSerasa := TDadosConsultaSerasa.Create;
    try
        result := dadoSerasa.ObterUltimaConsultaSerasa(Self.Cgc);
    finally
        FreeAndNil(dadoSerasa);
    end;
end;

// function TCliente.Obter(ID: string): TObject;
// var
// parametros: TParametro;
//
// begin
// try
// parametros := TParametro.Create;
// parametros.Add('', 'Z3_NUM', ID);
// parametros.Add('', 'Z3_FILIAL', tlib.UsuarioLogado.Filial.Filial);
// Result := Obter(parametros);
// finally
// FreeAndNil(parametros);
// end;
//
// end;

function TCliente.Obter(parametros: TParametro): TCliente;
var
    Lista: TLista<TCliente>;

begin
    try
        Lista := Self.Consultar(parametros);

        if Lista.count = 1 then
        begin
            PreencherObjeto(Lista[0]);
            Result := Self;
        end
        else
        begin
            tlib.MensagemAdvertencia('Nenhum registro encontrado.', 'Aviso');
            Result := nil;
        end;
    finally
        Lista.Destroy;
    end;
end;

function TCliente.ValidaIEAP: Boolean;
var
    p, d, b, i, soma: Integer;
    dig: SmallInt;
    ie: string;
begin
    Result := false;
    ie := Self.Inscricao;
    if (length(ie) <> 9) then
        exit;
    if not IsNumero(ie) then
        exit;
    p := 0;
    d := 0;
    i := StrToInt(copy(ie, 1, 8));
    if (i >= 03000001) and (i <= 03017000) then
    begin
        p := 5;
        d := 0;
    end
    else if (i >= 03017001) and (i <= 03019022) then
    begin
        p := 9;
        d := 1;
    end;
    b := 9;
    soma := p;
    for i := 1 to 08 do
    begin
        inc(soma, CharToInt(ie[i]) * b);
        dec(b);
    end;
    dig := 11 - (soma mod 11);
    if dig = 10 then
        dig := 0
    else if dig = 11 then
        dig := d;
    Result := (IntToChar(dig) = ie[09]);
end;

function TCliente.ValidaIEAM: Boolean;
var
    b, i, soma: Integer;
    dig: SmallInt;
    ie: String;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 9) then
        exit;
    if not IsNumero(ie) then
        exit;
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, CharToInt(ie[i]) * b);
        dec(b);
    end;
    if soma < 11 then
        dig := 11 - soma
    else
    begin
        i := (soma mod 11);
        if i <= 1 then
            dig := 0
        else
            dig := 11 - i;
    end;
    Result := (IntToChar(dig) = ie[09]);
end;

function TCliente.ValidaIEBA: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 9] of byte;
    NumMod: word;
    dig: SmallInt;
    die: string;
    ie: String;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) = 8) then
    begin

{$REGION '8 Digitos'}
        die := copy(ie, 1, 8);

        if not IsNumero(die) then
            exit;

        for i := 1 to 8 do
            nro[i] := CharToInt(die[i]);

        if nro[1] in [0, 1, 2, 3, 4, 5, 8] then
            NumMod := 10
        else
            NumMod := 11;

        // calculo segundo
        b := 7;
        soma := 0;
        for i := 1 to 06 do
        begin
            inc(soma, (nro[i] * b));
            dec(b);
        end;

        i := soma mod NumMod;

        if NumMod = 10 then
        begin
            if i = 0 then
                dig := 0
            else
                dig := NumMod - i;
        end
        else
        begin
            if i <= 1 then
                dig := 0
            else
                dig := NumMod - i;
        end;

        Result := (dig = nro[8]);

        if not Result then
            exit;

        // calculo segundo
        b := 8;
        soma := 0;
        for i := 1 to 06 do
        begin
            inc(soma, (nro[i] * b));
            dec(b);
        end;

        inc(soma, (nro[8] * 2));
        i := soma mod NumMod;

        if NumMod = 10 then
        begin
            if i = 0 then
                dig := 0
            else
                dig := NumMod - i;
        end
        else
        begin
            if i <= 1 then
                dig := 0
            else
                dig := NumMod - i;
        end;
        Result := (dig = nro[7]);

{$ENDREGION}
    end
    else if (length(ie) = 9) then
    begin

{$REGION '9 Digitos'}
        die := copy(ie, 1, 9);

        if not IsNumero(die) then
            exit;

        for i := 1 to 9 do
            nro[i] := CharToInt(die[i]);

        if nro[2] in [0, 1, 2, 3, 4, 5, 8] then
            NumMod := 10
        else
            NumMod := 11;

        // calculo segundo
        b := 8;
        soma := 0;
        for i := 1 to 07 do
        begin
            inc(soma, (nro[i] * b));
            dec(b);
        end;

        i := soma mod NumMod;

        if NumMod = 10 then
        begin
            if i = 0 then
                dig := 0
            else
                dig := NumMod - i;
        end
        else
        begin
            if i <= 1 then
                dig := 0
            else
                dig := NumMod - i;
        end;

        Result := (dig = nro[9]);

        if not Result then
            exit;

        // calculo segundo
        b := 9;
        soma := 0;
        for i := 1 to 07 do
        begin
            inc(soma, (nro[i] * b));
            dec(b);
        end;

        inc(soma, (nro[9] * 2));
        i := soma mod NumMod;

        if NumMod = 10 then
        begin
            if i = 0 then
                dig := 0
            else
                dig := NumMod - i;
        end
        else
        begin
            if i <= 1 then
                dig := 0
            else
                dig := NumMod - i;
        end;
        Result := (dig = nro[8]);

{$ENDREGION}
    end;
end;

function TCliente.ValidaIECE: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 9] of byte;
    dig: SmallInt;
    die, ie: string;
begin
    Result := false;
    ie := Self.Inscricao;
    if (length(ie) > 9) then
        exit;
    if not IsNumero(ie) then
        exit;
    die := ie;
    if length(ie) < 9 then
    begin
        repeat
            die := '0' + die;
        until length(die) = 9;
    end;
    for i := 1 to 9 do
        nro[i] := CharToInt(die[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, (nro[i] * b));
        dec(b);
    end;
    dig := 11 - (soma mod 11);
    if dig >= 10 then
        dig := 0;
    Result := (dig = nro[9]);
end;

function TCliente.ValidaIEDF: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 13] of byte;
    dig: SmallInt;
    ie: string;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 13) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 13 do
        nro[i] := CharToInt(ie[i]);
    b := 4;
    soma := 0;
    for i := 1 to 11 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
        if b = 1 then
            b := 9;
    end;
    dig := 11 - (soma mod 11);
    if dig >= 10 then
        dig := 0;
    Result := (dig = nro[12]);
    if not Result then
        exit;

    b := 5;
    soma := 0;
    for i := 1 to 12 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
        if b = 1 then
            b := 9;
    end;
    dig := 11 - (soma mod 11);
    if dig >= 10 then
        dig := 0;
    Result := (dig = nro[13]);
end;

function TCliente.ValidaIEES: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 9] of byte;
    dig: SmallInt;
    ie: string;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 9) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 9 do
        nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
    end;
    i := soma mod 11;
    if i < 2 then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[9]);
end;

function TCliente.ValidaIEGO: Boolean;
var
    n, b, i, soma: Integer;
    nro: array [1 .. 9] of byte;
    dig: SmallInt;
    s, ie: string;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 9) then
        exit;
    if not IsNumero(ie) then
        exit;
    s := copy(ie, 1, 2);
    if (s = '10') or (s = '11') or (s = '15') then
    begin
        for i := 1 to 9 do
            nro[i] := CharToInt(ie[i]);
        n := Trunc(StrToFloat(ie) / 10);
        if n = 11094402 then
        begin
            if (nro[9] = 0) or (nro[9] = 1) then
            begin
                Result := true;
                exit;
            end;
        end;

        b := 9;
        soma := 0;
        for i := 1 to 08 do
        begin
            inc(soma, nro[i] * b);
            dec(b);
        end;
        i := (soma mod 11);
        if i = 0 then
            dig := 0
        else if i = 1 then
        begin
            if (n >= 10103105) and (n <= 10119997) then
                dig := 1
            else
                dig := 0;
        end
        else
        begin
            dig := 11 - i;
        end;
        Result := (dig = nro[9]);
    end;
end;

function TCliente.ValidaIEMA: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 9] of byte;
    dig: SmallInt;
    ie: string;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 9) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 9 do
        nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[9]);
end;

function TCliente.ValidaIEMG: Boolean;
var
    npos, i: byte;
    ptotal, psoma: Integer;
    dig1, dig2: string[1];
    ie, insc: string;
    nresto: SmallInt;
begin
    Result := true;
    ie := Self.Inscricao;

    Result := false;
    if (trim(ie) = '.') then
        exit;
    if (length(ie) <> 13) then
        exit;
    if not IsNumero(ie) then
        exit;

    dig1 := copy(ie, 12, 1);
    dig2 := copy(ie, 13, 1);
    insc := copy(ie, 1, 3) + '0' + copy(ie, 4, 8);
    // CALCULA DIGITO 1
    npos := 12;
    i := 1;
    ptotal := 0;
    while npos > 0 do
    begin
        inc(i);
        psoma := CharToInt(insc[npos]) * i;
        if psoma >= 10 then
            psoma := psoma - 9;
        inc(ptotal, psoma);
        if i = 2 then
            i := 0;
        dec(npos);
    end;
    nresto := ptotal mod 10;
    if nresto = 0 then
        nresto := 10;
    nresto := 10 - nresto;
    if nresto <> StrToInt(dig1[1]) then
        exit;

    // CALCULA DIGITO 2
    npos := 12;
    i := 1;
    ptotal := 0;
    while npos > 0 do
    begin
        inc(i);
        if i = 12 then
            i := 2;
        inc(ptotal, CharToInt(ie[npos]) * i);
        dec(npos);
    end;
    nresto := ptotal mod 11;
    if (nresto = 0) or (nresto = 1) then
        nresto := 11;
    nresto := 11 - nresto;
    if nresto <> StrToInt(dig2[1]) then
        exit;
    Result := true;
end;

function TCliente.ValidaIEMS: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 09] of byte;
    dig: SmallInt;
    ie: string;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 09) then
        exit;
    if not IsNumero(ie) then
        exit;
    if copy(ie, 1, 2) <> '28' then
        exit;
    for i := 1 to 09 do
        nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[09]);
end;

function TCliente.ValidaIEMT: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 11] of byte;
    dig: SmallInt;
    die, ie: string;
begin
    Result := false;
    ie := Self.Inscricao;
    if (length(ie) < 9) then
        exit;
    die := ie;
    if length(die) < 11 then
    begin
        repeat
            die := '0' + die;
        until length(die) = 11;
    end;
    if not IsNumero(die) then
        exit;
    for i := 1 to 11 do
        nro[i] := CharToInt(die[i]);
    b := 3;
    soma := 0;
    for i := 1 to 10 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
        if b = 1 then
            b := 9;
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[11]);
end;

function TCliente.ValidaIEPA: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 09] of byte;
    dig: SmallInt;
    ie: string;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 09) then
        exit;
    if not IsNumero(ie) then
        exit;
    if copy(ie, 1, 2) <> '15' then
        exit;
    for i := 1 to 09 do
        nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[09]);
end;

function TCliente.ValidaIEPB: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 09] of byte;
    dig: SmallInt;
    ie: string;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 09) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 09 do
        nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[09]);
end;

function TCliente.ValidaIEPE: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 14] of byte;
    dig: SmallInt;
    ie: string;
begin
    ie := Self.Inscricao;
    Result := false;
    if (length(ie) <> 14) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 14 do
        nro[i] := CharToInt(ie[i]);
    b := 5;
    soma := 0;
    for i := 1 to 13 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
        if b = 0 then
            b := 9;
    end;
    dig := 11 - (soma mod 11);
    if dig > 9 then
        dig := dig - 10;
    Result := (dig = nro[14]);
end;

function TCliente.ValidaIEPI: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 09] of byte;
    dig: SmallInt;
    ie: string;
begin
    ie := Self.Inscricao;
    Result := false;
    if (length(ie) <> 09) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 09 do
        nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[09]);
end;

function TCliente.ValidaIEPR: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 10] of byte;
    dig: SmallInt;
    ie: string;
begin
    ie := Self.Inscricao;
    Result := false;
    if (length(ie) <> 10) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 10 do
        nro[i] := CharToInt(ie[i]);
    b := 3;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
        if b = 1 then
            b := 7;
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[09]);
    if not Result then
        exit;

    b := 4;
    soma := 0;
    for i := 1 to 09 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
        if b = 1 then
            b := 7;
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[10]);
end;

function TCliente.ValidaIERJ: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 08] of byte;
    dig: SmallInt;
    ie: String;
begin
    Result := false;

    ie := Self.Inscricao;

    if (length(ie) <> 08) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 08 do
        nro[i] := CharToInt(ie[i]);
    b := 2;
    soma := 0;
    for i := 1 to 07 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
        if b = 1 then
            b := 7;
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[08]);
end;

function TCliente.ValidaIERN: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 09] of byte;
    dig: SmallInt;
    ie: String;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 09) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 09 do
        nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
    end;
    soma := soma * 10;
    dig := (soma mod 11);
    if (dig = 10) then
        dig := 0;
    Result := (dig = nro[09]);
end;

function TCliente.ValidaIERO: Boolean;
var
    i: Integer;
    iMult: Integer;
    iResult: Integer;
    iExp: Integer;
    nVerificador: Integer;
    cInsEst, ie: string;
begin
    Result := false;
    ie := Self.Inscricao;

    iResult := 0;
    for i := 1 to length(ie) do
    begin
        if StrToInt(ie[i]) in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] then // Verifico se � numerico e tiro todos os caracteres
            cInsEst := cInsEst + ie[i];
    end;
    if length(trim(cInsEst)) <> 14 then // Verifico se a Ie Possui 14 Caracteres
        exit
    else
    begin
        nVerificador := StrToInt(cInsEst[14]); // Armazeno o digito verificador
        cInsEst := copy(cInsEst, 1, length(cInsEst) - 1); // Retiro o digito verificador
        iMult := 6; // Atribuo o primeiro valor de peso para multiplica��o que seguir� da seguinte fomra (6,5,4,3,2,9,8,7,6,5,4,3,2)
        for i := 1 to length(cInsEst) do
        begin
            iExp := StrToInt(cInsEst[i]) * iMult; // Realizo a multiplica��o por peso entre as posi��es
            if i > 1 then // |
                iResult := iResult + iExp // |Realizo a soma
            else // |Dos resultados
                iResult := iExp; // |
            if iMult = 2 then
                iMult := 10; // Reatribuo o valor do peso
            dec(iMult); // Vou decrescendo o valor do peso
        end;
        iResult := (iResult mod 11); // Pego o resto da divis�o entre o valor da express�o pelo valor do modulo (11)
        iResult := 11 - iResult; // Subtraio o resultado pelo valor do modulo
        if (iResult = 10) or (iResult = 11) then // se o resultado for com 10 ou 11 subtraio ele por 10
            iResult := iResult - 10;
        if iResult = nVerificador then // Verifico se o resultado � igual o verificador
            Result := true; // Sucesso!!! A inscri��o estadual � valida
    end;
end;

function TCliente.ValidaIERR: Boolean;
var
    i, soma: Integer;
    nro: array [1 .. 09] of byte;
    dig: SmallInt;
    ie: String;
begin
    Result := false;
    ie := Self.Inscricao;
    if (length(ie) <> 09) then
        exit;
    if not IsNumero(ie) then
        exit;
    if copy(ie, 1, 2) <> '24' then
        exit;
    for i := 1 to 09 do
        nro[i] := CharToInt(ie[i]);
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * i);
    end;
    dig := (soma mod 09);
    Result := (dig = nro[09]);
end;

function TCliente.ValidaIERS: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 10] of byte;
    dig: SmallInt;
    ie: String;
begin
    Result := false;
    ie := Self.Inscricao;
    if (length(ie) <> 10) then
        exit;
    if not IsNumero(ie) then
        exit;
    i := StrToInt(copy(ie, 1, 3));
    if (i >= 1) and (i <= 467) then
    begin
        for i := 1 to 10 do
            nro[i] := CharToInt(ie[i]);
        b := 2;
        soma := 0;
        for i := 1 to 09 do
        begin
            inc(soma, nro[i] * b);
            dec(b);
            if b = 1 then
                b := 9;
        end;
        dig := 11 - (soma mod 11);
        if (dig >= 10) then
            dig := 0;
        Result := (dig = nro[10]);
    end;
end;

function TCliente.ValidaIESC: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 09] of byte;
    dig: SmallInt;
    ie: String;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 09) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 09 do
        nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
    end;
    i := (soma mod 11);
    if (i <= 1) then
        dig := 0
    else
        dig := 11 - i;
    Result := (dig = nro[09]);
end;

function TCliente.ValidaIESE: Boolean;
var
    b, i, soma: Integer;
    nro: array [1 .. 09] of byte;
    dig: SmallInt;
    ie: String;
begin
    Result := false;
    ie := Self.Inscricao;
    if (length(ie) <> 09) then
        exit;
    if not IsNumero(ie) then
        exit;
    for i := 1 to 09 do
        nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, nro[i] * b);
        dec(b);
    end;
    dig := 11 - (soma mod 11);
    if (dig >= 10) then
        dig := 0;
    Result := (dig = nro[09]);
end;

function TCliente.ValidaIESP: Boolean;
var
    i, soma: Integer;
    nro: array [1 .. 12] of byte;
    dig: SmallInt;
    s: string;
    ie: String;
begin
    Result := false;
    ie := Self.Inscricao;
    if UpperCase(copy(ie, 1, 1)) = 'P' then
    begin
        s := copy(ie, 2, 9);
        if not IsNumero(s) then
            exit;
        for i := 1 to 8 do
            nro[i] := CharToInt(s[i]);
        soma := (nro[1] * 1) + (nro[2] * 3) + (nro[3] * 4) + (nro[4] * 5) + (nro[5] * 6) + (nro[6] * 7) + (nro[7] * 8) + (nro[8] * 10);
        dig := (soma mod 11);
        if (dig >= 10) then
            dig := 0;
        Result := (dig = nro[09]);
        if not Result then
            exit;
    end
    else
    begin
        if (length(ie) < 12) then
            exit;
        if not IsNumero(ie) then
            exit;
        for i := 1 to 12 do
            nro[i] := CharToInt(ie[i]);
        soma := (nro[1] * 1) + (nro[2] * 3) + (nro[3] * 4) + (nro[4] * 5) + (nro[5] * 6) + (nro[6] * 7) + (nro[7] * 8) + (nro[8] * 10);
        dig := (soma mod 11);
        if (dig >= 10) then
            dig := 0;
        Result := (dig = nro[09]);
        if not Result then
            exit;
        soma := (nro[1] * 3) + (nro[2] * 2) + (nro[3] * 10) + (nro[4] * 9) + (nro[5] * 8) + (nro[6] * 7) + (nro[7] * 6) + (nro[8] * 5) + (nro[9] * 4) + (nro[10] * 3) + (nro[11] * 2);

        dig := (soma mod 11);
        if (dig >= 10) then
            dig := 0;
        Result := (dig = nro[12]);
    end;
end;

function TCliente.ValidaIETO: Boolean;
var
    ie: string;
    b, i, soma: Integer;
    nro: array [1 .. 11] of byte;
    dig: SmallInt;
    s: string;
begin
    ie := Self.Inscricao;
    Result := false;

    if length(ie) = 11 then
    begin
{$REGION '11'}
        if (length(ie) <> 11) then
            exit;

        if not IsNumero(ie) then
            exit;

        s := copy(ie, 3, 2);

        if (s = '01') or (s = '02') or (s = '03') or (s = '99') then
        begin
            for i := 1 to 11 do
                nro[i] := CharToInt(ie[i]);

            b := 9;
            soma := 0;
            for i := 1 to 10 do
            begin
                if (i <> 3) and (i <> 4) then
                begin
                    inc(soma, nro[i] * b);
                    dec(b);
                end;
            end;
            i := (soma mod 11);

            if (i <= 1) then
                dig := 0
            else
                dig := 11 - i;

            Result := (dig = nro[11]);
        end;
{$ENDREGION}
    end
    else
    begin
{$REGION '9'}
        Result := false;

        if (length(ie) <> 9) then
            exit;

        if not IsNumero(ie) then
            exit;

        for i := 1 to 9 do
            nro[i] := CharToInt(ie[i]);

        b := 9;
        soma := 0;

        for i := 1 to 8 do
        begin
            inc(soma, nro[i] * b);
            dec(b);
        end;

        i := (soma mod 11);

        if (i <= 1) then
            dig := 0
        else
            dig := 11 - i;

        Result := (dig = nro[9]);
{$ENDREGION}
    end;

end;

function TCliente.ValidaIEAC: Boolean;
var
    b, i, soma: Integer;
    dig: SmallInt;
    inscri: String;
begin
    Result := false;

    inscri := Self.Inscricao;

    if (length(inscri) <> 13) then
        exit;
    if not IsNumero(inscri) then
        exit;
    b := 4;
    soma := 0;
    for i := 1 to 11 do
    begin
        inc(soma, CharToInt(inscri[i]) * b);
        dec(b);
        if b = 1 then
            b := 9;
    end;
    dig := 11 - (soma mod 11);
    if (dig >= 10) then
        dig := 0;
    Result := (IntToChar(dig) = inscri[12]);
    if not Result then
        exit;

    b := 5;
    soma := 0;
    for i := 1 to 12 do
    begin
        inc(soma, CharToInt(inscri[i]) * b);
        dec(b);
        if b = 1 then
            b := 9;
    end;
    dig := 11 - (soma mod 11);
    if (dig >= 10) then
        dig := 0;
    Result := (IntToChar(dig) = inscri[13]);
end;

function TCliente.ValidaIEAL: Boolean;
var
    b, i, soma: Integer;
    dig: SmallInt;
    ie: String;
begin
    Result := false;
    ie := Self.Inscricao;

    if (length(ie) <> 9) then
        exit;
    if not IsNumero(ie) then
        exit;
    if copy(ie, 1, 2) <> '24' then
        exit;
    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
        inc(soma, CharToInt(ie[i]) * b);
        dec(b);
    end;
    soma := soma * 10;
    dig := soma - Trunc(soma / 11) * 11;
    if dig = 10 then
        dig := 0;
    Result := (IntToChar(dig) = ie[09]);
end;

function TCliente.ValidarCaracteresInvalidosNome: Boolean;
begin
    Result := tlib.ValidarCaracteresInvalidos(Self.Nome);
end;

function TCliente.ValidarCPFCNPJ: Boolean;
Var
    i, d, b, Digito: byte;
    soma: Integer;
    CNPJ: Boolean;
    DgPass, DgCalc: String;
    number: string;
begin
    Result := false;
    number := tlib.SomenteNumeros(Self.Cgc);
    //
    if StrToInt64Def(number, 0) = 0 then
        exit;

    // Caso o n�mero n�o seja 11 (CPF) ou 14 (CNPJ), aborta
    Case length(number) of
        11:
            CNPJ := false;
        14:
            CNPJ := true;
    else
        exit;
    end;
    // Separa o n�mero do digito
    DgCalc := '';
    DgPass := copy(number, length(number) - 1, 2);
    number := copy(number, 1, length(number) - 2);
    // Calcula o digito 1 e 2
    For d := 1 to 2 do
    begin
        b := tlib.ifTernario(d = 1, 2, 3); // BYTE
        soma := tlib.ifTernario(d = 1, 0, STRTOINTDEF(DgCalc, 0) * 2);
        for i := length(number) downto 1 do
        begin
            soma := soma + (Ord(number[i]) - Ord('0')) * b;
            inc(b);
            If (b > 9) And CNPJ Then
                b := 2;
        end;
        Digito := 11 - soma mod 11;
        If Digito >= 10 then
            Digito := 0;
        DgCalc := DgCalc + Chr(Digito + Ord('0'));
    end;
    if DgCalc <> DgPass then
    begin
        Result := false;
        tlib.MensagemAdvertencia('CPF ou CNPJ Inv�lido');
    end
    else
        Result := true;
end;

function TCliente.ValidarInscricaoEstadual: Boolean;
begin
    Result := false;

    if (Self.Inscricao = 'ISENTO') or (Self.Inscricao = EmptyStr) then
        Result := true
    else
    begin
        if Self.Estado = 'AC' then
            Result := ValidaIEAC
        else if Self.Estado = 'AL' then
            Result := ValidaIEAL
        else if Self.Estado = 'AP' then
            Result := ValidaIEAP
        else if Self.Estado = 'AM' then
            Result := ValidaIEAM
        else if Self.Estado = 'BA' then
            Result := ValidaIEBA
        else if Self.Estado = 'CE' then
            Result := ValidaIECE
        else if Self.Estado = 'DF' then
            Result := ValidaIEDF
        else if Self.Estado = 'ES' then
            Result := ValidaIEES
        else if Self.Estado = 'GO' then
            Result := ValidaIEGO
        else if Self.Estado = 'MA' then
            Result := ValidaIEMA
        else if Self.Estado = 'MG' then
            Result := ValidaIEMG
        else if Self.Estado = 'MT' then
            Result := ValidaIEMT
        else if Self.Estado = 'MS' then
            Result := ValidaIEMS
        else if Self.Estado = 'PA' then
            Result := ValidaIEPA
        else if Self.Estado = 'PB' then
            Result := ValidaIEPB
        else if Self.Estado = 'PR' then
            Result := ValidaIEPR
        else if Self.Estado = 'PE' then
            Result := ValidaIEPE
        else if Self.Estado = 'PI' then
            Result := ValidaIEPI
        else if Self.Estado = 'RJ' then
            Result := ValidaIERJ
        else if Self.Estado = 'RN' then
            Result := ValidaIERN
        else if Self.Estado = 'RS' then
            Result := ValidaIERS
        else if Self.Estado = 'RO' then
            Result := ValidaIERO
        else if Self.Estado = 'RR' then
            Result := ValidaIERR
        else if Self.Estado = 'SC' then
            Result := ValidaIESC
        else if Self.Estado = 'SP' then
            Result := ValidaIESP
        else if Self.Estado = 'SE' then
            Result := ValidaIESE
        else if Self.Estado = 'TO' then
            Result := ValidaIETO
        else
            Result := false;
    end;
end;

function TCliente.VerificarClientePadrao(codigoFilial: String): Boolean;
begin
    if (Self.CodigoClientePadrao = '') or (Self.LojaClientePadrao = '') then
        Self.ObterCodigoClientePadrao(codigoFilial);

    Result := ((codigo = CodigoClientePadrao) and (loja = LojaClientePadrao));
end;

procedure TCliente.PreencherObjeto(Cliente: TCliente);
begin
    Cliente.CopiarPara(Self);
end;

procedure TCliente.SetBairro(const Value: string);
begin
    FBairro := Value;
end;

procedure TCliente.SetCep(const Value: string);
begin
    FCep := Value;
end;

procedure TCliente.SetCgc(const Value: string);
begin
    FCgc := Value;
end;

procedure TCliente.SetCodigo(const Value: string);
begin
    FCodigo := Value;
end;

procedure TCliente.SetCodigoBairroTOTVS(const Value: string);
begin
    FCodigoBairroTOTVS := Value;
end;

procedure TCliente.SetCodigoMunicipio(const Value: string);
begin
    FCodigoMunicipio := Value;
end;

procedure TCliente.SetCodigoPais(const Value: string);
begin
    FCodigoPais := Value;
end;

procedure TCliente.SetCondicaoPagamentoParaOCliente(const Value: TLista<TCondicaoPagamentoPorCliente>);
begin
    FCondicaoPagamentoParaOCliente := Value;
end;

procedure TCliente.SetDataNascimento(const Value: string);
begin
    FDataNascimento := Value;
end;

procedure TCliente.SetEmail(const Value: string);
begin
    FEmail := Value;
end;

procedure TCliente.SetEmailNfe(const Value: string);
begin
    FEmailNfe := Value;
end;

procedure TCliente.SetEndereco(const Value: string);
begin
    FEndereco := Value;
end;

procedure TCliente.SetEstado(const Value: string);
begin
    FEstado := Value;
end;

procedure TCliente.SetInscricao(const Value: string);
begin
    FInscricao := Value;
end;

procedure TCliente.SetLoja(const Value: string);
begin
    FLoja := Value;
end;

procedure TCliente.SetMunicipio(const Value: string);
begin
    FMunicipio := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
    FNome := Value;
end;

procedure TCliente.SetRecno(const Value: Integer);
begin
    FRecno := Value;
end;

procedure TCliente.SetRg(const Value: string);
begin
    FRg := Value;
end;

procedure TCliente.SetTelefone(const Value: string);
begin

    FTelefone := Value;
end;

procedure TCliente.SetTipo(const Value: string);
begin
    FTipo := Value;
end;

procedure TCliente.SetTipoPessoal(const Value: string);
begin
    FTipoPessoal := Value;
end;

procedure TCliente.SetValidadorCPF_CNPJ(const Value: String);
begin
    FValidadorCPF_CNPJ := Value;
end;

function TCliente.TemCondicaoPagamento: Boolean;
var
    cond: TCondicaoPagamentoPorCliente;
begin
    Result := false;
    for cond in Self.CondicaoPagamentoParaOCliente do
    begin
        if cond.CodigoCondicaoPagamaneto <> EmptyStr then
        begin
            Result := true;
            Break;
        end;
    end;
end;

end.
