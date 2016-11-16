<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myProject.aspx.cs" Inherits="WebApplication1.View.myProject" %>

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
                <div class="contentProfile" style="min-height:78em;">
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
                    <div class="titleHeader" style="padding-top:10%; font-size:3.5em;">
                        My Projects
                    </div>
                    <hr class="regisLine" style="margin-bottom:0px; height:2px" />
                    <div class="navProfile">
                        <ul class="navbar navbar-default nav-pills nav-stacked" style="text-decoration:none;left;width:15%; color:#000; list-style-type: none; padding-left:0em; border-radius:0px; background:#F9F9F9; position:absolute;">
                            <li class="linkProject" style="padding-top:2.2em;"></li>
                            <a href="addProjects.aspx" style="color:#000"><li class="linkProject">New Project</li></a>
                            <a href="#" style="color:#000"><li class="linkProject">Shared Project</li></a>
                            <a href="#" style="color:#000"><li class="linkProject">Starred Project</li></a>
                            <a href="#" style="color:#000"><li class="linkProject">Trash</li></a>
                            <li class="linkProject" style="padding-bottom:39em;"></li>
                        </ul>
                    </div>
                    <div class="itemList" style="clear:both; margin-left:22.5em; margin-top:3.8em;">
                        <asp:DataList ID="projectList" runat="server" CssClass="testTable" RepeatColumns="3" CellPadding="6" RepeatDirection="horizontal">
                            <ItemTemplate>
                                <div id="box1" class="itemBackground" style="margin-bottom: 7.5em; height: 20.8em; width:18em;" runat="server">
                                    <a class="viewNote" href="projectDetail.aspx?projectID=<%#Eval("projectId") %>">
                                        <div class="itemSquare">
                                            <div class="itemContent" style="background:url('../img/project.png'); background-size:100% 100%; min-height:18em;"></div>
                                            <div class="itemTitle"><%#Eval("projectName")%></div>
                                            <div class="itemCreator" style="min-height:3em;">
                                                <%#Eval("projectOwner")%>
                                            </div>
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
