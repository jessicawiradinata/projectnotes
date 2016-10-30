using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.View
{
    public partial class myprofile : System.Web.UI.Page
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
            String command = "select * from project_notes.users where username='" + myUsername + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = selectCommand.ExecuteReader();
            String myFirstName = "";
            String myLastName = "";
            String dob = "";
            String myEmail = "";
            while (myReader.Read())
            {
                myFirstName = myReader.GetString("firstName");
                myLastName = myReader.GetString("lastName");
                dob = myReader.GetString("dateOfBirth");
                myEmail = myReader.GetString("email");
            }
            firstName.Text = myFirstName;
            lastName.Text = myLastName;
            dateOfBirth.Text = dob;
            email.Text = myEmail;
            conn.Close();
            
        }

        protected void edit_click(object sender, EventArgs e)
        {
            String myUsername = (string)Session["name"];
            username.Text = myUsername;
            Session["editProfile"] = "edit profile";
            Response.Redirect("myprofile.aspx");
        }

        protected void save_click(object sender, EventArgs e)
        {
            String myUsername = (string)Session["name"];
            username.Text = myUsername;
            String usernameField = (string)Session["name"];
            String firstnameField = firstNameEdit.Text;
            String lastnameField = lastNameEdit.Text;
            String emailField = emailEdit.Text;
            String dobField = dobEdit.Text;
            
            Session["updatedMessage"] = "Account updated";
            String command = "update project_notes.users set firstName='" + firstnameField +
                "', lastName='" + lastnameField +
                "', email='" + emailField +
                "', dateOfBirth='" + dobField +
                "' where username='" + usernameField + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = selectCommand.ExecuteReader();
            conn.Close();
        }
    }
}