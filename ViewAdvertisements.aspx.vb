
Partial Class ViewAdvertisements
    Inherits System.Web.UI.Page


    Protected Sub SelectAllLocality_Click(sender As Object, e As EventArgs) Handles SelectAllLocality.Click
        ChangeStatus(localityList, True)
    End Sub

    Protected Sub UnSelectAllLocality_Click(sender As Object, e As EventArgs) Handles UnSelectAllLocality.Click
        ChangeStatus(localityList, False)
    End Sub

    Private Sub ChangeStatus(ByVal obj As CheckBoxList, ByVal status As Boolean)
        For Each x As ListItem In obj.Items
            x.Selected = status
        Next
    End Sub

    Protected Sub SelectAllResType_Click(sender As Object, e As EventArgs) Handles SelectAllResType.Click
        ChangeStatus(residenceTypeList, True)
    End Sub

    Protected Sub UnSelectAllResType_Click(sender As Object, e As EventArgs) Handles UnSelectAllResType.Click
        ChangeStatus(residenceTypeList, False)
    End Sub

    Protected Sub SelectAllAmenities_Click(sender As Object, e As EventArgs) Handles SelectAllAmenities.Click
        ChangeStatus(amenitiesList, True)
    End Sub

    Protected Sub UnSelectAllAmenities_Click(sender As Object, e As EventArgs) Handles UnSelectAllAmenities.Click
        ChangeStatus(amenitiesList, False)
    End Sub

    Protected Sub SelectAllFacilities_Click(sender As Object, e As EventArgs) Handles SelectAllFacilities.Click
        ChangeStatus(nearbyFacilitiesList, True)
    End Sub

    Protected Sub UnSelectAllFacilities_Click(sender As Object, e As EventArgs) Handles UnSelectAllFacilities.Click
        ChangeStatus(nearbyFacilitiesList, False)
    End Sub

    Protected Sub SelectAllFurnishing_Click(sender As Object, e As EventArgs) Handles SelectAllFurnishing.Click
        ChangeStatus(FurnishingList, True)
    End Sub

    Protected Sub UnSelectAllFurnishing_Click(sender As Object, e As EventArgs) Handles UnSelectAllFurnishing.Click
        ChangeStatus(FurnishingList, False)
    End Sub

    Protected Sub SelectAllBHK_Click(sender As Object, e As EventArgs) Handles SelectAllBHK.Click
        ChangeStatus(bhkList, True)
    End Sub

    Protected Sub UnSelectAllBHK_Click(sender As Object, e As EventArgs) Handles UnSelectAllBHK.Click
        ChangeStatus(bhkList, False)
    End Sub

    Private Function BuildQuery() As String
        Dim query As String = "SELECT [AdvertisementId], [Title], [Description], [AdType], [Amount], [BHK], [ResidenceTypeId], " _
                            + "(SELECT [ResTypeName] FROM [ResidenceType] r WHERE r.ResTypeId = a.ResidenceTypeId) AS ResidenceType, " _
                            + "[LocalityId], (SELECT [LocalityName] FROM [Locality] l WHERE l.LocalityId = a.LocalityId) AS Locality, [Area] FROM [Advertisements] a WHERE IsActive = 'True' AND "

        If (IsSomethingSelected(localityList)) Then
            Dim values As String = GetSelectedValues(localityList, False)
            query += "LocalityId IN (" + values + ") AND "
        End If

        If (IsSomethingSelected(residenceTypeList)) Then
            Dim values As String = GetSelectedValues(residenceTypeList, False)
            query += "ResidenceTypeId IN (" + values + ") AND "
        End If

        If (IsSomethingSelected(FurnishingList)) Then
            Dim values As String = GetSelectedValues(FurnishingList, True)
            query += "Furnished IN (" + values + ") AND "
        End If

        If (IsSomethingSelected(bhkList)) Then
            Dim values As String = GetSelectedValues(bhkList, False)
            query += "BHK IN (" + values + ") AND "
        End If

        If (IsSomethingSelected(amenitiesList)) Then
            Dim values As String = GetSelectedValues(amenitiesList, False)
            query += "AdvertisementId IN (SELECT AdvertisementId FROM Ads_Amenities WHERE AmenityId IN (" + values + ")) AND "
        End If

        If (IsSomethingSelected(nearbyFacilitiesList)) Then
            Dim values As String = GetSelectedValues(nearbyFacilitiesList, False)
            query += "AdvertisementId IN (SELECT AdvertisementId FROM Ads_NearbyFacilities WHERE FacilityId IN (" + values + ")) AND "
        End If

        query = query.Substring(0, query.LastIndexOf(" AND "))

        'If query.LastIndexOf(" AND ") > 0 Then
        '    query = query.Substring(0, query.LastIndexOf(" AND "))
        'Else
        '    query = query.Substring(0, query.LastIndexOf(" WHERE "))
        'End If

        Return query
    End Function

    Private Function IsSomethingSelected(ByVal obj As CheckBoxList) As Boolean
        For Each x As ListItem In obj.Items
            If x.Selected Then
                Return True
            End If
        Next
        Return False
    End Function

    Private Function GetSelectedValues(ByVal obj As CheckBoxList, ByVal isString As Boolean) As String
        Dim str As String = ""
        Dim quotes As String

        If isString Then
            quotes = "'"
        Else
            quotes = ""
        End If

        For Each x As ListItem In obj.Items
            If x.Selected Then
                str += quotes + x.Value + quotes + ","
            End If
        Next
        str = str.TrimEnd(",")
        Return str
    End Function

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        'Dim query As String = """" + BuildQuery() + """"
        Dim query As String = BuildQuery()

        SqlDataSource1.SelectCommand = query
        SqlDataSource1.Select(DataSourceSelectArguments.Empty)
        SqlDataSource1.DataBind()
        DataList1.DataBind()
        'Response.Write(query)
    End Sub


    'Protected Sub DropDownList3_DataBound(sender As Object, e As EventArgs)
    '    DropDownList3.Items.Insert(0, New ListItem("-- Select City --", "0"))
    'End Sub

    'Protected Sub DropDownList4_DataBound(sender As Object, e As EventArgs)
    '    DropDownList4.Items.Insert(0, New ListItem("-- Select Locality --", "0"))
    'End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'ClientScript.RegisterClientScriptBlock(Me.GetType, "load", "$('#selectCity').bPopup({ modalClose: false });", True)
        'ChangeStatus(localityList, True)
        'ChangeStatus(residenceTypeList, True)
        'ChangeStatus(amenitiesList, True)
        'ChangeStatus(nearbyFacilitiesList, True)
        'ChangeStatus(FurnishingList, True)
        'ChangeStatus(bhkList, True)
    End Sub
End Class
