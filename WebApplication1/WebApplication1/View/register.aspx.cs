using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text;
using System.Security.Cryptography;

namespace WebApplication1.View
{
    public partial class register : System.Web.UI.Page
    {
        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
        MySqlConnection conn = new MySqlConnection(connectionString);

        protected void register_click(object sender, EventArgs e)
        {
            String usernameField = username.Text;
            String passwordField = MD5Hash(password.Text);
            String confirmField = confirmPassword.Text;
            String emailField = email.Text;
            String dobField = dateOfBirth.Text;

            conn.Open();
            MySqlCommand cmd = new MySqlCommand("insert into users (first_name, last_name, email, password) values ('"+ dobField + "','"+ dobField + "','" + emailField + "','" + passwordField + "')", conn);
            cmd.ExecuteNonQuery();
            cmd.Clone();
        }

        public static string MD5Hash(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }
    }

}