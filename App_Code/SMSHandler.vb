Imports Microsoft.VisualBasic
Imports System.Net
Imports System.IO

Public Class SMSHandler

    Shared userName As String = "azzu_ferrari@yahoo.in"
    Shared password As String = "82238223"

    Public Shared Sub Send_SMS(ByVal contactNo As String, ByVal message As String)
        Dim strUrl As String = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user={0}:{1}&senderID=TEST SMS&receipientno={2}&msgtxt={3}&state=4"
        strUrl = String.Format(strUrl, userName, password, contactNo, message)

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
