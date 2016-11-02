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
    public partial class noteDetails : System.Web.UI.Page
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

            String myNote = Request.QueryString["noteID"];
            String command = "select * from project_notes.notes where idnotes='" + myNote + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = selectCommand.ExecuteReader();
            String myTitle = "";
            String myAuthor = "";
            String myDate = "";
            String myContent = "";
            while (myReader.Read())
            {
                myTitle = myReader.GetString("titleNotes");
                myAuthor = myReader.GetString("creatorNotes");
                myDate = myReader.GetString("dateNotes");
                myContent = myReader.GetString("descriptionNotes");
            }

            if (Session["editNotes"] == null)
            {
                title.Text = myTitle;
                author.Text = myAuthor;
                date.Text = myDate;
                content.Text = myContent;
            }
            else
            {
                titleEdit.Text = myTitle;
                authorEdit.Text = myAuthor;
                dateEdit.Text = myDate;
                content.Text = myContent;
            }
            conn.Close();
        }

        protected void edit_click(object sender, EventArgs e)
        {
            Session["editNotes"] = "Edit Notes";
            Response.Redirect("noteDetails.aspx");
        }

        protected void delete_click(object sender, EventArgs e)
        {

        }

        protected void save_click(object sender, EventArgs e)
        {
            String contentField = contentEdit.Text;
            String noteId = Request.QueryString["noteID"];

            String command = "update project_notes.notes set descriptionNotes='" + contentField + "' where idnotes='" + noteId + "' ;";
            MySqlCommand updateCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = updateCommand.ExecuteReader();
            conn.Close();

            Session["updatedNotes"] = "Notes successfully updated";
            
        }

        protected void cancel_click(object sender, EventArgs e)
        {

        }
    }
}