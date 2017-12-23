<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="MyRequirements.aspx.vb" Inherits="User_MyRequirements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>My Requirements</h2>
    <asp:HiddenField ID="hfUserId" runat="server" />
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="RequirementId" DataSourceID="SqlDataSource1" EmptyDataText="No records found.">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to deleted this record?')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RequirementId" HeaderText="RequirementId" InsertVisible="False" ReadOnly="True" SortExpression="RequirementId" />
                <asp:BoundField DataField="BHK" HeaderText="BHK" SortExpression="BHK" />
                <asp:BoundField DataField="Furnished" HeaderText="Furnished" SortExpression="Furnished" />
                <asp:BoundField DataField="ResidenceType" HeaderText="Residence Type" SortExpression="ResidenceType" />
                <asp:BoundField DataField="MinArea" HeaderText="Min. Area" SortExpression="MinArea" />
                <asp:BoundField DataField="MaxArea" HeaderText="Max. Area" SortExpression="MaxArea" />
                <asp:BoundField DataField="MinAmount" HeaderText="Min. Amount" SortExpression="MinAmount" />
                <asp:BoundField DataField="MaxAmount" HeaderText="Max. Amount" SortExpression="MaxAmount" />
                <asp:HyperLinkField DataNavigateUrlFields="RequirementId" DataNavigateUrlFormatString="RequirementMatch.aspx?ReqID={0}" HeaderText="View" Text="View" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM Requirements WHERE RequirementId = @RequirementId" SelectCommand="SELECT *, (SELECT ResTypeName FROM ResidenceType rt WHERE rt.ResTypeId = r.ResidenceTypeId) AS ResidenceType FROM [Requirements] r WHERE ([UserId] = @UserId)">
            <DeleteParameters>
                <asp:Parameter Name="RequirementId" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUserId" Name="UserId" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>

    </p>
    <asp:Panel ID="detailsPanel" runat="server" Visible="false">
        <h2>Amenities</h2>
        <ul>
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3">
                <ItemTemplate>
                    <li>
                        <asp:Label ID="AmenityIdLabel" runat="server" Text='<%# Eval("AmenityName")%>' /></li>
                </ItemTemplate>
            </asp:DataList>
        </ul>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT AmenityName FROM Amenities WHERE AmenityId IN (SELECT DataId FROM Requirements_Data WHERE RequirementId = @RequirementId AND DataType = 'A')">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="RequirementId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <h2>Nearby Facilities</h2>
        <ul>
            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4">
                <ItemTemplate>
                    <li>
                        <asp:Label ID="FacilityIdLabel" runat="server" Text='<%# Eval("FacilityName")%>' /></li>
                </ItemTemplate>
            </asp:DataList>
        </ul>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT FacilityName FROM NearbyFacilities WHERE FacilityId IN (SELECT DataId FROM Requirements_Data WHERE RequirementId = @RequirementId AND DataType = 'F')">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="RequirementId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <h2>Nearby Facilities</h2>
        <ul>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <li>
                        <asp:Label ID="FacilityIdLabel" runat="server" Text='<%# Eval("LocalityName")%>' /></li>
                </ItemTemplate>
            </asp:DataList>
        </ul>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT LocalityName FROM Locality WHERE LocalityId IN (SELECT DataId FROM Requirements_Data WHERE RequirementId = @RequirementId AND DataType = 'L')">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="RequirementId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>

</asp:Content>

