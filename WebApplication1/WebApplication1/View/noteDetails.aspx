
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="noteDetails.aspx.cs" Inherits="WebApplication1.View.noteDetails" ValidateRequest="false"%>

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
        <script src="../scripts/tinymce/tinymce.min.js"></script>

        <script type="text/javascript">
            tinymce.init({
                selector: '.textarea',
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
    <body >
        <form id="form" runat="server">
        <div class="backgroundDetails" style="overflow:auto">
            <div class="paddingDetails">
                <div class="contentDetails"> 
                    <div class="navbar-header">
                        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                            <div class="navbar-header">
                                <a class="navbar-brand navbar-left brand" href="index.aspx">Project Notes</a>
                            </div>
                            <div class="nav navbar-nav navbar-right">
                                 <li>
                                     <a href="addnotes.aspx" style=" font-family: 'Droid Sans', sans-serif;">
                                        <b>Add Notes</b>
                                     </a>
                                 </li>
                                 <li>
                                     <a href="myprofile.aspx"  font-family: 'Droid Sans', sans-serif;">
                                        <b>My Profile</b>
                                     </a>
                                 </li>
                                 <li>
                                     <a href="accountSettings.aspx"  style="margin-right:1em; font-family: 'Droid Sans', sans-serif;">
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
                    
                    <%if (Session["restrictedUser"] == null)
                    {%>
                                                   
                            <% 
                            if (Session["editNotes"] == null)
                            { %>
                            <div>  
                                <asp:Label ID="labelTitle" runat="server" name="title" CssClass="titleHeader" placeholder="Title" style="font-size:2em;text-align:left;" disabled="disabled" ></asp:Label><br /><br />  
                                <asp:Label ID="labelAuthor" runat="server" name="author" class="subHeader" placeholder="Creator" style="width:51em; font-size:1em;" disabled="disabled" ></asp:Label><br /><br />    
                                <asp:Label ID="labelDate" runat="server" name="date" class="subHeader" placeholder="Date" disabled="disabled" style="width:51em;font-size:1em;" ></asp:Label><br /><br />
                                <hr class="regisLine" style="margin-bottom:5em;" />
                                <div class="borderContent" style=" margin-left:27%; margin-right:27%; margin-bottom:2em;min-height:15em; text-align:left;">
                                    <asp:Label ID="labelContent" runat="server" ></asp:Label><br /><br />
                                </div>
                                <asp:Button ID="editBtn" runat="server" Text="Edit Notes" class="editBtn" OnClick="edit_click" style="margin:auto; margin-bottom:1em; width:38em;"/>
                                <asp:Button ID="deleteBtn" runat="server" Text="Delete Notes" class="redBtn" OnClick="delete_click" href="main.aspx" style="margin:auto; margin-bottom:8em; width:38em;"/>
                                <asp:TextBox ID="comment" Height="15em" runat="server" TextMode="MultiLine" style="width:51em; resize:none;" name="comment" class="inputField" placeholder="Add your comments here"></asp:TextBox><br /><br />
                                <asp:Button ID="commentBtn" runat="server" Text="Add Comment" class="btn btn-default" OnClick="comment_click" style="margin:auto; margin-bottom:1em; width:38em;"/>
                                 <%if (Session["updatedNotes"] != null)
                                     { %>
                                    <div class="alert alert-info" style="margin-top:1em;">
                                        <%Response.Write(Session["updatedNotes"]);
                                            Session.Contents.Remove("updatedNotes"); %>
                                    </div>
                                <% } %>
                                <%else if (Session["commentFound"] != null)
                                     { %>
                                    <div class="alert alert-success" style="margin-top:1em;">
                                        <%Response.Write(Session["commentFound"]);
                                            Session.Contents.Remove("commentFound"); %>
                                    </div>
                                <% } %>
                                <%else if (Session["commentAdded"] != null)
                                     { %>
                                    <div class="alert alert-success" style="margin-top:1em;">
                                        <%Response.Write(Session["commentAdded"]);
                                            Session.Contents.Remove("commentAdded"); %>
                                    </div>
                                <% } %>
                            </div>
                         <% }
                            else
                            { %>
                                    <div style="overflow:auto">
                                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:46em;">Title Notes</asp:Label><br />   <br />  
                                        <asp:TextBox ID="titleEdit" runat="server" name="titleEdit" class="inputField" style="width:51em" placeholder="Title" ></asp:TextBox><br /><br />
                                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:44em;">Creator Notes</asp:Label><br />   <br />  
                                        <asp:TextBox ID="authorEdit" runat="server" name="authorEdit" class="inputField" style="width:51em" placeholder="Creator" disabled="disabled" ></asp:TextBox><br /><br />
                                        <asp:Label runat="server" CssClass="labelProfile" style="margin-right:44em;">Date Created</asp:Label><br />   <br />  
                                        <asp:TextBox ID="dateEdit" runat="server" name="dateEdit" class="inputField" style="width:51em" placeholder="Date" disabled="disabled" ></asp:TextBox><br /><br />
                                        <textarea id="textarea1" class="textarea" runat="server" style="width:51em"></textarea><br /><br />
                                        <asp:Button ID="saveBtn" runat="server" Text="Save changes" class="submitBtn" OnClick="save_click" href="noteDetails.aspx" style="margin-bottom:1.5em; width:51em; "/>
                                        <asp:Button ID="cancelBtn" runat="server" Text="Cancel" class="btn btn-default" OnClick="cancel_click" href="noteDetails.aspx" style="margin-bottom:1.5em; "/>

                                    </div>
                        <%
                                    Session.Contents.Remove("editNotes");
                                }
                            }
                        else
                        {
                    %>
                            <asp:Label ID="labelTitle1" runat="server" name="title" CssClass="titleHeader" placeholder="Title" style="font-size:2em;text-align:left;" disabled="disabled" ></asp:Label><br /><br />
                            <asp:Label ID="labelAuthor1" runat="server" name="author" class="subHeader" placeholder="Creator" style="width:51em; font-size:1em;" disabled="disabled" ></asp:Label><br /><br />
                            <asp:Label ID="labelDate1" runat="server" name="date" class="subHeader" placeholder="Date" disabled="disabled" style="width:51em;font-size:1em;" ></asp:Label><br /><br />    
                            <hr class="regisLine" style="margin-bottom:5em;" />  
                            <div class="borderContent" style="margin-left:27%; margin-right:27%; margin-bottom:2em;min-height:15em; text-align:left;">
                               <asp:Label ID="labelContent1" runat="server" ></asp:Label><br /><br />
                            </div>
                            <asp:TextBox ID="comment1" Height="15em" runat="server" TextMode="MultiLine" style="width:51em; resize:none;" name="comment" class="inputField" placeholder="Add your comments here"></asp:TextBox><br /><br />
                            <asp:Button ID="commentBtn1" runat="server" Text="Add Comment" class="btn btn-default" OnClick="comment_click1" style="margin:auto; margin-bottom:1em; width:38em;"/>
                                <%if (Session["commentFound"] != null)
                                     { %>
                                    <div class="alert alert-success" style="margin-top:1em;">
                                        <%Response.Write(Session["commentFound"]);
                                            Session.Contents.Remove("commentFound"); %>
                                    </div>
                                <% } %>
                                <%else if (Session["commentAdded"] != null)
                                     { %>
                                    <div class="alert alert-success" style="margin-top:1em;">
                                        <%Response.Write(Session["commentAdded"]);
                                            Session.Contents.Remove("commentAdded"); %>
                                    </div>
                                <% } %>                            
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
