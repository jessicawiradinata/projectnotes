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
                            <div class="titleHeader" style="padding-top:10%;font-size:3.5em;">
                                Public Notes            
                            </div>
                            <hr class="regisLine" />
                            <div class="row">
                                <div style="margin:0 auto;" class="filter">
                                    <asp:TextBox ID="SearchText" runat="server" placeholder="Search creator" CssClass="categoryList" style="width:40em;"></asp:TextBox>
                                    <asp:Button ID="SearchBtn" runat="server" Text="Search" onclick="search_Click" class="btn btn-default" />
                                </div>
                                <br /><br />
                                <div class="filter" style="margin:0 auto;">
                                    <asp:DropDownList ID="SortBy" runat="server" CssClass="categoryList" style="width:15em;margin: 0 2.3em;" AutoPostBack="True" onselectedindexchanged="SortBy_SelectedIndexChanged">
                                        <asp:ListItem Value="dateNotes">Latest</asp:ListItem>
                                        <asp:ListItem Value="dateNotes DESC">Oldest</asp:ListItem>
                                        <asp:ListItem Value="titleNotes">Title</asp:ListItem>
                                        <asp:ListItem Value="creator">Creator</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="categoryList" runat="server" CssClass="categoryList" style="width:15em;margin: 0 7.5em;" AutoPostBack="True" onselectedindexchanged="filter_Click"></asp:DropDownList>
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
                                <div class="itemList" style="clear:both; font-family:montserrat;">
                                    <asp:DataList ID="notesList" runat="server" CssClass="testTable" RepeatColumns="3" CellPadding="6" RepeatDirection="horizontal" >
                                        <ItemTemplate>
                                                <div id="box1" class="itemBackground" style="margin-bottom: 16em;height: 27.5em;" runat="server" onclick="detail_Click">
                                                    <a class="viewNote" href="noteDetails.aspx?NoteID=<%#Eval("idnotes") %>">
                                                        <div class="itemSquare">
                                                            <div class="itemContent"><%#Eval("descriptionNotes")%></div>
                                                            <div class="itemTitle"><%#Eval("titleNotes")%></div>
                                                            <div class="itemCreator">
                                                                <%#Eval("creatorNotes")%>
                                                                <img class="pp" style="width:4em; height:4em; margin-left:1em;" src="<%#Eval("profilePicture") %>"/><br />
                                                                <!--<p style="margin-right:6em;" ><%#Eval("dateNotes") %></p>-->                                                              
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
                            <div class="titleHeader" style="padding-top:10%; font-size:3.5em;">
                                My Notes            
                            </div>
                            <hr class="regisLine" />
                            <div class="row">
                                <div class="filter" style="margin:0 auto;">
                                    <asp:DropDownList ID="SortBy1" runat="server" CssClass="categoryList" style="width:15em;margin: 0 2.3em;" AutoPostBack="True" onselectedindexchanged="SortBy1_SelectedIndexChanged">
                                        <asp:ListItem Value="dateNotes">Latest</asp:ListItem>
                                        <asp:ListItem Value="dateNotes DESC">Oldest</asp:ListItem>
                                        <asp:ListItem Value="titleNotes">Title</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="categoryList2" runat="server" CssClass="categoryList" style="width:15em;margin: 0 7.5em;" AutoPostBack="True" onselectindexchanged="filter_Click"></asp:DropDownList>
                                </div>
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
                            <div class="itemList" style="clear:both">
                                <asp:DataList ID="privateList" runat="server" CssClass="testTable" RepeatColumns="3" CellPadding="6" RepeatDirection="horizontal" >
                                    <ItemTemplate>
                                            <div id="box1" class="itemBackground" style="margin-bottom: 16em;height: 27.5em;" runat="server" onclick="detail_Click">
                                                <a class="viewNote" href="noteDetails.aspx?NoteID=<%#Eval("idnotes") %>">
                                                    <div class="itemSquare">                                                       
                                                        <div class="itemContent"><%#Eval("descriptionNotes")%></div>
                                                        <div class="itemTitle"><%#Eval("titleNotes")%></div>
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
