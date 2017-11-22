using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data.Common;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Data;


namespace DBConnect.Class
{

    public enum OperationType : int { Insert, Update, Query, Delete }

    [ComVisible(true)]
    [Guid("BCE332DA-1455-4C30-B5C7-3C846A712DFC")]
    public enum ConnectionType : int { MainConnection, SecudanryConnection, TertiaryConnection }

    [ComVisible(true)]
    [Guid("42676162-6DFF-4751-B2BD-FA122C41031C")]
    public interface IDataControl
    {
        List<ParameterItems> Parameters { get; set; }

        //DB operations methods
        string Query(string sqlcommand, Parameters @params, ConnectionType connection);
        int Insert(string sqlcommand, Parameters @params, ConnectionType connection);
        bool Update(string sqlcommand, Parameters @params, ConnectionType connection);
        bool Delete(string sqlcommand, Parameters @params, ConnectionType connection);
        string StoredProcedure(string storeProc, Parameters @params, ConnectionType connection);

        //transaction methods
        bool StartTransaction(Parameters @params, ConnectionType connection);
        bool Commit(Parameters @params, ConnectionType connection);
        bool Rollback(Parameters @params, ConnectionType connection);

        //connection methods
        void Connect(string applicationName, string computerName, string module, string userBranch, string userName);
        void Disconnect();
    }


    [ComVisible(true)]
    [Guid("04CBB967-4FA5-41C3-877C-7739E63F64D7")]
    public class SQLDataControl : IDataControl, IDisposable
    {
        internal List<ParameterItems> parameters;

        public List<ParameterItems> Parameters
        {
            get { return parameters; }
            set { parameters = value; }
        }

        internal SQLDBConection DBConnection { get; set; }

        public SQLDataControl()
        {
            this.DBConnection = new SQLDBConection();
            this.Parameters = new List<ParameterItems>();
        }

        public void Connect(string applicationName, string computerName, string module, string userBranch, string user)
        {
            this.DBConnection.Conectar(applicationName, computerName, module, userBranch, user);
        }

        public void Disconnect()
        {
           
                this.DBConnection.Desconectar();  
           
        }
        
        private SqlConnection GetConnection(ConnectionType connectionType)
        {
            switch (connectionType)
            {
                case ConnectionType.MainConnection:
                    return (this.DBConnection.ActiveConnection1 as SqlConnection);
                case ConnectionType.SecudanryConnection:
                    { 
                        if (this.DBConnection.ActiveConnection2 != null)
                            return (this.DBConnection.ActiveConnection2 as SqlConnection);
                        else
                            return (this.DBConnection.ActiveConnection1 as SqlConnection);
                    }
                case ConnectionType.TertiaryConnection:
                    {
                        if (this.DBConnection.ActiveConnection3 != null)
                            return (this.DBConnection.ActiveConnection3 as SqlConnection);
                        else
                            return (this.DBConnection.ActiveConnection1 as SqlConnection);
                    }                    
                default:
                    return (this.DBConnection.ActiveConnection1 as SqlConnection);
            }
        }


