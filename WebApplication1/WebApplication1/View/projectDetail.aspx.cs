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
    public partial class projectDetail : System.Web.UI.Page
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

            String myProject = Request.QueryString["projectID"];
            String command = "select * from project where projectId='" + myProject + "';";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            int projectFound = Convert.ToInt32(selectCommand.ExecuteScalar());

            if(projectFound > 0)
            {
                myReader = selectCommand.ExecuteReader();
                String myTitle = "";
                String myOwner = "";
                String myDescription = "";
                while (myReader.Read())
                {
                    myTitle = myReader.GetString("projectName");
                    myOwner = myReader.GetString("projectOwner");
                    myDescription = myReader.GetString("projectDescription");

                    if (Session["name"].Equals(myOwner))
                    {
                        if (Session["editProject"] == null)
                        {
                            title.Text = myTitle;
                            owner.Text = myOwner;
                            description.Text = myDescription;
                        }
                        else
                        {
                            titleEdit.Text = myTitle;
                            ownerEdit.Text = myOwner;
                            descriptionEdit.Text = myDescription;
                        }
                    }
                    else
                    {
                        title1.Text = myTitle;
                        owner1.Text = myOwner;
                        description1.Text = myDescription;
                        Session["unauthorized"] = "Unauthorized user";
                    }
                }
                conn.Close();              
            }
            else
            {
                Response.Redirect("myProject.aspx");
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void edit_click(object sender, EventArgs e)
        {
            String projectId = Request.QueryString["projectID"];
            Session["editProject"] = "Edit Project";
            Response.Redirect("projectDetail.aspx?projectID=" + projectId);
        }

        protected void delete_click(object sender, EventArgs e)
        {
            String projectId = Request.QueryString["projectID"];

            String command = "delete from project where projectId='" + projectId + "';";
            MySqlCommand deleteCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = deleteCommand.ExecuteReader();
            conn.Close();

            Response.Redirect("myProject.aspx");
        }

        protected void save_click(object sender, EventArgs e)
        {
            String titleField = titleEdit.Text;
            String descriptionField = descriptionEdit.Text;
            String projectId = Request.QueryString["projectID"];

            String command = "update project set projectName='" + titleField + "',projectDescription='" + descriptionField + "' where projectId='" + projectId + "';";
            MySqlCommand updateCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = updateCommand.ExecuteReader();
            conn.Close();

            Session["updatedProject"] = "Project successfully updated";
            Response.Redirect("projectDetail.aspx?projectID=" + projectId);
        }
        protected void cancel_click(object sender, EventArgs e)
        {

        }
    }
}