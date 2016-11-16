<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewProfile.aspx.cs" Inherits="WebApplication1.View.viewProfile" %>

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
    <title>View Profile</title>
</head>
<body>
    <div class="backgroundProfile">
        <div class="paddingProfile">
            <form id="form1" runat="server">
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
                    <div class="contentWrapper" style="margin-left: 10em; padding-top: 10%;">
                        <%--<div class="titleHeader" style="font-size:2em;">
                            Profile           
                        </div>--%>
                        <asp:Label ID="fullName" CssClass="titleHeader" style="font-size:2em;" runat="server"></asp:Label>
                        <hr class="regisLine" style="margin-right:10em;"/>
                        <div class="profilePicture">
                            <asp:Image ID="profPic" class="pp" runat="server"/>
                        </div>
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:22em;">Username</asp:Label><br />   <br />               
                        <asp:TextBox ID="username" runat="server" name="username" class="inputField" placeholder="Username" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile"  style="margin-right:22em; ">First name</asp:Label><br /> <br /> 
                        <asp:TextBox ID="firstName" runat="server" name="firstName" class="inputField" placeholder="First Name" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile"  style=" margin-right:22em;">Last name</asp:Label><br />  <br />  
                        <asp:TextBox ID="lastName" runat="server" name="lastName" class="inputField" placeholder="Last Name" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile"  style="margin-right:24em; ;">Email</asp:Label><br />  <br />  
                        <asp:TextBox ID="email" runat="server" name="email" type="email" class="inputField" placeholder="Email" required="required" disabled="disabled"></asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile"  style="margin-right:21em; ">Date of Birth</asp:Label><br />    <br />
                        <asp:TextBox ID="dateOfBirth" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth" required="required" disabled="disabled"></asp:TextBox><br /><br />
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
