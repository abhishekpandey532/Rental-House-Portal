<%@ Page Title="Post Advertisement" MaintainScrollPositionOnPostback="true" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="PostAdvertisement.aspx.vb" Inherits="User_PostAdvertisement" %>

<%@ Register Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" TagPrefix="CuteWebUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui.min.js"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#tabs").tabs();
        });

        var index = 0;
        function nextTab() {
            index++;
            $('#tabs').tabs('option', 'active', index);
            return false;
        }

        function previousTab() {
            index--;
            $('#tabs').tabs('option', 'active', index);
            return false;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h2>Post Advertisement</h2>
    <br />
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">Basic Details</a></li>
            <li><a href="#tabs-2">Additional Details</a></li>
            <li><a href="#tabs-3">Amenities</a></li>
            <li><a href="#tabs-4">Nearby Facilities</a></li>
            <%--<li><a href="#tabs-5">Upload Images</a></li>--%>
        </ul>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="AdvertisementId" DataSourceID="SqlDataSource10" DefaultMode="Insert" CellPadding="5">
            <EditItemTemplate>

                <div id="tabs-1">

                    <table border="1" cellpadding="5">
                        <tr>
                            <td>Title : </td>
                            <td>
                                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Width="400px" /></td>
                        </tr>
                        <tr>
                            <td>Description : </td>
                            <td>
                                <asp:TextBox ID="DescriptionTextBox" runat="server" TextMode="MultiLine" Height="100px" Width="400px" Text='<%# Bind("Description") %>' /></td>
                        </tr>
                        <tr>
                            <td>AdType : </td>
                            <td>
                                <asp:TextBox ID="AdTypeTextBox" runat="server" Text='<%# Bind("AdType") %>' /></td>
                        </tr>
                        <tr>
                            <td>Amount : </td>
                            <td>
                                <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' /></td>
                        </tr>
                        <tr>
                            <td>BHK : </td>
                            <td>
                                <asp:TextBox ID="BHKTextBox" runat="server" Text='<%# Bind("BHK") %>' Width="75px" />
                                (Ex. 1, 1.5)</td>
                        </tr>
                        <tr>
                            <td>Age : </td>
                            <td>
                                <asp:TextBox ID="AgeTextBox" runat="server" Text='<%# Bind("Age") %>' Width="75px" /></td>
                        </tr>
                        <tr>
                            <td>Area (Sqr. ft.) : </td>
                            <td>
                                <asp:TextBox ID="AreaTextBox" runat="server" Text='<%# Bind("Area") %>' /></td>
                        </tr>
                        <tr>
                            <td>Negotiable : </td>
                            <td>
                                <asp:CheckBox ID="IsNegotiableCheckBox" runat="server" Checked='<%# Bind("IsNegotiable") %>' /></td>
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
                    </table>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Next" OnClientClick="return nextTab()" />
                </div>
                <div id="tabs-2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table border="1" cellpadding="5">
                                <tr>
                                    <td>Residence Type :</td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList11" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource11" DataTextField="ResTypeName" DataValueField="ResTypeId" SelectedValue='<%# Bind("ResidenceTypeId") %>'>
                                            <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [ResidenceType]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>State : </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList21" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource21" DataTextField="StateName" DataValueField="StateId">
                                            <asp:ListItem Value="0">-- Select State --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>City : </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList31" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource31" DataTextField="CityName" DataValueField="CityId" OnDataBound="DropDownList31_DataBound">
                                            <asp:ListItem Value="0">-- Select City --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource31" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [City] WHERE ([StateId] = @StateId)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownList21" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Locality : </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList41" runat="server">
                                            <asp:ListItem Value="0">-- Select Locality --</asp:ListItem>
                                        </asp:DropDownList>
                                        <%--<asp:DropDownList ID="DropDownList41" runat="server" DataSourceID="SqlDataSource41" DataTextField="LocalityName" DataValueField="LocalityId" OnDataBound="DropDownList41_DataBound" >
                                            <asp:ListItem Value="0">-- Select Locality --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource41" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [Locality] WHERE ([CityId] = @CityId)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownList31" Name="CityId" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>--%>
                                        <%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("") %>'></asp:Label>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Facing : </td>
                                    <td>
                                        <asp:DropDownList ID="FacingDropDownList1" runat="server" SelectedValue='<%# Bind("Facing") %>'>

                                            <asp:ListItem Value="-">-- Select --</asp:ListItem>
                                            <asp:ListItem>East</asp:ListItem>
                                            <asp:ListItem>West</asp:ListItem>
                                            <asp:ListItem>North</asp:ListItem>
                                            <asp:ListItem>North East</asp:ListItem>
                                            <asp:ListItem>North West</asp:ListItem>
                                            <asp:ListItem>South</asp:ListItem>
                                            <asp:ListItem>South East</asp:ListItem>
                                            <asp:ListItem>South West</asp:ListItem>

                                        </asp:DropDownList>
                                </tr>
                                <tr>
                                    <td>Floor No. :</td>
                                    <td>
                                        <asp:TextBox ID="FloorNoTextBox1" runat="server" Text='<%# Bind("FloorNo") %>' Width="75px" /></td>
                                </tr>
                                <tr>
                                    <td>Total Floors : </td>
                                    <td>
                                        <asp:TextBox ID="TotalFloorsTextBox1" runat="server" Text='<%# Bind("TotalFloors") %>' Width="75px" /></td>
                                    <tr>
                                        <td>Bathroom:  </td>
                                        <td>
                                            <asp:TextBox ID="BathroomTextBox1" runat="server" Text='<%# Bind("Bathroom") %>' Width="75px" /></td>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Previous" OnClientClick="return previousTab()" />
                    &nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Next" OnClientClick="return nextTab()" />
                </div>

                <div id="tabs-3">
                    <asp:CheckBoxList ID="chkBoxAmenities" runat="server" DataSourceID="SqlDataSource5" DataTextField="AmenityName" DataValueField="AmenityId"></asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [Amenities]"></asp:SqlDataSource>
                    <br />
                    <asp:Button ID="Button4" runat="server" Text="Previous" OnClientClick="return previousTab()" />
                    &nbsp;
                    <asp:Button ID="Button5" runat="server" Text="Next" OnClientClick="return nextTab()" />
                </div>
                <div id="tabs-4">
                    <asp:CheckBoxList ID="chkBoxFacilities" runat="server" DataSourceID="SqlDataSource6" DataTextField="FacilityName" DataValueField="FacilityId"></asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [NearbyFacilities]"></asp:SqlDataSource>
                    <br />
                    <asp:Button ID="Button6" runat="server" Text="Previous" OnClientClick="return previousTab()" />
                    &nbsp;
                    <asp:Button ID="Button7" runat="server" Text="Next" OnClientClick="return nextTab()" />

                </div>
                <%--<div id="tabs-5">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <p>Upload Images. Each image must be of not more than 2 MB. You can uploaded maximum 5 images.</p>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <asp:Button ID="Button8" runat="server" Text="Previous" OnClientClick="return previousTab()" />
                    &nbsp;
                    
                </div>--%>
                &nbsp; &nbsp;
                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                <asp:Button ID="UpdateCancelButton" runat="server" Text="Cancel" OnClick="UpdateCancelButton_Click" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <div id="tabs-1">

                    <table border="1" cellpadding="5">
                        <tr>
                            <td>Title : </td>
                            <td>
                                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Width="400px" /></td>
                        </tr>
                        <tr>
                            <td>Description : </td>
                            <td>
                                <asp:TextBox ID="DescriptionTextBox" runat="server" TextMode="MultiLine" Height="100px" Width="400px" Text='<%# Bind("Description") %>' /></td>
                        </tr>
                        <tr>
                            <td>AdType : </td>
                            <td>
                                <asp:TextBox ID="AdTypeTextBox" runat="server" Text='<%# Bind("AdType") %>' /></td>
                        </tr>
                        <tr>
                            <td>Amount : </td>
                            <td>
                                <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' /></td>
                        </tr>
                        <tr>
                            <td>BHK : </td>
                            <td>
                                <asp:TextBox ID="BHKTextBox" runat="server" Text='<%# Bind("BHK") %>' Width="75px" />
                                (Ex. 1, 1.5)</td>
                        </tr>
                        <tr>
                            <td>Age : </td>
                            <td>
                                <asp:TextBox ID="AgeTextBox" runat="server" Text='<%# Bind("Age") %>' Width="75px" /></td>
                        </tr>
                        <tr>
                            <td>Area (Sqr. ft.) : </td>
                            <td>
                                <asp:TextBox ID="AreaTextBox" runat="server" Text='<%# Bind("Area") %>' /></td>
                        </tr>
                        <tr>
                            <td>Negotiable : </td>
                            <td>
                                <asp:CheckBox ID="IsNegotiableCheckBox" runat="server" Checked='<%# Bind("IsNegotiable") %>' /></td>
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
                    </table>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Next" OnClientClick="return nextTab()" />
                </div>
                <div id="tabs-2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table border="1" cellpadding="5">
                                <tr>
                                    <td>Residence Type :</td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="ResTypeName" DataValueField="ResTypeId" SelectedValue='<%# Bind("ResidenceTypeId") %>'>
                                            <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [ResidenceType]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>State : </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="StateName" DataValueField="StateId">
                                            <asp:ListItem Value="0">-- Select State --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>City : </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="CityName" DataValueField="CityId" OnDataBound="DropDownList3_DataBound">
                                            <asp:ListItem Value="0">-- Select City --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [City] WHERE ([StateId] = @StateId)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownList2" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Locality : </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="LocalityName" DataValueField="LocalityId" OnDataBound="DropDownList4_DataBound">
                                            <asp:ListItem Value="0">-- Select Locality --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [Locality] WHERE ([CityId] = @CityId)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownList3" Name="CityId" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Facing : </td>
                                    <td>
                                        <asp:DropDownList ID="FacingDropDownList" runat="server" SelectedValue='<%# Bind("Facing") %>'>

                                            <asp:ListItem Value="-">-- Select --</asp:ListItem>
                                            <asp:ListItem>East</asp:ListItem>
                                            <asp:ListItem>West</asp:ListItem>
                                            <asp:ListItem>North</asp:ListItem>
                                            <asp:ListItem>North East</asp:ListItem>
                                            <asp:ListItem>North West</asp:ListItem>
                                            <asp:ListItem>South</asp:ListItem>
                                            <asp:ListItem>South East</asp:ListItem>
                                            <asp:ListItem>South West</asp:ListItem>

                                        </asp:DropDownList>
                                </tr>
                                <tr>
                                    <td>Floor No. :</td>
                                    <td>
                                        <asp:TextBox ID="FloorNoTextBox" runat="server" Text='<%# Bind("FloorNo") %>' Width="75px" /></td>
                                </tr>
                                <tr>
                                    <td>Total Floors : </td>
                                    <td>
                                        <asp:TextBox ID="TotalFloorsTextBox" runat="server" Text='<%# Bind("TotalFloors") %>' Width="75px" /></td>
                                    <tr>
                                        <td>Bathroom:  </td>
                                        <td>
                                            <asp:TextBox ID="BathroomTextBox" runat="server" Text='<%# Bind("Bathroom") %>' Width="75px" /></td>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Previous" OnClientClick="return previousTab()" />
                    &nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Next" OnClientClick="return nextTab()" />
                </div>
                <div id="tabs-3">
                    <asp:CheckBoxList ID="chkBoxAmenities" runat="server" DataSourceID="SqlDataSource5" DataTextField="AmenityName" DataValueField="AmenityId"></asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [Amenities]"></asp:SqlDataSource>
                    <br />
                    <asp:Button ID="Button4" runat="server" Text="Previous" OnClientClick="return previousTab()" />
                    &nbsp;
                    <asp:Button ID="Button5" runat="server" Text="Next" OnClientClick="return nextTab()" />
                </div>
                <div id="tabs-4">
                    <asp:CheckBoxList ID="chkBoxFacilities" runat="server" DataSourceID="SqlDataSource6" DataTextField="FacilityName" DataValueField="FacilityId"></asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [NearbyFacilities]"></asp:SqlDataSource>
                    <br />
                    <%--<asp:Button ID="Button6" runat="server" Text="Previous" OnClientClick="return previousTab()" />
                    &nbsp;
                    <asp:Button ID="Button7" runat="server" Text="Next" OnClientClick="return nextTab()" />--%>
                    <asp:Button ID="Button8" runat="server" Text="Previous" OnClientClick="return previousTab()" />
                    &nbsp;
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit" />

                </div>
                <%--<div id="tabs-5">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <p>Upload Images. Each image must be of not more than 2 MB. You can uploaded maximum 5 images.</p>
                            <asp:FileUpload ID="fileUploadImage" runat="server"></asp:FileUpload>
                            <asp:Button ID="btnUpload" runat="server" Text="Upload Image" OnClick="btnUpload_Click" />
                            <br />
                            <asp:Button ID="btnProcessData" runat="server" Text="Process Data" OnClick="btnProcessData_Click" /><br />
                            <asp:Label ID="lblMessage" runat="server" Text="Image uploaded successfully." Visible="false"></asp:Label><br />
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                <ProgressTemplate>
                                    Please wait image is getting uploaded....
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                            <br />
                            <b>Please view the below image uploaded</b><br />
                            <asp:Image ID="img" runat="server" Width="100" Height="100" ImageAlign="Middle" />

                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnUpload" />
                            <asp:AsyncPostBackTrigger ControlID="btnProcessData" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <br />
                    <asp:Button ID="Button8" runat="server" Text="Previous" OnClientClick="return previousTab()" />
                    &nbsp;
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit" />
                    
                </div>--%>

            </InsertItemTemplate>
            <ItemTemplate>

                <div id="tabs-1">

                    <table border="1" cellpadding="5">
                        <tr>
                            <td>Title : </td>
                            <td>
                                <asp:TextBox ID="TitleTextBox" runat="server" Enabled="false" Text='<%# Bind("Title") %>' Width="400px" /></td>
                        </tr>
                        <tr>
                            <td>Description : </td>
                            <td>
                                <asp:TextBox ID="DescriptionTextBox" runat="server" Enabled="false" TextMode="MultiLine" Height="100px" Width="400px" Text='<%# Bind("Description") %>' /></td>
                        </tr>
                        <tr>
                            <td>AdType : </td>
                            <td>
                                <asp:TextBox ID="AdTypeTextBox" runat="server" Enabled="false" Text='<%# Bind("AdType") %>' /></td>
                        </tr>
                        <tr>
                            <td>Amount : </td>
                            <td>
                                <asp:TextBox ID="AmountTextBox" runat="server" Enabled="false" Text='<%# Bind("Amount") %>' /></td>
                        </tr>
                        <tr>
                            <td>BHK : </td>
                            <td>
                                <asp:TextBox ID="BHKTextBox" runat="server" Enabled="false" Text='<%# Bind("BHK") %>' Width="75px" />
                                (Ex. 1, 1.5)</td>
                        </tr>
                        <tr>
                            <td>Age : </td>
                            <td>
                                <asp:TextBox ID="AgeTextBox" runat="server" Enabled="false" Text='<%# Bind("Age") %>' Width="75px" /></td>
                        </tr>
                        <tr>
                            <td>Area (Sqr. ft.) : </td>
                            <td>
                                <asp:TextBox ID="AreaTextBox" runat="server" Enabled="false" Text='<%# Bind("Area") %>' /></td>
                        </tr>
                        <tr>
                            <td>Negotiable : </td>
                            <td>
                                <asp:CheckBox ID="IsNegotiableCheckBox" Enabled="false" runat="server" Checked='<%# Bind("IsNegotiable") %>' /></td>
                        </tr>
                        <tr>
                            <td>Furnished : </td>
                            <td>
                                <asp:DropDownList ID="DropDownList5" Enabled="false" runat="server" SelectedValue='<%# Bind("Furnished") %>'>
                                    <asp:ListItem Value="-">-- Select --</asp:ListItem>
                                    <asp:ListItem>Unfurnished</asp:ListItem>
                                    <asp:ListItem>Furnished</asp:ListItem>
                                    <asp:ListItem>Semi-furnished</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                    <%--<br />
                    <asp:Button ID="Button1" runat="server" Text="Next" OnClientClick="return nextTab()" />--%>
                </div>
                <div id="tabs-2">
                    <table border="1" cellpadding="5">
                        <tr>
                            <td>Residence Type :</td>
                            <td>
                                <asp:DropDownList ID="DropDownList111" Enabled="false" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource111" DataTextField="ResTypeName" DataValueField="ResTypeId" SelectedValue='<%# Bind("ResidenceTypeId") %>'>
                                    <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource111" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [ResidenceType]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>State : </td>
                            <td>
                                <asp:DropDownList ID="DropDownList211" Enabled="false" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource211" DataTextField="StateName" DataValueField="StateId">
                                    <asp:ListItem Value="0">-- Select State --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource211" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>City : </td>
                            <td>
                                <asp:DropDownList ID="DropDownList311" Enabled="false" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource311" DataTextField="CityName" DataValueField="CityId">
                                    <asp:ListItem Value="0">-- Select City --</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource311" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [City] WHERE ([StateId] = @StateId)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList211" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>Locality : </td>
                            <td>
                                <asp:DropDownList ID="DropDownList411" Enabled="false" runat="server">
                                    <asp:ListItem Value="0">-- Select Locality --</asp:ListItem>
                                </asp:DropDownList>
                                <%--<asp:DropDownList ID="DropDownList41" runat="server" DataSourceID="SqlDataSource41" DataTextField="LocalityName" DataValueField="LocalityId" OnDataBound="DropDownList41_DataBound" >
                                            <asp:ListItem Value="0">-- Select Locality --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource41" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [Locality] WHERE ([CityId] = @CityId)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownList31" Name="CityId" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>--%>
                                <%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("") %>'></asp:Label>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>Facing : </td>
                            <td>
                                <asp:DropDownList ID="FacingDropDownList1" runat="server" Enabled="false" SelectedValue='<%# Bind("Facing") %>'>

                                    <asp:ListItem Value="-">-- Select --</asp:ListItem>
                                    <asp:ListItem>East</asp:ListItem>
                                    <asp:ListItem>West</asp:ListItem>
                                    <asp:ListItem>North</asp:ListItem>
                                    <asp:ListItem>North East</asp:ListItem>
                                    <asp:ListItem>North West</asp:ListItem>
                                    <asp:ListItem>South</asp:ListItem>
                                    <asp:ListItem>South East</asp:ListItem>
                                    <asp:ListItem>South West</asp:ListItem>

                                </asp:DropDownList>
                        </tr>
                        <tr>
                            <td>Floor No. :</td>
                            <td>
                                <asp:TextBox ID="FloorNoTextBox1" runat="server" Enabled="false" Text='<%# Bind("FloorNo") %>' Width="75px" /></td>
                        </tr>
                        <tr>
                            <td>Total Floors : </td>
                            <td>
                                <asp:TextBox ID="TotalFloorsTextBox1" runat="server" Enabled="false" Text='<%# Bind("TotalFloors") %>' Width="75px" /></td>
                            <tr>
                                <td>Bathroom:  </td>
                                <td>
                                    <asp:TextBox ID="BathroomTextBox1" runat="server" Enabled="false" Text='<%# Bind("Bathroom") %>' Width="75px" /></td>
                    </table>

                    <%--<br />
                    <asp:Button ID="Button2" runat="server" Text="Previous" OnClientClick="return previousTab()" /> &nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Next" OnClientClick="return nextTab()" />--%>
                </div>

                <div id="tabs-3">
                    <ul>
                        <asp:DataList ID="DataList2" runat="server" DataKeyField="AdvertisementId" DataSourceID="SqlDataSource23">
                            <ItemTemplate>
                                <li>
                                    <asp:Label ID="AmenityIdLabel" runat="server" Text='<%# Eval("Amenity")%>' /></li>
                            </ItemTemplate>
                        </asp:DataList>
                    </ul>
                    <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT [AdvertisementId], [AmenityId], (SELECT AmenityName FROM Amenities a WHERE a.AmenityId = aa.AmenityId) AS Amenity FROM [Ads_Amenities] aa WHERE ([AdvertisementId] = @AdvertisementId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="AdvertisementId" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <%--<asp:Button ID="Button4" runat="server" Text="Previous" OnClientClick="return previousTab()" /> &nbsp;
                    <asp:Button ID="Button5" runat="server" Text="Next" OnClientClick="return nextTab()" />--%>
                </div>
                <div id="tabs-4">
                    <ul>
                        <asp:DataList ID="DataList3" runat="server" DataKeyField="AdvertisementId" DataSourceID="SqlDataSource35">
                            <ItemTemplate>
                                <li>
                                    <asp:Label ID="FacilityIdLabel" runat="server" Text='<%# Eval("Facility")%>' /></li>
                            </ItemTemplate>
                        </asp:DataList>
                    </ul>
                    <asp:SqlDataSource ID="SqlDataSource35" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [AdvertisementId], [FacilityId], (SELECT FacilityName FROM NearbyFacilities f WHERE f.FacilityId = a.FacilityId) AS Facility FROM [Ads_NearbyFacilities] a WHERE ([AdvertisementId] = @AdvertisementId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="AdvertisementId" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <%-- <asp:Button ID="Button6" runat="server" Text="Previous" OnClientClick="return previousTab()" /> &nbsp;
                    <asp:Button ID="Button7" runat="server" Text="Next" OnClientClick="return nextTab()" />--%>
                </div>
                <%--<div id="tabs-5">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <p>Upload Images. Each image must be of not more than 2 MB. You can uploaded maximum 5 images.</p>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <asp:Button ID="Button8" runat="server" Text="Previous" OnClientClick="return previousTab()" /> &nbsp;
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </div>--%>
                &nbsp; &nbsp;
                <asp:Button ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" />
            </ItemTemplate>
        </asp:FormView>

        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            DeleteCommand="DELETE FROM [Advertisements] WHERE [AdvertisementId] = @AdvertisementId"
            InsertCommand="INSERT INTO [Advertisements] ([Title], [Description], [AdType], [Amount], [BHK], [Age], [Furnished], [ResidenceTypeId], [LocalityId], [UserId], [IsNegotiable], [Area], [Facing], [FloorNo], [TotalFloors], [Bathroom], [Rate], [IsActive]) VALUES (@Title, @Description, @AdType, @Amount, @BHK, @Age, @Furnished, @ResidenceTypeId, @LocalityId, @UserId, @IsNegotiable, @Area, @Facing, @FloorNo, @TotalFloors, @Bathroom, @Rate, @IsActive)"
            SelectCommand="SELECT * FROM [Advertisements] WHERE AdvertisementId = @AdvertisementId"
            UpdateCommand="UPDATE [Advertisements] SET [Title] = @Title, [Description] = @Description, [AdType] = @AdType, [Amount] = @Amount, [BHK] = @BHK, [Age] = @Age, [Furnished] = @Furnished, [ResidenceTypeId] = @ResidenceTypeId, [LocalityId] = @LocalityId, [IsNegotiable] = @IsNegotiable, [Area] = @Area, [Facing] = @Facing, [FloorNo] = @FloorNo, [TotalFloors] = @TotalFloors, [Bathroom] = @Bathroom, [Rate] = @Rate, [IsActive] = @IsActive WHERE [AdvertisementId] = @AdvertisementId">
            <SelectParameters>
                <asp:QueryStringParameter Name="AdvertisementId" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="AdvertisementId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="AdType" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="BHK" Type="Int32" />
                <asp:Parameter Name="Age" Type="Int32" />
                <asp:Parameter Name="Furnished" Type="String" />
                <asp:Parameter Name="ResidenceTypeId" Type="Int32" />
                <asp:Parameter Name="LocalityId" Type="Int32" />
                <asp:Parameter Name="UserId" Type="String" />
                <asp:Parameter Name="IsNegotiable" Type="Boolean" />
                <asp:Parameter Name="Area" Type="Int32" />
                <asp:Parameter Name="Facing" Type="String" />
                <asp:Parameter Name="FloorNo" Type="Int32" />
                <asp:Parameter Name="TotalFloors" Type="Int32" />
                <asp:Parameter Name="Bathroom" Type="Int32" />
                <asp:Parameter Name="Rate" Type="Int32" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="AdType" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="BHK" Type="Int32" />
                <asp:Parameter Name="Age" Type="Int32" />
                <asp:Parameter Name="Furnished" Type="String" />
                <asp:Parameter Name="ResidenceTypeId" Type="Int32" />
                <asp:Parameter Name="LocalityId" Type="Int32" />
                <asp:Parameter Name="IsNegotiable" Type="Boolean" />
                <asp:Parameter Name="Area" Type="Int32" />
                <asp:Parameter Name="Facing" Type="String" />
                <asp:Parameter Name="FloorNo" Type="Int32" />
                <asp:Parameter Name="TotalFloors" Type="Int32" />
                <asp:Parameter Name="Bathroom" Type="Int32" />
                <asp:Parameter Name="Rate" Type="Int32" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="AdvertisementId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

