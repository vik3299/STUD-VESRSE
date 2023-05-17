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
string chatName = Request.Form["chat"];
string connString = "Server=localhost;Database=studverse;User=root;Password=root";
string output = "";

using (MySqlConnection conn = new MySqlConnection(connString))
{
    string sql = "SELECT * FROM " + chatName;
    MySqlCommand cmd = new MySqlCommand(sql, conn);

    conn.Open();

    output += "<table>";
    output += "<tr>";
    output += "<th>sender</th>";
    output += "<th id=\"msg\">message</th>";
    output += "</tr>";

    using (MySqlDataReader reader = cmd.ExecuteReader())
    {
        while (reader.Read())
        {
            output += "<tr>";
            output += "<td>" + reader["sender_name"].ToString() + "</td>";
            output += "<td style='color:gray;'>" + reader["content"].ToString() + "</td>";
            output += "</tr>";
        }
    }

    output += "</table>";
}

Response.Write(output);
%>

