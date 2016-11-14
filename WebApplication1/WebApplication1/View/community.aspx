<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="community.aspx.cs" Inherits="WebApplication1.View.community" %>

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

    <title>Community</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="backgroundProfile">
            <div class="paddingBackgroundMain">
                <div class="contentProfile">
                    <div class="navbar-header">
                        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                            <div class="navbar-header">
                                <a class="navbar-brand navbar-left brand" href="main.aspx">Project Notes</a>
                            </div>
                            <div class="nav navbar-nav justified">
                                <li><asp:LinkButton runat="server" style="font-family: 'Droid Sans', sans-serif;" OnClick="public_Click">
                                    <b>Public</b>
                                    </asp:LinkButton>
                                </li>
                                <li><asp:LinkButton runat="server" style="font-family: 'Droid Sans', sans-serif;" OnClick="private_Click">
                                    <b>My Notes</b>
                                    </asp:LinkButton>
                                </li>
                            </div>
                            <div class="nav navbar-nav navbar-right">
                                <li><a href="addnotes.aspx" style=" font-family: 'Droid Sans', sans-serif;">
                                    <b>Add Notes</b>
                                </a></li>
                                <li><a href="myprofile.aspx"  font-family: 'Droid Sans', sans-serif;">
                                    <b>My Profile</b>
                                </a></li>
                                <li><a href="accountSettings.aspx"  style="font-family: 'Droid Sans', sans-serif;">
                                    <b>Account</b>
                                </a></li>
                                <li>
                                    <asp:LinkButton runat="server" style="margin-right:1em;padding: 15px 15px" OnClick="logout_Click" CssClass="glyphicon glyphicon-log-out">
                                    </asp:LinkButton>
                                </li>
                            </div>
                        </nav>
                    </div>
                    <div class="titleHeader" style="padding-bottom: 1.1em; border-bottom:solid 2px;">
                            Community           
                    </div>
                    <div>
                        <div style="width: 100%;">
                            <asp:DataList ID="notesList" runat="server" CellPadding="6" RepeatDirection="vertical" Style="width:100%">
                                <ItemTemplate>
                                        <div id="box1" style="text-align:left; width: 100%; margin:0px; padding-left:30px; padding-top: 0px;
                                             border-bottom:solid 2px; border-left-width: 0px; border-right-width: 0px;" 
                                             runat="server" onclick="detail_Click">
                                            <a class="viewNote" href="forumDetails.aspx?ForumID=<%#Eval("forumId") %>">
                                                <h3><b><%#Eval("forumTitle") %></b></h3>
                                                <p><%#Eval("forumDescription") %></p>
                                            </a>
                                        </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
