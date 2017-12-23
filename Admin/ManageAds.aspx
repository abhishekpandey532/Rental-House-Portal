<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageAds.aspx.vb" Inherits="Admin_ManageAds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    Advertisement Status : 
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        <asp:ListItem Value="True">ACTIVE</asp:ListItem>
        <asp:ListItem Value="False">INACTIVE</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AdvertisementId" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="8" EmptyDataText="No records found.">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="AdvertisementId" DataNavigateUrlFormatString="Advertisement.aspx?ID={0}" HeaderText="View" Text="View" />
            <asp:BoundField DataField="AdvertisementId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="AdvertisementId" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="AdType" HeaderText="Ad Type" SortExpression="AdType" />
            <asp:BoundField DataField="ResidenceType" HeaderText="Residence Type" SortExpression="ResidenceType" ReadOnly="True" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="BHK" HeaderText="BHK" SortExpression="BHK" />
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [AdvertisementId], [Title], [AdType], [Amount], [BHK], [Area], [ResidenceTypeId], (SELECT ResTypeName FROM ResidenceType r WHERE r.ResTypeId = a.ResidenceTypeId) AS ResidenceType FROM [Advertisements] a WHERE IsActive = @IsActive">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="IsActive" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

