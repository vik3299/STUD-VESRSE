<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reginsert.aspx.cs" Inherits="STUDVERSE_TRY1.reginsert" %>


<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>


<%
    MySqlConnection ConnectToDB()
    {
        try
        {
            string ConnectionString = "server=127.0.0.1;uid=root;pwd=root;database=studverse";
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            return connection;

        }
        catch (Exception error)
        {
            return null;
        }
    }
   
%>

<%
     MySqlConnection connection1 = ConnectToDB();
    connection1.Open();
    string fullname = Session["fullname"].ToString();
    string enroll = Session["enroll"].ToString();
    string uname = Session["uname"].ToString();
    string pswd = Session["pswd"].ToString();
    string email = Session["email"].ToString();
    string Query = "insert into student(fullname,username,password,enrollment_no,email)values('" + fullname + "','" + uname + "','" + pswd + "','" + enroll + "','" + email + "')"; 
    
        MySqlCommand comman = new MySqlCommand(Query, connection1);
    comman.ExecuteNonQuery();
    Response.Redirect("login.aspx");
    connection1.Close();
    %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>