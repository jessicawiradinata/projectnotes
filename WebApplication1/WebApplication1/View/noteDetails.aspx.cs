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
            String command = "select * from project_notes.notes where idnotes=@id;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            selectCommand.Parameters.AddWithValue("@id", myNote);
            MySqlDataReader myReader;
            conn.Open();
            int noteExist = Convert.ToInt32(selectCommand.ExecuteScalar());

            if (noteExist > 0)
            {
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
                    if (Session["name"].Equals(myAuthor))
                    {
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
                            textarea1.InnerText = myContent;
                        }
                    }
                    else
                    {
                        title1.Text = myTitle;
                        author1.Text = myAuthor;
                        date1.Text = myDate;
                        content1.Text = myContent;
                        Session["restrictedUser"] = "restricted";
                    }
                
                conn.Close();
            }
            else
            {
                Response.Redirect("main.aspx");
            }
        }

        protected void edit_click(object sender, EventArgs e)
        {
            String noteId = Request.QueryString["noteID"];
            Session["editNotes"] = "Edit Notes";
            Response.Redirect("noteDetails.aspx?noteID=" + noteId);
        }

        protected void delete_click(object sender, EventArgs e)
        {
            String noteId = Request.QueryString["noteID"];
            String command = "delete from project_notes.notes where idnotes='" + noteId + "' ;";
            MySqlCommand deleteCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = deleteCommand.ExecuteReader();
            conn.Close();

            Response.Redirect("main.aspx");
        }

        protected void save_click(object sender, EventArgs e)
        {
            String titleField = titleEdit.Text;
            String contentField = textarea1.InnerText;
            String noteId = Request.QueryString["noteID"];

            String command = "update project_notes.notes set titleNotes='" + titleField + "',descriptionNotes='" + contentField + "' where idnotes='" + noteId + "' ;";
            MySqlCommand updateCommand = new MySqlCommand(command, conn);
            MySqlDataReader myReader;
            conn.Open();
            myReader = updateCommand.ExecuteReader();
            conn.Close();

            Session["updatedNotes"] = "Notes successfully updated";
            Response.Redirect("noteDetails.aspx?noteID=" + noteId);
        }

        protected void cancel_click(object sender, EventArgs e)
        {

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}