{*Created by @ReisCodeGenerator*}
unit Biz.CursoSeguro;

interface

uses
    Classes, System.SysUtils, Dialogs, Lib.ClasseBase, Lib.Parametro, Lib.Enumeradores,
    Lib.Persistable, Lib.ResultFilter, Lib.Lista, Dal.ControleDados, Dal.CondicaoConsulta,
	Framework.Interfaces.CRUD, Dal.FabricaSQL;

type
    [TReferenceTable('ZJA010')]
	TCursoSeguro = class(TClasseBase, ICRUD<TCursoSeguro>)
	private
        FCodigoFilial: string;
        FNumeroOrcamento: string;
        FItem: string;
        FCodigoProduto: string;
        FCodigoProdutoCurso: string;
        FValorPago: double;
        FDataMovimento: string;
        FNumeroChub: string;
        FNomeTitular: string;
        FCpfTitular: string;
        FDigitoCpfTitular: string;
        FDataNascimentoTitular: string;
        FSexoTitular: string;
        FEnderecoTitular: string;
        FBairroTitular: string;
        FMunicipioTitular: string;
        FUFTitular: string;
        FCepTitular: string;
        FDDDTitular: string;
        FDataVigenciaInicio: string;
        FDataVigenciaFinal: string;
        FValorCoberturaPrincipal: double;
        FValorPremio: double;
        FStatusCobertura: string;
        FNumeroSorteSerie1: string;
        FNumeroSorte1: string;
        FNumeroContrato: string;
        FDataCoberturaInicio: string;
        FDataCoberturaFinal: string;
        FEnderecoRisco: string;
        FComplementoRisco: string;
        FBairroRisco: string;
        FNumeroRisco: string;
        FMunicipioRisco: string;
        FUFRisco: string;
        FCepRisco: string;
        FTipoConstrucao: string;
        FNumeroBilhete: string;
        FDataEmissao: string;
        FDelete: string;
        FRecno: integer;
        procedure SetCodigoFilial(const Value: string);
        procedure SetNumeroOrcamento(const Value: string);
        procedure SetItem(const Value: string);
        procedure SetCodigoProduto(const Value: string);
        procedure SetCodigoProdutoCurso(const Value: string);
        procedure SetValorPago(const Value: double);
        procedure SetDataMovimento(const Value: string);
        procedure SetNumeroChub(const Value: string);
        procedure SetNomeTitular(const Value: string);
        procedure SetCpfTitular(const Value: string);
        procedure SetDigitoCpfTitular(const Value: string);
        procedure SetDataNascimentoTitular(const Value: string);
        procedure SetSexoTitular(const Value: string);
        procedure SetEnderecoTitular(const Value: string);
        procedure SetBairroTitular(const Value: string);
        procedure SetMunicipioTitular(const Value: string);
        procedure SetUFTitular(const Value: string);
        procedure SetCepTitular(const Value: string);
        procedure SetDDDTitular(const Value: string);
        procedure SetDataVigenciaInicio(const Value: string);
        procedure SetDataVigenciaFinal(const Value: string);
        procedure SetValorCoberturaPrincipal(const Value: double);
        procedure SetValorPremio(const Value: double);
        procedure SetStatusCobertura(const Value: string);
        procedure SetNumeroSorteSerie1(const Value: string);
        procedure SetNumeroSorte1(const Value: string);
        procedure SetNumeroContrato(const Value: string);
        procedure SetDataCoberturaInicio(const Value: string);
        procedure SetDataCoberturaFinal(const Value: string);
        procedure SetEnderecoRisco(const Value: string);
        procedure SetComplementoRisco(const Value: string);
        procedure SetBairroRisco(const Value: string);
        procedure SetNumeroRisco(const Value: string);
        procedure SetMunicipioRisco(const Value: string);
        procedure SetUFRisco(const Value: string);
        procedure SetCepRisco(const Value: string);
        procedure SetTipoConstrucao(const Value: string);
        procedure SetNumeroBilhete(const Value: string);
        procedure SetDataEmissao(const Value: string);
        procedure SetDelete(const Value: string);
        procedure SetRecno(const Value: integer);


    public
        class var dao: TControleDados<TLista<TCursoSeguro>,TListaDAO<TCursoSeguro>>;

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
        function Obter(ID: string): TCursoSeguro; overload;

        ///	<summary>
        ///	  Método que retorna um objeto preenchido
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Obter(parametros:TParametro): TCursoSeguro; overload;


        ///	<summary>
        ///	  Método que retonar uma lista com varios objetos de acordo com parametro passado
        ///	</summary>
        ///	<param name="parametros">
        ///	  Parametros para a consulta do objeto a ser preenchido
        ///	</param>
        function Consultar(parametros:TParametro): TLista<TCursoSeguro>; overload;
        function Consutlar(cpf: String): TLista<TCursoSeguro>; overload;


        ///	<summary>
        ///	  Método que preenche a instância do Objeto
        ///	</summary>
        ///	<param name="ClasseBase">
        ///	  objeto de parametro para preenchimento da instância
        ///	</param>
        procedure PreencherObjeto(CursoSeguro: TCursoSeguro);

        [TPersistable(fgPersistable, 'ZJA_FILIAL')]
        [TMaxLenght(2)]
        property CodigoFilial: string read FCodigoFilial write SetCodigoFilial;

        [TPersistable(fgPersistable, 'ZJA_ORCMAE')]
        [TMaxLenght(6)]
        property NumeroOrcamento: string read FNumeroOrcamento write SetNumeroOrcamento;

        [TPersistable(fgPersistable, 'ZJA_ITEM')]
        [TMaxLenght(2)]
        property Item: string read FItem write SetItem;

        [TPersistable(fgPersistable, 'ZJA_PROD')]
        [TMaxLenght(15)]
        property CodigoProduto: string read FCodigoProduto write SetCodigoProduto;

        [TPersistable(fgPersistable, 'ZJA_CODIGO')]
        [TMaxLenght(6)]
        property CodigoProdutoCurso: string read FCodigoProdutoCurso write SetCodigoProdutoCurso;

        [TPersistable(fgPersistable, 'ZJA_VLRPAG')]
        property ValorPago: double read FValorPago write SetValorPago;

        [TPersistable(fgPersistable, 'ZJA_DTMOV')]
        [TMaxLenght(8)]
        property DataMovimento: string read FDataMovimento write SetDataMovimento;

        [TPersistable(fgPersistable, 'ZJA_NRCHUB')]
        [TMaxLenght(10)]
        property NumeroChub: string read FNumeroChub write SetNumeroChub;

        [TPersistable(fgPersistable, 'ZJA_NOME')]
        [TMaxLenght(50)]
        property NomeTitular: string read FNomeTitular write SetNomeTitular;

        [TPersistable(fgPersistable, 'ZJA_CPF')]
        [TMaxLenght(15)]
        property CpfTitular: string read FCpfTitular write SetCpfTitular;

        [TPersistable(fgPersistable, 'ZJA_DIGCPF')]
        [TMaxLenght(2)]
        property DigitoCpfTitular: string read FDigitoCpfTitular write SetDigitoCpfTitular;

        [TPersistable(fgPersistable, 'ZJA_DTNASC')]
        [TMaxLenght(8)]
        property DataNascimentoTitular: string read FDataNascimentoTitular write SetDataNascimentoTitular;

        [TPersistable(fgPersistable, 'ZJA_SEXO')]
        [TMaxLenght(1)]
        property SexoTitular: string read FSexoTitular write SetSexoTitular;

        [TPersistable(fgPersistable, 'ZJA_END')]
        [TMaxLenght(100)]
        property EnderecoTitular: string read FEnderecoTitular write SetEnderecoTitular;

        [TPersistable(fgPersistable, 'ZJA_BAIRRO')]
        [TMaxLenght(30)]
        property BairroTitular: string read FBairroTitular write SetBairroTitular;

        [TPersistable(fgPersistable, 'ZJA_CIDADE')]
        [TMaxLenght(50)]
        property MunicipioTitular: string read FMunicipioTitular write SetMunicipioTitular;

        [TPersistable(fgPersistable, 'ZJA_ESTADO')]
        [TMaxLenght(2)]
        property UFTitular: string read FUFTitular write SetUFTitular;

        [TPersistable(fgPersistable, 'ZJA_CEP')]
        [TMaxLenght(8)]
        property CepTitular: string read FCepTitular write SetCepTitular;

        [TPersistable(fgPersistable, 'ZJA_DDD')]
        [TMaxLenght(3)]
        property DDDTitular: string read FDDDTitular write SetDDDTitular;

        [TPersistable(fgPersistable, 'ZJA_VIGINI')]
        [TMaxLenght(8)]
        property DataVigenciaInicio: string read FDataVigenciaInicio write SetDataVigenciaInicio;

        [TPersistable(fgPersistable, 'ZJA_VIGFIM')]
        [TMaxLenght(8)]
        property DataVigenciaFinal: string read FDataVigenciaFinal write SetDataVigenciaFinal;

        [TPersistable(fgPersistable, 'ZJA_COBERT')]
        property ValorCoberturaPrincipal: double read FValorCoberturaPrincipal write SetValorCoberturaPrincipal;

        [TPersistable(fgPersistable, 'ZJA_PREMIO')]
        property ValorPremio: double read FValorPremio write SetValorPremio;

        [TPersistable(fgPersistable, 'ZJA_STACOB')]
        [TMaxLenght(1)]
        property StatusCobertura: string read FStatusCobertura write SetStatusCobertura;

        [TPersistable(fgPersistable, 'ZJA_SERTC1')]
        [TMaxLenght(3)]
        property NumeroSorteSerie1: string read FNumeroSorteSerie1 write SetNumeroSorteSerie1;

        [TPersistable(fgPersistable, 'ZJA_NSORT1')]
        [TMaxLenght(5)]
        property NumeroSorte1: string read FNumeroSorte1 write SetNumeroSorte1;

        [TPersistable(fgPersistable, 'ZJA_CONTRA')]
        [TMaxLenght(19)]
        property NumeroContrato: string read FNumeroContrato write SetNumeroContrato;

        [TPersistable(fgPersistable, 'ZJA_INICON')]
        [TMaxLenght(8)]
        property DataCoberturaInicio: string read FDataCoberturaInicio write SetDataCoberturaInicio;

        [TPersistable(fgPersistable, 'ZJA_FIMCON')]
        [TMaxLenght(8)]
        property DataCoberturaFinal: string read FDataCoberturaFinal write SetDataCoberturaFinal;

        [TPersistable(fgPersistable, 'ZJA_ENDRIS')]
        [TMaxLenght(70)]
        property EnderecoRisco: string read FEnderecoRisco write SetEnderecoRisco;

        [TPersistable(fgPersistable, 'ZJA_CPRIS')]
        [TMaxLenght(10)]
        property ComplementoRisco: string read FComplementoRisco write SetComplementoRisco;

        [TPersistable(fgPersistable, 'ZJA_BRORIS')]
        [TMaxLenght(30)]
        property BairroRisco: string read FBairroRisco write SetBairroRisco;

        [TPersistable(fgPersistable, 'ZJA_NUMRIS')]
        [TMaxLenght(10)]
        property NumeroRisco: string read FNumeroRisco write SetNumeroRisco;

        [TPersistable(fgPersistable, 'ZJA_CIDRIS')]
        [TMaxLenght(50)]
        property MunicipioRisco: string read FMunicipioRisco write SetMunicipioRisco;

        [TPersistable(fgPersistable, 'ZJA_UFRIS')]
        [TMaxLenght(2)]
        property UFRisco: string read FUFRisco write SetUFRisco;

        [TPersistable(fgPersistable, 'ZJA_CEPRIS')]
        [TMaxLenght(8)]
        property CepRisco: string read FCepRisco write SetCepRisco;

        [TPersistable(fgPersistable, 'ZJA_CONSTR')]
        [TMaxLenght(1)]
        property TipoConstrucao: string read FTipoConstrucao write SetTipoConstrucao;

        [TPersistable(fgPersistable, 'ZJA_BILHET')]
        [TMaxLenght(20)]
        property NumeroBilhete: string read FNumeroBilhete write SetNumeroBilhete;

        [TPersistable(fgPersistable, 'ZJA_DTEMIS')]
        [TMaxLenght(8)]
        property DataEmissao: string read FDataEmissao write SetDataEmissao;

        [TPersistable(fgPersistable, 'D_E_L_E_T_')]
        [TMaxLenght(1)]
        property Delete: string read FDelete write SetDelete;

        [TPersistable(fgUpdateable, 'R_E_C_N_O_')]
        property Recno: integer read FRecno write SetRecno;


        constructor Create; override;
        destructor Destroy; override;

    end;

