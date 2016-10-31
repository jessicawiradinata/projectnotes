using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.View
{
    public partial class addNotes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("index.aspx");
            }
            String myUsername = (string)Session["name"];
            creator.Text = myUsername;
            DateTime today = DateTime.Today;
            String dateField = today.ToString("yyyy-MM-dd");
            dates.Text = dateField;
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            String titleField = title.Text;
            String descriptionField = description.Text;
            String creatorField = creator.Text;
            DateTime today = DateTime.Today;
            String dateField = today.ToString("yyyy-MM-dd");
            const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("insert into notes (titleNotes, descriptionNotes, creatorNotes, dateNotes) values ('" + titleField + "','" + descriptionField + "','" + creatorField + "','" + dateField + "')", conn);
            cmd.ExecuteNonQuery();
            cmd.Clone();
            Response.Redirect("main.aspx");
        }
    }
}