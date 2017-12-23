Imports System.Data.SqlClient

Partial Class Account_Register
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RegisterUser.ContinueDestinationPageUrl = Request.QueryString("ReturnUrl")
    End Sub

    Protected Sub RegisterUser_CreatedUser(ByVal sender As Object, ByVal e As EventArgs) Handles RegisterUser.CreatedUser
        Dim fullName As TextBox = CType(RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("FullName"), TextBox)
        Dim gender As DropDownList = CType(RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Gender"), DropDownList)
        Dim dateOfBirth As TextBox = CType(RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("DateOfBirth"), TextBox)
        Dim contactNo As TextBox = CType(RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("ContactNo"), TextBox)

        Dim userId As String = Membership.GetUser(RegisterUser.UserName).ProviderUserKey.ToString

        Try
            Dim query As String = "INSERT INTO UserProfile (UserId, FullName, Gender, DateOfBirth, ContactNo) VALUES (@UserId, @FullName, @Gender, @DateOfBirth, @ContactNo)"
            Dim dob As Date = CDate(dateOfBirth.Text)

            Dim comm As New SqlCommand
            Dim obj As New QueryExecution

            comm.CommandText = query
            comm.Parameters.AddWithValue("@UserId", userId)
            comm.Parameters.AddWithValue("@FullName", fullName.Text)
            comm.Parameters.AddWithValue("@Gender", gender.SelectedItem.Text)
            comm.Parameters.AddWithValue("@DateOfBirth", dob)
            comm.Parameters.AddWithValue("@ContactNo", contactNo.Text)

            obj.ExecuteQuery(comm)

            Roles.AddUserToRole(RegisterUser.UserName, "user")

            ClientScript.RegisterClientScriptBlock(Me.GetType, Guid.NewGuid.ToString, "alert('You have been registered successfuly.');", True)

            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, False)

            Dim continueUrl As String = RegisterUser.ContinueDestinationPageUrl
            If String.IsNullOrEmpty(continueUrl) Then
                continueUrl = "~/"
            End If

            Response.Redirect(continueUrl)
        Catch ex As Exception
            'Membership.DeleteUser(RegisterUser.UserName)

        End Try
    End Sub
End Class
