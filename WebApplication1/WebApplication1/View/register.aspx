<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.View.register" %>

<script runat="server">

    void Page_Load(Object sender, EventArgs e)
    {
        registerBtn.Click += new EventHandler(this.register_click);
    }

    void register_click(Object sender, EventArgs e)
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

</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <link href="../css/bootstrap.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
        <title></title>
    </head>
    <body>
        <div class="backgroundRegister">
            <div class="paddingRegister">
                <div class="titleRegister">
                    Registration
                </div>        
                <form id="form1" runat="server" >
                    <div class="contentRegister">
                        <asp:TextBox ID="username" runat="server" name="username" class="inputField" placeholder="Username"></asp:TextBox><br /><br />
                        <asp:TextBox ID="password" TextMode="Password" runat="server" name="password" class="inputField" placeholder="Password"></asp:TextBox><br /><br />
                        <asp:TextBox ID="confirmPassword" TextMode="Password" runat="server" name="confirmpassword" class="inputField" placeholder="Confirm password"></asp:TextBox><br /><br />
                        <asp:TextBox ID="email" runat="server" name="email" class="inputField" placeholder="Email"></asp:TextBox><br /><br />
                        <asp:TextBox ID="dateOfBirth" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth"></asp:TextBox><br /><br />
                        <asp:Button ID="registerBtn" runat="server" Text="Submit" OnClick="register_click" CssClass="btn btn-primary" />
                    </div>
                </form> 
            </div>
        </div>
    </body>
</html>