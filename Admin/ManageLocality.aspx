<%@ Page Title="Manage Locality | Administration Panel" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageLocality.aspx.vb" Inherits="Admin_ManageLocality" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>Add Locality</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateRows="False" CellPadding="5" DataKeyNames="LocalityId" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="LocalityId" HeaderText="LocalityId" InsertVisible="False" ReadOnly="True" SortExpression="LocalityId" />
                <asp:TemplateField HeaderText="Enter Locality : " SortExpression="LocalityName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LocalityName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LocalityName") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("LocalityName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Select State : ">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="StateName" DataValueField="StateId">
                            <asp:ListItem Value="0">-- Select State --</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList3" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Select City : " SortExpression="CityId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CityId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityId" OnDataBound="DropDownList4_DataBound">
                            <asp:ListItem Value="0">-- Select City --</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [CityId], [CityName] FROM [City] WHERE ([StateId] = @StateId)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList3" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList4" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CityId") %>'></asp:Label>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Locality] WHERE [LocalityId] = @LocalityId" InsertCommand="INSERT INTO [Locality] ([LocalityName], [CityId]) VALUES (@LocalityName, @CityId)" SelectCommand="SELECT *, (SELECT [CityName] FROM [City] c WHERE c.CityId = l.CityId) AS CityName FROM [Locality] l WHERE ([CityId] = @CityId)" UpdateCommand="UPDATE [Locality] SET [LocalityName] = @LocalityName WHERE [LocalityId] = @LocalityId">
            <DeleteParameters>
                <asp:Parameter Name="LocalityId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LocalityName" Type="String" />
                <asp:Parameter Name="CityId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="CityId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="LocalityName" Type="String" />
                <asp:Parameter Name="LocalityId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <h2>Manage Locality</h2>
    <p>
        Select State :
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="StateName" DataValueField="StateId">
            <asp:ListItem Value="0">-- Select State --</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
        &nbsp;
        Select City :
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="CityName" DataValueField="CityId">
            <asp:ListItem Value="0">-- Select City --</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [City] WHERE ([StateId] = @StateId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="LocalityId" DataSourceID="SqlDataSource1" EmptyDataText="No records found.">
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
                <asp:BoundField DataField="LocalityId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="LocalityId" />
                <asp:TemplateField HeaderText="Locality" SortExpression="LocalityName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LocalityName") %>'></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("LocalityName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CityName" HeaderText="City" ReadOnly="True" SortExpression="CityName" />
                
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

