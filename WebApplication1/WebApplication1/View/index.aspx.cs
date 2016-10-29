using System;
using System.Security.Cryptography;
using System.Text;
using MySql.Data.MySqlClient;

namespace WebApplication1.View
{
    public partial class index : System.Web.UI.Page
    {
        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
        MySqlConnection conn = new MySqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_click(object sender, EventArgs e)
        {
            String usernameField = username.Text;
            String passwordField = MD5Hash(password.Text);

            String command = "select * from project_notes.users where username='" + usernameField + "' and password='" + passwordField + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);

            MySqlDataReader myReader;
            conn.Open();
            myReader = selectCommand.ExecuteReader();
            int count = 0;
            while (myReader.Read())
            {
                count = count + 1;
            }
            if (count == 1)
            {
                Session["name"] = usernameField;
                Response.Redirect("main.aspx");
            }
            else
            {
                Response.Redirect("index.aspx");
            }
            conn.Close();
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