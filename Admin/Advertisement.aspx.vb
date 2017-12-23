Imports System.Data

Partial Class Admin_Advertisement
    Inherits System.Web.UI.Page

    Dim obj As New QueryExecution

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString("ID") Is Nothing Then
            Response.Redirect("~/Admin/ManageAds.aspx")
        End If

        Dim dt As New DataTable
        Dim query As String = "SELECT IsActive FROM Advertisements WHERE AdvertisementId = " + Request.QueryString("ID")
        dt = obj.ExecuteSelectQuery(query)

        Dim IsActive As Boolean = CBool(dt.Rows(0).Item("IsActive"))
        If IsActive Then
            btnAdStatus.Text = "DE-ACTIVATE ADVERTISEMENT"
            btnAdStatus.CommandArgument = "False"
        Else
            btnAdStatus.Text = "ACTIVATE ADVERTISEMENT"
            btnAdStatus.CommandArgument = "True"
        End If
    End Sub

    Protected Sub btnAdStatus_Click(sender As Object, e As EventArgs) Handles btnAdStatus.Click
        Dim query As String = String.Format("UPDATE Advertisements SET IsActive = '{0}' WHERE AdvertisementId = {1}", btnAdStatus.CommandArgument, Request.QueryString("ID"))
        obj.ExecuteUpdateQuery(query)

        Dim msg As String = ""

        If btnAdStatus.CommandArgument = "True" Then
            msg = "Post activated successfully."
        ElseIf btnAdStatus.CommandArgument = "False" Then
            msg = "Post de-activated successfully."
        End If

        ClientScript.RegisterClientScriptBlock(Me.GetType, "statusUpdated", "alert('" + msg + "'); window.location = 'Advertisement.aspx?ID=" + Request.QueryString("ID") + "'", True)
    End Sub
End Class
