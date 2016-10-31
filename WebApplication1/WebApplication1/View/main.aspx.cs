﻿using MySql.Data.MySqlClient;
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
            String command = "select * from project_notes.notes where creatorNotes='" + myUsername + "' ;";
            MySqlCommand selectCommand = new MySqlCommand(command, conn);
            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter(selectCommand);
            adapter.Fill(table);
            notesList.DataSource = table;
            notesList.DataBind();
            conn.Close();
        }
    }
}