
Partial Class User_RequirementMatch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Request.QueryString("ReqID") Is Nothing Then
            Dim query As String = "SELECT a.AdvertisementId, a.Title, a.Description, a.AdType, a.Amount, a.BHK, a.ResidenceTypeId, (SELECT ResTypeName FROM ResidenceType rt WHERE rt.ResTypeId = a.ResidenceTypeId) AS ResidenceType, LocalityId, (SELECT LocalityName FROM Locality l WHERE l.LocalityId = a.LocalityId) AS Locality, a.Area FROM Advertisements a, Requirements r WHERE " _
                            + "a.IsActive = 'True' AND " _
                            + "a.BHK = r.BHK AND " _
                            + "a.Furnished = r.Furnished AND " _
                            + "a.ResidenceTypeId = r.ResidenceTypeId AND " _
                            + "a.Area >= r.MinArea AND " _
                            + "a.Area <= r.MaxArea AND " _
                            + "a.Amount >= r.MinAmount AND " _
                            + "a.Amount <= r.MaxAmount AND " _
                            + "LocalityId IN (SELECT DataId FROM Requirements_Data d WHERE d.RequirementId = {0} AND DataType = 'L') AND " _
                            + "AdvertisementId IN(SELECT AdvertisementId FROM Ads_Amenities WHERE AmenityId IN(SELECT DataId FROM Requirements_Data d WHERE d.RequirementId = {0} AND DataType = 'A')) AND " _
                            + "AdvertisementId IN(SELECT AdvertisementId FROM Ads_NearbyFacilities WHERE FacilityId IN(SELECT DataId FROM Requirements_Data d WHERE d.RequirementId = {0} AND DataType = 'F'))"

            query = String.Format(query, Request.QueryString("ReqID"))

            SqlDataSource1.SelectCommand = query
            SqlDataSource1.Select(DataSourceSelectArguments.Empty)
            SqlDataSource1.DataBind()
            DataList1.DataBind()
        Else
            Response.Write("~/User/Default.aspx")
        End If
        






    End Sub
End Class
