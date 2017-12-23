
Partial Class BackOffice
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Membership.DeleteUser(TextBox1.Text.Trim)
    End Sub
End Class
