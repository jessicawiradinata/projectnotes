<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="WebApplication1.View.main" %>

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

    <title>Main Menu</title>
</head>
    <body>
        <form id="logoutForm" runat="server">
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
                        <%if (Session["private"] == null)
                        { %>
                            <div class="titleHeader">
                                Public Notes            
                            </div>
                            <div class="row">
                                <div style="margin-left:15em;float:left;" class="filter">
                                    <asp:TextBox ID="SearchText" runat="server" placeholder="Search creator" CssClass="categoryList" style="width:20em;"></asp:TextBox>
                                    <asp:Button ID="SearchBtn" runat="server" Text="Search" onclick="search_Click" class="btn btn-default" />
                                </div>
                                <div class="filter" style="margin-right:15em;float:right;">
                                    <asp:DropDownList ID="categoryList" runat="server" CssClass="categoryList" style="width:20em;"></asp:DropDownList>
                                    <asp:Button ID ="filterBtn" runat="server" name="filterBtn" class="btn btn-default" Text="Filter" OnClick="filter_Click" />
                                </div>
                            </div>
                            <% if (Session["noPublicNotes"] != null)
                             {%>
                                <div class="row">
                                    <h3>Still have no notes? Click the button below to add your own notes</h3>
                                    <a href="addnotes.aspx" style=" font-family: 'Droid Sans', sans-serif;" class="btn btn-primary">
                                        <b>Add Your Notes</b>
                                    </a>
                                </div>
                            <% Session.Contents.Remove("noPublicNotes");
                            }
                            else
                            { %>
                                <div class="itemList" style="clear:both">
                                    <asp:DataList ID="notesList" runat="server" CssClass="testTable" RepeatColumns="3" CellPadding="6" RepeatDirection="horizontal" >
                                        <ItemTemplate>
                                                <div id="box1" class="itemBackground" style="margin-bottom: 16em;height: 36.7em;" runat="server" onclick="detail_Click">
                                                    <a class="viewNote" href="noteDetails.aspx?NoteID=<%#Eval("idnotes") %>">
                                                        <div class="itemSquare">
                                                            <div class="itemTitle"><%#Eval("titleNotes")%></div>
                                                            <div class="itemContent"><%#Eval("descriptionNotes")%></div>
                                                            <div class="itemCreator"><%#Eval("creatorNotes")%></div>
                                                            <div class="itemContent">
                                                                <img class="pp" src="<%#Eval("profilePicture") %>"/>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                        <%  } %>
                        <%}
                        else
                        { %>
                            <div class="titleHeader">
                                My Notes            
                            </div>
                            <div class="filter">
                                <asp:DropDownList ID="categoryList2" runat="server"></asp:DropDownList>
                                <asp:Button ID ="Button1" runat="server" name="filterBtn" class="btn btn-default" Text="Filter" OnClick="filter_Click" />
                            </div>
                            <% if (Session["noPrivateNotes"] != null)
                             {%>
                                <div class="row">
                                    <h3>Still have no notes? Click the button below to add your own notes</h3>
                                    <a href="addnotes.aspx" style=" font-family: 'Droid Sans', sans-serif;" class="btn btn-primary">
                                        <b>Add Your Notes</b>
                                    </a>
                                </div>
                            <% Session.Contents.Remove("noPrivateNotes");
                            }
                            else
                            {%>
                            <div class="itemList">
                                <asp:DataList ID="privateList" runat="server" CssClass="testTable" RepeatColumns="3" CellPadding="6" RepeatDirection="horizontal" >
                                    <ItemTemplate>
                                            <div id="box1" class="itemBackground" runat="server" onclick="detail_Click">
                                                <a class="viewNote" href="noteDetails.aspx?NoteID=<%#Eval("idnotes") %>">
                                                    <div class="itemSquare">
                                                        <div class="itemTitle"><%#Eval("titleNotes")%></div>
                                                        <div class="itemContent"><%#Eval("descriptionNotes")%></div>
                                                        <div class="itemCreator"><%#Eval("creatorNotes")%></div>
                                                    </div>
                                                </a>
                                            </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <%}
                        } %>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
