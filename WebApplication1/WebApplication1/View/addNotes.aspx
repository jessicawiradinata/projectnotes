﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addNotes.aspx.cs" Inherits="WebApplication1.View.addNotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <!--link to css-->
            <link href="../css/bootstrap.css" rel="stylesheet"/>
            <link href="../css/style.css" rel="stylesheet"/>

        <!--link to javascript-->
            <script src="../scripts/jquery-1.9.1.js"></script>
            <script src="../scripts/bootstrap.js"></script>
        <title>Add Notes</title>
    </head>
    <body>
        <div class="background">
                <div class="paddingProfile">
                    <div class="contentProfile">
                        <div class="navbar-header">
                            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                                <div class="navbar-header">
                                    <a class="navbar-brand navbar-left" href="#home">Home</a>
                                </div>
                                <div class="nav navbar-nav navbar-right">
                                    <li><a href="addNotes.aspx" style=" font-family: 'Droid Sans', sans-serif;">
                                        <b>Add Notes</b>
                                    </a></li>
                                    <li><a href="myprofile.aspx"  font-family: 'Droid Sans', sans-serif;">
                                        <b>My Profile</b>
                                    </a></li>
                                    <li><a href="accountSettings.aspx"  style="margin-right:1em; font-family: 'Droid Sans', sans-serif;">
                                        <b>Account</b>
                                    </a></li>
                                </div>
                            </nav>
                        </div>
                        <div class="titleHeader">
                            Add Notes         
                        </div>
                        <div class="subHeader">
                            Add your notes in here.    
                        </div>
                        <form id="form1" runat="server" >
                            <asp:TextBox ID="title" runat="server" name="title" class="inputField" placeholder="Title Notes" required="required" ></asp:TextBox><br /><br />
                            <asp:TextBox ID="description" Height="15em" runat="server" TextMode="MultiLine" name="description"  class="inputField" placeholder="Description Notes" required="required" ></asp:TextBox><br /><br />
                            <asp:TextBox ID="creator" runat="server" name="creator" class="inputField" placeholder="Creator" required="required" disabled="disabled"> </asp:TextBox><br /><br />
                            <asp:TextBox ID="dates" runat="server" name="postdate" class="inputField" placeholder="Date of Notes" required="required" disabled ="disabled" ></asp:TextBox><br /><br />
                            <asp:Button ID ="submitBtn" runat="server" name="button" CssClass="btn btn-primary" Text="Submit" OnClick="submitBtn_Click" />                    
                        </form>
                    </div>
                </div>
         </div>
    </body>
</html>
