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
    public partial class main : System.Web.UI.Page
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
            String command = "select * from project_notes.notes where creatorNotes='" + myUsername + "' and visibility='public';";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter(selectCommand);
            adapter.Fill(table);
            notesList.DataSource = table;
            notesList.DataBind();

            command = "select * from project_notes.notes where creatorNotes='" + myUsername + "' and visibility='private';";
            selectCommand = new MySqlCommand(command, conn);
            table = new DataTable();
            adapter = new MySqlDataAdapter(selectCommand);
            adapter.Fill(table);
            privateList.DataSource = table;
            privateList.DataBind();
            conn.Close();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void detail_Click(object sender, EventArgs e)
        {

        }
    }
}