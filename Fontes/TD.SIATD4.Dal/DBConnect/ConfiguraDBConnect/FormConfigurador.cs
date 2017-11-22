using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;

using System.IO;
using System.Configuration;
using DBConnect.Class;
using System.Runtime.InteropServices;

namespace ConfiguraDBConnect
{
    public partial class FormConfigurador : Form
    {
        public FormConfigurador()
        {
            InitializeComponent();

            string path = Application.StartupPath + @"\config.ini";

            if (!File.Exists(path))
            {
                File.Create(path);
            }

            FileInfo arquivo = new FileInfo(path);

            txtServidor1.Text = Library.ReadString(arquivo.FullName, "CONEXAO1", "SERVIDOR", "");
            txtUsuario1.Text = Library.Decrypt(Library.ReadString(arquivo.FullName, "CONEXAO1", "USUARIO", ""));
            txtSenha1.Text = Library.Decrypt(Library.ReadString(arquivo.FullName, "CONEXAO1", "SENHA", ""));
            txtBancoDados1.Text = Library.ReadString(arquivo.FullName, "CONEXAO1", "BANCODADOS", "");

            txtServidor2.Text = Library.ReadString(arquivo.FullName, "CONEXAO2", "SERVIDOR", "");
            txtUsuario2.Text = Library.Decrypt(Library.ReadString(arquivo.FullName, "CONEXAO2", "USUARIO", ""));
            txtSenha2.Text = Library.Decrypt(Library.ReadString(arquivo.FullName, "CONEXAO2", "SENHA", ""));
            txtBancoDados2.Text = Library.ReadString(arquivo.FullName, "CONEXAO2", "BANCODADOS", "");

            txtServidor3.Text = Library.ReadString(arquivo.FullName, "CONEXAO3", "SERVIDOR", "");
            txtUsuario3.Text = Library.Decrypt(Library.ReadString(arquivo.FullName, "CONEXAO3", "USUARIO", ""));
            txtSenha3.Text = Library.Decrypt(Library.ReadString(arquivo.FullName, "CONEXAO3", "SENHA", ""));
            txtBancoDados3.Text = Library.ReadString(arquivo.FullName, "CONEXAO3", "BANCODADOS", "");
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            string path = Application.StartupPath + @"\config.ini";

            string Servidor1 = txtServidor1.Text;
            string Usuario1 = Library.Crypt(txtUsuario1.Text);
            string Senha1 = Library.Crypt(txtSenha1.Text);
            string bancoDados1 = txtBancoDados1.Text;

            string Servidor2 = txtServidor2.Text;
            string Usuario2 = Library.Crypt(txtUsuario2.Text);
            string Senha2 = Library.Crypt(txtSenha2.Text);
            string bancoDados2 = txtBancoDados2.Text;

            string Servidor3 = txtServidor3.Text;
            string Usuario3 = Library.Crypt(txtUsuario3.Text);
            string Senha3 = Library.Crypt(txtSenha3.Text);
            string bancoDados3 = txtBancoDados3.Text;

            FileInfo arquivo = new FileInfo(path);

            Library.WriteString(arquivo.FullName, "CONEXAO1", "SERVIDOR", Servidor1);
            Library.WriteString(arquivo.FullName, "CONEXAO1", "USUARIO", Usuario1);
            Library.WriteString(arquivo.FullName, "CONEXAO1", "SENHA", Senha1);
            Library.WriteString(arquivo.FullName, "CONEXAO1", "BANCODADOS", bancoDados1);

            Library.WriteString(arquivo.FullName, "CONEXAO2", "SERVIDOR", Servidor2);
            Library.WriteString(arquivo.FullName, "CONEXAO2", "USUARIO", Usuario2);
            Library.WriteString(arquivo.FullName, "CONEXAO2", "SENHA", Senha2);
            Library.WriteString(arquivo.FullName, "CONEXAO2", "BANCODADOS", bancoDados2);

            Library.WriteString(arquivo.FullName, "CONEXAO3", "SERVIDOR", Servidor3);
            Library.WriteString(arquivo.FullName, "CONEXAO3", "USUARIO", Usuario3);
            Library.WriteString(arquivo.FullName, "CONEXAO3", "SENHA", Senha3);
            Library.WriteString(arquivo.FullName, "CONEXAO3", "BANCODADOS", bancoDados3);
            
            MessageBox.Show("Dados gravados com sucesso.");
        }

        private void BtnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

    }
}
