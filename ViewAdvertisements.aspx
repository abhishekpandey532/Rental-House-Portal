<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ViewAdvertisements.aspx.vb" Inherits="ViewAdvertisements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.bpopup.min.js"></script>
    <script type="text/javascript">
        $(function () {
            <% If Request.QueryString("CityID") Is Nothing Then%>
            showPopup();
            <% End If%>
        });

        function submit() {
            var cityID = $('#<%=cityList.ClientID%>').val();
            //$('#<%=hiddenCityID.ClientID%>').val(cityID);
            //$('#selectCity').bPopup().close();
            if (cityID != "0") {
                window.location = "ViewAdvertisements.aspx?CityID=" + cityID;
            }
            //return false;
        }

        function showPopup() {
            $('#selectCity').bPopup({ modalClose: false });
        }
    </script>
    <style type="text/css">
        #selectCity
        {
            display: none;
            height: 210px;
            width: 340px;
            background-color: white;
            border-radius: 10px;
            padding: 0px 20px 0px 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="hiddenCityID" runat="server" />
    <div class="search">
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="False" OnClientClick="showPopup(); return false;" Font-Size="Large">SELECT CITY</asp:LinkButton>
        <br /><br />
        <strong>Locality</strong>
        <br />
        <asp:LinkButton ID="SelectAllLocality" runat="server" Font-Underline="False">Select All</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="UnSelectAllLocality" runat="server" Font-Underline="False">Un-Select All</asp:LinkButton>
        <asp:CheckBoxList ID="localityList" runat="server" DataSourceID="SqlDataSource12" DataTextField="LocalityName" DataValueField="LocalityId"></asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [CityId], [LocalityId], [LocalityName] FROM [Locality] WHERE ([CityId] = @CityId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="CityId" QueryStringField="CityID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <strong>Residence Type</strong>
        <br />
        <asp:LinkButton ID="SelectAllResType" runat="server" Font-Underline="False">Select All</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="UnSelectAllResType" runat="server" Font-Underline="False">Un-Select All</asp:LinkButton>
        <asp:CheckBoxList ID="residenceTypeList" runat="server" DataSourceID="SqlDataSource13" DataTextField="ResTypeName" DataValueField="ResTypeId"></asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [ResidenceType]"></asp:SqlDataSource>
        <br />
        <strong>Furnishing</strong>
        <br />
        <asp:LinkButton ID="SelectAllFurnishing" runat="server" Font-Underline="False">Select All</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="UnSelectAllFurnishing" runat="server" Font-Underline="False">Un-Select All</asp:LinkButton>
        <asp:CheckBoxList ID="FurnishingList" runat="server">
            <asp:ListItem>Furnished</asp:ListItem>
            <asp:ListItem>Unfurnished</asp:ListItem>
            <asp:ListItem>Semi-furnished</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        <strong>BHK</strong>
        <br />
        <asp:LinkButton ID="SelectAllBHK" runat="server" Font-Underline="False">Select All</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="UnSelectAllBHK" runat="server" Font-Underline="False">Un-Select All</asp:LinkButton>
        <asp:CheckBoxList ID="bhkList" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        <strong>Amenities</strong>
        <br />
        <asp:LinkButton ID="SelectAllAmenities" runat="server" Font-Underline="False">Select All</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="UnSelectAllAmenities" runat="server" Font-Underline="False">Un-Select All</asp:LinkButton>
        <asp:CheckBoxList ID="amenitiesList" runat="server" DataSourceID="SqlDataSource14" DataTextField="AmenityName" DataValueField="AmenityId"></asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [Amenities]"></asp:SqlDataSource>
        <br />
        <strong>Nearby Facilities</strong>
        <br />
        <asp:LinkButton ID="SelectAllFacilities" runat="server" Font-Underline="False">Select All</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="UnSelectAllFacilities" runat="server" Font-Underline="False">Un-Select All</asp:LinkButton>
        <asp:CheckBoxList ID="nearbyFacilitiesList" runat="server" DataSourceID="SqlDataSource15" DataTextField="FacilityName" DataValueField="FacilityId"></asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [NearbyFacilities]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="btnSearch" runat="server" Text="Search" />
    </div>
    <div class="results">
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
                    <a href="Advertisement.aspx?ID=<%# Eval("AdvertisementId") %>">View</a>
                    <br />
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT [AdvertisementId], [Title], [Description], [AdType], [Amount], [BHK], [ResidenceTypeId], (SELECT [ResTypeName] FROM [ResidenceType] r WHERE r.ResTypeId = a.ResidenceTypeId) AS ResidenceType, [LocalityId], (SELECT [LocalityName] FROM [Locality] l WHERE l.LocalityId = a.LocalityId) AS Locality, [Area] FROM [Advertisements] a WHERE ([IsActive] = 'True')">
        </asp:SqlDataSource>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="selectCity">
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
        <h2>Select City</h2>
        <br />
        <table border="0" cellpadding="5">
            <%--<tr>
                        <td align="right">State : </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="StateName" DataValueField="StateId">
                                <asp:ListItem Value="0">-- Select State --</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
                        </td>
                    </tr>--%>
            <tr>
                <td align="right">City : </td>
                <td>
                    <asp:DropDownList ID="cityList" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource31" DataTextField="CityName" DataValueField="CityId" ControlToValidate="cityList">
                        <asp:ListItem Value="0">-- Select City --</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource31" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [City]">
                        <%--<SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList2" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>--%>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <%--<tr>
                        <td align="right">Locality : </td>
                        <td>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource41" DataTextField="LocalityName" DataValueField="LocalityId" OnDataBound="DropDownList4_DataBound">
                                <asp:ListItem Value="0">-- Select Locality --</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource41" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [Locality] WHERE ([CityId] = @CityId)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList3" Name="CityId" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>--%>
        </table>
        <br />
        <input id="closePopup" type="button" value="Submit" onclick="submit()" />
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>

