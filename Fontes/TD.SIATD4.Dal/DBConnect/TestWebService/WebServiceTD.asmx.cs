using DBConnect.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace TestWebService
{
    /// <summary>
    /// Summary description for WebServiceTD
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceTD : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

         [WebMethod]
        public DataSet ConsultaProduto(string nome)
        {
            string comando = @"SELECT  
            B1_CODBAR AS [Código de Barras],
            B1_COD as [Código], 
            B1_DESC as [Descrição],  
            B1_ATVDA as [Ativo]
            FROM SB1010 WHERE B1_DESC LIKE @NOME+'%'".ToUpper();

            SQLDataControl dc = new SQLDataControl();
            dc.Parameters.Add(new ParameterItems("NOME",nome));
            return dc.Query(comando).ToDataSet(); 
        }
    }
}
