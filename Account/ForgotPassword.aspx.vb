
Partial Class Account_ForgotPassword
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim user As MembershipUser = Membership.GetUser(UserName.Text.Trim)
        Dim password As String

        If user Is Nothing Then
            ClientScript.RegisterClientScriptBlock(Me.GetType, Guid.NewGuid.ToString, "alert('User with this username does not exist.');", True)
        ElseIf String.Compare(Email.Text.Trim, user.Email) <> 0 Then
            ClientScript.RegisterClientScriptBlock(Me.GetType, Guid.NewGuid.ToString, "alert('You have provided an incorrect username or email.');", True)
        Else
            password = user.ResetPassword()
            Dim emailBody As String = "<html>" _
                                + "<body>" _
                                + "<h2>Dear User, </h2>" _
                                + "<p>Your new password is : </p>" _
                                + "<p><b>" _
                                + password _
                                + "</b></p>" _
                                + "</body>" _
                                + "</html>"
            EmailHandler.Send_Mail(user.Email, emailBody)
            ClientScript.RegisterClientScriptBlock(Me.GetType, Guid.NewGuid.ToString, "alert('Password has been reset and sent to your Email ID.');", True)
        End If
    End Sub
End Class
