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
                                <a class="navbar-brand navbar-left" href="index.aspx">Project Notes</a>
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
                        <asp:TextBox ID="email" runat="server" name="email" type="email" class="inputField" placeholder="Email" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:TextBox ID="dateOfBirth" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:Button ID="editBtn" runat="server" Text="Edit Profile" class="btn btn-success" OnClick="edit_click" />
                        <%  if (Session["updatedMessage"] != null) { %>
                            <div class="alert alert-info" style="margin-top:1em;">
                        <%  Response.Write(Session["updatedMessage"]);
                            Session.Contents.Remove("updatedMessage"); %>
                            </div>
                        <% } %>
                    </form>
                    <% } else { %>
                    <form id="form2" runat="server" >
                        <asp:TextBox ID="usernameEdit" runat="server" name="username" class="inputField" placeholder="Username" required="required" disabled="disabled" ></asp:TextBox><br /><br />
                        <asp:TextBox ID="firstNameEdit" runat="server" name="firstName" class="inputField" placeholder="First Name" required="required"></asp:TextBox><br /><br />
                        <asp:TextBox ID="lastNameEdit" runat="server" name="lastName" class="inputField" placeholder="Last Name" required="required"></asp:TextBox><br /><br />
                        <asp:TextBox ID="emailEdit" runat="server" name="email" type="email" class="inputField" placeholder="Email" required="required"></asp:TextBox><br /><br />
                        <asp:TextBox ID="dobEdit" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth" required="required"></asp:TextBox><br /><br />
                        <asp:Button ID="saveBtn" runat="server" Text="Save changes" class="btn btn-primary" OnClick="save_click" href="myprofile.aspx"/>
                        <a runat="server" value="Cancel" href="main.aspx" class="btn btn-danger form-horizontal form-group" style="margin-left:10px">Cancel</a>
                    </form>
                    <% 
                        Session.Contents.Remove("editProfile");
                        }
                    %>
                </div>
            </div>
     </div>
    </body>
</html>
