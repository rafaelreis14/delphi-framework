using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

namespace DBConnect.Class
{
    public static class Extensions
    {
         public static DataSet ToDataSet(this string XML)
        {
            try
            {
                string InputXml = XML;
                XmlTextReader readerXML = new XmlTextReader(new StringReader(InputXml));
                
                //Faz o parse pra validar o XML de entrada
                readerXML.Read();
               
                //XmlReader reader = XmlReader.Create(new StringReader(XML));
                XDocument doc = null;
                doc = XDocument.Load(readerXML);
                var XMLQuery = (from c in doc.Descendants("Retorno")
                                select c).ToList();

                DataSet DataSetReturn = new DataSet();
                foreach (var itemDataSet in XMLQuery.Descendants("DataSet"))
                {
                    //Montando a Estrutura do DataTable
                    DataTable dt = new DataTable(itemDataSet.Attribute("Name").Value);
                    foreach (var itemMetadata in itemDataSet.Descendants("Metadados").Descendants("Campo"))
                    {
                        string Coluna = itemMetadata.Attribute("Nome").Value;
                        dt.Columns.Add(Coluna);
                    }
                    int Cont = 0;

                    //Obtendo os Dados e preenchendo o DataTable
                    foreach (var itemData in itemDataSet.Descendants("Dados").Descendants("Linha"))
                    {
                        Cont++;
                        //if (Cont <= Take)
                        //{
                            string InputXmlData = itemData.ToString();
                            XmlTextReader reader = new XmlTextReader(new StringReader(InputXmlData));

                            XDocument doc2 = XDocument.Load(reader);
                            var XMLQuery2 = (from c in doc2.Descendants("Coluna")
                                          select c).ToList();

                            List<string> Linha = new List<string>();
                            foreach (var itemCampo in XMLQuery2)
                            {
                                string Valor = itemCampo.Attribute("Valor").Value;
                                Linha.Add(Valor);
                            }
                            dt.Rows.Add(Linha.ToArray());
                        //}
                        //else
                        //    break;
                    }
                    DataSetReturn.Tables.Add(dt);
                }
                return DataSetReturn;
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao converter o XML, Mensagem original: "+ex.Message);
            }
        }

         public static string ToXML(this DbDataReader data)
         {
             XElement xmlRetorno = new XElement("Retorno");
             XElement xmlDataSet = new XElement("DataSet");
             XElement xmlMetadados = new XElement("Metadados");
             XElement xmlDados = new XElement("Dados");

             xmlDataSet.Add(new XAttribute("Name", "DataSet1"));
             xmlDataSet.Add(xmlMetadados);
             xmlDataSet.Add(xmlDados);

             DataTable schema = data.GetSchemaTable();


             for (int i = 0; i < data.FieldCount; i++)
             {
                 XElement xmlCampo = new XElement("Campo");
                 string CAMPO = data.GetName(i);
                 xmlCampo.Add(new XAttribute("Nome", CAMPO));
                 xmlCampo.Add(new XAttribute("TipoDado",Library.ServerDataType(data.GetFieldType(i).ToString())));
                 if (data.GetFieldType(i).ToString() == "System.Int32" || data.GetFieldType(i).ToString() == "System.Int16")
                     xmlCampo.Add(new XAttribute("Tamanho", 0));
                 else
                 {
                     int tamanho = data.GetName(i).Length;
                     xmlCampo.Add(new XAttribute("Tamanho", schema.Rows[i]["ColumnSize"]));
                 }

                 xmlMetadados.Add(xmlCampo);
             }

             int linha = 0;

             while (data.Read())
             {
                 XElement xmlLinha = new XElement("Linha");
                 xmlLinha.Add(new XAttribute("Sequencia", linha++));

                 for (int i = 0; i < data.FieldCount; i++)
                 {
                     XElement xmlColuna = new XElement("Coluna");
                     xmlColuna.Add(new XAttribute("Campo", data.GetName(i)));
                     xmlColuna.Add(new XAttribute("Valor", (data.GetValue(i).ToString().Trim())));
                     xmlColuna.Add(new XAttribute("TipoDado", Library.ServerDataType(data.GetFieldType(i).ToString())));
                     xmlLinha.Add(xmlColuna);
                 }

                 xmlDados.Add(xmlLinha);
             }

             xmlRetorno.Add(xmlDataSet);

             XmlDocument doc = new XmlDocument();
             doc.Load(new StringReader(xmlRetorno.ToString()));
             XmlDeclaration xmldecl;
             xmldecl = doc.CreateXmlDeclaration("1.0", null, null);
             xmldecl.Encoding = "UTF-8";
             xmldecl.Standalone = "yes";

             XmlElement root = doc.DocumentElement;
             doc.InsertBefore(xmldecl, root);

             return doc.OuterXml;
         }

        // public static IEnumerable<T> Select<T>(this IDataReader reader,
        //                               Func<IDataReader, T> projection)
        //{
        //    while (reader.Read())
        //    {
        //        yield return projection(reader);
        //    }
        //}


        // public static IEnumerable<Object[]> DataRecord(this System.Data.IDataReader source)
        // {
        //    if (source == null)
        //        throw new ArgumentNullException("source");

        //    while (source.Read())
        //    {
        //        Object[] row = new Object[source.FieldCount];
        //        source.GetValues(row);
        //        yield return row;
        //    }
        // }

         public static List<T> ToList<T>(this DataSet dt)
         {
            // message = string.Empty;
             var list = new List<T>();


             try
             {
                 var columnNames = dt.Tables[0].Columns.Cast<DataColumn>().Select(c => c.ColumnName)
                 .ToList();

                 var properties = typeof(T).GetProperties();

                 list = dt.Tables[0].AsEnumerable().Select(row =>
                 {
                     var objT = Activator.CreateInstance<T>();

                     foreach (var pro in properties)
                     {
                         if (columnNames.Contains(pro.Name.ToUpper()))
                         {
                             var value = row[pro.Name.ToUpper()];
                             var typeName = value.GetType().FullName;

                             
                             pro.SetValue(objT, row.IsNull(pro.Name) ? null : value, null);
                             
                         }
                     }

                     return objT;
                 }).ToList();

             }
             catch (Exception )
             {
                 throw;
                // message = (ex.InnerException != null) ? ex.InnerException.Message : ex.Message;
             }

             return list;
         }

         public static List<T> ToList<T>(this DbDataReader dr)
         {
            
             var list = new List<T>();


             try
             {
                 var columnNames = dr.GetSchemaTable().Columns.Cast<DataColumn>().Select(c => c.ColumnName).ToList();

                 var properties = typeof(T).GetProperties();

                 list = dr.GetSchemaTable().AsEnumerable().Select(row =>
                 {
                     var objT = Activator.CreateInstance<T>();

                     foreach (var pro in properties)
                     {
                         if (columnNames.Contains(pro.Name))
                         {
                             var value = row[pro.Name];
                             var typeName = value.GetType().FullName;


                             pro.SetValue(objT, row.IsNull(pro.Name) ? null : value, null);

                         }
                     }

                     return objT;
                 }).ToList();

             }
             catch (Exception )
             {
                 throw;
                 // message = (ex.InnerException != null) ? ex.InnerException.Message : ex.Message;
             }

             return list;
         }
    }
}
