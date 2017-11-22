using DBConnectSIATD.Class;
using SiatdWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace SiatdWeb.Controllers
{
    public class ProdutoController : Controller
    {
        //
        // GET: /Produto/

        public ActionResult Index(string Produto = "", string Filial= "")
        {
            SQLDataControl dc = new SQLDataControl();

            Parameters prm = new Parameters();

            prm.Add(key: "Codigo", value: Produto, process: "");
            prm.Add(key: "Filial", value: Filial, process: "");

            string comando = @"SELECT  top 1
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
                        B2_CGER, 
                        B1_IMPNCM, 
                        B1_ATVDA, 
                        B1_TDHIDRO,
                        B1_TDSELF1, 
                        B1_TDDL, 
                        B1_TDCOD, 
                        B1_TDTIPO, 
                        B0_DTAINIC, 
                        B0_DTAFIM, 
                        B0_PRV1, 
                        B0_PRV2, (B2_QATU-B2_RESERVA) AS ESTOQUE, 
                        B1_TDCOBER, 
                        B1_TDISCO2 
                        FROM SB1010  AS SB1 INNER JOIN SB0010 AS SB0 ON B1_FILIAL = '' AND B1_COD = B0_COD  
                        AND SB1.R_E_C_N_O_ > 0  AND SB1.D_E_L_E_T_ = '' INNER JOIN SB2010 AS SB2 ON B2_FILIAL = B0_FILIAL AND 
                        B2_LOCAL = '01' AND B2_COD = B0_COD AND SB2.R_E_C_D_E_L_ = 0   WHERE B0_FILIAL = :Filial AND B1_CODBAR = :Codigo ".ToUpper();

            DataTable dt = dc.Query(comando, prm).ToDataSet().Tables[0];
            List<Produto> ListaProd = new List<Produto>();
            
            foreach(DataRow row in dt.Rows)
            {
                 ListaProd.Add(new Produto { Descricao = row["B1_DESC"].ToString(), Preco = row["B0_PRV1"].ToString() });
            }

            return View(ListaProd.ToList());
        }



    }
}
