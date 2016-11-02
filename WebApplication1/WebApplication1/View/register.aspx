<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.View.register" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <link href="../css/bootstrap.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
        <title></title>
    </head>
    <body>
        <div class="backgroundRegister">
            <div class="paddingProfile">
                <div class="boxRegister">
                    <div class="titleRegister">
                        Registration
                    </div>        
                    <form id="form1" runat="server" >
                        <div class="contentRegister">
                            <asp:TextBox ID="username" runat="server" name="username" class="inputField" placeholder="Username" required="required"></asp:TextBox>
                            <asp:Button ID="checkAvail" runat="server" name="check" OnClick="checkAvail_click" Text="Check" CssClass="btn btn-default" formnovalidate="formonvalidate"/>
                            <br /><br />
                            <asp:TextBox ID="password" TextMode="Password" runat="server" name="password" class="inputField" placeholder="Password" required="required"></asp:TextBox><br /><br />
                            <asp:TextBox ID="confirmPassword" TextMode="Password" runat="server" name="confirmpassword" class="inputField" placeholder="Confirm password" required="required"></asp:TextBox><br /><br />
                            <asp:TextBox ID="email" type="email" runat="server" name="email" class="inputField" placeholder="Email" required="required"></asp:TextBox><br /><br />
                            <asp:TextBox ID="firstName" runat="server" name="firstName" class="inputField" placeholder="First Name" required="required"></asp:TextBox><br /><br />
                            <asp:TextBox ID="lastName" runat="server" name="lastName" class="inputField" placeholder="Last Name" required="required"></asp:TextBox><br /><br />
                            <asp:TextBox ID="dateOfBirth" runat="server" type="date" name="dob" class="inputField" placeholder="dateOfBirth" required="required"></asp:TextBox><br /><br />
                            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="register_click" CssClass="submitRegBtn" required="required"/>
                            <a runat="server" value="Cancel" href="index.aspx" class="cancelBtn">Cancel</a><br /><br />            

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
                            <% } %>
                        </div>
                    </form>
                </div> 
            </div>
        </div>
    </body>
</html>