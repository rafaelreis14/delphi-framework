using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Xml;
using System.IO;
using System.Xml.Linq;
using System.Data.Common;
using System.Runtime.InteropServices;
using System.Security.Cryptography;

namespace DBConnect.Class
{
    public class Library
    {
       
        public static string StringToXML(string XML)
        {
           try
            {
                XElement xmlRetorno = new XElement("Retorno");
                XElement xmlDataSet = new XElement("DataSet");
                XElement xmlMetadados = new XElement("Metadados");
                XElement xmlDados = new XElement("Dados");

                xmlDataSet.Add(xmlMetadados);
                xmlDataSet.Add(xmlDados);

                XElement xmlCampo = new XElement("Campo");
                xmlCampo.Add(new XAttribute("Nome", "Padrao"));

                xmlMetadados.Add(xmlCampo);

                XElement xmlLinha = new XElement("Linha");
                xmlLinha.Add(new XAttribute("Sequencia", '1'));

                XElement xmlColuna = new XElement("Coluna");
                xmlColuna.Add(new XAttribute("Valor", XML));

                xmlLinha.Add(xmlColuna);

                xmlDados.Add(xmlLinha);

                xmlRetorno.Add(xmlDataSet);

                XmlDocument doc = new XmlDocument();
                doc.Load(new StringReader(xmlRetorno.ToString()));
                XmlDeclaration xmldecl;
                xmldecl = doc.CreateXmlDeclaration("1.0", null, null);
                xmldecl.Encoding = "UTF-8";
                xmldecl.Standalone = "yes";

                XmlElement root = doc.DocumentElement;
                doc.InsertBefore(xmldecl, root);

                System.Diagnostics.Debug.Write("Executou StringToXML");

                return doc.OuterXml;
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao converter o XML, Mensagem original: "+ex.Message);
            }
        }
           
        public static string ServerDataType(string dataType)
        {
            switch (dataType)
            {
                case "System.String": return "String";
                case "System.Int16": return "SmallInt";
                case "System.Int32": return "Integer";
                case "System.Int64": return "Long"; 
                case "System.Float": return "Float"; 
                case "System.Date": return "Date";
                case "System.Double": return "Numeric";
                case "System.Decimal": return "Numeric";
                case "System.Byte[]": return "BLOB";
                case "System.Boolean": return "Boolean";
                //Double BLOB
                default: return "XXXX" + dataType;
            }
        }

        const string Key = "td14251s41d4as14dfgf4g14s444145214a52s14a6854";

        public static string Crypt(string value)
        {
            byte[] Results;
            System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();
            MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
            byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(Key));
            TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();
            TDESAlgorithm.Key = TDESKey;
            TDESAlgorithm.Mode = CipherMode.ECB;
            TDESAlgorithm.Padding = PaddingMode.PKCS7;
            byte[] DataToEncrypt = UTF8.GetBytes(value);
            try
            {
                ICryptoTransform Encryptor = TDESAlgorithm.CreateEncryptor();
                Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length);
            }
            finally
            {
                TDESAlgorithm.Clear();
                HashProvider.Clear();
            }
            return Convert.ToBase64String(Results);
        }

        public static string Decrypt(string value)
        {
            byte[] Results;
            System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();
            MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
            byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(Key));
            TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();
            TDESAlgorithm.Key = TDESKey;
            TDESAlgorithm.Mode = CipherMode.ECB;
            TDESAlgorithm.Padding = PaddingMode.PKCS7;
            byte[] DataToDecrypt = Convert.FromBase64String(value);
            try
            {
                ICryptoTransform Decryptor = TDESAlgorithm.CreateDecryptor();
                Results = Decryptor.TransformFinalBlock(DataToDecrypt, 0, DataToDecrypt.Length);
            }
            finally
            {
                TDESAlgorithm.Clear();
                HashProvider.Clear();
            }
            return UTF8.GetString(Results);
        }

        [DllImport("KERNEL32.DLL", CharSet = CharSet.Unicode, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool WritePrivateProfileString(string lpAppName, string lpKeyName, string lpString, string lpFileName);

        [DllImport("KERNEL32.DLL", EntryPoint = "GetPrivateProfileStringW",
        SetLastError = true,
        CharSet = CharSet.Unicode, ExactSpelling = true,
        CallingConvention = CallingConvention.StdCall)]
        public static extern int GetPrivateProfileString(string lpAppName, string lpKeyName, string lpDefault, string lpReturnString, int nSize, string lpFilename);

        public static void WriteString(string fileNameAndPath, string section, string key, string text)
        {
            Library.WritePrivateProfileString(section, key, text, fileNameAndPath);
        }

        public static string ReadString(string iniFile, string category, string key, string defaultValue)
        {
            string returnString = new string(' ', 1024);
            Library.GetPrivateProfileString(category, key, defaultValue, returnString, 1024, iniFile);
            return returnString.Split('\0')[0];
        }

        public static ParameterItems GetParameterItemByName(Parameters @params, string Chave, string processo)
        {            
            foreach (ParameterItems item in @params.Items)
            {
                if ((item.Key == Chave))
                {
                    return item;
                }
            }
            //
            throw new Exception("Parametro " + Chave + ", não encontrado.");
        }

    }
}

