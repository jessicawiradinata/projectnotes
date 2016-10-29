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
            while (myReader.Read())
            {
                myFirstName = myReader.GetString("firstName");
                myLastName = myReader.GetString("lastName");
                dob = myReader.GetString("dateOfBirth");
            }
            firstName.Text = myFirstName;
            lastName.Text = myLastName;
            dateOfBirth.Text = dob;
            
        }

        protected void edit_click(object sender, EventArgs e)
        {
            Session["editProfile"] = "edit profile";
            Response.Redirect("myprofile.aspx");
        }
    }
}