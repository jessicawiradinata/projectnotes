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
            <div class="paddingBackgroundMain" style="padding-left:20%;padding-right:20%;">
                <div class="contentProfile">
                    <div class="navbar-header">
                        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                            <div class="navbar-header">
                                <a class="navbar-brand navbar-left brand" href="main.aspx">Project Notes</a>
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
                    <div class="titleHeader" style="padding-bottom: 0.5em; padding-top:10%; font-size:3.5em;">
                            Community
                        </div>
                    <div>
                        <p class="subHeader">Add your own forum and exchange your idea.</p>
                   </div>
                    <hr class="regisLine" />
                    <a href="addForum.aspx" style="font-family: 'Droid Sans', sans-serif; float:left; margin-left:3em; margin-bottom:3em; " class="btn btn-primary">Add new Thread</a>      
                    <hr style="clear:both; border-top-color: #d4d4d4;margin-bottom:1em;"/>
                    <p style="float:left;padding-left:9em;font-weight:bolder;">Category</p>                    
                    <p style="float:right; padding-right:13em; font-weight:bolder;">Last Post</p>
                    <p style="float:right; padding-right:15em; font-weight:bolder;">Stats</p>
                    <div >
                        <div style="width: 100%;">
                            <asp:DataList ID="notesList" runat="server" CellPadding="6" RepeatDirection="vertical" Style="width:100%">
                                <ItemTemplate>
                                        <div id="box1" class="boxForum" style="text-align:left; padding-top: 0.3em; padding-bottom:0.3em;
                                             border-bottom:solid 0.5px #d4d4d4;border-top:solid 0.5px #d4d4d4;" 
                                             runat="server" onclick="detail_Click">
                                            <a class="viewNote" style="color:#343434; background-color:#FFF" href="forumDetails.aspx?ForumID=<%#Eval("forumId") %>">
                                                <img src="../img/test.png" style="width:4em;height:4em; float:left; margin-left:1.3em; margin-top:0.7em;" />
                                                <h3 style="font-size:1.2em; font-weight:bold; margin-bottom:0em; margin-left:5.3em;"><%#Eval("forumTitle") %></h3>
                                                <h3 style="font-size:0.8em; font-weight:normal; margin-left:7.9em;"><%#Eval("forumDescription") %></h3>
                                                <div style="clear:both;"></div>
                                            </a>
                                        </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    <p style="float:right; margin-right:8em; margin-top:1.5em;">Page 1 of 5 &nbsp&nbsp 1 &nbsp 2 &nbsp 3 &nbsp 4 &nbsp 5 &nbsp&nbsp > &nbsp&nbsp>></p>
                    <hr style="clear:both; border-top-color: #d4d4d4;margin-bottom:1em;"/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
