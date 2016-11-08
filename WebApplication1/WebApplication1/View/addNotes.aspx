<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addNotes.aspx.cs" Inherits="WebApplication1.View.addNotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <!--link to css-->
            <link href="../css/bootstrap.css" rel="stylesheet"/>
            <link href="../css/style.css" rel="stylesheet"/>

        <!--link to javascript-->
            <script src="../scripts/jquery-1.9.1.js"></script>
            <script src="../scripts/bootstrap.js"></script>
            <script src="../scripts/tinymce/tinymce.min.js"></script>

            <script type="text/javascript">
                tinymce.init({
                  selector: 'textarea',
                  height: 500,
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
            <div class="backgroundProfile">
                <div class="paddingProfile">
                    <div class="contentProfile">
                        <div class="navbar-header">
                            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                                <div class="navbar-header">
                                    <a class="navbar-brand navbar-left brand" href="index.aspx">Project Notes</a>
                                </div>
                                <div class="nav navbar-nav navbar-right">
                                    <li>
                                        <a href="addNotes.aspx" style=" font-family: 'Droid Sans', sans-serif;">
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
                        <div class="titleHeader">
                            Add Notes         
                        </div>
                        <div class="subHeader">
                            Add your notes in here.    
                        </div> 
                        <asp:TextBox ID="title" runat="server" name="title" class="inputField" placeholder="Title Notes" required="required" ></asp:TextBox><br /><br />
                        <asp:TextBox ID="description" Height="15em" runat="server" TextMode="MultiLine" name="description"  class="inputField" placeholder="Description Notes" required="required" ></asp:TextBox><br /><br />
                        <asp:TextBox ID="creator" runat="server" name="creator" class="inputField" placeholder="Creator" required="required" disabled="disabled"> </asp:TextBox><br /><br />
                        <asp:TextBox ID="dates" runat="server" name="postdate" class="inputField" placeholder="Date of Notes" required="required" disabled ="disabled" ></asp:TextBox><br /><br />
                        <asp:DropDownList ID="categoryList" runat="server"></asp:DropDownList><br /><br />
                        <asp:DropDownList ID="visibilityList" runat="server"></asp:DropDownList><br /><br />
                        <asp:Button ID ="submitBtn" runat="server" name="button" CssClass="submitBtn" Text="Submit" OnClick="submitBtn_Click" />
                        <%if (Session["categoryField"] != null) { %>
                            <div class="alert alert-danger" style="margin-top:1em;">
                                <%Response.Write(Session["categoryField"]);
                                    Session.Contents.Remove("categoryField"); %>
                            </div>
                        <%}  else if (Session["visibilityField"] != null) { %>
                                <div class="alert alert-danger" style="margin-top:1em;">
                                    <%Response.Write(Session["visibilityField"]);
                                        Session.Contents.Remove("categoryField"); %>
                                </div>
                                <% } %>                    
                    </div>
                </div>
            </div>
       </form>
    </body>
</html>
