using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.View
{
    public partial class addForum : System.Web.UI.Page
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
            String descriptionField = content.InnerText;
            String creatorField = creator.Text;
            DateTime today = DateTime.Today;
            String dateField = today.ToString("yyyy-MM-dd");

            const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("insert into community (forumTitle, forumDescription, forumCreator, forumDate) values ('" + titleField + "','" + descriptionField + "','" + creatorField + "','" + dateField + "')", conn);
            cmd.ExecuteNonQuery();
            cmd.Clone();
            Response.Redirect("addThread.aspx");
            
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}