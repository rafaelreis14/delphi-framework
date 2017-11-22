using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DBConnect.Class;
using System.Data.Common;

namespace TestDBConnect
{
    public partial class Form1 : Form
    {
        SQLDataControl dc = null;
        public Form1()
        {
            InitializeComponent();
            this.dc = new SQLDataControl(); 
        }

        private void button1_Click(object sender, EventArgs e)
        {
          

            Parameters prm = new Parameters();

            prm.Add(key: "B1_COD", value: "0002", process: "");
            //prm.Add(key: "S01_SENHA", value: "", process: "");
            //prm.Add(key: "VERSAOSERVER", value: "3.15.1.29", process: "");

            string comando = @"SELECT  
            B1_QTMULTV,
            B1_CODBAR,
            B1_CODBARR,
            B1_CODBAR1,
            B1_UMTRANS,
            B1_QTTRANS,
            B1_CBTRANS,
            B1_SEGUM, 
            B1_CONV,
            B1_CBEMB, 
            B1_COD, 
            B1_DESC,  
            B1_PESO, 
            B1_IMPNCM, 
            B1_ATVDA, 
            B1_TDHIDRO,
            B1_TDSELF1, 
            B1_TDDL, 
            B1_TDCOD, 
            B1_TDTIPO, 
            B1_TDCOBER, 
            B1_TDISCO2 
            FROM SB1010   ".ToUpper();

            //string comando = "SELECT BZ_TDCOMIS, BZ_TDPERCE, B1_TDCOMIS, B1_TDPERCE, B1_COMIS    " +
            // " FROM SB1010 AS B1 LEFT OUTER JOIN SBZ010 AS BZ  ON BZ_COD = B1_COD AND BZ.D_E_L_E_T_<>'*'  " +
            // " WHERE BZ_FILIAL = '02' AND B1_COD = '012705'  AND B1.D_E_L_E_T_<>'*' ";

//            string comando = @"SELECT @@Spid as SPID, @@ServerName as 
//                                ServerName, DB_Name() as [Database], S01_LOGIN, S01_NOME, S01_SENHA, S01_BLOQUEADO,  
//                                        S01_MUDASENHA, S01_ALTERASENHA, S01_SRA_EMPRESA,  S01_SRA_FILIAL, S01_SRA_MAT,S01_CRACHA, S01_MUDADATA,  
//                                            S01_OBSTROCSENHA, S01_TPOBSENHA, S01_DTALTSENHA,  S01_ACESSO_FULL, S01_E0TERNO, S01.D_E_L_E_T_, S01.R_E_C_N_O_, 
//                                                    S01_BANCO_MS, S01_CODIGOIMPRESSORA, S01_MULTIPLAINSTANCIA,  ISNULL(RA.RA_VEND, '') RA_VEND FROM SIATD_S01 AS S01  
//                                                            LEFT OUTER JOIN SRA010 AS RA ON S01_SRA_FILIAL = RA.RA_FILIAL AND S01_SRA_MAT = RA.RA_MAT AND RA.D_E_L_E_T_ = '' AND RA.RA_SITFOLH = ''  
//                                                                WHERE S01_LOGIN = :S01_LOGIN AND S01_SENHA = :S01_SENHA AND S01.D_E_L_E_T_ = '' ";

            richTextBox1.Text = dc.Query(comando, prm);
            dataGridView1.DataSource = richTextBox1.Text.ToDataSet().Tables[0];
        }

        private void button2_Click(object sender, EventArgs e)
        {
          

            Parameters prm = new Parameters();

            prm.Add(key: "ALIAS", value: "S08", process: "");

            string comando = @"SELECT S17_NOMETABELA FROM SIATD_S17_01 WHERE S17_ALIAS = :ALIAS".ToUpper();

            richTextBox1.Text = dc.Query(comando, prm);
        }

