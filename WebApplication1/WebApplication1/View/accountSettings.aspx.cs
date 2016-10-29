using MySql.Data.MySqlClient;
using System;
using System.Security.Cryptography;
using System.Text;

namespace WebApplication1.View
{
    public partial class accountSettings : System.Web.UI.Page
    {
        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
        MySqlConnection conn = new MySqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            String myUsername = (string)Session["name"];
            username.Text = myUsername;
            String command = "select * from project_notes.users where username='" + myUsername + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = selectCommand.ExecuteReader();
            String myEmail = "";
            while (myReader.Read())
            {
                myEmail = myReader.GetString("email");
            }
            email.Text = myEmail;
        }

        protected void save_click(object sender, EventArgs e)
        {
            String usernameField = (string)Session["name"];
            String passwordField = MD5Hash(password.Text);
            String confirmField = MD5Hash(confirmPassword.Text);
            String emailField = email.Text;
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

        public Boolean checkPassword(string pass1, string pass2)
        {
            if (pass1.Equals(pass2))
            {
                return true;
            }
            return false;
        }
    }
}