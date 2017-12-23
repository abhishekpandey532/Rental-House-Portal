<%@ Page Title="Manage Facilities | Administration Panel" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageFacilities.aspx.vb" Inherits="Admin_ManageFacilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Add Nearby Facility</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="5" DataKeyNames="FacilityId" DataSourceID="SqlDataSource1" DefaultMode="Insert" style="margin-right: 0px">
            <Fields>
                <asp:BoundField DataField="FacilityId" HeaderText="FacilityId" InsertVisible="False" ReadOnly="True" SortExpression="FacilityId" />
                <asp:TemplateField HeaderText="Eanter Nearby Facility Name : " SortExpression="FacilityName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FacilityName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FacilityName") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("FacilityName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <InsertItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit" ValidationGroup="Insert" />
                        <!--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>-->
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [NearbyFacilities] WHERE [FacilityId] = @FacilityId" InsertCommand="INSERT INTO [NearbyFacilities] ([FacilityName]) VALUES (@FacilityName)" SelectCommand="SELECT * FROM [NearbyFacilities]" UpdateCommand="UPDATE [NearbyFacilities] SET [FacilityName] = @FacilityName WHERE [FacilityId] = @FacilityId">
            <DeleteParameters>
                <asp:Parameter Name="FacilityId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FacilityName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FacilityName" Type="String" />
                <asp:Parameter Name="FacilityId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <h2>Manage Nearby Facilities</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="FacilityId" DataSourceID="SqlDataSource1" EmptyDataText="No records found.">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FacilityId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="FacilityId" />
                <asp:TemplateField HeaderText="Nearby Facility Name" SortExpression="FacilityName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FacilityName") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("FacilityName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

