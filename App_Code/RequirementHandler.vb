Imports Microsoft.VisualBasic
Imports System.Data

Public Class RequirementHandler

    Public Sub Send_Notification(ByVal advertisementId As Integer)
        Dim obj As New QueryExecution
        Dim dt As New DataTable

        Dim query As String = "SELECT r.UserId, (SELECT ContactNo FROM UserProfile u WHERE u.UserId = r.UserId) AS ContactNo, (SELECT FullName FROM UserProfile u WHERE u.UserId = r.UserId) AS FullName FROM Requirements r, Advertisements a WHERE " _
                           + "r.BHK = a.BHK AND " _
                           + "r.Furnished = a.Furnished AND " _
                           + "r.ResidenceTypeId = a.ResidenceTypeId AND " _
                           + "r.MinArea <= a.Area AND " _
                           + "r.MaxArea >= a.Area AND " _
                           + "r.MinAmount <= a.Amount AND " _
                           + "r.MaxAmount >= a.Amount AND " _
                           + "RequirementId IN (SELECT RequirementId FROM Requirements_Data WHERE DataId = a.LocalityId AND DataType = 'L') AND " _
                           + "RequirementId IN (SELECT RequirementId FROM Requirements_Data WHERE DataId IN (SELECT AmenityId FROM Ads_Amenities aa WHERE aa.AdvertisementId = a.AdvertisementId) AND DataType = 'A') AND " _
                           + "RequirementId IN (SELECT RequirementId FROM Requirements_Data WHERE DataId IN (SELECT FacilityId FROM Ads_NearbyFacilities aa WHERE aa.AdvertisementId = a.AdvertisementId) AND DataType = 'F') AND " _
                           + "a.AdvertisementId = {0}"

        query = String.Format(query, advertisementId)

        Dim emailBody As String = "<html>" _
                                + "<body>" _
                                + "<h2>Dear {0}, </h2>" _
                                + "<p>" _
                                + "An Advertisement has been posted which meets your requirement. Please click on the link below to view the Ad - " _
                                + "</p>" _
                                + "<p>" _
                                + "<a href='{1}'>View Advertisement</a>" _
                                + "</p>" _
                                + "</body>" _
                                + "</html>"

        Dim smsBody As String = "Dear User, An advertisement has been posted which meets your requirement. Kindly check your mail for more details."

        dt = obj.ExecuteSelectQuery(query)



        For Each dr As DataRow In dt.Rows
            Dim contactNo As String = dr.Item("ContactNo")
            Dim email As String = Membership.GetUser(dr.Item("UserId")).Email
            Dim fullName As String = dr.Item("FullName")

            Dim url As String = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/Advertisement.aspx?ID=" & advertisementId

            EmailHandler.Send_Mail(email, String.Format(emailBody, fullName, url))
            SMSHandler.Send_SMS(contactNo, smsBody)
        Next

    End Sub

End Class
