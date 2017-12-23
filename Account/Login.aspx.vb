
Partial Class Account_Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
    End Sub

    Protected Sub LoginUser_LoggedIn(sender As Object, e As EventArgs) Handles LoginUser.LoggedIn
        Dim role() As String = Roles.GetRolesForUser(LoginUser.UserName)

        If role.Contains("admin") Then
            If Request.QueryString("ReturnUrl") IsNot Nothing Then
                Response.Redirect(HttpUtility.UrlDecode(Request.QueryString("ReturnUrl")))
            Else
                Response.Redirect("~/Admin/Default.aspx")
            End If
        ElseIf role.Contains("user") Then
            If Request.QueryString("ReturnUrl") IsNot Nothing Then
                Response.Redirect(HttpUtility.UrlDecode(Request.QueryString("ReturnUrl")))
            Else
                Response.Redirect("~/User/Default.aspx")
            End If
        End If

    End Sub
End Class