<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="MyAdvertisements.aspx.vb" Inherits="User_MyAdvertisements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:HiddenField ID="hiddenUserId" runat="server" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AdvertisementId" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="8" EmptyDataText="You have't posted any advertisements yet.">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="AdvertisementId" DataNavigateUrlFormatString="PostAdvertisement.aspx?ID={0}" HeaderText="View" Text="View" />
            <asp:BoundField DataField="AdvertisementId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="AdvertisementId" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="AdType" HeaderText="Ad Type" SortExpression="AdType" />
            <asp:BoundField DataField="ResidenceType" HeaderText="Residence Type" SortExpression="ResidenceType" ReadOnly="True" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="BHK" HeaderText="BHK" SortExpression="BHK" />
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [AdvertisementId], [Title], [AdType], [Amount], [BHK], [Area], [ResidenceTypeId], (SELECT ResTypeName FROM ResidenceType r WHERE r.ResTypeId = a.ResidenceTypeId) AS ResidenceType FROM [Advertisements] a WHERE UserId = @UserId">
        <SelectParameters>
            <asp:ControlParameter ControlID="hiddenUserId" Name="UserId" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

