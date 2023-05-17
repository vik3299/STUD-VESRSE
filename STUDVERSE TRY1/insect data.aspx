<%@ Page Language="C#" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>
<%
    string message = Request["message"];
    string chatName = Request["chat"];
    string senderName = Request["sender"].ToString();
    string connString = "Server=localhost;Database=studverse;User=root;Password=root";
    int result = 0;

    using (MySqlConnection conn = new MySqlConnection(connString))
    {
        string query = "INSERT INTO "+chatName+" (sender_name, content) VALUES (@senderName, @message)";
        MySqlCommand cmd = new MySqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@senderName", senderName);
        cmd.Parameters.AddWithValue("@message", message);
        conn.Open();
        result = cmd.ExecuteNonQuery();
        
    }
    Response.Write(result);
%>
