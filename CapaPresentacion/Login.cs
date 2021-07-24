using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace CapaPresentacion
{
    public partial class Login : Form
    {
        public string usuario;
        public Login()
        {
            InitializeComponent();
            buttonIngresar.Focus();
        }

        public void logins()
        {
            try
            {

                using (SqlConnection conexion = new SqlConnection("Data Source=LAPTOP-N1TTTB3B;" +
                "Initial Catalog=Tutorias;Integrated Security=SSPI;"))
                {
                    conexion.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT * from Logins  WHERE Logins.Usuario='" + txtusuario  .Text + "' AND Logins.Contraseña='" + txtcontraseña.Text + "'", conexion))
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            MessageBox.Show("Login exitoso.");
                            obtenerusuario();
                            Close();
                           
                            //FrmMain aea = new FrmMain();
                            //aea.ShowDialog();
                            
                        }
                        else
                        {
                            MessageBox.Show("Datos incorrectos.");
                            txtusuario.Text = "";
                            txtcontraseña.Text = "";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

        }
        private void buttonIngresar_Click(object sender, EventArgs e)
        {
            logins();
        }
        public string obtenerusuario()
        {
            usuario = txtusuario.Text;
            return usuario;
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
