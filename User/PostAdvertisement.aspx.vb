﻿Imports System.Data
Imports CuteWebUI

Partial Class User_PostAdvertisement
    Inherits System.Web.UI.Page

    Protected CityId, LocalityId, StateId As String
    Dim obj As New QueryExecution

    Protected Sub DropDownList3_DataBound(sender As Object, e As EventArgs)
        Dim cityList As DropDownList = CType(FormView1.FindControl("DropDownList3"), DropDownList)
        cityList.Items.Insert(0, New ListItem("-- Select City --", "0"))
    End Sub

    Protected Sub DropDownList4_DataBound(sender As Object, e As EventArgs)
        Dim localityList As DropDownList = CType(FormView1.FindControl("DropDownList4"), DropDownList)
        localityList.Items.Insert(0, New ListItem("-- Select Locality --", "0"))
    End Sub

    Protected Sub DropDownList31_DataBound(sender As Object, e As EventArgs)
        Dim cityList As DropDownList = CType(FormView1.FindControl("DropDownList31"), DropDownList)
        cityList.Items.Insert(0, New ListItem("-- Select City --", "0"))
    End Sub

    'Protected Sub DropDownList41_DataBound(sender As Object, e As EventArgs)
    '    Dim localityList As DropDownList = CType(FormView1.FindControl("DropDownList41"), DropDownList)
    '    localityList.Items.Insert(0, New ListItem("-- Select Locality --", "0"))
    'End Sub

    Protected Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Dim obj As New QueryExecution
        Dim dt As DataTable = obj.ExecuteSelectQuery(String.Format("SELECT TOP 1 AdvertisementId FROM Advertisements WHERE UserId = '{0}' ORDER BY AdvertisementId DESC", Membership.GetUser.ProviderUserKey.ToString))
        Dim id As Integer = CInt(dt.Rows(0).Item("AdvertisementId"))
        
        AddAmenities(id)
        AddFacilities(id)

        Dim reqHandler As New RequirementHandler
        reqHandler.Send_Notification(id)

        ClientScript.RegisterClientScriptBlock(Me.GetType, "postAdded", "alert('Advertisement published successfully.')", True)
    End Sub

    Protected Sub FormView1_ItemInserting(sender As Object, e As FormViewInsertEventArgs) Handles FormView1.ItemInserting
        e.Values("UserId") = Membership.GetUser().ProviderUserKey.ToString
        e.Values("IsActive") = True
        e.Values("Rate") = CInt(e.Values("Amount")) / CInt(e.Values("Area"))
        e.Values("LocalityId") = CType(FormView1.FindControl("DropDownList4"), DropDownList).SelectedValue
    End Sub

    'Protected Sub InsertMsg(ByVal msg As String)
    '    ListBoxEvents.Items.Insert(0, msg)
    '    ListBoxEvents.SelectedIndex = 0
    'End Sub

    'Protected Sub ButtonPostBack_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    InsertMsg("You clicked a PostBack Button.")
    'End Sub

    Protected Sub Uploader_FileUploaded(ByVal sender As Object, ByVal args As UploaderEventArgs)
        'InsertMsg("File uploaded! " & args.FileName & ", " + args.FileSize.ToString() & " bytes.")
        'Copys the uploaded file to a new location. 
        'args.CopyTo("c:\\temp\\" & args.FileName)
        'You can also open the uploaded file's data stream. 
        'System.IO.Stream data = args.OpenStream(); 
        MsgBox("sdf)")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Request.QueryString("ID") IsNot Nothing Then
                FormView1.DefaultMode = FormViewMode.ReadOnly
                Dim AdID As String = Request.QueryString("ID")

                'Populate State, City and Locality List
                Dim query As String = "SELECT LocalityId, (SELECT CityId FROM Locality l WHERE l.LocalityId = a.LocalityId) AS CityId, (SELECT StateId FROM City WHERE CityId = (SELECT CityId FROM Locality l WHERE l.LocalityId = a.LocalityId)) AS StateId FROM Advertisements a WHERE AdvertisementId = " + AdID
                Dim dt As New DataTable
                dt = obj.ExecuteSelectQuery(query)

                LocalityId = dt.Rows(0).Item("LocalityId")
                CityId = dt.Rows(0).Item("CityId")
                StateId = dt.Rows(0).Item("StateId")

                If Request.QueryString("Action") IsNot Nothing And Request.QueryString("Action") = "Edit" Then
                    FormView1.DefaultMode = FormViewMode.Edit

                    'Populate Amenities List
                    Dim chkBoxAmenities As CheckBoxList = CType(FormView1.FindControl("chkBoxAmenities"), CheckBoxList)
                    Dim amenities As ArrayList = GetAmenitiesList(AdID)
                    For Each x As ListItem In chkBoxAmenities.Items
                        If amenities.Contains(CInt(x.Value)) Then
                            x.Selected = True
                        End If
                    Next

                    'Populate Nearby facilities List
                    Dim chkBoxFacilities As CheckBoxList = CType(FormView1.FindControl("chkBoxFacilities"), CheckBoxList)
                    Dim facilities As ArrayList = GetFacilitiesList(AdID)
                    For Each x As ListItem In chkBoxFacilities.Items
                        If facilities.Contains(CInt(x.Value)) Then
                            x.Selected = True
                        End If
                    Next

                    'Set State, City & locality
                    Dim cityList As DropDownList = CType(FormView1.FindControl("DropDownList31"), DropDownList)
                    Dim localityList As DropDownList = CType(FormView1.FindControl("DropDownList41"), DropDownList)
                    Dim stateList As DropDownList = CType(FormView1.FindControl("DropDownList21"), DropDownList)

                    query = "SELECT * FROM Locality WHERE CityId = " + CityId
                    dt = obj.ExecuteSelectQuery(query)
                    For Each x As DataRow In dt.Rows
                        localityList.Items.Add(New ListItem(x.Item("LocalityName"), x.Item("LocalityId")))
                    Next

                    stateList.SelectedValue = StateId
                    cityList.SelectedValue = CityId
                    localityList.SelectedValue = LocalityId
                Else
                    'Set State, City & locality
                    Dim cityList As DropDownList = CType(FormView1.FindControl("DropDownList311"), DropDownList)
                    Dim localityList As DropDownList = CType(FormView1.FindControl("DropDownList411"), DropDownList)
                    Dim stateList As DropDownList = CType(FormView1.FindControl("DropDownList211"), DropDownList)

                    query = "SELECT * FROM Locality WHERE CityId = " + CityId
                    dt = obj.ExecuteSelectQuery(query)
                    For Each x As DataRow In dt.Rows
                        localityList.Items.Add(New ListItem(x.Item("LocalityName"), x.Item("LocalityId")))
                    Next

                    stateList.SelectedValue = StateId
                    cityList.SelectedValue = CityId
                    localityList.SelectedValue = LocalityId
                End If
            End If
        End If

    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated

        Dim AdID As String = Request.QueryString("ID")
        Dim query As String = "DELETE FROM Ads_Amenities WHERE AdvertisementId = {0}; DELETE FROM Ads_NearbyFacilities WHERE AdvertisementId = {0};"
        obj.ExecuteDeleteQuery(String.Format(query, AdID))
        Dim id As Integer = CInt(AdID)

        AddAmenities(id)
        AddFacilities(id)

        Dim reqHandler As New RequirementHandler
        reqHandler.Send_Notification(id)

        Session("AdvertisementId") = Nothing
        ClientScript.RegisterClientScriptBlock(Me.GetType, "postAdded", "alert('Advertisement updated successfully.'); window.location='PostAdvertisement.aspx?ID=" + AdID + "'", True)
    End Sub

    Protected Sub FormView1_ItemUpdating(sender As Object, e As FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        e.NewValues("Rate") = CInt(e.NewValues("Amount")) / CInt(e.NewValues("Area"))
        e.NewValues("LocalityId") = CType(FormView1.FindControl("DropDownList41"), DropDownList).SelectedValue
    End Sub

    Private Function GetAmenitiesList(ByVal AdID As String) As ArrayList
        Dim arr As New ArrayList
        Dim dt As New DataTable

        dt = obj.ExecuteSelectQuery("SELECT * FROM Ads_Amenities WHERE AdvertisementId = " + AdID)
        For Each x As DataRow In dt.Rows
            arr.Add(x.Item("AmenityId"))
        Next

        Return arr
    End Function

    Private Function GetFacilitiesList(ByVal AdID As String) As ArrayList
        Dim arr As New ArrayList
        Dim dt As New DataTable

        dt = obj.ExecuteSelectQuery("SELECT * FROM Ads_NearbyFacilities WHERE AdvertisementId = " + AdID)
        For Each x As DataRow In dt.Rows
            arr.Add(x.Item("FacilityId"))
        Next

        Return arr
    End Function

    Private Sub AddAmenities(ByVal id As Integer)
        Dim query As String = "INSERT INTO Ads_Amenities (AdvertisementId, AmenityId) VALUES({0},{1})"
        Dim amenities As CheckBoxList = CType(FormView1.FindControl("chkBoxAmenities"), CheckBoxList)

        For Each x As ListItem In amenities.Items
            If x.Selected Then
                obj.ExecuteInsertQuery(String.Format(query, id, x.Value))
            End If
        Next
    End Sub

    Private Sub AddFacilities(ByVal id As Integer)
        Dim query As String = "INSERT INTO Ads_NearbyFacilities (AdvertisementId, FacilityId) VALUES({0},{1})"
        Dim facilities As CheckBoxList = CType(FormView1.FindControl("chkBoxFacilities"), CheckBoxList)

        For Each x As ListItem In facilities.Items
            If x.Selected Then
                obj.ExecuteInsertQuery(String.Format(query, id, x.Value))
            End If
        Next
    End Sub

    Protected Sub EditButton_Click(sender As Object, e As EventArgs)
        Response.Redirect(String.Format("PostAdvertisement.aspx?ID={0}&Action=Edit", Request.QueryString("ID")))
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As EventArgs)
        Response.Redirect(String.Format("PostAdvertisement.aspx?ID={0}", Request.QueryString("ID")))
    End Sub

    'Protected Sub btnUpload_Click(sender As Object, e As EventArgs)
    '    Dim fileName As String
    '    Dim rootPath As String = Server.MapPath("~/Images/")

    '    If fileUploadImage.HasFile Then
    '        fileName = fileUploadImage.FileName
    '        fileUploadImage.SaveAs(rootPath + fileName)
    '        img.ImageUrl = rootPath + fileName
    '    End If
    'End Sub

    'Protected Sub btnProcessData_Click(sender As Object, e As EventArgs)
    '    System.Threading.Thread.Sleep(5000)
    '    lblMessage.Visible = True
    'End Sub
End Class
