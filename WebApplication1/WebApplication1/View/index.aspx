<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.View.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--link to css-->
    <link href="../css/bootstrap.css" rel="stylesheet"/>
    <link href="../css/style.css" rel="stylesheet"/>

    <!--link to javascript-->
    <script src="../scripts/jquery-1.9.1.js"></script>
    <script src="../scripts/bootstrap.js"></script>

    <title>Project Notes</title>
</head>
<body>
    <!--background-->
    <div class="background">
        <div class="paddingBackground">
            <div class="contentHeader">
                <div class="navbar-header">
                    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                        <div class="navbar-header">
                            <a class="navbar-brand navbar-left brand" href="index.aspx">Project Notes</a>
                        </div>
                        <div class="nav navbar-nav navbar-right">
                            <a class="btn btn-primary" role="button" data-toggle="modal" data-target="#myModal" style="margin: 7px 8px 0 0; font-family: 'Droid Sans', sans-serif;">
                                <b>Login</b>
                            </a>
                            <a class="btn btn-success" role="button" href="register.aspx" style="margin: 7px 25px 0 0; font-family: 'Droid Sans', sans-serif;">
                                <b>Sign up</b>
                            </a>
                        </div>
                    </nav>
                </div>

                <div class="titleHeader">
                    Project Notes              
                </div>
                <div class="subHeader">
                    Project scheduler offers services to organize your notes
               
                </div>
                <a href="register.aspx" class="registerBtn">Register Now</a>
                <a href="#" class="learnmoreBtn">Learn More</a>
            </div>
        </div>
    </div>
    <!--background section ends here-->

    <!--modal for login-->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"></button>
                    <h3 class="modal-title">Login</h3>
                </div>
                <div class="modal-body" style="margin-left: 10px; margin-right: 10px;">
                    <form runat="server" class="form-horizontal">
                        <div class="form-group">
                            <label>Username:</label>
                            <asp:TextBox ID="username" runat="server" name="username" class="form-control" placeholder="Username" required="required"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <asp:TextBox ID="password" TextMode="Password" runat="server" name="password" class="form-control" placeholder="Password" required="required"></asp:TextBox>    
                        </div>
                        <div align="right">
                             <asp:Button ID="loginBtn" runat="server" Text="Login" class="btn btn-primary form-horizontal form-group" OnClick="login_click" required="required"/>
                             <a runat="server" value="Cancel" href="index.aspx" class="btn btn-danger form-horizontal form-group" style="margin-left:20px">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--modal section ends here-->
</body>
</html>