<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.View.index" %>

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
    <script src="../scripts/style.js"></script>

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
                <div class="contentIndex" style="display:none;">
                    <div class="titleHeader">
                        Project Notes              
                    </div>
                    <div class="subHeader">
                        Project scheduler offers services to organize your notes               
                    </div>
                    <div class="groupBtn">
                        <a href="register.aspx" class="registerBtn" style="margin-bottom:1em;">Register Now</a>
                        <a href="#" class="learnmoreBtn">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--background section ends here-->

    <!--modal for login-->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top:20em; height:26em ">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"></button>
                    <h3 class="modal-title titleModal">Login</h3>
                </div>
                <div class="modal-body" style="margin-left: 10px; margin-right: 10px;">
                    <form runat="server" class="form-horizontal">
                        <div class="form-group">
                            <asp:TextBox ID="username" runat="server" name="username" class="form-control inputUser" placeholder="Username" required="required"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="password" TextMode="Password" runat="server" name="password" class="form-control inputUser" placeholder="Password" required="required"></asp:TextBox>    
                        </div>
                        <div>
                             <asp:Button ID="loginBtn" runat="server" style="margin-left:1.3em; width:36em; background-color:#237CDA; border:1px solid #237CDA; text-transform:none" Text="Sign In" class="submitBtn form-horizontal form-group" OnClick="login_click" required="required"/><br />
                             <a runat="server" value="Cancel" href="index.aspx" class="btn btn-default form-horizontal form-group" style="margin-left:32em;">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--modal section ends here-->
</body>
</html>