<%@ Page Title="Manage Cities | Administration Panel" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageCities.aspx.vb" Inherits="Admin_ManageCities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>Add City</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="5" DataKeyNames="CityId" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="CityId" HeaderText="CityId" InsertVisible="False" ReadOnly="True" SortExpression="CityId" />
                <asp:TemplateField HeaderText="Enter City Name : " SortExpression="CityName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CityName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CityName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" EnableViewState="False" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CityName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Select State : " SortExpression="StateId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("StateId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="statesList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="StateName" DataValueField="StateId" SelectedValue='<%# Bind("StateId") %>' ValidationGroup="Insert">
                            <asp:ListItem Value="0">-- Select State --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="statesList" Display="Dynamic" EnableViewState="False" ErrorMessage="This field is required." ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("StateId") %>'></asp:Label>
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
    </p>
    <h2>Manage Cities</h2>
    <p>
        Select State :
        <asp:DropDownList ID="stateList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="StateName" DataValueField="StateId" AutoPostBack="True" Style="height: 22px">
            <asp:ListItem>All</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="CityId" DataSourceID="SqlDataSource1" EmptyDataText="No records found.">
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
                <asp:BoundField DataField="CityId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="CityId" />
                <asp:TemplateField HeaderText="City" SortExpression="CityName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CityName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" EnableViewState="False" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CityName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State" SortExpression="StateName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="statesList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="StateName" DataValueField="StateId" SelectedValue='<%# Bind("StateId") %>'>
                            <asp:ListItem Value="0">-- Select State --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="statesList" Display="Dynamic" EnableViewState="False" ErrorMessage="This field is required." ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [City] WHERE [CityId] = @CityId" InsertCommand="INSERT INTO [City] ([CityName], [StateId]) VALUES (@CityName, @StateId)" SelectCommand="SELECT *, (SELECT [StateName] FROM [State] s WHERE s.[StateId] = c.[StateId]) AS [StateName] FROM [City] c" UpdateCommand="UPDATE [City] SET [CityName] = @CityName, [StateId] = @StateId WHERE [CityId] = @CityId">
        <DeleteParameters>
            <asp:Parameter Name="CityId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CityName" Type="String" />
            <asp:Parameter Name="StateId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CityName" Type="String" />
            <asp:Parameter Name="StateId" Type="Int32" />
            <asp:Parameter Name="CityId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT *, (SELECT [StateName] FROM [State] s WHERE s.[StateId] = c.[StateId]) AS [StateName] FROM [City] c WHERE ([StateId] = @StateId)" DeleteCommand="DELETE FROM [City] WHERE [CityId] = @CityId" InsertCommand="INSERT INTO [City] ([CityName], [StateId]) VALUES (@CityName, @StateId)" UpdateCommand="UPDATE [City] SET [CityName] = @CityName, [StateId] = @StateId WHERE [CityId] = @CityId">
        <SelectParameters>
            <asp:ControlParameter ControlID="stateList" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="CityId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CityName" Type="String" />
            <asp:Parameter Name="StateId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CityName" Type="String" />
            <asp:Parameter Name="StateId" Type="Int32" />
            <asp:Parameter Name="CityId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

