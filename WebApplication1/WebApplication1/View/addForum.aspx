<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addForum.aspx.cs" Inherits="WebApplication1.View.addForum" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <!--link to css-->
            <link href="../css/bootstrap.css" rel="stylesheet"/>
            <link href="../css/style.css" rel="stylesheet"/>
            <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <!--link to javascript-->
            <script src="../scripts/jquery-1.9.1.js"></script>
            <script src="../scripts/bootstrap.js"></script>
            <script src="../scripts/tinymce/tinymce.min.js"></script>

            <script type="text/javascript">
                tinymce.init({
                  selector: 'textarea',
                  height: 300,
                  content_style: "div{ margin: 200 }",
                  plugins: [
                    'advlist autolink lists link image charmap print preview anchor',
                    'searchreplace visualblocks code fullscreen',
                    'insertdatetime media table contextmenu paste code'
                  ],
                  toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
                  content_css: '//www.tinymce.com/css/codepen.min.css'
                });
           </script>

        <title>Add Notes</title>
    </head>
    <body>
        <form id="form1" runat="server" >
            <div class="backgroundNotes">
                <div class="paddingProfile">
                    <div class="contentNotes">
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
                        <div class="titleHeader" style="font-size:3em;">
                            Post new Forum        
                        </div>
                        <div class="subHeader">
                            Add your discussion forum in here.    
                        </div>
                        <hr class="regisLine" /> 
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:42em;">Post Forum Title</asp:Label><br />   <br /> 
                        <asp:TextBox ID="title" runat="server" name="title" class="inputField" placeholder="Forum Title" required="required" style="width:51em" ></asp:TextBox><br /><br />
                        <%--<asp:TextBox ID="description" Height="15em" runat="server" TextMode="MultiLine" name="description"  class="inputField" placeholder="Description Notes" required="required" ></asp:TextBox><br /><br />--%>
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:42em;">Post Description</asp:Label><br />   <br /> 
                        <textarea id="content" runat="server" ></textarea><br />
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:45em; ">User Creator</asp:Label><br />   <br /> 
                        <asp:TextBox ID="creator" runat="server" name="creator" class="inputField" style="width:51em" placeholder="Creator"  required="required" disabled="disabled"> </asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:45em;">Date Created</asp:Label><br />   <br /> 
                        <asp:TextBox ID="dates" runat="server" name="postdate" class="inputField" placeholder="Date of Notes" required="required" disabled ="disabled" style="width:51em" ></asp:TextBox><br /><br />
                        <asp:Button ID ="submitBtn" runat="server" name="button" CssClass="submitBtn" Text="Submit" style="width:62%;" OnClick="submitBtn_Click" />                                          
                    </div>
                </div>
            </div>
       </form>
    </body>
</html>
