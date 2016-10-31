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
            if (Session["name"] == null)
            {
                Response.Redirect("index.aspx");
            }
            String myUsername = (string)Session["name"];
            username.Text = myUsername;
            
        }

        protected void save_click(object sender, EventArgs e)
        {
            String usernameField = (string)Session["name"];
            String currentPasswordField = MD5Hash(currentPassword.Text);
            String newPasswordField = MD5Hash(newPassword.Text);
            String confirmField = MD5Hash(confirmPassword.Text);
            Boolean passEqual = checkPassword(newPassword.Text, confirmPassword.Text);
            Boolean validPass = verifyLogin(usernameField, currentPasswordField);

            if (validPass)
            {
                if (passEqual)
                {
                    MySqlConnection conn2 = new MySqlConnection(connectionString);
                    Session["updatedMessage"] = "Account updated";
                    String command = "update project_notes.users set password='" + newPasswordField + "' where username='" + usernameField + "' ;";
                    MySqlCommand selectCommand = new MySqlCommand(command, conn2);
                    MySqlDataReader myReader;
                    conn2.Open();
                    myReader = selectCommand.ExecuteReader();
                }
                else
                {
                    Session["confirmPasswordMessage"] = "Confirm password does not match";
                }
            }
            else
            {
                Session["validPasswordMessage"] = "Current password invalid";
            }
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

        public Boolean verifyLogin(string username, string password)
        {
            String command = "select * from project_notes.users where username='" + username + "' and password='" + password + "' ;";
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
                return true;
            }
            //conn.Close();
            return false;
        }
    }
}