        /// <summary>
        /// Metodo de Execução de Query a partir de um comando de entrada
        /// </summary>
        /// <param name="sqlcommand">Comando sql da query</param>
        /// <param name="params">Prametros para o comando sql, caso haja, senão infomar null</param>
        /// <param name="limit">informa a quantidade de dados retornado pelo query, 0 = ilimitado</param>
        /// <returns>retorno da query do banco em formato xml</returns>
        public string Query(string sqlcommand, Parameters @params, ConnectionType connection)
        {
            SqlDataReader reader = null;
            try
            {
                string SQLCommand = sqlcommand.TrimStart();

                SqlCommand command = new SqlCommand();
                command.Connection = GetConnection(connection);

               command.CommandText = SQLCommand;

                Debug.Write("parameters");
                if (@params != null)
                {
                    command.CommandText = SQLCommand.Replace(":", "@");
                    foreach (var item in @params.Items)
                    {
                        if (item.Value == "")
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, " ");
                        }
                        else
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, item.Value);
                        }
                    }
                }
                else
                {
                    if (this.Parameters.Count > 0)
                    {
                        foreach (var item in this.Parameters)
                        {
                            if (item.Value == "")
                                command.Parameters.AddWithValue(item.Key, "");
                            else
                                command.Parameters.AddWithValue(item.Key, item.Value);
                        }
                    }
                }

                Debug.Write("ExecuteReader");
                reader = command.ExecuteReader();
                this.Parameters.Clear();

                return reader.ToXML();   
            }
            catch (Exception ex)
            {
                Debug.Write(ex.Message);
                if (ex.InnerException != null)
                {
                    Debug.Write(ex.InnerException.Message);
                }
                throw new Exception(ex.Message);
            }
            finally
            {
                if (reader != null)
                    reader.Close();
            }
        }

        public string Query(string sqlcommand, Parameters @params)
        {
            return this.Query(sqlcommand, @params, ConnectionType.MainConnection);
        }

        public string Query(string sqlcommand)
        {
            return this.Query(sqlcommand, null, ConnectionType.MainConnection);
        }

        public DataSet Query2(string sqlcommand, Parameters @params, ConnectionType connection)
        {
            SqlDataReader reader = null;
            SqlCommand command = new SqlCommand();
            DataTable dt = new DataTable();
            try
            {
                string SQLCommand = sqlcommand.TrimStart().ToUpper();
                command.Connection = GetConnection(connection);

                command.CommandText = SQLCommand;

                Debug.Write("@params");
                if (@params != null)
                {
                    command.CommandText = SQLCommand.Replace(":", "@");
                    foreach (var item in @params.Items)
                    {
                        if (item.Value == "")
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, " ");
                        }
                        else
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, item.Value);
                        }
                    }
                }
                else
                {
                    if (this.Parameters.Count > 0)
                    {
                        foreach (var item in this.Parameters)
                        {
                            if (item.Value == "")
                                command.Parameters.AddWithValue(item.Key, "");
                            else
                                command.Parameters.AddWithValue(item.Key, item.Value);
                        }
                    }
                }

                Debug.Write("ExecuteReader");
                reader = command.ExecuteReader();
                this.Parameters.Clear();

                dt.Load(reader);

                DataSet ds = new DataSet();
                ds.Tables.Add(dt);

                return ds;
            }
            catch (Exception ex)
            {
                Debug.Write(ex.Message);
                if (ex.InnerException != null)
                {
                    Debug.Write(ex.InnerException.Message);
                }
                throw new Exception(ex.Message);
            }
            finally
            {                
                if (reader != null)
                    reader.Close();
            }
        }

        public DataSet Query2(string sqlcommand, Parameters @params)
        {
           return this.Query2(sqlcommand, @params, ConnectionType.MainConnection);
        }

        /// <summary>
        /// Metodo de Execução de Insert a partir de um comando de entrada 
        /// </summary>
        /// <param name="sqlcommand">Comando sql do Insert</param>
        /// <param name="params">Prametros para o comando sql, caso haja, senão infomar null</param>
        /// <returns>retorna o recno</returns>
        public int Insert(string sqlcommand, Parameters @params, ConnectionType connection)
        {
            SqlDataReader reader = null;
            try
            {
                string SQLCommand = sqlcommand.TrimStart();

                SqlCommand command = new SqlCommand();
                command.Connection = GetConnection(connection);

                SQLCommand = SQLCommand + "; SELECT CAST(scope_identity() AS int); ";


                if (@params != null)
                {
                    command.CommandText = SQLCommand.Replace(":", "@");
                    foreach (var item in @params.Items)
                    {
                        if (item.Value.Trim() == "")
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, " ");
                        }
                        else
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, item.Value.Trim().Replace(',', '.'));
                        }
                    }
                }
                else
                    command.CommandText = SQLCommand;

                

                int retorno = 0;
                object id = command.ExecuteScalar();
                retorno = (id == DBNull.Value) ? 0 : (int)id;
                return retorno;
            }
            catch (Exception ex)
            {               
                throw new Exception(ex.Message);
            }
            finally
            {
                if (reader != null)
                    reader.Close();
            }
        }

        public int Insert(string sqlcommand, Parameters @params)
        {
            return this.Insert(sqlcommand, @params, ConnectionType.MainConnection);
        }

        /// <summary>
        /// Metodo de Execução de Update a partir de um comando de entrada 
        /// </summary>
        /// <param name="sqlcommand">Comando sql do Update</param>
        /// <param name="params">Prametros para o comando sql, caso haja, senão infomar null</param>
        /// <returns>Retorno boleano, sucesso = true, falha = false</returns>
        public bool Update(string sqlcommand, Parameters @params, ConnectionType connection)
        {
            try
            {
                string SQLCommand = sqlcommand.TrimStart();
                
                SqlCommand command = new SqlCommand();
                command.Connection = GetConnection(connection);
                
                if (@params != null)
                {
                    command.CommandText = SQLCommand.Replace(":", "@");
                    foreach (var item in @params.Items)
                    {
                        if (item.Value.Trim() == "")
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, " ");
                        }
                        else
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, item.Value.Trim().Replace(',', '.'));
                        }
                    }
                }
                else
                    command.CommandText = SQLCommand;

                bool retorno = command.ExecuteNonQuery() > 0 ? true : false;

                return retorno;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public bool Update(string sqlcommand, Parameters @params)
        {
            return this.Update(sqlcommand, @params, ConnectionType.MainConnection);
        }

        /// <summary>
        /// Metodo de Execução de Delete a partir de um comando de entrada 
        /// </summary>
        /// <param name="sqlcommand">Comando sql do Delete</param>
        /// <param name="params">Prametros para o comando sql, caso haja, senão infomar null</param>
        /// <returns>Retorno boleano, sucesso = true, falha = false</returns>
        public bool Delete(string sqlcommand, Parameters @params, ConnectionType connection)
        {
            try
            {
                string SQLCommand = sqlcommand.TrimStart();

                SqlCommand command = new SqlCommand();
                command.Connection = GetConnection(connection);

                if (@params != null)
                {
                    command.CommandText = SQLCommand.Replace(":", "@");
                    foreach (var item in @params.Items)
                    {
                        if (item.Value.Trim() == "")
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, " ");
                        }
                        else
                        {
                            if (command.CommandText.Contains("@" + item.Key))
                                command.Parameters.AddWithValue(item.Key, item.Value.Trim().Replace(',', '.'));
                        }
                    }
                }
                else
                    command.CommandText = SQLCommand;

                bool retorno = command.ExecuteNonQuery() > 0 ? true : false;

                return retorno;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public bool Delete(string sqlcommand, Parameters @params)
        {
            return this.Delete(sqlcommand, @params, ConnectionType.MainConnection);
        }

        /// <summary>
        /// Metodo de Execução de StorecProcedure a partir de um nome de entrada
        /// </summary>
        /// <param name="storeProc">Nome da Stored Procedure</param>
        /// <param name="@params">Prametros para a Stored Procedire, caso haja, senão infomar null</param>
        /// <returns>Retorna uma string no formato chave valor</returns> 
        public string StoredProcedure(string storeProc, Parameters @params, ConnectionType connection)
        {
            SqlDataReader reader = null;
            try
            {
                SqlCommand command = new SqlCommand(storeProc, GetConnection(connection));
                command.CommandType = System.Data.CommandType.StoredProcedure;

                SqlCommandBuilder.DeriveParameters(command);

                foreach (SqlParameter p in command.Parameters)
                {
                    if (p.Direction == ParameterDirection.Input)
                    {
                        foreach (var item in @params.Items)
                        {
                            if (p.ParameterName == item.Key)
                                if (item.Value.Trim() != "")
                                    p.Value = item.Value;
                                else
                                    p.Value = DBNull.Value;
                        }
                    }
                    else
                        if (p.Direction == ParameterDirection.InputOutput)
                            p.Value = DBNull.Value;
                }

                reader = command.ExecuteReader();

                StringBuilder Retorno = new StringBuilder();

                foreach (SqlParameter p in command.Parameters)
                {
                    if (p.Direction == System.Data.ParameterDirection.InputOutput)
                        Retorno.Append(p.ParameterName + "|" + p.Value.ToString() + ";");
                }

                return Retorno.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (reader != null)
                    reader.Close();
            }
        }

        public string StoredProcedure(string storeProc, Parameters @params)
        {
            return this.StoredProcedure(storeProc, @params);
        }

        /// <summary>
        /// Metodo de Execução de Inicio de uma transação de Banco de Dados
        /// </summary>
        /// <param name="params">Parametros com Nome e o Nivel de isolamento da transação</param>
        /// <returns>Retorno boleano, sucesso = true, falha = false</returns>
        public bool StartTransaction(Parameters @params, ConnectionType connection)
        {
            try
            {
                string cNivelIsolamento = null;
                StringBuilder CommandBuilder = new StringBuilder();
                string NivelIsolamento = Library.GetParameterItemByName(@params, "NIVELISOLAMENTO", "").Value;

                switch (NivelIsolamento)
                {
                    case "ilReadUncommitted": cNivelIsolamento = "READ UNCOMMITTED"; break;
                    case "ilReadCommitted": cNivelIsolamento = "READ COMMITTED"; break;
                    case "ilRepeatableRead": cNivelIsolamento = "REPEATABLE READ"; break;
                    case "ilSerializable": cNivelIsolamento = "SERIALIZABLE"; break;
                }

                if (@params.Items[0] != null)
                {
                    string trans = Library.GetParameterItemByName(@params, "BEGINTRANS", "").Value;
                    CommandBuilder.Append(" SET TRANSACTION ISOLATION LEVEL " + cNivelIsolamento + ";");
                    CommandBuilder.Append(" BEGIN TRANSACTION [" + trans + "];");
                }
                else
                    throw new Exception("2005 - Parametro inválido");

                SqlCommand command = new SqlCommand();
                command.Connection = GetConnection(connection);

                command.CommandText = CommandBuilder.ToString();

                int rowsaffect = command.ExecuteNonQuery();

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public bool StartTransaction(Parameters @params)
        {
            return this.StartTransaction(@params, ConnectionType.MainConnection);
        }

        /// <summary>
        /// Metodo de Execução de Confirmação de uma transação de Banco de Dados
        /// </summary>
        /// <param name="params">Parametro com o Nome da transação</param>
        /// <returns>Retorno boleano, sucesso = true, falha = false</returns>
        public bool Commit(Parameters @params, ConnectionType connection)
        {
            try
            {
                StringBuilder CommandBuilder = new StringBuilder();
                if (@params.Items[0] != null)
                    CommandBuilder.Append("IF @@TRANCOUNT > 0 COMMIT TRANSACTION [" + @params.Items[0].Value + "]");
                else
                    throw new Exception("2005 - Parametro inválido");
                SqlCommand command = new SqlCommand();
                command.Connection = GetConnection(connection);
                command.CommandText = CommandBuilder.ToString();
                int rowsaffect = command.ExecuteNonQuery();

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public bool Commit(Parameters @params)
        {
            return this.Commit(@params, ConnectionType.MainConnection);
        }

        /// <summary>
        /// Metodo de Execução de Reversão de uma transação de Banco de Dados
        /// </summary>
        /// <param name="params">Parametro com o Nome da transação</param>
        /// <returns>Retorno boleano, sucesso = true, falha = false</returns>
        public bool Rollback(Parameters @params, ConnectionType connection)
        {
            try
            {
                StringBuilder CommandBuilder = new StringBuilder();
                if (@params.Items[0] != null)
                    CommandBuilder.Append("IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION [" + @params.Items[0].Value + "]");
                else
                    throw new Exception("2005 - Parametro inválido");
                //
                SqlCommand command = new SqlCommand();
                command.Connection = GetConnection(connection);
                command.CommandText = CommandBuilder.ToString();
                //
                int rowsaffect = command.ExecuteNonQuery();
                //
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public bool Rollback(Parameters @params)
        {
            return Rollback(@params, ConnectionType.MainConnection);
        }




        bool isDisposed = false;

        public void Dispose()
        {
            Dispose(true);
        }

        //~SQLDataControl(){
        //    if (this.DBConnection != null)
        //        if (this.DBConnection.activeConnection.State == ConnectionState.Open)
        //            this.DBConnection.activeConnection.Close();
        //}


        protected virtual void Dispose(bool IsDisposing)
        {
            if (IsDisposing)
            {
                isDisposed = true;
                this.Disconnect();
            }
            GC.SuppressFinalize(this);
        }
    }


}
