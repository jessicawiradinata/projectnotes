﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myprofile.aspx.cs" Inherits="WebApplication1.View.myprofile" %>

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
                    <%if (Session["editProfile"] == null) { %>
                    <form id="form1" runat="server" >
                        <asp:TextBox ID="username" runat="server" name="username" class="inputField" placeholder="Username" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:TextBox ID="firstName" runat="server" name="firstName" class="inputField" placeholder="First Name" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:TextBox ID="lastName" runat="server" name="lastName" class="inputField" placeholder="Last Name" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:TextBox ID="email" runat="server" name="email" class="inputField" placeholder="Email" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:TextBox ID="dateOfBirth" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:Button ID="editBtn" runat="server" Text="Edit Profile" class="btn btn-success" OnClick="edit_click" />
                    </form>
                    <% } else { %>
                    <form id="form2" runat="server" >
                        <asp:TextBox ID="TextBox1" runat="server" name="username" class="inputField" placeholder="Username" required="required" ></asp:TextBox><br /><br />
                        <asp:TextBox ID="TextBox2" runat="server" name="firstName" class="inputField" placeholder="First Name" required="required"></asp:TextBox><br /><br />
                        <asp:TextBox ID="TextBox3" runat="server" name="lastName" class="inputField" placeholder="Last Name" required="required"></asp:TextBox><br /><br />
                        <asp:TextBox ID="TextBox4" runat="server" name="email" class="inputField" placeholder="Email" required="required"></asp:TextBox><br /><br />
                        <asp:TextBox ID="TextBox5" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth" required="required"></asp:TextBox><br /><br />
                        <asp:Button ID="saveBtn" runat="server" Text="Save changes" class="btn btn-primary" OnClick="edit_click" />
                    </form>
                    <% } %>
                </div>
            </div>
     </div>
    </body>
</html>
