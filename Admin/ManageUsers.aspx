<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageUsers.aspx.vb" Inherits="Admin_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Manage Users</h2>
    <p>
        <asp:Repeater ID="FilteringUI" runat="server">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkFilter" 
                                Text='<%# Container.DataItem %>' 
                                CommandName='<%# Container.DataItem %>'></asp:LinkButton>
            </ItemTemplate>
            
            <SeparatorTemplate>|</SeparatorTemplate>
        </asp:Repeater>
    </p>
    <p>
        <asp:GridView ID="UserAccounts" runat="server" CellPadding="5" EmptyDataText="No users found."
            AutoGenerateColumns="False">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="UserName" 
                    DataNavigateUrlFormatString="UserInformation.aspx?user={0}" Text="Manage" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:CheckBoxField DataField="IsApproved" HeaderText="Approved?" />
                <asp:CheckBoxField DataField="IsLockedOut" HeaderText="Locked Out?" />
                <asp:CheckBoxField DataField="IsOnline" HeaderText="Online?" />
                <asp:BoundField DataField="Comment" HeaderText="Comment" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:LinkButton ID="lnkFirst" runat="server">&lt;&lt; First</asp:LinkButton> |
        <asp:LinkButton ID="lnkPrev" runat="server">&lt; Prev</asp:LinkButton> |
        <asp:LinkButton ID="lnkNext" runat="server">Next &gt;</asp:LinkButton> |
        <asp:LinkButton ID="lnkLast" runat="server">Last &gt;&gt;</asp:LinkButton>
    </p>
</asp:Content>

