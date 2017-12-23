Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class QueryExecution

    Dim connString As String = System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString
    Dim conn As SqlConnection
    Dim comm As SqlCommand
    Dim adp As SqlDataAdapter
    Dim dt As New DataTable

    Public Sub OpenConnection()
        If conn.State <> ConnectionState.Open Then
            conn.Open()
        End If
    End Sub

    Public Sub CloseConnection()
        If conn.State <> ConnectionState.Closed Then
            conn.Close()
        End If
    End Sub

    Public Sub Initialize()
        conn = New SqlConnection(connString)
        comm = New SqlCommand("", conn)
        adp = New SqlDataAdapter(comm)
    End Sub

    Public Sub New()
        Initialize()
    End Sub

    Protected Overrides Sub Finalize()
        MyBase.Finalize()
        CloseConnection()
    End Sub

    Public Sub ExecuteInsertQuery(ByVal query As String)
        comm.CommandText = query
        OpenConnection()
        comm.ExecuteNonQuery()
        CloseConnection()
    End Sub

    Public Sub ExecuteDeleteQuery(ByVal query As String)
        comm.CommandText = query
        OpenConnection()
        comm.ExecuteNonQuery()
        CloseConnection()
    End Sub

    Public Sub ExecuteUpdateQuery(ByVal query As String)
        comm.CommandText = query
        OpenConnection()
        comm.ExecuteNonQuery()
        CloseConnection()
    End Sub

    Public Function ExecuteSelectQuery(ByVal query As String) As DataTable
        comm.CommandText = query
        adp.SelectCommand = comm
        dt.Clear()
        adp.Fill(dt)
        Return dt
    End Function

    Public Sub ExecuteQuery(ByVal comm As SqlCommand)
        comm.Connection = conn
        OpenConnection()
        comm.ExecuteNonQuery()
        CloseConnection()
    End Sub
End Class
