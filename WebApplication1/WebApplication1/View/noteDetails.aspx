
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="noteDetails.aspx.cs" Inherits="WebApplication1.View.noteDetails" ValidateRequest="false"%>

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

        <title>Note Details</title>
    </head>
    <body style="overflow:auto">
        <form id="form" runat="server">
        <div class="backgroundDetails">
            <div class="paddingDetails">
                <div class="contentDetails"> 
                    <div class="navbar-header">
                        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                            <div class="navbar-header">
                                <a class="navbar-brand navbar-left brand" href="index.aspx">Project Notes</a>
                            </div>
                            <div class="nav navbar-nav navbar-right">
                                <li><a href="addnotes.aspx" style=" font-family: 'Droid Sans', sans-serif;">
                                    <b>Add Notes</b>
                                </a></li>
                                <li><a href="myprofile.aspx"  font-family: 'Droid Sans', sans-serif;">
                                    <b>My Profile</b>
                                </a></li>
                                <li><a href="accountSettings.aspx"  style="margin-right:1em; font-family: 'Droid Sans', sans-serif;">
                                    <b>Account</b>
                                </a></li>
                                <li>
                                    <asp:LinkButton runat="server" style="margin-right:1em;padding: 15px 15px" OnClick="logout_Click" CssClass="glyphicon glyphicon-log-out">
                                    </asp:LinkButton>
                                </li>
                            </div>
                        </nav>
                    </div>                   
                    <div class="titleDetail">
                        Note Details
                    </div>
                    <%if (Session["restrictedUser"] == null)
                        {
                            if (Session["editNotes"] == null)
                            { %>
                            <div>
                                <asp:TextBox ID="title" runat="server" name="title" class="inputField" placeholder="Title" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:TextBox ID="author" runat="server" name="author" class="inputField" placeholder="Creator" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:TextBox ID="date" runat="server" name="date" class="inputField" placeholder="Date" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:Label ID="content" runat="server"></asp:Label><br /><br />
                                <asp:Button ID="editBtn" runat="server" Text="Edit Notes" class="editBtn" OnClick="edit_click" />
                                <asp:Button ID="deleteBtn" runat="server" Text="Delete" class="redBtn" OnClick="delete_click" href="main.aspx"/>
                                 <%if (Session["updatedNotes"] != null)
                                     { %>
                                    <div class="alert alert-info" style="margin-top:1em;">
                                        <%Response.Write(Session["updatedNotes"]);
                                            Session.Contents.Remove("updatedNotes"); %>
                                    </div>
                                <% } %>
                            </div>
                    <% }
                        else
                        { %>
                                <div style="overflow:auto">
                                    <asp:TextBox ID="titleEdit" runat="server" name="titleEdit" class="inputField" placeholder="Title" ></asp:TextBox><br /><br />
                                    <asp:TextBox ID="authorEdit" runat="server" name="authorEdit" class="inputField" placeholder="Creator" disabled="disabled" ></asp:TextBox><br /><br />
                                    <asp:TextBox ID="dateEdit" runat="server" name="dateEdit" class="inputField" placeholder="Date" disabled="disabled" ></asp:TextBox><br /><br />
                                    <%--<asp:TextBox ID="contentEdit" runat="server" name="contentEdit" class="inputField" placeholder="Content" ></asp:TextBox><br /><br />--%>
                                    <textarea id="textarea1" runat="server"></textarea><br /><br />
                                    <asp:Button ID="saveBtn" runat="server" Text="Save changes" class="submitBtn" OnClick="save_click" href="noteDetails.aspx"/>
                                    <asp:Button ID="cancelBtn" runat="server" Text="Cancel" class="redBtn" OnClick="cancel_click" href="noteDetails.aspx"/>
                                </div>
                    <%
                                Session.Contents.Remove("editNotes");
                            }
                        }
                        else
                        {
                    %>
                            <div>
                                <asp:TextBox ID="title1" runat="server" name="title" class="inputField" placeholder="Title" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:TextBox ID="author1" runat="server" name="author" class="inputField" placeholder="Creator" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:TextBox ID="date1" runat="server" name="date" class="inputField" placeholder="Date" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:Label ID="content1" runat="server"></asp:Label><br /><br />
                            </div>
                    <%
                            Session.Contents.Remove("restrictedUser");
                        }
                    %>
                </div>
            </div>
        </div>
        </form>
    </body>
</html>
