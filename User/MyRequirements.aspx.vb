
Partial Class User_MyRequirements
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        hfUserId.Value = Membership.GetUser.ProviderUserKey.ToString

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        detailsPanel.Visible = True
    End Sub
End Class
