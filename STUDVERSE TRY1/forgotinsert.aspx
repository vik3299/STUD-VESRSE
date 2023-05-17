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
    string email1 = Session["uname1"].ToString();
    string pass1 = Session["pswd1"].ToString();
    
    string Query = "  UPDATE student SET password = '"+ pass1 +"'WHERE email='"+email1+"' ";

  

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