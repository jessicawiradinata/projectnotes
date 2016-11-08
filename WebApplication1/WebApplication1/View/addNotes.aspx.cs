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
            String descriptionField = content.InnerText;
            String creatorField = creator.Text;
            DateTime today = DateTime.Today;
            String dateField = today.ToString("yyyy-MM-dd");
            String categoryField = categoryList.SelectedItem.Text;
            String visibilityField = visibilityList.SelectedItem.Text;

            if(categoryField.Equals("Select Category"))
            {
                Session["categoryField"] = "Please select a category";
            }
            else if(visibilityField.Equals("Select Visibility"))
            {
                Session["visibilityField"] = "Please select a visibility setting";
            }
            else
            {
                const String connectionString = "server=PUSSY;database=project_notes;uid=root;pwd=projectnotes;";
                MySqlConnection conn = new MySqlConnection(connectionString);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("insert into notes (titleNotes, descriptionNotes, creatorNotes, dateNotes, category, visibility) values ('" + titleField + "','" + descriptionField + "','" + creatorField + "','" + dateField + "','" + categoryField + "','" + visibilityField + "')", conn);
                cmd.ExecuteNonQuery();
                cmd.Clone();
                Response.Redirect("main.aspx");
            }           
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void populateCategoryList()
        {
            if(!IsPostBack)
            {
                ListItem selectItem = new ListItem("Select Category");
                ListItem animalsItem = new ListItem("Animals");
                ListItem educationItem = new ListItem("Education");
                ListItem entertainmentItem = new ListItem("Entertainment");
                ListItem gamingItem = new ListItem("Gaming");
                ListItem howtoItem = new ListItem("Howto");
                ListItem newsItem = new ListItem("News");
                ListItem peopleItem = new ListItem("People");
                ListItem personalItem = new ListItem("Personal");
                ListItem scienceItem = new ListItem("Science");
                ListItem technologyItem = new ListItem("Technology");
                ListItem sportsItem = new ListItem("Sports");
                ListItem travelItem = new ListItem("Travel");

                categoryList.Items.Add(selectItem);
                categoryList.Items.Add(animalsItem);
                categoryList.Items.Add(educationItem);
                categoryList.Items.Add(entertainmentItem);
                categoryList.Items.Add(gamingItem);
                categoryList.Items.Add(howtoItem);
                categoryList.Items.Add(newsItem);
                categoryList.Items.Add(peopleItem);
                categoryList.Items.Add(personalItem);
                categoryList.Items.Add(scienceItem);
                categoryList.Items.Add(technologyItem);
                categoryList.Items.Add(sportsItem);
                categoryList.Items.Add(travelItem);
            }
        }

        protected void populateVisibilityList()
        {
            if(!IsPostBack)
            {
                ListItem selectItem = new ListItem("Select Visibility");
                ListItem privateItem = new ListItem("Private");
                ListItem publicItem = new ListItem("Public");

                visibilityList.Items.Add(selectItem);
                visibilityList.Items.Add(privateItem);
                visibilityList.Items.Add(publicItem);
            }
        }
    }
}