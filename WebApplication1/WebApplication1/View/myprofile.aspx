<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myprofile.aspx.cs" Inherits="WebApplication1.View.myprofile" %>

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

        <title>My Profile</title>
    </head>
    <body>
        <div class="backgroundProfile" >
            <div class="paddingProfile">
                <form id="form" runat="server">
                <div class="contentProfile">
                    <div class="navbar-header">
                        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                            <div class="navbar-header">
                                <a class="navbar-brand navbar-left brand" href="index.aspx">Project Notes</a>
                            </div>
                            <div class="nav navbar-nav navbar-right">
                                <li><a href="addnotes.aspx" style=" font-family: 'Droid Sans', sans-serif;">
                                    <b>Add Notes</b>
                                </a></li>
                                <li class="active"><a href="myprofile.aspx"  font-family: 'Droid Sans', sans-serif;">
                                    <b>My Profile</b>
                                </a></li>
                                <li><a href="accountSettings.aspx"  style="margin-right:1em; font-family: 'Droid Sans', sans-serif;">
                                    <b>Account</b>
                                </a></li>
                                <li>
                                    <asp:LinkButton runat="server" style="margin-right:1em;padding: 15px 15px" OnClick="logout_Click" CssClass="glyphicon glyphicon-log-out">
                                    </asp:LinkButton>
                                </li>
                            <%--</div>--%>
                        </nav>
                    </div>

                    <div class="navProfile">
                        <ul class="navbar navbar-inverse nav-pills nav-stacked" style="text-decoration:none;left;width:15%; color:#C1C3C6; list-style-type: none; padding-left:0em; border-radius:0px;">
                            <li class="borderLink" style="padding-top:11.2em; border-top:1px solid #C1C3C6;"></li>
                            <a href="myprofile.aspx" style="color:#FFF"><li class="borderLink links">Account overview</li></a>
                            <a href="#" style="color:#FFF"><li class="borderLink links">Edit profile</li></a>
                            <a href="#" style="color:#FFF"><li class="borderLink links">Set device password</li></a>
                            <a href="#" style="color:#FFF"><li class="borderLink links">Notification settings</li></a>
                            <a href="#" style="color:#FFF"><li class="borderLink links">Account Settings</li></a>
                            <a href="#" style="color:#FFF"><li class="borderLink links">Reminder Settings</li></a>
                            <li class="borderLink" style="padding-bottom:39em;"></li>
                        </ul>
                    </div>
                    <div class="contentWrapper" style="margin-left:10em; padding-top:10%;">
                    <%if (Session["editProfile"] == null)
                        { %>
                        
                        <div class="titleHeader" style="font-size:2em;">
                            My Account Profile           
                        </div>
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
                        <asp:Button ID="editBtn" runat="server" Text="Edit Profile" class="editBtn" OnClick="edit_click" style="margin:auto;" />
                        <%  if (Session["updatedMessage"] != null) { %>
                            <div class="alert alert-info" style="margin-top:1em; margin-right:10em;">
                        <%  Response.Write(Session["updatedMessage"]);
                            Session.Contents.Remove("updatedMessage"); %>
                            </div>
                        <% } %>
                    <% }
                     else { %>
                        <div class="titleHeader" style="font-size:2em;">
                            Edit Profile Account    
                        </div>
                        <hr class="regisLine" style="margin-right:10em;"/>
                        <div class="profilePicture">
                            <asp:Image runat="server" ID="imageProfile" CssClass="pp" />
                        </div>  
                        <asp:FileUpload runat="server" ID="uploadImg" class="btn btn-success" style="display:inline;"/><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:22em;">Username</asp:Label><br />   <br /> 
                        <asp:TextBox ID="usernameEdit" runat="server" name="username" class="inputField" placeholder="Username" required="required" disabled="disabled" ></asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile"  style="margin-right:22em; ">First name</asp:Label><br /> <br /> 
                        <asp:TextBox ID="firstNameEdit" runat="server" name="firstName" class="inputField" placeholder="First Name" required="required"></asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile"  style=" margin-right:22em;">Last name</asp:Label><br />  <br />  
                        <asp:TextBox ID="lastNameEdit" runat="server" name="lastName" class="inputField" placeholder="Last Name" required="required"></asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile"  style="margin-right:24em; ;">Email</asp:Label><br />  <br />
                        <asp:TextBox ID="emailEdit" runat="server" name="email" type="email" class="inputField" placeholder="Email" required="required"></asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile"  style="margin-right:21em; ">Date of Birth</asp:Label><br />    <br />
                        <asp:TextBox ID="dobEdit" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth" required="required"></asp:TextBox><br /><br />
                        <asp:Button ID="saveBtn" runat="server" Text="Save changes" class="submitBtn" OnClick="save_click" href="myprofile.aspx" style="margin-bottom:1em;" />
                    <% 
                        Session.Contents.Remove("editProfile");
                        }
                    %>
                    </div>
                </div>
            </form>
         </div>
     </div>
    </body>
</html>
