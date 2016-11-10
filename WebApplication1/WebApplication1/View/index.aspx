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
    <div class="backgrounds">
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
    <div class="indexContent">
        <div class="paddingContent">      
            <div class="descriptionNotes" style="padding-left:17em; display:none;" >
                <p class="titleDesc">What's on Project Notes</p>
                <p class="captionDesc">Create your own notes</p>
                <p class="desc">In Project notes, you can make a to-do list and reminder toward them where you can access easily.</p>
                <p class="captionDesc">Save your notes in list</p>
                <p class="desc">Capture your note once and you can directly put into your note list. In here, you can edit and delete your note accessed by every devices that you used.</p>
                <p class="captionDesc">Share your notes to public</p>
                <p class="desc">you can share the notes that you have created to public people. Capture your life moment and share to them or collaborate with other people.</p>
            </div>
            <div class="descriptionPict" style="display:none;">
                <img src="../img/notes.png" class="notesPict" />
            </div>
            <div class="descIllustration" style="display:none;" >
                <img src="../img/proj.jpg" class="illusPict" />
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div class="footer">
        <div class="paddingFooter">
            <div class="titleFooter">
                Project Notes
            </div>
            <div class="linkFooter">
                <p class="captionLink">Useful Links</p>
                <ul>
                    <li class="ulink">About</li>
                    <li class="ulink">News</li>
                    <li class="ulink">Home</li>
                    <li class="ulink">Help</li>
                </ul>
            </div>
            <div class="socmedIcon">
                <a href="#"><img src="../img/fb.png" class="socLogo" /></a>
                <a href="#"><img src="../img/tw.png" class="socLogo" /></a>
                <a href="#"><img src="../img/email.png" class="socLogo" /></a>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    <!--background section ends here-->

    <!--modal for login-->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top:20em; height:26em ">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
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