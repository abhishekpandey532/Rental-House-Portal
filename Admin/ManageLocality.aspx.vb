
Partial Class Admin_ManageLocality
    Inherits System.Web.UI.Page

    Protected Sub DropDownList4_DataBound(sender As Object, e As EventArgs)
        Dim cityList As DropDownList = CType(DetailsView1.FindControl("DropDownList4"), DropDownList)
        cityList.Items.Insert(0, New ListItem("-- Select City --", "0"))
    End Sub

    Protected Sub DropDownList2_DataBound(sender As Object, e As EventArgs) Handles DropDownList2.DataBound
        DropDownList2.Items.Insert(0, New ListItem("-- Select City --", "0"))
    End Sub

    Protected Sub DetailsView1_ItemInserting(sender As Object, e As DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        e.Values("CityId") = CType(DetailsView1.FindControl("DropDownList4"), DropDownList).SelectedValue
    End Sub
End Class
