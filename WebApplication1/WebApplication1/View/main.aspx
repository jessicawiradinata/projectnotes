﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="WebApplication1.View.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--link to css-->
    <link href="../css/bootstrap.css" rel="stylesheet"/>
    <link href="../css/style.css" rel="stylesheet"/>

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
                        <div class="titleHeader">
                            Main Menu            
                        </div>
                        <div class="itemList" >
                            <asp:DataList ID="notesList" runat="server" CssClass="testTable" RepeatColumns="3" CellPadding="6" RepeatDirection="horizontal" >
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
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
