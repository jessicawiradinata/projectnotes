<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="noteDetails.aspx.cs" Inherits="WebApplication1.View.noteDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <!--link to css-->
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <link href="../css/style.css" rel="stylesheet"/>

        <!--link to javascript-->
        <script src="../scripts/jquery-1.9.1.js"></script>
        <script src="../scripts/bootstrap.js"></script>

        <title>Note Details</title>
    </head>
    <body>
        <div class="backgroundDetails">
            <div class="paddingDetails">
                <div class="contentDetails">                    
                    <div class="titleDetail">
                        Note Details
                    </div>
                    <%if (Session["editNotes"] == null)
                        { %>
                        <form id="form1" runat="server">
                            <div>
                                <asp:TextBox ID="title" runat="server" name="title" class="inputField" placeholder="Title" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:TextBox ID="author" runat="server" name="author" class="inputField" placeholder="Creator" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:TextBox ID="date" runat="server" name="date" class="inputField" placeholder="Date" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:TextBox ID="content" runat="server" name="content" class="inputField" placeholder="Content" disabled="disabled" ></asp:TextBox><br /><br />
                                <asp:Button ID="editBtn" runat="server" Text="Edit Profile" class="btn btn-success" OnClick="edit_click" />
                                 <%if (Session["updatedNotes"] == null) { %>
                                    <div class="alert alert-info" style="margin-top:1em;">
                                        <%Response.Write(Session["udpatedNotes"]);
                                          Session.Contents.Remove("updatedNotes"); %>
                                    </div>
                                <% } %>
                            </div>
                        </form>
                    <% } else { %>
                            <form id="form2" runat="server">
                                <div>
                                    <asp:TextBox ID="titleEdit" runat="server" name="titleEdit" class="inputField" placeholder="Title" ></asp:TextBox><br /><br />
                                    <asp:TextBox ID="authorEdit" runat="server" name="authorEdit" class="inputField" placeholder="Creator" disabled="disabled" ></asp:TextBox><br /><br />
                                    <asp:TextBox ID="dateEdit" runat="server" name="dateEdit" class="inputField" placeholder="Date" disabled="disabled" ></asp:TextBox><br /><br />
                                    <asp:TextBox ID="contentEdit" runat="server" name="contentEdit" class="inputField" placeholder="Content" ></asp:TextBox><br /><br />
                                    <asp:Button ID="saveBtn" runat="server" Text="Save changes" class="btn btn-primary" OnClick="save_click" href="noteDetails.aspx"/>
                                    <asp:Button ID="cancelBtn" runat="server" Text="Cancel" class="btn btn-danger" OnClick="cancel_click" href="noteDetails.aspx"/>
                                </div>
                            </form>
                    <%
                            Session.Contents.Remove("editNotes");
                        } 
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
