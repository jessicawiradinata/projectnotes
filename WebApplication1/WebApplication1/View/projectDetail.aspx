﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="projectDetail.aspx.cs" Inherits="WebApplication1.View.projectDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--link to css-->
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <!--link to javascript-->
    <script src="../scripts/jquery-1.9.1.js"></script>
    <script src="../scripts/bootstrap.js"></script>

    <title>Project Details</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="backgroundDetails" style="overflow:auto">
        <div class="paddingDetails">
            <div class="contentDetails">
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
                                <asp:LinkButton runat="server" Style="margin-right: 1em; padding: 15px 15px" OnClick="logout_Click" CssClass="glyphicon glyphicon-log-out">
                                </asp:LinkButton>
                            </li>
                        </div>
                    </nav>
                </div>
                <div class="titleDetail">
                    Project Details
                </div>
                <div>
                    <asp:Label runat="server" CssClass="labelProfile" style="margin-right:22em;">Project Name</asp:Label><br /><br />
                    <asp:TextBox ID="title" runat="server" name="title" class="inputField" placeholder="Title" disabled="disabled" ></asp:TextBox><br /><br />
                    <asp:Label runat="server" CssClass="labelProfile" style="margin-right:20em;">Owner</asp:Label><br /><br />
                    <asp:TextBox ID="owner" runat="server" name="owner" class="inputField" placeholder="Owner" disabled="disabled" ></asp:TextBox><br /><br />
                    <asp:Label runat="server" CssClass="labelProfile" style="margin-right:20em;">About this project</asp:Label><br /><br />
                    <asp:TextBox ID="description" Height="15em" runat="server" TextMode="MultiLine" name="description"  class="inputField" disabled="disabled"></asp:TextBox><br /><br />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
