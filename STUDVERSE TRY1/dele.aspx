<%@ Page Language="C#"  %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<%@Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@Import Namespace="System.Security.Cryptography" %>
<%@Import Namespace="System.Text.RegularExpressions" %>
<%@Import Namespace="System.Net.Mail"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <%
string connectionString = "server=127.0.0.1;uid=root;pwd=root;database=studverse";
using (MySqlConnection connection = new MySqlConnection(connectionString))
{
    connection.Open();
    string deleteQuery = "DELETE FROM post WHERE id = @pid";
    using (MySqlCommand command = new MySqlCommand(deleteQuery, connection))
    {
        command.Parameters.AddWithValue("@pid", Request["pid"]);
        int rowsAffected = command.ExecuteNonQuery();
        if (rowsAffected > 0)
        {
            Response.Redirect("create_post.aspx");
        }
        else
        {
            // handle the case when no rows were deleted
        }
    }
}
%>



        </div>
    </form>
</body>
</html>
