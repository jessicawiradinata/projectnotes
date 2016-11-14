using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.View
{
    public partial class myProjects : System.Web.UI.Page
    {
        const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
        MySqlConnection conn = new MySqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("index.aspx");
            }

            conn.Open();
            String myUsername = (string)Session["name"];
            String userId = getUserId(myUsername);

            fillMyTable(myUsername);
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        private string getUserId(string myUsername)
        {
            MySqlConnection myConn = new MySqlConnection(connectionString);
            myConn.Open();
            String userId = "";
            String command = "select * from users where username='" + myUsername + "';";
            MySqlCommand selectCommand = new MySqlCommand(command, myConn);
            MySqlDataReader myReader;
            myReader = selectCommand.ExecuteReader();

            while (myReader.Read())
            {
                userId = myReader.GetString("userId");
            }
            myConn.Close();
            return userId;
        }

        private void fillMyTable(string username)
        {
            MySqlConnection myConn = new MySqlConnection(connectionString);
            myConn.Open();
            String myUsername = (string)Session["name"];
            String command = "select * from project where projectOwner='" + username + "';";
            MySqlCommand selectCommand = new MySqlCommand(command, myConn);
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter(selectCommand);
            adapter.Fill(table);
            projectList.DataSource = table;
            projectList.DataBind();
            myConn.Close();
        }
    }
}