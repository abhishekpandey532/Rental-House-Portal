<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ForgotPassword.aspx.vb" Inherits="Account_ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>Forgot Password</h2>
    <p>
         <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="UserValidationGroup"/>
    </p>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <td>Enter your username : </td>
            <td>
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                    CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                    ValidationGroup="UserValidationGroup">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Enter your Email ID : </td>
            <td>
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                    CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required."
                    ValidationGroup="UserValidationGroup">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
                    CssClass="failureNotification" ErrorMessage="E-mail is invalid." ToolTip="E-mail is invalid."
                    ValidationGroup="UserValidationGroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="UserValidationGroup" /></td>
        </tr>
    </table>
</asp:Content>

