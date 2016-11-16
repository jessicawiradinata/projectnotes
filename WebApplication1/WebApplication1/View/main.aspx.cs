using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
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
            String myUsername = (string)Session["name"];
            if (Session["name"] == null)
            {
                Response.Redirect("index.aspx");
            }

            populateDropdownList(categoryList);
            populateDropdownList(categoryList2);

            String filter = Request.QueryString["filter"];

            if (filter == null)
            {
                conn.Open();
                String command = "select * from project_notes.notes, project_notes.users where creatorNotes=username and visibility='public';";
                MySqlCommand selectCommand = new MySqlCommand(command, conn);
                DataTable table = new DataTable();
                MySqlDataAdapter adapter = new MySqlDataAdapter(selectCommand);
                adapter.Fill(table);
                notesList.DataSource = table;
                notesList.DataBind();

                command = "select * from project_notes.notes, project_notes.users where creatorNotes='" + myUsername + "' and username='" + myUsername + "';";
                selectCommand = new MySqlCommand(command, conn);
                table = new DataTable();
                adapter = new MySqlDataAdapter(selectCommand);
                adapter.Fill(table);
                privateList.DataSource = table;
                privateList.DataBind();
                conn.Close();

                Boolean privateNotesFound = findPrivateNotes(myUsername);
                Boolean publicNotesFound = findPublicNotes();

                if(!privateNotesFound)
                {
                    Session["noPrivateNotes"] = "No private notes";
                }
                if(!publicNotesFound)
                {
                    Session["noPublicNotes"] = "No public notes";
                }
            }
            else
            {
                conn.Open();
                String command = "select * from project_notes.notes, project_notes.users where creatorNotes=username and visibility='public' and category='" + filter + "' ;";
                MySqlCommand selectCommand = new MySqlCommand(command, conn);
                DataTable table = new DataTable();
                MySqlDataAdapter adapter = new MySqlDataAdapter(selectCommand);
                adapter.Fill(table);
                notesList.DataSource = table;
                notesList.DataBind();

                command = "select * from project_notes.notes, project_notes.users where creatorNotes='" + myUsername + "' and username='" + myUsername + "' and visibility='private' and category='" + filter + "' ;";
                selectCommand = new MySqlCommand(command, conn);
                table = new DataTable();
                adapter = new MySqlDataAdapter(selectCommand);
                adapter.Fill(table);
                privateList.DataSource = table;
                privateList.DataBind();
                conn.Close();
            }
            
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

        protected void filter_Click(object sender, EventArgs e)
        {
            if(Session["private"] == null)
            {
                String categoryField = categoryList.SelectedItem.Text;
                Response.Redirect("main.aspx?filter=" + categoryField);
            }
            else
            {
                String categoryField = categoryList2.SelectedItem.Text;
                Response.Redirect("main.aspx?filter=" + categoryField);
            }
        }

        protected void populateDropdownList(DropDownList list)
        {
            if (!IsPostBack)
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

                list.Items.Add(selectItem);
                list.Items.Add(animalsItem);
                list.Items.Add(educationItem);
                list.Items.Add(entertainmentItem);
                list.Items.Add(gamingItem);
                list.Items.Add(howtoItem);
                list.Items.Add(newsItem);
                list.Items.Add(peopleItem);
                list.Items.Add(personalItem);
                list.Items.Add(scienceItem);
                list.Items.Add(technologyItem);
                list.Items.Add(sportsItem);
                list.Items.Add(travelItem);
            }
        }

        protected void search_Click(object sender, EventArgs e)
        {
            conn.Open();
            String usernameField = SearchText.Text;
            String command = "select * from project_notes.notes where creatorNotes like @Username and visibility='public';";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            selectCommand.Parameters.AddWithValue("@Username", "%" + usernameField + "%");
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter(selectCommand);
            adapter.Fill(table);
            notesList.DataSource = table;
            notesList.DataBind(); 
        }

        protected Boolean findPublicNotes()
        {
            MySqlConnection conn2 = new MySqlConnection(connectionString);
            String command = "select * from project_notes.notes where visibility='public';";
            MySqlCommand selectCommand = new MySqlCommand(command, conn2);
            MySqlDataReader myReader;
            conn2.Open();
            myReader = selectCommand.ExecuteReader();

            int count = 0;
            while(myReader.Read())
            {
                count = count + 1;
            }
            if(count == 0)
            {
                return false;
            }
            conn2.Close();
            return true;
        }

        protected Boolean findPrivateNotes(string theUsername)
        {
            MySqlConnection conn3 = new MySqlConnection(connectionString);
            String command = "select * from project_notes.notes where creatorNotes='" + theUsername + "';";
            MySqlCommand selectCommand = new MySqlCommand(command, conn3);
            MySqlDataReader myReader;
            conn3.Open();
            myReader = selectCommand.ExecuteReader();

            int count = 0;
            while(myReader.Read())
            {
                count = count + 1;
            }
            if(count == 0)
            {
                return false;
            }
            conn3.Close();
            return true;
        }
    }
}