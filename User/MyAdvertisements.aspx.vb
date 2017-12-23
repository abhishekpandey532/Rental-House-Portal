
Partial Class User_MyAdvertisements
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        hiddenUserId.Value = Membership.GetUser.ProviderUserKey.ToString
    End Sub
End Class
