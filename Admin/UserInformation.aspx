<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="UserInformation.aspx.vb" Inherits="Admin_UserInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>User Information</h2>
    <p>
        <asp:HyperLink ID="BackLink" runat="server"
            NavigateUrl="~/Admin/ManageUsers.aspx">&lt;&lt; Back to User List</asp:HyperLink>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="5" DataKeyNames="UserId" DataSourceID="SqlDataSource1" EmptyDataText="No profile details for user.">
            <Fields>
                <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="DateOfBirth" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date Of Birth" SortExpression="DateOfBirth" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="ContactNo" HeaderText="Contact No." SortExpression="ContactNo" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM UserProfile WHERE UserId = (SELECT UserId FROM aspnet_Users au WHERE UserName = @UserName);">
            <SelectParameters>
                <asp:QueryStringParameter Name="UserName" QueryStringField="user" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <table cellpadding="5">
        <tr>
            <td class="tdLabel">Username:</td>
            <td>
                <asp:Label runat="server" ID="UserNameLabel"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdLabel">Approved:</td>
            <td>
                <asp:CheckBox ID="IsApproved" runat="server" AutoPostBack="true" />
            </td>
        </tr>
        <tr>
            <td class="tdLabel">Locked Out:</td>
            <td>
                <asp:Label runat="server" ID="LastLockoutDateLabel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" ID="UnlockUserButton" Text="Unlock User" /></td>
            <td></td>
        </tr>
    </table>
    <p>
        <asp:Label ID="StatusMessage" CssClass="Important" runat="server"></asp:Label>
    </p>
</asp:Content>

