<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addNotes.aspx.cs" Inherits="WebApplication1.View.addNotes" ValidateRequest="false" %>

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
                        <div class="titleHeader">
                            Post new Note        
                        </div>
                        <div class="subHeader">
                            Add your notes in here.    
                        </div> 
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:46em;">Post Title</asp:Label><br />   <br /> 
                        <asp:TextBox ID="title" runat="server" name="title" class="inputField" placeholder="Title Notes" required="required" style="width:51em" ></asp:TextBox><br /><br />
                        <%--<asp:TextBox ID="description" Height="15em" runat="server" TextMode="MultiLine" name="description"  class="inputField" placeholder="Description Notes" required="required" ></asp:TextBox><br /><br />--%>
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:46em;">Post Body</asp:Label><br />   <br /> 
                        <textarea id="content" runat="server" ></textarea><br />
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:45em; ">User Creator</asp:Label><br />   <br /> 
                        <asp:TextBox ID="creator" runat="server" name="creator" class="inputField" style="width:51em" placeholder="Creator"  required="required" disabled="disabled"> </asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:45em;">Date Created</asp:Label><br />   <br /> 
                        <asp:TextBox ID="dates" runat="server" name="postdate" class="inputField" placeholder="Date of Notes" required="required" disabled ="disabled" style="width:51em" ></asp:TextBox><br /><br />
                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:41em;">Personal Preference</asp:Label><br />   <br /> 
                        <asp:DropDownList ID="categoryList" runat="server" CssClass="categoryList" style="width:51em" ></asp:DropDownList><br /><br /><br />
                        <asp:DropDownList ID="visibilityList" runat="server" CssClass="categoryList" style="width:51em"></asp:DropDownList><br /><br />
                        <asp:Button ID ="submitBtn" runat="server" name="button" CssClass="submitBtn" Text="Submit" style="width:62%;" OnClick="submitBtn_Click" />
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
