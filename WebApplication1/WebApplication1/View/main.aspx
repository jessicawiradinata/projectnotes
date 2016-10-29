<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="WebApplication1.View.main" %>

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
    <div class="background">
        <div class="paddingBackground">
            <div class="contentHeader">
                <div class="navbar-header">
                    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                        <div class="navbar-header">
                            <a class="navbar-brand navbar-left" href="#home">Home</a>
                        </div>
                        <div class="nav navbar-nav navbar-right">
                            <li><a href="addnotes.aspx" style=" font-family: 'Droid Sans', sans-serif;">
                                <b>Add Notes</b>
                            </a></li>
                            <li><a href="myprofile.aspx"  style="margin-right:1em; font-family: 'Droid Sans', sans-serif;">
                                <b>My Profile</b>
                            </a></li>
                        </div>
                    </nav>
                </div>
                <div class="titleHeader">
                    Main Menu            
                </div>
                <div class="subHeader">
                    Welcome to project notes.      
                </div>
            </div>
        </div>
    </div>
</body>
</html>