        private void button3_Click(object sender, EventArgs e)
        {


            Parameters prm = new Parameters();

            //prm.Add(key: "Z3_FILIAL", value: "02", process: "");
            //prm.Add(key: "Z3_NUM", value: "295Z3C", process: "");
            //prm.Add(key: "Z3_VEND", value: "W140M8", process: "");
            //prm.Add(key: "Z3_NOMVDO", value: "JOILSONALMEIDA", process: "");
            //prm.Add(key: "Z3_CLIENTE", value: "262474", process: "");
            //prm.Add(key: "Z3_TDNOMCL", value: "COMERCIAL MIMOSO DE ALIMENTOS", process: "");

            //prm.Add(key: "Z3_LOJA", value: "01", process: "");
            //prm.Add(key: "Z3_ORCLIB", value: "3-BLO", process: "");
            //prm.Add(key: "Z3_EMISSAO", value: "20150213", process: "");
            //prm.Add(key: "Z3_HORA", value: "08:03", process: "");
            //prm.Add(key: "Z3_TIPOCLI", value: "F", process: "");
            //prm.Add(key: "Z3_VLRTOT", value: "9105,79", process: "");
            //prm.Add(key: "Z3_DESCONT", value: "0", process: "");
            //prm.Add(key: "Z3_VLRLIQ", value: "9105,79", process: "");

            //prm.Add(key: "Z3_VALBRUT", value: "9105,79", process: "");
            //prm.Add(key: "Z3_VALMERC", value: "9105,79", process: "");
            //prm.Add(key: "Z3_VALICM", value: "0", process: "");
            //prm.Add(key: "Z3_ICMSRET", value: "0", process: "");
            //prm.Add(key: "Z3_VALIPI", value: "0", process: "");
            //prm.Add(key: "Z3_FRETE", value: "0", process: "");
            //prm.Add(key: "Z3_SEGURO", value: "0", process: "");
            //prm.Add(key: "Z3_DESPESA", value: "0", process: "");
            //prm.Add(key: "Z3_TIPODES", value: "0", process: "");
            //prm.Add(key: "Z3_DTLIM", value: "20150213", process: "");

            //prm.Add(key: "Z3_DOCTD", value: "0", process: "");
            //prm.Add(key: "Z3_SERTD", value: "0", process: "");
            //prm.Add(key: "Z3_PDV", value: "008", process: "");
            //prm.Add(key: "Z3_OPERADO", value: "CZ5", process: "");
            //prm.Add(key: "Z3_EMISNF", value: "0", process: "");
            //prm.Add(key: "Z3_DESCNF", value: "0", process: "");
            //prm.Add(key: "Z3_DINHEIR", value: "9105,79", process: "");
            //prm.Add(key: "Z3_CHEQUES", value: "0", process: "");
            //prm.Add(key: "Z3_CARTAO", value: "0", process: "");

            //prm.Add(key: "Z3_VLRDEBI", value: "0", process: "");
            //prm.Add(key: "Z3_CONVENI", value: "0", process: "");
            //prm.Add(key: "Z3_FINANC", value: "0", process: "");
            //prm.Add(key: "Z3_OUTROS", value: "0", process: "");
            //prm.Add(key: "Z3_FORMPG", value: "0", process: "");
            //prm.Add(key: "Z3_VENDTEF", value: "N", process: "");
            //prm.Add(key: "Z3_AUTSENH", value: "0", process: "");
            //prm.Add(key: "Z3_OBS1", value: "MACLEYDE 9606 4929", process: "");
            //prm.Add(key: "Z3_OBS2", value: "295Z3C", process: "");
            //prm.Add(key: "Z3_DTCAD", value: "20150213", process: "");
            //prm.Add(key: "Z3_CODTRAN", value: "0", process: "");
            //prm.Add(key: "Z3_LOJTRAN", value: "0", process: "");
            //prm.Add(key: "Z3_TIPFRET", value: "2", process: "");

            //prm.Add(key: "Z3_ENDENT", value: "R DES ANTONIO QUIRINO DE ARAUJO N 1207", process: "");
            //prm.Add(key: "Z3_BAIRROE", value: "POCAO", process: "");
            //prm.Add(key: "Z3_CEPE", value: "78015580", process: "");
            //prm.Add(key: "Z3_MUNE", value: "CUIABA", process: "");
            //prm.Add(key: "Z3_ESTE", value: "MT", process: "");
            //prm.Add(key: "Z3_PLIQUI", value: "0", process: "");

            //prm.Add(key: "Z3_PBRUTO", value: "50", process: "");
            //prm.Add(key: "Z3_VOLUME", value: "801,2", process: "");
            //prm.Add(key: "Z3_ESPECIE", value: "UN", process: "");
            //prm.Add(key: "Z3_USERID", value: "VENDASVG/06 Jun 2014 09:03:10:240", process: "");
            //prm.Add(key: "Z3_DOCORIG", value: "0", process: "");
            //prm.Add(key: "Z3_TIPOVEN", value: "VN", process: "");
            //prm.Add(key: "Z3_OPERACA", value: "O", process: "");

            //prm.Add(key: "Z3_ENTREG", value: "N", process: "");
            //prm.Add(key: "Z3_SIATD", value: "S", process: "");
            //prm.Add(key: "Z3_TDNUME", value: "0", process: "");
            //prm.Add(key: "Z3_TDSTPED", value: "0", process: "");
            //prm.Add(key: "Z3_TDFLAG", value: "0", process: "");
            //prm.Add(key: "Z3_VLRFRE", value: "0", process: "");
            //prm.Add(key: "Z3_STATUS", value: "", process: "");
            //prm.Add(key: "Z3_CONFVEN", value: "", process: "");
            //prm.Add(key: "Z3_MOEDA", value: "1", process: "");
            //prm.Add(key: "Z3_PLACA", value: " ", process: "");

            //prm.Add(key: "Z3_UFPLACA", value: " ", process: "");
            //prm.Add(key: "Z3_VEIPESQ", value: " ", process: "");
            //prm.Add(key: "Z3_BRICMS", value: " ", process: "");
            //prm.Add(key: "Z3_TIPO", value: " ", process: "");

            //prm.Add(key: "Z3_VERSAO", value: "3.15.1.29", process: "");
            //prm.Add(key: "Z3_CONDPG", value: "0", process: "CN");
            //prm.Add(key: "Z3_IMPRIME", value: "0", process: "2N");

            try
            {
                //Parameters prm1 = new Parameters();
                //prm1.Add("BEGINTRANS", "trans1", "");
                //prm1.Add("NIVELISOLAMENTO", "ilReadCommitted", "");
                //dc.StartTransaction(prm1);


                //prm.Add(key: "S12_EMPRESA", value: "14", process: "");
                //prm.Add(key: "S12_NOME", value: "JOAO GABRIEL", process: "");
                
                string comando = "INSERT INTO ZAA010( R_E_C_N_O_, ZAA_ARQ, ZAA_CPFCGC, ZAA_USER, ZAA_DTCON, ZAA_HRCON) VALUES (21967, 'A', '70263124134', 'REIS', '20151104', '115439')";

                dc.Insert(comando, prm, ConnectionType.MainConnection);

                //dc.Insert(comando, prm);

                //Parameters prm4 = new Parameters();

                //prm4.Add(key: "S12_EMPRESA", value: "14", process: "");
                //prm4.Add(key: "S12_NOME", value: "JOAO GABRIEL segunda conexao", process: "");
                //dc.Insert(comando, prm4, ConnectionType.SecudanryConnection, true);


                //dc.Insert(comando, prm);

                //throw new Exception("teste");

                //Parameters prm2 = new Parameters();
                //prm2.Add(key: "COMMIT", value: "trans1", process: "");
                //dc.Commit(prm2);
            }        
            catch (Exception)
            {
                //Parameters prm3 = new Parameters();
                //prm3.Add(key: "ROLLBACK", value: "trans1", process: "");
                //dc.Rollback(prm3);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
          

           // Parameters prm = new Parameters();

            //prm.Add(key: "B1_COD", value: "0", process: "");
            //prm.Add(key: "B1_COD", value: "0", process: "");
            //prm.Add(key: "B1_DESC", value: "MUDOU value", process: "");
            string comando = " UPDATE SB1010 SET B1_DESC = 'XXXX' WHERE B1_COD = '000001' ".ToUpper();

            richTextBox1.Text = dc.Update(comando, null).ToString();
        }

        private void button5_Click(object sender, EventArgs e)
        {

            

            Parameters prm = new Parameters();

            prm.Add(key: "Z3_FILIAL", value: "02", process: "");
            prm.Add(key: "Z3_NUM", value: "295Z44", process: "");
            prm.Add(key: "Z3_VEND", value: "W140C2", process: "");
            prm.Add(key: "Z3_NOMVDO", value: "JOACYRODRIGUES", process: "");
            prm.Add(key: "Z3_CLIENTE", value: "281493", process: "");
            prm.Add(key: "Z3_TDNOMCL", value: "MILTON DANTAS OLIVEIRA", process: "");

            prm.Add(key: "Z3_LOJA", value: "01", process: "");
            prm.Add(key: "Z3_ORCLIB", value: "4-FAT", process: "");
            prm.Add(key: "Z3_EMISSAO", value: "20150213", process: "");
            prm.Add(key: "Z3_HORA", value: "17:56", process: "");
            prm.Add(key: "Z3_TIPOCLI", value: "F", process: "");
            prm.Add(key: "Z3_VLRTOT", value: "578,24", process: "");
            prm.Add(key: "Z3_DESCONT", value: "0", process: "");
            prm.Add(key: "Z3_VLRLIQ", value: "578,24", process: "");

            prm.Add(key: "Z3_VALBRUT", value: "578,24", process: "");
            prm.Add(key: "Z3_VALMERC", value: "578,24", process: "");
            prm.Add(key: "Z3_VALICM", value: "0", process: "");
            prm.Add(key: "Z3_ICMSRET", value: "0", process: "");
            prm.Add(key: "Z3_VALIPI", value: "0", process: "");
            prm.Add(key: "Z3_FRETE", value: "0", process: "");
            prm.Add(key: "Z3_SEGURO", value: "0", process: "");
            prm.Add(key: "Z3_DESPESA", value: "0", process: "");
            prm.Add(key: "Z3_TIPODES", value: "0", process: "");
            prm.Add(key: "Z3_DTLIM", value: "20150213", process: "");

            prm.Add(key: "Z3_DOCTD", value: "0", process: "");
            prm.Add(key: "Z3_SERTD", value: "0", process: "");
            prm.Add(key: "Z3_PDV", value: "008", process: "");
            prm.Add(key: "Z3_OPERADO", value: "CZ5", process: "");
            prm.Add(key: "Z3_EMISNF", value: "0", process: "");
            prm.Add(key: "Z3_DESCNF", value: "0", process: "");
            prm.Add(key: "Z3_DINHEIR", value: "578,24", process: "");
            prm.Add(key: "Z3_CHEQUES", value: "0", process: "");
            prm.Add(key: "Z3_CARTAO", value: "0", process: "");

            prm.Add(key: "Z3_VLRDEBI", value: "0", process: "");
            prm.Add(key: "Z3_CONVENI", value: "0", process: "");
            prm.Add(key: "Z3_FINANC", value: "0", process: "");
            prm.Add(key: "Z3_OUTROS", value: "0", process: "");
            prm.Add(key: "Z3_FORMPG", value: "0", process: "");
            prm.Add(key: "Z3_VENDTEF", value: "N", process: "");
            prm.Add(key: "Z3_AUTSENH", value: "0", process: "");
            prm.Add(key: "Z3_OBS1", value: "MACLEYDE 9606 4929", process: "");
            prm.Add(key: "Z3_OBS2", value: "295Z3A", process: "");
            prm.Add(key: "Z3_DTCAD", value: "20150213", process: "");
            prm.Add(key: "Z3_CODTRAN", value: "0", process: "");
            prm.Add(key: "Z3_LOJTRAN", value: "0", process: "");
            prm.Add(key: "Z3_TIPFRET", value: "2", process: "");

            prm.Add(key: "Z3_ENDENT", value: "R DES ANTONIO QUIRINO DE ARAUJO N 1207", process: "");
            prm.Add(key: "Z3_BAIRROE", value: "POCAO", process: "");
            prm.Add(key: "Z3_CEPE", value: "78015580", process: "");
            prm.Add(key: "Z3_MUNE", value: "CUIABA", process: "");
            prm.Add(key: "Z3_ESTE", value: "MT", process: "");
            prm.Add(key: "Z3_PLIQUI", value: "0", process: "");

            prm.Add(key: "Z3_PBRUTO", value: "50", process: "");
            prm.Add(key: "Z3_VOLUME", value: "801,2", process: "");
            prm.Add(key: "Z3_ESPECIE", value: "UN", process: "");
            prm.Add(key: "Z3_USERID", value: "VENDASVG/06 Jun 2014 09:03:10:240", process: "");
            prm.Add(key: "Z3_DOCORIG", value: "0", process: "");
            prm.Add(key: "Z3_TIPOVEN", value: "VN", process: "");
            prm.Add(key: "Z3_OPERACA", value: "O", process: "");

            prm.Add(key: "Z3_ENTREG", value: "N", process: "");
            prm.Add(key: "Z3_SIATD", value: "S", process: "");
            prm.Add(key: "Z3_TDNUME", value: "0", process: "");
            prm.Add(key: "Z3_TDSTPED", value: "0", process: "");
            prm.Add(key: "Z3_TDFLAG", value: "0", process: "");
            prm.Add(key: "Z3_VLRFRE", value: "0", process: "");
            prm.Add(key: "Z3_STATUS", value: "0", process: "");
            prm.Add(key: "Z3_CONFVEN", value: "0", process: "");
            prm.Add(key: "Z3_MOEDA", value: "1", process: "");
            prm.Add(key: "Z3_PLACA", value: "0", process: "");

            prm.Add(key: "Z3_UFPLACA", value: "0", process: "");
            prm.Add(key: "Z3_VEIPESQ", value: "0", process: "");
            prm.Add(key: "Z3_BRICMS", value: "0", process: "");
            prm.Add(key: "Z3_TIPO", value: "0", process: "");
            prm.Add(key: "R_E_C_N_O_", value: "18495905", process: "");
            prm.Add(key: "Z3_VERSAO", value: "3.15.1.29", process: "");
            //prm.Add(key: "Z3_CONDPG", value: "0", process: "CN");
            //prm.Add(key: "Z3_IMPRIME", value: "0", process: "2N");

            //string comando = "INSERT INTO SZ3010 (Z3_FILIAL, Z3_NUM, Z3_VEND, Z3_NOMVDO, Z3_CLIENTE, Z3_ORCLIB, Z3_EMISSAO, Z3_TIPOCLI, Z3_VLRTOT, Z3_DESCONT, Z3_VLRLIQ, Z3_DTLIM, Z3_DOCTD, Z3_SERTD, Z3_PDV, Z3_EMISNF, Z3_VALBRUT, Z3_DESCNF, Z3_DINHEIR, Z3_CHEQUES, Z3_CARTAO, Z3_CONVENI, Z3_FINANC, Z3_VALICM, Z3_VALIPI, Z3_CONDPG, Z3_FORMPG, Z3_LOJA, Z3_VENDTEF, Z3_AUTSENH, Z3_OBS1, Z3_OBS2, Z3_DTCAD, Z3_CODTRAN, Z3_LOJTRAN, Z3_TIPFRET, Z3_ENDENT, Z3_BAIRROE, Z3_CEPE, Z3_MUNE, Z3_ESTE, Z3_FRETE, Z3_SEGURO, Z3_DESPESA, Z3_PLIQUI, Z3_PBRUTO, Z3_VOLUME, Z3_ESPECIE, Z3_USERID, Z3_DOCORIG, Z3_TIPOVEN, Z3_ICMSRET, Z3_OPERADO, Z3_OPERACA, Z3_ENTREG, Z3_IMPRIME, Z3_SIATD, Z3_TDNOMCL, Z3_TDNUME, Z3_TDSTPED, Z3_TDFLAG, Z3_STATUS, Z3_VLRDEBI, Z3_CONFVEN, Z3_MOEDA, Z3_PLACA, Z3_UFPLACA, Z3_VEIPESQ, Z3_BRICMS, Z3_TIPO, Z3_HORA, Z3_VALMERC, Z3_VLRFRE, Z3_TIPODES, Z3_VERSAO, Z3_OUTROS )  VALUES(:Z3_FILIAL, :Z3_NUM, :Z3_VEND, :Z3_NOMVDO, :Z3_CLIENTE, :Z3_ORCLIB, :Z3_EMISSAO, :Z3_TIPOCLI, :Z3_VLRTOT, :Z3_DESCONT, :Z3_VLRLIQ, :Z3_DTLIM, :Z3_DOCTD, :Z3_SERTD, :Z3_PDV, :Z3_EMISNF, :Z3_VALBRUT, :Z3_DESCNF, :Z3_DINHEIR, :Z3_CHEQUES, :Z3_CARTAO, :Z3_CONVENI, :Z3_FINANC, :Z3_VALICM, :Z3_VALIPI, :Z3_CONDPG, :Z3_FORMPG, :Z3_LOJA, :Z3_VENDTEF, :Z3_AUTSENH, :Z3_OBS1, :Z3_OBS2, :Z3_DTCAD, :Z3_CODTRAN, :Z3_LOJTRAN, :Z3_TIPFRET, :Z3_ENDENT, :Z3_BAIRROE, :Z3_CEPE, :Z3_MUNE, :Z3_ESTE, :Z3_FRETE, :Z3_SEGURO, :Z3_DESPESA, :Z3_PLIQUI, :Z3_PBRUTO, :Z3_VOLUME, :Z3_ESPECIE, :Z3_USERID, :Z3_DOCORIG, :Z3_TIPOVEN, :Z3_ICMSRET, :Z3_OPERADO, :Z3_OPERACA, :Z3_ENTREG, :Z3_IMPRIME, :Z3_SIATD, :Z3_TDNOMCL, :Z3_TDNUME, :Z3_TDSTPED, :Z3_TDFLAG, :Z3_STATUS, :Z3_VLRDEBI, :Z3_CONFVEN, :Z3_MOEDA, :Z3_PLACA, :Z3_UFPLACA, :Z3_VEIPESQ, :Z3_BRICMS, :Z3_TIPO, :Z3_HORA, :Z3_VALMERC, :Z3_VLRFRE, :Z3_TIPODES, :Z3_VERSAO, :Z3_OUTROS )";

            string comando = @"UPDATE SZ3010 SET Z3_FILIAL = :Z3_FILIAL, Z3_NUM = :Z3_NUM, Z3_VEND = :Z3_VEND, Z3_NOMVDO = :Z3_NOMVDO,
                            Z3_CLIENTE = :Z3_CLIENTE, Z3_ORCLIB = :Z3_ORCLIB, Z3_EMISSAO = :Z3_EMISSAO, Z3_TIPOCLI = :Z3_TIPOCLI, 
                            Z3_VLRTOT = :Z3_VLRTOT, Z3_DESCONT = :Z3_DESCONT, Z3_VLRLIQ = :Z3_VLRLIQ, Z3_DTLIM = :Z3_DTLIM, Z3_DOCTD = :Z3_DOCTD, 
                            Z3_SERTD = :Z3_SERTD, Z3_PDV = :Z3_PDV, Z3_EMISNF = :Z3_EMISNF, Z3_VALBRUT = :Z3_VALBRUT, Z3_DESCNF = :Z3_DESCNF, 
                            Z3_DINHEIR = :Z3_DINHEIR, Z3_CHEQUES = :Z3_CHEQUES, Z3_CARTAO = :Z3_CARTAO, Z3_CONVENI = :Z3_CONVENI, Z3_FINANC = :Z3_FINANC, 
                            Z3_VALICM = :Z3_VALICM, Z3_VALIPI = :Z3_VALIPI, Z3_FORMPG = :Z3_FORMPG, Z3_LOJA = :Z3_LOJA, Z3_VENDTEF = :Z3_VENDTEF, 
                            Z3_AUTSENH = :Z3_AUTSENH, Z3_OBS1 = :Z3_OBS1, Z3_OBS2 = :Z3_OBS2, Z3_DTCAD = :Z3_DTCAD, Z3_CODTRAN = :Z3_CODTRAN, 
                            Z3_LOJTRAN = :Z3_LOJTRAN, Z3_TIPFRET = :Z3_TIPFRET, Z3_ENDENT = :Z3_ENDENT, Z3_BAIRROE = :Z3_BAIRROE, Z3_CEPE = :Z3_CEPE, 
                            Z3_MUNE = :Z3_MUNE, Z3_ESTE = :Z3_ESTE, Z3_FRETE = :Z3_FRETE, Z3_SEGURO = :Z3_SEGURO, Z3_DESPESA = :Z3_DESPESA, Z3_PLIQUI = :Z3_PLIQUI, 
                            Z3_PBRUTO = :Z3_PBRUTO, Z3_VOLUME = :Z3_VOLUME, Z3_ESPECIE = :Z3_ESPECIE, Z3_USERID = :Z3_USERID, Z3_DOCORIG = :Z3_DOCORIG, Z3_TIPOVEN = :Z3_TIPOVEN, 
                            Z3_ICMSRET = :Z3_ICMSRET, Z3_OPERADO = :Z3_OPERADO, Z3_OPERACA = :Z3_OPERACA, Z3_ENTREG = :Z3_ENTREG, Z3_SIATD = :Z3_SIATD, Z3_TDNUME = :Z3_TDNUME, 
                            Z3_TDSTPED = :Z3_TDSTPED, Z3_TDFLAG = :Z3_TDFLAG, Z3_STATUS = :Z3_STATUS, Z3_VLRDEBI = :Z3_VLRDEBI, Z3_CONFVEN = :Z3_CONFVEN, Z3_MOEDA = :Z3_MOEDA, 
                            Z3_PLACA = :Z3_PLACA, Z3_UFPLACA = :Z3_UFPLACA, Z3_VEIPESQ = :Z3_VEIPESQ, Z3_BRICMS = :Z3_BRICMS, Z3_TIPO = :Z3_TIPO, Z3_HORA = :Z3_HORA, Z3_VALMERC = :Z3_VALMERC, 
                            Z3_VLRFRE = :Z3_VLRFRE, Z3_VERSAO = :Z3_VERSAO, Z3_OUTROS = :Z3_OUTROS  WHERE R_E_C_N_O_ = :R_E_C_N_O_";

            richTextBox1.Text = dc.Update(comando, prm).ToString();

           
        }

        private void button6_Click(object sender, EventArgs e)
        {
           

            Parameters prm = new Parameters();

            prm.Add(key: "Codigo", value: "000001", process: "");

            richTextBox1.Text =    dc.StoredProcedure("usp_teste", prm);

            
        }

        private void button7_Click(object sender, EventArgs e)
        {

          

            Parameters prm = new Parameters();

            prm.Add("BEGINTRANS", "trans1", "");
            prm.Add("NIVELISOLAMENTO", "ilReadCommitted", "");

            richTextBox1.Text = dc.StartTransaction(prm).ToString();

        
        
        }

        private void button8_Click(object sender, EventArgs e)
        {
           

            Parameters prm = new Parameters();

            prm.Add(key: "COMMIT", value: "trans1", process: "");

            richTextBox1.Text = dc.Commit(prm).ToString();
        }

        private void button9_Click(object sender, EventArgs e)
        {
          

            Parameters prm = new Parameters();

            prm.Add(key: "ROLLBACK", value: "trans1", process: "");

            richTextBox1.Text = dc.Rollback(prm).ToString();
        }

        private void button10_Click(object sender, EventArgs e)
        {
            dc.Connect("SIATD.4", "fuck", "fuck", "fuck", "siatdteste");
            //Parameters prm = new Parameters();
            //prm.Add("USERID", "MARCIOANDRE","");

            //string comando = @" SELECT USERID FROM SIATDUSER WHERE EMPRESA = '01' AND USERID = :USERID AND SENHA = '\SFGI6rmPO2-\SFGI6rm' ";

            //richTextBox1.Text = dc.Query(comando, prm).ToString();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            dc.Connect("SIATD.4", "teste", "teste", "teste", "siatdteste");
        }

        private void button11_Click(object sender, EventArgs e)
        {
            dc.Disconnect();
        }
    }
}

