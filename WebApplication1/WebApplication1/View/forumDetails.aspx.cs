using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.View
{
    public partial class forumDetails : System.Web.UI.Page
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

            conn.Open();
            String myUsername = (string)Session["name"];
            String myForum = Request.QueryString["forumID"];
            String command = "select * from project_notes.community, project_notes.notes, project_notes.communityNotes, project_notes.users where community.forumId=@id and community.forumId=communityNotes.forumId and notesId=idnotes;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            selectCommand.Parameters.AddWithValue("@id", myForum);
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter(selectCommand);
            adapter.Fill(table);
            notesList.DataSource = table;
            notesList.DataBind();

            MySqlDataReader myReader;
            myReader = selectCommand.ExecuteReader();

            String myTitle = "";
            String myDescription = "";
            while (myReader.Read())
            {
                myTitle = myReader.GetString("forumTitle");
                myDescription = myReader.GetString("forumDescription");
            }
            this.Title.InnerText = myTitle;
            this.Description.InnerText = myDescription;
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void public_Click(object sender, EventArgs e)
        {
            Session.Contents.Remove("private");
            Response.Redirect("main.aspx");
        }

        protected void private_Click(object sender, EventArgs e)
        {
            Session["private"] = "private";
            Response.Redirect("main.aspx");
        }
    }
}