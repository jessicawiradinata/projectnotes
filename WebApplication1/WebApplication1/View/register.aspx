<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.View.register" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <link href="../css/bootstrap.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet"/>     
        <title>Register Page</title>
        <script src="../scripts/jquery-1.9.1.js"></script>
        <script src="../scripts/bootstrap.js"></script>
        <script src="../scripts/style.js"></script>
    </head>
    <body>
        <div class="backgroundRegister">
            <div class="paddingProfile">
                <div class="boxRegister">
                    <div class="titleRegister" style="display:none; padding-bottom:0em; font-size:3.2em;" >
                        Project Notes
                    </div>
                    <hr class="regisLine" />
                    <form id="form1" runat="server" >
                        <div class="contentRegister" style="display:none;" >
                            <asp:Button ID="fbBtn" runat="server" Text="Sign up with Facebook" style="margin-left:0em; width:27.5em; margin-bottom:1.25em" CssClass="submitBtn" />
                            <asp:Button ID="googleBtn" runat="server" Text="Sign up with Google+" style="margin-left:0em; width:27.5em; margin-bottom:1em; background-color:#d34836"  CssClass="cancelBtn"/>
                            <hr class="testLine" />
                            <p class="email">Or sign up with your email address</p>                           
                            <asp:TextBox ID="username" runat="server" name="username" class="inputField" placeholder="Username" required="required"></asp:TextBox>
                            <asp:Button ID="checkAvail" runat="server" name="check" OnClick="checkAvail_click" Text="Check" CssClass="btn btn-default" formnovalidate="formonvalidate"/><br /><br />
                            <asp:RegularExpressionValidator runat="server" id="userValidator" controltovalidate="username" validationexpression="[a-zA-Z0-9]{6,18}" errormessage="Please enter a valid username" />
                            
                            <asp:TextBox ID="password" TextMode="Password" runat="server" name="password" class="inputField" placeholder="Password" required="required"></asp:TextBox><br /><br />
                            <asp:RegularExpressionValidator runat="server" id="passValidator" controltovalidate="password" validationexpression="[\S]{6,18}" errormessage="Please enter a valid password" />
                                                    
                            <asp:TextBox ID="confirmPassword" TextMode="Password" runat="server" name="confirmpassword" class="inputField" placeholder="Confirm password" required="required"></asp:TextBox><br /><br />
                            <asp:CompareValidator ID="CompareValidator" runat="server" ControlToValidate="confirmPassword" ControlToCompare="password" ErrorMessage="Password does not match"/>
                            
                            <asp:TextBox ID="email" type="email" runat="server" name="email" class="inputField" placeholder="Email" required="required"></asp:TextBox><br /><br />
                            <asp:RegularExpressionValidator runat="server" id="emailValidator" controltovalidate="email" validationexpression="[a-zA-Z0-9_\-\.]+@[[a-zA-Z0-9_\-\.]+\.([a-zA-Z]{2,5})" errormessage="Please enter a valid email address" />
                            <div class="" style="float:left;">
                                <asp:TextBox ID="firstName" runat="server" name="firstName" class="inputField" placeholder="First Name" required="required" style="width:13em;"></asp:TextBox>
                                <asp:TextBox ID="lastName" runat="server" name="lastName" class="inputField" placeholder="Last Name" required="required" style="width:13em; margin-left:1em;"></asp:TextBox><br /><br />
                            </div>
                            <asp:TextBox ID="dateOfBirth" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth" required="required" style="clear:both;"></asp:TextBox><br /><br />
                            <p class="notice">By clicking on Sign up, you agree to <a href="#">Project Notes's terms and condition</a> and <a href="#">privacy policy</a></p>
                            <asp:Button ID="Button1" runat="server" Text="Sign up" style="margin-left:0em; width:27.5em" OnClick="register_click" CssClass="editBtn" required="required"/>
                            <a runat="server" value="Cancel" href="index.aspx" class="btn btn-default" style="margin-top:1.5em; margin-left:22em;">Cancel</a><br /><br />            

                            <%  if (Session["registerMessage"] != null) { %>
                                <div class="alert alert-success" style="margin-top:10%;margin-right:28.5%">
                            <%  Response.Write(Session["registerMessage"]);
                                Session.Contents.Remove("registerMessage"); %>
                                </div>
                            <% } else if (Session["usernameMessage"] != null) { %>  
                                <div class="alert alert-danger" style="margin-top:10%;margin-right:28.5%">
                            <%  Response.Write(Session["usernameMessage"]);
                                Session.Contents.Remove("usernameMessage"); %>
                                </div>
                            <% } else if (Session["emailMessage"] != null) { %>  
                                <div class="alert alert-danger" style="margin-top:10%;margin-right:28.5%">
                            <%  Response.Write(Session["emailMessage"]);
                                Session.Contents.Remove("emailMessage"); %>
                                </div>
                            <% } %>

                        </div>
                    </form>
                </div> 
            </div>
        </div>
    </body>
</html>