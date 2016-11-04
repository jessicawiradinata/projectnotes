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
            populateCategoryList();
            populateVisibilityList();
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            String titleField = title.Text;
            String descriptionField = description.Text;
            String creatorField = creator.Text;
            DateTime today = DateTime.Today;
            String dateField = today.ToString("yyyy-MM-dd");
            String categoryField = categoryList.SelectedItem.Text;
            String visibilityField = visibilityList.SelectedItem.Text;
            const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
            MySqlConnection conn = new MySqlConnection(connectionString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("insert into notes (titleNotes, descriptionNotes, creatorNotes, dateNotes, category, visibility) values ('" + titleField + "','" + descriptionField + "','" + creatorField + "','" + dateField + "','" + categoryField + "','" + visibilityField + "')", conn);
            cmd.ExecuteNonQuery();
            cmd.Clone();
            Response.Redirect("main.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void populateCategoryList()
        {
            if (!IsPostBack)
            {
                ListItem educationItem = new ListItem("Education");
                ListItem entertainmentItem = new ListItem("Entertainment");
                ListItem gamingItem = new ListItem("Gaming");
                ListItem howtoItem = new ListItem("Howto & Style");
                ListItem newsItem = new ListItem("News & Politics");
                ListItem peopleItem = new ListItem("People & Blogs");
                ListItem personalItem = new ListItem("Personal");
                ListItem petsItem = new ListItem("Pets & Animals");
                ListItem scienceItem = new ListItem("Science & Technology");
                ListItem sportsItem = new ListItem("Sports");
                ListItem travelItem = new ListItem("Travel & Events");

                categoryList.Items.Add(educationItem);
                categoryList.Items.Add(entertainmentItem);
                categoryList.Items.Add(gamingItem);
                categoryList.Items.Add(howtoItem);
                categoryList.Items.Add(newsItem);
                categoryList.Items.Add(peopleItem);
                categoryList.Items.Add(personalItem);
                categoryList.Items.Add(petsItem);
                categoryList.Items.Add(scienceItem);
                categoryList.Items.Add(sportsItem);
                categoryList.Items.Add(travelItem);
            }
        }

        protected void populateVisibilityList()
        {
            ListItem privateItem = new ListItem("Private");
            ListItem publicItem = new ListItem("Public");

            visibilityList.Items.Add(privateItem);
            visibilityList.Items.Add(publicItem);
        }
    }
}