<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="PostImages.aspx.vb" Inherits="User_PostImages" %>

<%@ Register Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" TagPrefix="CuteWebUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <h2>
                        Simple Upload with Progress</h2>
                    <p>
                        A basic sample demonstrating the use of the Upload control.</p>
                    <CuteWebUI:Uploader runat="server" ID="Uploader1" InsertText="Upload File (Max 10M)"
                        OnFileUploaded="Uploader_FileUploaded">
                        <ValidateOption MaxSizeKB="10240" />
                    </CuteWebUI:Uploader>
                    <br />
                    <p>
                        Server Trace:
                        <br />
                        <asp:ListBox runat="server" ID="ListBoxEvents" />
                    </p>
                    <br />
                    <asp:Button ID="ButtonPostBack" Text="This is a PostBack button" runat="server" OnClick="ButtonPostBack_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
</asp:Content>