implementation


{ TCursoSeguro }

uses Lib.Filter, Lib.Biblioteca, Biz.UsuarioLogado;

{$REGION 'Métodos CRUD'}

function TCursoSeguro.Inserir: integer;
begin
    try
        try
            result := dao.Inserir(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao inserir CursoSeguro'+#13+ e.Message);
        end;
    finally
    end;
end;

function TCursoSeguro.Alterar: boolean;
begin
    try
        try
            result := dao.Alterar(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao alterar CursoSeguro'+#13+ e.Message);
        end;
    finally
    end;
end;


function TCursoSeguro.Excluir: boolean;
begin
    try
        try
            result := dao.Excluir(Self);
        except
          on e: exception do
              raise Exception.Create('Erro ao excluir CursoSeguro'+#13+ e.Message);
        end;
    finally
    end;

end;

function TCursoSeguro.Consultar(parametros: TParametro): Tlista<TCursoSeguro>;
var
    query: string;
    condicao: TCondicaoConsulta;
begin
    try
        condicao := TCondicaoConsulta.Create(parametros);
        condicao.Adiciona('ZJA_FILIAL',ccIgual, lgAnd); 
        condicao.Adiciona('ZJA_ORCMAE',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_ITEM',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_PROD',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_CODIGO',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_VLRPAG',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_DTMOV',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_NRCHUB',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_NOME',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_CPF',ccIgual, lgAND);
        condicao.Adiciona('ZJA_DIGCPF',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_DTNASC',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_SEXO',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_END',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_BAIRRO',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_CIDADE',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_ESTADO',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_CEP',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_DDD',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_VIGINI',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_VIGFIM',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_COBERT',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_PREMIO',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_STACOB',ccIgual, lgAND); 
        condicao.Adiciona('ZJA_SERTC1',ccIgual, lgAND);
        condicao.Adiciona('ZJA_NSORT1',ccIgual, lgAND);
        condicao.Adiciona('ZJA_CONTRA',ccIgual, lgAND);
        condicao.Adiciona('ZJA_INICON',ccIgual, lgAND);
        condicao.Adiciona('ZJA_FIMCON',ccIgual, lgAND);
        condicao.Adiciona('ZJA_ENDRIS',ccIgual, lgAND);
        condicao.Adiciona('ZJA_CPRIS',ccIgual, lgAND);
        condicao.Adiciona('ZJA_BRORIS',ccIgual, lgAND);
        condicao.Adiciona('ZJA_NUMRIS',ccIgual, lgAND);
        condicao.Adiciona('ZJA_CIDRIS',ccIgual, lgAND);
        condicao.Adiciona('ZJA_UFRIS',ccIgual, lgAND);
        condicao.Adiciona('ZJA_CEPRIS',ccIgual, lgAND);
        condicao.Adiciona('ZJA_CONSTR',ccIgual, lgAND);
        condicao.Adiciona('ZJA_BILHET',ccIgual, lgAND);
        condicao.Adiciona('ZJA_DTEMIS',ccIgual, lgAND);
        condicao.Adiciona('D_E_L_E_T_',ccIgual, lgAND);
        condicao.Adiciona('R_E_C_N_O_',ccIgual, lgAND);

        query := 'SELECT '+Self.ObterCamposSeparadosPorVirgula(Consulta,[]) + ' FROM ' + Self.TabelaReferencia + ' WHERE D_E_L_E_T_ = '''' ' + condicao.ToString(true);

        Result := dao.Consultar(query,parametros);
    finally
        condicao.Free;
    end;
end;

function TCursoSeguro.Consutlar(cpf: String): TLista<TCursoSeguro>;
var
    parametros: TParametro;
begin
    try
        parametros := TParametro.Create;
        parametros.Add('', 'ZJA_CPF', cpf);
        result := Consultar(parametros);
    finally
        FreeAndNil(parametros);
    end;
end;

constructor TCursoSeguro.Create;
begin
  inherited;

end;

destructor TCursoSeguro.Destroy;
begin

  inherited;
end;

function TCursoSeguro.Listar(tipoOperacao: TOparationTypes; multselect: Boolean): TResultFilter;
var
    campoFiltro:TFieldFilter;
    filtro : TFilter<TCursoSeguro>;
    //parametro : TParametro;
    //lista:TLista<TCursoSeguro>
begin
    try
        filtro := TFilter<TCursoSeguro>.Create;
        filtro.ScreenName := 'Filtro de CursoSeguro';
        filtro.OperationType := tipoOperacao;
        filtro.MultiSelect := multselect;
        filtro.AddIndex(1, 'CodigoFilial=ZJA_FILIAL', 'CodigoFilial'); 
        filtro.AddIndex(2, 'NumeroOrcamento=ZJA_ORCMAE', 'NumeroOrcamento'); 
        filtro.AddIndex(3, 'Item=ZJA_ITEM', 'Item'); 
        filtro.AddIndex(4, 'CodigoProduto=ZJA_PROD', 'CodigoProduto'); 
        filtro.AddIndex(5, 'CodigoProdutoCurso=ZJA_CODIGO', 'CodigoProdutoCurso'); 
        filtro.AddIndex(6, 'ValorPago=ZJA_VLRPAG', 'ValorPago'); 
        filtro.AddIndex(7, 'DataMovimento=ZJA_DTMOV', 'DataMovimento'); 
        filtro.AddIndex(8, 'NumeroChub=ZJA_NRCHUB', 'NumeroChub'); 
        filtro.AddIndex(9, 'NomeTitular=ZJA_NOME', 'NomeTitular'); 
        filtro.AddIndex(10, 'CpfTitular=ZJA_CPF', 'CpfTitular'); 
        filtro.AddIndex(11, 'DigitoCpfTitular=ZJA_DIGCPF', 'DigitoCpfTitular'); 
        filtro.AddIndex(12, 'DataNascimentoTitular=ZJA_DTNASC', 'DataNascimentoTitular'); 
        filtro.AddIndex(13, 'SexoTitular=ZJA_SEXO', 'SexoTitular'); 
        filtro.AddIndex(14, 'EnderecoTitular=ZJA_END', 'EnderecoTitular'); 
        filtro.AddIndex(15, 'BairroTitular=ZJA_BAIRRO', 'BairroTitular'); 
        filtro.AddIndex(16, 'MunicipioTitular=ZJA_CIDADE', 'MunicipioTitular'); 
        filtro.AddIndex(17, 'UFTitular=ZJA_ESTADO', 'UFTitular'); 
        filtro.AddIndex(18, 'CepTitular=ZJA_CEP', 'CepTitular'); 
        filtro.AddIndex(19, 'DDDTitular=ZJA_DDD', 'DDDTitular'); 
        filtro.AddIndex(20, 'DataVigenciaInicio=ZJA_VIGINI', 'DataVigenciaInicio'); 
        filtro.AddIndex(21, 'DataVigenciaFinal=ZJA_VIGFIM', 'DataVigenciaFinal'); 
        filtro.AddIndex(22, 'ValorCoberturaPrincipal=ZJA_COBERT', 'ValorCoberturaPrincipal'); 
        filtro.AddIndex(23, 'ValorPremio=ZJA_PREMIO', 'ValorPremio'); 
        filtro.AddIndex(24, 'StatusCobertura=ZJA_STACOB', 'StatusCobertura'); 
        filtro.AddIndex(25, 'NumeroSorteSerie1=ZJA_SERTC1', 'NumeroSorteSerie1'); 
        filtro.AddIndex(26, 'NumeroSorte1=ZJA_NSORT1', 'NumeroSorte1'); 
        filtro.AddIndex(27, 'NumeroContrato=ZJA_CONTRA', 'NumeroContrato'); 
        filtro.AddIndex(28, 'DataCoberturaInicio=ZJA_INICON', 'DataCoberturaInicio'); 
        filtro.AddIndex(29, 'DataCoberturaFinal=ZJA_FIMCON', 'DataCoberturaFinal'); 
        filtro.AddIndex(30, 'EnderecoRisco=ZJA_ENDRIS', 'EnderecoRisco'); 
        filtro.AddIndex(31, 'ComplementoRisco=ZJA_CPRIS', 'ComplementoRisco'); 
        filtro.AddIndex(32, 'BairroRisco=ZJA_BRORIS', 'BairroRisco'); 
        filtro.AddIndex(33, 'NumeroRisco=ZJA_NUMRIS', 'NumeroRisco'); 
        filtro.AddIndex(34, 'MunicipioRisco=ZJA_CIDRIS', 'MunicipioRisco'); 
        filtro.AddIndex(35, 'UFRisco=ZJA_UFRIS', 'UFRisco'); 
        filtro.AddIndex(36, 'CepRisco=ZJA_CEPRIS', 'CepRisco'); 
        filtro.AddIndex(37, 'TipoConstrucao=ZJA_CONSTR', 'TipoConstrucao'); 
        filtro.AddIndex(38, 'NumeroBilhete=ZJA_BILHET', 'NumeroBilhete'); 
        filtro.AddIndex(39, 'DataEmissao=ZJA_DTEMIS', 'DataEmissao'); 
        filtro.AddIndex(40, 'Delete=D_E_L_E_T_', 'Delete'); 
        filtro.AddIndex(41, 'Recno=R_E_C_N_O_', 'Recno'); 
        //###Criar os Índices do filtro
		// filtro.AddIndex(99, 'Empresa=S01_EMP, Filial=S01_FILIAL, Descricao=S01_DESC', 'Empresa + Filial + Descrição');

        {$REGION 'Campo Filtro'}

        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'CodigoFilial'; 
        campoFiltro.Name := 'CodigoFilial'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'NumeroOrcamento'; 
        campoFiltro.Name := 'NumeroOrcamento'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'Item'; 
        campoFiltro.Name := 'Item'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'CodigoProduto'; 
        campoFiltro.Name := 'CodigoProduto'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'CodigoProdutoCurso'; 
        campoFiltro.Name := 'CodigoProdutoCurso'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'ValorPago'; 
        campoFiltro.Name := 'ValorPago'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'DataMovimento'; 
        campoFiltro.Name := 'DataMovimento'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'NumeroChub'; 
        campoFiltro.Name := 'NumeroChub'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'NomeTitular'; 
        campoFiltro.Name := 'NomeTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'CpfTitular'; 
        campoFiltro.Name := 'CpfTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'DigitoCpfTitular'; 
        campoFiltro.Name := 'DigitoCpfTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'DataNascimentoTitular'; 
        campoFiltro.Name := 'DataNascimentoTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'SexoTitular'; 
        campoFiltro.Name := 'SexoTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'EnderecoTitular'; 
        campoFiltro.Name := 'EnderecoTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'BairroTitular'; 
        campoFiltro.Name := 'BairroTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'MunicipioTitular'; 
        campoFiltro.Name := 'MunicipioTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'UFTitular'; 
        campoFiltro.Name := 'UFTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'CepTitular'; 
        campoFiltro.Name := 'CepTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'DDDTitular'; 
        campoFiltro.Name := 'DDDTitular'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'DataVigenciaInicio'; 
        campoFiltro.Name := 'DataVigenciaInicio'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'DataVigenciaFinal'; 
        campoFiltro.Name := 'DataVigenciaFinal'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'ValorCoberturaPrincipal'; 
        campoFiltro.Name := 'ValorCoberturaPrincipal'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'ValorPremio'; 
        campoFiltro.Name := 'ValorPremio'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'StatusCobertura'; 
        campoFiltro.Name := 'StatusCobertura'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'NumeroSorteSerie1'; 
        campoFiltro.Name := 'NumeroSorteSerie1'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'NumeroSorte1'; 
        campoFiltro.Name := 'NumeroSorte1'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'NumeroContrato'; 
        campoFiltro.Name := 'NumeroContrato'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'DataCoberturaInicio'; 
        campoFiltro.Name := 'DataCoberturaInicio'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'DataCoberturaFinal'; 
        campoFiltro.Name := 'DataCoberturaFinal'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'EnderecoRisco'; 
        campoFiltro.Name := 'EnderecoRisco'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'ComplementoRisco'; 
        campoFiltro.Name := 'ComplementoRisco'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'BairroRisco'; 
        campoFiltro.Name := 'BairroRisco'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'NumeroRisco'; 
        campoFiltro.Name := 'NumeroRisco'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'MunicipioRisco'; 
        campoFiltro.Name := 'MunicipioRisco'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'UFRisco'; 
        campoFiltro.Name := 'UFRisco'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'CepRisco'; 
        campoFiltro.Name := 'CepRisco'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'TipoConstrucao'; 
        campoFiltro.Name := 'TipoConstrucao'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'NumeroBilhete'; 
        campoFiltro.Name := 'NumeroBilhete'; 
        campoFiltro.MaskTypes := mtNone; 
        campoFiltro.GridSize := 100; 
        campoFiltro.FieldType := fdNormal; 
        filtro.AddField(campoFiltro); 
 
        campoFiltro := TFieldFilter.Create; 
        campoFiltro.Description := 'DataEmissao'; 
        campoFiltro.Name := 'DataEmissao'; 
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

function TCursoSeguro.Obter(parametros: TParametro): TCursoSeguro;
var
  lista: TLista<TCursoSeguro>;
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

function TCursoSeguro.Obter(ID: string): TCursoSeguro;
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

procedure TCursoSeguro.PreencherObjeto(CursoSeguro: TCursoSeguro);
begin
    CursoSeguro.CopiarPara(Self);
    FPreenchido := true;
end;


{$ENDREGION}

{$REGION 'Métodos de Propriedades'}

procedure TCursoSeguro.SetCodigoFilial(const Value: string);
begin
    FCodigoFilial := Value;
end;

procedure TCursoSeguro.SetNumeroOrcamento(const Value: string);
begin
    FNumeroOrcamento := Value;
end;

procedure TCursoSeguro.SetItem(const Value: string);
begin
    FItem := Value;
end;

procedure TCursoSeguro.SetCodigoProduto(const Value: string);
begin
    FCodigoProduto := Value;
end;

procedure TCursoSeguro.SetCodigoProdutoCurso(const Value: string);
begin
    FCodigoProdutoCurso := Value;
end;

procedure TCursoSeguro.SetValorPago(const Value: double);
begin
    FValorPago := Value;
end;

procedure TCursoSeguro.SetDataMovimento(const Value: string);
begin
    FDataMovimento := Value;
end;

procedure TCursoSeguro.SetNumeroChub(const Value: string);
begin
    FNumeroChub := Value;
end;

procedure TCursoSeguro.SetNomeTitular(const Value: string);
begin
    FNomeTitular := Value;
end;

procedure TCursoSeguro.SetCpfTitular(const Value: string);
begin
    FCpfTitular := Value;
end;

procedure TCursoSeguro.SetDigitoCpfTitular(const Value: string);
begin
    FDigitoCpfTitular := Value;
end;

procedure TCursoSeguro.SetDataNascimentoTitular(const Value: string);
begin
    FDataNascimentoTitular := Value;
end;

procedure TCursoSeguro.SetSexoTitular(const Value: string);
begin
    FSexoTitular := Value;
end;

procedure TCursoSeguro.SetEnderecoTitular(const Value: string);
begin
    FEnderecoTitular := Value;
end;

procedure TCursoSeguro.SetBairroTitular(const Value: string);
begin
    FBairroTitular := Value;
end;

procedure TCursoSeguro.SetMunicipioTitular(const Value: string);
begin
    FMunicipioTitular := Value;
end;

procedure TCursoSeguro.SetUFTitular(const Value: string);
begin
    FUFTitular := Value;
end;

procedure TCursoSeguro.SetCepTitular(const Value: string);
begin
    FCepTitular := Value;
end;

procedure TCursoSeguro.SetDDDTitular(const Value: string);
begin
    FDDDTitular := Value;
end;

procedure TCursoSeguro.SetDataVigenciaInicio(const Value: string);
begin
    FDataVigenciaInicio := Value;
end;

procedure TCursoSeguro.SetDataVigenciaFinal(const Value: string);
begin
    FDataVigenciaFinal := Value;
end;

procedure TCursoSeguro.SetValorCoberturaPrincipal(const Value: double);
begin
    FValorCoberturaPrincipal := Value;
end;

procedure TCursoSeguro.SetValorPremio(const Value: double);
begin
    FValorPremio := Value;
end;

procedure TCursoSeguro.SetStatusCobertura(const Value: string);
begin
    FStatusCobertura := Value;
end;

procedure TCursoSeguro.SetNumeroSorteSerie1(const Value: string);
begin
    FNumeroSorteSerie1 := Value;
end;

procedure TCursoSeguro.SetNumeroSorte1(const Value: string);
begin
    FNumeroSorte1 := Value;
end;

procedure TCursoSeguro.SetNumeroContrato(const Value: string);
begin
    FNumeroContrato := Value;
end;

procedure TCursoSeguro.SetDataCoberturaInicio(const Value: string);
begin
    FDataCoberturaInicio := Value;
end;

procedure TCursoSeguro.SetDataCoberturaFinal(const Value: string);
begin
    FDataCoberturaFinal := Value;
end;

procedure TCursoSeguro.SetEnderecoRisco(const Value: string);
begin
    FEnderecoRisco := Value;
end;

procedure TCursoSeguro.SetComplementoRisco(const Value: string);
begin
    FComplementoRisco := Value;
end;

procedure TCursoSeguro.SetBairroRisco(const Value: string);
begin
    FBairroRisco := Value;
end;

procedure TCursoSeguro.SetNumeroRisco(const Value: string);
begin
    FNumeroRisco := Value;
end;

procedure TCursoSeguro.SetMunicipioRisco(const Value: string);
begin
    FMunicipioRisco := Value;
end;

procedure TCursoSeguro.SetUFRisco(const Value: string);
begin
    FUFRisco := Value;
end;

procedure TCursoSeguro.SetCepRisco(const Value: string);
begin
    FCepRisco := Value;
end;

procedure TCursoSeguro.SetTipoConstrucao(const Value: string);
begin
    FTipoConstrucao := Value;
end;

procedure TCursoSeguro.SetNumeroBilhete(const Value: string);
begin
    FNumeroBilhete := Value;
end;

procedure TCursoSeguro.SetDataEmissao(const Value: string);
begin
    FDataEmissao := Value;
end;

procedure TCursoSeguro.SetDelete(const Value: string);
begin
    FDelete := Value;
end;

procedure TCursoSeguro.SetRecno(const Value: integer);
begin
    FRecno := Value;
end;


{$ENDREGION}

end.

