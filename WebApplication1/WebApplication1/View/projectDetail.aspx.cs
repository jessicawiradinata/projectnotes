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
                }
                title.Text = myTitle;
                owner.Text = myOwner;
                description.Text = myDescription;
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
    }
}