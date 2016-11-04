using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplication1.View
{
    public partial class myprofile : System.Web.UI.Page
    {
        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
        MySqlConnection conn = new MySqlConnection(connectionString);
        String imgLocation = "";
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
            String profPicture = "";
            while (myReader.Read())
            {
                myFirstName = myReader.GetString("firstName");
                myLastName = myReader.GetString("lastName");
                dob = myReader.GetString("dateOfBirth");
                myEmail = myReader.GetString("email");
                profPicture = myReader.GetString("profilePicture");
            }
            if (Session["editProfile"] == null)
            {
                firstName.Text = myFirstName;
                lastName.Text = myLastName;
                dateOfBirth.Text = dob;
                email.Text = (profPicture);
                profPic.ImageUrl = (profPicture);
            }
            else
            {
                usernameEdit.Text = myUsername;
                firstNameEdit.Text = myFirstName;
                lastNameEdit.Text = myLastName;
                dobEdit.Text = dob;
                emailEdit.Text = myEmail;
                imageProfile.ImageUrl = (profPicture);
            }
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
            String FileName = imageProfile.ImageUrl;
            if (uploadImg.PostedFile != null)
            {
                FileName = Path.GetFileName("images/" + uploadImg.FileName);
                //Save files to images folder
                try
                {
                    uploadImg.SaveAs(Server.MapPath(FileName));
                }
                catch(Exception en)
                {
                    FileName = imageProfile.ImageUrl;
                }           
            }
            Session["updatedMessage"] = "Your profile has been saved successfully";
            String command = "update project_notes.users set firstName='" + firstnameField +
                "', lastName='" + lastnameField +
                "', email='" + emailField +
                "', dateOfBirth='" + dobField +
                "', profilePicture='" + FileName +
                "' where username='" + usernameField + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReaders;
            conn.Open();
            myReaders = selectCommand.ExecuteReader();
            conn.Close();
            Response.Redirect("myprofile.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}