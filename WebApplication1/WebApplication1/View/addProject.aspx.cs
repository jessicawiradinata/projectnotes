using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.View
{
    public partial class addProject : System.Web.UI.Page
    {
        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("index.aspx");
            }
            String myUsername = (string)Session["name"];
            owner.Text = myUsername;
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void create_Click(object sender, EventArgs e)
        {
            String myUsername = (string)Session["name"];
            String titleField = title.Text;
            String ownerField = owner.Text;
            String descriptionField = description.Text;
            Boolean projectFound = findProject(titleField, myUsername);

            if(projectFound)
            {
                Session["projectFound"] = "Project already exists";
            }
            else
            {
                //Create new project in database
                MySqlConnection conn = new MySqlConnection(connectionString);
                conn.Open();
                String command = "insert into project (projectName, projectOwner, projectDescription) values('" + titleField + "','" + ownerField + "','" + descriptionField + "');";
                MySqlCommand insertCommand = new MySqlCommand(command, conn);
                insertCommand.ExecuteNonQuery();
                insertCommand.Clone();
                conn.Close();

                //Get project ID from newly created project
                conn.Open();
                String projectId = "";               
                command = "select * from project where projectName='" + titleField + "' and projectOwner='" + myUsername + "';";
                MySqlCommand selectCommand = new MySqlCommand(command, conn);
                MySqlDataReader myReader;
                myReader = selectCommand.ExecuteReader();

                while (myReader.Read())
                {
                    projectId = myReader.GetString("projectId");
                }
                conn.Close();

                //Get user ID
                conn.Open();
                String userId = "";
                command = "select * from users where username='" + myUsername + "';";
                selectCommand = new MySqlCommand(command, conn);
                myReader = selectCommand.ExecuteReader();

                while (myReader.Read())
                {
                    userId = myReader.GetString("userId");
                }
                conn.Close();

                //Create new project_user in database
                conn.Open();
                command = "insert into project_user (projectId, userId) values ('" + projectId + "','" + userId + "');";
                insertCommand = new MySqlCommand(command, conn);
                insertCommand.ExecuteNonQuery();
                insertCommand.Clone();

                conn.Close();

                Response.Redirect("main.aspx");
            }          
        }

        private Boolean findProject(string theProjectName, string theUsername)
        {
            MySqlConnection conn2 = new MySqlConnection(connectionString);
            String command = "select * from project where projectName='" + theProjectName + "' and projectOwner='" + theUsername + "';";
            MySqlCommand selectCommand = new MySqlCommand(command, conn2);
            MySqlDataReader myReader;
            conn2.Open();
            myReader = selectCommand.ExecuteReader();

            int count = 0;
            while (myReader.Read())
            {
                count = count + 1;
            }
            if (count == 0 && string.IsNullOrEmpty(theProjectName) == false && string.IsNullOrEmpty(theUsername) == false)
            {
                return false;
            }
            conn2.Close();
            return true;
        }
    }
}