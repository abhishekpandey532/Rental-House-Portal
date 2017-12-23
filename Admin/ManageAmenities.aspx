<%@ Page Title="Manage Amenities | Administration Panel" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageAmenities.aspx.vb" Inherits="Admin_ManageAmenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Add Amenity</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="5" AutoGenerateRows="False" DataKeyNames="AmenityId" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="AmenityId" HeaderText="AmenityId" InsertVisible="False" ReadOnly="True" SortExpression="AmenityId" />
                <asp:TemplateField HeaderText="Enter Amenity Name : " SortExpression="AmenityName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AmenityName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AmenityName") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AmenityName") %>'></asp:Label>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Amenities] WHERE [AmenityId] = @AmenityId" InsertCommand="INSERT INTO [Amenities] ([AmenityName]) VALUES (@AmenityName)" SelectCommand="SELECT * FROM [Amenities]" UpdateCommand="UPDATE [Amenities] SET [AmenityName] = @AmenityName WHERE [AmenityId] = @AmenityId">
            <DeleteParameters>
                <asp:Parameter Name="AmenityId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AmenityName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AmenityName" Type="String" />
                <asp:Parameter Name="AmenityId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <h2>Manage Amenities</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="AmenityId" DataSourceID="SqlDataSource1" EmptyDataText="No records found.">
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
                <asp:BoundField DataField="AmenityId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="AmenityId" />
                <asp:TemplateField HeaderText="Amenity Name" SortExpression="AmenityName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AmenityName") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AmenityName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

