<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myprofile.aspx.cs" Inherits="WebApplication1.View.myprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <!--link to css-->
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <link href="../css/style.css" rel="stylesheet"/>

        <!--link to javascript-->
        <script src="../scripts/jquery-1.9.1.js"></script>
        <script src="../scripts/bootstrap.js"></script>

        <title>My Profile</title>
    </head>
    <body>
        <div class="background">
            <div class="paddingProfile">
                <div class="contentProfile">
                    <div class="navbar-header">
                        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                            <div class="navbar-header">
                                <a class="navbar-brand navbar-left" href="#home">Home</a>
                            </div>
                            <div class="nav navbar-nav navbar-right">
                                <li><a href="addnotes.aspx" style=" font-family: 'Droid Sans', sans-serif;">
                                    <b>Add Notes</b>
                                </a></li>
                                <li><a href="myprofile.aspx"  font-family: 'Droid Sans', sans-serif;">
                                    <b>My Profile</b>
                                </a></li>
                                <li><a href="accountSettings.aspx"  style="margin-right:1em; font-family: 'Droid Sans', sans-serif;">
                                    <b>Account</b>
                                </a></li>
                            </div>
                        </nav>
                    </div>
                    <div class="titleHeader">
                        My Profile           
                    </div>
                    <div class="profilePicture">
                        <img src="../img/telor2.jpg" class="pp"/>
                    </div>
                    <div class="subHeader">
                        Welcome Kevin Tan, Your lover Cliff miss you.      
                    </div>
                    <form id="form1" runat="server" >
                        <asp:TextBox ID="username" runat="server" name="username" class="inputField" placeholder="Username" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:TextBox ID="firstName" runat="server" name="firstName" class="inputField" placeholder="First Name" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:TextBox ID="lastName" runat="server" name="lastName" class="inputField" placeholder="Last Name" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:TextBox ID="email" runat="server" type="email" name="email" class="inputField" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:TextBox ID="dateOfBirth" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth" required="required" disabled="disabled"></asp:TextBox><br /><br />
                    </form>
                    <a href="#" class="btn btn-success">Edit Profile</a>
                    <a href="#" class="btn btn-primary">Change Password</a>
                </div>
            </div>
     </div>
    </body>
</html>
