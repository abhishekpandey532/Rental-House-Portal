
Partial Class Advertisement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString("ID") Is Nothing Then
            Response.Redirect("~/ViewAdvertisements.aspx")
        End If
    End Sub
End Class
