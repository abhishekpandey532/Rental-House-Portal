<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        <asp:LoginName ID="LoginName1" runat="server"  FormatString="Welcome {0}" />
    </h2>
    <div style="text-align:center; padding:10px;">
        <asp:Image ID="Image1" runat="server" BorderWidth="0" ImageUrl="~/Images/Vista_Home-650x406.jpg" />
    </div>
</asp:Content>

