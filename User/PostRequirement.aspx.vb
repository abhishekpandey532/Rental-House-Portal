Imports System.Data

Partial Class User_PostRequirement
    Inherits System.Web.UI.Page

    Dim obj As New QueryExecution

    Protected Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Dim query As String = "SELECT TOP 1 RequirementId FROM Requirements WHERE UserId = '{0}' ORDER BY RequirementId DESC"
        query = String.Format(query, Membership.GetUser.ProviderUserKey.ToString)

        Dim dt As DataTable = obj.ExecuteSelectQuery(query)
        Dim id As Integer = CInt(dt.Rows(0).Item("RequirementId"))

        AddAmenities(id)
        AddFacilities(id)
        AddLocalities(id)

        ClientScript.RegisterClientScriptBlock(Me.GetType, "postAdded", "alert('Requirement published successfully.')", True)
    End Sub

    Protected Sub FormView1_ItemInserting(sender As Object, e As FormViewInsertEventArgs) Handles FormView1.ItemInserting
        e.Values("UserId") = Membership.GetUser.ProviderUserKey.ToString
    End Sub

    Protected Sub DropDownList2_DataBound(sender As Object, e As EventArgs)
        Dim cityList As DropDownList = CType(FormView1.FindControl("DropDownList2"), DropDownList)
        cityList.Items.Insert(0, New ListItem("-- Select City --", "0"))
    End Sub

    Private Sub AddAmenities(ByVal id As Integer)
        Dim query As String = "INSERT INTO Requirements_Data (RequirementId, DataId, DataType) VALUES({0},{1},'A')"
        Dim amenities As CheckBoxList = CType(FormView1.FindControl("Amenities"), CheckBoxList)

        For Each x As ListItem In amenities.Items
            If x.Selected Then
                obj.ExecuteInsertQuery(String.Format(query, id, x.Value))
            End If
        Next
    End Sub

    Private Sub AddFacilities(ByVal id As Integer)
        Dim query As String = "INSERT INTO Requirements_Data (RequirementId, DataId, DataType) VALUES({0},{1},'F')"
        Dim facilities As CheckBoxList = CType(FormView1.FindControl("NearbyFacilities"), CheckBoxList)

        For Each x As ListItem In facilities.Items
            If x.Selected Then
                obj.ExecuteInsertQuery(String.Format(query, id, x.Value))
            End If
        Next
    End Sub

    Private Sub AddLocalities(ByVal id As Integer)
        Dim query As String = "INSERT INTO Requirements_Data (RequirementId, DataId, DataType) VALUES({0},{1},'L')"
        Dim localities As CheckBoxList = CType(FormView1.FindControl("Localities"), CheckBoxList)

        For Each x As ListItem In localities.Items
            If x.Selected Then
                obj.ExecuteInsertQuery(String.Format(query, id, x.Value))
            End If
        Next
    End Sub
End Class
