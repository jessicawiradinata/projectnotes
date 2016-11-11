<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myProjects.aspx.cs" Inherits="WebApplication1.View.myProjects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--link to css-->
    <link href="../css/bootstrap.css" rel="stylesheet"/>
    <link href="../css/style.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet"/>

    <!--link to javascript-->
    <script src="../scripts/jquery-1.9.1.js"></script>
    <script src="../scripts/bootstrap.js"></script>

    <title>My Projects</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="backgroundProfile">
            <div class="paddingBackgroundMain">
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
                    <div class="titleHeader">
                        My Projects
                    </div>
                    <div class="itemList" style="clear:both">
                        <asp:DataList ID="projectList" runat="server" CssClass="testTable" RepeatColumns="3" CellPadding="6" RepeatDirection="horizontal">
                            <ItemTemplate>
                                <div id="box1" class="itemBackground" style="margin-bottom: 16em; height: 36.7em;" runat="server">
                                    <a class="viewNote" href="noteDetails.aspx?NoteID=<%#Eval("projectId") %>">
                                        <div class="itemSquare">
                                            <div class="itemTitle"><%#Eval("projectName")%></div>
                                            <div class="itemContent"><%#Eval("projectDescription")%></div>
                                            <div class="itemCreator"><%#Eval("projectOwner")%></div>
                                        </div>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>   
        </div>
    </form>
</body>
</html>
