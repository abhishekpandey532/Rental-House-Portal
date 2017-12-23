<%@ Page Title="Manage States | Administration Panel" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageStates.aspx.vb" Inherits="Admin_ManageStates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Add State</h2>
    <p>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="5" DataKeyNames="StateId" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <Fields>
            <asp:BoundField DataField="StateId" HeaderText="StateId" InsertVisible="False" ReadOnly="True" SortExpression="StateId" />
            <asp:TemplateField HeaderText="Enter State Name : " SortExpression="StateName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StateName") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StateName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="TextBox1" Display="Dynamic" EnableViewState="False" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit" ValidationGroup="Insert" />
                    <!-- <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton> -->
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
        </p>
    <h2>Manage States</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="StateId" DataSourceID="SqlDataSource1" EmptyDataText="No records found.">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" ValidationGroup="Edit" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StateId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="StateId" />
                <asp:TemplateField HeaderText="State" SortExpression="StateName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StateName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="TextBox1" Display="Dynamic" EnableViewState="False" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [State] WHERE [StateId] = @StateId" InsertCommand="INSERT INTO [State] ([StateName]) VALUES (@StateName)" SelectCommand="SELECT * FROM [State]" UpdateCommand="UPDATE [State] SET [StateName] = @StateName WHERE [StateId] = @StateId">
        <DeleteParameters>
            <asp:Parameter Name="StateId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="StateName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="StateName" Type="String" />
            <asp:Parameter Name="StateId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

