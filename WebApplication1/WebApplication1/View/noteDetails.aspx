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
                    <form id="form1" runat="server">
                        <div>
                            <asp:TextBox ID="title" runat="server" name="title" class="inputField" placeholder="Title" disabled="disabled" ></asp:TextBox><br /><br />
                            <asp:TextBox ID="author" runat="server" name="creator" class="inputField" placeholder="Creator" disabled="disabled" ></asp:TextBox><br /><br />
                            <asp:TextBox ID="date" runat="server" name="date" class="inputField" placeholder="Date" disabled="disabled" ></asp:TextBox><br /><br />
                            <asp:TextBox ID="content" runat="server" name="content" class="inputField" placeholder="Content" disabled="disabled" ></asp:TextBox><br /><br />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
