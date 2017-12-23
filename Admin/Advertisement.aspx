<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Advertisement.aspx.vb" Inherits="Admin_Advertisement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="AdvertisementId" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            AdvertisementId:
            <asp:Label ID="AdvertisementIdLabel" runat="server" Text='<%# Eval("AdvertisementId") %>' />
            <br />
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
            Rs.
            <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
            <br />
            BHK:
            <asp:Label ID="BHKLabel" runat="server" Text='<%# Eval("BHK") %>' />
            <br />
            Age:
            <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") %>' />
            <br />
            Furnished:
            <asp:Label ID="FurnishedLabel" runat="server" Text='<%# Eval("Furnished") %>' />
            <br />
            Bathroom:
            <asp:Label ID="BathroomLabel" runat="server" Text='<%# Eval("Bathroom") %>' />
            <br />
            TotalFloors:
            <asp:Label ID="TotalFloorsLabel" runat="server" Text='<%# Eval("TotalFloors") %>' />
            <br />
            Facing:
            <asp:Label ID="FacingLabel" runat="server" Text='<%# Eval("Facing") %>' />
            <br />
            Area:
            <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' />
            sq. ft.
            <br />
            IsNegotiable:
            <asp:Label ID="IsNegotiableLabel" runat="server" Text='<%# Eval("IsNegotiable") %>' />
            <br />
            UserId:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
            <br />
            Locality:
            <asp:Label ID="LocalityIdLabel" runat="server" Text='<%# Eval("Locality")%>' />
            <br />
            City:
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("City")%>' />
            <br />
            ResidenceType:
            <asp:Label ID="ResidenceTypeIdLabel" runat="server" Text='<%# Eval("ResidenceType") %>' />
            <br />
            Rate:
            Rs.
            <asp:Label ID="RateLabel" runat="server" Text='<%# Eval("Rate") %>' />
            per Sq. Ft.
            <br />

        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT [AdvertisementId], [Title], [Description], [AdType], [Amount], [BHK], [Age], [Furnished], [Bathroom], [TotalFloors], [Facing], [Area], [IsNegotiable], [UserId],(SELECT UserName FROM aspnet_Users u WHERE u.UserId = a.UserId) AS UserName, [LocalityId], (SELECT [LocalityName] FROM [Locality] l WHERE l.LocalityId = a.LocalityId) AS Locality, (SELECT CityName FROM City WHERE CityId=(SELECT CityId FROM Locality l WHERE l.LocalityId = a.LocalityId)) AS City, [ResidenceTypeId], (SELECT [ResTypeName] FROM [ResidenceType] r WHERE r.ResTypeId = a.ResidenceTypeId) AS ResidenceType, [Rate] FROM [Advertisements] a WHERE ([AdvertisementId] = @AdvertisementId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="AdvertisementId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h2>Amenities</h2>
    <ul>
        <asp:DataList ID="DataList2" runat="server" DataKeyField="AdvertisementId" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <li>
                    <asp:Label ID="AmenityIdLabel" runat="server" Text='<%# Eval("Amenity")%>' /></li>
            </ItemTemplate>
        </asp:DataList>
    </ul>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT [AdvertisementId], [AmenityId], (SELECT AmenityName FROM Amenities a WHERE a.AmenityId = aa.AmenityId) AS Amenity FROM [Ads_Amenities] aa WHERE ([AdvertisementId] = @AdvertisementId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="AdvertisementId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h2>Nearby Facilities</h2>
    <ul>
        <asp:DataList ID="DataList3" runat="server" DataKeyField="AdvertisementId" DataSourceID="SqlDataSource3">
            <ItemTemplate>
                <li>
                    <asp:Label ID="FacilityIdLabel" runat="server" Text='<%# Eval("Facility")%>' /></li>
            </ItemTemplate>
        </asp:DataList>
    </ul>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [AdvertisementId], [FacilityId], (SELECT FacilityName FROM NearbyFacilities f WHERE f.FacilityId = a.FacilityId) AS Facility FROM [Ads_NearbyFacilities] a WHERE ([AdvertisementId] = @AdvertisementId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="AdvertisementId" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p>
        <asp:Button ID="btnAdStatus" runat="server" />
    </p>

</asp:Content>

