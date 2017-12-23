<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to House Rental System!
    </h2>
    <div style="text-align:center; padding:10px;">
        <asp:Image ID="Image1" runat="server" BorderWidth="0" ImageUrl="~/Images/Vista_Home-650x406.jpg" />
    </div>
</asp:Content>