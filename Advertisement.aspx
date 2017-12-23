<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Advertisement.aspx.vb" Inherits="Advertisement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin:20px 0px 30px 20px; padding-right:50px; float: left; border-right:1px solid #0094ff;">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="5" DataKeyNames="AdvertisementId" DataSourceID="SqlDataSource1">
            <Fields>
                <asp:BoundField DataField="AdvertisementId" HeaderText="Advertisement ID : " InsertVisible="False" ReadOnly="True" SortExpression="AdvertisementId" />
                <asp:BoundField DataField="Title" HeaderText="Title : " SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description : " SortExpression="Description" />
                <asp:BoundField DataField="AdType" HeaderText="Ad Type : " SortExpression="AdType" />
                <asp:BoundField DataField="Amount" HeaderText="Amount : " SortExpression="Amount" />
                <asp:BoundField DataField="BHK" HeaderText="BHK : " SortExpression="BHK" />
                <asp:BoundField DataField="Age" HeaderText="Age : " SortExpression="Age" />
                <asp:BoundField DataField="Furnished" HeaderText="Furnished : " SortExpression="Furnished" />
                <asp:BoundField DataField="Bathroom" HeaderText="Bathroom : " SortExpression="Bathroom" />
                <asp:BoundField DataField="TotalFloors" HeaderText="Total Floors : " SortExpression="TotalFloors" />
                <asp:BoundField DataField="Facing" HeaderText="Facing : " SortExpression="Facing" />
                <asp:BoundField DataField="Area" DataFormatString="{0} sq. ft." HeaderText="Area : " SortExpression="Area" />
                <asp:CheckBoxField DataField="IsNegotiable" HeaderText="Is Negotiable : " SortExpression="IsNegotiable" />
                <asp:BoundField DataField="Locality" HeaderText="Locality : " ReadOnly="True" SortExpression="Locality" />
                <asp:BoundField DataField="City" HeaderText="City : " ReadOnly="True" SortExpression="City" />
                <asp:BoundField DataField="ResidenceType" HeaderText="Residence Type : " ReadOnly="True" SortExpression="ResidenceType" />
                <asp:BoundField DataField="Rate" DataFormatString="{0} per sq. ft." HeaderText="Rate : " SortExpression="Rate" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT [AdvertisementId], [Title], [Description], [AdType], [Amount], [BHK], [Age], [Furnished], [Bathroom], [TotalFloors], [Facing], [Area], [IsNegotiable], [UserId], [LocalityId], (SELECT [LocalityName] FROM [Locality] l WHERE l.LocalityId = a.LocalityId) AS Locality, (SELECT CityName FROM City WHERE CityId=(SELECT CityId FROM Locality l WHERE l.LocalityId = a.LocalityId)) AS City, [ResidenceTypeId], (SELECT [ResTypeName] FROM [ResidenceType] r WHERE r.ResTypeId = a.ResidenceTypeId) AS ResidenceType, [Rate] FROM [Advertisements] a WHERE ([AdvertisementId] = @AdvertisementId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="AdvertisementId" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div style="margin:20px 0px 30px 20px; padding-right:50px; float: left; border-right:1px solid #0094ff;">
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
    </div>
    <div style="margin:20px 0px 30px 20px; padding-right:50px; float: left;">
        <h2>Posted By User</h2>
        <p>
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="5" DataKeyNames="UserId" DataSourceID="SqlDataSource4">
            <Fields>
                <asp:BoundField DataField="FullName" HeaderText="Full Name : " SortExpression="FullName" />
                <asp:BoundField DataField="Gender" HeaderText="Gender : " SortExpression="Gender" />
                <asp:BoundField DataField="State" HeaderText="State : " SortExpression="State" />
                <asp:BoundField DataField="City" HeaderText="City : " SortExpression="City" />
                <asp:BoundField DataField="ContactNo" HeaderText="Contact No. : " SortExpression="ContactNo" />
                <asp:BoundField DataField="Email" HeaderText="Email : " SortExpression="Email" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT *, (SELECT Email FROM aspnet_Membership m WHERE m.UserId = u.UserId) AS Email  FROM [UserProfile] u WHERE UserId = (SELECT UserId FROM [Advertisements] WHERE AdvertisementId = @AdvertisementId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="AdvertisementId" QueryStringField="ID" />
            </SelectParameters>
        </asp:SqlDataSource>
            </p>
    </div>
    <%--<asp:DataList ID="DataList1" runat="server" DataKeyField="AdvertisementId" DataSourceID="SqlDataSource1">
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
            Rs. <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
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
            <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' /> sq. ft.
            <br />
            IsNegotiable:
            <asp:Label ID="IsNegotiableLabel" runat="server" Text='<%# Eval("IsNegotiable") %>' />
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
            Rs. <asp:Label ID="RateLabel" runat="server" Text='<%# Eval("Rate") %>' /> per Sq. Ft.
            <br />
        </ItemTemplate>
    </asp:DataList>--%>
</asp:Content>

