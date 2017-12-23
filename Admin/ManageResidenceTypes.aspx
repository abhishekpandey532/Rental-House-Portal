<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageResidenceTypes.aspx.vb" Inherits="Admin_ManageResidenceTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Add Residence Type</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="5" DataKeyNames="ResTypeId" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="ResTypeId" HeaderText="ResTypeId" InsertVisible="False" ReadOnly="True" SortExpression="ResTypeId" />
                <asp:TemplateField HeaderText="Enter Residence Type : " SortExpression="ResTypeName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ResTypeName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ResTypeName") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="INSERT"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ResTypeName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <InsertItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" ValidationGroup="INSERT" Text="Submit" />
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>--%>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [ResidenceType] WHERE [ResTypeId] = @ResTypeId" InsertCommand="INSERT INTO [ResidenceType] ([ResTypeName]) VALUES (@ResTypeName)" SelectCommand="SELECT * FROM [ResidenceType]" UpdateCommand="UPDATE [ResidenceType] SET [ResTypeName] = @ResTypeName WHERE [ResTypeId] = @ResTypeId">
            <DeleteParameters>
                <asp:Parameter Name="ResTypeId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ResTypeName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ResTypeName" Type="String" />
                <asp:Parameter Name="ResTypeId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <h2>Manage Residence Types</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="ResTypeId" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" ValidationGroup="EDIT" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?')" ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ResTypeId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ResTypeId" />
                <asp:TemplateField HeaderText="Residence Type" SortExpression="ResTypeName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ResTypeName") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="EDIT"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ResTypeName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

