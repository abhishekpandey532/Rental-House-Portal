
Partial Class Admin_ManageCities
    Inherits System.Web.UI.Page

    Protected Sub stateList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles stateList.SelectedIndexChanged
        If stateList.SelectedValue = "All" Then
            GridView1.DataSourceID = "SqlDataSource1"
        Else
            GridView1.DataSourceID = "SqlDataSource2"
        End If
    End Sub
End Class
