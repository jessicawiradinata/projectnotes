<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accountSettings.aspx.cs" Inherits="WebApplication1.View.accountSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/bootstrap.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <div class="backgroundAccount">
        <div class="paddingAccount">
            <form id="form1" runat="server">
                <div class="contentAccount">
                    <div class="navbar-header">
                        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                            <div class="navbar-header">
                                <a class="navbar-brand navbar-left brand" href="index.aspx">Project Notes</a>
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
                                <li>
                                    <asp:LinkButton runat="server" style="margin-right:1em;padding: 15px 15px" OnClick="logout_Click" CssClass="glyphicon glyphicon-log-out">
                                    </asp:LinkButton>
                                </li>
                            </div>
                        </nav>
                    </div>
                    <div class="titleAccount">
                        My Account
                    </div>
                    <label for="username" class="accountLabel">Username:</label>
                    <asp:TextBox ID="username" runat="server" name="username" class="inputField" disabled="disabled"></asp:TextBox><br /><br />
                    <label for="currentPassword" class="accountLabel">Current password:</label>
                    <asp:TextBox ID="currentPassword" TextMode="Password" runat="server" name="currentPassword" class="inputField" required="required"></asp:TextBox><br /><br />
                    <label for="newPassword" class="accountLabel">New password:</label>
                    <asp:TextBox ID="newPassword" TextMode="Password" runat="server" name="newPassword" class="inputField" required="required"></asp:TextBox><br /><br />
                    <label for="confirmPassword" class="accountLabel">Confirm new password:</label>
                    <asp:TextBox ID="confirmPassword" TextMode="Password" runat="server" name="confirmPassword" class="inputField" required="required"></asp:TextBox><br /><br />
                    <div class="buttonsAccount">
                        <asp:Button ID="saveBtn" runat="server" Text="Save Changes" OnClick="save_click" CssClass="submitBtn" />
                    </div>
                    <%  if (Session["updatedMessage"] != null) { %>
                            <div class="alert alert-success">
                        <%  Response.Write(Session["updatedMessage"]);
                            Session.Contents.Remove("updatedMessage"); %>
                            </div>
                        <% } else if (Session["confirmPasswordMessage"] != null) { %>  
                            <div class="alert alert-danger">
                        <%  Response.Write(Session["confirmPasswordMessage"]);
                            Session.Contents.Remove("confirmPasswordMessage"); %>
                            </div>
                        <% } else if (Session["validPasswordMessage"] != null) { %>  
                                <div class="alert alert-danger">
                            <%  Response.Write(Session["validPasswordMessage"]);
                                Session.Contents.Remove("validPasswordMessage"); %>
                                </div>
                        <% } %>
                </div>
            </form>    
        </div>
    </div>
</body>
</html>
