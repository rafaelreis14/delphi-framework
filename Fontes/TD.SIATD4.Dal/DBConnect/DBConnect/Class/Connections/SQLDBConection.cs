using System;
using System.Data.SqlClient;
using System.IO;
using System.Windows.Forms;
using System.Web;
using System.Runtime.InteropServices;
using System.Data;

namespace DBConnect.Class
{
    internal class SQLDBConection : IDBConnection
    {
        internal SqlConnection activeConnection1 { get; set; }
        internal SqlConnection activeConnection2 { get; set; }
        internal SqlConnection activeConnection3 { get; set; }

        internal string Servidor = null;
        internal string Usuario = null;
        internal string Senha = null;
        internal string BancoDados = null;
        internal string NomeApp = "DbConnectSIATD";
        internal string IDUsuarioSistema = "TD";

        public SQLDBConection()
        {

            
        }

        public void Conectar(string nomeAplicacao, string nomeComputador, string modulo, string filialUsuario, string usuarioSistema)
        {
            try
            {
                string path = Application.StartupPath + @"\config.ini";

                if (!File.Exists(path))
                {
                    //se quem consome a ddl é uma aplicação web
                    path = HttpContext.Current.Server.MapPath("~/bin/config.ini");
                }

                FileInfo arquivo = new FileInfo(path);
                //

                this.Desconectar();
                for (int i = 1; i <= 3; i++)
                {
                    ObterConexao(i, arquivo, nomeAplicacao, nomeComputador, modulo, filialUsuario, usuarioSistema);

                }

            }
            catch (Exception ex)
            {

                throw new Exception("Erro ao iniciar a classe" + ex.InnerException != null ? ex.InnerException.Message : ex.Message);
            }
        }

        public void Desconectar()
        {
            if (activeConnection1 != null && activeConnection1.State == ConnectionState.Open)
            {
                activeConnection1.Close();
                
            }

            if (activeConnection2 != null && activeConnection2.State == ConnectionState.Open)
            {
                activeConnection2.Close();
                
            }

            if (activeConnection3 != null && activeConnection3.State == ConnectionState.Open)
            {
                activeConnection3.Close();                
            }
        }

        public System.Data.Common.DbConnection ActiveConnection1
        {
            get
            {
                return activeConnection1;
            }
        }

        public System.Data.Common.DbConnection ActiveConnection2
        {
            get
            {
                return activeConnection2;
            }
        }

        public System.Data.Common.DbConnection ActiveConnection3
        {
            get
            {
                return activeConnection3;
            }
        }


        private void ObterConexao(int numeroConexao, FileInfo arquivo, string nomeAplicacao, string nomeComputador, string modulo, string filialUsuario, string usuarioSistema)
        {            
            string nomeApp = nomeAplicacao;
            string workstationID = "Conexao: " + numeroConexao.ToString() + " Computador: " + nomeComputador + " Modulo: " + modulo + " Filial: " + filialUsuario + " Usuario: " + usuarioSistema;
            string conexao = "CONEXAO" + numeroConexao.ToString();
            string servidor = Library.ReadString(arquivo.FullName, conexao, "SERVIDOR", "");
            string usuario = Library.Decrypt(Library.ReadString(arquivo.FullName, conexao, "USUARIO", ""));
            string senha = Library.Decrypt(Library.ReadString(arquivo.FullName, conexao, "SENHA", ""));
            string bancoDados = Library.ReadString(arquivo.FullName, conexao, "BANCODADOS", "");

            string stringConexao = @"Data Source=" + servidor + ";Initial Catalog=" + bancoDados + ";User ID=" + usuario +
                              ";Password=" + senha + ";Application Name=" + nomeApp + "; Workstation ID=" + workstationID;


            switch (numeroConexao)
            {
                case 1:
                    {
                        if (this.activeConnection1 == null)
                            this.activeConnection1 = new SqlConnection();
                        this.activeConnection1.ConnectionString = stringConexao;
                        this.activeConnection1.Open();
                        
                    }
                    break;
                case 2:
                    {
                        if (servidor != "")
                        {
                            if (this.activeConnection2 == null)
                                this.activeConnection2 = new SqlConnection();
                            this.activeConnection2.ConnectionString = stringConexao;
                            this.activeConnection2.Open();
                        
                        }
                    }
                    break;
                case 3:
                    {
                        if (servidor != "")
                        {
                            if (this.activeConnection3 == null)
                                this.activeConnection3 = new SqlConnection();
                            this.activeConnection3.ConnectionString = stringConexao;
                            this.activeConnection3.Open();
                        }
                    }
                    break;

            }
        }
    }
}
