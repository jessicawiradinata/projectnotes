﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.View
{
    public partial class myprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edit_click(object sender, EventArgs e)
        {
            Session["editProfile"] = "edit profile";
            Response.Redirect("myprofile.aspx");
        }
    }
}