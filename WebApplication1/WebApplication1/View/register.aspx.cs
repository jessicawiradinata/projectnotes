using System;
using MySql.Data.MySqlClient;
using System.Text;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Net.Mail;

namespace WebApplication1.View
{
    public partial class register : System.Web.UI.Page
    {
        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
        MySqlConnection conn = new MySqlConnection(connectionString);
        private static Regex regUser = new Regex(@"[a-zA-Z0-9]{6,18}", RegexOptions.Compiled);
        private static Regex regPass = new Regex(@"[\S]{6,18}", RegexOptions.Compiled);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void checkAvail_click(object sender, EventArgs e)
        {
            String usernameField = username.Text;
            String command = "select * from project_notes.users where username='" + usernameField + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);

            MySqlDataReader myReader;
            conn.Open();
            myReader = selectCommand.ExecuteReader();
            int count = 0;
            while (myReader.Read())
            {
                count = count + 1;
            }
            if (count == 0 && string.IsNullOrEmpty(usernameField) == false)
            {
                //Response.Write("this username is available");
                Session["registerMessage"] = "this username is available";
            }
            else if(string.IsNullOrEmpty(usernameField) == true)
            {
                //Response.Write("please enter your username");\
                Session["usernameMessage"] = "please enter your username";
            }
            else
            {
                //Response.Write("this username has been taken");
                Session["usernameMessage"] = "this username has been taken";
            }
            conn.Close();
        }

        protected void register_click(object sender, EventArgs e)
        {
            String usernameField = username.Text;
            String passwordField = MD5Hash(password.Text);
            String emailField = email.Text;
            String firstNameField = firstName.Text;
            String lastNameField = lastName.Text;
            String dobField = dateOfBirth.Text;
            Boolean passEqual = checkPassword(password.Text, confirmPassword.Text);
            Boolean usernameNotFound = checkUsername(username.Text);
            Boolean emailFound = findEmail(emailField);
            
            if (passEqual)
            {
                if (usernameNotFound)
                {
                    if (!emailFound)
                    {
                        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
                        MySqlConnection conn3 = new MySqlConnection(connectionString);
                        conn3.Open();
                        MySqlCommand cmd = new MySqlCommand("insert into users (username, lastName, firstName, email, password, dateOfBirth, activated, profilePicture) values ('" + usernameField + "','" + lastNameField + "','" + firstNameField + "','" + emailField + "','" + passwordField + "','" + dobField + "','0','');", conn3);
                        cmd.ExecuteNonQuery();
                        cmd.Clone();
                        Session["registerMessage"] = "Your account has been created successfully";
                        sendVerification();
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        Session["emailMessage"] = "Email already in use";
                    }
                }
                else
                {
                    Session["usernameMessage"] = "Please enter an available username";
                }
            }
            else
            {
                Session["usernameMessage"] = "Password does not match";
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
            if(pass1.Equals(pass2))
            {
                return true;
            }
            return false;
        }

        public Boolean checkUsername(string username1)
        {
            MySqlConnection conn2 = new MySqlConnection(connectionString);
            String command = "select * from project_notes.users where username='" + username1 + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn2);

            MySqlDataReader myReader;
            conn2.Open();
            myReader = selectCommand.ExecuteReader();

            int count = 0;
            while(myReader.Read())
            {
                count = count + 1;
            }
            if(count == 0 && string.IsNullOrEmpty(username1) == false)
            {
                return true;
            }
            conn2.Close();
            return false;            
        }

        public Boolean findEmail(string theEmail)
        {
            String command = "select * from project_notes.users where email='" + theEmail + "';";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);

            MySqlDataReader myReader;
            conn.Open();
            myReader = selectCommand.ExecuteReader();

            int count = 0;
            while(myReader.Read())
            {
                count = count + 1;
            }
            if(count == 0 && string.IsNullOrEmpty(theEmail) == false)
            {
                return false;
            }
            conn.Close();
            return true;
        }

        public void sendVerification()
        {
            MailMessage message = new MailMessage();
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;

            String activateLink = "activation.aspx?username=" + username.Text;

            message.From = new MailAddress("projectnotes123@gmail.com");
            message.To.Add(email.Text);
            message.Subject = "Project Notes Account Activation";
            message.Body = "Hi " + firstName.Text + ",<br /><br />Thank you for registering with Project Notes. Please activate your account by <a href = '" + activateLink + "'> clicking here</a>.<br /><br /> Cheers, <br />Project Notes Team";
            message.IsBodyHtml = true;
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = new System.Net.NetworkCredential("projectnotes123@gmail.com", "brandoncramer");
            client.Send(message);
        }

    }

}