using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.View
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_click(object sender, EventArgs e)
        {
            String usernameField = username.Text;
            String passwordField = password.Text;
            String confirmField = confirmPassword.Text;
            String emailField = email.Text;
            String dobField = dateOfBirth.Text;
            Response.Write(usernameField);
            Response.Write(passwordField);
            Response.Write(confirmField);
            Response.Write(emailField);
            Response.Write(dobField);
        }
    }
}