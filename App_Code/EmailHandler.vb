Imports Microsoft.VisualBasic
Imports System.Net.Mail

Public Class EmailHandler

    Shared username As String = "houserentalsystem@gmail.com"
    Shared password As String = "1House$Rental$System1"

    Public Shared Sub Send_Mail(ByVal receiver As String, ByVal message As String)
        Try
            Dim Mail As New MailMessage
            Mail.Subject = "House Rental System"
            Mail.To.Add(receiver)
            Mail.From = New MailAddress(username)
            Mail.Body = message
            Mail.IsBodyHtml = True

            Dim SMTP As New SmtpClient("smtp.gmail.com")
            SMTP.EnableSsl = True
            SMTP.UseDefaultCredentials = False
            SMTP.Credentials = New System.Net.NetworkCredential(username, password)
            SMTP.Port = 587
            SMTP.Send(Mail)
        Catch ex As Exception

        End Try
    End Sub
End Class
