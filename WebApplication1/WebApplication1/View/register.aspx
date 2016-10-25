<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.View.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <div class="backgroundRegister">
        <div class="paddingRegister">
            <div class="titleRegister">
                Registration
            </div>        
            <form id="form1" runat="server" action="index.aspx">
                <div class="contentRegister">
                    <input name="username" type="text" class="inputField" placeholder="Username" /><br /><br />
                    <input name="password" type="password" class="inputField" placeholder="Password" /><br /><br />
                    <input name="confirmPassword" type="password" class="inputField" placeholder="Confirm password" /><br /><br />
                    <input name="email" type="email" class="inputField" placeholder="Email" /><br /><br />
                    <input name="dateOfBirth" type="date" class="inputField" /><br /><br />
                    <input type="submit" class="btn btn-primary" value="Submit"/>
                </div>
            </form> 
        </div>
    </div>
</body>
</html>