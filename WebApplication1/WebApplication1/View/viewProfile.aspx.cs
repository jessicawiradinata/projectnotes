using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.View
{
    public partial class viewProfile : System.Web.UI.Page
    {
        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
        MySqlConnection conn = new MySqlConnection(connectionString);

        public NameValueCollection QueryString { get; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("index.aspx");
            }

            String theUsername = Request.QueryString["profile"];
            String myUsername = (String)Session["name"];

            if (theUsername.Equals(myUsername))
            {
                Response.Redirect("myprofile.aspx");
            }

            username.Text = theUsername;
            String command = "select * from project_notes.users where username='" + theUsername + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = selectCommand.ExecuteReader();
            String myFirstName = "";
            String myLastName = "";
            String dob = "";
            String myEmail = "";
            String profPicture = "";
            String myFullName = "";
            while (myReader.Read())
            {
                myFirstName = myReader.GetString("firstName");
                myLastName = myReader.GetString("lastName");
                dob = myReader.GetString("dateOfBirth");
                myEmail = myReader.GetString("email");
                profPicture = myReader.GetString("profilePicture");
                myFullName = myReader.GetString("firstName") + " " + myReader.GetString("lastName");
            }
            firstName.Text = myFirstName;
            lastName.Text = myLastName;
            dateOfBirth.Text = dob;
            email.Text = myEmail;
            profPic.ImageUrl = (profPicture);
            fullName.Text = myFullName;
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}