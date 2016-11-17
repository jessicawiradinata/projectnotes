<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProjects.aspx.cs" Inherits="WebApplication1.View.addProjects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--link to css-->
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <link href="../css/style.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <!--link to javascript-->
        <script src="../scripts/jquery-1.9.1.js"></script>
        <script src="../scripts/bootstrap.js"></script>
    <title>Add Project</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="backgroundProfile">
            <div class="paddingProfile" style="padding-left:15%; padding-right:15%;">
                <div class="contentProfile">
                   <div class="navbar-header">
                        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                           <div class="navbar-header">
                                <a class="navbar-brand navbar-left brand" href="index.aspx">Project Notes</a>
                           </div>
                           <div class="nav navbar-nav navbar-right">
                                <li class="active">
                                    <a href="addNotes.aspx" style=" font-family: 'Droid Sans', sans-serif;" >
                                        <b>Add Notes</b>
                                    </a>
                                </li>
                                <li><a href="myprofile.aspx"  font-family: 'Droid Sans', sans-serif;">
                                        <b>My Profile</b>
                                    </a>
                                </li>
                                <li><a href="accountSettings.aspx"  style="margin-right:1em; font-family: 'Droid Sans', sans-serif;">
                                        <b>Account</b>
                                    </a>
                                </li>
                                <li>
                                    <asp:LinkButton runat="server" style="margin-right:1em;padding: 15px 15px" OnClick="logout_Click" CssClass="glyphicon glyphicon-log-out">
                                    </asp:LinkButton>
                                </li>
                            </div>
                         </nav>
                    </div>
                    <div class="titleHeader" style="padding-top:10%; font-size:3em;">
                        Create New Project
                    </div>
                    <div class="subHeader">
                        Add your projects in here.    
                    </div>
                    <hr class="regisLine" />
                    <asp:Label runat="server" CssClass="labelProfile" style="margin-right:45em;">Project Title</asp:Label><br />   <br /> 
                    <asp:TextBox ID="title" runat="server" name="title" class="inputField" style="width:51em" placeholder="Project Name" required="required" ></asp:TextBox><br /><br />
                    <asp:Label runat="server" CssClass="labelProfile" style="margin-right:43em; ">Project Creator</asp:Label><br />   <br />
                    <asp:TextBox ID="owner" runat="server" name="owner" class="inputField" style="width:51em" placeholder="Project Owner" required="required" disabled="disabled"></asp:TextBox><br /><br />
                    <asp:Label runat="server" CssClass="labelProfile" style="margin-right:41em;">Project Description</asp:Label><br />   <br />
                    <asp:TextBox ID="description" Height="15em" runat="server" TextMode="MultiLine" style="width:51em" name="description"  class="inputField" placeholder="Project Description"></asp:TextBox><br /><br />
                    <asp:Button ID ="createBtn" runat="server" name="createBtn" CssClass="submitBtn" Text="Create Project" style="width:51em" OnClick="create_Click" />
                    <% if (Session["projectFound"] != null) { %>
                        <div class="alert alert-danger" style="margin-top:10%">
                    <%  Response.Write(Session["projectFound"]);
                        Session.Contents.Remove("projectFound"); %>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
