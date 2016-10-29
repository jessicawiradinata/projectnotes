﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accountSettings.aspx.cs" Inherits="WebApplication1.View.accountSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/bootstrap.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <div class="backgroundAccount">
        <div class="paddingAccount">
            <form id="form1" runat="server">
                <div class="contentAccount">
                    <div class="titleAccount">
                        Account
                    </div>
                    <label for="username" class="accountLabel">Username:</label>
                    <asp:TextBox ID="username" runat="server" name="username" class="inputField" disabled="disabled"></asp:TextBox><br /><br />
                    <label for="password" class="accountLabel">Password:</label>
                    <asp:TextBox ID="password" TextMode="Password" runat="server" name="password" class="inputField"></asp:TextBox><br /><br />
                    <label for="confirmPassword" class="accountLabel">Confirm Password:</label>
                    <asp:TextBox ID="confirmPassword" TextMode="Password" runat="server" name="confirmPassword" class="inputField"></asp:TextBox><br /><br />
                    <label for="email" class="accountLabel">Email:</label>
                    <asp:TextBox ID="email" runat="server" type="email" name="email" class="inputField"></asp:TextBox><br /><br />
                    <div class="buttonsAccount">
                        <asp:Button ID="saveBtn" runat="server" Text="Save Changes" OnClick="save_click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </form>    
        </div>
    </div>
</body>
</html>
