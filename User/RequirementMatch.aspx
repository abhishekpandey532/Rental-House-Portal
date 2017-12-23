<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="RequirementMatch.aspx.vb" Inherits="User_RequirementMatch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="AdvertisementId" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div style="width: 600px; border: 1px solid red; border-radius: 5px; padding: 10px; margin: 0px 0px 12px 0px;">
                    Title:
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    Description:
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    AdType:
            <asp:Label ID="AdTypeLabel" runat="server" Text='<%# Eval("AdType") %>' />
                    <br />
                    Amount:
            <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                    <br />
                    BHK:
            <asp:Label ID="BHKLabel" runat="server" Text='<%# Eval("BHK") %>' />
                    <br />
                    Residence Type:
            <asp:Label ID="ResidenceTypeIdLabel" runat="server" Text='<%# Eval("ResidenceType")%>' />
                    <br />
                    Locality:
            <asp:Label ID="LocalityIdLabel" runat="server" Text='<%# Eval("Locality") %>' />
                    <br />
                    Area:
            <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' />
                    Sq. Ft.
                <br />
                    <a href="../Advertisement.aspx?ID=<%# Eval("AdvertisementId") %>">View</a>
                    <br />
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>">
        </asp:SqlDataSource>
</asp:Content>

