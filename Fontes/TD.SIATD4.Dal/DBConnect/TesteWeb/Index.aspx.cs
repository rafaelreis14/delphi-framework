using DBConnect.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using System.Reflection;

namespace TesteWeb
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string comando = "SELECT  B1_COD, B1_DESC, " +
            //                               "      CASE  " +
            //                               "    WHEN ((B0_DTAFIM >= CONVERT(VARCHAR(8), GETDATE(),112)) AND " +
            //                               "    (B0_DTAINIC <= CONVERT(VARCHAR(8), GETDATE(),112))) THEN B0_PRV2 " +
            //                               "    ELSE B0_PRV1 " +
            //                               "     END AS PRECO " +
            //                               " FROM SB1010 AS SB1 " +
            //                               "  INNER JOIN SB0010 AS SB0 " +
            //                               "  ON B1_FILIAL = ''  AND B1_COD = B0_COD  AND SB1.R_E_C_N_O_ > 0  AND SB1.D_E_L_E_T_ = '' " +
            //                               "    INNER JOIN SLK010 AS LK " +
            //                               "  ON LK.LK_CODIGO = B1_COD AND LK.D_E_L_E_T_ = '' " +
            //                               " WHERE B0_FILIAL = @FILIAL  AND SB1.B1_TIPO ='ME' AND SB1.B1_ATVDA = 'S' AND SB1.B1_GRUPO != '9000' AND " +
            //                               "   LK.LK_FILIAL = '' AND LK.LK_CODBAR = @COD";


            //string comando = "SELECT  B1_COD , B1_DESC , " +
            //                              "      CASE  " +
            //                              "		  WHEN ((B0_DTAFIM >= CONVERT(VARCHAR(8), GETDATE(),112)) AND " +
            //                              "				(B0_DTAINIC <= CONVERT(VARCHAR(8), GETDATE(),112))) THEN B0_PRV2 " +
            //                              "		  ELSE B0_PRV1 " +
            //                              "	    END AS PRECO " +
            //                              " FROM SB1010 AS SB1 " +
            //                              " 	INNER JOIN SB0010 AS SB0 " +
            //                              "		ON B1_FILIAL = ''  AND B1_COD = B0_COD  AND SB1.R_E_C_N_O_ > 0  AND SB1.D_E_L_E_T_ = '' " +
            //                              "    INNER JOIN SLK010 AS LK " +
            //                              "		ON LK.LK_CODIGO = B1_COD AND LK.D_E_L_E_T_ = '' " +
            //                              " WHERE B0_FILIAL = @FILIAL  AND SB1.B1_TIPO ='ME' AND SB1.B1_ATVDA = 'S' AND SB1.B1_GRUPO != '9000' AND " +
            //                              "	  LK.LK_FILIAL = '' AND LK.LK_CODBAR = @COD";

            string comando = @"SELECT TOP(10) B1_CODBAR, B1_COD, B1_DESC,  B1_ATVDA, B1_TIPO FROM SB1010 WHERE B1_DESC LIKE @NOME+'%'  ".ToUpper();
            SQLDataControl dc = new SQLDataControl();

            dc.Parameters.Add(new ParameterItems("NOME", TextBox1.Text));
            List<Produto> produts = dc.Query(comando,null).ToDataSet().ToList<Produto>();
            GridView1.DataSource = produts;    
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string comando = @"SELECT B1_COD, B1_DESC from SB1010 as SB1010 ";
            SQLDataControl dc = new SQLDataControl();

         //   dc.Parameters.Add(new ParameterItems("NOME", TextBox1.Text));
            List<Produto> produts = dc.Query2(comando, null).ToList<Produto>();
            GridView1.DataSource = produts;
            GridView1.DataBind();
        }
    }
}


#region Exemplos Anteriores

//            string comando = @"SELECT  
//            B1_CODBAR AS [Código de Barras],
//            B1_COD as [Código], 
//            B1_DESC as [Descrição],  
//            B1_ATVDA as [Ativo]
//            FROM SB1010 WHERE B1_DESC LIKE @NOME+'%'  ".ToUpper();

//            SQLDataControl dc = new SQLDataControl();
//            dc.Parameters.Add(new ParameterItems {Key="NOME",Value=TextBox1.Text});
//            GridView1.DataSource = dc.Query(comando, limit: 500).ToDataSet();
//            GridView1.DataBind();

//            string comando = @"SELECT  
//            B1_CODBAR, 
//            B1_COD, 
//            B1_DESC,  
//            B1_ATVDA,
//            B1_TIPO
//            FROM SB1010 WHERE B1_DESC LIKE @NOME+'%'  ".ToUpper();

//            SQLDataControl dc = new SQLDataControl();
//            dc.Parameters.Add(new ParameterItems {Key="NOME",Value=TextBox1.Text});
            
            //DataTable dt =  dc.Query(comando, limit: 500).ToDataSet().Tables[0];
                
            //var prod = dt.AsEnumerable().Select(dataRow => new Produto {B1_CODBAR = dataRow["B1_CODBAR"].ToString(),
            //                                                            B1_COD = dataRow["B1_COD"].ToString(),
            //                                                            B1_DESC = dataRow["B1_DESC"].ToString(),
            //                                                            B1_ATVDA = dataRow["B1_ATVDA"].ToString()}).ToList();
           
            //var produts = dc.Query(comando, limit: 500).ToDataSet().ToList<Produto>();

            //List<Produto> produts = dc.Query2(comando).ToList<Produto>();

            //var attrType = typeof(Produto);
            //var property = prod[0].GetType().GetProperty("B1_CODBAR");
            //object SProduto = property.GetCustomAttributes(attrType, false).FirstOrDefault();

            //foreach (var item in produts)
            //{
            //    typeof(Produto).GetProperties().Select(p => p.GetCustomAttributes()).Where(p => p != null).Select(p => p.Name);
            //}

            //GridView1.DataSource = produts;    
            //GridView1.DataBind();

#endregion