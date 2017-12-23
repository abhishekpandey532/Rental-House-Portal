<%@ Page Title="" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="PostRequirement.aspx.vb" Inherits="User_PostRequirement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>Post Requirement</h2>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="RequirementId" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <InsertItemTemplate>
                <table border="0" cellpadding="5" cellspacing="0">
                    <tr>
                        <td>BHK : </td>
                        <td>
                            <asp:TextBox ID="BHKTextBox" runat="server" Text='<%# Bind("BHK") %>' /></td>
                    </tr>
                    <tr>
                        <td>Furnished : </td>
                        <td>

                            <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Bind("Furnished") %>'>
                                <asp:ListItem Value="-">-- Select --</asp:ListItem>
                                <asp:ListItem>Unfurnished</asp:ListItem>
                                <asp:ListItem>Furnished</asp:ListItem>
                                <asp:ListItem>Semi-furnished</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Residence Type : </td>
                        <td>
                            <asp:DropDownList ID="DropDownList11" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource11" DataTextField="ResTypeName" DataValueField="ResTypeId" SelectedValue='<%# Bind("ResidenceTypeId") %>'>
                                <asp:ListItem Value="0">-- Select --</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [ResidenceType]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>Minimum Area : </td>
                        <td>
                            <asp:TextBox ID="MinAreaTextBox" runat="server" Text='<%# Bind("MinArea") %>' /></td>
                    </tr>
                    <tr>
                        <td>Maximum Area : </td>
                        <td>
                            <asp:TextBox ID="MaxAreaTextBox" runat="server" Text='<%# Bind("MaxArea") %>' /></td>
                    </tr>
                    <tr>
                        <td>MinAmount : </td>
                        <td>
                            <asp:TextBox ID="MinAmountTextBox" runat="server" Text='<%# Bind("MinAmount") %>' /></td>
                    </tr>
                    <tr>
                        <td>MaxAmount : </td>
                        <td>
                            <asp:TextBox ID="MaxAmountTextBox" runat="server" Text='<%# Bind("MaxAmount") %>' /></td>
                    </tr>
                </table>
                <h2>Nearby Facilities</h2>
                <p>
                    <asp:CheckBoxList ID="NearbyFacilities" runat="server" DataSourceID="SqlDataSource2" DataTextField="FacilityName" DataValueField="FacilityId"></asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [NearbyFacilities] ORDER BY [FacilityName]"></asp:SqlDataSource>
                </p>
                <h2>Amenities</h2>
                <p>
                    <asp:CheckBoxList ID="Amenities" runat="server" DataSourceID="SqlDataSource3" DataTextField="AmenityName" DataValueField="AmenityId"></asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [Amenities] ORDER BY [AmenityName]"></asp:SqlDataSource>
                </p>
                <h2>Localities</h2>
                <p>Select State :
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="StateName" DataValueField="StateId">
                    <asp:ListItem Value="0">-- Select State --</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [State] ORDER BY [StateName]"></asp:SqlDataSource>
                </p>
                <p>
                Select City :
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="CityName" DataValueField="CityId" OnDataBound="DropDownList2_DataBound"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [City] WHERE ([StateId] = @StateId) ORDER BY [CityName]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    </p>
                <p>
                    <asp:CheckBoxList ID="Localities" runat="server" DataSourceID="SqlDataSource6" DataTextField="LocalityName" DataValueField="LocalityId"></asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [Locality] WHERE ([CityId] = @CityId) ORDER BY [LocalityName]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="CityId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </p>
                <p>
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit" />
                    &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Reset" />
                </p>
            </InsertItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Requirements] WHERE [RequirementId] = @RequirementId" InsertCommand="INSERT INTO [Requirements] ([UserId], [BHK], [Furnished], [ResidenceTypeId], [MinArea], [MaxArea], [MinAmount], [MaxAmount]) VALUES (@UserId, @BHK, @Furnished, @ResidenceTypeId, @MinArea, @MaxArea, @MinAmount, @MaxAmount)" SelectCommand="SELECT * FROM [Requirements]" UpdateCommand="UPDATE [Requirements] SET [UserId] = @UserId, [BHK] = @BHK, [Furnished] = @Furnished, [ResidenceTypeId] = @ResidenceTypeId, [MinArea] = @MinArea, [MaxArea] = @MaxArea, [MinAmount] = @MinAmount, [MaxAmount] = @MaxAmount WHERE [RequirementId] = @RequirementId">
            <InsertParameters>
                <asp:Parameter Name="UserId" />
                <asp:Parameter Name="BHK" Type="Int32" />
                <asp:Parameter Name="Furnished" Type="String" />
                <asp:Parameter Name="ResidenceTypeId" Type="Int32" />
                <asp:Parameter Name="MinArea" Type="Int32" />
                <asp:Parameter Name="MaxArea" Type="Int32" />
                <asp:Parameter Name="MinAmount" Type="Int32" />
                <asp:Parameter Name="MaxAmount" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    </p>

</asp:Content>

