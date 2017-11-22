unit Biz.Serasa;

interface

uses Lib.Persistable, Dal.ControleDados, Lib.Lista, Lib.ClasseBase;

type
    {$RTTI INHERIT}
    TDadosConsultaSerasa = class(TClasseBase)
    private
        FDataConsulta: string;
        FTotalRegistro: string;
        FRecno: integer;
        FHoraConsulta: string;
        FArquivo: WideString;
        FUsuario: string;
        procedure SetArquivo(const Value: WideString);
        procedure SetDataConsulta(const Value: string);
        procedure SetHoraConsulta(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetTotalRegistro(const Value: string);
        procedure SetUsuario(const Value: string);
    public
        class var dao: TControleDados<TLista<TDadosConsultaSerasa>, TListaDAO<TDadosConsultaSerasa>>;

        [TPersistable(fgPersistable, 'ZAA_DTCON')]
        [TMaxLenght(8)]
        property DataConsulta: string read FDataConsulta write SetDataConsulta;

        [TPersistable(fgPersistable, 'ZAA_HRCON')]
        [TMaxLenght(6)]
        property HoraConsulta: string read FHoraConsulta write SetHoraConsulta;

        [TPersistable(fgPersistable, 'ZAA_TOTREG')]
        [TMaxLenght(4)]
        property TotalRegistro: string read FTotalRegistro write SetTotalRegistro;

        [TPersistable(fgPersistable, 'ZAA_ARQ')]
        property Arquivo: WideString read FArquivo write SetArquivo;

        [TPersistable(fgPersistable, 'ZAA_USER')]
        [TMaxLenght(50)]
        property Usuario: string read FUsuario write SetUsuario;

        [TPersistable(fgPersistable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;


        function ObterUltimaConsultaSerasa(cgc: string): TDadosConsultaSerasa;

        constructor Create; override;
    end;

    {$RTTI INHERIT}
    TInformacoesCadastrais = class
    private
        FTipoSociedade: string;
        FCNAE: string;
        FRG: string;
        FPercentualVenda: double;
        FBairro: string;
        FDataNascimento: string;
        FDDDCelular: double;
        FRamalComercial: double;
        FQuantidadeEmpregados: double;
        FNumeroFiliais: double;
        FNire: double;
        FRamo: string;
        FPercentualCompra: double;
        FTelefoneComercial: double;
        FCodigoZAA: double;
        FCEP: string;
        FDataAlteracao: string;
        FCpfCnpj: string;
        FRecno: integer;
        FCodigoSerasa: string;
        FTelefoneResidencial: double;
        FDataInscricaoCnpj: string;
        FSituacao: double;
        FHomePage: string;
        FNumeroFax: double;
        FDataFundacao: string;
        FDDDComercial: double;
        FOpcaoTributaria: string;
        FNomeMae: string;
        FNome: string;
        FCidade: string;
        FEndereco: string;
        FDDDResidencial: double;
        FNomeFantasia: string;
        FEstado: string;
        FCelular: double;
        procedure SetBairro(const Value: string);
        procedure SetCelular(const Value: double);
        procedure SetCEP(const Value: string);
        procedure SetCidade(const Value: string);
        procedure SetCNAE(const Value: string);
        procedure SetCodigoSerasa(const Value: string);
        procedure SetCodigoZAA(const Value: double);
        procedure SetCpfCnpj(const Value: string);
        procedure SetDataAlteracao(const Value: string);
        procedure SetDataFundacao(const Value: string);
        procedure SetDataInscricaoCnpj(const Value: string);
        procedure SetDataNascimento(const Value: string);
        procedure SetDDDCelular(const Value: double);
        procedure SetDDDComercial(const Value: double);
        procedure SetDDDResidencial(const Value: double);
        procedure SetEndereco(const Value: string);
        procedure SetEstado(const Value: string);
        procedure SetHomePage(const Value: string);
        procedure SetNire(const Value: double);
        procedure SetNome(const Value: string);
        procedure SetNomeFantasia(const Value: string);
        procedure SetNomeMae(const Value: string);
        procedure SetNumeroFax(const Value: double);
        procedure SetNumeroFiliais(const Value: double);
        procedure SetOpcaoTributaria(const Value: string);
        procedure SetPercentualCompra(const Value: double);
        procedure SetPercentualVenda(const Value: double);
        procedure SetQuantidadeEmpregados(const Value: double);
        procedure SetRamalComercial(const Value: double);
        procedure SetRamo(const Value: string);
        procedure SetRecno(const Value: integer);
        procedure SetRG(const Value: string);
        procedure SetSituacao(const Value: double);
        procedure SetTelefoneComercial(const Value: double);
        procedure SetTelefoneResidencial(const Value: double);
        procedure SetTipoSociedade(const Value: string);
    public
        [TPersistable(fgPersistable, 'ZAB_ZAAREC')]
        property CodigoZAA: double read FCodigoZAA write SetCodigoZAA;

        [TPersistable(fgPersistable, 'ZAB_NOME')]
        [TMaxLenght(45)]
        property Nome: string read FNome write SetNome;

        [TPersistable(fgPersistable, 'ZAB_CPFCGC')]
        [TMaxLenght(15)]
        property CpfCnpj: string read FCpfCnpj write SetCpfCnpj;

        [TPersistable(fgPersistable, 'ZAB_RG')]
        [TMaxLenght(15)]
        property RG: string read FRG write SetRG;

        [TPersistable(fgPersistable, 'ZAB_DTNASC')]
        [TMaxLenght(8)]
        property DataNascimento: string read FDataNascimento write SetDataNascimento;

        [TPersistable(fgPersistable, 'ZAB_DTALTE')]
        [TMaxLenght(8)]
        property DataAlteracao: string read FDataAlteracao write SetDataAlteracao;

        [TPersistable(fgPersistable, 'ZAB_SITUAC')]
        property Situacao: double read FSituacao write SetSituacao;

        [TPersistable(fgPersistable, 'ZAB_NOMMAE')]
        [TMaxLenght(45)]
        property NomeMae: string read FNomeMae write SetNomeMae;

        [TPersistable(fgPersistable, 'ZAB_DDDRES')]
        property DDDResidencial: double read FDDDResidencial write SetDDDResidencial;

        [TPersistable(fgPersistable, 'ZAB_TELRES')]
        property TelefoneResidencial: double read FTelefoneResidencial write SetTelefoneResidencial;

        [TPersistable(fgPersistable, 'ZAB_DDDCOM')]
        property DDDComercial: double read FDDDComercial write SetDDDComercial;

        [TPersistable(fgPersistable, 'ZAB_TELCOM')]
        property TelefoneComercial: double read FTelefoneComercial write SetTelefoneComercial;

        [TPersistable(fgPersistable, 'ZAB_RAMCOM')]
        property RamalComercial: double read FRamalComercial write SetRamalComercial;

        [TPersistable(fgPersistable, 'ZAB_TELCEL')]
        property Celular: double read FCelular write SetCelular;

        [TPersistable(fgPersistable, 'ZAB_DDDCEL')]
        property DDDCelular: double read FDDDCelular write SetDDDCelular;

        [TPersistable(fgPersistable, 'ZAB_ENDER')]
        [TMaxLenght(80)]
        property Endereco: string read FEndereco write SetEndereco;

        [TPersistable(fgPersistable, 'ZAB_BAIRRO')]
        [TMaxLenght(30)]
        property Bairro: string read FBairro write SetBairro;

        [TPersistable(fgPersistable, 'ZAB_CIDADE')]
        [TMaxLenght(30)]
        property Cidade: string read FCidade write SetCidade;

        [TPersistable(fgPersistable, 'ZAB_ESTADO')]
        [TMaxLenght(2)]
        property Estado: string read FEstado write SetEstado;

        [TPersistable(fgPersistable, 'ZAB_CEP')]
        [TMaxLenght(8)]
        property CEP: string read FCEP write SetCEP;

        [TPersistable(fgPersistable, 'ZAB_NOMFAN')]
        [TMaxLenght(60)]
        property NomeFantasia: string read FNomeFantasia write SetNomeFantasia;

        [TPersistable(fgPersistable, 'ZAB_NIRE')]
        property Nire: double read FNire write SetNire;

        [TPersistable(fgPersistable, 'ZAB_TIPSOC')]
        [TMaxLenght(60)]
        property TipoSociedade: string read FTipoSociedade write SetTipoSociedade;

        [TPersistable(fgPersistable, 'ZAB_OPCTRI')]
        [TMaxLenght(30)]
        property OpcaoTributaria: string read FOpcaoTributaria write SetOpcaoTributaria;

        [TPersistable(fgPersistable, 'ZAB_NUMFAX')]
        property NumeroFax: double read FNumeroFax write SetNumeroFax;

        [TPersistable(fgPersistable, 'ZAB_HOMPAG')]
        [TMaxLenght(70)]
        property HomePage: string read FHomePage write SetHomePage;

        [TPersistable(fgPersistable, 'ZAB_DTFUND')]
        [TMaxLenght(8)]
        property DataFundacao: string read FDataFundacao write SetDataFundacao;

        [TPersistable(fgPersistable, 'ZAB_DTCNPJ')]
        [TMaxLenght(8)]
        property DataInscricaoCnpj: string read FDataInscricaoCnpj write SetDataInscricaoCnpj;

        [TPersistable(fgPersistable, 'ZAB_RAMO')]
        [TMaxLenght(54)]
        property Ramo: string read FRamo write SetRamo;

        [TPersistable(fgPersistable, 'ZAB_CODSER')]
        [TMaxLenght(7)]
        property CodigoSerasa: string read FCodigoSerasa write SetCodigoSerasa;

        [TPersistable(fgPersistable, 'ZAB_QTEMPR')]
        property QuantidadeEmpregados: double read FQuantidadeEmpregados write SetQuantidadeEmpregados;

        [TPersistable(fgPersistable, 'ZAB_PERCOM')]
        property PercentualCompra: double read FPercentualCompra write SetPercentualCompra;

        [TPersistable(fgPersistable, 'ZAB_PERVEN')]
        property PercentualVenda: double read FPercentualVenda write SetPercentualVenda;

        [TPersistable(fgPersistable, 'ZAB_NUMFIL')]
        property NumeroFiliais: double read FNumeroFiliais write SetNumeroFiliais;

        [TPersistable(fgPersistable, 'ZAB_CNAE')]
        [TMaxLenght(6)]
        property CNAE: string read FCNAE write SetCNAE;

        [TPersistable(fgPersistable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;
    end;

    {$RTTI INHERIT}
    TAnotacaoSerasa = class
    private
        FValorAnotacaoSerasa: double;
        FTotalAnotacaoSerasa: double;
        FTipoMoedaAnotacaoSerasa: string;
        FDataAnotacaoSerasaMaisRecente: string;
        FRecnoAnotacaoSerasa: integer;
        FEmpresaAnotacaoSerasa: string;
        FTipoAnotacaoSerasa: string;
        FDataAnotacaoSerasaMaisAntigas: string;
        FFilialAnotacaoSerasa: string;
        procedure SetDataAnotacaoSerasaMaisAntigas(const Value: string);
        procedure SetDataAnotacaoSerasaMaisRecente(const Value: string);
        procedure SetEmpresaAnotacaoSerasa(const Value: string);
        procedure SetFilialAnotacaoSerasa(const Value: string);
        procedure SetRecnoAnotacaoSerasa(const Value: integer);
        procedure SetTipoMoedaAnotacaoSerasa(const Value: string);
        procedure SetTipoAnotacaoSerasa(const Value: string);
        procedure SetTotalAnotacaoSerasa(const Value: double);
        procedure SetValorAnotacaoSerasa(const Value: double);
    public
        [TPersistable(fgPersistable, 'ZAC_TOTPND')]
        property TotalAnotacaoSerasa: double read FTotalAnotacaoSerasa write SetTotalAnotacaoSerasa;

        [TPersistable(fgPersistable, 'ZAC_TPPND')]
        [TMaxLenght(28)]
        property TipoAnotacaoSerasa: string read FTipoAnotacaoSerasa write SetTipoAnotacaoSerasa;

        [TPersistable(fgPersistable, 'ZAC_DTANT')]
        [TMaxLenght(8)]
        property DataAnotacaoSerasaMaisAntigas: string read FDataAnotacaoSerasaMaisAntigas write SetDataAnotacaoSerasaMaisAntigas;

        [TPersistable(fgPersistable, 'ZAC_DTREC')]
        [TMaxLenght(8)]
        property DataAnotacaoSerasaMaisRecente: string read FDataAnotacaoSerasaMaisRecente write SetDataAnotacaoSerasaMaisRecente;

        [TPersistable(fgPersistable, 'ZAC_TPMOE')]
        [TMaxLenght(3)]
        property TipoMoedaAnotacaoSerasa: string read FTipoMoedaAnotacaoSerasa write SetTipoMoedaAnotacaoSerasa;

        [TPersistable(fgPersistable, 'ZAC_VLUPND')]
        property ValorAnotacaoSerasa: double read FValorAnotacaoSerasa write SetValorAnotacaoSerasa;

        [TPersistable(fgPersistable, 'ZAC_EMPRES')]
        [TMaxLenght(20)]
        property EmpresaAnotacaoSerasa: string read FEmpresaAnotacaoSerasa write SetEmpresaAnotacaoSerasa;

        [TPersistable(fgPersistable, 'ZAC_FILNOM')]
        [TMaxLenght(4)]
        property FilialAnotacaoSerasa: string read FFilialAnotacaoSerasa write SetFilialAnotacaoSerasa;

        [TPersistable(fgPersistable, 'R_E_C_N_O_')]
        property RecnoAnotacaoSerasa: integer read FRecnoAnotacaoSerasa write SetRecnoAnotacaoSerasa;
    end;

    TDetalheAnotacoao = class(TClasseBase)
    private
      FDataOcorrencia: string;
      FMoeda: string;
      FTotalOcorrencia: double;
      FValorContrato: double;
      FRecno: integer;
      FEmpresa: string;
      FCodigoPraca: string;
      FCodigoInstituicao: string;
      FModalidade: string;
      FEstado: string;
      FNumeroContrato: string;
      FSubJudice: string;
      procedure SetCodigoInstituicao(const Value: string);
      procedure SetCodigoPraca(const Value: string);
      procedure SetDataOcorrencia(const Value: string);
      procedure SetEmpresa(const Value: string);
      procedure SetEstado(const Value: string);
      procedure SetModalidade(const Value: string);
      procedure SetMoeda(const Value: string);
      procedure SetNumeroContrato(const Value: string);
      procedure SetRecno(const Value: integer);
      procedure SetSubJudice(const Value: string);
      procedure SetTotalOcorrencia(const Value: double);
      procedure SetValorContrato(const Value: double);
    public
        [TPersistable(fgPersistable, 'ZAD_TPMOD')]
        [TMaxLenght(12)]
        property Modalidade: string read FModalidade write SetModalidade;

        [TPersistable(fgPersistable, 'ZAD_DTOCO')]
        [TMaxLenght(8)]
        property DataOcorrencia: string read FDataOcorrencia write SetDataOcorrencia;

        [TPersistable(fgPersistable, 'ZAD_TPMOE')]
        [TMaxLenght(3)]
        property Moeda: string read FMoeda write SetMoeda;

        [TPersistable(fgPersistable, 'ZAD_VLCON')]
        property ValorContrato: double read FValorContrato write SetValorContrato;

        [TPersistable(fgPersistable, 'ZAD_NUMCON')]
        [TMaxLenght(17)]
        property NumeroContrato: string read FNumeroContrato write SetNumeroContrato;

        [TPersistable(fgPersistable, 'ZAD_EMPRES')]
        [TMaxLenght(20)]
        property Empresa: string read FEmpresa write SetEmpresa;

        [TPersistable(fgPersistable, 'ZAD_CODPRA')]
        [TMaxLenght(4)]
        property CodigoPraca: string read FCodigoPraca write SetCodigoPraca;

        [TPersistable(fgPersistable, 'ZAD_TOTOCO')]
        property TotalOcorrencia: double read FTotalOcorrencia write SetTotalOcorrencia;

        [TPersistable(fgPersistable, 'ZAD_CODINS')]
        [TMaxLenght(4)]
        property CodigoInstituicao: string read FCodigoInstituicao write SetCodigoInstituicao;

        [TPersistable(fgPersistable, 'ZAD_SUBJUD')]
        [TMaxLenght(1)]
        property SubJudice: string read FSubJudice write SetSubJudice;

        [TPersistable(fgPersistable, 'ZAD_ESTADO')]
        [TMaxLenght(2)]
        property Estado: string read FEstado write SetEstado;

        [TPersistable(fgPersistable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;
    end;

implementation

uses
  System.SysUtils, Biz.ParametroSistema;

{ TDadosConsultaSerasa }

constructor TDadosConsultaSerasa.Create;
begin
  inherited;

end;

function TDadosConsultaSerasa.ObterUltimaConsultaSerasa(cgc: string): TDadosConsultaSerasa;
var
    query: string;
    lista: TLista<TDadosConsultaSerasa>;
    dado: TDadosConsultaSerasa;
begin
    try
        query := 'SELECT TOP 1 * FROM ZAA010 '+
                      ' WHERE ZAA_CPFCGC = '+QuotedStr(cgc) +
                      ' AND CONVERT(VARCHAR(8), GETDATE(),112) <= CONVERT(VARCHAR(8), DATEADD(MONTH,'+ TParametroSistema.ObterParametroSistema('DIASSERASA') +',ZAA_DTCON),112) '+
                      ' ORDER BY R_E_C_N_O_ DESC ';

        lista := dao.Consultar(query, nil);

        if lista.Count = 1 then
        begin
            dado := TDadosConsultaSerasa.Create;
            lista[0].CopiarPara(dado);
            Result := dado;

        end
        else
            result := nil;
    finally
        if lista <> nil then
            FreeAndNil(lista);
    end;
end;

procedure TDadosConsultaSerasa.SetArquivo(const Value: WideString);
begin
  FArquivo := Value;
end;

procedure TDadosConsultaSerasa.SetDataConsulta(const Value: string);
begin
  FDataConsulta := Value;
end;

procedure TDadosConsultaSerasa.SetHoraConsulta(const Value: string);
begin
  FHoraConsulta := Value;
end;

procedure TDadosConsultaSerasa.SetRecno(const Value: integer);
begin
  FRecno := Value;
end;

procedure TDadosConsultaSerasa.SetTotalRegistro(const Value: string);
begin
  FTotalRegistro := Value;
end;

procedure TDadosConsultaSerasa.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

{ TInformacoesCadastrais }

procedure TInformacoesCadastrais.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TInformacoesCadastrais.SetCelular(const Value: double);
begin
  FCelular := Value;
end;

procedure TInformacoesCadastrais.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TInformacoesCadastrais.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TInformacoesCadastrais.SetCNAE(const Value: string);
begin
  FCNAE := Value;
end;

procedure TInformacoesCadastrais.SetCodigoSerasa(const Value: string);
begin
  FCodigoSerasa := Value;
end;

procedure TInformacoesCadastrais.SetCodigoZAA(const Value: double);
begin
  FCodigoZAA := Value;
end;

procedure TInformacoesCadastrais.SetCpfCnpj(const Value: string);
begin
  FCpfCnpj := Value;
end;

procedure TInformacoesCadastrais.SetDataAlteracao(const Value: string);
begin
  FDataAlteracao := Value;
end;

procedure TInformacoesCadastrais.SetDataFundacao(const Value: string);
begin
  FDataFundacao := Value;
end;

procedure TInformacoesCadastrais.SetDataInscricaoCnpj(const Value: string);
begin
  FDataInscricaoCnpj := Value;
end;

procedure TInformacoesCadastrais.SetDataNascimento(const Value: string);
begin
  FDataNascimento := Value;
end;

procedure TInformacoesCadastrais.SetDDDCelular(const Value: double);
begin
  FDDDCelular := Value;
end;

procedure TInformacoesCadastrais.SetDDDComercial(const Value: double);
begin
  FDDDComercial := Value;
end;

procedure TInformacoesCadastrais.SetDDDResidencial(const Value: double);
begin
  FDDDResidencial := Value;
end;

procedure TInformacoesCadastrais.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TInformacoesCadastrais.SetEstado(const Value: string);
begin
  FEstado := Value;
end;

procedure TInformacoesCadastrais.SetHomePage(const Value: string);
begin
  FHomePage := Value;
end;

procedure TInformacoesCadastrais.SetNire(const Value: double);
begin
  FNire := Value;
end;

procedure TInformacoesCadastrais.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TInformacoesCadastrais.SetNomeFantasia(const Value: string);
begin
  FNomeFantasia := Value;
end;

procedure TInformacoesCadastrais.SetNomeMae(const Value: string);
begin
  FNomeMae := Value;
end;

procedure TInformacoesCadastrais.SetNumeroFax(const Value: double);
begin
  FNumeroFax := Value;
end;

procedure TInformacoesCadastrais.SetNumeroFiliais(const Value: double);
begin
  FNumeroFiliais := Value;
end;

procedure TInformacoesCadastrais.SetOpcaoTributaria(const Value: string);
begin
  FOpcaoTributaria := Value;
end;

procedure TInformacoesCadastrais.SetPercentualCompra(const Value: double);
begin
  FPercentualCompra := Value;
end;

procedure TInformacoesCadastrais.SetPercentualVenda(const Value: double);
begin
  FPercentualVenda := Value;
end;

procedure TInformacoesCadastrais.SetQuantidadeEmpregados(const Value: double);
begin
  FQuantidadeEmpregados := Value;
end;

procedure TInformacoesCadastrais.SetRamalComercial(const Value: double);
begin
  FRamalComercial := Value;
end;

procedure TInformacoesCadastrais.SetRamo(const Value: string);
begin
  FRamo := Value;
end;

procedure TInformacoesCadastrais.SetRecno(const Value: integer);
begin
  FRecno := Value;
end;

procedure TInformacoesCadastrais.SetRG(const Value: string);
begin
  FRG := Value;
end;

procedure TInformacoesCadastrais.SetSituacao(const Value: double);
begin
  FSituacao := Value;
end;

procedure TInformacoesCadastrais.SetTelefoneComercial(const Value: double);
begin
  FTelefoneComercial := Value;
end;

procedure TInformacoesCadastrais.SetTelefoneResidencial(const Value: double);
begin
  FTelefoneResidencial := Value;
end;

procedure TInformacoesCadastrais.SetTipoSociedade(const Value: string);
begin
  FTipoSociedade := Value;
end;

{ TAnotacaoSerasa }

procedure TAnotacaoSerasa.SetDataAnotacaoSerasaMaisAntigas(const Value: string);
begin
  FDataAnotacaoSerasaMaisAntigas := Value;
end;

procedure TAnotacaoSerasa.SetDataAnotacaoSerasaMaisRecente(const Value: string);
begin
  FDataAnotacaoSerasaMaisRecente := Value;
end;

procedure TAnotacaoSerasa.SetEmpresaAnotacaoSerasa(const Value: string);
begin
  FEmpresaAnotacaoSerasa := Value;
end;

procedure TAnotacaoSerasa.SetFilialAnotacaoSerasa(const Value: string);
begin
  FFilialAnotacaoSerasa := Value;
end;

procedure TAnotacaoSerasa.SetRecnoAnotacaoSerasa(const Value: integer);
begin
  FRecnoAnotacaoSerasa := Value;
end;

procedure TAnotacaoSerasa.SetTipoMoedaAnotacaoSerasa(const Value: string);
begin
  FTipoMoedaAnotacaoSerasa := Value;
end;

procedure TAnotacaoSerasa.SetTipoAnotacaoSerasa(const Value: string);
begin
  FTipoAnotacaoSerasa := Value;
end;

procedure TAnotacaoSerasa.SetTotalAnotacaoSerasa(const Value: double);
begin
  FTotalAnotacaoSerasa := Value;
end;

procedure TAnotacaoSerasa.SetValorAnotacaoSerasa(const Value: double);
begin
  FValorAnotacaoSerasa := Value;
end;

{ TDetalheAnotacoao }

procedure TDetalheAnotacoao.SetCodigoInstituicao(const Value: string);
begin
  FCodigoInstituicao := Value;
end;

procedure TDetalheAnotacoao.SetCodigoPraca(const Value: string);
begin
  FCodigoPraca := Value;
end;

procedure TDetalheAnotacoao.SetDataOcorrencia(const Value: string);
begin
  FDataOcorrencia := Value;
end;

procedure TDetalheAnotacoao.SetEmpresa(const Value: string);
begin
  FEmpresa := Value;
end;

procedure TDetalheAnotacoao.SetEstado(const Value: string);
begin
  FEstado := Value;
end;

procedure TDetalheAnotacoao.SetModalidade(const Value: string);
begin
  FModalidade := Value;
end;

procedure TDetalheAnotacoao.SetMoeda(const Value: string);
begin
  FMoeda := Value;
end;

procedure TDetalheAnotacoao.SetNumeroContrato(const Value: string);
begin
  FNumeroContrato := Value;
end;

procedure TDetalheAnotacoao.SetRecno(const Value: integer);
begin
  FRecno := Value;
end;

procedure TDetalheAnotacoao.SetSubJudice(const Value: string);
begin
  FSubJudice := Value;
end;

procedure TDetalheAnotacoao.SetTotalOcorrencia(const Value: double);
begin
  FTotalOcorrencia := Value;
end;

procedure TDetalheAnotacoao.SetValorContrato(const Value: double);
begin
  FValorContrato := Value;
end;

end.
