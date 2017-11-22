//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Data.SqlClient;
//using System.Data.Common;
//using System.Runtime.InteropServices;
//using System.Diagnostics;
//using System.Data;

//namespace DBConnectSIATD.Class
//{
//    class SQLDataControl2
//    {

//        /// <summary>
//        /// Metodo de Execução de Query a partir de um comando de entrada (Uso interno para testes)
//        /// </summary>
//        /// <param name="sqlcommand">Comando sql da query</param>
//        /// <param name="params">Prametros para o comando sql, caso haja, senão infomar null</param>
//        /// <returns>retorno da query do banco em formato DataTable</returns>
//        public DataSet QueryToDataSet(string sqlcommand, Parameters @params = null, string tableName = "", string userName = "", int limit = 500)
//        {
//            SqlDataReader reader = null;
//            try
//            {
//                string SQLCommand = sqlcommand.TrimStart();
//                SqlCommand command = new SqlCommand();
//                command.Connection = (this.DBConnection.ActiveConnection as SqlConnection);
//                int @return = SQLCommand.IndexOf("TOP");

//                if (limit > 0 && @return != -1)
//                {
//                    throw new Exception("Conflito de informações, o modificador top não pode ser usando com limit maior que 0");
//                }
//                else
//                {
//                    if (@return == -1)
//                    {
//                        if (SQLCommand.IndexOf("DISTINCT") == -1)
//                            SQLCommand = "SELECT TOP(" + limit + ") " + SQLCommand.Substring(7);
//                        else
//                            SQLCommand = SQLCommand.Replace("DISTINCT", "DISTINCT TOP(" + limit + ") ");
//                    }
//                }
//                command.CommandText = SQLCommand.Replace(":", "@");

//                if (@params != null)
//                {
//                    foreach (var item in @params.Items)
//                    {
//                        if (item.Value == "")
//                            command.Parameters.AddWithValue(item.Key, "");
//                        else
//                            command.Parameters.AddWithValue(item.Key, item.Value);
//                    }
//                }
//                else
//                {
//                    if (this.Parametros.Count > 0)
//                    {
//                        foreach (var item in this.Parametros)
//                        {
//                            if (item.Value == "")
//                                command.Parameters.AddWithValue(item.Key, "");
//                            else
//                                command.Parameters.AddWithValue(item.Key, item.Value);
//                        }
//                    }
//                }
//                reader = command.ExecuteReader();
//                this.Parametros.Clear();

//                DataTable dt = new DataTable("dtPadrao");
//                dt.Load(reader);

//                DataSet ds = new DataSet();
//                ds.Tables.Add(dt);

//                return ds;
//            }
//            finally
//            {
//                reader.Close();
//            }
//        }

//        public DataTable QueryToDataTable(string sqlcommand, Parameters @params = null, string tableName = "", string userName = "", int limit = 500)
//        {
//            return QueryToDataSet(sqlcommand, @params, tableName, userName, limit).Tables["dtPadrao"];
//        }

//    }
//}
