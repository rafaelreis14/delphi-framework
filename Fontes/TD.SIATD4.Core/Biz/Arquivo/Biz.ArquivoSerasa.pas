unit Biz.ArquivoSerasa;

interface

uses Lib.Arquivo, ADODB;

type
    TArquivoRetornoSerasa = class(TArquivoRetorno)
    private
        function ColocarZeroEsquerda(tamanhoNumero: integer; numero: string): string;
    public
        procedure Carregar; override;

        ///	<summary>
       ///	  Obtem a ultima consulta no prazo de 6 meses
       ///	</summary>
       function ObterUltimaConsultaSerasa(conexao: TADOConnection; cpfCNPJ: string): TADOQuery;
       function ObterConsultaSerasaPorRecno(conexao: TADOConnection; recno: string): TADOQuery;

       function ObterQuantidadeDeMesesParaConsulta(conexao: TADOConnection): string;

       function ObterInformacoesCadastrais(conexao: TADOConnection; zab_zaarec: integer): TADOQuery;

       function ObterInformacoesScore(conexao: TADOConnection; zal_zabrec: integer): TADOQuery;



    end;

    TArquivoRetornoSerasaCPF = class(TArquivoRetornoSerasa)
    private
        ///	<summary>
        ///	  Para validar o arquivo basta sobrescrever este m�todo
        ///	</summary>
        procedure ValidarArquivo; override;

    public
       procedure DonwloadArquivo(parametro:array of string);override;
       constructor Create(diretorio, usuario:string; producao: boolean = false); override;

       function ObterDocRoubadoClonado(conexao: TADOConnection; zam_zabrec: integer): TADOQuery;

       function ObterCostumaciaSustacao(conexao: TADOConnection; zan_zabrec: integer): TADOQuery;

       function ObterCompromissosComAEmpresa(conexao: TADOConnection; zar_zabrec: integer): TADOQuery;

       function ObterAnotacoesSerasa(conexao: TADOConnection; zac_zabrec: integer): TADOQuery;
       function ObterDetalhesAnotacoesSerasa(conexao: TADOConnection; zad_zabrec: integer; zad_tppefin: string): TADOQuery;

       function ObterChequesSemFundo(conexao: TADOConnection; zae_zabrec: integer): TADOQuery;
       function ObterDetalhesChequeSemFundo(conexao: TADOConnection; zaf_zaerec: integer): TADOQuery;

       function ObterProtestos(conexao: TADOConnection; zag_zabrec: integer): TADOQuery;
       function ObterDetalhesProtestos(conexao: TADOConnection; zah_zagrec: integer): TADOQuery;

       function ObterResumoRegistros(conexao: TADOConnection; zai_zabrec: integer): TADOQuery;
       function ObterDetalhesResumoRegistros(conexao: TADOConnection; zaj_zairec: integer): TADOQuery;
    end;

    TArquivoRetornoSerasaCNPJ = class(TArquivoRetornoSerasa)
    private
        function ExecutarParticularidadeBlocoSocios(bloco: Tbloco;retorno: WideString; linhaPai: integer): WideString;
        function ExecutarParticularidadeBlocoQuadroAdministrativo(bloco: Tbloco; retorno: WideString; linhaPai: integer): WideString;
        function Executar(bloco: Tbloco; retorno: WideString; linhaPai: integer): WideString;
        function ExecutarParticularidadeBlocoDetalhes(bloco: Tbloco; retorno: WideString;  cpfCnpj:string; linhaPai: integer): WideString;


        // Este m�todo precisar� ser executado, caso exista as mesmas pessoas como socias e quadro administrativo, as informa��es
        //complementares n�o se repetem, nesse caso eu preciso ajustar as informa��es para que eu tenha os dados integros.
        procedure AjustarInformacoes; {*override;*}
    public
        function ExecutarParticularidades(blc: TBloco; retorno: WideString; valorReferencia: string; linhaPai: integer): wideString; override;
        procedure DonwloadArquivo(parametro:array of string);override;

        function ObterControleSocietarioQuadroAdminsitrativo(conexao: TADOConnection; zas_zabrec: integer; tipo:string): TADOQuery;
        function ObterSociosAdmistradores(conexao: TADOConnection; zat_zasrec: integer): TADOQuery;

        function ObterFiliais(conexao: TADOConnection; zav_zabrec: integer): TADOQuery;
        function ObterRegistroConsulta(conexao: TADOConnection; zax_zabrec: integer): TADOQuery;
        function ObterCincoUltimas(conexao: TADOConnection; zaz_zabrec: integer): TADOQuery;
        function ObterHistoricosDePagamento(conexao: TADOConnection; zba_zabrec: integer): TADOQuery;
        function ObterRelacionamentoMaisAntigo(conexao: TADOConnection; zbc_zabrec: integer): TADOQuery;
        function ObterReferenciasDeNegocio(conexao: TADOConnection; zbb_zabrec: integer): TADOQuery;
        function ObterLimiteDeCredito(conexao: TADOConnection; zbd_zabrec: integer): TADOQuery;
        function ObterFaturamentoPresumido(conexao: TADOConnection; zbe_zabrec: integer): TADOQuery;

        function ObterAnotacoesNegativas(conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;

        function ObterDetalhePefin(conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;
        function ObterDetalheRefin(conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;
        function ObterDetalheProtesto(conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;
        function ObterDetalheAcaoJudicial(conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;
        function ObterParticipacaoEmFalencia(conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;
        function ObterChequeSemFundo(conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;
        function ObterChequeSustado(conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;

        function ObterParticipadas(conexao: TADOConnection; zbu_zabrec:integer): TADOQuery;
        function ObterParticipantes(conexao: TADOConnection; zbu_zabrec: integer; documento, digito: string): TADOQuery;

        constructor Create(diretorio, usuario:string; producao: boolean = false); override;
    end;

implementation

uses
  Dialogs, StrUtils, SysUtils, Classes, DB;

{ TArquivoRetornoSerasa }

procedure TArquivoRetornoSerasa.Carregar;
var

  linha: widestring;
  i: Integer;

  retorno: widestring;
  strBloco:WideString;
  bloco:tbloco;
begin
    try
        if Self.Arquivo = '' then
            ObterArquivo;

        ObterInformacaoArquivo(Self.BlocoPrincipal.ObterListaDeBlocosFilhos, Self.Arquivo);
        // Executa o que foi implementado na classe base
        Inherited;
    except
        on e: exception do
        begin
          raise Exception.Create('N�o foi poss�vel carregar o arquivo'+#13+e.Message);
        end;
    end;
end;


{ TArquivoRetornoSeraraCPF }

constructor TArquivoRetornoSerasaCPF.Create(diretorio, usuario: string; producao: boolean);
var
    //principais
    bloB49C, BloT999: TBloco;
    //secundarios
    bloB001, bloB002, bloB003, bloB004: TBloco;
    bloB232, bloB233: TBloco;
    bloB353, bloB354, bloB361, bloB362, bloB359, bloB360, bloB357, bloB358: TBloco;
    bloB280, bloB355, bloB376: TBloco;
begin
    inherited;
    //criar as configura��es
    {$REGION 'B49C'}
    bloB49C := TBloco.Create;
    bloB49C.Nome := 'B49C';
    bloB49C.Tamanho := 400;
    bloB49C.Tabela := 'ZAA010';
    bloB49C.TipoBloco := BlocoPai;
    bloB49C.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB49C.AdicionarMetaDado(0,0,'ZAA_ARQ','',ArquivoBlob);
    bloB49C.AdicionarMetaDado(15,11,Texto, 'ZAA_CPFCGC','N�mero do CPF');
    bloB49C.AdicionarMetaDado('ZAA_USER', 'Usu�rio do sistema', usuario);
    bloB49C.AdicionarMetaDado(196,8,Texto, 'ZAA_DTCON','Data de realiza��o da consulta (AAAAMMDD)');
    bloB49C.AdicionarMetaDado(204,6,Texto, 'ZAA_HRCON','Hor�rio de realiza��o da consulta (HHMMSS)');
    BlocoPrincipal.AdicionarBloco(bloB49C);
    {$ENDREGION}

    {$REGION 'B001'}
    bloB001 := TBloco.Create;
    bloB001.Nome := 'B001';
    bloB001.Tamanho := 115;
    bloB001.Descricao := 'Dados Cadastrais B0001';
    bloB001.TipoBloco := BlocoFilho;
    bloB001.Tabela := 'ZAB010';
    bloB001.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB001.AdicionarMetaDado(0,0,'ZAB_ZAAREC','',ChaveEstrangeira);
    bloB001.AdicionarMetaDado(1,4,Texto, 'ZAB_BLOCO','Registro B001 � Identifica��o');
    bloB001.AdicionarMetaDado(5,45,Texto, 'ZAB_NOME','Mostra grafia do CPF consultado ou mensagem:CPF N�O CONFIRMADO NO CADASTRO AT� ESTA DATA');
    bloB001.AdicionarMetaDado(50,11,Texto,'ZAB_CPFCGC','Mostra o n�mero do CPF como Titular, ou de Outras Grafias ou de Grafias Semelhantes.');
    bloB001.AdicionarMetaDado(61,15,Texto,'ZAB_RG','N�mero da Carteira de Identidade Obs.: Esse RG informado � o mesmo apresentado no registro do cadastro sint�tico / anal�tico do Credit Bureau.');
    bloB001.AdicionarMetaDado(76,8,Data, 'ZAB_DTNASC','Data de nascimento do CPF (AAAAMMDD) informada por fontes p�blicas de informa��o');
    bloB001.AdicionarMetaDado(103,8,Data, 'ZAB_DTALTE', 'CONFIRMEI: Data da �ltima altera��o do CPF na Base de CPFs (AAAAMMDD)');
    bloB001.AdicionarMetaDado(114,1,Numerico, 'ZAB_SITUAC', 'Situa��o do CPF: 2 � REGULAR; 3 � PENDENTE DE REGULARIZA��O; 6 � SUSPENSA; 9 � CANCELADA; 4 � NULA 0 (zero) = CPF N�O CONFIRMADO NO CADASTRO AT� ESTA DATA');
    bloB49C.AdicionarBloco(bloB001);


    {$REGION 'B002'}
    bloB002 := TBloco.Create;
    bloB002.Nome := 'B002';
    bloB002.Tamanho := 115;
    bloB002.Descricao := 'Cadastro Sint�tico B0002';
    bloB002.TipoBloco := BlocoContinuacao;
    bloB002.AdicionarMetaDado(1,4,Texto,'Registro B002 � Cadastro Sint�tico');
    bloB002.AdicionarMetaDado(24,45,Texto, 'ZAB_NOMMAE', 'Nomea da M�e');
    bloB001.AdicionarBloco(bloB002);
    {$ENDREGION}

    {$REGION 'B003'}
    bloB003 := TBloco.Create;
    bloB003.Nome := 'B003';
    bloB003.Tamanho := 115;
    bloB003.Descricao := 'Cadastro Sint�tico B003';
    blob003.TipoBloco := BlocoContinuacao;
    bloB003.AdicionarMetaDado(1,4,Texto,'Registro: B003 � Cadastro Sint�tico � BX14');
    bloB003.AdicionarMetaDado(69,3, Numerico, 'ZAB_DDDRES',  'DDD do telefone residencial');
    bloB003.AdicionarMetaDado(72,9, Numerico, 'ZAB_TELRES', 'Telefone residencial. Bloco no qual a condi��o de requerido pode ser atendida com o n�mero do telefone residencial e/ou com o n�mero do celular.');
    bloB003.AdicionarMetaDado(81,3, Numerico, 'ZAB_DDDCOM', 'DDD do telefone comercial');
    bloB003.AdicionarMetaDado(84,9, Numerico, 'ZAB_TELCOM', 'Telefone comercial');
    bloB003.AdicionarMetaDado(93,4, Numerico, 'ZAB_RAMCOM', 'Ramal do telefone comercial');
    bloB003.AdicionarMetaDado(97,9, Numerico, 'ZAB_TELCEL', 'N�mero do telefone celular');
    bloB003.AdicionarMetaDado(106,3, Numerico, 'ZAB_DDDCEL', 'DDD do celular');
    bloB001.AdicionarBloco(bloB003);
    {$ENDREGION}

    {$REGION 'B004'}
    bloB004 := TBloco.Create;
    bloB004.Nome := 'B004';
    bloB004.Tamanho := 115;
    bloB004.Descricao := 'Cadastro Sint�tico B004';
    blob004.TipoBloco := BlocoContinuacao;
    bloB004.AdicionarMetaDado(1,4,Texto, 'Registro: B004 - CADASTRO SINT�TICO');
    bloB004.AdicionarMetaDado(5,45,Texto, 'ZAB_ENDER','Endere�o (logradouro, n�mero, complemento)');
    bloB004.AdicionarMetaDado(50,20,Texto, 'ZAB_BAIRRO', 'Bairro');
    bloB004.AdicionarMetaDado(70,25,Texto, 'ZAB_CIDADE','Cidade');
    bloB004.AdicionarMetaDado(95,2,Texto, 'ZAB_ESTADO','Sigla Estado');
    bloB004.AdicionarMetaDado(97,8,Texto, 'ZAB_CEP','CEP');
    bloB001.AdicionarBloco(bloB004);
    {$ENDREGION}

    {$REGION 'B232'}
    bloB232 := TBloco.Create;
    bloB232.Nome := 'B232';
    bloB232.Tamanho := 115;
    bloB232.Descricao := 'B232 - COMPROMISSOS';
    bloB232.TipoBloco := BlocoFilho;
    bloB232.Tabela := 'ZAR010';
    bloB232.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB232.AdicionarMetaDado(0,0,'ZAR_ZABREC','',ChaveEstrangeira);
    bloB232.AdicionarMetaDado(1,4,Texto, 'ZAR_BLOCO','Registro: B232 - COMPROMISSOS');
    bloB232.AdicionarMetaDado(5,17,Texto,'ZAR_NUMCON' ,'N�mero do contrato');
    bloB232.AdicionarMetaDado(22,2,Texto,'ZAR_TPMOD', 'Tipo de Modalidade � Tabela 7');
    bloB232.AdicionarMetaDado(24,8,Data,'ZAR_DTABER','Data da abertura do contrato (AAAAMMDD)');
    bloB232.AdicionarMetaDado(32,3,Texto,'ZAR_TPMOE','Tipo de moeda - Tabela 10');
    bloB232.AdicionarMetaDado(35,9,Numerico,'ZAR_VLCONT','Valor do contrato (inteiros)');
    bloB232.AdicionarMetaDado(44,9,Numerico,'ZAR_VLGAR','Valor do bem dado como garantia real do empr�stimo (inteiros)');
    bloB232.AdicionarMetaDado(53,9,Numerico,'ZAR_VLENTR','Valor da entrada (inteiros)');
    bloB232.AdicionarMetaDado(62,9,Numerico,'ZAR_VLPARC', 'Valor da parcela');
    bloB232.AdicionarMetaDado(71,8,Data,'ZAR_DTPARC','Data da primeira parcela (AAAAMMDD)');
    bloB232.AdicionarMetaDado(79,8,Data,'ZAR_DTULPA','Data da �ltima parcela (AAAAMMDD)');
    bloB232.AdicionarMetaDado(87,3,Numerico,'ZAR_QTPARC','Quantidade de parcelas');
    bloB232.AdicionarMetaDado(90,3,Numerico,'ZAR_N1PARC','N�mero da primeira parcela');
    bloB001.AdicionarBloco(bloB232);

    {$REGION 'B233'}
    bloB233 := TBloco.Create;
    bloB233.Nome := 'B233';
    bloB233.Tamanho := 115;
    bloB233.Descricao := 'B233 - COMPROMISSOS - Continuacao';
    bloB233.TipoBloco := BlocoContinuacao;
    bloB233.AdicionarMetaDado(1,4,Texto,'Registro: B233 - COMPROMISSOS');
    bloB233.AdicionarMetaDado(5,60,Texto,'ZAR_DESBEM','Descri��o do Bem');
    bloB233.AdicionarMetaDado(65,12,Texto,'ZAR_PERPAR','Periodicidade das parcelas');
    bloB233.AdicionarMetaDado(77,1,Texto,'ZAR_JURO','Juro no per�odo: S= Simples e C= Composto');
    bloB233.AdicionarMetaDado(78,8,'ZAR_TXJURO','Taxa de juros aplicada com 5 casas decimais',5);
    bloB233.AdicionarMetaDado(86,3,Numerico,'ZAR_PERBON','Apresenta o percentual de b�nus de opera��es de seguros');
    bloB232.AdicionarBloco(bloB233);
    {$ENDREGION}
    {$ENDREGION}

    {$REGION 'B353'}
    bloB353 := TBloco.Create;
    bloB353.Nome := 'B353';
    bloB353.Tamanho := 115;
    bloB353.Descricao := 'Registro de Consulta B353';
    bloB353.TipoBloco := BlocoFilho;
    bloB353.Tabela := 'ZAI010';
    bloB353.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB353.AdicionarMetaDado(0,0,'ZAI_ZABREC','',ChaveEstrangeira);
    bloB353.AdicionarMetaDado(1,4,Texto, 'ZAI_BLOCO','Registro: B353 - RESUMO � REGISTRO DE CONSULTAS');
    bloB353.AdicionarMetaDado(5,3,Numerico, 'ZAI_TOTCON','Quantidade total de Consultas a Cr�dito');
    bloB353.AdicionarMetaDado(8,6,Numerico, 'ZAI_DTATUA','Ano/m�s atual (AAAAMM)');
    bloB353.AdicionarMetaDado(14,3,Numerico, 'ZAI_QTCON','Quantidade de Consultas a Cr�dito do m�s atual � (maio)');
    bloB353.AdicionarMetaDado(17,3,Numerico, 'ZAI_QTCON1', 'Quantidade de Consultas a Cr�dito do m�s atual � 1 (abril)');
    bloB353.AdicionarMetaDado(20,3,Numerico, 'ZAI_QTCON2', 'Quantidade de Consultas a Cr�dito do m�s atual � 2 (marco)');
    bloB353.AdicionarMetaDado(23,3,Numerico, 'ZAI_QTCON3','Quantidade de Consultas a Cr�dito do m�s atual � 3 (fevereiro)');
    bloB353.AdicionarMetaDado(26,3,Numerico, 'ZAI_TOTCHQ','Quantidade total de Consultas a Cheques');
    bloB353.AdicionarMetaDado(29,3,Numerico, 'ZAI_QTCHQ','Quantidade de Consultas a Cheques do m�s atual (maio)');
    bloB353.AdicionarMetaDado(32,3,Numerico, 'ZAI_QTCHQ1','Quantidade de Consultas a Cheques do m�s atual � 1 (abril)');
    bloB353.AdicionarMetaDado(35,3,Numerico, 'ZAI_QTCHQ2','Quantidade de Consultas a Cheques do m�s atual � 2 (mar�o)');
    bloB353.AdicionarMetaDado(38,3,Numerico, 'ZAI_QTCHQ3','Quantidade de Consultas a Cheques do m�s atual � 3 (fevereiro)');
    bloB353.AdicionarMetaDado(41,8,Data, 'ZAI_ULTCON','Data da �ltima consulta da empresa');
    bloB353.AdicionarMetaDado(49,8,Data, 'ZAI_ULTATU','Data do FICAD/PF Sint�tico � ou seja, da �ltima atualiza��o da empresa.');
    bloB001.AdicionarBloco(bloB353);

    {$REGION 'B354'}
    bloB354 := TBloco.Create;
    bloB354.Nome := 'B354';
    bloB354.Tamanho := 115;
    bloB354.Descricao := 'Detalhe Registro Consulta B354';
    bloB354.TipoBloco := BlocoFilho;
    bloB354.Tabela := 'ZAJ010';
    bloB354.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB354.AdicionarMetaDado(0,0,'ZAJ_ZAIREC','',ChaveEstrangeira);
    bloB354.AdicionarMetaDado(1,4,Texto, 'ZAJ_BLOCO','Registro: B354 - DETALHE REGISTRO DE CONSULTAS');
    bloB354.AdicionarMetaDado(5,8,Data, 'ZAJ_ULTCON','Data da consulta ( AAAAMMDD)');
    bloB354.AdicionarMetaDado(13,40,Texto, 'ZAJ_NOMINS', 'Nome da institui��o que consultou o CPF');
    bloB354.AdicionarMetaDado(53,12,Texto, 'ZAJ_TPMOD','Modalidade de cr�dito consultada - Tabela 7');
    bloB354.AdicionarMetaDado(65,3,Texto, 'ZAJ_TPMOE','Tipo moeda - Tabela 10');
    bloB354.AdicionarMetaDado(68,9,Texto, 'ZAJ_VLCONS','Valor da consulta (inteiros)');
    bloB353.AdicionarBloco(bloB354);
    {$ENDREGION}
    {$ENDREGION}

    {$REGION 'B361'}
    bloB361 := TBloco.Create;
    bloB361.Nome := 'B361';
    bloB361.Tamanho := 115;
    bloB361.Descricao := 'Registro: B361 - RESUMO OCORR�NCIAS DE PROTESTOS';
    bloB361.TipoBloco := BlocoFilho;
    bloB361.Tabela := 'ZAG010';
    bloB361.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB361.AdicionarMetaDado(0,0,'ZAG_ZABREC','',ChaveEstrangeira);
    bloB361.AdicionarMetaDado(1,4, Texto,'ZAG_BLOCO','B361 � Resumo Ocorr�ncia de Protestos');
    bloB361.AdicionarMetaDado(5,5,Numerico, 'ZAG_TOTPRO', 'Quantidade total de ocorr�ncias (Protesto)');
    bloB361.AdicionarMetaDado(10,28,Texto, 'ZAG_TPPRO', 'Descri��o do tipo de ocorr�ncia (Protesto)');
    bloB361.AdicionarMetaDado(38,6,Data, 'ZAG_DTANT', 'Data da 1� ocorr�ncia (AAAAMM) mais antiga');
    bloB361.AdicionarMetaDado(44,6,Data, 'ZAG_DTREC', 'Data da �ltima ocorr�ncia (AAAAMM) mais recente');
    bloB361.AdicionarMetaDado(50,3,Texto, 'ZAG_TPMOE', 'Tipo de moeda - tabela 10');
    bloB361.AdicionarMetaDado(53,9,Numerico, 'ZAG_VLUPRO', 'Valor do �ltimo protesto (inteiros)');
    bloB361.AdicionarMetaDado(62,25,Texto, 'ZAG_CIDADE', 'Cidade');
    bloB361.AdicionarMetaDado(87,2,Texto, 'ZAG_ESTADO', 'Estado');
    bloB001.AdicionarBloco(bloB361);

    {$REGION 'B362'}
    bloB362 := TBloco.Create;
    bloB362.Nome := 'B362';
    bloB362.Tamanho := 115;
    bloB362.Descricao := 'Registro: B362 � DETALHE - PROTESTO';
    bloB362.TipoBloco := BlocoFilho;
    bloB362.Tabela := 'ZAH010';
    bloB362.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB362.AdicionarMetaDado(0,0,'ZAH_ZAGREC','',ChaveEstrangeira);
    bloB362.AdicionarMetaDado(1,4, Texto,'ZAH_BLOCO','B362 � DETALHE - PROTESTO');
    bloB362.AdicionarMetaDado(5,8,Data, 'ZAH_DTOCO', 'Data da ocorr�ncia (AAAAMMDD)');
    bloB362.AdicionarMetaDado(13,3,Texto, 'ZAH_TPMOE', 'Tipo de moeda');
    bloB362.AdicionarMetaDado(16,9,Numerico, 'ZAH_VLPRO', 'Valor do protesto (inteiros)');
    bloB362.AdicionarMetaDado(25,4,Numerico, 'ZAH_CARTPR', 'Cart�rio do protesto');
    bloB362.AdicionarMetaDado(29,25,Texto, 'ZAH_CIDADE', 'Cidade');
    bloB362.AdicionarMetaDado(54,2,Texto, 'ZAH_ESTADO', 'Sigla do Estado');
    bloB362.AdicionarMetaDado(56,5,Numerico, 'ZAH_TOTOCO', 'Quantidade total de ocorr�ncias');
    bloB362.AdicionarMetaDado(61,1,Texto, 'ZAH_STATUS', '"Branco" ou N indica que n�o est� e n�o h� carta de anu�ncia '+
                                                     'Letra "S" indica que a d�vida est� sub judice '+
                                                     'Letra �C� indica Carta de anu�ncia COMUNICADO CREDOR '+
                                                     'Letra �D� indica - Carta de anu�ncia COMUNICADO DEVEDOR '+
                                                     'Letra �E� indica - Carta de anu�ncia ELETRONICO.');
    bloB362.AdicionarMetaDado(62,8,Data, 'ZAH_DTANUE', 'Data da Carta de Anu�ncia.');
    bloB361.AdicionarBloco(bloB362);
    {$ENDREGION}
    {$ENDREGION}

    {$REGION 'B359'}
    bloB359 := TBloco.Create;
    bloB359.Nome := 'B359';
    bloB359.Tamanho := 115;
    bloB359.Descricao := 'Registro: B359 - RESUMO DE CHEQUE SEM FUNDO';
    bloB359.TipoBloco := BlocoFilho;
    bloB359.Tabela := 'ZAE010';
    bloB359.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB359.AdicionarMetaDado(0,0,'ZAE_ZABREC','',ChaveEstrangeira);
    bloB359.AdicionarMetaDado(1,4, Texto,'ZAE_BLOCO','B359 - RESUMO DE CHEQUE SEM FUNDO');
    bloB359.AdicionarMetaDado(5,5,Numerico, 'ZAE_TOTCHQ', 'Quantidade total de ocorr�ncias (Cheque sem Fundo)');
    bloB359.AdicionarMetaDado(10,28,Texto, 'ZAE_TPCHQ', 'Descri��o do tipo de ocorr�ncia (Cheque sem Fundo)');
    bloB359.AdicionarMetaDado(38,6,Data, 'ZAE_DTANT', 'Data da 1� ocorr�ncia (AAAAMM) mais antiga');
    bloB359.AdicionarMetaDado(44,6,Data, 'ZAE_DTREC', 'Data da �ltima ocorr�ncia (AAAAMM) mais recente');
    bloB359.AdicionarMetaDado(50,3,Texto, 'ZAE_TPMOE', 'Tipo de moeda');
    bloB359.AdicionarMetaDado(53,9,Numerico, 'ZAE_VLUCHQ', 'Valor da �ltima ocorr�ncia (inteiros)');
    bloB359.AdicionarMetaDado(62,20,Texto, 'ZAE_BANCO', 'Nome do Banco da �ltima ocorr�ncia');
    bloB359.AdicionarMetaDado(82,4,Texto, 'ZAE_AGENC', 'Ag�ncia do Banco');
    bloB001.AdicionarBloco(bloB359);

    {$REGION 'B360'}
    bloB360 := TBloco.Create;
    bloB360.Nome := 'B360';
    bloB360.Tamanho := 115;
    bloB360.Descricao := 'Registro: B360 � DETALHE DE CHEQUE SEM FUNDOS';
    bloB360.TipoBloco := BlocoFilho;
    bloB360.Tabela := 'ZAF010';
    bloB360.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB360.AdicionarMetaDado(0,0,'ZAF_ZAEREC','',ChaveEstrangeira);
    bloB360.AdicionarMetaDado(1,4, Texto,'ZAF_BLOCO','B360 � DETALHE DE CHEQUE SEM FUNDOS');
    bloB360.AdicionarMetaDado(5,8,Data, 'ZAF_DTOCO', 'Data da ocorr�ncia (AAAAMMDD)');
    bloB360.AdicionarMetaDado(13,6,Texto, 'ZAF_NUMCHQ', 'N�mero do cheque');
    bloB360.AdicionarMetaDado(19,2,Numerico, 'ZAF_ALIDEV', 'Al�nea da devolu��o do cheque');
    bloB360.AdicionarMetaDado(21,4,Numerico, 'ZAF_QTCHQ', 'Quantidade de cheques devolvidos');
    bloB360.AdicionarMetaDado(25,3,Texto, 'ZAF_TPMOE', 'Tipo de moeda');
    bloB360.AdicionarMetaDado(28,9,Texto, 'ZAF_VLCHQ', 'Valor do cheque devolvido (inteiros)');
    bloB360.AdicionarMetaDado(37,30,Texto, 'ZAF_BANCO', 'Nome do Banco');
    bloB360.AdicionarMetaDado(67,4,Texto, 'ZAF_AGENC', 'Ag�ncia do Banco');
    bloB360.AdicionarMetaDado(71,25,Texto, 'ZAF_CIDADE', 'Cidade');
    bloB360.AdicionarMetaDado(96,2,Texto, 'ZAF_ESTADO', 'Estado');
    bloB360.AdicionarMetaDado(98,5,Numerico, 'ZAF_TOTOCO', 'Quantidade total de ocorr�ncias');
    bloB360.AdicionarMetaDado(103,1,Texto, 'ZAF_TPCC', 'Indicativo de tipo de conta: Individual = �0� (zero); Titular de conta Conjunta = 9 ou I = Individual e C = Conjunta.');
    bloB360.AdicionarMetaDado(104,9,Numerico, 'ZAF_NUMCC', 'N�mero da conta corrente.');
    bloB359.AdicionarBloco(bloB360);
    {$ENDREGION}
    {$ENDREGION}

    {$REGION 'B357'}
    bloB357 := TBloco.Create;
    bloB357.Nome := 'B357';
    bloB357.Tamanho := 115;
    bloB357.Descricao := 'Registro: B357 � RESUMO PEND�NCIA DE PAGAMENTO';
    bloB357.TipoBloco := BlocoFilho;
    bloB357.Tabela := 'ZAC010';
    bloB357.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB357.AdicionarMetaDado(0,0,'ZAC_ZABREC','',ChaveEstrangeira);
    bloB357.AdicionarMetaDado(1,4, Texto,'ZAC_BLOCO','B357 � RESUMO PEND�NCIA DE PAGAMENTO');
    bloB357.AdicionarMetaDado(5,5,Numerico, 'ZAC_TOTPND', 'Quantidade total de ocorr�ncias (Pend�ncia de Pagamento)');
    bloB357.AdicionarMetaDado(10,28,Texto, 'ZAC_TPPND', 'Descri��o do tipo de ocorr�ncia ((Pend�ncia de Pagamento))');
    bloB357.AdicionarMetaDado(38,6,Data, 'ZAC_DTANT', 'Data da 1� ocorr�ncia (AAAAMM) mais antiga');
    bloB357.AdicionarMetaDado(44,6,Data, 'ZAC_DTREC', 'Data da �ltima ocorr�ncia (AAAAMM) mais recente');
    bloB357.AdicionarMetaDado(50,3,Texto, 'ZAC_TPMOE', 'Tipo de moeda');
    bloB357.AdicionarMetaDado(53,9,Numerico, 'ZAC_VLUPND', 'Valor da �ltima ocorr�ncia (inteiros)');
    bloB357.AdicionarMetaDado(62,20,Texto, 'ZAC_EMPRES', 'Empresa da �ltima ocorr�ncia');
    bloB357.AdicionarMetaDado(82,4,Texto, 'ZAC_FILNOM', 'Filial da empresa');
    bloB357.AdicionarMetaDado(86,2,Texto, 'ZAC_TPEFIN', 'Indica o tipo de PEFIN apresentado, com os c�digos: '+
                                                  '01 = Pend�ncia Financeira do Mercado, '+
                                                  '02 = PEFIN Conv�nio entre empresas/segmento (PEFIN fechado), '+
                                                  '03 = PEFIN INTERNO de acesso exclusivo de um CNPJ (consulta na pr�pria origem),'+
                                                  '04 = REFIN');
    bloB001.AdicionarBloco(bloB357);

    {$REGION 'B358'}
    bloB358 := TBloco.Create;
    bloB358.Nome := 'B358';
    bloB358.Tamanho := 115;
    bloB358.Descricao := 'Registro: B358- DETALHE - PEND�NCIA DE PAGAMENTO';
    bloB358.TipoBloco := BlocoFilho;
    bloB358.Tabela := 'ZAD010';
    bloB358.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB358.AdicionarMetaDado(0,0,'ZAD_ZABREC','',ChaveEstrangeira);
    bloB358.AdicionarMetaDado(1,4, Texto,'ZAD_BLOCO','B358- DETALHE - PEND�NCIA DE PAGAMENTO');
    bloB358.AdicionarMetaDado(5,2,Texto, 'ZAD_TPEFIN', 'Indica o tipo de PEFIN apresentado, com os c�digos: 01, 02, 03, 04 (ver registro B357)');
    bloB358.AdicionarMetaDado(7,12,Texto, 'ZAD_TPMOD', 'Descritivo da modalidade de cr�dito em 12 posi��es (Tabela7)');
    bloB358.AdicionarMetaDado(32,8,Data, 'ZAD_DTOCO', 'Data da ocorr�ncia (AAAAMMDD)');
    bloB358.AdicionarMetaDado(40,2,Texto, 'ZAD_DESMOD', 'Sigla indicativa do tipo de modalidade de cr�dito - Tabela 7');
    bloB358.AdicionarMetaDado(42,1,Texto, 'ZAD_CPFAVA', 'Quando o CPF for do Avalista: S= Sim e N= N�o');
    bloB358.AdicionarMetaDado(43,3,Texto, 'ZAD_TPMOE', 'Tipo de moeda');
    bloB358.AdicionarMetaDado(46,9,Numerico, 'ZAD_VLCON', 'Valor do contrato (inteiros)');
    bloB358.AdicionarMetaDado(55,17,Texto, 'ZAD_NUMCON', 'N�mero do contrato');
    bloB358.AdicionarMetaDado(72,20,Texto, 'ZAD_EMPRES', 'Empresa de origem');
    bloB358.AdicionarMetaDado(92,4,Texto, 'ZAD_CODPRA', 'C�digo da Pra�a da empresa de origem');
    bloB358.AdicionarMetaDado(96,5,Numerico, 'ZAD_TOTOCO', 'Quantidade total de ocorr�ncias');
    bloB358.AdicionarMetaDado(101,4,Texto, 'ZAD_CODINS', 'C�digo da institui��o (Banco tem 3 d�gitos e Institui��o 4)');
    bloB358.AdicionarMetaDado(105,1,Texto, 'ZAD_SUBJUD', 'Condi��o de Sub Judice = "S" ou "branco"');
    bloB358.AdicionarMetaDado(106,2,Texto, 'ZAD_ESTADO', 'Sigla do Estado.');
    bloB001.AdicionarBloco(bloB358);
    {$ENDREGION}
    {$ENDREGION}

    {$REGION 'B376'}
    bloB376 := TBloco.Create;
    bloB376.Nome := 'B376';
    bloB376.Tamanho := 115;
    bloB376.Descricao := 'Registro: B376 � Documentos Roubados, Furtados, Extraviados e Clonados';
    bloB376.TipoBloco := BlocoFilho;
    bloB376.Tabela := 'ZAM010';
    bloB376.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB376.AdicionarMetaDado(0,0,'ZAM_ZABREC','',ChaveEstrangeira);
    bloB376.AdicionarMetaDado(1,4,Texto,'ZAM_BLOCO','B376 � Documentos Roubados, Furtados, Extraviados e Clonados');
    bloB376.AdicionarMetaDado(5,1,Texto, 'ZAM_RETP1', 'Registro Tipo 1');
    bloB376.AdicionarMetaDado(6,1,Texto, 'ZAM_TPDOC', 'Tipo de documento');
    bloB376.AdicionarMetaDado(7,6,Texto, 'ZAM_DESDOC', 'Descri��o do Tipo de Documento');
    bloB376.AdicionarMetaDado(13,20,Texto, 'ZAM_NUMDOC', 'N�mero do Documento');
    bloB376.AdicionarMetaDado(33,10,Texto, 'ZAM_DTOCO', 'Data da Ocorr�ncia');
    bloB376.AdicionarMetaDado(43,10,Texto, 'ZAM_MOTOCO', 'Motivo da Ocorr�ncia');
    bloB376.AdicionarMetaDado(53,3,Texto, 'ZAM_DDDCON', 'DDD de Contato');
    bloB376.AdicionarMetaDado(56,9,Texto, 'ZAM_TELCON', 'Telefone de Contato');
    bloB001.AdicionarBloco(bloB376);
    {$ENDREGION}

    {$REGION 'B355'}
    bloB355 := TBloco.Create;
    bloB355.Nome := 'B355';
    bloB355.Tamanho := 115;
    bloB355.Descricao := 'Registro: B355 � DETALHE DE CONTUM�CIA DE SUSTA��O';
    bloB355.TipoBloco := BlocoFilho;
    bloB355.Tabela := 'ZAN010';
    bloB355.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB355.AdicionarMetaDado(0,0,'ZAN_ZABREC','',ChaveEstrangeira);
    bloB355.AdicionarMetaDado(1,4,Texto,'ZAN_BLOCO','B355 � DETALHE DE CONTUM�CIA DE SUSTA��O');
    bloB355.AdicionarMetaDado(5,8,Data, 'ZAN_DTOCO', 'Data da ocorr�ncia (AAAAMMDD)');
    bloB355.AdicionarMetaDado(13,20,Texto, 'ZAN_BANCO', 'Nome do Banco da ultima ocorr�ncia');
    bloB355.AdicionarMetaDado(33,4,Numerico, 'ZAN_AGENCI', 'Ag�ncia do Banco');
    bloB355.AdicionarMetaDado(37,8,Numerico, 'ZAN_NUMCC', 'Conta corrente');
    bloB355.AdicionarMetaDado(45,6,Numerico, 'ZAN_CHQINI', 'N�mero do cheque inicial');
    bloB355.AdicionarMetaDado(51,6,Numerico, 'ZAN_CHQFIN', 'N�mero do cheque final');
    bloB355.AdicionarMetaDado(57,10,Texto, 'ZAN_MOTIVO', 'Motivo da susta��o');
    bloB355.AdicionarMetaDado(67,5,Numerico, 'ZAN_TOTOCO', 'Quantidade total de ocorr�ncias');
    bloB001.AdicionarBloco(bloB355);
    {$ENDREGION}

    {$REGION 'B280'}
    bloB280 := TBloco.Create;
    bloB280.Nome := 'B280';
    bloB280.Tamanho := 115;
    bloB280.Descricao := 'Registro: B280 � C�LCULO DE SCORING';
    bloB280.TipoBloco := BlocoFilho;
    bloB280.Tabela := 'ZAL010';
    bloB280.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    bloB280.AdicionarMetaDado(0,0,'ZAL_ZABREC','',ChaveEstrangeira);
    bloB280.AdicionarMetaDado(1,4,Texto,'ZAL_BLOCO','B280 � C�LCULO DE SCORING');
    bloB280.AdicionarMetaDado(5,4,Data, 'ZAL_DESSCO', 'Descri��o do Scoring escolhido');
    bloB280.AdicionarMetaDado(9,6,Numerico, 'ZAL_SCORE', 'Pontua��o do Score');
    bloB280.AdicionarMetaDado(15,6,Texto, 'ZAL_NMFAIX', 'Nome das faixas da cada intervalo para classifica��o da pontua��o');
    bloB280.AdicionarMetaDado(21,5,Texto, 'ZAL_PROINA', 'Probabilidade de inadimpl�ncia');
    bloB280.AdicionarMetaDado(26,49,Texto, 'ZAL_MSGSCO', 'Mensagem relativa ao Scoring');
    bloB280.AdicionarMetaDado(75,6,Texto, 'ZAL_CODMSG', 'C�digo da mensagem');
    bloB001.AdicionarBloco(bloB280);
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'T999'}
    bloT999 := TBloco.Create;
    bloT999.Nome := 'T999';
    bloT999.Tamanho := 115;
    bloT999.AdicionarMetaDado(1,4,Texto,'Registro: T999 - MENSAGEM');
    bloT999.AdicionarMetaDado(5,3,Texto, 'C�digo da mensagem');
    bloT999.AdicionarMetaDado(8,70,Texto, 'Mensagem (ver Tabela de C�digo de Mensagem)');
    BlocoPrincipal.AdicionarBloco(bloT999);
    {$ENDREGION}
end;

procedure TArquivoRetornoSerasaCPF.DonwloadArquivo(parametro: array  of string);
var
  url: widestring;
  urlBase: string;
  param: string;
  loginSenha:string;
begin
  //montar a url com os  parametro
  loginSenha:= parametro[1]+parametro[2]+dupeString(' ',8-Length(parametro[2]));
  if producao then
      urlBase := 'https://sitenet43.serasa.com.br/Prod/consultahttps?p='+loginSenha
  else
      urlBase := 'https://mqlinuxext.serasa.com.br/Homologa/consultahttps?p='+loginSenha;


  url :=  urlBase+
         '        B49C      '+
         '@CpfFC     FI0000000            N99SINIAN                                          00N       S000000000000000S         1  '+
         '000000000000000000000000000000000000000000000000'+
         '                                                                                                                                                                                                                 '+
         'P002CB18                     CSBA                     SPC1S99S                 SPC5S99S                            T999';


  url :=  StringReplace(url,'@Cpf',ColocarZeroEsquerda(15,parametro[0]), [rfReplaceAll]);

  FUrl := url;
  Inherited;
end;


function TArquivoRetornoSerasaCPF.ObterAnotacoesSerasa(conexao: TADOConnection;
  zac_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAC010 WHERE D_E_L_E_T_  = '''' AND ZAC_ZABREC = '+inttostr(zac_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCPF.ObterChequesSemFundo(conexao: TADOConnection;
  zae_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAE010 WHERE D_E_L_E_T_  = '''' AND ZAE_ZABREC = '+inttostr(zae_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCPF.ObterCompromissosComAEmpresa(
  conexao: TADOConnection; zar_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAR010 WHERE D_E_L_E_T_  = '''' AND ZAR_ZABREC = '+inttostr(zar_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCPF.ObterCostumaciaSustacao(
  conexao: TADOConnection; zan_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAN010 WHERE D_E_L_E_T_  = '''' AND ZAN_ZABREC = '+inttostr(zan_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCPF.ObterDetalhesAnotacoesSerasa(
  conexao: TADOConnection; zad_zabrec:integer; zad_tppefin: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAD010 WHERE D_E_L_E_T_  = '''' AND ZAD_ZABREC = '+inttostr(zad_zabrec)+' AND ZAD_TPEFIN = '+QuotedStr(zad_tppefin);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCPF.ObterDetalhesChequeSemFundo(
  conexao: TADOConnection; zaf_zaerec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAF010 WHERE D_E_L_E_T_  = '''' AND ZAF_ZAEREC = '+inttostr(zaf_zaerec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCPF.ObterDetalhesProtestos(
  conexao: TADOConnection; zah_zagrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAH010 WHERE D_E_L_E_T_  = '''' AND ZAH_ZAGREC = '+inttostr(zah_zagrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCPF.ObterDetalhesResumoRegistros(
  conexao: TADOConnection; zaj_zairec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAJ010 WHERE D_E_L_E_T_  = '''' AND ZAJ_ZAIREC = '+inttostr(zaj_zairec);
    Result := ExecutarConsulta(conexao,query);

end;

function TArquivoRetornoSerasaCPF.ObterDocRoubadoClonado(
  conexao: TADOConnection; zam_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAM010 WHERE D_E_L_E_T_  = '''' AND ZAM_ZABREC = '+inttostr(zam_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;



function TArquivoRetornoSerasaCPF.ObterProtestos(conexao: TADOConnection;
  zag_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAG010 WHERE D_E_L_E_T_  = '''' AND ZAG_ZABREC = '+inttostr(zag_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;


procedure TArquivoRetornoSerasaCPF.ValidarArquivo;
var
  bloco: TBloco;
begin
    bloco := Self.BlocoPrincipal.ObterBlocoPorNome('T999');
    if bloco <> nil then
        if TDado(TMetaDado(bloco.MetaDados[1]).Dados[0]).Valor <> '000' then
            raise Exception.Create('Retorno com erro. '+ Tdado(TMetaDado(bloco.MetaDados[2]).Dados[0]).Valor);
end;

function TArquivoRetornoSerasaCPF.ObterResumoRegistros(conexao: TADOConnection;
  zai_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAI010 WHERE D_E_L_E_T_  = '''' AND ZAI_ZABREC = '+inttostr(zai_zabrec);
    Result := ExecutarConsulta(conexao,query);

end;

function TArquivoRetornoSerasa.ColocarZeroEsquerda(tamanhoNumero: integer;
  numero: string): string;
var
    quantidadeZeros: Integer;
begin
    quantidadeZeros := tamanhoNumero-length(numero);
    result :=  StringOfChar('0',quantidadeZeros)+ numero;
end;



function TArquivoRetornoSerasa.ObterUltimaConsultaSerasa(conexao: TADOConnection; cpfCNPJ: string): TADOQuery;
var
    query: string;
begin
    if length(cpfCNPJ)  = 14 then
      cpfCNPJ := copy(cpfCNPJ,1,8);

    query := 'SELECT TOP 1 * FROM ZAA010 '+
                  ' WHERE ZAA_CPFCGC = '+QuotedStr(cpfCNPJ) +
                  ' AND CONVERT(VARCHAR(8), GETDATE(),112) <= CONVERT(VARCHAR(8), DATEADD(MONTH,'+ ObterQuantidadeDeMesesParaConsulta(conexao) +',ZAA_DTCON),112) '+
                  ' ORDER BY R_E_C_N_O_ DESC ';
    result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasa.ObterInformacoesScore(conexao: TADOConnection;
  zal_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAL010 WHERE D_E_L_E_T_  = '''' AND ZAL_ZABREC = '+inttostr(zal_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;


function TArquivoRetornoSerasa.ObterQuantidadeDeMesesParaConsulta(conexao: TADOConnection): string;
var
    query: string;
begin
    query := 'SELECT * FROM SIATD_S14 WHERE S14_NOME = ''DIASSERASA'' ';
    result := ExecutarConsulta(conexao,query).Fields.FieldByName('S14_VALOR').AsString;
end;

function TArquivoRetornoSerasa.ObterConsultaSerasaPorRecno(
  conexao: TADOConnection; recno: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAA010 '+
                  ' WHERE R_E_C_N_O_ = '+recno +
                  ' ORDER BY R_E_C_N_O_ DESC ';
    result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasa.ObterInformacoesCadastrais(
  conexao: TADOConnection; zab_zaarec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAB010 WHERE D_E_L_E_T_  = '''' AND ZAB_ZAAREC = '+inttostr(zab_zaarec);
    Result := ExecutarConsulta(conexao,query);
end;


{ TArquivoRetornoSerasaCNPJ }

procedure TArquivoRetornoSerasaCNPJ.AjustarInformacoes;
    procedure ExecutarCopiaDados(bSoc, bAdm: TBloco; posicaoDadoSoc, linhaPai: integer; tipoPessoa: string);
    var
        i,j:integer;
        b1,b2: TBloco;
    begin
       for j := 0 to bSoc.ObterTotalBlocosFilhos-1 do
       begin
           b1 := bSoc.Blocos[j];
           b2 := bAdm.Blocos[j];

           if (tipoPessoa = 'F') and ((b1.Nome = 'L010119') or (b1.Nome = 'L010120'))then continue;
           if (tipoPessoa = 'J') and ((b1.Nome = 'L010117') or (b1.Nome = 'L010118'))then continue;

           if b1.TipoBloco = BlocoAgrupador then
           begin
              ExecutarCopiaDados(b1,b2,posicaoDadoSoc, linhaPai, tipoPessoa);
              exit;
           end;

           for i := 0 to b1.ObterTotalMetadados-1 do
           begin
               b2.MetaDados[i].AdicionarDados(b1.metaDados[i].ObterTotalDados+1,
                                             trim(b1.MetaDados[i].Dados[posicaoDadoSoc].Chave),
                                             '',
                                             linhaPai);
          end;
       end;
    end;
var
    blcPrincipal, blcSocio, blcAdministrador, blc: TBloco;
    metaSoc, metaAdm: TMetaDado;
    dadoSoc, dadoAdm: TDado;
    tipoPessoa: string;
    i, j, linhaPai: Integer;
begin
    inherited;
    blcPrincipal := Self.BlocoPrincipal.ObterBlocoPorNome('L010000');
    blcPrincipal := blcPrincipal.ObterBlocoPorNome('L010102');

    blcSocio := blcPrincipal.ObterBlocoPorNome('L010108');
    blcSocio := blcSocio.ObterBlocoPorNome('L010109');

    blcAdministrador := blcPrincipal.ObterBlocoPorNome('L010110');
    blcAdministrador := blcAdministrador.ObterBlocoPorNome('L010111');

    metaSoc :=  blcSocio.ObterMetaDadoPorNome('ZAT_DOC');
    metaADm :=  blcAdministrador.ObterMetaDadoPorNome('ZAT_DOC');

    for i := 0 to metaSoc.ObterTotalDados-1 do
    begin
        dadoSoc := metaSoc.Dados[i];
        for j := 0 to metaAdm.ObterTotalDados-1 do
        begin
            dadoAdm := metaAdm.Dados[j];
            if dadoSoc.Valor = dadoAdm.Valor then
            begin
                tipoPessoa :=  blcSocio.ObterMetaDadoPorNome('ZAT_IDENT').Dados[i].Valor;
                linhaPai := blcSocio.ObterMetaDadoPorNome('ZAT_IDENT').Dados[i].Linha;
                ExecutarCopiaDados(blcSocio, blcAdministrador, i, linhaPai, tipoPessoa);
            end;
        end;
    end;
end;

constructor TArquivoRetornoSerasaCNPJ.Create(diretorio, usuario: string;
  producao: boolean);
var
    blocoConsulta, blocoID, blocoPrimario, BlocoSecundario, BlocoTerciario, BlocoQuartiario: TBloco;

    //empresa consultada
    blcPefin, blcRefin, blcAcaoJudicial, blcProtesto, blcParticipacaoFalencia, blcChequeSemFundo, blcChequeSustadoCancelado: TBloco;
    // socios
    blcPefin1, blcRefin1, blcAcaoJudicial1, blcProtesto1, blcParticipacaoFalencia1, blcChequeSemFundo1, blcChequeSustadoCancelado1: TBloco;
    //Adminsitradores
    blcPefin2, blcRefin2, blcAcaoJudicial2, blcProtesto2, blcParticipacaoFalencia2, blcChequeSemFundo2, blcChequeSustadoCancelado2: TBloco;

    blocoAgrupador1, blocoAgrupador2: TBloco;
begin
    inherited;
    {$REGION 'registro de consulta'}
    blocoConsulta := TBloco.Create;
    blocoConsulta.Nome := 'L010000';
    blocoConsulta.SeparadorBloco := '#';
    blocoConsulta.Tabela := 'ZAA010';
    blocoConsulta.TipoBloco := BlocoPai;
    blocoConsulta.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoConsulta.AdicionarMetaDado(0,0,'ZAA_ARQ','',ArquivoBlob);
    blocoConsulta.AdicionarMetaDado(90,9,Texto, 'ZAA_CPFCGC','N�mero do CNPJ');
    blocoConsulta.AdicionarMetaDado('ZAA_USER', 'Usu�rio do sistema', usuario);
    blocoConsulta.AdicionarMetaDado('ZAA_DTCON','Data de realiza��o da consulta (AAAAMMDD)', FormatDateTime('YYYYMMDD',Now));
    blocoConsulta.AdicionarMetaDado('ZAA_HRCON','Hor�rio de realiza��o da consulta (HHMMSS)', FormatDateTime('HHMMSS',Now));
    Self.BlocoPrincipal.AdicionarBloco(blocoConsulta);
    {$ENDREGION}

    {$REGION 'Identifica��o'}
    blocoID := TBloco.Create;
    blocoID.Nome := 'L010102';
    blocoID.SeparadorBloco := '#';
    blocoID.Descricao := 'Identifica��o';
    blocoID.TipoBloco := BlocoPai;
    blocoID.Tabela := 'ZAB010';
    blocoID.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoID.AdicionarMetaDado(0,0,'ZAB_ZAAREC','',ChaveEstrangeira);
    blocoID.AdicionarMetaDado(1,7,Texto, 'ZAB_BLOCO','L010102 - identifica��o');
    blocoID.AdicionarMetaDado(8,70,Texto, 'ZAB_NOME','RAZ�O SOCIAL'); // AUMENTAR
    blocoID.AdicionarMetaDado(79,8,Texto,'ZAB_CPFCGC','CNPJ DA EMPRESA.');
    blocoID.AdicionarMetaDado(87,60,Texto,'ZAB_NOMFAN','NOME FANTASIA DA EMPRESA.');  //*
    blocoID.AdicionarMetaDado(147,11,Numerico,'ZAB_NIRE','N�MERO DE INSCRI��O NO REGISTRO DE EMPRESAS (NIRE)'); //*
    blocoID.AdicionarMetaDado(158,60,Texto,'ZAB_TIPSOC','DESCRICAO DO TIPO DE SOCIEDADE'); //*
    blocoID.AdicionarMetaDado(218,30,Texto,'ZAB_OPCTRI','OPCAOTRIBUTARIA');   //*
    blocoConsulta.AdicionarBloco(blocoID);

    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L010103';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Endereco';
    blocoPrimario.TipoBloco := BlocoContinuacao;
    blocoPrimario.AdicionarMetaDado(1,7,Texto, 'Endere�o');
    blocoPrimario.AdicionarMetaDado(108,80,Texto, 'ZAB_ENDER','ENDERE�O DA EMPRESA (TIPO + ENDERE�O + N�MERO)');   // AUMENTAR
    blocoPrimario.AdicionarMetaDado(78,30,Texto, 'ZAB_BAIRRO', 'Bairro');   //AUMENTAR
    blocoID.AdicionarBloco(blocoPrimario);
    //
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L010104';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Localiza��o';
    blocoPrimario.TipoBloco := BlocoContinuacao;
    blocoPrimario.AdicionarMetaDado(1,7,Texto, 'Localiza��o');
    blocoPrimario.AdicionarMetaDado(8,30,Texto, 'ZAB_CIDADE', 'CIDADE');    //AUMENTAR
    blocoPrimario.AdicionarMetaDado(38,2,Texto, 'ZAB_ESTADO', 'UNIDADE DA FEDERACAO');
    blocoPrimario.AdicionarMetaDado(41,8,Texto, 'ZAB_CEP', 'CEP DA EMPRESA');   // AUMENTAR
    blocoPrimario.AdicionarMetaDado(49,4,Numerico, 'ZAB_DDDCOM', 'DDD - DA LOCALIDADE');
    blocoPrimario.AdicionarMetaDado(53,9,Numerico, 'ZAB_TELCOM', 'NUMERO DE TELEFONE');
    blocoPrimario.AdicionarMetaDado(62,9,Numerico, 'ZAB_NUMFAX', 'NUMERO DO FAX'); //*
    blocoPrimario.AdicionarMetaDado(75,70,Texto, 'ZAB_HOMPAG', 'HOME PAGE'); //*
    blocoID.AdicionarBloco(blocoPrimario);
    //
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L010105';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Atividade';
    blocoPrimario.TipoBloco := BlocoContinuacao;
    blocoPrimario.AdicionarMetaDado(1,7,Texto, 'Atividade');
    blocoPrimario.AdicionarMetaDado(8,8,Texto, 'ZAB_DTFUND', 'DATA DA FUNDA��O DA EMPRESA (AAAAMMDD)');  //*
    blocoPrimario.AdicionarMetaDado(16,8,Texto, 'ZAB_DTCNPJ', 'DATA DA INSCRI��O DO CNPJ   (AAAAMMDD)'); //*
    blocoPrimario.AdicionarMetaDado(24,54,Texto, 'ZAB_RAMO', 'RAMO DE ATIVIDADE DA EMPRESA'); //*
    blocoPrimario.AdicionarMetaDado(78,7,Texto, 'ZAB_CODSER', 'C�DIGO SERASA COMPLETO'); //*
    blocoPrimario.AdicionarMetaDado(85,5,Numerico, 'ZAB_QTEMPR', 'QUANTIDADE DE EMPREGADOS'); //*
    blocoPrimario.AdicionarMetaDado(90,3,Numerico, 'ZAB_PERCOM', 'PERCENTUAL DE COMPRA'); //*
    blocoPrimario.AdicionarMetaDado(93,3,Numerico, 'ZAB_PERVEN', 'PERCENTUAL DE VENDAS'); //*
    blocoPrimario.AdicionarMetaDado(99,6,Numerico, 'ZAB_NUMFIL', 'NUMERO DE FILIAIS'); //*
    blocoPrimario.AdicionarMetaDado(105,6,Texto, 'ZAB_CNAE', 'CNAE');  //*
    blocoID.AdicionarBloco(blocoPrimario);

    {$REGION 'FIlial da empresa'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Descricao := 'Filiais';
    blocoPrimario.Nome := 'L010106';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZAV010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZAV_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(8,30,Texto, 'ZAV_FILEMP', 'NOME DA FILIAL');
    blocoPrimario.AdicionarMetaDado(38,4,Texto, 'ZAV_CODEMB', 'C�DIGO DA EMBRATEL');
    blocoID.AdicionarBloco(blocoPrimario);
    {$ENDREGION}

   {$REGION 'Pend�ncias Finnaceiras da Empresa Consultada'}
    blcPefin := TBloco.Create;
    blcPefin.Nome := 'L040101';
    blcPefin.SeparadorBloco := '#';
    blcPefin.Tabela := 'ZBF010';
    blcPefin.AdicionarBlocoLimite('L010117');
    blcPefin.AdicionarBlocoLimite('L010119');
    blcPefin.Descricao := 'Pefin';
    blcPefin.TipoBloco := BlocoFilho;
    blcPefin.AdicionarMetaDado('ZBF_BLCMAE','TIPO','L010102');
    blcPefin.AdicionarMetaDado(0,0,'ZBF_RECMAE','',ChaveEstrangeira);
    blcPefin.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blcPefin.AdicionarMetaDado('ZBF_TIPPEN','TIPO','PEFIN');
    blcPefin.AdicionarMetaDado(8,9, Numerico, 'ZBF_QTPEND','QUANTIDADE PEND�NCIAS FINANCEIRAS');
    blcPefin.AdicionarMetaDado(17,9, Numerico, 'ZBF_QTUOCO','QUANTIDADE ULTIMA OCORRENCIA');
    blcPefin.AdicionarMetaDado(26,8, Texto, 'ZBF_DTPEN','DATA DA OCORRENCIA (AAAAMMDD)');
    blcPefin.AdicionarMetaDado(34,12, Texto, 'ZBF_TITOCO','TITULO DA OCORRENCIA');
    blcPefin.AdicionarMetaDado(46,1, Texto, 'ZBF_AVALIS','AVALISTA');
    blcPefin.AdicionarMetaDado(47,13, Numerico, 'ZBF_VALPEN','VALOR DA PENDENCIA');
    blcPefin.AdicionarMetaDado(60,16, Texto, 'ZBF_CONTRA','CONTRATO');
    blcPefin.AdicionarMetaDado(76,20, Texto, 'ZBF_ORIGEM','ORIGEM');
    blcPefin.AdicionarMetaDado(96,4, Texto, 'ZBF_FILOCO','FILIAL DA OCORRENCIA');
    blcPefin.AdicionarMetaDado(100,32, Texto, 'ZBF_MSGSUB','QUANDO N�O EXISTIR A PRACA ESTA MENSAGEM FORMATADA � MOSTRADA EM SUBSTITUI��O AOS CAMPOS ABAIXO '+
                                              'PRACA-PEF, DISTR-PEF, VARA-PRO, DATA-PEF E PROC-PEF.');
    blcPefin.AdicionarMetaDado(132,4, Texto, 'ZBF_PRACA','SUBJUDICE - PRACA');
    blcPefin.AdicionarMetaDado(136,2, Texto, 'ZBF_DISTRI','SUBJUDICE - DISTRITO');
    blcPefin.AdicionarMetaDado(138,2, Texto, 'ZBF_VARA','SUBJUDICE - VARA');
    blcPefin.AdicionarMetaDado(140,8, Texto, 'ZBF_DATA','SUBJUDICE - DATA');
    blcPefin.AdicionarMetaDado(148,16, Texto, 'ZBF_PROCES','SUBJUDICE - PROCESSO');
    blcPefin.AdicionarMetaDado(164,3, Texto, 'ZBF_CODNAT',' CODIGO NATUREZA (VIDE TABELA ANEXA)');
    blcPefin.AdicionarMetaDado(191,76, Texto, 'ZBF_MSG','MENSAGEM SUBJUDICE');
    blcPefin.AdicionarMetaDado(268,13, Numerico, 'ZBF_VALTOT','VALOR TOTAL DA PENDENCIA FINANCEIRA');
    blocoID.AdicionarBloco(blcPefin);
    //
    blcRefin := TBloco.Create;
    blcRefin.Nome := 'L040102';
    blcRefin.SeparadorBloco := '#';
    blcRefin.Tabela := 'ZBF010';
    blcRefin.AdicionarBlocoLimite('L010117');
    blcRefin.AdicionarBlocoLimite('L010119');
    blcRefin.Descricao := 'Refin';
    blcRefin.TipoBloco := BlocoFilho;
    blcPefin.CopiarMetadados(blcRefin);
    blcRefin.RemoverMetadadoPorNomeCampo('ZBF_TIPPEN');
    blcRefin.AdicionarMetaDado('ZBF_TIPPEN','TIPO','REFIN');
    blocoID.AdicionarBloco(blcRefin);
    //
    blcProtesto := TBloco.Create;
    blcProtesto.Nome := 'L040301';
    blcProtesto.SeparadorBloco := '#';
    blcProtesto.Tabela := 'ZBG010';
    blcProtesto.AdicionarBlocoLimite('L010117');
    blcProtesto.AdicionarBlocoLimite('L010119');
    blcProtesto.Descricao := 'Protesto';
    blcProtesto.TipoBloco := BlocoFilho;
    blcProtesto.AdicionarMetaDado('ZBG_BLCMAE','TIPO','L010102');
    blcProtesto.AdicionarMetaDado(0,0,'ZBG_RECMAE','',ChaveEstrangeira);
    blcProtesto.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blcProtesto.AdicionarMetaDado(8,9, Numerico, 'ZBG_QTPROT','QUANTIDADE PROTESTOS');
    blcProtesto.AdicionarMetaDado(17,8, Data, 'ZBG_DTPROT','DATA DO PROTESTO (AAAAMMDD)');
    blcProtesto.AdicionarMetaDado(25,3, Texto, 'ZBG_MOEDA','MOEDA');
    blcProtesto.AdicionarMetaDado(28,13, Numerico, 'ZBG_VALPRO','VALOR DA PROTESTO');
    blcProtesto.AdicionarMetaDado(41,2, Texto, 'ZBG_CARTOR','CARTORIO');
    blcProtesto.AdicionarMetaDado(43,30, Texto, 'ZBG_CIDADE','CIDADE');
    blcProtesto.AdicionarMetaDado(73,2, Texto, 'ZBG_UF','UF');
    blcProtesto.AdicionarMetaDado(75,32, Texto, 'ZBG_MSGSUB','QUANDO N�O EXISTIR A PRACA ESTA MENSAGEM FORMATADA � MOSTRADA EM SUBSTITUI��O AOS CAMPOS ABAIXO '+
                                              'PRACA-PEF, DISTR-PEF, VARA-PRO, DATA-PEF E PROC-PEF.');
    blcProtesto.AdicionarMetaDado(107,4, Texto, 'ZBG_PRACA','SUBJUDICE - PRACA');
    blcProtesto.AdicionarMetaDado(111,2, Texto, 'ZBG_DISTRI','SUBJUDICE - DISTRITO');
    blcProtesto.AdicionarMetaDado(113,2, Texto, 'ZBG_VARA','SUBJUDICE - VARA');
    blcProtesto.AdicionarMetaDado(115,8, Data, 'ZBG_DATA','SUBJUDICE - DATA');
    blcProtesto.AdicionarMetaDado(123,16, Texto, 'ZBG_PROCES','SUBJUDICE - PROCESSO');
    blcProtesto.AdicionarMetaDado(139,3, Texto, 'ZBG_CODNAT',' CODIGO NATUREZA (VIDE TABELA ANEXA)');
    blcProtesto.AdicionarMetaDado(167,8, Data, 'ZBG_DTRECE','DATA DE RECEBIMENTO DA CARTA DE ANUENCIA');
    blcProtesto.AdicionarMetaDado(175,76, Texto, 'ZBG_MSG','MENSAGEM SUBJUDICE');
    blocoID.AdicionarBloco(blcProtesto);
    //
    blcAcaoJudicial := TBloco.Create;
    blcAcaoJudicial.Nome := 'L040401';
    blcAcaoJudicial.SeparadorBloco := '#';
    blcAcaoJudicial.Tabela := 'ZBH010';
    blcAcaoJudicial.AdicionarBlocoLimite('L010117');
    blcAcaoJudicial.AdicionarBlocoLimite('L010119');
    blcAcaoJudicial.Descricao := 'A��o Judicial';
    blcAcaoJudicial.TipoBloco := BlocoFilho;
    blcAcaoJudicial.AdicionarMetaDado('ZBH_BLCMAE','TIPO','L010102');
    blcAcaoJudicial.AdicionarMetaDado(0,0,'ZBH_RECMAE','',ChaveEstrangeira);
    blcAcaoJudicial.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blcAcaoJudicial.AdicionarMetaDado(8,9, Numerico, 'ZBH_QTACAO','QUANTIDADE ACAO JUDICIAL');
    blcAcaoJudicial.AdicionarMetaDado(17,8, Data, 'ZBH_DTACAO','DATA DA A��O JUDICIAL(AAAAMMDD)');
    blcAcaoJudicial.AdicionarMetaDado(25,20, Texto, 'ZBH_NATUR','NATUREZA');
    blcAcaoJudicial.AdicionarMetaDado(45,1, Texto, 'ZBH_AVALIS','AVALISTA');
    blcAcaoJudicial.AdicionarMetaDado(46,3, Texto, 'ZBH_MOEDA','MOEDA');
    blcAcaoJudicial.AdicionarMetaDado(49,13, Numerico, 'ZBH_VALACA','VALOR DA ACAO JUDICIAL');
    blcAcaoJudicial.AdicionarMetaDado(62,2, Texto, 'ZBH_DIST','DISTRITO');
    blcAcaoJudicial.AdicionarMetaDado(64,4, Texto, 'ZBH_VARA','VARA CIVIL');
    blcAcaoJudicial.AdicionarMetaDado(68,30, Texto, 'ZBH_CIDADE','CIDADE');
    blcAcaoJudicial.AdicionarMetaDado(98,2, Texto, 'ZBH_UF','UF');
    blcAcaoJudicial.AdicionarMetaDado(100,32, Texto, 'ZBH_MSGSUB','QUANDO N�O EXISTIR A PRACA ESTA MENSAGEM FORMATADA � MOSTRADA EM SUBSTITUI��O AOS CAMPOS ABAIXO '+
                                              'PRACA-PEF, DISTR-PEF, VARA-PRO, DATA-PEF E PROC-PEF.');
    blcAcaoJudicial.AdicionarMetaDado(132,4, Texto, 'ZBH_PRACA','SUBJUDICE - PRACA');
    blcAcaoJudicial.AdicionarMetaDado(136,2, Texto, 'ZBH_DISTRI','SUBJUDICE - DISTRITO');
    blcAcaoJudicial.AdicionarMetaDado(138,2, Texto, 'ZBH_VARSUB','SUBJUDICE - VARA');
    blcAcaoJudicial.AdicionarMetaDado(140,8, Data, 'ZBH_DATA','SUBJUDICE - DATA');
    blcAcaoJudicial.AdicionarMetaDado(148,16, Texto, 'ZBH_PROCES','SUBJUDICE - PROCESSO');
    blcAcaoJudicial.AdicionarMetaDado(164,3, Texto, 'ZBH_CODNAT',' CODIGO NATUREZA (VIDE TABELA ANEXA)');
    blcAcaoJudicial.AdicionarMetaDado(191,76, Texto, 'ZBH_MSG','MENSAGEM SUBJUDICE');
    blocoID.AdicionarBloco(blcAcaoJudicial);
    //
    blcParticipacaoFalencia := TBloco.Create;
    blcParticipacaoFalencia.Nome := 'L040501';
    blcParticipacaoFalencia.SeparadorBloco := '#';
    blcParticipacaoFalencia.Tabela := 'ZBI010';
    blcParticipacaoFalencia.AdicionarBlocoLimite('L010117');
    blcParticipacaoFalencia.AdicionarBlocoLimite('L010119');
    blcParticipacaoFalencia.Descricao := 'Participa��o em Fal�ncia';
    blcParticipacaoFalencia.TipoBloco := BlocoFilho;
    blcParticipacaoFalencia.AdicionarMetaDado('ZBI_BLCMAE','TIPO','L010102');
    blcParticipacaoFalencia.AdicionarMetaDado(0,0,'ZBI_RECMAE','',ChaveEstrangeira);
    blcParticipacaoFalencia.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blcParticipacaoFalencia.AdicionarMetaDado(8,9, Numerico, 'ZBI_QTPART','QUANTIDADE PARTICIPA��O');
    blcParticipacaoFalencia.AdicionarMetaDado(17,8, Data, 'ZBI_DTACAO','DATA DA PARTICIPA��O(AAAAMMDD)');
    blcParticipacaoFalencia.AdicionarMetaDado(25,20, Texto, 'ZBI_TIPO','TIPO DE PARTICIPA��O');
    blcParticipacaoFalencia.AdicionarMetaDado(45,9, Texto, 'ZBI_CNPJ','CNPJ DA PARTICIPA��O');
    blcParticipacaoFalencia.AdicionarMetaDado(54,68, Texto, 'ZBI_EMPPAR','EMPRESA DA PARTICIPA��O');
    blcParticipacaoFalencia.AdicionarMetaDado(140,3, Texto, 'ZBI_CODNAT','C�DIGO DA NATUREZA');
    blocoID.AdicionarBloco(blcParticipacaoFalencia);
    //
    blcChequeSemFundo := TBloco.Create;
    blcChequeSemFundo.Nome := 'L040901';
    blcChequeSemFundo.SeparadorBloco := '#';
    blcChequeSemFundo.Tabela := 'ZBJ010';
    blcChequeSemFundo.AdicionarBlocoLimite('L010117');
    blcChequeSemFundo.AdicionarBlocoLimite('L010119');
    blcChequeSemFundo.Descricao := 'Cheque sem fundo';
    blcChequeSemFundo.TipoBloco := BlocoFilho;
    blcChequeSemFundo.AdicionarMetaDado('ZBJ_BLCMAE','TIPO','L010102');
    blcChequeSemFundo.AdicionarMetaDado(0,0,'ZBJ_RECMAE','',ChaveEstrangeira);
    blcChequeSemFundo.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blcChequeSemFundo.AdicionarMetaDado(8,9, Numerico, 'ZBJ_QTCQFU','QUANTIDADE CHEQUE SEM FUNDO');
    blcChequeSemFundo.AdicionarMetaDado(17,8, Data, 'ZBJ_DTACAO','DATA DO CHEQUE SEM FUNDO(AAAAMMDD)');
    blcChequeSemFundo.AdicionarMetaDado(25,6, Texto, 'ZBJ_NUMCHQ','NUMERO DO CHEQUE SEM FUNDO');
    blcChequeSemFundo.AdicionarMetaDado(31,5, Numerico, 'ZBJ_QTBANC','QUANTIDADE NO BANCO');
    blcChequeSemFundo.AdicionarMetaDado(36,16, Texto, 'ZBJ_BANCO','BANCO');
    blcChequeSemFundo.AdicionarMetaDado(52,4, Numerico, 'ZBJ_AGENC','AGENCIA');
    blcChequeSemFundo.AdicionarMetaDado(56,30, Texto, 'ZBJ_CIDADE','CIDADE');
    blcChequeSemFundo.AdicionarMetaDado(86,2, Texto, 'ZBJ_UF','UF');
    blcChequeSemFundo.AdicionarMetaDado(88,3, Texto, 'ZBJ_CODNAT','CODIGO NATUREZA (VIDE TABELA ANEXA)');
    blocoID.AdicionarBloco(blcChequeSemFundo);
    //
    blcChequeSustadoCancelado := TBloco.Create;
    blcChequeSustadoCancelado.Nome := 'L041000';
    blcChequeSustadoCancelado.SeparadorBloco := '#';
    blcChequeSustadoCancelado.Tabela := 'ZBL010';
    blcChequeSustadoCancelado.AdicionarBlocoLimite('L010117');
    blcChequeSustadoCancelado.AdicionarBlocoLimite('L010119');
    blcChequeSustadoCancelado.Descricao := 'Cheque sustado e cancelado';
    blcChequeSustadoCancelado.TipoBloco := BlocoFilho;
    blcChequeSustadoCancelado.AdicionarMetaDado('ZBL_BLCMAE','TIPO','L010102');
    blcChequeSustadoCancelado.AdicionarMetaDado(0,0,'ZBL_RECMAE','',ChaveEstrangeira);
    blcChequeSustadoCancelado.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blcChequeSustadoCancelado.AdicionarMetaDado(8,9, Numerico, 'ZBL_QTCQFU','QUANTIDADE CHEQUE SUSTADO OU CANCELADO');
    blcChequeSustadoCancelado.AdicionarMetaDado(17,9, Numerico, 'ZBL_QTUOCO','QT �LTIMA OCORR�NCIA');
    blocoID.AdicionarBloco(blcChequeSustadoCancelado);

    BlocoSecundario := TBloco.Create;
    BlocoSecundario.Nome := 'L041001';
    BlocoSecundario.SeparadorBloco := '#';
    BlocoSecundario.Descricao := 'Cheque sustado e cancelado - detalhe';
    BlocoSecundario.TipoBloco := BlocoContinuacao;
    BlocoSecundario.AdicionarMetaDado(8,8, Data, 'ZBL_DATA','DATA');
    BlocoSecundario.AdicionarMetaDado(16,16, Texto, 'ZBL_BANCO','BANCO');
    BlocoSecundario.AdicionarMetaDado(32,4, Texto, 'ZBL_AGENCI','AGENCIA');
    BlocoSecundario.AdicionarMetaDado(36,6, Texto, 'ZBL_CONTA','CONTA CORRENTE');
    BlocoSecundario.AdicionarMetaDado(42,1, Texto, 'ZBL_DIGIT','DIGITO DA CONTA');
    BlocoSecundario.AdicionarMetaDado(43,6, Texto, 'ZBL_CQINI','CHEQUE INICIAL');
    BlocoSecundario.AdicionarMetaDado(49,6, Texto, 'ZBL_CQFIN','CHEQUE FINAL');
    BlocoSecundario.AdicionarMetaDado(55,10, Texto, 'ZBL_MOTIVO','MOTIVO');
    //BlocoSecundario.AdicionarMetaDado(65,12, Numerico, 'ZBL_CONT12','CONTA CORRENTE COM 12 BYTES');
    blcChequeSustadoCancelado.AdicionarBloco(BlocoSecundario);
    {$ENDREGION}
    {$ENDREGION}

    {$REGION 'Controle Societ�rio'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Descricao := 'Controle Societ�rio';
    blocoPrimario.Nome := 'L010108';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZAS010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZAS_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado('ZAS_TIPO', 'TIPO', 'SOCIOS');
    blocoPrimario.AdicionarMetaDado(8,8,Data, 'ZAS_DTATU', 'DATA DA �LTIMA ATUALIZA��O DAS INFORMA��ES (AAAAMMDD)');
    blocoPrimario.AdicionarMetaDado(16,13,Numerico, 'ZAS_VALCAP', 'VALOR DO CAPITAL SOCIAL');
    blocoPrimario.AdicionarMetaDado(29,13,Numerico, 'ZAS_VALREA', 'VALOR DO CAPITAL REALIZADO');
    blocoPrimario.AdicionarMetaDado(42,13,Numerico, 'ZAS_VALAUT', 'VALOR DO CAPITAL AUTORIZADO');
    blocoPrimario.AdicionarMetaDado(55,12,Texto, 'ZAS_NACION', 'DESCRICAO NACIONALIDADE');
    blocoPrimario.AdicionarMetaDado(67,12,Texto, 'ZAS_ORIGEM', 'DESCRICAO DA ORGIGEM');
    blocoPrimario.AdicionarMetaDado(79,12,Texto, 'ZAS_NATURE', 'DESCRICAO DA NATUREZA');
    blocoID.AdicionarBloco(blocoPrimario);

    blocoSecundario := TBloco.Create;
    blocoSecundario.Descricao := 'Detalhes dos s�cios';
    blocoSecundario.Nome := 'L010109';
    blocoSecundario.SeparadorBloco := '#';
    blocoSecundario.TipoBloco := BlocoFilho;
    BlocoSecundario.Excecao := true;
    BlocoSecundario.Tabela := 'ZAT010';
    blocoSecundario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoSecundario.AdicionarMetaDado(0,0,'ZAT_ZASREC','',ChaveEstrangeira);
    blocoSecundario.AdicionarMetaDado(8,1, Texto,'ZAT_IDENT','IDENTIFICA��O F�SICA (F) OU JUR�DICA (J)');
    blocoSecundario.AdicionarMetaDado(9,9, Texto, 'ZAT_DOC', 'CNPJ  OU CPF DO S�CIO (SE N�O CONFIRMADO SER� ZEROS)');
    blocoSecundario.AdicionarMetaDado(22,2,Texto,'ZAT_DIGITO', 'D�GITO CONTROLE DO CPF QUANDO FOR IDENTIF. F�SICA');
    blocoSecundario.AdicionarMetaDado(24,65,Texto,'ZAT_NOME', 'NOME DO S�CIO OU ADMINISTRADOR');
    blocoSecundario.AdicionarMetaDado(89,12,Texto,'ZAT_PAIS', 'PAIS DE ORIGEM');
    blocoSecundario.AdicionarMetaDado(101,4,'ZAT_PERCEN', 'PERCENTUAL DO CAPITAL',1);
    blocoSecundario.AdicionarMetaDado(105,8,Data,'ZAT_DTENTR', 'DATA DE ENTRADA (AAAAMMDD)');
    blocoSecundario.AdicionarMetaDado(114,4,'ZAT_PERVOT', 'PERCENTUAL VOTANTE',1);
    blocoSecundario.AdicionarMetaDado(118,2,Texto,'ZAT_CODSIT', 'C�DIGO DA SITUA��O DA EMPRESA: '+
                                                                   '02-ATIVA '+
                                                                   '03-INATIVA '+
                                                                   '00-INAPTA '+
                                                                   '04-N�O LOCALIZADA '+
                                                                   '05-EM LIQUIDA��O '+
                                                                   '07-N�O CADASTRADA '+
                                                                   '06-SUSPENSO '+
                                                                    '09-CANCELADO');
    blocoSecundario.AdicionarMetaDado(120,7,Texto,'ZAT_CODSER', 'CODIGO DO SERASA');
    blocoPrimario.AdicionarBloco(BlocoSecundario);

    {$REGION 'Informa��es adicionais dos socios'}
    // Bloco que serve somente para agrupar informa��es para serem copiadas a outros blocos
    blocoAgrupador1 := TBloco.Create;
    blocoAgrupador1.TipoBloco := BlocoAgrupador;
    BlocoSecundario.AdicionarBloco(blocoAgrupador1);

    //CNPJ
    BlocoTerciario := TBloco.Create;
    BlocoTerciario.Nome := 'L010119';
    BlocoTerciario.SeparadorBloco := '#';
    BlocoTerciario.Descricao := 'Informacoes Adicionais Socios';
    BlocoTerciario.TipoBloco := BlocoContinuacao;
    BlocoTerciario.Excecao := true;
    BlocoTerciario.AdicionarMetaDado(23,8,Data, 'ZAT_DTFUND', 'Data Funda��o');
    BlocoTerciario.AdicionarMetaDado(31,8,Data, 'ZAT_DTATU', 'Data Atuali��o');
    BlocoTerciario.AdicionarMetaDado(39,70,Texto, 'ZAT_RAZAO', 'Raz�o social');
    BlocoTerciario.AdicionarMetaDado(109,30,Texto, 'ZAT_FANTAS', 'Nome fantasia');
    BlocoTerciario.AdicionarMetaDado(139,1,Texto, 'ZAT_VINC', 'V�nculo do S�cio com a Empresa '+
                                                              ' A = ADMINITRADOR '+
                                                              ' S = SOCIO ');
    blocoAgrupador1.AdicionarBloco(BlocoTerciario);


    BlocoQuartiario := TBloco.Create;
    BlocoQuartiario.Nome := 'L010120';
    BlocoQuartiario.SeparadorBloco := '#';
    BlocoQuartiario.Descricao := 'Dados Complementares';
    BlocoQuartiario.TipoBloco := BlocoContinuacao;
    //BlocoQuartiario.Excecao := true;
    BlocoQuartiario.AdicionarMetaDado(8,70,Texto, 'ZAT_LOGRA', 'Nome do Logradouro');
    BlocoQuartiario.AdicionarMetaDado(78,20,Texto, 'ZAT_BAIRRO', 'Bairro');
    BlocoQuartiario.AdicionarMetaDado(98,30,Texto, 'ZAT_CIDADE', 'Cidade');
    BlocoQuartiario.AdicionarMetaDado(128,2,Texto, 'ZAT_ESTADO', 'Estado');
    BlocoQuartiario.AdicionarMetaDado(130,9,Texto, 'ZAT_CEP', 'CEP');
    BlocoQuartiario.AdicionarMetaDado(139,4,Texto, 'ZAT_DDD', 'DDD');
    BlocoQuartiario.AdicionarMetaDado(143,9,Texto, 'ZAT_TEL', 'Telefone');
    BlocoQuartiario.AdicionarMetaDado(152,4,Texto, 'ZAT_RAMAL', 'Ramal');
    BlocoTerciario.AdicionarBloco(BlocoQuartiario);

    // CPF
    BlocoTerciario := TBloco.Create;
    BlocoTerciario.Descricao := 'Informacoes Adicionais';
    BlocoTerciario.Nome := 'L010117';
    BlocoTerciario.SeparadorBloco := '#';
    BlocoTerciario.TipoBloco := BlocoContinuacao;
    BlocoTerciario.Excecao := true;
    BlocoTerciario.AdicionarMetaDado(91,11,Texto, 'ZAT_RG', 'N�mero do Registro Geral (RG) do S�cio');
    BlocoTerciario.AdicionarMetaDado(102,8,Data, 'ZAT_EMISRG', 'Data de Emiss�o do RG');
    BlocoTerciario.AdicionarMetaDado(110,1,Texto, 'ZAT_VINC', 'V�nculo do S�cio com a Empresa '+
                                                          'A = ADMINITRADOR'+
                                                          'S = SOCIO'+
                                                          'D = SOCIO / ADMINISTRADOR');
    BlocoTerciario.AdicionarMetaDado(111,3,Texto, 'ZAT_CIDNAS', 'Cidade de nascimento');
    BlocoTerciario.AdicionarMetaDado(114,2,Texto, 'ZAT_ESTNAS', 'Estado de nascimento');
    BlocoTerciario.AdicionarMetaDado(116,4,Texto, 'ZAT_DDD', 'DDD do telefone');
    BlocoTerciario.AdicionarMetaDado(120,9,Texto, 'ZAT_TEL', 'N�mero do Telefone');
    BlocoTerciario.AdicionarMetaDado(129,4,Texto, 'ZAT_RAMAL', 'Ramal');
    BlocoTerciario.AdicionarMetaDado(133,7,Texto, 'ZAT_LOGRA', 'Nome do Logradouro');
    BlocoTerciario.AdicionarMetaDado(140,2,Texto, 'ZAT_BAIRRO', 'Bairro');
    BlocoTerciario.AdicionarMetaDado(142,3,Texto, 'ZAT_CIDADE', 'Cidade');
    BlocoTerciario.AdicionarMetaDado(145,2,Texto, 'ZAT_ESTADO', 'Estado');
    BlocoTerciario.AdicionarMetaDado(147,9,Texto, 'ZAT_CEP', 'CEP');
    BlocoTerciario.AdicionarMetaDado(159,4,Numerico, 'ZAT_TEMRES', 'Tempo de resid�ncia');
    blocoAgrupador1.AdicionarBloco(BlocoTerciario);

    BlocoQuartiario := TBloco.Create;
    BlocoQuartiario.Descricao := 'Complemento';
    BlocoQuartiario.Nome := 'L010118';
    BlocoQuartiario.SeparadorBloco := '#';
    BlocoQuartiario.TipoBloco := BlocoContinuacao;
    //BlocoQuartiario.Excecao := true;
    BlocoQuartiario.AdicionarMetaDado(8,12,Texto, 'ZAT_DESC', 'Descri��o do c�digo do elemento');
    BlocoQuartiario.AdicionarMetaDado(20,11,Numerico, 'ZAT_RENDA', 'Renda Mensal');
    BlocoQuartiario.AdicionarMetaDado(31,11,Numerico, 'ZAT_OUTREN', 'Outras Rendas');
    BlocoQuartiario.AdicionarMetaDado(54,12,Texto, 'ZAT_ORIREN', 'Origem das Outras Rendas');
    BlocoQuartiario.AdicionarMetaDado(66,9,Texto, 'ZAT_CPFCON', 'CPF do C�njuge');
    BlocoQuartiario.AdicionarMetaDado(75,2,Texto, 'ZAT_DIGCON', 'Digito do CPF do C�njuge');
    BlocoQuartiario.AdicionarMetaDado(77,60,Texto, 'ZAT_NOMCON', 'Nome do C�njuge');
    BlocoQuartiario.AdicionarMetaDado(137,11,Texto, 'ZAT_RGCON', 'RG do C�njuge');
    BlocoQuartiario.AdicionarMetaDado(148,11,Numerico, 'ZAT_RENCON', 'Renda mensal do Conjuge');
    BlocoTerciario.AdicionarBloco(BlocoQuartiario);
    {$ENDREGION}

    {$REGION 'Pend�ncias dos Socios'}
    blcPefin1 := TBloco.Create;
    blcPefin.CopiarBloco(blcPefin1);
    blcPefin.AdicionarBlocoLimite('L010117');
    blcPefin.AdicionarBlocoLimite('L010119');
    blcPefin1.RemoverMetadadoPorNomeCampo('ZBF_BLCMAE');
    blcPefin1.AdicionarMetaDado('ZBF_BLCMAE','','L010109');
    BlocoSecundario.AdicionarBloco(blcPefin1);

    blcRefin1 := TBloco.Create;
    blcRefin.CopiarBloco(blcRefin1);
    blcRefin.AdicionarBlocoLimite('L010117');
    blcRefin.AdicionarBlocoLimite('L010119');
    blcRefin1.RemoverMetadadoPorNomeCampo('ZBF_BLCMAE');
    blcRefin1.AdicionarMetaDado('ZBF_BLCMAE','','L010109');
    BlocoSecundario.AdicionarBloco(blcRefin1);

    blcProtesto1 := TBloco.Create;
    blcProtesto.CopiarBloco(blcProtesto1);
    blcProtesto.AdicionarBlocoLimite('L010117');
    blcProtesto.AdicionarBlocoLimite('L010119');
    blcProtesto1.RemoverMetadadoPorNomeCampo('ZBG_BLCMAE');
    blcProtesto1.AdicionarMetaDado('ZBG_BLCMAE','','L010109');
    BlocoSecundario.AdicionarBloco(blcProtesto1);

    blcAcaoJudicial1 := TBloco.Create;
    blcAcaoJudicial.CopiarBloco(blcAcaoJudicial1);
    blcAcaoJudicial.AdicionarBlocoLimite('L010117');
    blcAcaoJudicial.AdicionarBlocoLimite('L010119');
    blcAcaoJudicial1.RemoverMetadadoPorNomeCampo('ZBH_BLCMAE');
    blcAcaoJudicial1.AdicionarMetaDado('ZBH_BLCMAE','','L010109');
    BlocoSecundario.AdicionarBloco(blcAcaoJudicial1);

    blcParticipacaoFalencia1 := TBloco.Create;
    blcParticipacaoFalencia.CopiarBloco(blcParticipacaoFalencia1);
    blcParticipacaoFalencia.AdicionarBlocoLimite('L010117');
    blcParticipacaoFalencia.AdicionarBlocoLimite('L010119');
    blcParticipacaoFalencia1.RemoverMetadadoPorNomeCampo('ZBI_BLCMAE');
    blcParticipacaoFalencia1.AdicionarMetaDado('ZBI_BLCMAE','','L010109');
    BlocoSecundario.AdicionarBloco(blcParticipacaoFalencia1);

    blcChequeSemFundo1 := TBloco.Create;
    blcChequeSemFundo.CopiarBloco(blcChequeSemFundo1);
    blcChequeSemFundo.AdicionarBlocoLimite('L010117');
    blcChequeSemFundo.AdicionarBlocoLimite('L010119');
    blcChequeSemFundo1.RemoverMetadadoPorNomeCampo('ZBJ_BLCMAE');
    blcChequeSemFundo1.AdicionarMetaDado('ZBJ_BLCMAE','','L010109');
    BlocoSecundario.AdicionarBloco(blcChequeSemFundo1);

    blcChequeSustadoCancelado1 := TBloco.Create;
    blcChequeSustadoCancelado.CopiarBloco(blcChequeSustadoCancelado1);
    blcChequeSustadoCancelado.AdicionarBlocoLimite('L010117');
    blcChequeSustadoCancelado.AdicionarBlocoLimite('L010119');
    blcChequeSustadoCancelado1.RemoverMetadadoPorNomeCampo('ZBL_BLCMAE');
    blcChequeSustadoCancelado1.AdicionarMetaDado('ZBL_BLCMAE','','L010109');
    BlocoSecundario.AdicionarBloco(blcChequeSustadoCancelado1);
    {$ENDREGION}

    {$ENDREGION }

    {$REGION 'Quadro Administrativo'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Descricao := 'Quadro Administrativo';
    blocoPrimario.Nome := 'L010110';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZAS010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZAS_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado('ZAS_TIPO', 'TIPO', 'ADMINISTRADORES');
    blocoPrimario.AdicionarMetaDado(8,8,Data, 'ZAS_DTATU', 'DATA DA �LTIMA ATUALIZA��O DAS INFORMA��ES (AAAAMMDD');
    blocoID.AdicionarBloco(blocoPrimario);

    blocoSecundario := TBloco.Create;
    blocoSecundario.Descricao := 'Detalhes do quadro adminsitrativo';
    blocoSecundario.Nome := 'L010111';
    blocoSecundario.SeparadorBloco := '#';
    blocoSecundario.TipoBloco := BlocoFilho;
    blocoSecundario.Excecao := true;
    blocoSecundario.Tabela := 'ZAT010';
    blocoSecundario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoSecundario.AdicionarMetaDado(0,0,'ZAT_ZASREC','',ChaveEstrangeira);
    blocoSecundario.AdicionarMetaDado(8,1,Texto, 'ZAT_IDENT', 'IDENTIFICA��O F�SICA (F) OU JUR�DICA (J)');
    blocoSecundario.AdicionarMetaDado(9,9,Numerico, 'ZAT_DOC', 'CNPJ OU CPF DO S�CIO');
    blocoSecundario.AdicionarMetaDado(22,2,Numerico, 'ZAT_DIGITO', 'D�GITO CONTROLE DO CPF QUANDO FOR IDENTIFICA��O F�SICA');
    blocoSecundario.AdicionarMetaDado(24,58,Texto, 'ZAT_NOME', 'NOME DO ADMINISTRADOR ');
    blocoSecundario.AdicionarMetaDado(82,12,Texto, 'ZAT_CARGO', 'CARGO QUE OCUPA NA EMPRESA');  //*
    blocoSecundario.AdicionarMetaDado(94,12,Texto, 'ZAT_PAIS', 'PAIS');
    blocoSecundario.AdicionarMetaDado(106,9,Texto, 'ZAT_ESTCIV', 'ESTADO CIVIL'); //*
    blocoSecundario.AdicionarMetaDado(115,8,Data, 'ZAT_DTIMAN', 'DATA DO INICIO DO MANDATO (AAAAMMDD)'); //*
    blocoSecundario.AdicionarMetaDado(123,8,Data, 'ZAT_DTFMAN', 'DATA DO FINAL DO MANDATO (AAAAMMDD)'); //*
    blocoSecundario.AdicionarMetaDado(131,1,Texto, 'ZAT_INDRES', 'INDICADOR DE RESTRI��O (DOC. N�O OFICIAL SER� BRANCO)'); //*

    blocoSecundario.AdicionarMetaDado(137,2,Texto, 'ZAT_CODSIT', 'C�DIGO DA SITUA��O DA EMPRESA: '+
                                                           '02-ATIVA'+
                                                           '03-INATIVA'+
                                                           '00-INAPTA'+
                                                           '04-N�O LOCALIZADA'+
                                                           '05-EM LIQUIDA��O'+
                                                           '07-N�O CADASTRADA'+
                                                           '06-SUSPENSO'+
                                                           '09-CANCELADO');

    blocoSecundario.AdicionarMetaDado(139,8,Data, 'ZAT_DTENT', 'DATA DA ENTRADA (AAAAMMDD)'); //*
    blocoPrimario.AdicionarBloco(BlocoSecundario);

    {$REGION 'Informa��es adicionais dos administradores'}
    // Copio o bloco que tem as informa��es dos socios e administradores
    blocoAgrupador2 := TBloco.Create;
    blocoAgrupador1.CopiarBloco(blocoAgrupador2);
    BlocoSecundario.AdicionarBloco(blocoAgrupador2);
    {$ENDREGION}

    {$REGION 'Pend�ncias dos Administradores'}
    blcPefin2 := TBloco.Create;
    blcPefin.CopiarBloco(blcPefin2);
    blcPefin2.AdicionarBlocoLimite('L010117');
    blcPefin2.AdicionarBlocoLimite('L010119');
    blcPefin2.RemoverMetadadoPorNomeCampo('ZBF_BLCMAE');
    blcPefin2.AdicionarMetaDado('ZBF_BLCMAE','','L010111');
    BlocoSecundario.AdicionarBloco(blcPefin2);

    blcRefin2 := TBloco.Create;
    blcRefin.CopiarBloco(blcRefin2);
    blcRefin2.AdicionarBlocoLimite('L010117');
    blcRefin2.AdicionarBlocoLimite('L010119');
    blcRefin2.RemoverMetadadoPorNomeCampo('ZBF_BLCMAE');
    blcRefin2.AdicionarMetaDado('ZBF_BLCMAE','','L010111');
    BlocoSecundario.AdicionarBloco(blcRefin2);

    blcProtesto2 := TBloco.Create;
    blcProtesto.CopiarBloco(blcProtesto2);
    blcProtesto2.AdicionarBlocoLimite('L010117');
    blcProtesto2.AdicionarBlocoLimite('L010119');
    blcProtesto2.RemoverMetadadoPorNomeCampo('ZBG_BLCMAE');
    blcProtesto2.AdicionarMetaDado('ZBG_BLCMAE','','L010111');
    BlocoSecundario.AdicionarBloco(blcProtesto2);

    blcAcaoJudicial2 := TBloco.Create;
    blcAcaoJudicial.CopiarBloco(blcAcaoJudicial2);
    blcAcaoJudicial2.AdicionarBlocoLimite('L010117');
    blcAcaoJudicial2.AdicionarBlocoLimite('L010119');
    blcAcaoJudicial2.RemoverMetadadoPorNomeCampo('ZBH_BLCMAE');
    blcAcaoJudicial2.AdicionarMetaDado('ZBH_BLCMAE','','L010111');
    BlocoSecundario.AdicionarBloco(blcAcaoJudicial2);

    blcParticipacaoFalencia2 := TBloco.Create;
    blcParticipacaoFalencia.CopiarBloco(blcParticipacaoFalencia2);
    blcParticipacaoFalencia2.AdicionarBlocoLimite('L010117');
    blcParticipacaoFalencia2.AdicionarBlocoLimite('L010119');
    blcParticipacaoFalencia2.RemoverMetadadoPorNomeCampo('ZBI_BLCMAE');
    blcParticipacaoFalencia2.AdicionarMetaDado('ZBI_BLCMAE','','L010111');
    BlocoSecundario.AdicionarBloco(blcParticipacaoFalencia2);

    blcChequeSemFundo2 := TBloco.Create;
    blcChequeSemFundo.CopiarBloco(blcChequeSemFundo2);
    blcChequeSemFundo2.AdicionarBlocoLimite('L010117');
    blcChequeSemFundo2.AdicionarBlocoLimite('L010119');
    blcChequeSemFundo2.RemoverMetadadoPorNomeCampo('ZBJ_BLCMAE');
    blcChequeSemFundo2.AdicionarMetaDado('ZBJ_BLCMAE','','L010111');
    BlocoSecundario.AdicionarBloco(blcChequeSemFundo2);

    blcChequeSustadoCancelado2 := TBloco.Create;
    blcChequeSustadoCancelado.CopiarBloco(blcChequeSustadoCancelado2);
    blcChequeSustadoCancelado2.AdicionarBlocoLimite('L010117');
    blcChequeSustadoCancelado2.AdicionarBlocoLimite('L010119');
    blcChequeSustadoCancelado2.RemoverMetadadoPorNomeCampo('ZBL_BLCMAE');
    blcChequeSustadoCancelado2.AdicionarMetaDado('ZBL_BLCMAE','','L010111');
    BlocoSecundario.AdicionarBloco(blcChequeSustadoCancelado2);
    {$ENDREGION}

    {$ENDREGION }

    {$REGION 'C�lculo Scoring'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L070109';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'C�lculo Scoring';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZAL010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZAL_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(1,7,Texto,'ZAL_BLOCO','L010102 � C�LCULO DE SCORING');
    blocoPrimario.AdicionarMetaDado(24,4,Numerico, 'ZAL_SCORE', 'Pontua��o do Score');
    blocoPrimario.AdicionarMetaDado(28,5,'ZAL_PROINA', 'Probabilidade de inadimpl�ncia', 2);
    blocoID.AdicionarBloco(blocoPrimario);

    blocoSecundario := TBloco.Create;
    blocoSecundario.Nome := 'L070106';
    blocoSecundario.SeparadorBloco := '#';
    blocoSecundario.Descricao := 'Informa��o RiskScoring';
    blocoSecundario.TipoBloco := BlocoContinuacao;
    blocoSecundario.AdicionarMetaDado(24,80,Texto, 'ZAL_MSGSCO', 'Mensagem relativa ao Scoring'); //Aumentar campo
    blocoPrimario.AdicionarBloco(BlocoSecundario);
   {$ENDREGION}

    {$REGION 'Registro de Consulta'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L030101';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Registro de Consulta';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZAX010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZAX_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(8,2,Numerico, 'ZAX_ANO', 'ANO DA CONSULTA');
    blocoPrimario.AdicionarMetaDado(10,2,Numerico, 'ZAX_MES', 'M�S DA CONSULTA');
    blocoPrimario.AdicionarMetaDado(12,3,Texto, 'ZAX_DESC', 'DESCRICA DO MES');
    blocoPrimario.AdicionarMetaDado(15,3,Numerico, 'ZAX_QTCONE', 'QUANTIDADE DE CONSULTAS POR EMPRESA');
    blocoPrimario.AdicionarMetaDado(18,3,Numerico, 'ZAX_QTCONB', 'QUANTIDADE DE CONSULTAS POR BANCO');
    blocoID.AdicionarBloco(blocoPrimario);
    {$ENDREGION}

    {$REGION 'Cinco Ultimas'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L030102';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Cinco Ultimas';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZAZ010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZAZ_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(8,8,Data, 'ZAZ_DATA', 'DATA DA CONSULTA (AAAAMMDD)');
    blocoPrimario.AdicionarMetaDado(16,35,Texto, 'ZAZ_CLIENT', 'NOME DO CLIENTE CONSULTANTE');
    blocoPrimario.AdicionarMetaDado(51,4,Numerico, 'ZAZ_QTDCON', 'QUANTIDADE DE CONSULTAS NO DIA PARA CLIENTE');
    blocoPrimario.AdicionarMetaDado(55,9,Texto, 'ZAZ_CNPJ', 'CNPJ DO CLIENTE');
    blocoID.AdicionarBloco(blocoPrimario);
    {$ENDREGION}

    {$REGION 'Hist�rico de Pagamento'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L020108';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Hist�rico de Pagamento';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZBA010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZBA_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(8,14,Texto, 'ZBA_DESC', 'DESCRICAO DO PER�ODO');
    blocoPrimario.AdicionarMetaDado(22,6,Numerico, 'ZBA_QTDPER', 'QUANTIDADE DO PER�ODO');
    blocoPrimario.AdicionarMetaDado(28,4,Numerico, 'ZBA_PERPER', 'PERCENTUAL DO PERIODO');
    blocoID.AdicionarBloco(blocoPrimario);
    {$ENDREGION}

    {$REGION 'Referencia de neg�cio'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L020107';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Referencia de neg�cio';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZBB010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZBB_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(8,14,Texto, 'ZBB_DESNEG', 'DESCICAO DO NEG�CIO');
    blocoPrimario.AdicionarMetaDado(22,8,Data, 'ZBB_DTPOT', 'DATA POTENCIAL AAAAMMDD');
    blocoPrimario.AdicionarMetaDado(30,13,Numerico, 'ZBB_VALPOT', 'VALOR POTENCIAL');
    blocoPrimario.AdicionarMetaDado(43,13,Numerico, 'ZBB_MEDPOT', 'M�DIA POTENCIAL');
    blocoID.AdicionarBloco(blocoPrimario);
    {$ENDREGION}

    {$REGION 'Relacionamento mais antigo'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L020104';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Relacionamento mais antigo';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZBC010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZBC_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(8,3,Texto, 'ZBC_DESMES', 'DESCICAO DO MES');
    blocoPrimario.AdicionarMetaDado(11,2,Numerico, 'ZBC_ANOREL', 'ANO RELACIONAMENTO MAIS ANTIGO');
    blocoPrimario.AdicionarMetaDado(13,2,Numerico, 'ZBC_MESREL', 'MES RELACIONAMENTO MAIS ANTIGO');
    blocoID.AdicionarBloco(blocoPrimario);
    {$ENDREGION}

    {$REGION 'Participa��es'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L010113';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Participada';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZAU010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZAU_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(8,9,Texto, 'ZAU_DOC', 'CNPJ  OU CPF DA PARTICIPADA ');
    blocoPrimario.AdicionarMetaDado(17,2,Texto, 'ZAU_DIG', 'DIGITO DO CNPJ  OU CPF DA PARTICIPADA ');
    blocoPrimario.AdicionarMetaDado(19,67,Texto, 'ZAU_NOME', 'NOME DA EMPRESA PARTICIPADA');
    blocoPrimario.AdicionarMetaDado(91,1,Texto, 'ZAU_IDEN', 'IDENTIFICA��O F�SICA OU JUR�DICA');
    blocoPrimario.AdicionarMetaDado(92,2,Texto, 'ZAU_SITUA', 'C�DIGO DA SITUA��O DA EMPRESA:  '+
                                                                '02-ATIVA '+
                                                                '03-INATIVA '+
                                                                '00-INAPTA '+
                                                                '04-N�O LOCALIZADA  '+
                                                                '05-EM LIQUIDA��O '+
                                                                '07-N�O CADASTRADA '+
                                                                '06-SUSPENSO '+
                                                                '09-CANCELADO');
    blocoID.AdicionarBloco(blocoPrimario);


    blocoSecundario := TBloco.Create;
    blocoSecundario.Nome := 'L010114';
    blocoSecundario.SeparadorBloco := '#';
    blocoSecundario.Descricao := 'Participantes';
    blocoSecundario.TipoBloco := BlocoContinuacao;
    BlocoSecundario.AdicionarBlocoLimite('L010113');
    blocoSecundario.AdicionarMetaDado(126,9,Texto, 'ZAU_DOCP', 'CNPJ  OU CPF DA PARTICIPANTE');
    blocoSecundario.AdicionarMetaDado(139,2,Texto, 'ZAU_DIGP', 'DIGITO DO CNPJ  OU CPF DA PARTICIPANTE');
    blocoSecundario.AdicionarMetaDado(8,67,Texto, 'ZAU_NOMEP', 'NOME DO PARTICIPANTE');
    blocoSecundario.AdicionarMetaDado(88,30,Texto, 'ZAU_MUNP', 'MUNICIPIO DO PARTICIPANTE');
    blocoSecundario.AdicionarMetaDado(118,2,Texto, 'ZAU_UFP', 'ESTADO DO PARTICIPANTE');
    blocoSecundario.AdicionarMetaDado(120,5,'ZAU_PERPAR', 'PERCENTUAL DA PARTICIPANTE', 2);
    blocoSecundario.AdicionarMetaDado(141,1,Texto, 'ZAU_IDENP', 'IDENTIFICA��O F�SICA OU JUR�DICA');
    blocoSecundario.AdicionarMetaDado(142,2,Numerico, 'ZAU_SITUAP', 'C�DIGO DA SITUA��O DA EMPRESA:  '+
                                                                '02-ATIVA '+
                                                                '03-INATIVA '+
                                                                '00-INAPTA '+
                                                                '04-N�O LOCALIZADA  '+
                                                                '05-EM LIQUIDA��O '+
                                                                '07-N�O CADASTRADA '+
                                                                '06-SUSPENSO '+
                                                                '09-CANCELADO');
    blocoPrimario.AdicionarBloco(BlocoSecundario);
    {$ENDREGION}

    {$REGION 'Limite de cr�dito'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L560102';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Limite de cr�dito';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZBD010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZBD_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(8,8,Data, 'ZBD_DATA', 'DATA DO CALCULO DO LIMITE DE CREDITO-AAAAMMDD');
    blocoPrimario.AdicionarMetaDado(16,6,Numerico, 'ZBD_HORA', 'HORA DO CALCULO DO LIMITE DE CREDITO-HHMMSS');
    blocoPrimario.AdicionarMetaDado(22,13,Numerico, 'ZBD_VALOR', 'VALOR DE LIMITE DE CREDITO');
    blocoID.AdicionarBloco(blocoPrimario);

    blocoSecundario := TBloco.Create;
    blocoSecundario.Nome := 'L560104';
    blocoSecundario.SeparadorBloco := '#';
    blocoSecundario.Descricao := 'Mensagem ';
    blocoSecundario.TipoBloco := BlocoContinuacao;
    blocoSecundario.AdicionarMetaDado(8,79,Texto, 'ZBD_MSG', 'OBSERVACOES DO LIMITE DE CREDITO');
    blocoPrimario.AdicionarBloco(BlocoSecundario);
    {$ENDREGION}

    {$REGION 'Faturamento Presumido'}
    blocoPrimario := TBloco.Create;
    blocoPrimario.Nome := 'L300201';
    blocoPrimario.SeparadorBloco := '#';
    blocoPrimario.Descricao := 'Faturamento Presumido';
    blocoPrimario.TipoBloco := BlocoFilho;
    blocoPrimario.Tabela := 'ZBE010';
    blocoPrimario.AdicionarMetaDado(0,0,'R_E_C_N_O_','',ChavePrimaria);
    blocoPrimario.AdicionarMetaDado(0,0,'ZBE_ZABREC','',ChaveEstrangeira);
    blocoPrimario.AdicionarMetaDado(122,8,Data, 'ZBE_DATA', 'DATA DA CONSULTA-AAAAMMDD');
    blocoPrimario.AdicionarMetaDado(130,6,Numerico, 'ZBE_HORA', 'HORA DA CONSULTA-HHMMSS');
    blocoID.AdicionarBloco(blocoPrimario);

    blocoSecundario := TBloco.Create;
    blocoSecundario.Nome := 'L300202';
    blocoSecundario.SeparadorBloco := '#';
    blocoSecundario.Descricao := 'Valor ';
    blocoSecundario.TipoBloco := BlocoContinuacao;
    blocoSecundario.AdicionarMetaDado(18,9,Numerico, 'ZBE_VALOR', 'VALOR DO FATURAMENTO PRESUMIDO EM MILHARES DE REAIS');
    blocoPrimario.AdicionarBloco(BlocoSecundario);

    blocoSecundario := TBloco.Create;
    blocoSecundario.Nome := 'L300299';
    blocoSecundario.SeparadorBloco := '#';
    blocoSecundario.Descricao := 'Mensagem';
    blocoSecundario.TipoBloco := BlocoContinuacao;
    blocoSecundario.AdicionarMetaDado(17,79,Texto, 'ZBE_MSG', 'MENSAGEM');
    blocoPrimario.AdicionarBloco(BlocoSecundario);

    blocoSecundario := TBloco.Create;
    blocoSecundario.Nome := 'L300203';
    blocoSecundario.SeparadorBloco := '#';
    blocoSecundario.Descricao := 'Mensagem de n�o calculo';
    blocoSecundario.TipoBloco := BlocoContinuacao;
    blocoSecundario.AdicionarMetaDado(17,100,Texto, 'ZBE_MSGNAO', 'MENSAGEM DO MOTIVO DO N�O CALCULO');
    blocoPrimario.AdicionarBloco(BlocoSecundario);
    {$ENDREGION}

end;

procedure TArquivoRetornoSerasaCNPJ.DonwloadArquivo(parametro: array of string);
var
  url: widestring;
  urlBase: string;
  param: string;
  loginSenha:string;
begin
  //montar a url com os  parametro
  loginSenha:= parametro[1]+parametro[2]+dupeString(' ',11-Length(parametro[2]));
  if producao then
      urlBase := 'https://sitenet43.serasa.com.br/Prod/consultahttps?p='+loginSenha
  else
      urlBase := 'https://mqlinuxext.serasa.com.br/Homologa/consultahttps?p='+loginSenha;


  url :=  urlBase+
         '     IP20NRRFM2        @cnpj23N            233E                                                                                    CK30'+
         '                                                                                                                                                                                                                                         '+
         'S                     SSS                                                   CFP3                     S    SNS                  SSS';

  url :=  StringReplace(url,'@cnpj',ColocarZeroEsquerda(9,copy(parametro[0],1,8)), [rfReplaceAll]);

  FUrl := url;
  Inherited;
end;

function TArquivoRetornoSerasaCNPJ.ExecutarParticularidadeBlocoQuadroAdministrativo(bloco: Tbloco; retorno: WideString; linhaPai: integer): WideString;
begin
    result := Executar(bloco, retorno, linhaPai);
end;

function TArquivoRetornoSerasaCNPJ.ExecutarParticularidadeBlocoDetalhes(bloco: Tbloco; retorno: WideString;  cpfCnpj:string; linhaPai: integer): WideString;
var
    i: integer;
    strBloco:string;
    aux: WideString;
    blocoLimite: Integer;
    identificacao: string;
    ret: WideString;
begin
    try
        linhaPai := 1;
        ret := retorno;
        if AcharPalavra(bloco.Nome,ret) > 0 then
        begin
            aux := copy(ret, AcharPalavra(bloco.Nome,ret), Length(ret));
            strbloco := copy(aux, 1, AcharPalavra(bloco.SeparadorBloco,aux));
            bloco.Tamanho := Length(strBloco);
            identificacao :=  copy(strBloco,8,12);

            Delete(ret, AcharPalavra(bloco.Nome,ret), bloco.Tamanho);
            if pos(cpfCnpj, identificacao) > 0 then
            begin
                Delete(retorno, AcharPalavra(bloco.Nome,retorno), bloco.Tamanho);
                linhaPai :=  bloco.PopularInformacoes(strbloco, linhaPai);
                retorno := ObterInformacaoArquivo(bloco.ObterListaDeBlocosFilhos, retorno, linhaPai)
            end;
         end;
        result := retorno;
     except
         on e : exception do
         begin
             raise Exception.Create('Erro ao executar particulardade: '+ #13+e.Message);
         end;
     end;
end;


function TArquivoRetornoSerasaCNPJ.ExecutarParticularidadeBlocoSocios(bloco: Tbloco; retorno: WideString; linhaPai: integer): WideString;
begin
    result := Executar(bloco, retorno, linhaPai);
end;

function TArquivoRetornoSerasaCNPJ.Executar(bloco: Tbloco; retorno: WideString; linhaPai: integer): WideString;
var
    i: integer;
    strBloco:string;
    aux: WideString;
    blocoLimite: Integer;
    identificacao: string;
    cpfCnpj:string;
begin
    try
        linhaPai := 1;
        while AcharPalavra(bloco.Nome,retorno) > 0 do
        begin
            aux := copy(retorno, AcharPalavra(bloco.Nome,retorno), Length(retorno));
            strbloco := copy(aux, 1, AcharPalavra(bloco.SeparadorBloco,aux));
            bloco.Tamanho := Length(strBloco);

            Delete(retorno, AcharPalavra(bloco.Nome,retorno), bloco.Tamanho);
            linhaPai :=  bloco.PopularInformacoes(strbloco, linhaPai);

            identificacao :=  copy(strBloco,8,1);
            cpfCnpj := copy(strBloco,9,9);

            if identificacao = 'F' then                                                  //blocos que n�o ser�o utilizados
               retorno := ObterInformacaoArquivo(bloco.ObterListaDeBlocosFilhos, retorno, linhaPai,['L010119', 'L010120'],cpfCnpj)
            else
            if identificacao = 'J' then                                                  //blocos que n�o ser�o utilizados
               retorno := ObterInformacaoArquivo(bloco.ObterListaDeBlocosFilhos, retorno, linhaPai,['L010117', 'L010118'],cpfCnpj);
         end;
        result := retorno;
     except
         on e : exception do
         begin
             raise Exception.Create('Erro ao executar particulardade: '+ #13+e.Message);
         end;
     end;
end;

function TArquivoRetornoSerasaCNPJ.ExecutarParticularidades(blc: TBloco; retorno: WideString; valorReferencia: string; linhaPai: integer): wideString;
begin
    try
      if blc.Nome = 'L010109' then
          retorno := ExecutarParticularidadeBlocoSocios(blc,retorno, linhaPai)
      else
      if blc.Nome = 'L010111' then
          retorno := ExecutarParticularidadeBlocoQuadroAdministrativo(blc, retorno, linhaPai)
      else
      if (blc.Nome = 'L010119') or (blc.Nome = 'L010120') or (blc.Nome = 'L010117') or (blc.Nome = 'L010118')  then
          retorno := ExecutarParticularidadeBlocoDetalhes(blc, retorno, valorReferencia, linhaPai);

      result := retorno;
    except
        raise
    end;
end;

function TArquivoRetornoSerasaCNPJ.ObterDetalheAcaoJudicial(conexao: TADOConnection;
  recMae: integer; blocoMae: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBH010 WHERE D_E_L_E_T_  = '''' AND ZBH_RECMAE = '+inttostr(recMae)+ ' AND ZBH_BLCMAE = '+QuotedStr(blocoMae);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterAnotacoesNegativas(
  conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;
var
    query: string;
begin
    query := 'select  ZBF_TIPPEN AS Descricao,  '+
              '    SUM(ZBF_QTPEND) as Quantidade, '+
              '	   SUM(ZBF_VALPEN) as Total,      '+
              '    (select TOP 1 ZBF_DTPEN from ZBF010 WHERE ZBF_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBF_RECMAE = '+inttostr(recMae)+' AND ZBF_TIPPEN = ZBF.ZBF_TIPPEN ORDER BY ZBF_DTPEN) as UltimaData '+
              ' from ZBF010 AS ZBF WHERE D_E_L_E_T_  = '''' AND ZBF_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBF_RECMAE = '+inttostr(recMae) +
              ' GROUP BY ZBF_TIPPEN, ZBF_RECMAE '+
              ' union '+
              ' select ''PROTESTO'' AS Descricao, '+
              '     SUM(ZBG_QTPROT) as Quantidade, '+
              '	  	SUM(ZBG_VALPRO) as Total, '+
              '     (select TOP 1 ZBG_DTPROT from ZBG010 WHERE ZBG_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBG_RECMAE = '+inttostr(recMae)+' ORDER BY ZBG_DTPROT) as UltimaData '+
              ' from ZBG010 WHERE D_E_L_E_T_  = '''' AND ZBG_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBG_RECMAE = '+inttostr(recMae)+
              ' GROUP BY ZBG_RECMAE '+
              ' union '+
              ' select ''ACAO JUDICIAL'' AS Descricao, '+
              '    SUM(ZBH_QTACAO) as Quantidade, '+
              ' 		SUM(ZBH_VALACA) as Total, '+
              '    (select TOP 1 ZBH_DTACAO from ZBH010 WHERE ZBH_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBH_RECMAE = '+inttostr(recMae)+' ORDER BY ZBH_DTACAO) as UltimaData '+
              ' from ZBH010 WHERE D_E_L_E_T_  = '''' AND ZBH_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBH_RECMAE = '+inttostr(recMae)+
              ' GROUP BY ZBH_RECMAE '+
              ' union '+
              ' select ''PARTICIPAC�O'' AS Descricao, '+
              '     SUM(ZBI_QTPART) as Quantidade, '+
              '	  	0 as Total, '+
              '    (select TOP 1 ZBI_DTACAO from ZBI010 WHERE ZBI_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBI_RECMAE = '+inttostr(recMae)+' ORDER BY ZBI_DTACAO) as UltimaData '+
              ' from ZBI010 WHERE D_E_L_E_T_  = '''' AND ZBI_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBI_RECMAE = '+inttostr(recMae)+
              ' GROUP BY ZBI_RECMAE '+
              ' union '+
              ' select ''CH SEM FUNDO'' AS Descricao, '+
              '    SUM(ZBJ_QTCQFU) as Quantidade, '+
              '    0 as Total, '+
              '    (select TOP 1 ZBJ_DTACAO from ZBJ010 WHERE ZBJ_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBJ_RECMAE = '+inttostr(recMae)+' ORDER BY ZBJ_DTACAO) as UltimaData '+
              ' from ZBJ010 WHERE D_E_L_E_T_  = '''' AND ZBJ_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBJ_RECMAE = '+inttostr(recMae)+
              ' GROUP BY ZBJ_RECMAE '+
              ' union '+
              ' select ''CH SUSTADO/CANCELADO'' AS Descricao, '+
              '    COUNT(*) as Quantidade, '+
              '		 0 as Total, '+
              '   (select TOP 1 ZBL_DATA from ZBL010 WHERE ZBL_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBL_RECMAE = '+inttostr(recMae)+' ORDER BY ZBL_DATA) as UltimaData '+
              ' from ZBL010 WHERE D_E_L_E_T_  = '''' AND ZBL_BLCMAE = '+QuotedStr(blocoMae)+' AND ZBL_RECMAE = '+inttostr(recMae)+
              ' GROUP BY ZBL_RECMAE ';

    Result := ExecutarConsulta(conexao,query);
    TFloatField(Result.FieldByName('Total')).DisplayFormat := '#,##0.00'
end;

function TArquivoRetornoSerasaCNPJ.ObterChequeSemFundo(conexao: TADOConnection;
  recMae: integer; blocoMae: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBJ010 WHERE D_E_L_E_T_  = '''' AND  ZBJ_RECMAE = '+inttostr(recMae)+ ' AND ZBJ_BLCMAE = '+QuotedStr(blocoMae);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterChequeSustado(conexao: TADOConnection;
  recMae: integer; blocoMae: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBL010 WHERE D_E_L_E_T_  = '''' AND ZBL_RECMAE = '+inttostr(recMae)+ ' AND ZBL_BLCMAE = '+QuotedStr(blocoMae);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterCincoUltimas(conexao: TADOConnection;
  zaz_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAZ010 WHERE D_E_L_E_T_  = '''' AND ZAZ_ZABREC = '+inttostr(zaz_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterControleSocietarioQuadroAdminsitrativo(
  conexao: TADOConnection; zas_zabrec: integer; tipo: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAS010 WHERE D_E_L_E_T_  = '''' AND ZAS_ZABREC = '+inttostr(zas_zabrec)+ ' AND ZAS_TIPO = '+QuotedStr(tipo);
    Result := ExecutarConsulta(conexao,query);
    TFloatField(Result.FieldByName('ZAS_VALCAP')).DisplayFormat := 'R$ #,##0.00';
    TFloatField(Result.FieldByName('ZAS_VALREA')).DisplayFormat := 'R$ #,##0.00';
end;

function TArquivoRetornoSerasaCNPJ.ObterDetalhePefin(conexao: TADOConnection;
  recMae: integer; blocoMae: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBF010 WHERE D_E_L_E_T_  = '''' AND ZBF_TIPPEN = ''PEFIN'' AND ZBF_ZABREC = '+inttostr(recMae)+ ' AND ZBF_BLCMAE = '+QuotedStr(blocoMae);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterDetalheProtesto(conexao: TADOConnection;
  recMae: integer; blocoMae: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBG010 WHERE D_E_L_E_T_  = '''' AND ZBG_RECMAE = '+inttostr(recMae)+ ' AND ZBG_BLCMAE = '+QuotedStr(blocoMae);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterDetalheRefin(conexao: TADOConnection;
  recMae: integer; blocoMae: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBF010 WHERE D_E_L_E_T_  = '''' AND ZBF_TIPPEN = ''REFIN'' AND ZBF_ZABREC = '+inttostr(recMae)+ ' AND ZBF_BLCMAE = '+QuotedStr(blocoMae);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterFaturamentoPresumido(conexao: TADOConnection; zbe_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT ZBE_FILIAL, ZBE_ZABREC, ZBE_DATA, ZBE_HORA, ZBE_VALOR * 1000 ZBE_VALOR, ZBE_MSG, ZBE_MSGNAO FROM ZBE010 WHERE D_E_L_E_T_  = '''' AND ZBE_ZABREC = '+inttostr(zbe_zabrec);
    Result := ExecutarConsulta(conexao,query);
    TFloatField(Result.FieldByName('ZBE_VALOR')).DisplayFormat := 'R$ #,##0.00';
end;

function TArquivoRetornoSerasaCNPJ.ObterFiliais(conexao: TADOConnection;
  zav_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAV010 WHERE D_E_L_E_T_  = '''' AND ZAV_ZABREC = '+inttostr(zav_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterHistoricosDePagamento(conexao: TADOConnection; zba_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBA010 WHERE D_E_L_E_T_  = '''' AND ZBA_ZABREC = '+inttostr(zba_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterLimiteDeCredito(conexao: TADOConnection; zbd_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBD010 WHERE D_E_L_E_T_  = '''' AND ZBD_ZABREC = '+inttostr(zbd_zabrec);
    Result := ExecutarConsulta(conexao,query);
    TFloatField(Result.FieldByName('ZBD_VALOR')).DisplayFormat := 'R$ #,##0.00';
end;

function TArquivoRetornoSerasaCNPJ.ObterParticipacaoEmFalencia(
  conexao: TADOConnection; recMae: integer; blocoMae: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBI010 WHERE D_E_L_E_T_  = '''' AND ZBI_RECMAE = '+inttostr(recMae)+ ' AND ZBI_BLCMAE = '+QuotedStr(blocoMae);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterParticipantes(conexao: TADOConnection;
  zbu_zabrec: integer; documento, digito: string): TADOQuery;
var
    query: string;
begin
    query := 'SELECT ZAU_DOCP, ZAU_DIGP, ZAU_NOMEP, ZAU_MUNP, ZAU_UFP, ZAU_PERPAR, ZAU_IDENP, ZAU_SITUAP from ZAU010 WHERE D_E_L_E_T_  = '''' AND ZAU_ZABREC = '+inttostr(zbu_zabrec)+' AND ZAU_DOC = '+QuotedStr(documento)+' AND ZAU_DIG = '+QuotedStr(digito) ;
    Result := ExecutarConsulta(conexao,query);

end;

function TArquivoRetornoSerasaCNPJ.ObterParticipadas(conexao: TADOConnection;
  zbu_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT DISTINCT  ZAU_ZABREC, ZAU_DOC, ZAU_DIG, ZAU_NOME, ZAU_IDEN, ZAU_SITUA from ZAU010 WHERE D_E_L_E_T_  = '''' AND ZAU_ZABREC = '+inttostr(zbu_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterReferenciasDeNegocio(conexao: TADOConnection; zbb_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBB010 WHERE D_E_L_E_T_  = '''' AND ZBB_ZABREC = '+inttostr(zbb_zabrec);
    Result := ExecutarConsulta(conexao,query);
    TFloatField(Result.FieldByName('ZBB_VALPOT')).DisplayFormat := 'R$ #,##0.00';
    TFloatField(Result.FieldByName('ZBB_MEDPOT')).DisplayFormat := 'R$ #,##0.00';
end;

function TArquivoRetornoSerasaCNPJ.ObterRegistroConsulta(conexao: TADOConnection; zax_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAX010 WHERE D_E_L_E_T_  = '''' AND ZAX_ZABREC = '+inttostr(zax_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterRelacionamentoMaisAntigo(conexao: TADOConnection; zbc_zabrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZBC010 WHERE D_E_L_E_T_  = '''' AND ZBC_ZABREC = '+inttostr(zbc_zabrec);
    Result := ExecutarConsulta(conexao,query);
end;

function TArquivoRetornoSerasaCNPJ.ObterSociosAdmistradores(
  conexao: TADOConnection; zat_zasrec: integer): TADOQuery;
var
    query: string;
begin
    query := 'SELECT * FROM ZAT010 WHERE D_E_L_E_T_  = '''' AND ZAT_ZASREC = '+inttostr(zat_zasrec);
    Result := ExecutarConsulta(conexao,query);
end;

end.
