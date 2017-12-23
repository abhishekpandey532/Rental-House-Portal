Imports CuteWebUI

Partial Class User_PostImages
    Inherits System.Web.UI.Page

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

    Protected Sub InsertMsg(ByVal msg As String)
        ListBoxEvents.Items.Insert(0, msg)
        ListBoxEvents.SelectedIndex = 0
    End Sub

    Protected Sub ButtonPostBack_Click(ByVal sender As Object, ByVal e As EventArgs)
        InsertMsg("You clicked a PostBack Button.")
    End Sub

    Protected Sub Uploader_FileUploaded(ByVal sender As Object, ByVal args As UploaderEventArgs)
        InsertMsg("File uploaded! " & args.FileName & ", " + args.FileSize.ToString() & " bytes.")
        'Copys the uploaded file to a new location. 
        'args.CopyTo("c:\\temp\\" & args.FileName)
        'You can also open the uploaded file's data stream. 
        'System.IO.Stream data = args.OpenStream(); 

    End Sub

End Class
