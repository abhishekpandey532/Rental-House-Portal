<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BackOffice.aspx.vb" Inherits="BackOffice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Enter Username : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Delete User" OnClientClick="return confirm('Are you sure you want to delete this user?')" />
    </div>
    </form>

</body>
</html>
