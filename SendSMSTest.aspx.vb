Imports System.Net
Imports System.IO

Partial Class SendSMSTest
    Inherits System.Web.UI.Page

    Dim userName As String = "azzu_ferrari@yahoo.in"
    Dim password As String = "82238223"

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strUrl As String = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user={0}:{1}&senderID=TEST SMS&receipientno={2}&msgtxt={3}&state=4"
        strUrl = String.Format(strUrl, userName, password, txtMobile.Text.Trim, "Sample Message")

        Dim request As WebRequest = HttpWebRequest.Create(strUrl)
        Dim response As HttpWebResponse = DirectCast(request.GetResponse(), HttpWebResponse)
        Dim s As Stream = DirectCast(response.GetResponseStream(), Stream)
        Dim readStream As New StreamReader(s)
        Dim dataString As String = readStream.ReadToEnd()
        response.Close()
        s.Close()
        readStream.Close()
    End Sub
End Class
